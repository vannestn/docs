# Training Methods & RL

How models are optimized — optimizers, RL recipes, self-improvement, and the synthetic-
data pipelines that increasingly feed them.

## Key directions & work

### Optimizers

- **Muon** (orthogonalized momentum) — a practical drop-in successor to AdamW at scale.
  Muon treats each matrix weight as the target of *matrix-structured steepest descent under
  a spectral-norm constraint*: it momentum-averages the gradient, then orthogonalizes the
  update via a Newton–Schulz iteration (a cheap approximate SVD that needs no explicit
  decomposition). Two independent 2025 papers established its scalability:
  - **Moonshot's "Muon is Scalable"** ([arXiv:2502.16982](https://arxiv.org/abs/2502.16982))
    identified the two changes needed to scale Muon out-of-the-box: (1) add decoupled
    **weight decay** (vanilla Muon converges faster early, but some weights' RMS then grows
    into the bf16-unsafe range and hurts late training), and (2) **per-parameter update-RMS
    scaling** by `0.2·√max(A,B)`, so the update RMS matches AdamW's typical 0.2–0.4 range
    and Muon can directly reuse AdamW-tuned learning rate and weight decay. Scaling-law
    experiments put Muon at **~2× compute efficiency** vs AdamW — it matches AdamW's
    compute-optimal loss using **~52% of the training FLOPs**. They trained **Moonlight**, a
    **3B-activated / 16B-total-parameter MoE** (2.24B activated, 15.29B total excluding
    embeddings), on **5.7T tokens**, advancing the Pareto frontier of MMLU/GSM8K vs training
    FLOPs. A spectral analysis shows Muon yields **higher SVD entropy** than AdamW — flatter
    singular-value spectra, meaning more diverse update directions — most pronounced on MoE
    router weights. They also release a ZeRO-1-style **distributed Muon** (one momentum
    buffer, halving AdamW's optimizer memory; communication ≈1–1.25× AdamW).
  - **Essential AI's "Practical Efficiency of Muon"**
    ([arXiv:2505.02222](https://arxiv.org/abs/2505.02222)) makes the stronger claim that
    Muon **expands the compute–time Pareto frontier** over AdamW, not just FLOP efficiency:
    it stays data-efficient at large batch sizes *beyond* the critical batch size, so AdamW
    needs **~10–15% more tokens** to reach the same loss — a gap that holds constant or
    grows as batch size increases. Validated up to **4B params** and **16M-token batches**.
  - At production scale, Muon is the primary optimizer for Moonshot's **Kimi K2** (1T-total
    / 32B-activated MoE) via **MuonClip** — Muon plus **QK-clip**, which rescales the query/
    key projection weights after each step to cap exploding attention logits. Kimi K2
    pre-trained on **15.5T tokens with no loss spike**.
    [Kimi K2 arXiv:2507.20534](https://arxiv.org/abs/2507.20534)

- **muP + Muon hyperparameter transfer.** The Essential AI paper gives the first
  demonstration that the **maximal update parameterization (muP)** — which lets
  hyperparameters tuned on a small model transfer to a large one — works cleanly *with*
  Muon: learning rate and coupled weight decay transfer up to **3.7B-param** models at
  sequence length 8192. It adds a **"telescoping" sweep** that contracts the hyperparameter
  grid at each width doubling, bounding tuning overhead to `O(C·log N)` while leaving >20%
  of the total compute budget for the final full-scale run. The final 3.7B model reaches
  **1.61 nats** training loss. [arXiv:2505.02222](https://arxiv.org/abs/2505.02222)

### RL for LLMs

- **GRPO** (group-relative advantages, no value critic) is the dominant RL-for-reasoning
  recipe; **GSPO** (sequence-level IS/KL) and **CISPO** refine it. The deeper science —
  entropy collapse, the "does RL expand reasoning?" dispute, credit assignment — lives in
  [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md).

### Self-improvement & synthetic data

- A 2026 ICML paper (Liu, Qi, Du, He — KCL / Alan Turing Institute) argues **self-play only
  keeps improving** when the self-generated data pipeline guarantees a **monotonic increase
  in *learnable information*** across iterations; otherwise the loop plateaus or collapses
  toward trivial, degenerate data. The key diagnostic: in continued self-play, the **reward
  signal rises monotonically while learnable information fluctuates wildly** (measured via
  *epiplexity*, a proxy based on minimum description length under a computationally bounded
  observer). A steadily improving reward can therefore coexist with a collapsing generative
  process — which is why reward shaping alone is insufficient. They prescribe three
  system-level mechanisms: **(1) asymmetric co-evolution** (exploit the propose/verify-vs-
  solve compute gap, with strong-to-weak sync so the proposer/verifier track the solver
  frontier), **(2) capacity growth** (expand parameter and inference-time budgets to keep
  pace with rising information), and **(3) proactive information seeking** (inject external
  context to avoid the finite-information ceiling of closed zero-data loops). Diagnostic
  small-scale experiments only (LoRA fine-tuning on the Absolute Zero setup); the authors
  frame the work as a position/framework, not a trained system.
  [arXiv:2603.02218](https://arxiv.org/abs/2603.02218)
- Synthetic & recycled data (e.g., Meta's REWIRE) is now a core data-wall mitigation —
  see [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).

## State of research

**Best-performing now:** AdamW remains the safe default, but **Muon** has the strongest
evidence yet of a real successor — two converging 2025 studies (FLOP efficiency *and* a
wider compute–time Pareto frontier) plus trillion-token production use in Kimi K2 via
MuonClip. GRPO-lineage RLVR is the proven reasoning-training recipe.

**Promising but unproven:** Second-order/orthogonalization optimizers beyond Muon;
self-rewarding and self-adapting training (SEAL, Absolute Zero); large-scale synthetic
data as a primary source rather than a supplement. Notably, the Moonshot paper finds Muon's
SFT advantage does **not** transfer when the SFT optimizer differs from the pretraining
optimizer (and SFT-only Muon barely matches AdamW) — a pretraining→finetuning **optimizer
mismatch** that is still un-explained.

**Open problems & weaknesses:** **Model collapse** and reward hacking bound how far self-
generated data can go; the 2026 self-play work reframes this precisely as a *failure to
sustain learnable-information growth under bounded observers*, though epiplexity is not yet
a widely validated metric. Optimizer choices interact subtly with scale and precision and
remain under-theorized (Muon's update-RMS depends on matrix shape, exceeding the bf16-safe
range without correction). RL training stays sample-inefficient and unstable (entropy
collapse), and much of the best optimizer work is still empirical recipe-tuning rather than
principled theory.
