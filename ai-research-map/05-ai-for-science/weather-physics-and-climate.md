# Weather, Physics & Climate

ML forecasting models that now routinely beat traditional numerical methods, and the early
push toward general "physics foundation models."

## Key directions & work

- **GenCast** (DeepMind) — diffusion-based 15-day ensemble forecasting; beats ECMWF's ENS on
  ~97–99% of variables, runs in ~8 minutes; published in *Nature*. [DeepMind](https://deepmind.google/blog/gencast-predicts-weather-and-the-risks-of-extreme-conditions-with-sota-accuracy/)
- **WeatherNext 2** (DeepMind) — ~8× faster, up to 1-hour resolution, surpasses the prior
  model on 99.9% of variables/lead times (Functional Generative Network). [Google](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/weathernext-2/) *[secondary — verify]*
- **Aurora** (Microsoft) — >1B-param environmental foundation model specializable to
  cyclones, air pollution, weather; often beats traditional NWP at lower cost. [coverage](https://aimagazine.com/news/special-report-is-ai-the-future-of-weather-forecasting)
- **Physics foundation models** — an emerging thrust toward general PDE/fluid solvers and
  neural operators that generalize across geometries. *"Towards a Physics Foundation Model"*
  — [arXiv:2509.13805](https://arxiv.org/pdf/2509.13805)

## State of research

**Best-performing now:** ML weather forecasting is *mature and winning* — diffusion
ensembles (GenCast) and graph/operator forecasters beat operational NWP on most variables
at a fraction of the compute, and are being adopted operationally.

**Promising but unproven:** General-purpose **physics foundation models** (one model across
many PDEs/domains) are early — most success is still domain-specific.

**Open problems & weaknesses:** Forecasting skill ≠ physical understanding; extrapolation to
unprecedented (climate-shifted) regimes and rare extremes is uncertain. Neural operators can
violate conservation laws. Long-range climate (vs. weather) modeling, and coupling ML
components into full Earth-system models, remain open. Data is reanalysis-dependent.
