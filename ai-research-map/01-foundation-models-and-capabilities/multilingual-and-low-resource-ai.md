# Multilingual & Low-Resource AI

## In brief
- **What it is** — the effort to make AI work well in the world's many languages, not just English —
  especially "low-resource" languages that have little digital text to train on. It spans reasoning,
  speech recognition, translation, and whether a model shares a culture's actual values rather than a
  translated Western default. It is both a *capability* axis and a *fairness* one (see
  [13 · Fairness](../13-fairness-ethics-and-human-factors/fairness-bias-and-sociotechnical-ai.md)).
- **Why it's pursued** — most of humanity does not speak English, yet AI is far weaker outside it: on
  hard reasoning tasks the best-to-worst-language gap reaches ~24 points, and some African languages
  score under 1%. Closing this gap is the field's defining equity problem, and it also costs money —
  languages that split into more tokens are literally more expensive to serve (the "token tax").
- **Potential impact** — success means billions of people getting AI that understands their language
  and cultural context, with open speech models already reaching 1,600+ languages. The key risk is
  the reverse: baking English-centric benchmarks, tokenizers, and values into systems that then
  quietly underserve or misrepresent everyone else.

## Key directions & work

### The performance gap
- **Hard multilingual reasoning gaps reach ~24 points.** MMLU-ProX (29 languages, 11,829 parallel
  questions built on MMLU-Pro's 10-option, 5-shot-CoT format) reports high-resource vs low-resource
  gaps "of up to 24.3%"; some models score as low as 0.6% on certain African languages while
  exceeding 75% on Western European ones. DeepSeek-R1 leads at 75.2% avg, GPT-4.1 72.7%, DeepSeek-V3
  70.5%. [MMLU-ProX arXiv:2503.10497](https://arxiv.org/abs/2503.10497)
- **Reasoning helps low-resource most:** DeepSeek-R1 beats DeepSeek-V3 by +4.7% avg, with the
  largest gains on Wolof (+11.3) and Yoruba (+9.3); Qwen3-235B thinking mode reaches SOTA on Western
  European languages (English 80.7%, Italian 80.9%). Scaling also asymmetrically benefits the tail:
  Qwen3 4B→32B gains +12.6 on English but +20.5 on Wolof.
- **Translated benchmarks smuggle in Western cultural priors.** Global-MMLU finds **28% of MMLU
  questions require culturally-sensitive knowledge**, of which **86.5% is tagged Western** (next
  closest, South Asian, is 4%); geographic questions focus **84.9% on North America or Europe**
  (North America alone, 64.5%). Re-ranking models on the culturally-sensitive (CS) subset reshuffles
  the leaderboard far more than the culturally-agnostic (CA) subset (CS: avg 5.7 rank changes / 7.3
  position shifts vs CA: 3.4 / 3.7) — so blindly translated MMLU rewards Western-concept mastery.
  [Global-MMLU arXiv:2412.03304](https://arxiv.org/abs/2412.03304)

### The "token tax"
> **📦 Concept: token tax** — subword tokenizers split morphologically complex, low-resource
> languages into more tokens per word ("fertility"), so the same content needs more tokens — costing
> more, running slower, and (because of quadratic attention) compounding into 4–25× higher compute.

- **The Token Tax** evaluates 10 LLMs on **AfriMMLU** (9,000 MCQA items, 5 subjects, 16 African
  languages) and shows fertility (tokens/word) **reliably predicts accuracy**: linear-regression
  slopes run **−0.08 to −0.18** (each extra token/word costs 8–18 accuracy points), and fertility
  explains **20–50% of accuracy variance**. African languages trail English by **~25 points** on
  average; reasoning models (DeepSeek, o1) narrow this by **8–12 points** but do not close it.
  [arXiv:2509.05486](https://arxiv.org/abs/2509.05486)
- **Economic bite:** because training cost scales O(n²) in sequence length, doubling fertility
  **quadruples training cost** (e.g. Llama-3.1-405B: $105M in English vs $420M at double fertility)
  and **doubles inference latency**. The paper calls for morphology-aware tokenization, fairer
  pricing, and multilingual benchmarks — not a specific algorithm.
- **Proposed fix:** *parity-aware BPE* changes the merge rule to maximize compression for the
  currently worst-compressed language, equalizing per-language token counts at near-zero global
  compression cost and matching downstream quality. [arXiv:2508.04796](https://arxiv.org/abs/2508.04796)
  ⚠️ Not yet adopted by any frontier model (unverified).

### Speech & translation breadth
- **Meta Omnilingual ASR** (open-source, Apache-2.0) — **1,600+ languages** out of the box (500+
  never served by any ASR system before), via 7B-param self-supervised pre-training + an
  encoder–decoder, LLM-inspired decoder. CER < 10 for 78% of the 1,600+ languages.
  [arXiv:2511.09690](https://arxiv.org/abs/2511.09690)
- **Zero-shot in-context extension to ~5,400 languages:** a speaker supplies a few audio–text pairs
  at inference time and the model transcribes the new language without retraining — reframing
  coverage from a fixed release inventory into a community-extensible framework. (Context examples
  are retrieved with the SONAR encoder; zero-shot quality still trails fully-trained systems.)
  [Meta blog](https://ai.meta.com/blog/omnilingual-asr-advancing-automatic-speech-recognition/)

### Sovereign / regional models
- Regional stacks are maturing across **African** (Masakhane; AfriMMLU/IrokoBench evals — the latter
  introduced by [arXiv:2509.05486](https://arxiv.org/abs/2509.05486)'s data source), **Indian**,
  **Southeast Asian**, and **Arabic** ecosystems. ⚠️ Specific products (Sarvam's ~120B sovereign LLM,
  SEA-LION, Jais, Fanar) are not covered by the primary sources here.
- Where measured, **regional specialists do not automatically win on cultural alignment:**
  MENAValues finds Arabic-centric models (Fanar, ALLaM) do **not** outperform general-purpose models
  on MENA value alignment. [arXiv:2510.13154](https://arxiv.org/abs/2510.13154)

### Cultural alignment
- **MENAValues** (864 questions from World Values Survey Wave 7 + Arab Opinion Index 2022, 16 MENA
  countries, 7 models) surfaces three failure modes. [MENAValues arXiv:2510.13154](https://arxiv.org/abs/2510.13154)
  - **Cross-lingual value shift:** identical questions yield contradictory answers in English vs the
    native language (Arabic/Persian/Turkish) — value representation is unstable, not consistent moral
    reasoning.
  - **Reasoning-induced degradation:** prompting models to reason *before* answering **lowers**
    cultural-alignment (NVAS) scores in most settings — e.g. −6.96 for Llama-3.1, −6.12 for Fanar,
    −3.52 for Mistral.
  - **Logit leakage:** models verbally refuse sensitive questions while their internal token
    probabilities reveal high-confidence hidden preferences (refusal-masked leakage rates up to
    47.5% for Fanar).
  - Notably, **Arabic-specialist models (Fanar, ALLaM) do not beat general-purpose models** on
    alignment, and PCA shows models cluster by *language* (linguistic essentialism) rather than by
    genuine cultural distinctions.

### Data scarcity
- **Machine-translated pretraining works.** *TransWebLLM* (1.3B) is trained from scratch on
  **TransWebEdu** — FineWeb-Edu translated into 9 languages with NLLB-200-1.3B (sentence-level),
  **1.7T tokens** — and matches or beats Llama-3.2, Qwen2.5 and Gemma on 9 non-English reasoning
  tasks despite an order of magnitude less data; the biggest gains are on Swahili and Welsh (ranked
  #1 among baselines). Adding <5% in-domain data sets new SOTA in Arabic, Italian, Indonesian,
  Swahili, and Welsh. [arXiv:2502.13252](https://arxiv.org/abs/2502.13252)
  - Even a small (45B-token) general-web + cooldown addition lifts French linguistic proficiency
    ~+10 points and Indonesian cultural reasoning (COPAL-ID) ~+8 points — translationese in the long
    tail is real but tractable.
- **ATLAS** runs the largest multilingual scaling-laws study to date (774 experiments, 10M–8B params,
  400+ training languages) and models the **curse of multilinguality** (adding languages degrades
  per-language quality) directly: fitting `L(K,N,Dₜ)` over training languages K gives capacity
  exponent φ≈0.11 and data exponent ψ≈−0.04 — i.e. a **mild, capacity-driven** curse *tempered by
  positive transfer*, eased more by scaling model size N than data D. Expanding language coverage by
  a factor r requires ~`C·r^0.97` more compute. [arXiv:2510.22037](https://arxiv.org/abs/2510.22037)
  - Its 38×38 cross-lingual transfer matrix finds **English is the best source language for many
    targets** (top-5 for 19/30), but shared **script** then language family predict transfer best,
    and transfer is often **asymmetric** (A→B ≠ B→A; Pearson r=−0.11 across all pairs).

## State of research

**Best-performing now:** Omnilingual ASR (1,600+ languages, open-source) for speech breadth; strong
parallel evals that separate breadth from difficulty (Global-MMLU's CS/CA split, MMLU-ProX's
reasoning-focused 29-language parallel set, AfriMMLU for African MCQA); translation-pretrained small
models (TransWebLLM) that punch above their data budget; and reasoning models (DeepSeek-R1,
Qwen3-think) that consistently top low-resource leaderboards.

**Promising but unproven:** zero-shot ASR extension toward ~5,400 languages (quality still trails
trained systems); parity-aware tokenizers (⚠️ no confirmed frontier adoption); machine-translated +
small in-domain pretraining as a cold-start recipe for the medium/low-resource tail (validated only
at 1.3B params — ATLAS leaves open whether benefits hold at 70B+).

**Open problems & weaknesses:**
- **The gap persists** — up to ~24 points on hard multilingual reasoning (MMLU-ProX), ~25 points on
  African MCQA (AfriMMLU); some African languages score <1%.
- **The token tax** is quantified, not just asserted: fertility predicts accuracy (slopes −0.08 to
  −0.18) and compounds into 4–25× compute cost via quadratic attention.
- **Cultural values skew Western, and reasoning can worsen alignment** (MENAValues'
  reasoning-induced degradation + logit leakage); language-based clustering risks linguistic
  essentialism.
- **Benchmarks themselves carry Western priors** (28% of MMLU is culturally sensitive, 86.5% of that
  Western) — translated evals reward the wrong thing and reshuffle rankings.
- **Text** translation/modeling for the 1,000+ language tail still lags **speech** breadth; the
  curse of multilinguality is real but capacity-driven and weakening at scale (ATLAS).
