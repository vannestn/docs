# Efficiency, Quantization & Inference

Doing more with less — lower numerical precision, smaller KV-caches, faster decoding, and
edge-deployable models. One of the most *mature and fast-moving* areas.

## Key directions & work

### Low-precision training & inference
- **FP4 pretraining at scale (NVFP4)** — NVIDIA pretrained a **12B hybrid Mamba-Transformer**
  (Nemotron-Nano-12B-v2-Base architecture) on **10T tokens** in NVFP4, the longest documented
  4-bit run to date. Validation-loss relative error stays <1% through the stable phase
  (widening to ~1.5% during LR decay); downstream accuracy matches the FP8 baseline —
  e.g. **MMLU-Pro 5-shot 62.58 vs 62.62**, MMLU 76.57 vs 77.36, GSM8K-CoT 92.27 vs 89.08.
  NVFP4 uses **16-element blocks** (vs 32 for MXFP4) with **E4M3** FP8 block scales plus a
  per-tensor FP32 scale; Blackwell Tensor Cores give **2× (GB200) / 3× (GB300)** math
  throughput over FP8. The recipe needs four ingredients — keep ~15% of (final) linear
  layers in higher precision, Random Hadamard transforms (d=16) on Wgrad inputs, 2D 16×16
  weight scaling, and stochastic rounding on gradients; ablations show each is required for
  convergence. The single biggest systems shift of the year. [arXiv:2509.25149](https://arxiv.org/abs/2509.25149)
- **Quartet** (ISTA / Red Hat AI + ETH Zürich) — a **native MXFP4 training** method (all
  linear-layer GEMMs in MXFP4) plus an FP4 *scaling law* that splits each method into a
  *parameter efficiency* (forward, tied to forward MSE) and *data efficiency* (backward, tied
  to gradient bias). Best accuracy-vs-compute trade-off among 4-bit methods: vs the strongest
  prior FP4 work (LUQ-INT4) it reaches the same C4 loss with **~15% fewer parameters and 5×
  less data**, and runs **~2× faster than FP8** per linear layer on an RTX 5090 (Blackwell).
  Recipe: block-wise **QuEST** on the forward, **RTN** on the backward (RTN balances quadratic
  error and magnitude alignment; an earlier-draft bug had wrongly favored stochastic rounding).
  Limitation: tied to one specific datatype/architecture (MXFP4 on Blackwell).
  [arXiv:2505.14669](https://arxiv.org/abs/2505.14669). OpenAI's gpt-oss ships its MoE weights
  (~90% of total parameters) in MXFP4 at ~4.25 bits/param. [Model card](https://arxiv.org/abs/2508.10925)

### KV-cache optimization
- **XQuant** — quantizes and caches the **per-layer input activation X**, then *rematerializes*
  K/V on-the-fly during decode (one tensor per layer instead of two → immediate **2×** memory
  saving vs KV caching), trading recompute for memory ("breaking the memory wall"). On
  Llama-2-7B/WikiText-2, **~7.7× memory savings at <0.1 perplexity degradation**. **XQuant-CL**
  exploits cross-layer similarity of X (it tracks the residual stream) to cache only inter-layer
  *deltas*, reaching **up to 10× memory savings at 0.01 perplexity degradation** (12.5× at 0.1)
  — surpassing outlier-aware non-uniform KV-quant baselines (KIVI, KVQuant) using *plain uniform*
  quantization. Extended to GQA via offline SVD of W_k/W_v. Premise: inference is increasingly
  memory-bandwidth-bound, so spending compute to save memory wins on current/future hardware.
  [arXiv:2508.10395](https://arxiv.org/abs/2508.10395)
- **KVTuner** (Huawei) — offline, sensitivity-aware **layer-wise mixed-precision** KV-cache
  quantization (multi-objective search over per-layer K/V precision pairs, applied at inference
  with no online overhead). Key empirical finding: the **key cache matters more than the value
  cache** (low-bit key quant drives attention-distribution shift and error accumulation), so it
  spends precision on keys. Achieves **near-lossless ~3.25-bit** KV cache for Llama-3.1-8B and
  **4.0-bit** for the more sensitive Qwen2.5-7B on math reasoning, with **16.79–21.25%** higher
  inference throughput vs KIVI-KV8. [arXiv:2502.04420](https://arxiv.org/abs/2502.04420)
- **DeepSeek-V4** (preview) — a long-context efficiency play built on co-designed architecture, not
  just quantization. Two MoE models (**V4-Pro** 1.6T total / 49B active; **V4-Flash** 284B / 13B), both
  **1M-token** context, pretrained on **>32T tokens**. Three levers: (1) a **hybrid attention** stack
  — **Compressed Sparse Attention (CSA)** + **Heavily Compressed Attention (HCA)** — for long-context
  efficiency; (2) **Manifold-Constrained Hyper-Connections (mHC)** enhancing the residual stream; and
  (3) the **Muon** optimizer for faster, more stable convergence. Payoff at **1M-token** context vs
  DeepSeek-V3.2: **V4-Pro = 27% of single-token inference FLOPs and 10% of KV cache**; **V4-Flash ~10%
  FLOPs / ~7% KV cache** ([Source: HF blog](https://github.com/huggingface/blog/blob/main/deepseekv4.md)).
  Evidence that attention/connection-level redesign, not numerics alone, is the lever for million-token
  serving. [arXiv:2606.19348](https://arxiv.org/abs/2606.19348)
- **QuantSpec** (Apple) — self-speculative decoding where the draft shares the target's weights
  but uses a hierarchical **4-bit KV cache + 4-bit weights**; **>90% acceptance**, up to **~2.5×**
  end-to-end speedup, ~1.3× less memory.
  [arXiv:2502.10424](https://arxiv.org/abs/2502.10424) · [OpenReview](https://openreview.net/forum?id=7SHbJENgHX)

### Speculative decoding
- **EAGLE-3** (PKU / Microsoft) — drops EAGLE's feature-prediction constraint (predicts tokens
  directly) and fuses **low/mid/high-level** target features via a "training-time test" recipe,
  which unlocks a *scaling law* for the draft model (more draft training data → higher speedup,
  not seen in prior EAGLE). **Lossless** (strict speculative acceptance). Up to **~6.5×** speedup
  (HumanEval, Vicuna-13B), ~3.0–5.5× across chat/reasoning models, **~1.4×** over EAGLE-2 at
  batch=1. Holds up at scale: **+38% throughput at batch=64** in SGLang where speculation usually
  fades. Now standard in **vLLM and SGLang**. [arXiv:2503.01840](https://arxiv.org/abs/2503.01840)

### Distillation & small/edge models
- **Distillation Scaling Laws** (Apple) — fits a closed-form law for student cross-entropy from
  teacher/student size and token budgets (students 143M–12.6B, up to 512B distillation tokens).
  Core results: **distillation cannot beat supervised learning given enough student compute/tokens**,
  but *is* more efficient when (i) the student budget is below a size-dependent threshold **and**
  (ii) a teacher already exists or is reused across many students. It also resolves the **capacity
  gap** — a *stronger* teacher can yield a *worse* student — as a gap in relative learning capacity,
  not just size; student cross-entropy depends on teacher *cross-entropy* L_T, not teacher size N_T.
  [arXiv:2502.08606](https://arxiv.org/abs/2502.08606)
- **Liquid AI LFM2** — a family of **edge-first** models (350M/700M/1.2B/2.6B dense + an 8.3B-total/
  **1.5B-active MoE**, all 32K context) found by **hardware-in-the-loop architecture search** under
  on-device latency/memory budgets. The backbone is a **minimal hybrid**: mostly *gated short
  convolutions* with a small minority of **GQA** blocks (e.g. 6 of 16 layers in the 350M–1.2B
  models; 8 of 30 in the 2.6B) — no SSM/linear-attention needed. Training: 10–12T-token pretrain
  + 1T long-context mid-train, a tempered decoupled Top-K distillation objective (LFM1-7B teacher),
  and a 3-stage post-train (SFT → length-normalized preference alignment → model merging).
  On CPUs (Snapdragon 8 Elite, Ryzen AI HX 370, llama.cpp Q4_0) LFM2 dense models hit roughly
  **1.4–2× faster prefill/decode** than similarly sized baselines (Qwen3, Llama-3.2, Gemma-3,
  Granite-4.0). [arXiv:2511.23404](https://arxiv.org/abs/2511.23404)

## State of research

**Best-performing now:** FP8 training is standard; FP4 is the proven new frontier (NVFP4 matches
FP8 at 12B/10T; Quartet shows native MXFP4 can be compute-optimal). Lossless speculative decoding
(EAGLE-3) and mixed-precision, sensitivity-aware KV-cache quantization (KVTuner) are deployed and
near-lossless. Key insight across KV work: the **key cache is more quantization-sensitive than the
value cache**.

**Promising but unproven:** Fully lossless FP4 *inference* at long context; KV-cache
rematerialization (XQuant) as a default; on-device frontier-class agents. All advancing fast but
not yet settled. NVFP4 itself is shown only at 12B/10T — scaling laws across sizes and FP4 for
attention/MoE/post-training remain open (authors' stated future work).

**Open problems & weaknesses:** The *memory wall* (KV-cache growth with context, and compute
outpacing memory bandwidth) is the binding constraint for long-context serving — XQuant explicitly
bets on this trend. Low-bit quantization can degrade reasoning/long-tail behavior in ways aggregate
benchmarks miss (KVTuner: low-bit key quant causes token flipping in chain-of-thought; NVFP4 lags
slightly on coding). Distillation has hard ceilings (no free lunch vs supervised; the capacity gap).
Hardware/precision co-design ties this area tightly to
[07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md).
