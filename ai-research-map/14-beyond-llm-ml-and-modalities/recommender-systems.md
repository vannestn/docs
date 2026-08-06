# Recommender Systems

## In brief

- **What it is** — the machinery that decides what a feed, store, or streaming app shows you next.
  The classic design scores each candidate item separately through a multi-stage pipeline
  (retrieve → pre-rank → rank). The new "generative recommendation" wave instead treats the problem
  like language modeling: the model *generates* the next item(s) as a sequence, predicting the next
  item much as an LLM predicts the next word.
- **Why it's pursued** — recommenders are the economic backbone of the internet, and the classic
  approach plateaus: throwing more compute at it stops helping. Framing recommendation as sequence
  generation lets these systems scale with compute the way LLMs do, and lets one model replace a
  hand-tuned, multi-stage pipeline.
- **Potential impact** — measured production wins are already here (watch-time, view-duration, and
  ad-revenue lifts at billion-user scale), plus large cost savings from collapsing the pipeline into
  one model. The main open risks: these strong results come almost entirely from a few large
  platforms on proprietary traffic, and adding explicit "reasoning" has not yet clearly earned its
  compute cost at production scale.

> **📦 Concept: "generative recommendation"** — instead of scoring each candidate item
> separately (the classic approach), the model *generates* the next item(s) as a sequence,
> like predicting the next word. This unlocks LLM-style scaling.

## Key directions & work

- **Meta HSTU** — reframes recommendation as sequential transduction (a generative modeling
  problem), so model quality **scales as a power law of training compute** across three orders of
  magnitude (up to GPT-3/LLaMa-2 scale) where classic DLRMs plateau. A 1.5T-param HSTU GR
  improved online A/B metrics **+12.4%** and is deployed at billion-user scale; HSTU/M-FALCON
  speed up training+inference **10×–1000×**. ("Actions Speak Louder than Words.")
  [arXiv:2402.17152](https://arxiv.org/abs/2402.17152)
- **Kuaishou OneRec** — first end-to-end generative recommender that *replaces* the whole
  retrieve→pre-rank→rank cascade with one encoder-decoder model, deployed on Kuaishou's main page.
  Measured online A/B: **+1.68% total watch-time, +6.56% average view-duration** (OneRec-1B+IPA
  vs. the multi-stage system). [arXiv:2502.18965](https://arxiv.org/abs/2502.18965). The widely
  cited **opex ≈ 10.6% of the traditional pipeline** figure comes from the later *OneRec Technical
  Report* [arXiv:2506.13695](https://arxiv.org/abs/2506.13695), not the original KDD paper.
- **Kuaishou GR4AD (ads)** — generative recommender for large-scale advertising; documents
  *monotonic revenue scaling* on top of an existing DLRM stack: ablations lift online revenue from
  +1.92% (semantic-ID tokenization) through +2.80%/+3.86% (value-aware SL / RSPO) to **up to
  +4.32%** with the full system, with consistent gains from both model and inference-time scaling.
  Deployed in Kuaishou's ad system (400M+ users), <100ms latency, 500+ QPS/L20.
  [arXiv:2602.22732](https://arxiv.org/abs/2602.22732) *[2026 arXiv ID — confirmed on PDF]*
- **Reasoning-augmented recsys** (OneRec-Think) — adds explicit, in-text chain-of-thought to a
  generative recommender (Qwen-8B backbone); SOTA on public Amazon benchmarks (Beauty/Toys/Sports),
  but the *industrial* online gain is **marginal: +0.159% APP Stay Time** on Kuaishou — an
  unproven-at-scale frontier. [arXiv:2510.11639](https://arxiv.org/abs/2510.11639)

## How these systems actually work

- **Items → semantic-ID tokens.** Each item is quantized into a short sequence of discrete tokens
  (e.g. OneRec uses **3 codebook layers × 8192 codes**) from multi-modal embeddings, so the
  recommender can autoregress over items like a language model. RQ-VAE tokenization suffers an
  **"hourglass" code-collapse** problem; OneRec and GR4AD both switch to **balanced K-means /
  multi-granularity RQ-Kmeans** to spread codebook usage. ([arXiv:2502.18965](https://arxiv.org/abs/2502.18965),
  [arXiv:2602.22732](https://arxiv.org/abs/2602.22732))
- **Session-wise (not point-wise) generation.** OneRec generates a whole *session* (5–10 videos)
  per request rather than scoring candidates one-by-one, learning intra-list coherence/diversity
  directly instead of via hand-tuned rules. It uses a T5-style encoder-decoder with **sparse MoE**
  (24 experts, top-2 active → only ~13% of params active at inference) to scale capacity cheaply.
- **Preference alignment on top of the generator.** OneRec adds **Iterative Preference Alignment
  (IPA)**: a reward model scores beam-search samples, the best/worst become self-hard DPO pairs,
  and only **~1% of data** needs DPO to get most of the gain — IPA beats DPO/IPO/cDPO/rDPO/CPO/
  SimPO/S-DPO variants. GR4AD instead aligns to *list-wise* business value via **RSPO**
  (Ranking-Guided Softmax Preference Optimization, an NDCG-aware RL objective unified with
  value-aware supervised learning).

## State of research

**Best-performing now:** Generative recommenders (HSTU, OneRec, GR4AD) are **deployed in
production** with measured online lifts and demonstrated compute scaling — the clearest "real"
signal in the area. The reported lifts are platform-watch-time / revenue scale (HSTU +12.4%,
OneRec +1.68% watch-time, GR4AD up to +4.32% ad revenue), not just offline metrics.

**Promising but unproven:** reasoning-augmented recommendation (OneRec-Think) — strong on public
offline benchmarks but only **+0.159% online** so far; fully LLM-native recommenders over item
catalogs.

**Open problems & weaknesses (as the papers themselves argue):**

- **Semantic-ID grounding / codebook balance** is the recurring bottleneck — both OneRec and GR4AD
  spend significant design effort fighting code collapse and SID collisions (identical-content
  items needing distinct tokens).
- **Multi-objective weakness.** OneRec's authors explicitly note the model lifts watch-time but is
  **limited on interaction indicators (e.g. likes)** — its largest stated future-work item.
- **Reasoning's cost/benefit is unsettled.** OneRec-Think's online gain is marginal, and it needs
  a "Think-Ahead" architecture (offline-generate reasoning + first tokens, online-finalize) just to
  meet latency — explicit reasoning is not yet clearly worth its compute at production scale.
- **Reproducibility.** The rigorous online results come from a few large platforms (Meta, Kuaishou)
  on proprietary traffic; the strongest *public-benchmark* evidence (OneRec-Think) is on academic
  Amazon datasets, leaving an external-reproducibility gap.
