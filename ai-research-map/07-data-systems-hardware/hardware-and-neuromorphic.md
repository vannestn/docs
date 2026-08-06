# Hardware & Neuromorphic

## In brief
- **What it is** — The physical silicon that AI runs on: the mainstream accelerators (NVIDIA
  GPUs, Google TPUs, Amazon Trainium) that train and serve today's models, the specialized
  memory chips (HBM) that feed them data fast enough, and a set of experimental "alternative"
  designs — neuromorphic chips that mimic how neurons fire, photonic chips that compute with
  light, and in-memory chips that do math where the data already sits — that trade generality
  for radically lower energy use.
- **Why it's pursued** — Every capability gain rides on cheaper, faster, more energy-efficient
  compute. Two things now gate progress: HBM memory (the fast memory beside the processor is
  sold out) and, above all, electricity — a frontier data center's power draw, not its chip
  budget, is increasingly what limits how big AI can get. The exotic architectures exist to
  break that energy ceiling.
- **Potential impact** — If mainstream accelerators keep scaling, AI stays on its current
  trajectory but consumes a fast-growing share of the world's power (the IEA projects
  data-center demand roughly doubling by 2030). If an alternative paradigm delivers its
  promised order-of-magnitude efficiency gains at production scale, it could reshape both the
  cost of AI and its energy footprint — but so far these designs win on efficiency demos while
  lacking the software maturity and general-purpose flexibility to displace GPUs.

## Key directions & work

### Mainstream accelerators
- **NVIDIA Vera Rubin (VR200)** — 288 GB HBM4 at ~22 TB/s, ~50 PFLOPS FP4, shipping H2 2026;
  first in-house "Vera" CPU. [coverage](https://www.servethehome.com/nvidia-launches-next-generation-rubin-ai-compute-platform-at-ces-2026/) *[vendor figures]*
- **Google Ironwood (TPU v7)** — first TPU architected for *inference* (~4.6 PFLOPS/chip,
  192 GB HBM, 9,216-chip pods); underpins Anthropic's commitment to up to **1M TPU chips**.
  [Google](https://blog.google/innovation-and-ai/infrastructure-and-cloud/google-cloud/ironwood-tpu-age-of-inference/)
- **AWS Trainium** — Project Rainier (~500k Trainium2 for Anthropic); Trainium3 at re:Invent
  2025. [DCD](https://www.datacenterdynamics.com/en/news/aws-activates-project-rainier-cluster-of-nearly-500000-trainium2-chips/)
- **Inference ASICs** — Groq, Cerebras, SambaNova, Etched (transformer ASIC) compete on
  tokens/sec and $/token.

### The HBM chokepoint
- **HBM4 is the gating component and is sold out.** Samsung shipped first commercial HBM4
  (Feb 2026); SK Hynix's 2026 HBM supply fully sold out; AMD MI400 claims 432 GB HBM4. [Samsung](https://news.samsung.com/global/samsung-ships-industry-first-commercial-hbm4-with-ultimate-performance-for-ai-computing)

### Neuro-inspired & alternative computing
- **IBM NorthPole** — ran a 3B LLM at 28,356 tok/s, reporting **72.7× better energy
  efficiency** than an H100 at matched latency. [HPEC paper](https://modha.org/wp-content/uploads/2024/09/NorthPole_HPEC_LLM_2024.pdf)
- **Lightmatter** (photonic) — ran ResNet/BERT/RL at near-digital accuracy; *Nature* 2025.
  [Nature](https://www.nature.com/articles/s41586-025-08854-x)
- **SpikingBrain** (Inst. of Automation, CAS) — two *spiking* LLMs, **SpikingBrain-7B**
  (pure linear) and **SpikingBrain-76B-A12B** (hybrid-linear MoE, ~12B active), converted
  from a Qwen2.5-7B-base checkpoint via continual pre-training on **~150B tokens (<2% of the
  ~10T that a from-scratch run would need)**. Trained on hundreds of **non-NVIDIA MetaX C550 GPUs**
  (23.4% MFU vs 25.8% on an NVIDIA A800 cluster), stable for >2 weeks. Adaptive-threshold
  spiking yields **69.15% sparsity**; on long context the 7B hits **26.5× faster TTFT at 1M
  tokens** and an *extrapolated* **>100× (≈104×) at 4M** vs Qwen2.5-7B (Qwen baseline beyond
  2M is a fitted curve, not measured). A compressed 1B variant runs on a CPU (Intel
  i5-12600KF) at up to **15.39× faster decode at 256k** vs Llama-3.2-1B. Pre-train accuracy
  ≈ open Transformers (7B recovers ~90% of base; MMLU 65.84). [arXiv:2509.05276](https://arxiv.org/abs/2509.05276)
- **Memristor/SRAM compute-in-memory** (NTHU+TSMC) — 40.91 TFLOPS/W; *Nature* 2025. [Nature](https://www.nature.com/articles/s41586-025-08639-2)
- **Intel Hala Point** — largest neuromorphic system (1.15B neurons, 1,152 Loihi 2). [Intel](https://newsroom.intel.com/artificial-intelligence/intel-builds-worlds-largest-neuromorphic-system-to-enable-more-sustainable-ai)

### Energy & power (the real ceiling)
- **IEA** projects data-center electricity ~doubling to ~945 TWh by 2030 (~3% of global
  supply). [IEA](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)
- **Power, not chips, is the binding constraint** — Microsoft (Three Mile Island restart),
  Google (Kairos SMRs), Amazon (Talen + X-energy), Meta (multi-GW nuclear). [IEEE](https://spectrum.ieee.org/nuclear-powered-data-center)

## State of research

**Best-performing now:** NVIDIA GPUs (Blackwell→Rubin) remain the default; TPUs and Trainium
are the only credible frontier-scale alternatives, both inference-optimized. FP4 + HBM4 is
the winning hardware economics.

**Promising but unproven:** Neuromorphic (NorthPole), photonic (Lightmatter), and analog
in-memory all show striking *efficiency* results but remain largely **pre-commercial** for
mainstream LLM workloads. Spiking (SpikingBrain) is further along on the *algorithm* side —
open-weight 7B/76B models that train and serve on commodity (MetaX) GPUs — but its
event-driven *energy* advantage is still only simulated; realizing it awaits asynchronous
neuromorphic silicon.

**Open problems & weaknesses:** Alternative computing lacks software/ecosystem maturity and
general-purpose flexibility — efficiency demos rarely translate to drop-in deployment.
- **Spiking energy gains are simulated, not measured.** SpikingBrain's headline efficiency
  (97.7% vs FP16, 43.48× vs FP16 MAC / 6.76× vs INT8 MAC) is an *estimate* from 45nm
  per-MAC energy data assuming idealized asynchronous event-driven hardware that doesn't yet
  exist; GPUs are clock-driven and can't exploit the 18.4% silent channels. The authors say
  so explicitly. [arXiv:2509.05276](https://arxiv.org/abs/2509.05276)
- **Linear-attention recall is the structural weak spot.** SpikingBrain-7B (pure linear)
  recovers only ~90% of its base model and lags on recall-heavy long-context tasks; closing
  the gap required the 76B model to keep *full softmax* attention in some layers. Training on
  concatenated short texts (vs native long-context data) gave limited long-context gains.
- **HBM supply** is a hard physical bottleneck — 2026 HBM4 from SK Hynix and Micron is fully
  sold out. **Power** is now the true ceiling: every alternative-compute thread is justified
  primarily by the energy crunch, and the nuclear buildout won't deliver until ~2028+.
  (Unverified mid-2026 "Loihi 3 in production" claims are excluded as unsubstantiated.)
