# Quantum ML & Federated Learning

Two fields often lumped under "emerging ML" with opposite hype-vs-reality profiles: quantum ML
is mostly *promise*, federated learning is quietly *deployed*.

## Quantum machine learning (QML) — mostly promise
- **The central deflationary result:** the architectural fixes that make variational QML
  *trainable* (no "barren plateaus") tend to also make it *classically simulable* — so the cure
  may erase the advantage. Los Alamos — [Nature Rev. Phys. 2025](https://www.nature.com/articles/s42254-025-00813-9)
- **Flagship architectures don't deliver advantage** — Quantum CNNs shown effectively
  classically simulable. [arXiv:2408.12739](https://arxiv.org/pdf/2408.12739)
- **Dequantization** (random Fourier features, classical surrogates) reproduces many QML models
  classically. Provable quantum advantages exist only on **artificial, structured data**
  (discrete-log-style), not real datasets.

> **📦 Honest read** — QML is a vibrant *theory* field, but the 2025–26 consensus among leading
> groups is skeptical about near-term advantage on classical-data tasks.

## Federated learning (FL) — quietly real
- **Production FL with formal differential-privacy guarantees ships at billion-device scale** —
  Google (Gboard, DP-FTRL) and Apple (on-device, DP). [Google](https://research.google/blog/federated-learning-with-formal-differential-privacy-guarantees/)
- **Federated LLM fine-tuning** is the hot frontier but research-stage — gated by device memory;
  side-tuning/split designs (Fed MobiLLM) and FedLoRA reduce the burden. [arXiv:2508.06765](https://arxiv.org/abs/2508.06765)
- **Cross-silo FL** (healthcare/finance) is the commercially serious segment (NVIDIA FLARE,
  Flower, Owkin).

> **📦 Concept: federated learning** — train a shared model across many devices without
> centralizing their raw data; only privatized model *updates* leave the device.

- **Private LLM inference** via homomorphic encryption/MPC has moved from impossible to
  demonstrable-but-slow (orders of magnitude slower than plaintext). Secure aggregation is the
  mature, deployed primitive.

## State of research

**Best-performing now:** FL + differential privacy is **deployed** (Google, Apple); secure
aggregation is mature; cross-silo FL has real enterprise use.

**Promising but unproven:** federated LLM fine-tuning at scale; FHE/MPC private LLM inference
(demos, not production); *any* practical QML advantage on real data.

**Open problems & weaknesses:** QML's trainability-vs-simulability tension is the core
unresolved question — advantage is confined to constructed data. FL faces slow dev cycles, low
device participation, and a privacy-vs-robustness trilemma (local DP noise can invite
poisoning). Private inference remains impractically slow for interactive use.
