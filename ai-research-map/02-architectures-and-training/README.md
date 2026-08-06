# 02 · Architectures & Training

How models are *built* and *trained* — the substrate beneath the capabilities in
[branch 01](../01-foundation-models-and-capabilities/). This is where the transformer
monopoly is slowly eroding and where efficiency pressure drives most innovation.

## Contents

- [**Post-transformer architectures**](post-transformer-architectures.md) — state-space
  models, linear attention, hybrids, test-time-training memory layers.
- [**Diffusion & non-autoregressive LMs**](diffusion-and-non-autoregressive-lms.md) —
  parallel text generation, masked diffusion, block/semi-AR decoding.
- [**Mixture-of-experts & sparsity**](mixture-of-experts-and-sparsity.md) — ultra-sparse
  routing, load balancing, trainable sparse attention.
- [**Efficiency, quantization & inference**](efficiency-quantization-and-inference.md) —
  FP4/FP8, KV-cache optimization, speculative decoding, edge models.
- [**Training methods & RL**](training-methods-and-rl.md) — optimizers (Muon), RL recipes,
  self-improvement, synthetic data.
- [**Scaling laws & theory**](scaling-laws-and-theory.md) — compute-optimal training,
  distillation laws, generalization theory.

## The shape of this area

The frontier still runs on **attention + MoE**, but mid-2026's defining theme is
**escaping quadratic cost**: linear-attention/SSM hybrids, trainable sparse attention,
and ever-lower numerical precision (FP4 pretraining at trillion-token scale). Much of the
most interesting architectural work now comes from **outside** the US frontier labs —
DeepSeek, Moonshot, MiniMax, Qwen, Tencent, TII — covered also in
[09 · Global lab ecosystem](../09-global-lab-ecosystem/).
