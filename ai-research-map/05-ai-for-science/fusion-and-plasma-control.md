# Fusion & Plasma Control

Using reinforcement learning (RL) to control the superheated plasma inside tokamak fusion
reactors — one of the clearest "RL controls real hardware" success stories in science.

## Key directions & work

- **DeepMind + EPFL/SPC (TCV lineage)** — the original 2022 result trained a control policy
  entirely in simulation (the free-boundary FGE simulator) and deployed it on the real
  **TCV** tokamak, driving all 19 magnetic control coils at 10 kHz directly from raw magnetic
  measurements, with no real-time equilibrium reconstruction. It held a wide range of plasma
  shapes (elongated, ITER-relevant, negative-triangularity, snowflakes, and a two-plasma
  "droplet"). [Nature 2022](https://www.nature.com/articles/s41586-021-04301-9) (Degrave et al.)
- **Making that RL approach *practical*** — the follow-up, "Towards practical RL for tokamak
  magnetic control," tackles the three drawbacks that limited uptake: control accuracy, steady-state
  bias, and training time. In **simulation** it reports **up to 65% better shape
  accuracy**, a substantial reduction in long-term plasma-current bias, and **≥3× faster
  training**; new TCV experiments validate the simulated controllers. *(Preprint, Jul 2023.)*
  [arXiv:2307.11546](https://arxiv.org/abs/2307.11546) (Tracey et al.)
- **Princeton/PPPL + General Atomics** — RL paired with a tearing-instability predictor
  *avoided disruptions in real time* on the **DIII-D** tokamak. The AI forecasts tearing
  up to **300 ms** ahead and steers the plasma to stay below a tearing-likelihood threshold
  while holding H-mode performance. [Nature 2024](https://www.nature.com/articles/s41586-024-07024-9)
- **Independent cross-device efforts** — separate groups have since applied RL magnetic
  control to **WEST** (CEA, trained on the NICE free-boundary code, [IEEE TPS 2024](https://ieeexplore.ieee.org/document/10482855/))
  and to **DIII-D** with reconstruction-free control ([arXiv:2506.13267](https://arxiv.org/abs/2506.13267)).
  The field is tackling generalization device-by-device — no single controller yet transfers
  zero-shot across machines.
- **TokaMind** (IBM Research + UKAEA + STFC) — a *multi-modal transformer foundation model*
  for plasma dynamics; signals the shift from task-specific RL toward "fusion foundation
  models." [arXiv:2602.15084](https://arxiv.org/abs/2602.15084) (Boschi et al., Jun 2026).

## Inside the "practical RL" paper (arXiv:2307.11546)

The mechanism, results, and limitations — all in simulation on TCV unless noted, built on
Degrave et al. (2022) and using the **MPO** (Maximum-a-Posteriori Optimization) actor–critic
algorithm in JAX/Haiku.

- **Reward shaping is the lever.** The agent is driven by a scalar reward that combines many
  components (shape error, plasma current, coil currents…) via a weighted `SmoothMax`. Tightening
  the per-component `good`/`bad` band ("Narrow Reward") concentrates the learning signal at small
  errors and sharply improves accuracy: on the simple stabilization task `shape_70166`, LCFS shape
  RMSE drops from **0.567 cm (baseline) → 0.201 cm (Narrow Reward)**, and Iₚ error from 0.353% →
  0.238%.
- **But sharper isn't always better.** On the harder time-varying `snowflake_to_perfect` task,
  training with the narrow reward *from scratch* **fails** (Iₚ error 6.143% vs 0.848% baseline):
  a sharp reward gives almost no gradient to learn from when a second X-point is brought in
  incorrectly. The fix is a **two-stage regime** — pretrain on a forgiving reward, then fine-tune
  on the exacting one — which cuts X-point location error by **57% (0.669 cm → 0.289 cm)** and
  beats simply training longer ("Additional Training").
- **Integrator feedback for steady-state bias.** Feed-forward policies can't accumulate error over
  time, so the team appends a hand-computed *average plasma-current error*, eₜ = (1/t)Σeᵢ, to the
  observation — the analogue of the integral term in a PID controller. This noticeably reduces Iₚ
  bias, at the cost of slightly higher (but comparable) shape error.
- **Episode chunking cuts training time.** Splitting one long discharge into shorter "chunks" that
  actors explore independently parallelizes exploration. On `showcase_xpoint`, a 3-chunk setup
  reaches reward **96/100 in ~10 hours vs ~40 hours** for baseline single-episode training.
  A separate ~2–3× speedup comes from loosening the FGE solver's Newton–Krylov tolerance
  (1e-8 → 1e-4) without materially changing the control outcome.
- **Author-stated limitations.** Reward design is "an art" full of trade-offs (the X-point
  fine-tuned agent degrades slightly on Iₚ/shape); reward *scheduling* underperformed because a
  continuously moving reward destabilizes the value function (a non-stationary learning signal);
  and FGE simulation is expensive (~5 h for a 10,000-step episode), so even a perfect policy is
  slow to validate.

## Inside TokaMind (arXiv:2602.15084)

Claimed as, **to the authors' knowledge, the first open-source foundation model for tokamak
plasma dynamics**, built on a **Multi-Modal Transformer (MMT)** and pretrained on the public
**MAST** dataset.

- **Multi-modal by design.** It handles time-series (1D), profiles (2D), and videos (3D) at
  differing sampling rates and tolerates missing signals, via a lightweight fixed-basis
  **DCT3D** embedding (with hooks for VAE-learned codecs). The model is deliberately small:
  **Base = 6.93M params, Tiny = 3.69M params** (both under 7M).
- **Evaluated on TokaMark** — a MAST benchmark of **14 tasks** spanning equilibrium reconstruction,
  fast magnetics, profile dynamics, and MHD activity. Fine-tuned **FT-Base beats the strongest
  benchmark baseline on every task but one** (Task 4-5, spectral Mirnov targets; overall
  NRMSE 0.212 vs 0.249 for the best baseline).
- **The real finding is *when* pretraining helps.** Compared with training the same architecture
  from scratch on a matched epoch budget, warm-start pretraining helps **most on the hardest tasks** —
  Group 4 (long-horizon forecasting) and the high-dimensional equilibrium reconstruction/forecasting
  tasks. There, FT-Base beats Scratch on all five Group-4 tasks, while Scratch can fall *below* the
  baseline (−12.5% on one group). Tiny retains most of Base's performance, suggesting the gains come
  from transferable representations rather than raw capacity.
- **Author-stated limitations.** Evaluation is **single-device (MAST only)** — it does *not*
  establish cross-device generalization. It's framed as a **research framework, not for
  safety-critical deployment** without device-specific validation, uncertainty quantification, and
  human oversight. Rapidly varying and long-horizon signals remain the hardest cases.

## State of research

**Hardware-validated now:** RL *magnetic* control runs on real tokamaks — TCV (DeepMind/EPFL),
DIII-D (both Princeton/PPPL disruption avoidance and reconstruction-free control), and WEST (CEA).
These are among the strongest applied-RL results in any science domain. Note that the headline
accuracy/speed numbers from the "practical RL" work are **simulation results with TCV validation**,
not pure hardware metrics.

**Promising but unproven:** fusion *foundation models* (TokaMind) — strong on the MAST benchmark,
but single-device and explicitly not yet validated across machines or for control. Whether any of
this transfers to reactor-scale devices (ITER/DEMO) remains open.

**Open problems & weaknesses:**
- **Cross-device generalization** is still done device-by-device; there is no demonstrated
  zero-shot transfer of a single controller or model across tokamaks (TokaMind names this as its
  top limitation; the RL controllers are trained per-machine).
- **Sim-to-real and simulator cost** — RL controllers are trained in expensive free-boundary
  simulators; Tracey et al. note even validating a single episode takes hours.
- **Reward/objective design is brittle** — sharper rewards can break learning on complex tasks
  (the `snowflake` ablation), making robust reward specification an unsolved engineering problem.
- **Reactor-scale validation doesn't yet exist**, and foundation models are not deployment-ready
  for safety-critical control.
