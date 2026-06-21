# Efficiency, Quantization & Inference

Doing more with less — lower numerical precision, smaller KV-caches, faster decoding, and
edge-deployable models. One of the most *mature and fast-moving* areas.

## Key directions & work

### Low-precision training & inference
- **FP4 pretraining at scale** — NVIDIA trained a 12B model on 10T tokens entirely in
  NVFP4, matching the FP8 baseline (62.58 vs 62.62 MMLU-pro) at ~2–3× arithmetic
  throughput on Blackwell. The single biggest systems shift of the year. [arXiv:2509.25149](https://arxiv.org/abs/2509.25149)
- **Quartet** (IST Austria) — derives an FP4 *scaling law* (native FP4 training can be
  optimal). [arXiv:2505.14669](https://arxiv.org/abs/2505.14669). OpenAI's gpt-oss ships
  ~90% of weights in MXFP4.

### KV-cache optimization
- **XQuant** — rematerializes the KV cache from quantized layer-input activations instead
  of storing K/V, trading recompute for memory ("breaking the memory wall"). [arXiv:2508.10395](https://arxiv.org/abs/2508.10395)
- **KVTuner** — sensitivity-aware, layer-wise mixed-precision KV-cache quantization for
  near-lossless inference. [arXiv:2502.04420](https://arxiv.org/abs/2502.04420)
- **QuantSpec** — self-speculative decoding with a hierarchical 4-bit KV cache; >90%
  acceptance, up to ~2.5× speedup. [OpenReview](https://openreview.net/forum?id=7SHbJENgHX)

### Speculative decoding
- **EAGLE-3** — ~3–6.5× lossless speculative-decoding speedups, now standard in
  vLLM/SGLang/TensorRT-LLM. [arXiv:2503.01840](https://arxiv.org/abs/2503.01840)

### Distillation & small/edge models
- **Distillation Scaling Laws** (Apple) — closed-form prediction of student performance
  from teacher/student compute split; distillation can't beat supervised learning given
  enough compute, but wins when a teacher exists or many students are distilled. [arXiv:2502.08606](https://arxiv.org/abs/2502.08606)
- **Liquid AI LFM2 / LFM2.5** — hybrid (~20% attention) models for *on-device* agents,
  ~2× faster CPU decode than Qwen3. [arXiv:2511.23404](https://arxiv.org/abs/2511.23404)

## State of research

**Best-performing now:** FP8 training is standard; FP4 is the proven new frontier.
Paged/quantized KV-cache + speculative decoding (EAGLE-3) are deployed everywhere.
Mixed-precision, sensitivity-aware quantization is the default for lossless compression.

**Promising but unproven:** Fully lossless FP4 *inference* at long context, KV-cache
rematerialization (XQuant) as a default, and on-device frontier-class agents are advancing
fast but not yet settled.

**Open problems & weaknesses:** The *memory wall* (KV-cache growth with context) is the
binding constraint for long-context serving. Low-bit quantization can degrade reasoning/
long-tail behavior in ways aggregate benchmarks miss. Hardware/precision co-design ties
this area tightly to [07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md).
