# Multilingual & Low-Resource AI

Extending capability beyond English — and the persistent equity gap that remains the field's
defining open problem. This is both a *capability* axis and a *fairness* one (see
[13 · Fairness](../13-fairness-ethics-and-human-factors/fairness-bias-and-sociotechnical-ai.md)).

## Key directions & work

### The performance gap
- **Frontier models still show 24–30 point English-vs-low-resource gaps** — e.g., Qwen2.5-72B
  ~70% English vs ~40% Swahili on multilingual MMLU. [Global-MMLU arXiv:2412.03304](https://arxiv.org/abs/2412.03304)
- **Translated benchmarks smuggle in Western cultural priors** (~28% of MMLU needs culturally
  sensitive knowledge); MMLU-ProX confirms sharp drops on hard multilingual reasoning. [MMLU-ProX](https://arxiv.org/abs/2503.10497)

### The "tokenizer tax"
> **📦 Concept: tokenizer tax** — BPE tokenizers split non-Latin scripts into many more tokens
> (up to ~15× for Burmese), so the same content costs more, runs slower, and is modeled worse —
> an infrastructure-level bias against those speakers.

- Quantified in "The Token Tax" ([arXiv:2509.05486](https://arxiv.org/html/2509.05486v1)); proposed
  fixes (parity-aware BPE, MAGNET) exist but **no frontier model has adopted them** as of mid-2026.

### Speech & translation breadth
- **Meta Omnilingual ASR** — 1,600+ languages (500+ never transcribable before), with zero-shot
  extension toward 5,400+. [arXiv:2511.09690](https://arxiv.org/abs/2511.09690). **Omnilingual
  SONAR** extends cross-lingual+cross-modal embeddings to thousands of languages.

### Sovereign / regional models
- **African** (Masakhane; AfroBench/IrokoBench evals), **Indian** (Sarvam, selected for a ~120B
  sovereign LLM; Krutrim), **Southeast Asian** (SEA-LION), **Arabic** (Jais 2, Qatar's Fanar 2.0
  with Islamic-values alignment). All mature the regional stack but still trail the global frontier
  on broad reasoning.

### Cultural alignment
- **Values are unstably encoded across languages** — models answer differently in English vs
  Arabic/Persian/Turkish, and **chain-of-thought can *degrade* cultural alignment** by activating
  Western defaults. [MENA Values arXiv:2510.13154](https://arxiv.org/abs/2510.13154)

### Data scarcity
- **Machine-translated / synthetic pretraining** is the dominant remedy and increasingly rivals
  native text (with translationese risk in the long tail). [arXiv:2502.13252](https://arxiv.org/pdf/2502.13252)
- **ATLAS** multilingual scaling laws argue the "curse of multilinguality" is largely a
  capacity/data-mixture problem that *weakens at scale* — a hopeful, contested view. [arXiv:2510.22037](https://arxiv.org/html/2510.22037)

## State of research

**Best-performing now:** Omnilingual ASR/SONAR (speech & embedding breadth); strong evals
(Global-MMLU, MMLU-ProX, AfroBench, IrokoBench); leading sovereign models (Jais 2, Sarvam-M,
SEA-LION) for their regions.

**Promising but unproven:** zero-shot extension to 5,000+ languages; parity-aware tokenizers (no
frontier adoption); India's 120B sovereign model; synthetic pretraining for the true long tail.

**Open problems & weaknesses:** the **24–30 point equity gap** persists; the **tokenizer tax**
imposes real economic cost on non-Latin-script users; **cultural values skew Western** and
reasoning can worsen it; **benchmarks themselves carry Western priors**; and **text** translation
for the 1,000+ language tail lags the **speech** progress.
