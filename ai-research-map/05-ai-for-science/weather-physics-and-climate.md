# Weather, Physics & Climate

ML forecasting models that now routinely beat traditional numerical methods, and the early
push toward general "physics foundation models."

## Key directions & work

- **GenCast** (DeepMind) — diffusion-based 15-day ensemble forecasting at 0.25° resolution,
  12-hour steps, >80 surface/atmospheric variables; greater skill than ECMWF's ENS on **97.2%
  of 1,320 targets** (99.8% at lead times >36h), and better on extreme weather, tropical
  cyclones, and wind-power. Produces a 15-day forecast in ~8 minutes on a single Cloud TPU v5
  (vs. hours on an NWP supercomputer). Published in *Nature* (Dec 2024); architecture is a
  GraphCast-style GNN with a sparse-transformer processor. [arXiv:2312.15796](https://arxiv.org/abs/2312.15796) ·
  [DeepMind](https://deepmind.google/blog/gencast-predicts-weather-and-the-risks-of-extreme-conditions-with-sota-accuracy/)
- **WeatherNext 2** (DeepMind, Nov 2025) — ~8× faster, resolution up to 1-hour, surpasses the
  prior WeatherNext on **99.9% of variables and lead times (0–15 days)**. Core advance is the
  **Functional Generative Network (FGN)**, which injects noise into the model architecture
  itself (rather than the inputs); generates hundreds of scenarios in under a minute on one
  TPU. Now powering forecasts in Search, Gemini, Pixel Weather, and the Maps Weather API.
  [Google](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/weathernext-2/)
- **Aurora** (Microsoft) — **1.3B-parameter** foundation model of the atmosphere (3D Swin
  Transformer with Perceiver encoders/decoders), trained on >1M hours of geophysical data.
  Fine-tunable and beats operational forecasts on air quality (0.4°), ocean waves (0.25°),
  tropical-cyclone tracks (0.25°), and high-res weather (0.1°) at modest cost. Published in
  *Nature* (May 2025). [arXiv:2405.13063](https://arxiv.org/abs/2405.13063) ·
  [Microsoft](https://www.microsoft.com/en-us/research/blog/introducing-aurora-the-first-large-scale-foundation-model-of-the-atmosphere/)
- **Physics foundation models** — an emerging thrust toward a single model that simulates many
  PDE systems from a *prompt* of prior states (no per-system retraining), echoing the LLM
  "train once, deploy anywhere" paradigm. *"Towards a Physics Foundation Model"* introduces
  **GPhyT** — see below. [arXiv:2509.13805](https://arxiv.org/abs/2509.13805)

## Spotlight: GPhyT — "Towards a Physics Foundation Model"

Wiesner, Gray, Wessling & Baek (UVA School of Data Science + RWTH Aachen), AI4Science Workshop
@ ICML 2026. [arXiv:2509.13805](https://arxiv.org/abs/2509.13805) ·
[code](https://github.com/FloWsnr/General-Physics-Transformer)

**Thesis.** Today's physics-aware ML (PINNs, neural operators, PARC) is locked to a single,
narrowly-scoped system and needs retraining or fine-tuning for any new PDE/boundary condition.
The authors argue the path to a true Physics Foundation Model (PFM) is to *emulate the
in-context learning of LLMs*: infer the governing dynamics from a short sequence of prior
states rather than being told the equations. The **General Physics Transformer (GPhyT)** is a
first step toward that "train once, deploy anywhere" goal.

**Mechanism.** A hybrid of deep learning + classical numerics. A transformer-based **neural
differentiator** (linear tokenizer → spatiotemporal transformer → detokenizer, applied over a
4D stack of `time × height × width × fields`) predicts the *time derivative* ∂X/∂t; a standard
**numerical integrator** (first-order Forward Euler here; Heun/RK4 possible) advances the state
X_{t+1} = f(X_t, ∂X/∂t|_t, Δt). Two physics-motivated tricks matter: the model also predicts
the derivative rather than the next state directly, and the input is augmented with
**numerically-computed spatial (∂x, ∂y) and temporal (∂t) derivatives** of the fields,
concatenated along the channel dim to resolve sharp gradients/shocks.

**Data.** 1.8 TB of simulation data (>2.4M trajectories; ~71M unique 4-input/1-output samples
once sub-sampled across Δt of 1–8 plus random axis flips). Seven datasets — three from **The
Well** benchmark (shear flow, Rayleigh–Bénard, Euler) plus four custom (obstacle flow, thermal
flow, Rayleigh–Bénard with obstacles, two-phase porous-media flow). All 2D, normalized
per-dataset, at **256×128** resolution; up to 5 fields (pressure, density, temperature,
velocity-x/y, missing fields zeroed).

**Results** (median NMSE, next-step prediction; baselines = MPP, DPOT, Poseidon, plus a UNet):

- *Single-step multi-physics:* GPhyT has the lowest overall error and wins on **all but one of
  the 7 datasets**, with the next-best model (DPOT) showing **>7× higher** overall NMSE.
  Notably the plain UNet beats the more sophisticated Poseidon and MPP.
- *Long-horizon rollout (to 24 steps):* GPhyT leads through most of the rollout, only slightly
  surpassed by Poseidon in late stages; it best preserves global dynamics and reproduces
  high-frequency detail (e.g. Euler shockwaves) where MPP/DPOT diverge entirely.
- *In-context / zero-shot generalization:* on novel boundary conditions and entirely novel
  physics (supersonic flow, turbulent radiative layer), GPhyT outperforms all foundation
  baselines and is the **only model that stays below NMSE = 1** (the threshold below which it
  beats simply predicting the image mean) — evidence of inferring new dynamics from the prompt
  alone, without fine-tuning.

**Ablations.** (1) Predicting the *derivative* + integrator beats direct next-state prediction
across all horizons. (2) Removing the concatenated spatial/temporal derivative features
degrades accuracy by ~an order of magnitude on long rollouts. (3) Scaling 9M → 112M → 385M
params (S/M/L) improves accuracy monotonically (no saturation). (4) Input timesteps N_in = 4
is a favorable accuracy/compute trade-off (attention cost is quadratic; single-frame input is
much worse).

**Author-stated limitations.** 2D only (3D claimed feasible via larger temporal patches);
long-term stability still far short of numerical solvers — error accumulation looks inherent to
all neural rollouts tested; coverage limited to fluid dynamics + heat transfer (no mechanics,
chemistry, molecular dynamics, optics); fixed 256×128 resolution (variable resolution is future
work). The authors frame GPhyT as a step *toward*, not an arrival at, a PFM.

## State of research

**Best-performing now:** ML weather forecasting is *mature and winning* — diffusion
ensembles (GenCast) and graph/operator forecasters beat operational NWP on most variables
at a fraction of the compute (8 min on one TPU vs. hours on a supercomputer), and are being
adopted operationally (WeatherNext 2 powers Google Search/Maps/Gemini forecasts).

**Promising but unproven:** General-purpose **physics foundation models** (one model across
many PDEs/domains) are early — most success is still domain-specific. GPhyT is the most
direct demonstration that a single transformer can learn disparate physics from data alone and
infer unseen dynamics in-context, but it is explicitly a step *toward*, not an arrival at, a
true PFM.

**Open problems & weaknesses:**

- **Skill ≠ understanding / stability.** Forecasting accuracy doesn't imply physical
  consistency; extrapolation to climate-shifted regimes and rare extremes is uncertain. GPhyT
  finds that **long-horizon error accumulation appears inherent to all neural rollouts** tested
  and no model matches numerical-solver precision — the key barrier for engineering use.
- **Generality is still narrow.** Today's "foundation" models cover fluid/heat dynamics, in
  **2D**, at **fixed resolution**; mechanics, chemistry, MD, optics, 3D, and variable
  resolution remain open (per GPhyT's own limitations).
- **Conservation & data.** Neural operators can violate conservation laws; weather data is
  reanalysis-dependent. Long-range *climate* (vs. weather) modeling and coupling ML components
  into full Earth-system models remain open (Aurora's Earth-system extension is an early move
  here).
