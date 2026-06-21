# Recommender Systems

The economic backbone of the internet — and now undergoing its own "generative" revolution,
with real production wins (not just offline metrics).

> **📦 Concept: "generative recommendation"** — instead of scoring each candidate item
> separately (the classic approach), the model *generates* the next item(s) as a sequence,
> like predicting the next word. This unlocks LLM-style scaling.

## Key directions & work

- **Meta HSTU** — reframes recommendation as sequence generation, exhibits **NLP-like scaling
  laws** where classic deep-learning recommenders plateau; large speedups at scale. ("Actions
  Speak Louder than Words.") [analysis](https://www.yuan-meng.com/posts/generative_recommendation/)
- **Kuaishou OneRec / OneRec-V2** — generative recommender **in production** at scale: +1.6%
  watch-time, opex cut to ~10.6% of the traditional pipeline. Concrete online validation.
  [arXiv:2502.18965](https://arxiv.org/abs/2502.18965)
- **Meta GR4AD (ads)** — documented *monotonic revenue scaling laws*: lift rising +2.13%→+4.43%
  as params scale. [arXiv:2602.22732](https://arxiv.org/abs/2602.22732) *[2026 — verify]*
- **Reasoning-augmented recsys** (OneRec-Think) — adds explicit reasoning but gains are so far
  *marginal* (+0.159% stay-time), an unproven frontier. [arXiv:2510.11639](https://arxiv.org/abs/2510.11639)

## State of research

**Best-performing now:** Generative recommenders (HSTU, OneRec) are **deployed in production**
with measured online lifts and NLP-like scaling — the clearest "real" signal in the area.

**Promising but unproven:** reasoning-augmented recommendation; fully LLM-native recommenders
over item catalogs.

**Open problems & weaknesses:** **Semantic-ID grounding** (how to make an LLM "speak" item IDs
without entanglement) is the recurring technical bottleneck. Reasoning's marginal gains may not
justify its cost. Most rigorous results come from a few large platforms (Meta, Kuaishou), so
external reproducibility is limited.
