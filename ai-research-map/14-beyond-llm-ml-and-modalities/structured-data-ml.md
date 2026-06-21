# Structured-Data ML

Foundation models arriving in the most "classical" data types — time-series, tabular, and
graph/relational — and the live question of whether they beat the trees-and-boosting
incumbents.

## Time-series foundation models
- **Chronos-2** (Amazon) — current SOTA; the first pretrained model to do zero-shot
  *multivariate + covariate-informed* forecasting in one model. The mechanism is a **group
  attention** layer that shares information *across the batch axis* within groups of related
  series (targets, variates, or covariates), so it scales **O(V)** in the number of variates
  instead of concatenating them. A 120M-param encoder-only model (T5-style), it wins all three
  benchmarks it reports: **fev-bench** (90.7% avg win rate vs 80.8% for the next-best, TiRex),
  **GIFT-Eval**, and **Chronos Benchmark II**; the largest gains are on covariate tasks.
  [arXiv:2510.15821](https://arxiv.org/abs/2510.15821)
- **TimesFM-2.5** (Google) — led GIFT-Eval by going *smaller* (200M, down from 500M) +
  *longer-context* (16K, up from 2048). Subsequently displaced on GIFT-Eval by Chronos-2 and
  Moirai-2.0. [Source](https://www.marktechpost.com/2025/09/16/google-ai-ships-timesfm-2-5-smaller-longer-context-foundation-model-that-now-leads-gift-eval-zero-shot-forecasting/)
- **TiRex** (NX-AI / Hochreiter, NeurIPS 2025) — a **35M-param xLSTM** (sLSTM blocks,
  non-transformer/recurrent) that held #1 on GIFT-Eval-ZS and Chronos-ZS, beating much larger
  TimesFM-2.0 (500M) and Chronos-Bolt; now #2 behind Chronos-2. Its key trick is **Contiguous
  Patch Masking (CPM)**, a training-time masking strategy that lets the recurrent state
  propagate uncertainty across patches and enables stable long-horizon multi-patch forecasts —
  ablations show CPM is essential for long-horizon performance. Proves recurrent models stay
  competitive *and* far cheaper (>11× less GPU memory than TimesFM-2.0). [arXiv:2505.23719](https://arxiv.org/abs/2505.23719)
- **The headline weakness:** TSFM benchmarks are **contaminated by train/test leakage**, and
  documented cases have inflated test scores by **>50%**. Two leakage types: *direct* (datasets
  reused across pretraining and test) and *indirect* (temporally-overlapping correlated series —
  e.g. a model trained on the DAX index through the 2020 COVID crash can exploit that signature
  when forecasting the S&P 500 over the same window). A controlled replication found leakage gave
  ~37% better MAE during the crash and ~43% in a Madrid-transport experiment. Across 401 datasets
  used by 22 published TSFMs, **only 6% had never appeared in any pretraining corpus** — so the
  authors argue benchmarks (not models) must guarantee genuinely-novel, post-cutoff test data.
  [arXiv:2510.13654](https://arxiv.org/abs/2510.13654)

  > **⚠️ Note:** Chronos-2's own fev-bench results report **0% leakage** for Chronos-2 (vs 8% for
  > TimesFM-2.5/Toto, 28% for Moirai-2.0), and TiRex/Chronos-ZS results explicitly flag
  > Moirai's 82% overlap — the field is now reporting leakage as a first-class metric.

## Tabular foundation models
- **TabPFN-2.5** (Prior Labs) — current SOTA; beats tuned gradient-boosted trees in a single
  forward pass and matches a 4-hour-tuned **AutoGluon 1.4** ensemble. Scales to **50K samples /
  2,000 features** (a ~20× increase in data cells over TabPFNv2). Reported win rates: **100% vs
  default XGBoost** on small/mid classification (≤10K samples, 500 features) and **87%** on
  larger datasets up to 100K samples (85% for regression). Architecture is a deeper alternating-
  attention transformer (24 layers classification / 18 regression) trained purely on synthetic
  priors, plus 64 learned "thinking" rows acting as attention sinks. A distillation engine
  (TabPFN-as-MLP/TreeEns) trades ICL for low-latency deployment. Inference scales **O(r²·min(c,500)
  + r·min(c,500)²)** — i.e. quadratic in rows — which is the binding scalability limit.
  [arXiv:2511.08667](https://arxiv.org/abs/2511.08667)

  > **📦 Concept: GBDT (Gradient-Boosted Decision Trees)** — XGBoost/LightGBM/CatBoost; the
  > long-standing default for tabular data. Still strong, especially at scale.

- **No clean winner** — per the **TabArena** living benchmark (51 hand-curated IID datasets from
  1,053 candidates, 16 models, ~25M model runs): foundation models (TabPFNv2) dominate on *small*
  data, GBDTs stay strong on larger/practical data, and the best deep-learning methods **catch up
  to GBDTs only under tuning + ensembling**. The authors call the GBDT-vs-DL framing a **"false
  dichotomy"**: a post-hoc **ensemble across model families beats any single model**, and the
  best individual models are *not* the highest-weighted ensemble members. [arXiv:2506.16791](https://arxiv.org/abs/2506.16791)

## Graph & relational foundation models
- **Google's Graph Foundation Model** for relational tables — **3×–40× average-precision gains**
  over the best tuned *single-table* baselines (which miss cross-table context) in internal
  production tasks such as spam detection in ads. [Google](https://research.google/blog/graph-foundation-models-for-relational-data/)
- **Relational Transformer** (Stanford SNAP + Kumo AI + Oxford + SAP, ICLR 2026) — genuine
  *zero-shot* transfer across unseen databases via three ideas: **cell-level tokenization**
  (every cell is a token), **task-table prompting** (tasks attached as extra tables, no
  task-specific fine-tuning), and a novel **Relational Attention** (column / feature / neighbor
  attention over P→F key links). Pretrained on RelBench, a **22M-param** model reaches **90.3%
  of fully-supervised AUROC zero-shot** on binary classification (93.1% with continued
  pretraining on the target DB), beating Gemma3-**27B** (83.7%) despite ~10⁵× fewer inference
  FLOPs. [arXiv:2510.06377](https://arxiv.org/abs/2510.06377)
- **Universal graph foundation models remain unproven** — per a comprehensive survey, the open
  obstacles are three kinds of heterogeneity (**feature, structure, task**) and no shared
  evaluation: open problems are scalability, data scarcity, evaluation, and utilization. No
  unified pipeline or standard transfer benchmark yet; cross-domain feature/structural alignment
  is the core unsolved problem. [Survey arXiv:2505.15116](https://arxiv.org/abs/2505.15116)

## State of research

**Best-performing now:** Chronos-2 (time-series, multivariate/covariate zero-shot, 0% measured
leakage); TabPFN-2.5 + cross-family ensembles for small/mid tabular with GBDTs still leading at
scale; relational deep learning (Relational Transformer) + Google's GFM for relational/graph data.

**Promising but unproven:** universal graph foundation models; tabular FMs beyond ~100K rows;
reasoning-augmented / causal variants (TabPFN-2.5 also tops the RealCause CATE-estimation
leaderboard).

**Open problems & weaknesses:** TSFM **benchmark leakage/contamination** is severe (>50% score
inflation documented; only 6% of datasets are clean) — and is direct *and* indirect (temporal
correlation), which restricting pretraining data alone cannot fix. Tabular FM **scalability** is
row-quadratic. Graph FMs lack **cross-domain feature harmonization** and a shared benchmark.
The big honest takeaway: **classical methods (GBDTs, xLSTMs) are not obsolete** — TiRex (xLSTM)
and tuned GBDT ensembles remain SOTA or near-SOTA in their niches, so the foundation-model story
here is real but partial.
