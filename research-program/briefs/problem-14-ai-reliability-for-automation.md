# Problem 14 — AI Reliability & Correctness for Automation

*The layer that decides whether AI can run **unsupervised** in settings where a wrong or malformed output is a real incident — compliance pipelines, data reconciliation, real-time decisions, machine-to-machine execution, agents nobody is watching. Grounded in the internal briefs [eval-04 (methodology & standards)](eval-04-methodology-and-standards.md), [problem-11 (agent architectures)](problem-11-agent-architectures.md), [problem-09 (agent security & auth)](problem-09-agent-security-auth.md), and the map doc [Agents & Tool Use](../../ai-research-map/01-foundation-models-and-capabilities/agents-and-tool-use.md), then web-verified beyond them. Researched 2026-07-08. Every external claim links to a page I opened; "⚠️" marks inferred or unverified items.*

> **How to read this brief.** "Reliability" here is a *deployment* property, not a *capability* one: a model can be highly accurate on a benchmark and still be unusable in an unsupervised pipeline because its failures are unpredictable, silent, or malformed. Where the text names a paper/tool/term, a plain-language gloss follows in parentheses or an em-dash. The trigger for this brief is [**TypeSafe AI**](https://typesafe.ai/) — a pre-launch SF lab whose whole thesis is that reliability must be *built into the model*, not *bolted on after* — which makes the central research question of this domain (build-in vs. bolt-on) also a live commercial bet.

---

## The problem, concretely — what goes wrong when AI runs unsupervised

The unifying fact ([Princeton, "Towards a Science of AI Agent Reliability", arXiv:2602.16666](https://arxiv.org/abs/2602.16666), Rabanser, Kapoor, Kirgis, Liu, Utpala, Narayanan): **accuracy is about the *rate* of failures; reliability is about the *nature* of failures.** Rising benchmark accuracy has not produced reliable agents, and "compressing agent behavior into a single success metric obscures critical operational flaws." Their headline framing: autonomous operation in high-stakes contexts needs **3–5 "nines" (99.9%–99.999%)** before reliability stops being the binding constraint, and current agents are nowhere near it (verified against the [PDF](https://arxiv.org/pdf/2602.16666) and the authors' [plain-language write-up](https://www.normaltech.ai/p/new-paper-towards-a-science-of-ai)). That gap is the whole domain.

The measurable sub-problems (each is a place you can put a number):

- **Non-determinism even at temperature 0.** Same input, different output — from floating-point arithmetic and batch composition, not sampling. Reported accuracy swings **up to ~15% across runs** ([reliability survey / normaltech synthesis](https://www.normaltech.ai/p/new-paper-towards-a-science-of-ai); ⚠️ the 15% figure is a secondary synthesis, not yet traced to a single primary). For an unsupervised pipeline this means the *same document* can pass compliance one hour and fail the next.
- **Silent failures / silent filtering.** The agent returns a plausible, well-formed answer that is wrong or incomplete, with no error raised — the worst failure mode for automation because nothing downstream knows to stop. Named "catastrophically unsafe" in the authorization-scope context ([Partial Evidence Bench, arXiv:2605.05379](https://arxiv.org/abs/2605.05379), single author — see [problem-09](problem-09-agent-security-auth.md)); the general form is broader than auth.
- **Spec / schema violation.** The output doesn't parse, doesn't match the schema, or violates a business constraint the downstream system assumed. This is where **structured / "type-safe" generation** lives (below).
- **Hallucination inside a pipeline.** The researcher's own published territory (LLM-as-judge RAG-hallucination detection): a fabricated field value flows into a database, a ledger, or an API call with no human to catch it.
- **Cascading agent errors over horizons.** Small per-step error rates compound; τ-bench's **pass^k** (probability all k independent trials succeed) shows GPT-4o falling to **~25% pass^8** on a retail task — solving the *same* task 8× in a row only a quarter of the time ([τ-bench, arXiv:2406.12045](https://arxiv.org/abs/2406.12045); [Sierra](https://sierra.ai/blog/benchmarking-ai-agents)). "[Agent Meltdowns](https://arxiv.org/pdf/2605.19149)" formalizes the point where a long run collapses.
- **Latency non-determinism.** In real-time / machine-to-machine settings, a correct answer that arrives too late is a failure — a dimension most eval work ignores entirely (this is explicitly part of TypeSafe's "correctness *and* latency are non-negotiable" framing).

The reliability-vs-accuracy distinction is the load-bearing idea: it is *why* this is a distinct research domain and not a sub-case of "make the model smarter."

---

## The research field around it — sub-areas + maturity

Six sub-areas, roughly ordered by how settled the *science* is:

**1. Reliability measurement / metrics (the meta-layer) — young but crystallizing.**
The anchor is [Princeton's 12-metric framework](https://arxiv.org/abs/2602.16666): reliability decomposed into four dimensions — **consistency** (reproducible outcomes across identical runs), **robustness** (holding up under degraded/perturbed conditions), **predictability/calibration** (confidence that means something), and **safety** (failures stay bounded) — borrowed from safety-critical engineering, with an interactive dashboard. [ReliabilityBench (arXiv:2601.06112)](https://arxiv.org/html/2601.06112v1) — *single author, Aayush Gupta at GoHighLevel* — operationalizes three of these under "production-like stress": pass^k **consistency**, **robustness** to paraphrased/reordered instructions, and **fault tolerance** to infra failures (timeouts, rate limits, schema drift); it finds agents drop **96.9% → 88.1%** under medium perturbation, that simpler ReAct beats complex Reflexion under stress, and that GPT-4o cost **82× more** than Gemini 2.0 Flash for a −0.6% reliability difference. Maturity: **the vocabulary is <1 year old and there is no agreed standard benchmark** — this is the gap-rich frontier.

**2. Structured / constrained / schema-guaranteed ("type-safe") generation — mature tooling, contested value.**
The engineering is well-developed: **constrained decoding** masks, at each token, any continuation that would break a grammar/regex/JSON-schema, *guaranteeing* the output parses. Canonical tools:
- **[Outlines / dottxt (.txt)](https://github.com/dottxt-ai/outlines)** — finite-state-machine-based constrained decoding; "guarantees the output conforms strictly to predefined regular expressions or context-free grammars" ([AWS writeup](https://aws.amazon.com/blogs/machine-learning/generate-structured-output-from-llms-with-dottxt-outlines-in-aws/)). 2.5M+ downloads.
- **[Instructor](https://github.com/567-labs/instructor)** (Jason Liu) — wraps provider SDKs with a Pydantic `response_model` and **reask-and-retry on validation failure** (a bolt-on validation loop, not decode-time enforcement); ~3M monthly downloads. Its thesis: "LLM problems aren't LLM problems — they're data, process, or measurement problems" ([Latent Space](https://www.latent.space/p/instructor)).
- **[Guidance](https://github.com/guidance-ai/guidance)**, **XGrammar**, **llama.cpp grammars**, and provider **JSON-mode / structured-output APIs** (OpenAI, Gemini) — the rest of the ecosystem, benchmarked head-to-head below.
Maturity: **shipping and widely used**, but *whether it helps task correctness* is genuinely disputed (sub-area 5).

**3. Validation / guardrails (bolt-on) — commercially crowded.**
- **[Guardrails AI](https://github.com/guardrails-ai/guardrails)** — wraps LLM calls with validators (PII, toxicity, JSON schema, custom rules) plus auto-reask; 100+ community validators in its [Hub](https://guardrailsai.com/hub).
- **[NVIDIA NeMo Guardrails](https://github.com/NVIDIA-NeMo/Guardrails)** — programmable "rails" (input/dialog/retrieval/execution/output) written in the **Colang** DSL; includes self-check, fact-check, and hallucination-detection rails, deployable as a microservice.
This is the literal "bolt-on" school that TypeSafe defines itself against.

**4. Reliability engineering for agents — retries, verifiers, fault tolerance.**
Overlaps heavily with [problem-11](problem-11-agent-architectures.md): pass^k and decay-curve statistics ([Beyond pass@1, arXiv:2603.29231](https://arxiv.org/abs/2603.29231)), self-consistency (sampling many answers and taking the agreement — correct statements recur, hallucinations vary), and **verifier** models that check an output before it is committed. [MARCH (arXiv:2603.24579)](https://arxiv.org/html/2603.24579) (multi-agent reinforced self-check) reports accuracy 55.20 → 74.93 on STEM. Fault-tolerance/state-machine hybrids ("LLM for language understanding, state machine for everything else") are a recurring production pattern ([buildmvpfast](https://www.buildmvpfast.com/blog/ai-agents-without-llm-rule-engine-state-machine-2026); ⚠️ practitioner blog, not peer-reviewed).

**5. Structured-output *correctness* — the live scientific fight.**
Constraining format is not free. **[Let Me Speak Freely? (arXiv:2408.02442)](https://arxiv.org/abs/2408.02442)** (Tam et al.) found "a significant decline in LLMs' reasoning abilities under format restrictions," worse with stricter constraints. **[CRANE (arXiv:2502.09061, ICML 2025)](https://arxiv.org/abs/2502.09061)** (UIUC) explained *why* (over-restrictive grammars distort the output distribution) and recovered up to +10 points by letting the model reason freely, then constraining. **[The Format Tax (arXiv:2604.03616)](https://arxiv.org/abs/2604.03616)** (Lee, D'Antoni, Berg-Kirkpatrick) measures the penalty across MATH/GPQA/WritingBench. Counter-camp: **[JSONSchemaBench (arXiv:2501.10868)](https://arxiv.org/html/2501.10868v1)** (Microsoft/EPFL; 10,000 real schemas) shows constrained decoding beats unconstrained on *schema compliance* and can be ~50% faster — but exposes brutal engine differences (Guidance 94–100% compliance vs. **Outlines dropping to 6–23%** on complex schemas due to timeouts; XGrammar fast but *under-constrains*). Maturity: **actively contested — the field has not settled whether structured output helps or hurts *task* correctness**, which is exactly the measurable wedge below.

**6. Verified / formal approaches — early, mostly outside pure LLM work.**
Grammar guarantees are the deployed form of "provable correctness." True formal verification of LLM behavior (proving properties of outputs, not just syntax) is nascent; the practical near-term is *deterministic structural guarantees + runtime validation*, not theorem-proving.

---

## Who does this work — orgs AND individuals

**Startups (the commercial center of gravity):**

| Company | What it does | Stage / funding | Notes |
|---|---|---|---|
| [**TypeSafe AI**](https://typesafe.ai/) (the trigger) | Frontier lab; model **"System1"** for **machine-to-machine execution** — "reliability in environments where correctness and latency are non-negotiable"; reliability **embedded in the model, not bolted on** | **Founded 2024, SF, pre-launch.** In **AWS Generative AI Accelerator** (cohort start ~2024-09-17 per [CB Insights](https://www.cbinsights.com/company/typesafe-ai/financials)); **no disclosed priced round** as of this writing ⚠️. Founders: **Diogo Almeida** (CEO, ex-OpenAI ~5yr / ex-Google Brain, InstructGPT co-inventor), **Erik Gafni** (CTO), **Sasha Sheng** (COO, ex-Meta FAIR) — [team page](https://typesafe.ai/team) | **Correcting the aggregator noise:** Tracxn's "founded 2011 / unfunded" is wrong — the company itself, LinkedIn, and CB Insights all put founding at 2024 with SF HQ and accelerator backing. Its stated vision: ">99% of the consumers of AI will themselves be Code/Software" |
| [**dottxt (.txt)**](https://github.com/dottxt-ai/outlines) | Structured generation; maintains **Outlines** | **$11.9M total** ($3.2M pre-seed Elaia 2023 + $8.7M seed EQT Ventures 2024) — [TechCrunch](https://techcrunch.com/2024/10/17/with-11-9-million-in-funding-dottxt-tells-ai-models-how-to-answer/) | Paris; founders Rémi Louf, Dan Gerlanc, Brandon Willard; OpenAI/Cohere cited as early users |
| [**Guardrails AI**](https://guardrailsai.com/) | Bolt-on validation + validator Hub | **$7.5M seed** (Zetta, Factory, Bloomberg Beta, Pear, GitHub Fund); founded 2023 — [startupintros](https://startupintros.com/orgs/guardrails-ai) | Founder Shreya Rajpal (ex-Drive.ai, Apple) |
| [**567 Labs / Instructor**](https://github.com/567-labs/instructor) | Instructor library; consulting | small/indie (Jason Liu, sabbatical at South Park Commons) | The "one influential person + a library" model |
| [**Cleanlab**](https://cleanlab.ai/) | Data/output quality; **Trustworthy Language Model** (confidence scores for LLM outputs) | VC-backed (MIT spinout) | Published a solo-shaped audit — see exemplars |

**Labs / big-company teams:** **NVIDIA** (NeMo Guardrails); **Microsoft Research** (JSONSchemaBench — Horvitz, Nori, Moskal); **Princeton SAgE/CITP** (Kapoor, Narayanan — the reliability *science*, continuous with the [problem-11 HAL line](problem-11-agent-architectures.md)); provider structured-output APIs (OpenAI, Google, Anthropic).

**Academics:** UIUC Focal Lab (CRANE — Banerjee, Suresh, Ugare, Misailovic, Singh); UCSD (The Format Tax — D'Antoni, Berg-Kirkpatrick); the Tam et al. group (Let Me Speak Freely).

**Individuals / solo:** **Aayush Gupta** (ReliabilityBench, single-author, industry); **Jason Liu** (Instructor); **Krti Tallam** (Partial Evidence Bench, single-author — the auth-scope reliability slice); Cleanlab's benchmark-audit author. **How outsiders contribute:** publish a reliability benchmark or an audit on arXiv (ReliabilityBench and Partial Evidence Bench are single-author, API-scale existence proofs); contribute validators to the Guardrails Hub or grammars to Outlines/XGrammar; extend Princeton's open reliability dashboard; ship an open eval harness.

---

## Published exemplars — 4–8 works/tools, favoring small teams

1. **[Towards a Science of AI Agent Reliability (arXiv:2602.16666)](https://arxiv.org/abs/2602.16666)** — Princeton. The field's naming/framing paper: 12 metrics × 4 dimensions, the accuracy-vs-reliability distinction, the 3–5-nines bar, plus an open dashboard. This is the citation anchor the way "We Need a Science of Evals" anchors [eval-04](eval-04-methodology-and-standards.md).
2. **[ReliabilityBench (arXiv:2601.06112)](https://arxiv.org/html/2601.06112v1)** — **single author, industry.** Consistency/robustness/fault-tolerance under production stress; concrete numbers (96.9→88.1 under perturbation; 82× cost gap at equal reliability). Proof one practitioner can define a reliability benchmark.
3. **[JSONSchemaBench (arXiv:2501.10868)](https://arxiv.org/html/2501.10868v1)** — Microsoft/EPFL. 10,000 real schemas; the definitive head-to-head of constrained-decoding engines (compliance, coverage, speed) — and the reason "just use structured outputs" is not a settled answer.
4. **[Let Me Speak Freely? (arXiv:2408.02442)](https://arxiv.org/abs/2408.02442)** — Tam et al. The paper that made "format restrictions hurt reasoning" a citable finding; the opening shot of the format-tax debate.
5. **[CRANE (arXiv:2502.09061)](https://arxiv.org/abs/2502.09061)** — UIUC, ICML 2025, [code](https://github.com/uiuc-focal-lab/CRANE). Theory for *why* constraints hurt + a fix (+10 pts). The rigorous middle of the debate.
6. **[The Format Tax (arXiv:2604.03616)](https://arxiv.org/abs/2604.03616)** — UCSD, [code](https://github.com/ivnle/the-format-tax). Systematic quantification of the constraint penalty across reasoning benchmarks — a clean small-team measurement study.
7. **["LLM Structured Output Benchmarks are Riddled with Mistakes"](https://cleanlab.ai/blog/structured-output-benchmark/)** — Cleanlab. A *meta*-audit: the structured-output benchmarks themselves have errors. Exactly the "audit the measurement" move the profile's LLM-as-judge work embodies, at blog-post scale.
8. **[Outlines](https://github.com/dottxt-ai/outlines) / [Instructor](https://github.com/567-labs/instructor)** — the two reference libraries; existence proof that a single durable tool becomes field infrastructure (and, for dottxt, a fundable company).

---

## Where the gaps are — specific, named, source-grounded

Written as opportunity deep-dives. Fit/Difficulty labels are the compiler's estimates, to be pressure-tested, not measured.

### Gap 1 — There is no standard reliability benchmark for *unsupervised automation*
**Context.** Princeton named the four dimensions and ReliabilityBench operationalized three under stress, but both are <1 year old, use different metric sets, and neither is an accepted standard. Critically, **existing reliability work still targets *agent tasks* (tool-use, coding), not the *pipeline/machine-to-machine* setting** TypeSafe is built for — high-throughput, schema-bound, latency-sensitive, no human in the loop. There is no "AILuminate for unsupervised pipeline reliability."
**Approaches.** (a) Define a narrow pipeline-reliability construct — e.g. "structured extraction under adversarial/degraded inputs" — with a fixed dataset and a metric suite (schema-validity rate, *silent*-error rate, run-to-run consistency, latency variance). (b) Extend ReliabilityBench's stress axes to a non-agent, batch-extraction workload. *Feasibility:* high — API + laptop; the construct definition is the hard part. *Challenges:* getting a new benchmark adopted (the perennial risk from [eval-04 Gap 9](eval-04-methodology-and-standards.md)).
**Fit: very high · Difficulty: low–medium.** The single most profile-aligned gap.

### Gap 2 — Structured-output *correctness* vs. *task* correctness is unresolved
**Context.** Let Me Speak Freely says format hurts reasoning; JSONSchemaBench says constrained decoding helps *compliance*; CRANE says the tradeoff is an artifact of *how* you constrain. Nobody has a clean, current, decision-useful answer to the practitioner's actual question: **"for my task and model, does forcing structured output raise or lower the rate of *correct* answers, and by how much?"**
**Approaches.** A cross-model, cross-method study that separates **schema-validity** (does it parse) from **task-correctness** (is it right), across free-form vs. JSON-mode vs. constrained-decoding vs. reason-then-constrain (CRANE-style), on extraction/classification tasks that matter for automation. Report where each method dominates. *Feasibility:* high — pure API-behavioral, the researcher's exact method shape. *Challenges:* engine setup variance (JSONSchemaBench shows Outlines vs. XGrammar behave wildly differently — control for it).
**Fit: very high · Difficulty: low–medium.** Cleanest "measure the thing everyone argues about" study in the brief.

### Gap 3 — "Build reliability IN vs. bolt it ON" has no empirical head-to-head
**Context.** This is TypeSafe's founding claim and the domain's defining debate, yet it is argued on vibes. Bolt-on (Instructor reask, Guardrails validators, NeMo rails) vs. decode-time-enforced (Outlines/XGrammar) vs. model-native reliability (TypeSafe's pitch — untestable until they ship ⚠️) have never been compared on the same task under matched cost/latency.
**Approaches.** Take one automation task; compare a plain model, a reask-loop (Instructor), a validator wrapper (Guardrails), and constrained decoding (Outlines) on **correctness, silent-error rate, cost, and latency**. This directly tests the bolt-on stack's real value. *Feasibility:* high. *Challenges:* the model-native arm is not yet buildable (TypeSafe pre-launch); frame it as bolt-on-vs-decode-time now, model-native later.
**Fit: high · Difficulty: medium.** Also the most *startup-legible* artifact (below).

### Gap 4 — Silent-failure detection has no benchmark
**Context.** "Silent filtering is catastrophically unsafe" ([Partial Evidence Bench](https://arxiv.org/abs/2605.05379)) but that's the auth-scope slice. The general problem — *the model returns a confident, well-formed, wrong answer and nothing flags it* — is the defining automation risk and has no measurement standard. Self-consistency and verifier methods exist but "reduce hallucinations primarily by abstaining," trading correct-answer rate for safety.
**Approaches.** Build a "silent-error" benchmark: tasks with known-wrong-but-plausible outputs, measuring whether a reliability layer (verifier, self-consistency, confidence score) catches them vs. how much correct throughput it sacrifices — a precision/recall frontier for *knowing when you're wrong*. Reuses the profile's LLM-as-judge machinery directly. *Feasibility:* high. *Challenges:* constructing plausible-but-wrong cases at scale.
**Fit: very high · Difficulty: medium.**

### Gap 5 — Agent reliability *statistics* are immature (shared with problem-11)
**Context.** pass^k assumes independent trials (often false); decay-curve frameworks are new and unadopted; non-determinism-at-temp-0 lacks a clean primary quantification. See [problem-11 Gap "Reliability statistics are immature"](problem-11-agent-architectures.md).
**Approaches.** Measure run-to-run variance and pass^k independence for open scaffolds under fixed seeds; quantify temp-0 non-determinism cleanly (the "up to 15%" figure needs a primary). *Feasibility:* high. *Challenges:* cost control on long runs (≤$500 ceiling).
**Fit: high · Difficulty: medium.** Note: this overlaps problem-11 heavily — see [Relationship](#relationship-to-existing-rows).

### Gap 6 — The reliability benchmarks may themselves be broken
**Context.** Cleanlab already showed [structured-output benchmarks have errors](https://cleanlab.ai/blog/structured-output-benchmark/); the [eval-04](eval-04-methodology-and-standards.md) construct-validity lesson (445 benchmarks audited, most flawed) almost certainly applies to the brand-new reliability benchmarks too.
**Approaches.** A BetterBench-style audit of the (small, tractable) set of existing reliability/structured-output benchmarks. *Feasibility:* very high — desk + spot-checks. *Challenges:* it's analysis, not a new instrument; impact depends on distribution.
**Fit: high · Difficulty: low.**

> **Opportunity summary.** Strongest solo fits: **Gap 2** (structured-output correctness) and **Gap 1** (pipeline-reliability benchmark) — both low-cost, high-fit, artifact-producing and *startup-legible*; then **Gap 4** (silent-failure benchmark) and **Gap 3** (build-in-vs-bolt-on head-to-head, the most fundable framing); **Gap 6** is a fast credibility starter; **Gap 5** is real but shared with problem-11.

---

## What a solo researcher could do here — concrete study/artifact shapes

Facts and precedents, not a ranking. All API/laptop-scale, ≤$500.

1. **"Does structured output help or hurt correctness?" — a decision-useful study (Gap 2).** Free-form vs. JSON-mode vs. constrained-decoding vs. reason-then-constrain, on 2–3 automation tasks (extraction, classification), separating schema-validity from task-correctness, across 3–4 models. Precedent: The Format Tax + JSONSchemaBench are exactly this shape; a *practitioner-oriented, current* version is missing. Directly reuses the profile's eval methodology.
2. **A pipeline-reliability benchmark for unsupervised extraction (Gap 1).** Fixed dataset + metric suite (schema-validity, silent-error rate, run-to-run consistency, latency variance) under degraded/adversarial inputs. Precedent: ReliabilityBench (single-author). The artifact *is* the contribution — and it's the most startup-portfolio-worthy thing in the brief.
3. **Bolt-on vs. decode-time reliability head-to-head (Gap 3).** Instructor reask vs. Guardrails validators vs. Outlines constrained decoding on one task, scored on correctness/silent-error/cost/latency. Precedent: none published head-to-head — that's the point. Reads as a *product-evaluation* memo any reliability startup would want.
4. **A silent-error detection benchmark + LLM-as-judge detector (Gap 4).** Known-wrong-but-plausible outputs; measure detector precision/recall vs. correct-throughput cost. Precedent: the profile's own RAG-hallucination LLM-as-judge work, retargeted from "is this grounded?" to "is this silently wrong?"
5. **A reliability-benchmark audit (Gap 6).** Apply construct-validity/BetterBench criteria to the handful of existing reliability + structured-output benchmarks; publish fix-verified findings. Precedent: Cleanlab's audit + [eval-04](eval-04-methodology-and-standards.md)'s BetterBench lineage. Weekend-to-weeks; a fast credibility on-ramp.
6. **Temp-0 non-determinism quantification (Gap 5).** Clean primary measurement of run-to-run output variance at temperature 0 across providers/batch sizes — the "up to 15%" claim currently has no clean primary. Cheap, citable, and a gap in the literature's foundations.

---

## Startup lens

**Foundability — the wedge.** The wedge is real and *already funded*: dottxt ($11.9M), Guardrails ($7.5M), and now a frontier-lab-scale bet (TypeSafe) all sell "make AI reliable enough to run unsupervised." The pull is structural — every company shipping agents hits the reliability wall, and 3–5-nines is a hard, unmet bar. **Whitespace a solo could occupy:** the *measurement* layer — nobody owns "the reliability score for unsupervised automation," and reliability is precisely a thing buyers need *verified by a third party*, not self-reported by the vendor. A credible independent reliability benchmark/scoreboard is a plausible company (comparable: Cleanlab productized "output trust"; Galileo/Braintrust productized eval observability).
**Honest feature-not-a-company risk (high).** Most of this collapses into (a) a feature of the model providers (OpenAI/Anthropic/Google already ship structured outputs and are racing on agent reliability), or (b) a feature of the eval-observability incumbents (Langfuse/LangSmith/Braintrust/Arize add reliability metrics). Constrained decoding is largely commoditized/open-source (Outlines, XGrammar). The defensible slice is a *neutral measurement standard* + the data moat of running it continuously — narrow, but real (same logic as [eval-04](eval-04-methodology-and-standards.md)'s saturation-dashboard moat).
**Foundability rating: 3/5.** The market is validated and the pain is acute, but the strongest position for a solo is a measurement/standard play (defensible-but-narrow), and the model-native approach the trigger company is pursuing needs a frontier lab's resources, not a solo budget. Not a 4 because the two obvious commercial forms (constrained decoding; bolt-on guardrails) are commoditizing and provider-absorbable; not a 2 because independent reliability measurement is genuinely unmet and buyer-demanded.

**Startup-hireability.** This is the domain's strongest suit for the profile's pivot. **Who hires this exact skill:** TypeSafe AI (reliability-eval is their core competency and they're pre-launch/hiring-shaped ⚠️); dottxt, Guardrails AI, Cleanlab (reliability *is* the product); every agent startup (Sierra, Cognition, and the long tail) needs someone who can *measure* whether their agent is production-reliable; eval-observability vendors (Braintrust, Langfuse, Arize) hire eval scientists. **The signal artifact:** a public, well-designed reliability benchmark or a rigorous structured-output-correctness study is a near-perfect hiring signal — it demonstrates exactly the "can you tell us if our system is actually reliable?" skill these companies buy, and the profile's *published* LLM-as-judge study is prior evidence of the same competence. Study shapes 1–4 above each double as a portfolio piece.
**Hireability rating: 4/5.** High and rising demand; the profile's evaluation strength maps directly onto the named hiring need; the artifact-to-interview path is short and concrete. Not a 5 only because the incumbent reliability-engineering skill set also values distributed-systems/production-SRE depth the profile would need to signal alongside the eval work.

---

## Relationship to existing rows

- **vs. [eval-04 (methodology & standards)](eval-04-methodology-and-standards.md):** eval-04 is about making *evaluation itself* trustworthy (construct validity, statistics, saturation, regulation). This domain is about a *specific measured property — deployment reliability — of the system*, not the meta-science of measurement. They share methods (benchmark design, LLM-as-judge, statistics) but eval-04's object is "the benchmark"; this domain's object is "the unsupervised pipeline." Overlap is method, not subject.
- **vs. [problem-11 (agent architectures)](problem-11-agent-architectures.md):** the biggest overlap. Problem-11 covers pass^k, reliability decay, and failure taxonomies — but through the lens of *how agents are wired* (memory, topology, context). This domain is broader on one axis (it includes non-agent settings: structured extraction, single-shot pipelines, machine-to-machine calls) and narrower on another (it's only the reliability/correctness property, not architecture). Gap 5 here is essentially a problem-11 gap.
- **vs. [problem-09 (agent security & auth)](problem-09-agent-security-auth.md):** security asks "is the actor authorized / can it be spoofed?"; reliability asks "does the authorized system produce correct output unsupervised?" Partial Evidence Bench sits on the seam (auth-scope silent failure), but the domains are distinct — one is adversarial identity, the other is non-adversarial correctness.

**Does it deserve its own index row?** **Yes — but as a distinct, defensibly-scoped row, with an explicit boundary against problem-11.** The argument *for*: (a) it has its own trigger company, its own funding-backed startup cluster (dottxt/Guardrails/Cleanlab/TypeSafe), its own canonical literature (structured generation + reliability metrics) that no existing row covers, and its own defining debate (build-in vs. bolt-on) that lives nowhere else; (b) the *non-agent* surface (structured/type-safe generation, pipeline reliability, machine-to-machine) is genuinely outside problem-11's agent-architecture framing. The argument *against* (honest): its agent-reliability-statistics slice (Gap 5) overlaps problem-11, and its measurement slice overlaps eval-04's methods. **Recommendation:** give it its own row, scoped as **"reliability & correctness *as a deployment property* — structured/type-safe generation + reliability measurement for unsupervised automation,"** and cross-link Gap 5 to problem-11 and the audit gaps to eval-04 rather than duplicating them. Its distinctive, non-overlapping core — *structured-output correctness, silent-failure detection, pipeline reliability, and the build-in-vs-bolt-on question* — is large enough to stand alone and is the profile's single most startup-marketable landing spot.

---

## What we still don't know — ledger

- **TypeSafe's actual stage/funding.** Founded 2024, SF, AWS GenAI Accelerator confirmed; **no priced round disclosed**, model unreleased. The Tracxn "2011/unfunded" is confirmed aggregator noise. Follow-up: watch for a launch/seed announcement; verify against a claimed profile.
- **Whether "reliability built into the model" is even demonstrable** at solo scale — it requires model access TypeSafe hasn't shipped. Gap 3's model-native arm is currently untestable ⚠️.
- **The clean primary for temp-0 non-determinism magnitude** — the "up to ~15%" figure is a secondary synthesis; the underlying primary was not located this pass.
- **Whether structured output helps or hurts *task* correctness** — genuinely unsettled across Let Me Speak Freely / JSONSchemaBench / CRANE; this is an open empirical question, i.e. Gap 2 is a real research opportunity, not a sourcing hole.
- **Whether a neutral third-party reliability standard gets *adopted*** vs. ignored (the same open assumption flagged in eval-04 and problem-09).
- **How much of the constrained-decoding stack the model providers will absorb** — determines the feature-not-a-company risk.
- **The right *unit* of reliability for automation** — per-call? per-pipeline? per-SLA-window? Undefined across the sources read.

---

## Fit notes — domain ↔ profile

The domain's most acute open problems are *measurement* problems — is structured output actually correct (Gap 2), can silent failures be caught (Gap 4), what is the reliability of an unsupervised pipeline (Gap 1) — which is the profile's published strength (LLM-as-judge for RAG hallucination detection, i.e. exactly "did the system silently produce something wrong?"). Every study shape is API/laptop-scale within ≤$500, and the two most influential recent artifacts (ReliabilityBench, Partial Evidence Bench) are *single-author* existence proofs. For the marketability pivot this is arguably the best-positioned domain in the program: the reliability-eval skill maps one-to-one onto a named, funded hiring need (dottxt, Guardrails, Cleanlab, TypeSafe, every agent startup), and a single well-built reliability benchmark serves simultaneously as a research artifact, a hiring signal, and the seed of an independent-measurement company.
