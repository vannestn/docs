# Hardware & Neuromorphic

The silicon underneath AI — mainstream accelerators, the HBM chokepoint, alternative
computing paradigms, and the power constraint that now gates everything.

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
- **SpikingBrain** (CAS) — billion-scale *spiking* LLM, 25–100× faster TTFT on 1M-token
  inputs, trained on non-NVIDIA MetaX GPUs. [arXiv:2509.05276](https://arxiv.org/abs/2509.05276)
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

**Promising but unproven:** Neuromorphic (NorthPole), photonic (Lightmatter), analog
in-memory, and spiking (SpikingBrain) all show striking *efficiency* results but remain
largely **pre-commercial** for mainstream LLM workloads.

**Open problems & weaknesses:** Alternative computing lacks software/ecosystem maturity and
general-purpose flexibility — efficiency demos rarely translate to drop-in deployment.
**HBM supply** is a hard physical bottleneck. And **power** is now the true ceiling: every
alternative-compute thread is justified primarily by the energy crunch, and the nuclear
buildout won't deliver until ~2028+. (Unverified mid-2026 "Loihi 3 in production" claims are
excluded as unsubstantiated.)
