# Pilot Specs — the locked shortlist

*Shortlist locked 2026-07-08 (five fields). These are Stage-2 pilots per
[04 · topic-selection-process](04-topic-selection-process.md): cheap, bounded, each ships a public
artifact, each pre-registered with success **and** kill criteria. **Run 2–3 of these across
different fields — not all five** — the pilots exist to compare fields on real evidence, then the
one that survives contact with cost/data/demand earns the deep commitment.*

**Locked shortlist** (from the [ship-first ranking](05-domain-comparison-index.md)):
1. Evaluation & benchmarking science — **Pilot A · JudgeFlip**
2. Model behavior science / fingerprinting — **Pilot B · PersonaAtlas**
3. Reproduction, replication & meta-science — **Pilot C · ReproCheck**
4. Agent security & authentication — **Pilot D · ScopeBench**
5. AI supply chain — **Pilot E · DiversionDB**

**Rules that apply to every pilot** (from 04 §Stage-2): re-analysis tier only (≤$500, track actuals);
≤~60 hrs / ≤6 weeks each; a public artifact is the unit of evidence; **pre-register success + kill
before starting**; **scoop protocol** — weekly arXiv/news check on the keywords listed, and if
scooped, publish what exists as a comparison/replication note and stop; **conflict-of-interest** —
cross-vendor judging, disclose any lab credits, never audit an artifact of the vendor funding you.
Post-mortem each: who engaged (the real signal), hours actual vs budget, what it settled, and an
honest fit verdict — **at least one "misfit" verdict across the pilots is expected.**

> **Suggested starting trio** (fastest to a credible artifact, maximal skills-fit, and breadth
> across fields): **C · ReproCheck** (fastest, ~2–3 wks) → **A · JudgeFlip** (your published lane)
> → one of **D · ScopeBench** or **E · DiversionDB** (a different muscle). Start C while specc'ing A.

---

## Pilot A · JudgeFlip — Evaluation & benchmarking science

**Research question (falsifiable):** Does the *choice of LLM judge* — model family and quantization
level — flip verdicts in RAG-hallucination evaluation, and by how much **relative to the judge's own
nondeterminism floor**?

- **Gap it closes:** LLM-as-judge reliability is load-bearing across the field yet under-characterized;
  no meta-eval of *hallucination-judge* stability, and the quantized-judge question is open ([eval-04](briefs/eval-04-methodology-and-standards.md) Gap 1; directly extends your published RAG-hallucination-judge study).
- **Method:** Fix ~500 (query, context, answer) items with human hallucination labels (reuse your
  dataset or a public one — RAGTruth / HaluEval). Judges = 4–6 model families (Claude, GPT, Gemini,
  Llama, Qwen) at bf16 + quantized (Q8/Q4). Score every item ×3 (seed variation). **Metrics:**
  cross-judge agreement (Krippendorff α), verdict-flip rate vs a reference judge, and the spine —
  flip rate attributable to *quantization* vs the *seed/order* nondeterminism floor; stratify by
  answer-margin (clear vs borderline); correlate flips with verbosity/position bias.
- **Cost:** ~$80–200 API; small/quantized judges free on laptop/Colab. **Time:** ~40 hrs / 3–4 wks.
- **Success (pre-reg):** a published *flip-rate-vs-bits* curve + a "certify-your-judge" script; finding
  that quantization moves verdicts above the nondeterminism floor on borderline items — **or a clean null.**
- **Kill (pre-reg):** if bf16-vs-quant flips are indistinguishable from the seed floor on *all* strata
  in the pilot subset, report the null (still shippable) and don't scale; if human labels can't be
  assembled cheaply, pivot to a public labeled set before proceeding.
