# Compute & Memory Footprint of AI Research

Not all AI research needs a datacenter. This page breaks the field by **what hardware the
work actually requires** — and, crucially, separates the *cheap proof-of-concept* path from
the *scaled / competitive* version, because for many areas they're wildly different.

> **📦 Why this matters** — "AI research needs massive compute" is half-true. *Frontier
> pretraining* does. But large parts of the field — interpretability, evaluation, RL-for-
> reasoning method development, agent scaffolding, data curation, many architecture ideas —
> can be *prototyped* on a laptop or a single GPU, and only need scale to *confirm* results.

## The tiers (with rough memory)

| Tier | Hardware | GPU memory | Example cost |
|------|----------|-----------|--------------|
| **T0 · Laptop / consumer** | Apple M-series laptop, or 1 consumer GPU (RTX 4090, 24 GB) | 16–24 GB | owned / free |
| **T1 · Workstation / 1 datacenter GPU** | 1× A100/H100 (80 GB), or 2–4 consumer GPUs | 80–96 GB | ~$1–3/hr rented |
| **T2 · Single node** | 8× H100/H200 (one server) | ~640 GB–1.1 TB HBM | ~$15–30/hr |
| **T3 · Small cluster** | tens–low-hundreds of GPUs | multi-TB | $100k–$1M / run |
| **T4 · Frontier** | thousands–100k+ GPUs, power-constrained datacenter | many PB | $10M–$1B+ / run |

> **📦 Memory vs compute** — two different limits. **Compute** (FLOPs) sets *training time*.
> **Memory** (GPU HBM) sets *what fits at all* — a 70B model in 16-bit needs ~140 GB just to
> load, before training overhead. **Quantization** (4-bit) is what lets big models *run* (not
> train) on small hardware — e.g., a 70B model in 4-bit fits in ~40 GB.

## Where each research area actually sits

The key distinction per area: **PoC** = the cheapest hardware where you can do *real,
publishable* work; **Scaled/SOTA** = what competitive frontier results require.

### Runs on a laptop (T0) for real work
- **Mechanistic interpretability** — much foundational work runs on *small* models (GPT-2-
  scale) on a single consumer GPU or even CPU. Sparse-autoencoder probing, circuit analysis,
  and steering experiments are famously *compute-cheap*. **Scaled:** analyzing frontier models
  needs their activations (T1–T2), but the *methods* are developed at T0.
- **Evaluation & benchmark design** — building evals, contamination analysis, and scoring use
  *API calls*, not local training. T0 + an API budget.
- **Agent scaffolding & prompting research** — orchestration, tool-use patterns, RAG pipelines,
  multi-agent protocols: all built on top of API/model calls. T0.
- **Data curation pipelines** — filtering/classifier design is mostly *CPU/data-engineering*;
  prototyped at T0, run at scale on CPU clusters (not GPU-bound).
- **RAG & memory systems** — retrieval, vector stores, memory architectures: T0 + API.
- **Inference of small/quantized open models** — 7–8B models in 4-bit run on a laptop; great
  for application research and small fine-tunes.

### Needs a single GPU (T1) — including many cheap PoCs
- **RL-for-reasoning (RLVR) method development** — GRPO-style experiments on a **1.5B** model
  run on one A100/H100. The *science* (entropy collapse, reward design) is studied here;
  **Scaled:** competitive reasoning models are T3–T4.
- **Fine-tuning 7–8B with LoRA/QLoRA** — adapter fine-tuning fits on one 80 GB GPU.

  > **📦 LoRA/QLoRA** — cheap fine-tuning that updates a small add-on instead of all weights,
  > so a big model can be adapted on modest hardware.

- **Diffusion-LM prototypes**, **architecture ideas at small scale** — a new attention/SSM
  variant can be *validated* at 100M–1B params on T1; **Scaled:** proving it competes needs T3.
- **Robotics policy fine-tuning** (small VLAs), **protein-model inference** (ESM, Boltz run on
  one GPU) — T1. **Scaled:** training protein/DNA foundation models is T3.

### Needs a node or small cluster (T2–T3)
- **Training small-to-mid models from scratch** (1–32B), **RL on mid-size reasoning models**
  (e.g., DeepSWE: ~4,500 tasks on **64 H100s for ~6 days** ≈ T3), **VLA training**, **fine-
  tuning large open models**, **most fully-open model efforts** (OLMo-class).
- **DNA/protein foundation-model training** (Evo 2, ESM3), **materials/weather models** — T3.

### Needs frontier-scale compute (T4)
- **Frontier LLM pretraining** (GPT-5/Claude/Gemini/DeepSeek-class), **large MoE**, **large RL
  runs**, **frontier multimodal & world models** (Genie, Sora-class video), **frontier robotics
  foundation models**. Memory, interconnect, fault tolerance, and **power** dominate (see
  [07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md)).

## Summary table

| Area | Cheap PoC tier | Competitive/SOTA tier |
|------|:--------------:|:---------------------:|
| Mechanistic interpretability | **T0** | T1–T2 |
| Evaluation / benchmark design | **T0** (+API) | T0–T1 |
| Agent scaffolding / RAG / memory | **T0** (+API) | T1 |
| Data curation | **T0** (CPU) | CPU cluster |
| RL-for-reasoning *methods* | **T1** (1.5B) | T3–T4 |
| Fine-tuning open models (LoRA) | **T1** | T2 |
| New architectures (SSM/diffusion/attn) | **T1** (small) | T3–T4 (to prove scaling) |
| Robotics / VLAs | T1 (fine-tune) | T2–T3 (train) |
| AI-for-science (proteins/DNA/materials) | T1 (inference) | T3 (training) |
| Continual / open-ended / self-improvement | T1–T2 | T3 |
| Frontier LLM / MoE / multimodal | — | **T4** |
| World models / video generation | T2 (small) | **T4** |

## Takeaways

- **A huge amount of real research is T0–T1.** Interpretability, evals, agents, RAG, data,
  and *method development* for RL/architectures are accessible on a laptop or one rented GPU.
  This is why small labs and academics remain competitive *on methods*.
- **Scale is needed to *confirm*, not to *invent*.** Many architecture/RL/data ideas are born
  cheap and only need T3–T4 to demonstrate they hold at frontier scale — the expensive part is
  *validation*, and that's the moat frontier labs hold.
- **Memory, not just FLOPs, gates access.** Quantization (4-bit) is what democratizes *running*
  big models; it doesn't democratize *training* them.
- **The genuinely T4-only work** is frontier pretraining, large MoE, and frontier world/video
  models — where power and interconnect, not ideas, are the binding constraint.
