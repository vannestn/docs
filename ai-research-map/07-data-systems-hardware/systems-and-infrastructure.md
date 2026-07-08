# Systems & Infrastructure

## In brief
- **What it is** — The distributed-training and inference-serving stack that makes frontier
  models trainable at all and affordable to run: the software and networking that splits one
  model across tens of thousands of GPUs, keeps them working together despite constant hardware
  failures, and then serves the finished model to users cheaply. Think of it as the plumbing and
  logistics behind the model — not the model itself, but everything that lets a chip cluster
  behave like one giant computer.
- **Why it's pursued** — Frontier models are too large for any single machine, so training and
  serving them are fundamentally distributed-systems problems. The bottlenecks are rarely raw
  math speed; they are the cost of moving data between chips, the memory needed to hold each
  request's context (the "KV-cache"), and the near-certainty that some GPU fails during a
  months-long run. Solving these decides whether a model is affordable to build and run at all.
- **Potential impact** — Gains here compound directly into cost and capability: lower-precision
  arithmetic (FP4/FP8) and smarter serving cut training and inference bills severalfold, cheaper
  cross-datacenter links loosen the constraint that all compute sit in one building, and better
  fault tolerance turns wasted idle time into usable training. The key limitation is that many
  wins are workload-specific (long-context serving in particular stays memory-bound) and the most
  aggressive techniques are not yet proven at true frontier scale.

## Key directions & work

