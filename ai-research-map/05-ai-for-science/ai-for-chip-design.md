# AI for Chip Design (EDA)

Using AI — reinforcement learning and, increasingly, generative/agentic models — to design the
chips that AI itself runs on.

> **📦 Concept: EDA (Electronic Design Automation)** — the software used to design computer
> chips. "Placement/floorplanning" = deciding where blocks go on the silicon, a hard
> optimization problem.

## Key directions & work

- **AlphaChip** (Google DeepMind) — RL for macro placement; has designed every TPU generation
  since (incl. Trillium), with open-sourced pre-trained weights. [DeepMind](https://deepmind.google/blog/how-alphachip-transformed-computer-chip-design/)
- **A genuine reproducibility dispute** — UCSD (Cheng, Kahng) found AlphaChip *didn't* beat
  existing placers; Google rebutted ("That Chip Has Sailed," arguing critics skipped pre-training
  and withheld netlists). [Rebuttal arXiv:2411.10053](https://arxiv.org/html/2411.10053v1) ·
  [Critique](https://arxiv.org/html/2306.09633v10). **Unresolved** — the most important caveat here.
- **Commercial EDA shifted to agentic/generative AI, not pure RL** — Cadence Cerebrus AI Studio,
  Synopsys.ai Copilot; NVIDIA uses domain-adapted LLMs (ChipNeMo) as copilots. Notably a Synopsys
  VP said RL "hasn't really panned out" for core EDA. [Synopsys](https://news.synopsys.com/2025-09-03-Synopsys-Announces-Expanding-AI-Capabilities-for-its-Leading-EDA-Solutions)

## State of research

**Best-performing now:** AlphaChip is **in production** for Google's own silicon; generative/
agentic LLM copilots are the direction commercial EDA vendors are actually shipping.

**Promising but unproven:** whether RL placement generalizes/reproduces outside Google;
end-to-end agentic chip design.

**Open problems & weaknesses:** the **AlphaChip reproducibility dispute** is unresolved and
central; vendor PPA-gain claims (e.g., "20% better") are **not independently audited**; there's
explicit industry skepticism that RL beats classical optimizers for core placement.
