# Fusion & Plasma Control

Reinforcement learning to control the plasma inside tokamak fusion reactors — one of the
clearest "RL controls real hardware" success stories in science.

## Key directions & work

- **DeepMind + EPFL (TCV lineage)** — the original 2022 result controlled plasma shape on the
  real TCV tokamak via RL ([Nature 2021/22](https://www.nature.com/articles/s41586-021-04301-9));
  the Dec 2025 successor reports up to **65% better shape accuracy** and 3×+ faster training.
  [arXiv:2307.11546](https://arxiv.org/pdf/2307.11546)
- **Princeton/PPPL + General Atomics** — RL trained on a tearing-instability predictor *avoided
  disruptions in real time* on the **DIII-D** tokamak (predicting up to 300ms ahead).
  [Nature 2024](https://www.nature.com/articles/s41586-024-07024-9)
- **Cross-device validation** — the approach now transfers to DIII-D and WEST, attacking the
  key generalization question.
- **TokaMind** (UKAEA + IBM) — a Feb 2026 *multimodal transformer foundation model* for plasma
  dynamics; the shift from task-specific RL to "fusion foundation models." [arXiv:2602.15084](https://arxiv.org/abs/2602.15084) *[2026 — verify]*

## State of research

**Best-performing now:** RL magnetic control is **hardware-validated** on multiple real
tokamaks (TCV, DIII-D, WEST) — among the strongest applied-RL results in any science domain.

**Promising but unproven:** fusion *foundation models* (TokaMind) as predictors; whether
control transfers to reactor-scale devices (ITER/DEMO).

**Open problems & weaknesses:** **sim-to-real transfer** and cross-device generalization are
the central challenges; controllers are often device-specific (trained on that machine's past
shots). Reactor-scale validation doesn't yet exist.
