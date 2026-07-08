# Economics & Forecasting

Quantifying AI's trajectory and its economic impact — the numbers that anchor policy and
investment.

## Key directions & work

### Forecasting capability & autonomy
- **METR time-horizons** — the task length a model completes at 50% reliability has been
  doubling ~every 7 months (196 days) over 2019–2025, *accelerating to ~3 months* (88.6 days)
  since 2024. In the TH1.1 update (Jan 2026), the leading model, Claude Opus 4.5, reaches a
  ~5.3-hour horizon (320 min). This is the most-cited autonomy trend, though METR itself cautions
  that the metric may not capture the reliability and robustness real automation needs.
  [METR](https://metr.org/time-horizons/) · [TH1.1](https://metr.org/blog/2026-1-29-time-horizon-1-1/)
- **Epoch trends** — training compute ~5×/yr for frontier LMs (≈4.5×/yr across all notable
  models since 2010); pre-training algorithmic efficiency ~3×/yr; inference cost at fixed
  performance halving ~every 2 months (~2 OOM/yr). [Epoch](https://epoch.ai/trends)

### Forecasting how many models cross governance thresholds
- **Frontier model-count forecast** ([arXiv:2504.16138](https://arxiv.org/abs/2504.16138),
  Kumar & Manning, GovAI/Edinburgh) — forecasts *how many AI models* (not datacenter sizes) will
  exceed the compute thresholds that anchor governance: the EU AI Act's 10²⁵ FLOP "systemic-risk"
  GPAI line and the US AI Diffusion Framework's 10²⁶ FLOP "controlled models" line.
  - **Method:** project the total compute stock for AI workloads (median growth ~4.1×/yr,
    integrating Epoch's historical ~6.3×/yr with Dean's 3.4×/yr forecast), split it
    training-vs-inference (40/60 in 2025–26, 30/70 by 2028), then allocate training compute
    across model sizes via a log-linear CDF fit (gradient *k* ≈ 1) to Epoch's Notable Models
    dataset (296 datapoints, 2017–2023). Counts are 90% prediction intervals [5th, 50th, 95th].
  - **Headline (EOY 2028, 90% CI):** **103–306** models above 10²⁵ FLOP (median 165); **45–148**
    above 10²⁶ FLOP (median 81). Retrodiction check: predicts 23 models >10²⁵ FLOP at end-2024
    vs. 24 observed in Epoch's data.
  - **Key argument:** any *static* absolute threshold captures a *superlinearly* growing model
    count (the 10²⁵-FLOP 95th-percentile count rises by 37, then 55, 82, 105 year-on-year). So
    regulators must either raise thresholds over time, scope requirements proportionally, or use
    **frontier-connected thresholds** (defined relative to the largest model to date) — which the
    paper shows stay roughly *constant* at ~14–16 models within 1 OOM of the frontier across
    2025–28.
  - **Author-stated limits:** the Notable Models dataset's notability criteria (>1000 citations,
    >$1M cost, >1M MAU, SOTA, or historical significance) make it a strict subset, biasing median
    counts toward a *lower bound*. The 90% CIs capture parameter uncertainty (largest-model-share,
    allocation gradient, growth rate) but *not* this selection effect — and only ~6 historical
    datapoints calibrate the intervals. Estimates also don't map one-to-one onto regulatory scope
    (jurisdiction, GPAI definitions, downstream modifiers). A companion Epoch analysis (Cottier &
    Owen, May 2025) reaches a similar median of ~80 models >10²⁶ FLOP by 2028.
    [Epoch](https://epoch.ai/publications/model-counts-compute-thresholds)

### Economic impact
- **Anthropic Economic Index** — AI usage skews toward *augmentation* (~57%) over automation
  (~43%), concentrated in mid-to-high-wage software/technical tasks; Anthropic estimates
  widespread adoption could add ~1.8pp/yr to US labor-productivity growth, while flagging
  displacement risk if automation expands. No economywide job loss yet detectable.
  [Anthropic](https://www.anthropic.com/research/labor-market-impacts) ·
  [Stanford HAI AI Index](https://hai.stanford.edu/ai-index/2026-ai-index-report/economy)

### Scenario forecasting
- **AI 2027** (Kokotajlo et al.) — influential scenario. Lead author Daniel Kokotajlo has said
  things are "going somewhat slower" than the scenario, and now puts his AGI median around
  ~2030 (vs. ~2028 when the document was finished), with autonomous coding and superintelligence
  milestones pushed toward the early 2030s. [AI 2027](https://ai-2027.com/) ·
  [Kokotajlo update](https://officechai.com/ai/things-seem-to-be-going-somewhat-slower-than-the-ai-2027-scenario-daniel-kokotajlo/)

## State of research

**Best-performing now:** METR time-horizons and Epoch's compute/efficiency trends are the
canonical, widely-trusted quantitative anchors. Anthropic's Economic Index is the leading
empirical labor-impact dataset. For governance-threshold planning, the Kumar–Manning forecast
(corroborated by Epoch) is the most-detailed model-count projection.

**Promising but unproven:** Translating capability trends into *economic* outcomes,
task-level automation forecasting, and reconciling fast time-horizon growth with modest
measured labor impact. Model-count forecasts depend heavily on compute-stock and
largest-model-share assumptions whose historical calibration is thin.

**Open problems & weaknesses:** Forecasts are contested and have been revised *longer* (AI
2027's lead author now ~2030). Time-horizon metrics may not capture the reliability and
robustness needed for real automation (METR's own caveat). Labor data is early, and
augmentation-vs-displacement is unresolved. Scaling laws predict loss, not capabilities or
economic value. Selection and measurement effects abound: Kumar & Manning's counts rest on
Epoch's *notable*-models subset, biasing medians to a lower bound, and any static absolute
compute threshold captures a *superlinearly* growing set of models — pressuring a shift toward
frontier-relative thresholds.
