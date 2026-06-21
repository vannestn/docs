# How Frontier LLMs Are Built

The end-to-end pipeline that turns raw web text into a frontier model — and the documented
limitation at each stage. Sourced largely from labs that *disclose* their recipes (Llama,
DeepSeek, OLMo, Gemma, DCLM/FineWeb).

## The pipeline, stage by stage (method → limitation)

### 1. Data collection & curation
- **Web sourcing discards ~90% of the crawl** (filtering + dedup). Much of the discarded 90% is
  collateral, not verified junk. (RefinedWeb — [arXiv:2306.01116](https://arxiv.org/abs/2306.01116))
- **Classifier quality-filtering buys MMLU but narrows the corpus** and bakes in a "fingerprint"
  — filtered datasets are distinguishable from each other at ~89% accuracy, i.e. filtering biases
  the domain distribution. (DCLM [arXiv:2406.11794](https://arxiv.org/abs/2406.11794); FineWeb
  [arXiv:2406.17557](https://arxiv.org/abs/2406.17557))
- **More dedup is not monotonically better**; **decontamination is leaky** (paraphrased test data
  evades n-gram detection); **synthetic data collapses** when overused (~30% is a rough ceiling).
  See [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).

### 2. Tokenization
- **BPE tokenizers carry "glitch tokens"** (rare tokens with meaningless embeddings) and
  arbitrary digit-splitting that hurts arithmetic — motivating tokenizer-free models (Byte Latent
  Transformer), not yet standard at frontier scale. ([arXiv:2412.09871](https://arxiv.org/abs/2412.09871))

### 3. Pretraining
- **Scaling laws set the params/tokens split** — but the optimum is a *prediction*, not a guarantee.
- **FP8 pretraining works at frontier scale** (DeepSeek-V3, ~$5.6M) **only with fine-grained
  scaling**; naive FP8 doesn't hold. ([arXiv:2412.19437](https://arxiv.org/abs/2412.19437))
- **MoE load balancing trades quality vs stability**; **AdamW is suboptimal/unstable** at huge
  batch sizes (hence Muon). **Hardware reliability becomes first-order** — Llama 3 405B hit a
  failure roughly every 3 hours across 16K H100s. ([Llama 3 arXiv:2407.21783](https://arxiv.org/abs/2407.21783))

### 4. Mid-training / long-context / annealing
- **Annealing "patches" capabilities** (e.g. math) — but is also *where contamination most easily
  enters* (labs explicitly exclude benchmark sets here). **RoPE-scaling long-context extension
  degrades** on deep-retrieval ("needle") tasks. (OLMo 2 [arXiv:2501.00656](https://arxiv.org/abs/2501.00656))

### 5. Supervised fine-tuning
- **SFT is behavior cloning — and cloning teaches hallucination**: imitating demonstrations of
  facts the model doesn't know teaches confident confabulation rather than calibrated uncertainty.

### 6. Preference tuning (RLHF / RLAIF / RLVR)
- **RLHF works but carries an "alignment tax"** and instability; **reward-model overoptimization
  is a quantified Goodhart law**; **sycophancy is a structural consequence** of preference-based
  RL (humans/RMs prefer convincing-but-wrong answers). **DPO is simpler but more fragile OOD.**
  **RLVR drives huge reasoning gains but only in verifiable domains** (math/code), and deliberately
  avoids neural reward models to dodge reward hacking. ([Overoptimization arXiv:2210.10760](https://arxiv.org/abs/2210.10760);
  [Sycophancy arXiv:2310.13548](https://arxiv.org/abs/2310.13548))

### 7. Distillation
- **Distillation can't generally exceed the teacher's ceiling** — but beats from-scratch RL for
  small models (DeepSeek-R1's own conclusion: surpassing the frontier still needs bigger base
  models + larger-scale RL). ([Gemma 2 arXiv:2408.00118](https://arxiv.org/abs/2408.00118))

### 8. Evaluation & red-teaming
- **Benchmarks are contaminated and saturated**; **LLM-as-judge and leaderboards are gameable**
  ("Leaderboard Illusion"); **red-teaming shows vulnerability but can't prove absence of
  capability** — and safety frameworks themselves concede the science is immature.
  See [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).

## State of research

**What's a solid, repeatable method:** the overall pipeline is well-established and increasingly
documented; FP8 training, classifier curation, rejection-sampling SFT, and RLVR-for-reasoning are
proven recipes that labs reproduce.

**What's fragile in the process:** every proxy-optimization step is Goodhart-prone; small-scale
choices don't transfer cleanly; contamination silently inflates scores; preference tuning induces
sycophancy and an alignment tax.

**Bottom line:** building a frontier LLM is now an *engineering discipline with known failure
modes*, not a mystery — but the failure modes (Goodhart, contamination, the verifiability boundary)
are structural and unsolved, not incidental bugs.
