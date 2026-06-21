# Fairness, Bias & Sociotechnical AI

The FAccT/AIES research community: measuring and mitigating bias, auditing deployed systems,
and the structural critique of "responsible AI."

> **📦 Concept: "sociotechnical"** — studying the AI model *and* the social system it's
> embedded in together, because harms usually arise from the interaction, not the model alone.

## Key directions & work

### Bias measurement (and why surface fixes fail)
- **Covert dialect bias** — leading LLMs make harsher decisions about speakers of African
  American English (less-prestigious jobs, higher conviction/death-sentence rates) even when
  overt race prompts yield positive associations. RLHF *masks* but doesn't remove bias.
  Hofmann, Kalluri, Jurafsky, King — *Nature* 2024. [ORA](https://ora.ox.ac.uk/objects/uuid:4e0fe173-52f2-433d-8042-0ff941919401)
- **The evaluation protocol itself injects bias** — side-by-side comparison (the standard
  LLM-as-judge setup) *amplifies* dialect bias vs. independent rating. [arXiv:2605.24384](https://arxiv.org/html/2605.24384v1) *[2026 — verify]*
- **Résumé screening** — embedding/LLM screeners favor White-associated names ~85% of the
  time; parity-only audits miss intersectional competence gaps. [arXiv:2507.11548](https://arxiv.org/pdf/2507.11548)

### Generative-media harms
- **Debiasing can backfire** — prompt-debiasing text-to-image occupations is *non-monotonic*
  (some roles become *more* stereotyped). [arXiv:2509.00849](https://arxiv.org/pdf/2509.00849)
- **Scale makes it worse** — Hate Content Rate rose ~12% from LAION-400M to LAION-2B. Birhane
  et al. — [arXiv:2311.03449](https://arxiv.org/abs/2311.03449)

### Sociotechnical evaluation & monoculture
- **Three-layer evaluation** (capability / human-interaction / systemic) — most evals only
  cover layer 1. Google DeepMind (Weidinger et al.) — [arXiv:2310.11986](https://arxiv.org/abs/2310.11986)
- **Algorithmic monoculture** — shared models cause *outcome homogenization* (the same people
  rejected everywhere); individual harm exceeds group harm. Bommasani et al. — [arXiv:2211.13972](https://arxiv.org/abs/2211.13972)
- **LLM-as-judge is itself biased** — frontier judges exceed 50% error on advanced bias tests
  (position, verbosity, self-preference biases). [arXiv:2410.02736](https://arxiv.org/pdf/2410.02736)

### Pluralism & the impossibility result
- **Fairness impossibility** — competing fairness definitions can't all hold except in trivial
  cases; the field moved to *substantive/contextual* fairness and **pluralistic alignment**
  (represent the distribution of values rather than pick one). [Substantive fairness arXiv:2107.04642](https://arxiv.org/pdf/2107.04642)

### Regulation, auditing & "washing"
- **Auditing is now legally mandated** (EU AI Act, NYC LL144, Illinois HB 3773, EEOC, 2026)
  and moving to *continuous* "fairness drift" monitoring. [JAMIA 2025](https://academic.oup.com/jamia/article/32/5/845/8074959)
- **The structural critique** — much "responsible AI" is **ethics/fairness washing**;
  Stanford HAI's 2026 Index documents "capability without accountability" (362 AI incidents
  logged in 2025). [HAI 2026](https://hai.stanford.edu/ai-index/2026-ai-index-report/responsible-ai)

## State of research

**Best-performing now:** Disaggregated, intersectional subgroup auditing with mandatory
error-rate reporting; causal/counterfactual fairness tests (name-swap, dialect pairs);
calibration-corrected LLM-judge evaluation; the three-layer sociotechnical framing.

**Promising but unproven:** Neuron-level/activation-steering debiasing, operationalized
pluralistic alignment, continuous fairness-drift monitoring.

**Open problems & weaknesses:** Template-based bias metrics are gameable and lack construct
validity; debiasing is non-monotonic and backfires; the *evaluator* (LLM-judge, side-by-side)
is itself biased; interaction/systemic harms (layers 2–3) are largely unmeasured; audits risk
becoming performative; fairness impossibility means metric choice is an irreducibly political
act; non-Western/multilingual performance lags badly.
