# Continual Learning & Self-Improvement

Learning new things over time without forgetting old ones — and the "era of experience"
framing where agents learn primarily from their own interaction rather than static data.

## Key directions & work

- **Experience replay + Transformers makes plasticity loss vanish** — but the
  in-context-learning explanation is a *conjecture*, not a proof.
  [arXiv:2503.20018](https://arxiv.org/abs/2503.20018)
- **Test-time training as continual learning** — *"End-to-End Test-Time Training for Long
  Context"* shows TTT-E2E scaling with context length like full attention (but losing badly
  on retrieval). [arXiv:2512.23675](https://arxiv.org/abs/2512.23675)
- **Nested Learning / "Hope"** — recasts architecture + optimizer + pre-training as one
  nested system of associative memories; "Hope" = self-modifying Titans + a Continuum
  Memory System. [arXiv:2512.24695](https://arxiv.org/abs/2512.24695) (see also
  [02 · Post-transformer](../02-architectures-and-training/post-transformer-architectures.md))
- **"Welcome to the Era of Experience"** (Silver & Sutton, 2025) — manifesto for agents
  learning from streams of experience, grounded actions, and *environment-sourced* rewards
  rather than human data. [paper](https://storage.googleapis.com/deepmind-media/Era-of-Experience%20/The%20Era%20of%20Experience%20Paper.pdf).
  Anchored by **DreamerV3** ([Nature 2025](https://www.nature.com/articles/s41586-025-08744-2)):
  one fixed hyperparameter set across 150+ tasks, first to collect Minecraft diamonds from
  scratch with no human data or curricula.

## Experience replay vs. plasticity loss ([arXiv:2503.20018](https://arxiv.org/abs/2503.20018))

Wang, Chandra & Zhang (UVA) test one hypothesis: that *experience replay is a form of
memory* that can address **loss of plasticity** (the phenomenon where backprop-trained nets
gradually lose the ability to fit new tasks). The surprising empirical result: simply add a
small replay buffer (size 100, FILO) and feed it to a **Transformer**, and plasticity loss
*disappears* across three continual settings — Slowly-Changing Regression, permuted MNIST,
and Boyan's-chain policy evaluation. No changes to backprop, activations, or
regularization.

**The architecture is load-bearing, not the replay.** Replay alone does *not* fix it: an
MLP with replay (ERMLP) and an RNN with replay show "no clear signs of learning" and keep
losing plasticity. Only the attention-based model is immune. The Transformer is a stripped
self-attention stack — no feed-forward layers, no positional encoding, no layernorm, just an
output layer. On permuted MNIST its ~70k parameters *beat* an 8M-parameter MLP in the long
run (Transformer test accuracy *rises* with more tasks; the MLP's *falls*).

**Mechanism is conjectured, not shown.** The authors speculate the Transformer stays plastic
because it learns *in-context* — implementing some algorithm in its forward pass so it
doesn't need parameter updates for each new task, citing parallel work that an RNN likely
*cannot* implement TD in its forward pass. They are explicit that this is unproven: "we do
not draw a decisive conclusion that it is what is happening." They also do **not** claim
replay+Transformer beats prior plasticity methods (continual backprop, ReDo, UPGD, etc.) —
only that it is the *least intrusive* to standard deep-learning practice.

**Author-stated limitations:** problems are small-scale (scalability untested); attention is
O(n²) and runs much slower than the MLP baseline; and there is no theory for *why* it works.
They flag state-space models (Mamba) as a way to cut the cost.

## Test-time training as continual learning ([arXiv:2512.23675](https://arxiv.org/abs/2512.23675))

Tandon, Dalal, Li et al. (Astera / NVIDIA / Stanford / Berkeley / UCSD) reframe
*long-context language modeling as continual learning rather than architecture design*. The
model is a standard Transformer with **sliding-window attention** that keeps learning at test
time via next-token prediction on the given context — compressing context into its weights
instead of caching every token. Their method, **TTT-E2E**, is end-to-end in two ways: the
inner loop directly optimizes next-token loss (vs. prior layer-wise reconstruction losses in
TTT-KVB / Titans), and a meta-learning outer loop optimizes the *initialization* for TTT
("gradients of gradients").

**Headline result:** for 3B models trained on 164B tokens, TTT-E2E **scales with context
length the same way as full attention** (flat loss-Δ out to 128K), while SWA, Mamba 2, Gated
DeltaNet, and TTT-KVB all degrade. With constant per-token cost, it is **2.7× faster than
full attention for 128K-context prefill** on an H100.

**How it's built (implementation details that matter):** TTT only the **MLP** layers (not
attention/embeddings/norms — updating those destabilizes the outer loop); TTT only the last
**1/4 of blocks** (an ablation shows updating 1 or 3 of 24 layers fails to scale, but 6
matches 12 — so update 1/4 regardless of model size); and a **second static MLP** per block
as "safe" storage for pre-trained knowledge against forgetting. Mini-batch TTT with batch
size *b* = 1K and window *k* = 8K resolves the instability of online (b=1) updates.

**Where it loses — recall.** On Needle-in-a-Haystack (RULER), full attention "dramatically
outperforms" TTT-E2E, especially in long context (e.g. S-NIAH-1 at 128K: full attention
0.99 vs. TTT-E2E 0.06). The authors attribute full attention's strength to *near-lossless
recall*; their method's compression deliberately drops "seemingly irrelevant details" like
the target string. On general loss, TTT-E2E is the *only* method that always beats full
attention across context length, with the advantage coming mostly from earlier tokens.

**Author-stated limitations:** training latency is the big one — taking gradients of
gradients, TTT-E2E is **3.4× slower than full attention at 8K** (though 1.2× faster at
128K); current code can't use cuDNN FlashAttention. They propose a custom kernel and
initializing TTT-E2E from a pre-trained non-TTT Transformer as fixes. The decode-long-
sequences and RL settings are only evaluated indirectly (via Qwen-8B as judge).

## Nested Learning & "Hope" ([arXiv:2512.24695](https://arxiv.org/abs/2512.24695))

Behrouz, Razaviyayn, Zhong & Mirrokni (Google Research) propose **Nested Learning (NL)**: a
model — architecture *and* its optimizer *and* pre-training — is one *nested system of
associative memories*, each level compressing its own "context flow" (tokens, gradients, or
higher-level signals) at its own update *frequency*. From this lens, momentum/Adam are
associative memories over gradients; pre-training is in-context learning with an ultra-large
context; and **catastrophic forgetting is a natural consequence of compression** under
limited capacity, not a bug to be patched.

**Continuum Memory System (CMS):** generalizes "short-term / long-term memory" into a chain
of MLP blocks updated at *different* frequencies (high-frequency = fast/transient,
low-frequency = persistent). Because knowledge forgotten from a fast block can be recovered
from a slower one via the meta-learned initialization, updates "loop through the time
dimension," reducing (not eliminating) forgetting.

**"Hope"** is the proposed architecture: **self-modifying Titans** (a sequence model that
learns its own update rule and generates its own keys/values via Delta Gradient Descent)
**followed by a CMS**. A variant, **Hope-Attention**, swaps the self-modifying memory for
softmax attention.

**Results (what the paper actually shows):**
- *Language modeling / reasoning:* at 760M/30B-tokens and 1.3B/100B-tokens, Hope leads the
  average over Transformer++, Samba, RetNet, DeltaNet, RWKV-7, Titans, DLA, etc. (e.g. 1.3B
  avg 58.04 vs. Titans 56.82, Transformer++ 53.38). Closes the gap to Transformers on
  in-context recall (SWDE/NQ/DROP/SQUAD) but does **not** beat them there.
- *Continual / class-incremental learning* (CLINC, Banking, DBpedia, Llama3-3B/8B backbones
  via pre-trained CMS init): Hope beats ICL, EWC, and an external-learner baseline (InCA).
- *Long context:* on RULER NIAH and BABILong, Hope holds up to ~10M-token context where
  Titans/ARMT drop after 256K-1M; more memory *levels* and a *lower* lowest-frequency both
  help in-context learning, per Figure 7.
- *Ablations (Table 6):* removing DGD, momentum, weight decay, CMS, or any inner projection
  (k/v/q) all hurt — every component contributes.

**Author-stated limitation:** they are explicit that **catastrophic forgetting is NOT
"solved"** — "From nested learning viewpoint ... catastrophic forgetting is a natural
consequence of compression." The M3 optimizer is a proof-of-concept that may not scale
(training-time overhead, Figure 12). NL is offered as a *roadmap*, not a finished method.

## State of research

**Best-performing now:** For practical "memory," retrieval + agent-memory systems and
test-time-training layers (Titans / TTT-E2E-style) are the working approaches; full
attention remains the gold standard for *recall*-heavy tasks ([arXiv:2512.23675](https://arxiv.org/abs/2512.23675)
shows compression-based methods lose badly on needle-in-a-haystack). Replay remains the most
reliable anti-forgetting tool, though [arXiv:2503.20018](https://arxiv.org/abs/2503.20018)
shows it only works when paired with the right architecture.

**Promising but unproven:** Architectural continual learning (nested-learning continuum
memory), the "era of experience" RL framing, and in-context-learning-as-plasticity. All
three source papers above flag their core mechanisms as conjectured or early — ICL-as-
plasticity is explicitly "not a decisive conclusion," and Hope's authors call NL a roadmap.

**Open problems & weaknesses:** **Catastrophic forgetting and plasticity loss are not
solved** — they're mitigated, and at least one of these papers argues forgetting is an
*intrinsic* consequence of compression rather than something a better method will remove.
There's no widely-adopted method for a deployed model to durably learn from its own
experience without retraining or risking collapse. The compression/recall trade-off is now
sharp: methods that scale cheaply with context (TTT-E2E, RNNs, CMS) sacrifice lossless
retrieval. Benchmarks for *lifelong* learning (and for when memories should be *forgotten*)
are immature. This is the bottleneck under "self-improving" claims in
[open-endedness](open-endedness-and-self-improvement.md).