- **Artifact:** short paper (arXiv + eval workshop) · OSS judge-stability harness · flip-rate "cards."
- **Scoop watch:** "LLM judge quantization", "judge reliability/consistency", "LLM-as-judge bias".
- **Prior + delta:** Miller *Error Bars* (stats), *Justice or Prejudice* / self-preference (judge bias
  at full precision), OpenAI persona-features — **delta:** the judge-*under-quantization* stability
  question on your own hallucination-judging turf; verified unclaimed in the solo-agenda vetting.

## Pilot B · PersonaAtlas — Model behavior science / fingerprinting

**Research question:** Do frontier and open models cluster into distinct, **stable** "personas" on a
values/preferences probe battery, and do those clusters **correlate with documented shortcomings**
(sycophancy, bias, refusal)?

- **Gap it closes:** behavioral fingerprinting across models is wide open and API-cheap; the
  persona-vector numbers are shaky/internal ([sweep-01 model behavior](briefs/sweep-01-model-behavior-science.md); your research-log seeds).
- **Method:** design a ~150-item probe battery (moral dilemmas, preferences, risk attitudes, value
  trade-offs, refusal edges); query ~15–25 models (APIs + open) with fixed decoding + multiple
  paraphrases; embed responses (or extract value-judgments via a rubric-LLM first); build per-model
  index vectors; cluster (hierarchical + k-means; validate with silhouette + bootstrap); characterize
  clusters; correlate with published sycophancy/bias/refusal scores. Optional diachronic mini-test
  (one model across versions).
- **Cost:** ~$50–150 (API + embeddings). **Time:** ~50 hrs / 4–5 wks.
- **Success (pre-reg):** a released **persona atlas** (dataset + interactive clustering) + paper; clusters
  are **stable under bootstrap/paraphrase** AND correlate with ≥1 documented shortcoming.
- **Kill (pre-reg):** if clusters are *not* stable under paraphrase/bootstrap, publish the negative
  ("model behavior resists coherent low-dimensional characterization") — itself a finding — and stop.
- **Artifact:** HF dataset + atlas site + paper.
- **Scoop watch:** "LLM persona", "behavioral fingerprinting", "model diffing", "value profile LLM".
- **Prior + delta:** Anthropic *Persona Vectors* (2507.21509, internal/steering), OpenAI persona
  features (2506.19823) — **delta:** a **black-box, cross-model comparative atlas from the outside**;
  nobody has built the comparative map.

## Pilot C · ReproCheck — Reproduction, replication & meta-science

**Research question:** Does a recent, widely-cited **counterintuitive** result — default target:
HAL's *"higher reasoning effort reduces agent accuracy in the majority of runs"* — reproduce
independently on open models and a second benchmark?

- **Gap it closes:** independent reproduction of headline claims is a proven near-zero-cost, high-impact
  genre few people do ([sweep-05 reproduction](briefs/sweep-05-reproduction-and-metascience.md)).
- **Method:** pick ONE crisp, cheap-to-test claim (default above; alternatives from the weekly radar);
  re-implement the minimal experiment on 2–3 open models + a *second* agent benchmark; vary the single
  independent variable; measure accuracy + variance with CIs; **pre-register the expected pattern**;
  report reproduce / partial / refute.
- **Cost:** ~$50–200 (API + a few open-model GPU-hours). **Time:** ~30 hrs / 2–3 wks — **the fastest pilot.**
- **Success (pre-reg):** a reproduction report (repro *or* refute) with code + a reusable reproduction
  template others can fork.
- **Kill (pre-reg):** if the claim's setup can't be reconstructed from the paper within budget, report
  the **reproducibility barrier itself** (a finding) and stop.
- **Artifact:** reproduction report (blog + preprint) + code.
- **Scoop watch:** low risk — reproduction is rarely raced; still check for a competing replication.
- **Prior + delta:** the original paper (HAL, arXiv:2510.11977) — **delta:** independent reproduction
  on open weights / a second benchmark, which the original did not do.

## Pilot D · ScopeBench — Agent security & authentication

**Research question:** How often do frontier model agents **exceed a granted permission scope** under
adversarial/ambiguous instructions, and does a lightweight capability-check defense reduce it?

