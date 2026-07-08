# Fairness, Bias & Sociotechnical AI

## In brief
- **What it is** — The research community (organized around the FAccT and AIES conferences) that studies how AI systems treat different groups of people unequally, how to measure that unfairness, and how to fix it. Crucially, it treats the model and the social system it operates in as one unit — because harm usually comes from the *interaction* (who deploys the model, on whom, and with what stakes), not from the model in isolation.
- **Why it's pursued** — AI now sorts résumés, scores loan applicants, and flags medical risk, so a biased model can quietly deny opportunities to whole groups at scale. The field exists to catch that bias — including subtle forms that hide beneath a model's polite surface — and to tell when a system is genuinely fair versus merely *appearing* fair.
- **Potential impact** — Done well, it produces auditing tools, evaluation standards, and legal requirements that keep deployed AI accountable. The key limitation is sobering: a mathematical impossibility result shows you cannot satisfy all reasonable fairness definitions at once, so choosing a fairness metric is an unavoidable value judgment, not a purely technical fix.

> **📦 Concept: "sociotechnical"** — studying the AI model *and* the social system it's
> embedded in together, because harms usually arise from the interaction, not the model alone.

## Key directions & work

### Bias measurement (and why surface fixes fail)
- **Covert dialect bias** — leading LLMs make harsher decisions about speakers of African
  American English (less-prestigious jobs, higher conviction/death-sentence rates) even when
  overt race prompts yield positive associations; the authors report the AAE stereotypes are
  *more negative* than any human stereotypes about Black Americans experimentally recorded
  since the 1930s. Human-feedback training (RLHF) and larger scale *mask* the surface (overt)
  bias but leave the covert dialect bias intact. Hofmann, Kalluri, Jurafsky, King — *Nature* 633:147–154 (2024).
  [Nature](https://www.nature.com/articles/s41586-024-07856-5) · [ORA](https://ora.ox.ac.uk/objects/uuid:4e0fe173-52f2-433d-8042-0ff941919401)
- **The evaluation protocol itself injects bias** — *side-by-side* (contrastive) comparison of
  intent-matched SAE/AAVE tweet pairs — the setting that mirrors real ranking/selection — *amplifies*
  covert dialect bias vs. rating each tweet independently (absolute). Using matched-guise probing
  with 1–5 Likert ratings on 12 traits over 2,019 paired tweets (LLaMA-3.1-8B, DeepSeek-V3, GPT-4o-mini):
  DeepSeek-V3's mean Cohen's *d* rises ~51.8% from absolute to contrastive prompting; effects are largest
  for *Unsophistication*, *Articulation*, *Incoherence*. Counterfactual-fairness fine-tuning partially
  mitigates (helps ~half of traits) but does not generalize. Overt dialect bias (labels stated) is
  comparable to or *larger* than covert bias and persists after safety alignment.
  Kondapally et al. — FAccT '26. [arXiv:2605.24384](https://arxiv.org/abs/2605.24384)
- **Résumé screening — "fairness is not enough"** — a two-experiment audit of 8 consumer AI platforms
  (13 model variants) on 3 fictitious résumés × 18 name variants (Black/Hispanic/White × gender). Bias is
  *contextual and intersectional*, not monotone: some models penalize any named (vs. redacted) résumé,
  others reward it; effect sizes span small to very large (|d| > 2.0). The paper's central contribution is
  the **"Illusion of Neutrality"**: Experiment 2 shows several seemingly-unbiased models are simply
  *incompetent* at the task — Grok-fast's discernment between matched and grossly-mismatched résumés is
  ω²≈0.00, and keyword-stuffed irrelevant résumés score ω²=0.99 (Grok) / 0.98 (LeChat-slow), i.e. ratings
  are driven by surface keywords, not substance. The "White names preferred 85% of the time" figure is the
  paper *citing prior work* (Wilson), not its own result. Webster — [arXiv:2507.11548](https://arxiv.org/abs/2507.11548)

### Generative-media harms
- **Prompt-debiasing can backfire** — a pilot benchmark (~500 images; DALL·E 3, Gemini Imagen 4.0, FLUX.1-dev,
  SDXL Turbo, Grok-2) over 5 occupations shows fairness-aware "ensure diversity" prompts shift demographics but
  *non-monotonically and model-specifically*: some models diversify, others *over-correct* into unrealistic
  uniformity (e.g. SDXL Turbo / Gemini pushed several roles to ~100% female or near-zero White representation),
  and some barely respond. Prompting alone gives inconsistent, unstable control — author conclusion: complementary
  model-level interventions are needed. Raza et al. — [arXiv:2509.00849](https://arxiv.org/abs/2509.00849)
- **Scale makes hateful content worse** — auditing alt-text with the `pysentimiento` hate classifier ("Hate
  Content Rate"), the LAION-2B-en curve lies strictly above LAION-400M for hateful/targeted/aggressive text.
  Even under the most conservative (Wilson-interval) comparison, HCR rises a normalized **12.26%** from 400M
  to 2B (not a casual "~12%"); two-sample t-tests across 160 shards confirm it (Cohen's *d* up to 2.64).
  NSFW image filtering alone leaves toxic alt-text behind (~0.24% hateful text remains in the "safe" subset).
  Birhane, Prabhu et al. — [arXiv:2311.03449](https://arxiv.org/abs/2311.03449)

### Sociotechnical evaluation & monoculture
- **Three-layer evaluation** (capability → human-interaction → systemic impact, each adding context) — most current
  evals only cover layer 1 (capability), so "three salient evaluation gaps" emerge: a *context gap* (layers 2–3
  under-evaluated), a *multimodal gap*, and gaps in who runs evals. Evaluation is framed as never value-neutral and
  always incomplete. Google DeepMind (Weidinger et al.) — [arXiv:2310.11986](https://arxiv.org/abs/2310.11986)
- **Algorithmic monoculture → outcome homogenization** — when decision-makers share components (training data or a
  foundation model), the *same* people get rejected everywhere ("systemic failure"). The paper introduces the first
  formal metric (observed systemic-failure rate ÷ expected rate) and a **component-sharing hypothesis**. On fairness
  benchmarks (German Credit, ACS PUMS, Adult), *sharing the exact same training data* reliably increases homogenization
  vs. merely identically-distributed data — but the relationship is imperfect (some "disjoint" cases tie or exceed
  "fixed"). Model-sharing results are *mixed*: training from **scratch** was surprisingly the most homogeneous in
  vision, so number-of-shared-parameters is not the right lens. **Individual-level homogenization consistently exceeds
  group-level** — group analyses (even intersectional) can miss systemic failures for particular individuals.
  Bommasani, Creel, Kumar, Jurafsky, Liang — NeurIPS 2022. [arXiv:2211.13972](https://arxiv.org/abs/2211.13972)
- **LLM-as-judge is itself biased** — the CALM framework defines **12** bias types and stress-tests 6 judges
  (ChatGPT, GPT-4-Turbo, GPT-4o, GLM-4, Claude-3.5, Qwen2) via automated "attack-and-detect" perturbations, scored by
  *Robustness Rate* (higher = better). Even frontier judges fail badly on specific biases: **position bias** robustness
  drops below 0.5 for most models once 3–4 answers are compared (i.e. >50% of judgments flip), and self-enhancement
  (preferring one's own outputs) and authority/verbosity biases persist. Claude-3.5 is generally most robust; no single
  model wins across all biases. Ye et al. — [arXiv:2410.02736](https://arxiv.org/abs/2410.02736)

### Pluralism & the impossibility result
- **Fairness impossibility** — separation (equal error rates) and sufficiency (equal calibration / predictive parity)
  cannot both hold except in degenerate cases (perfect prediction or equal base rates); the COMPAS debate was an
  instance of this. Green argues the dominant **"formal algorithmic fairness"** frame — fairness as a technical property
  of an isolated decision point — *reproduces* injustice, and proposes **substantive algorithmic fairness**: borrowing
  *relational* (reduce upstream disparities feeding the decision) and *structural* (reduce the downstream stakes of the
  decision) responses from egalitarian theory to "escape" the impossibility rather than just trading off metrics.
  Green, *Philosophy & Technology* 35:90 (2022). [arXiv:2107.04642](https://arxiv.org/abs/2107.04642)

### Regulation, auditing & "washing"
- **Auditing is moving from one-shot to continuous** — clinical fairness can *drift* post-deployment: a VA surgical-outcome
  study (2013–2023) shows fairness gaps emerge or widen over time and population-level retraining can *worsen* subgroup
  disparities, motivating surveillance-based "fairness drift" monitoring. *JAMIA* 32(5):845 (2025).
  [JAMIA 2025](https://academic.oup.com/jamia/article/32/5/845/8074959)
- **Audit/anti-discrimination law is fragmenting by jurisdiction** — NYC LL144 *mandates* a bias audit (and public
  disclosure) before using an automated employment decision tool. Illinois HB 3773 (effective Jan 1, 2026) *prohibits*
  discriminatory AI use in employment and requires notice, but — unlike NYC/Colorado — does **not** mandate a statistical
  bias audit. ⚠️ The EU AI Act and EEOC enforcement add further (differing) obligations; treat "auditing is uniformly
  legally mandated" as an over-simplification. [NYC LL144 (DCWP)](https://www.nyc.gov/site/dca/about/automated-employment-decision-tools.page)
- **The structural critique** — much "responsible AI" risks being **ethics/fairness washing**; Stanford HAI's 2026 AI
  Index documents capability outpacing accountability — **362** AI incidents logged in 2025 (up from 233 in 2024), a
  falling transparency index, and patchy responsible-AI benchmarking. [HAI 2026](https://hai.stanford.edu/ai-index/2026-ai-index-report/responsible-ai)

## State of research

**Best-performing now:** Disaggregated, intersectional, *individual-level* subgroup auditing with mandatory
error-rate reporting (monoculture work shows group-level metrics miss individual systemic failure);
causal/counterfactual fairness tests (name-swap, intent-matched dialect pairs); evaluating judges/protocols
themselves (CALM); the three-layer sociotechnical framing for organizing what to measure.

**Promising but unproven:** Counterfactual-fairness fine-tuning (helps some traits, doesn't generalize);
operationalized substantive/relational+structural fairness; continuous fairness-drift monitoring; model-level
(not prompt-level) debiasing for generative media.

**Open problems & weaknesses:** The *evaluator* is itself biased — side-by-side comparison amplifies dialect
bias, and LLM judges fail >50% on position bias; prompt-debiasing is non-monotonic and over-corrects;
an apparent absence of bias can be mere *incompetence* (the "Illusion of Neutrality"); interaction/systemic
harms (layers 2–3) are largely unmeasured and evaluation is never value-neutral; the fairness-impossibility
result makes metric choice an irreducibly normative act, pushing the field toward substantive/contextual
framings; scale reliably *worsens* dataset hate content; shared components homogenize outcomes so the same
individuals are excluded everywhere; and audit law is jurisdiction-fragmented and risks becoming performative.
