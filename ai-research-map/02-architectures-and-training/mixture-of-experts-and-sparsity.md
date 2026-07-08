# Mixture-of-Experts & Sparsity

## In brief
- **What it is** — A big model split into many specialist sub-networks ("experts"), where a
  lightweight *router* sends each token to just a few of them. So the model can hold enormous
  total knowledge, yet only a small slice fires for any given word — "sparse" meaning most of
  the network sits idle each step. A parallel idea applies the same trick to *attention*: a
  token looks at a chosen subset of earlier tokens instead of all of them.
- **Why it's pursued** — Making a model smarter usually means adding parameters, which normally
  makes it proportionally slower and costlier to run. Sparsity breaks that link: total capacity
  can grow while the compute spent per token stays roughly flat. The same motive drives sparse
  attention, which cuts the cost of long inputs from scaling with the square of the length to
  scaling roughly linearly.
- **Potential impact** — This is now the default recipe at the frontier — Qwen3, Kimi K2, and
  DeepSeek-V3 all use it — letting far larger, cheaper-to-serve models exist. The catch is
  systems complexity: every expert must be kept in memory and routing must stay balanced, so
  gains that look free "on paper" can evaporate if the hardware isn't matched to the design.

## Key directions & work

### Ultra-sparse MoE
- **Qwen3 MoE** — 235B total / 22B active, 128 experts (8 active per token); the flagship
  is **Qwen3-235B-A22B** (94 layers, 64 Q / 4 KV GQA heads, 128K context). Unlike
  Qwen2.5-MoE it **drops shared experts** and adopts a *global-batch load-balancing loss*
  (balancing expert usage across the whole batch rather than each micro-batch; Qiu et al.
  2025) plus fine-grained expert segmentation to encourage specialization. Pre-trained on
  ~36T tokens across 119 languages in three stages (general → reasoning → long-context; RoPE
  base 10k→1M via ABF, then YaRN + Dual Chunk Attention for 4× context at inference). The
  30B-A3B sibling matches Qwen2.5-14B with ~1/5 the active params; the base model hits
  94.39 GSM8K / 71.84 MATH / 87.81 MMLU. [arXiv:2505.09388](https://arxiv.org/abs/2505.09388)
- **Qwen3-Next** — pushes sparsity further: 80B total / 3B active, **10 routed (+1 shared)
  of 512 experts**, plus multi-token prediction and a hybrid Gated-DeltaNet / Gated-Attention
  layout. [Qwen blog](https://qwenlm.github.io/blog/qwen3_next/) (See [post-transformer](post-transformer-architectures.md).)
- **Kimi K2** (Moonshot) — **1.04T total / 32B active**, 384 experts (8 active, **sparsity 48**),
  1 shared expert, 61 layers, MLA attention with 64 heads. Trained on **15.5T tokens with
  the MuonClip optimizer and zero loss spikes**. Its **sparsity scaling law** finds that, at
  fixed active params, raising the total expert count consistently lowers loss — sparsity 48
  cuts FLOPs ~1.69× vs sparsity 8 at equal validation loss. [arXiv:2507.20534](https://arxiv.org/abs/2507.20534)
- **ERNIE 4.5** (Baidu) — *heterogeneous-modality* MoE splitting experts into
  text/vision/shared types with modality-specific routing. [Baidu](https://ernie.baidu.com/blog/posts/ernie4.5/)

### Trainable sparse attention (sparsity in the attention map)
- **Native Sparse Attention (NSA)** — DeepSeek's hardware-aligned, **natively trainable**
  sparse attention (sparse from pretraining, not bolted on afterward). Three parallel branches
  per query — **compressed** coarse-grained blocks, fine-grained **token selection** (top-*n*
  blocks), and a **sliding window** — fused by a learned gate. Co-designed with GQA/MQA
  (shared KV) and a Triton kernel that loads all heads in a group together. On a 27B/3B MoE
  backbone (260B tokens) it **matches or beats Full Attention** (avg 0.456 vs 0.443 over 9
  general benchmarks) and gives **11.6× decode, 9.0× forward, 6.0× backward** speedups at 64k.
  [arXiv:2502.11089](https://arxiv.org/abs/2502.11089)
- **DeepSeek Sparse Attention (DSA)** — the deployed successor in **DeepSeek-V3.2**. A
  **lightning indexer** (small-head, ReLU, FP8) scores preceding tokens, then **top-k=2048**
  token selection feeds core attention, instantiated under **MLA in MQA mode**. Retrofit onto
  V3.1-Terminus via *continued* training (1k-step dense indexer warm-up + 15k-step sparse
  stage), cutting core attention from **O(L²) → O(Lk)** with parity on both short- and
  long-context tasks. [V3.2 arXiv:2512.02556](https://arxiv.org/abs/2512.02556)
- **Multi-Matrix Factorization Attention (MFA)** + Attention-FFN Disaggregation (AFD)
  (StepFun **Step-3**, 321B total / 38B active VLM, 316B LLM, 61 layers) — MFA uses low-rank
  Q/K factorization to shrink both the KV cache *and* attention compute while keeping a high
  attention effective rank (16,384, matching DeepSeek MLA); AFD splits attention and FFN onto
  separate GPU pools so each runs at high MFU (model FLOPs utilization).
  [arXiv:2507.19427](https://arxiv.org/abs/2507.19427)

## State of research

**Best-performing now:** Ultra-sparse MoE with global-batch load balancing is the proven
frontier default — it's how essentially every leading open model scales (Qwen3, Kimi K2,
DeepSeek-V3). Kimi K2's sparsity scaling law gives the cleanest argument yet that *more
total experts at fixed active params is a free lunch* on loss (limited only by infrastructure
complexity). Trainable sparse attention is the most convincing recent win for cheap long
context: NSA validates it at pretraining scale, and DSA (DeepSeek-V3.2) shows it can be
retrofit onto a frontier model via continued training with no measured quality regression.

**Promising but unproven:** Extreme sparsity ratios (10-of-512 in Qwen3-Next, sparsity-48 in
Kimi K2) and modality-specialized experts keep pushing the envelope. Step-3 argues this
envelope is **hardware-bounded**, not free: very sparse MoE (DSv3, Kimi K2, Llama-4) only
pays off on hardware with a matching roofline, and below a hardware-specific "optimal
sparsity" the activated experts can't fill a high-MFU batch — so on-paper sparsity can run
*inefficiently* in practice.

**Open problems & weaknesses:**
- **Routing & load.** Routing instability, expert collapse/under-utilization, and load
  imbalance remain perennial problems; global-batch (vs micro-batch) balancing helps but
  doesn't eliminate them. DeepSeek-V3.2 also reports MoE-specific *RL* instability:
  inconsistent expert routing between the training and inference frameworks destabilizes
  optimization, fixed by **"Keep Routing"** (replaying sampling-time routes during training).
- **Inference & systems.** MoE complicates inference: the full set of experts must be held in
  memory, plus expert-parallel (EP) communication and EP load imbalance at scale. Step-3
  argues **decoding cost tracks neither total nor active params** — attention design dominates
  — and proposes AFD + heterogeneous hardware as the answer; Kimi K2 trains at trillion scale
  only via a tuned EP=16 + pipeline-parallel + activation-offload recipe.
- **Sparse-attention information loss.** Whether top-k token selection ever drops information
  that matters for hard reasoning is still not fully characterized. NSA argues the opposite
  for its setting — post-hoc top-20% attention covers only ~70% of attention mass, so
  *native* training is what lets the model *learn* which tokens to keep. DSA's near-parity
  results are likewise bounded by the long-context evals used, not a guarantee on adversarial
  reasoning.