- **Gap it closes:** the **named absence** — no agent-auth / scope-adherence robustness benchmark exists
  ([problem-09 agent security](briefs/problem-09-agent-security-auth.md); this is the Conf-4 "absence-claim"
  cap turned into the study — you'd build the first one).
- **Method:** author ~40–80 scenarios: an agent given a *scoped* task + tool access, with temptations to
  exceed scope (indirect injection in tool outputs, ambiguous user asks, over-broad tool calls). Define
  scope-violation detectors (rule + LLM-judge, human-validated on a sample). Measure violation rate
  across 4–6 frontier/open agents on a standard scaffold (Inspect). Add a simple capability/allow-list
  defense (CaMeL-style) and measure the reduction.
- **Cost:** ~$100–250 (API + trajectories). **Time:** ~55 hrs / 4–6 wks.
- **Success (pre-reg):** released **ScopeBench** (scenarios + Inspect harness + leaderboard) + paper; a
  measurable cross-model violation rate **and** a defense delta.
- **Kill (pre-reg):** if violation rates are ~0 across models (no signal), report that scope-adherence is
  already robust (a finding) and stop; if the judge can't reliably detect violations, narrow to a
  verifiable slice before scaling.
- **Artifact:** benchmark + Inspect-Evals contribution + paper.
- **Scoop watch:** "agent authorization/scope benchmark", "delegation adherence", "agent injection eval".
- **Prior + delta:** AgentDojo (2406.13352, task-completion under injection), CaMeL (2503.18813, defense)
  — **delta:** scope/**authorization adherence** as the measured quantity — the named missing benchmark.
- **CoI:** cross-vendor scenarios + judge; disclose any API credits.

## Pilot E · DiversionDB — AI supply chain

**Research question:** Can an LLM-extracted, **case-level** database of chip export-control enforcement /
diversion actions narrow the ~5× gap between the leading smuggling estimates?

- **Gap it closes:** the CNAS (~140k) vs Epoch (~660k H100e) estimates diverge ~5× on one unmeasured
  parameter, and no case-level enforcement dataset exists ([problem-03 supply chain](briefs/problem-03-supply-chain.md)).
- **Method:** assemble public sources (DOJ/BIS press, indictments, court + customs records, reputable
  reporting); LLM-extraction pipeline (your skill) structures each case — chips, volumes, routes, dates,
  actors, outcome; hand-validate a sample; aggregate to *bound* diversion volume; compare against the two
  estimates' stated assumptions; publish dataset + reconciliation note.
- **Cost:** ~$0–50 (public data + modest LLM extraction); **laptop-only.** **Time:** ~45 hrs / 3–5 wks.
- **Success (pre-reg):** an open dataset (N structured cases) + a short analysis that **narrows or
  explains** the estimate gap; a demand signal (interest/cite from CSET/IAPS/Epoch-adjacent readers).
- **Kill (pre-reg):** if public case records are too sparse/unreliable to bound volumes, publish the
  **"enforcement-data transparency gap"** as the finding and stop.
- **Artifact:** open dataset (GitHub/HF) + analysis note.
- **Scoop watch:** CSET / CNAS / Epoch / IAPS outputs; "chip smuggling estimate", "export control evasion".
- **Prior + delta:** Grunewald, Juniewicz (aggregate Monte-Carlo estimates) — **delta:** a **case-level
  structured database + reconciliation**, which nobody has built.
- **Demand probe:** 2–3 cold emails to named readers at CSET/IAPS before scaling.

---

## After the pilots
Each ships an artifact and a post-mortem (engagement, hours, fit verdict). Then Stage-3 (04
§Selection criteria): impact → energy/interest (from *lived* pilot experience) → feasibility → a
single marketability pass. The field whose pilot drew real engagement, felt findable in the hours you
had, and has a durable moat wins the deep commitment. Publishing routes for every artifact type are in
[07 · publishing-pathways](07-publishing-pathways.md).
