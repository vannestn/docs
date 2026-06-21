# Structured-Data ML

Foundation models arriving in the most "classical" data types — time-series, tabular, and
graph/relational — and the live question of whether they beat the trees-and-boosting
incumbents.

## Time-series foundation models
- **Chronos-2** (Amazon) — current SOTA; first to do zero-shot *multivariate + covariate*
  forecasting in one model ("group attention"). [arXiv:2510.15821](https://arxiv.org/abs/2510.15821)
- **TimesFM-2.5** (Google) — led GIFT-Eval by going *smaller* (200M) + longer-context (16K).
- **TiRex** (NX-AI / Hochreiter) — a 35M-param **xLSTM** (non-transformer) briefly held #1,
  proving recurrent models stay competitive. [arXiv:2505.23719](https://arxiv.org/abs/2505.23719)
- **The headline weakness:** TSFM benchmarks are **contaminated by train/test leakage**
  (can inflate scores >50%); leaderboards now flag "leaking" models. [arXiv:2510.13654](https://arxiv.org/abs/2510.13654)

## Tabular foundation models
- **TabPFN-2.5** (Prior Labs) — current SOTA; beats tuned gradient-boosted trees in a single
  forward pass on small/mid datasets, now scaling to ~50K samples. [arXiv:2511.08667](https://arxiv.org/abs/2511.08667)

  > **📦 Concept: GBDT (Gradient-Boosted Decision Trees)** — XGBoost/LightGBM/CatBoost; the
  > long-standing default for tabular data. Still strong, especially at scale.

- **No clean winner** — per the **TabArena** living benchmark: foundation models win on small
  data, GBDTs stay strong on larger/practical data, and an *ensemble of all families* beats
  any single one. [arXiv:2506.16791](https://arxiv.org/abs/2506.16791)

## Graph & relational foundation models
- **Google's Graph Foundation Model** for relational tables — 3×–40× average-precision gains
  over baselines in production (e.g., spam detection). [Google](https://research.google/blog/graph-foundation-models-for-relational-data/)
- **Relational Transformer** (Stanford SNAP) — genuine *zero-shot* transfer across unseen
  databases; a 22M model beats a 27B LLM on relational tasks. [arXiv:2510.06377](https://arxiv.org/abs/2510.06377)
- **Universal graph foundation models remain unproven** — no unified pipeline or standard
  transfer benchmark; cross-domain feature harmonization is the open problem. [Survey arXiv:2505.15116](https://arxiv.org/abs/2505.15116)

## State of research

**Best-performing now:** Chronos-2 (time-series, multivariate zero-shot); TabPFN-2.5 +
ensembles for small/mid tabular with GBDTs still leading at scale; relational deep learning +
Google's GFM for relational/graph data.

**Promising but unproven:** universal graph foundation models; tabular FMs beyond ~1M rows;
reasoning-augmented variants.

**Open problems & weaknesses:** TSFM **benchmark leakage/contamination** is severe; tabular
FM **scalability** is quadratic-limited; graph FMs lack **cross-domain feature harmonization**.
The big honest takeaway: **classical methods (GBDTs, xLSTMs) are not obsolete** — they remain
SOTA or near-SOTA in their niches, so the foundation-model story here is partial.