### Low-precision training
- **FP4 pretraining at scale** — NVIDIA trained a **12B hybrid Mamba-Transformer**
  (Nemotron-Nano-12B-v2-Base architecture) on **10T tokens** in **NVFP4**, the longest
  publicly documented 4-bit run to date. Loss tracks an FP8 baseline within ~1% during the
  stable phase (widening to slightly above 1.5% as the learning rate decays), and downstream
  accuracy matches: **MMLU-Pro 62.58% vs FP8 62.62%**. Coding is the one task that falls
  slightly behind (MBPP+ 55.91 vs 59.11). It is *not* pure FP4 — ~16% of linear layers (first
  two + last eight blocks) stay in BF16/MXFP8, as do attention, embeddings, and norms. Three
  tricks keep it stable: Random Hadamard transforms (d=16) on Wgrad inputs, 2D (16×16) block
  scaling for weights, and stochastic rounding on gradients; ablations show that removing any
  one degrades convergence. NVFP4's speedup comes from the hardware Tensor-Core rate — **2× over
  FP8 on GB200, 3× on GB300** — realized when matrix multiplications (GEMMs) dominate.
  [arXiv:2509.25149](https://arxiv.org/abs/2509.25149).
- **Quartet** shows **native MXFP4 training** (all linear-layer GEMMs in MXFP4, no
  mixed-precision fallback) can be competitive with FP8. It introduces a precision-aware
  scaling law — fitting each method's *parameter efficiency* (forward pass) and *data
  efficiency* (backward pass) — and uses it to argue MXFP4 is "optimal" on the
  accuracy-vs-runtime frontier once efficient kernels compensate. The design pairs a QuEST
  (Hadamard + RMSE-clipped) forward pass with a round-to-nearest (RTN) backward pass. On
  Blackwell RTX 5090, custom CUTLASS kernels (released as QuTLASS) hit ~2× over FP8 / ~4× over
  BF16 on the forward GEMM, netting a **~1.6× end-to-end training speedup over FP8** (~2.9× over
  BF16). On C4-trained Llama models it beats prior 4-bit methods (LUQ, HALO, Jetfire), reaching
  the same loss with ~15% fewer parameters and 5× less data than LUQ-INT4.
  [arXiv:2505.14669](https://arxiv.org/abs/2505.14669).

### Cross-datacenter & decentralized training
- **DiLoCo / Streaming DiLoCo** (DeepMind) — Streaming DiLoCo cuts the bandwidth required
  for distributed training by **two orders of magnitude (~100×)** with no quality loss, via
  three changes: synchronizing parameter *fragments* (3 layers each) on a staggered schedule
  rather than all at once, overlapping communication with compute, and quantizing the outer
  gradients to **4-bit (E3M0)**. On a 1B model overtrained on Dolma it matches Data-Parallel
  while exchanging **400× fewer total bits** and cutting **peak bandwidth ~8×**, validated from
  35M up to 4B parameters. [arXiv:2501.18512](https://arxiv.org/abs/2501.18512).
- **Decoupled DiLoCo** (DeepMind, a later paper) pushes this toward resilient *asynchronous*
  training: it trains a **12B model across 4 US regions** over just 2–5 Gbps of WAN, matches
  Data-Parallel up to 9B (dense and MoE), and — by confining a failure's blast radius to a
  single learner — holds **88% goodput vs 27% for Data-Parallel** in a 1.2M-chip failure
  simulation. [arXiv:2604.21428](https://arxiv.org/abs/2604.21428).
- **Decentralized RL training** — Prime Intellect's INTELLECT-2 (32B) over a permissionless
  swarm; Nous's Psyche network. See [09 · Open-source & decentralized](../09-global-lab-ecosystem/open-source-and-decentralized.md).

### Fault tolerance at 100k-GPU scale
- **Fault-Tolerant HSDP** makes the data-parallel replica the unit of recovery: only the
  replica containing a failed GPU is taken offline and restarted, while the rest keep
  training. Versus fully synchronous training at ~100k GPUs, it cuts the stall per failure
  from ~10 min to ~3 min, **raising effective training time from 44% to 80%** with no
  measurable accuracy hit. [arXiv:2602.00277](https://arxiv.org/abs/2602.00277).
- **NCCLX** (Meta) redesigns collective communication for past-100k-GPU scale and was
  validated on **Llama 4**. Built on a custom host-driven transport (CTran) with zero-copy /
  SM-free transfers and a fault-tolerant AllReduce, it cut steady **training-step latency by up
  to 12%**, sped up **scalable initialization by up to 11× at 96K-GPU scale**, and improved
  Llama 4 Maverick **inference decoding latency by 15–80%** across configs.
  [arXiv:2510.20171](https://arxiv.org/abs/2510.20171).

### Inference serving
- **Disaggregated prefill/decode is the default** — splitting the compute-bound prefill stage
  from the memory-bound decode stage onto separate pools. NVIDIA **Dynamo** (disaggregated
  pools + LLM-aware request routing + NIXL KV-cache transport) reports **up to 30×** more
  requests served on DeepSeek-R1 on GB200 NVL72. [Dynamo](https://developer.nvidia.com/blog/introducing-nvidia-dynamo-a-low-latency-distributed-inference-framework-for-scaling-reasoning-ai-models/).
  **Mooncake** (Moonshot + Tsinghua; **FAST'25 best paper**) is the KVCache-centric serving
  platform behind Kimi: it splits prefill from decode and pools idle CPU/DRAM/SSD into a
  disaggregated KV-cache, scheduled by a cache-aware global "Conductor." Its tricks include
  chunked pipeline parallelism for long-context prefill, layer-wise KV-cache streaming,
  hot-block replication, and prediction-based early rejection under overload. Against a vLLM
  baseline it lifts throughput **20–40% on ArXiv-Summarization / L-Eval** and **up to 525%** on
  simulated long-context data while still meeting latency targets (TTFT/TBT SLOs); on real
  traces it handles **~75% more requests**. [arXiv:2407.00079](https://arxiv.org/abs/2407.00079).
- **EAGLE-3** — lossless speculative decoding (the draft model proposes tokens that the
  target model verifies, so output is identical to standard decoding). It drops EAGLE's
  feature-prediction constraint, predicts tokens directly via a *training-time test*, and
  fuses low/mid/high target-model features. This unlocks a scaling law — acceptance keeps
  rising as the draft model sees more training data — and yields **~3–6.5× speedup** (6.5× on
  HumanEval/Vicuna-13B), ~1.4× over EAGLE-2, plus, unlike most speculative methods at large
  batch, a **38% throughput gain in SGLang at batch 64**.
  [arXiv:2503.01840](https://arxiv.org/abs/2503.01840).

## State of research

**Best-performing now:** FP8 (and increasingly FP4) training, paged/disaggregated KV-cache
serving (vLLM/Dynamo/SGLang/Mooncake), and speculative decoding are mature, deployed, and
winning. DiLoCo-style communication reduction (~100× bandwidth) is proven for cross-DC
training.

**Promising but unproven:** Fully *decentralized*, permissionless training at frontier
scale (still mostly research/small-scale), and FP4 as a universal default — note even the
12B NVFP4 run keeps ~16% of layers and all attention in higher precision, and Quartet's
optimality argument rests on a scaling-law extrapolation, not a frontier-scale run.

**Open problems & weaknesses:** **Long-context serving economics** (the KV-cache memory wall)
is the binding inference constraint — Mooncake's own traces show only ~50% of KV-cache is
reusable in practice (up to ~90% in chat-to-paper workloads). At 100k+ GPU scale, fault
tolerance dominates: failure recovery, not raw FLOPs, sets effective throughput. Decentralized
training still shows a mission-vs-execution gap — flagship runs remain on centralized clusters.
And reasoning models' long outputs stress decode-stage serving in new ways, which is exactly
what disaggregation and speculative decoding target.
