# Systems & Infrastructure

The distributed-training and inference-serving stack that makes frontier models trainable
and affordable to run.

## Key directions & work

### Low-precision training
- **FP4 pretraining at scale** — NVIDIA trained 12B on 10T tokens entirely in NVFP4,
  matching FP8 at ~2–3× throughput on Blackwell. [arXiv:2509.25149](https://arxiv.org/abs/2509.25149).
  **Quartet** derives an FP4 scaling law. [arXiv:2505.14669](https://arxiv.org/abs/2505.14669)

### Cross-datacenter & decentralized training
- **DiLoCo / Streaming DiLoCo** (DeepMind) — cuts inter-datacenter bandwidth ~100–400× with
  no quality loss; **Decoupled DiLoCo** trains 12B across 4 US regions ~20× faster than
  synchronous sync at ~88% goodput under failure. [Streaming arXiv:2501.18512](https://arxiv.org/abs/2501.18512)
- **Decentralized RL training** — Prime Intellect's INTELLECT-2 (32B) over a permissionless
  swarm; Nous's Psyche network. See [09 · Open-source & decentralized](../09-global-lab-ecosystem/open-source-and-decentralized.md).

### Fault tolerance at 100k-GPU scale
- **Fault-Tolerant HSDP** raised effective training time 44%→80% at ~100k GPUs; Meta's
  **NCCLX** redesigns collectives past 100k GPUs (validated on Llama 4). [NCCLX arXiv:2510.20171](https://arxiv.org/abs/2510.20171)

### Inference serving
- **Disaggregated prefill/decode is the default.** NVIDIA **Dynamo** reports up to 7×
  throughput via separate pools + KV-cache-aware routing; **Mooncake** (Moonshot+Tsinghua,
  FAST'25 best paper) raises long-context capacity 59–498%. [Mooncake arXiv:2407.00079](https://arxiv.org/abs/2407.00079)
- **EAGLE-3** — ~3–6.5× lossless speculative decoding, now standard in serving stacks. [arXiv:2503.01840](https://arxiv.org/abs/2503.01840)

## State of research

**Best-performing now:** FP8 (and increasingly FP4) training, paged/disaggregated KV-cache
serving (vLLM/Dynamo/SGLang), and speculative decoding are mature, deployed, and winning.
DiLoCo-style communication reduction is proven for cross-DC training.

**Promising but unproven:** Fully *decentralized*, permissionless training at frontier
scale (still mostly research/small-scale), and FP4 as a universal default.

**Open problems & weaknesses:** **Long-context serving economics** (KV-cache memory wall)
is the binding inference constraint. Fault tolerance dominates at 100k+ GPU scale.
Decentralized training has a real mission-vs-execution gap (the "decentralized" labs still
train flagships on centralized clusters). Reasoning models' long outputs stress serving in
new ways.
