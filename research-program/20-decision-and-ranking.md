# 20 · Decision & Ranking — the ONE combined place to choose from

*Written 2026-07-09 (consolidated pass). This is **the** master decision document. It supersedes every
earlier ranking, tier table, and per-candidate score scattered across [docs 11–25](README.md). All **26
candidates** — 6 research pilots and 20 founding bets — are re-scored here on a **single consistent
rubric against shared anchors in one pass**, so for the first time the numbers are actually
apples-to-apples. Where any earlier doc disagrees with a number, a license, or a data verdict, **this
doc is current.** If you read nothing else, read this.*

---

## What this document is (and how to read it)

You have **26 fully-worked candidates**. Each was checked the same way: is the problem real, is the
data actually obtainable and license-clean, how much of *your own* labeling does it need, can a solo
pull it off for ≤$500 part-time, and what does a good outcome buy you. This pass adds one thing the
scattered docs never had: **every candidate re-scored together, against the same anchors, in a single
sitting** — so a 91.7 and an 80.0 are now on the same scale.

**The two candidate types, because it changes how you read the scores:**

- A **research pilot** is a small study you can actually run — ≤$500, part-time, solo — ending in a
  public artifact (a short paper, a released dataset, an OSS tool) with a pre-written win-or-kill line.
  It buys you a **credential and a hire signal fast**, and sometimes a founding wedge as a bonus.
- A **founding bet** is the seed of a **company**. It can still produce a shippable artifact, but its
  reason to exist is a durable business with a moat. These score higher on founding-upside by
  construction and often lower on ship-speed, and several carry a genuine cold-start (no moat data until
  a customer shows up).

Do not compare the two types on founding-upside alone and conclude the pilots are weak — a pilot
scoring 4 on founding-upside is remarkable *for a pilot*.

### The criteria and exactly how they're weighted

The ranking is computed from **your** stated priorities. Five criteria, each scored 1–5 per candidate,
combined into a **0–100 composite** with these weights:

| Criterion | Weight | What it asks |
|---|:--:|---|
| **Ship-speed** | **3.0** | How fast to a public artifact/result? *(your highest priority)* |
| **Impact** | **2.5** | Is the problem real, high-stakes, and does the work move it? |
| **Founding-upside** | **2.5** | Could this become a durable company with a moat? |
| **Executability** | **2.5** | Can *you* actually do it — data, cost, skill-fit, risk? |
| **Hire-signal** | **1.5** | How legible/valuable as a credential to the teams you'd join? |

Composite = weighted average of all five, rescaled to 0–100. **These scores are a single consistent
pass**, so cross-candidate comparison is now valid in a way it was not when each aperture stream scored
independently.

### The data-availability verdict (new, load-bearing)

Every card carries a **DATA verdict** — the honest executability-confidence signal:

- **SOLID** — free, license-clean, currently-downloadable data (or self-generatable ground truth) that
  labels the *differentiated* half of the verdict. Ship with confidence.
- **WORKABLE** — a real free/self-generatable path exists, but with a named caveat (a non-commercial
  license on the best corpus, ground truth that must be synthesized, a paid expert rater, or a corpus
  that only accrues post-launch). Ships, but read the caveat before you bet the company on it.
- **RISKY** — the data that would prove the *differentiated* claim is unobtainable free, thin to the
  point of under-powering, or gated behind a non-existent-at-t0 partner. The pilot may still ship a
  weaker result; watch these closely.

---

## THE CONVERGENT FOUNDING THESIS

Nearly every top founding candidate is the **same shape**: an **independent, vendor-agnostic verifier
that checks an AI's output *before* a human or institution that holds non-delegable liability signs
off.** It is a repeatable company pattern built directly on your published RAG-hallucination /
LLM-as-judge method. It scores highest in **regulated-money and clinical verticals**, because there the
**buyer *is* the liability-holder** (a bank, a physician, an audit partner) who *wants* the
verification — which escapes the "vendors won't pay to be audited" trap that sinks the neutral-referee
plays (Kappa, VeriJudge, TrajTrust, Injection Report Card) further down the list.

---

## THE COMBINED MASTER RANKING — all 26, one scale, by composite

| Rank | Candidate | Type | Comp. | Ship | Impact | Found | Exec | Hire | Data | One-line |
|--:|---|---|:--:|:--:|:--:|:--:|:--:|:--:|:--:|---|
| 1 | **DisputeProof** | found | **91.7** | 5 | 4 | 4 | 5 | 5 | SOLID | Reg-E dispute-denial defensibility verifier; free public-domain CFPB data + a legally-forced (private right of action) buyer. |
| 1 | **TieProof** | found | **91.7** | 5 | 4 | 4 | 5 | 5 | WORKABLE | Audit evidence tie-out verifier; self-labeling FinQA+XBRL numeric channel, PCAOB tailwind; narrative moat must be self-generated. |
| 3 | **ToolTamer** | found | **89.2** | 5 | 4 | 4 | 5 | 4 | SOLID | Agent/MCP tool-call repair; free MIT/Apache schemas + label-free self-generated ground truth. |
| 4 | **ReasonProof** | found | **87.5** | 5 | 4 | 4 | 4 | 5 | WORKABLE | ECOA/SR-11-7 adverse-action reason-code faithfulness; free HMDA + computed ground truth, but it's a controlled study (HMDA hides credit score). |
| 4 | **NoteProof** | found | **87.5** | 5 | 4 | 4 | 4 | 5 | SOLID | AI-scribe clinical-note grounding; free CC-BY zero-PHI ACI-Bench, aligned signing-physician buyer. |
| 4 | **PortalProof** | found | **87.5** | 5 | 4 | 4 | 4 | 5 | WORKABLE | AI patient-portal reply verifier; real free paired data exists but is CC-BY-NC + tiny (100 rows). |
| 7 | **DenialProof** | found | **86.7** | 4 | 5 | 4 | 4 | 5 | WORKABLE | Medical-necessity denial verifier (SB-1120 buyer); free DMHC proves a commodity axis, the moat needs synthetic triples + paid clinician + a criteria-license workaround. |
| 8 | **RewardProof** | found | **85.0** | 5 | 4 | 3 | 5 | 4 | SOLID | RL-grader exploit auditor; free MIT SWE-bench Verified + deterministic self-labeling — but the artifact is already a commodity. |
| 8 | **QueryProof** | found | **85.0** | 5 | 4 | 3 | 5 | 4 | SOLID | Text-to-SQL answer verifier; execution-based auto-labels, license-clean — method already published (SQLens). |
| 8 | **MemTrust** | found | **85.0** | 5 | 3 | 4 | 5 | 4 | WORKABLE | Cross-vendor agent-memory staleness referee; self-generated adversarial injection is the moat, best content-fit corpora are NC/ND-blocked. |
| 11 | **Kappa** | found | **83.3** | 5 | 3 | 3 | 5 | 5 | SOLID | LLM-judge drift monitor; fastest-ship, best hire artifact, cleanest data — founding lane crowded by funded incumbents. |
| 11 | **TrajTrust** | found | **83.3** | 5 | 3 | 3 | 5 | 5 | WORKABLE | Agent-trajectory judge-of-the-judge; most build-ready (dry run done) but free labels are research-ToS + too thin for the per-class claim. |
| 11 | **InteractionProof** | found | **83.3** | 5 | 4 | 3 | 4 | 5 | WORKABLE | Drug-interaction alert verifier; openFDA CC0 is the safe path, but the freest ready labels are LexiDrug/DrugBank-derived. |
| 11 | **VeriJudge** | found | **83.3** | 5 | 3 | 3 | 5 | 5 | SOLID | LLM-judge validity/confound auditor; free MIT benchmarks + self-gen recipe — but the technique is a weekend copy. |
| 15 | **AppealScore** | found | **80.8** | 5 | 4 | 3 | 4 | 4 | WORKABLE | Insurance-appeal quality grader; free IMR proves the already-commoditized win-prediction axis, differentiated axis has no free paired data. |
| 15 | **TriageProof** | found | **80.8** | 5 | 4 | 3 | 4 | 4 | WORKABLE | Symptom-checker undertriage leaderboard; free Semigran/AcuityBench commoditize the measurement, richest data (ER-Reason) is credentialed. |
| 17 | **Ingestion Corruption Detector** | pilot | **80.0** | 4 | 4 | 3 | 5 | 4 | SOLID | Label-free parse/OCR numeric-corruption detector; cleanest-to-execute pilot, free redistributable data + XBRL answer key. |
| 18 | **RailKit** | found | **79.2** | 3 | 4 | 5 | 4 | 4 | WORKABLE | Drop-in hallucination guardrail SDK (Air Canada precedent); build-data free, product/moat data must be self-generated then accrues post-launch. |
| 19 | **Reviewer Scrutiny Metric** (Stamp Score) | pilot | **78.3** | 4 | 4 | 3 | 4 | 5 | WORKABLE | Do humans really review AI code or rubber-stamp; clean free data + elegant revert ground truth, but thin defect-revert positive class. |
| 20 | **GroundTruth Streams** | found | **76.7** | 5 | 3 | 2 | 5 | 4 | WORKABLE | Free public feeds → AI-ready eval corpora; best-in-class data, but the moat over free feeds is already being eaten by Kensho/S&P + Stanford SEFD. |
| 21 | **ScreenProof** | found | **75.8** | 4 | 4 | 3 | 4 | 4 | WORKABLE | Sanctions-screening rationale verifier; free watchlists are the denominator not ground truth, the one big real label set is NC + commodity-axis. |
| 22 | **Callsmith** | found | **75.0** | 3 | 4 | 5 | 3 | 4 | WORKABLE | Outcome-graded AI phone-call tuning; un-reproducible per-vertical CRM moat, but the whole pilot is gated on landing one design-partner client. |
| 23 | **Injection Defense Report Card** | pilot | **74.2** | 4 | 4 | 2 | 4 | 5 | SOLID | A–F prompt-injection defense card; cleanest pilot data path + elite current hire signal, but a confounded "did I attack hard enough" null. |
| 24 | **PV-Grade** | pilot | **70.8** | 3 | 4 | 4 | 3 | 4 | WORKABLE | Pharmacovigilance decision benchmark; regulator-mandated demand, but FAERS lacks narratives, MedDRA is licensed, causality gold is expert-gated. |
| 25 | **SuggestionFix-Bench** | pilot | **67.5** | 4 | 3 | 2 | 4 | 4 | WORKABLE | Does AI reproduce the fix a human merged; clean free data + tidy pipeline, but a verified ~8%-defect-fix base rate risks the <500-gold kill. |
| 26 | **Multilingual Safety Meter** | pilot | **53.3** | 2 | 3 | 2 | 3 | 4 | RISKY | Honest per-language safety numbers under a flaky judge; slowest, gated on a native-Tamil annotator in a thin (n=132) set. |

---

## Callouts

- **Overall #1 (three-way tie by composite):** **DisputeProof, TieProof (both 91.7)** — and among them,
  **DisputeProof is the cleaner pick** because its data is genuinely SOLID (free public-domain, no
  license caveat) where TieProof's differentiating narrative-grounding channel must be self-generated.
  See the recommendation for the tiebreak.
- **Best founding bet:** **DisputeProof (91.7)** — the fastest, most legally-forced (EFTA §1693m private
  right of action + a confirmed class-action surge), on free public-domain CFPB data, with a
  near-verbatim reuse of your published judge.
- **Best fast-artifact / hire pilot:** **Ingestion Corruption Detector (80.0)** — the cleanest-to-execute
  pilot (label-free core signal, free redistributable data, ~$50 CPU compute, null-proof). For pure hire
  legibility, **Injection Defense Report Card** and **Reviewer Scrutiny Metric** are close behind.
- **Easiest to execute:** **DisputeProof / ToolTamer / RewardProof / QueryProof / Ingestion** all carry
  Exec 5. Among founding bets, **DisputeProof** (free instant download + zero-annotation self-labeling)
  is the least-friction path to a real result.
- **RISKY-data candidate to watch:** **Multilingual Safety Meter** — the only outright RISKY verdict: the
  low-resource language that justifies the whole method (public Tamil, n=132) is volume-fragile *and* its
  gold requires a native annotator you cannot self-supply. Several **WORKABLE** cards carry a
  *differentiated-axis* data gap that behaves like a RISK for the *company* even though the *pilot* ships
  — watch **DenialProof, AppealScore, ScreenProof** (free data proves a commodity axis; the moat axis
  has no free paired labels) and **Callsmith** (no moat data until a client signs).

---

## Per-candidate cards (top 15 by composite)

*Each card: why it matters · the data-availability options + verdict · annotation · executability + biggest
risk · scores · one-line verdict.*

---

### 1 · DisputeProof — Reg-E dispute-denial defensibility verifier — founding — 91.7

**Why it matters.** Banks must resolve unauthorized-transaction disputes under EFTA/Reg-E §1005.11, and a
confirmed class-action surge (Duane Morris tracking; Navy Federal's $1.72M settlement on the exact denial
fact pattern) plus a **private right of action (§1693m)** means the forcing function does *not* depend on
CFPB enforcement appetite. An independent verifier that checks a denial's defensibility *before* the bank
signs is exactly what a liability-holding buyer wants.

**Data availability — SOLID.**
- **CFPB Consumer Complaint Database (CCDB)** — free, public-domain, daily-updated real regulated data with
  the exact narrative + monetary-relief fields. Zero license/ToS/scraping issues; redistribution in a
  public artifact is explicitly permitted. Tens of thousands of narrative-bearing EFT/unauthorized-txn
  complaints. **$0.**
- **Self-generated synthetic denial packets** — LLM-drafted denial letters + investigation records seeded
  from CCDB narratives and public consent-order fact patterns, with known §1005.11 defects injected. Owned,
  unlimited, ~$0–50. Closes the gap the CCDB proxy leaves.
- **Real EFTA denial letters + docket exhibits** (PACER, Navy Federal + Duane-Morris-tracked suits) — a
  small, high-fidelity validation/anchor set (<$50).
- **Verdict: SOLID.** The only real weakness is that the CCDB seed labels are an **outcome PROXY**
  ("Closed with monetary relief" vs "explanation") rather than true §1005.11 reasonableness ground truth —
  a *headline-strength* caveat, not a data-access blocker. This is why it sits at 91.7 and not in a
  hypothetical clean-label tier.

**Annotation.** ~4–7 hrs spot-adjudication of a stratified ~150–300-complaint sample to calibrate the
defensibility judge against the monetary-relief proxy. You can do v1 (§1005.11 is learnable from CFPB
error-resolution guidance); a Reg-E SME (ideally a design partner's QA analyst, free) sharply raises label
credibility. Fits the budget.

**Executability.** A solo can absolutely ship v1 in one pilot: free instant download, a near-verbatim
re-point of your published RAG-grounding judge, labeling inside 4–7 hrs. **Biggest risk is not access — it
is proxy validity:** if agreement is low, distinguish "judge is wrong" from "proxy is noisy." **Fallback:**
pivot to self-generated synthetic denial packets with injected known §1005.11 defects, reporting
precision/recall on defect detection instead of a noisy outcome-agreement number — and grade the *real*
product input (investigation record + letter), not the consumer narrative.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 91.7.**

**Verdict.** The strongest founding bet in the set: free public-domain regulated data, a genuinely
legally-forced aligned buyer, and near-verbatim reuse of your published judge. The one thing to watch is
that the seed ground truth is an outcome proxy — the synthetic-defect fallback fully neutralizes it.

---

### 1 · TieProof — audit evidence tie-out verifier — founding — 91.7

**Why it matters.** PCAOB AS 1105 / QC 1000 liability makes an audit firm want an independent check that an
AI's cited evidence actually supports each assertion before the partner signs. Real regulatory tailwind,
liability-holder buyer.

**Data availability — WORKABLE.**
- **FinQA (CC-BY-4.0) + SEC EDGAR Inline XBRL (public-domain)** — the *numeric* tie-out channel: 8,281
  expert QA pairs + all public filers, airtight self-labeling (a figure agrees with XBRL/FinQA or it
  doesn't → zero manual labels). **$0.** This channel is genuinely SOLID — but it overlaps what
  MindBridge/DataSnipper already do.
- **AuditFraudBench** — real 10-K/MD&A + SEC AAER narrative channel, CC-BY-4.0, but the **download URL is
  unconfirmed** and its task shape is fraud detection, not per-assertion faithfulness — re-point, don't use
  as-is.
- **FinVerBench** — **the brief mischaracterizes this:** it is synthetic error-injection over only 43
  companies (1,985 instances), a numeric-consistency task that duplicates the FinQA/XBRL channel, not
  "real claim verification with supported/refuted/NEI labels."
- **Self-generated source→assertion grounding set + AAER restatement pairs** — the *only* option that
  actually produces the per-assertion supported/unsupported signal the product sells. Self-owned, ~$0 +
  4–7 hr.
- **Verdict: WORKABLE.** The numeric channel is SOLID and self-labeling; the **narrative-grounding moat
  channel is over-sold in the brief** and must be self-generated as a proxy. **Fallback:** FinDVer (4,000
  expert-annotated claim-verification examples over real financial docs) is a stronger natural seed —
  verify its HF license first.

**Annotation.** ~4–7 hr on the numeric channel (near-zero labels) **plus** ~4–7 hr to hand-verify a
few-hundred-item narrative grounding set — realistically 8–14 hr across two channels, slightly over the
ideal. Stage it: ship numeric first to stay in budget. No CPA needed for a v1 benchmark.

**Executability.** The numeric benchmark is turnkey and ships fast/cheap. **Biggest risk is not the
benchmark — it is that the product's real moat** (a cross-firm corpus of real AI-evidence defects +
reviewer verdicts) is unobtainable from any public source and depends on audit firms letting a third party
ingest their AI outputs, which they are structurally incentivized to refuse — plus brutally slow,
relationship-gated mid-market audit-firm sales for a solo.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 91.7.**

**Verdict.** Free self-labeling numeric data ships a benchmark fast and cheap, and the PCAOB tailwind is
real — but the narrative-grounding moat is over-sold and the true cross-firm defect corpus is unobtainable
publicly. Ties DisputeProof on composite; ranks *behind* it on the tiebreak because its differentiated
channel is WORKABLE where DisputeProof's data is SOLID.

---

### 3 · ToolTamer — agent/MCP tool-call repair — founding — 89.2

**Why it matters.** Malformed tool/MCP arguments fail silently or trigger expensive frontier round-trips
and runaway loops. Runtime reliability is where 2026 agent funding is moving.

**Data availability — SOLID.**
- **Official MCP Registry API + reference servers** — 8,400+ verified servers (mcp.so ~20k, Glama/LobeHub
  53k+); pull 200–500 real tool schemas (MIT/Apache, redistributable) then fuzz into malformed→repaired
  pairs. **$0.**
- **Self-generated malformed calls** — prompt an LLM against real schemas, capture schema-validation
  failures as naturalistic examples; validation is the free label oracle. <$50.
- **Public MCP fault research** (MCP-Atlas, MCP-Bench, fault taxonomies) — free for taxonomy/eval; check
  per-repo terms before embedding their *data* in a product.
- **Real runtime triples from the shipped OSS interceptor** — the actual moat, un-backfillable, but **ZERO
  until adoption.**
- **Verdict: SOLID.** Free permissively-licensed schemas at scale + schema validation making ground truth
  self-generatable = fully de-risked on data. The only caveat is the moat corpus accrues post-launch.
  **Fallback:** hand-author/LLM-synthesize representative schemas — the fuzz-and-validate pipeline needs no
  third-party data at all.

**Annotation.** Effectively zero manual labeling — schema validation is the label oracle. ~4–7 hr spent on
spot-checking repair quality and defining the failure taxonomy, not per-example labeling. No code review.

**Executability.** A solo can ship the pilot inside 6–13 wks and <$500 (scrape schemas, fuzz/generate
pairs, fine-tune a 1–3B repair model, wire an MCP+one-framework interceptor, publish OSS). **Biggest risk
is not data — it is distribution and hot-path latency:** the value prop is repair in <100ms and the moat
only forms if the OSS package gets real adoption. Secondary: horizontal fine-tuning/observability vendors
could bundle a repair step.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 4 → **Composite 89.2.**

**Verdict.** Data-perfect founding bet — free MIT/Apache schemas + label-free ground truth make the pilot
near-frictionless; the risk shifts entirely off data and onto distribution/latency and a moat that forms
only after adoption. A hair below the regulated-buyer anchors because it lacks their legally-forced buyer.

---

### 4 · ReasonProof — ECOA adverse-action reason-code faithfulness verifier — founding — 87.5

**Why it matters.** ECOA/SR-11-7 forbids the self-attesting model from being its own effective challenge;
an independent per-decline faithfulness check is regulatorily grounded. Legally-forced, liability-holder
buyer.

**Data availability — WORKABLE.**
- **HMDA public Modified LAR** (FFIEC/CFPB) — ~10M+ records/yr, ~99 fields, public-domain/CC0, downloadable
  today. **$0.** **But the public LAR redacts the single most decisive driver:** credit score is not
  disclosed, the AUS result is redacted, and it gives **no (real-model → emitted-codes → true-drivers)
  triples.**
- **Self-generated controlled experiment** — train your own transparent model, bolt SHAP on a black-box
  twin, grade SHAP codes against known coefficients + re-seed stability. Zero annotation, laptop compute.
  **This is the actual fast path** and the honest core of the "self-generated ground truth" claim — but it
  measures "SHAP is unfaithful on a model I built," a *controlled demonstration*, not a measurement on a
  real lender's live decisions.
- **Design-partner lender data** (scored declines + emitted reason codes, under NDA) — the only source of
  true triples, but a company-stage motion, not a v1-artifact source.
- **Public credit datasets** (LendingClub, Fannie/Freddie, German credit) — add credit-score-like signal
  HMDA lacks; check per-dataset ToS.
- **Verdict: WORKABLE.** The "self-generated ground truth on real regulated data" claim is oversold — the
  shippable result is a strong controlled/synthetic demonstration, not a measurement on real lender
  decisions. This is why Exec drops from 5 to 4.

**Annotation.** ~4–7 hr spot-adjudication is sufficient for the controlled v1; the core ground truth is
**computed, not hand-labeled**, which genuinely fits your dislike of manual review. No SME gate.

**Executability.** A solo can ship the controlled v1 in 6–13 wks on <$500 — a near-verbatim re-point of
your grounding judge, no PHI/BAA/SME gate. **Biggest risk:** the cheap fast result proves the *methodological*
claim, not the *product* claim, because public HMDA lacks credit score/AUS/triples. Second: AVAAS already
sells SR-11-7 independent validation to this exact buyer and is one scope decision from per-decline
faithfulness; examiner-gated MRM procurement is slow for a solo. **Fallback:** publish a fully
self-generated reason-code-faithfulness + re-seed-stability suite over HMDA + open credit datasets — zero
annotation, defensible as a methods contribution.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 87.5.**

**Verdict.** A genuine top-of-pool founding bet — legally-forced buyer, free HMDA, computed ground truth
that removes the SME bottleneck — but the data audit knocks Exec to 4 because it's really a
controlled/synthetic study, landing it at NoteProof parity with AVAAS as a live founding threat.

---

### 4 · NoteProof — AI-scribe clinical-note grounding verifier — founding — 87.5

**Why it matters.** The signing physician holds non-delegable liability for an AI-drafted note; an
independent grounding check before signature is exactly aligned with the buyer. Real, forced buyer.

**Data availability — SOLID.**
- **ACI-Bench** (Nature Sci Data 2023; GitHub + Figshare) — 207 transcript-note pairs, **CC-BY-4.0
  (commercial + redistributable)**, **fully synthetic with zero PHI**, downloadable today. **$0.** The
  catch the brief understates: the released notes are the **cleaned, grounded (positives-only) version** —
  you must **generate the hallucinations** to test detection.
- **Self-generated scribe drafts over ACI-Bench transcripts** — feed the 207 transcripts to a scribe
  prompt, judge each sentence transcript→note, producing a proper grounded+hallucinated detection test.
  ~$20–60.
- **PriMock57** (Babylon) — independent second corpus (57 mock consults), but **license unstated — confirm
  before redistribution.**
- **MEDIQA-Chat 2023** — same ACI-Bench data as challenge splits; a recognized benchmark handle, no new
  data.
- **Verdict: SOLID.** Free, CC-BY, zero-PHI, downloadable today. Only caveat: released notes are
  pre-cleaned, so you self-generate the hallucinations (cheap, in-skill). **Fallback:** PriMock57 for
  generalization; or self-generate unlimited synthetic transcript→note sets (no PHI needed).

**Annotation.** ~4–7 hr to hand-adjudicate 50–100 note sentences (supported/unsupported/contradicted with
cited span) on a self-generated draft slice. ACI-Bench even ships validated annotation guidelines (0.85 F1)
to reuse. A clinician sanity-check on ~20 borderline sentences is optional. Fits.

**Executability.** A near-verbatim re-point of your published judge. **Biggest risk is downstream of the
pilot:** the moat corpus (real cross-vendor hallucinations) needs health-system PHI access a solo can't
self-generate; gated EHR distribution + procurement-driven safety buying is brutal for a part-time solo.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 87.5.**

**Verdict.** SOLID data + a legally-forced aligned buyer make NoteProof a genuine 87.5 — top-tier
ship-speed and hire-signal — held just below the 91.7 tier only because the moat corpus needs PHI a solo
can't reach and ground truth must be generated rather than downloaded.

---

### 4 · PortalProof — AI patient-portal reply verifier — founding — 87.5

**Why it matters.** Same liability-holder shape as NoteProof, distinct sub-workflow (in-basket replies): a
clinician signs an AI-drafted patient message and owns the fabrication/safety-net/acuity risk.

**Data availability — WORKABLE.**
- **PortalPal-AI** (Dartmouth, arXiv 2601.11344, HF) — real de-identified chart context + patient message +
  gold clinician reply — **exactly PortalProof's input triple**, refuting the brief's "conversations not
  pairs" worry. But **only 100 rows, single-annotator, CC-BY-NC (non-commercial):** fine for the artifact,
  a commercial-license conversation later.
- **PMR-Bench** (arXiv 2601.13178) — de-risks the acuity/emergency-routing check the brief called
  "unproven" with real urgency labels (1,569 msgs; usable public portion ~1,181). Pairwise-ranking format,
  needs light re-framing; the real-EHR slice is walled.
- **MedRedQA + r/AskDocs** — ~51k real patient-question/physician-answer pairs; large free volume for the
  faithfulness judge, but no chart context.
- **npj guardrails 59-code error ontology** — a peer-reviewed labeling rubric (a huge annotation
  shortcut); the underlying corpus is not confirmed released.
- **Verdict: WORKABLE.** The audit slightly *improves* the picture (real free paired data + PMR-Bench
  de-risks acuity), but the best pairs are CC-BY-NC + only 100 rows and MIMIC is credentialed — so free
  data powers the SHIP artifact, not a commercial product corpus. **Fallback:** MedRedQA (unlimited, zero
  PHI) loses chart-grounded fabrication but is a clean escape hatch.

**Annotation.** ~4–7 hr: self-generate AI drafts on ~100–150 message+chart items, then label three flags
(fabricated instruction / dropped safety-net / under-routed emergency) at ~2–3 min each; acuity flag
bootstraps from PMR-Bench. The npj ontology substitutes for clinician expertise on the first pass. Fits.

**Executability.** The faithfulness check re-points your judge near-verbatim; self-labeling fits 4–7 hr /
$0 / zero PHI. **Biggest risk is unchanged and downstream of data:** gated EHR/in-basket distribution +
procurement-driven safety buying is brutal for a part-time solo.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 87.5.**

**Verdict.** Ties NoteProof and clears the mid-tier: the data audit slightly improves the picture, but the
non-commercial license + tiny corpus + gated distribution keep it found-plausible, not found-strong, and
short of the 91.7 tier.

---

### 7 · DenialProof — medical-necessity denial verifier — founding — 86.7

**Why it matters.** California SB-1120 forces a licensed clinician (not an algorithm) to make medical-
necessity denials — a legally-forced aligned buyer. A pre-send record-grounding check on the denial is the
novel axis.

**Data availability — WORKABLE.**
- **California DMHC IMR Determinations** — direct CSV, ~30k+ real labeled overturn/uphold outcomes with
  free-text rationale. **$0. Caveat: "No License Provided" + OPA terms — noncommercial free, all commercial
  uses need approval.** It proves the **commodity overturn-prediction axis** (Revecore, Epic already do
  this), NOT the novel pre-send record-grounding axis, and gives no denial-letter→submitted-record pairs.
- **CMS Medicare Coverage Database (NCD/LCD)** — public-domain, redistributable — the license-clean
  substitute for the criteria leg.
- **InterQual / MCG** — **VERIFIED BLOCKER:** proprietary licensed ontology, cannot be publicly
  distributed, enterprise-only. Mitigation: build on public NCD/LCD + treat InterQual/MCG as
  customer-supplied-at-runtime.
- **Self-generated synthetic (denial, record, criteria) triples** grounded on MIMIC-IV-Note + public
  NCD/LCD — the **only path to the actual moat**, needs a **paid clinician second-rater ($150–350).**
- **Verdict: WORKABLE.** Free labeled real data ships the overturn axis today (commodity); the novel moat
  needs synthetic triples + a paid rater + a criteria-license workaround. **Fallback:** ship a pure DMHC
  overturn-risk v1 and demo grounding qualitatively; Texas TDI IRO + Medicare Appeals Council add
  cross-jurisdiction labels.

**Annotation.** DMHC outcome labels are pre-labeled (0 new for the overturn axis). The moat needs ~50–100
synthetic triples second-rated by a **licensed clinician/UM nurse — the one thing not free**, and generating
synthetic denials is exactly the manufactured-label work you dislike. Fits the hours but strains your
preferences.

**Executability.** The overturn axis is genuinely low-risk (free real labeled data, ~1:1 skill fit).
**Biggest risk: the cheap free result proves the WRONG thing** (commodity overturn-prediction), and the
moat requires disliked synthetic generation + a paid rater + the InterQual/MCG workaround. Secondary:
payer procurement is brutal solo and Brellium ($16.7M) can fast-follow.

**Scores:** Ship 4 · Impact 5 · Found 4 · Exec 4 · Hire 5 → **Composite 86.7.**

**Verdict.** A legally-forced aligned buyer (SB-1120) and free labeled real data make this a strong,
above-Kappa founding bet — but it lands just under the clinical-verifier trio because the free data proves
a commodity axis while the true moat needs synthetic triples, a paid clinician, and a criteria-license
workaround.

---

### 8 · RewardProof — RL-grader exploit auditor — founding — 85.0

**Why it matters.** RL graders accept provably-wrong solutions; an independent cross-vendor certification
that a grader can't be gamed is the pitch.

**Data availability — SOLID.**
- **SWE-bench Verified** (princeton-nlp, **MIT**) — 500 human-validated tasks with Docker-verifiable tests;
  **pass/fail is deterministic so the artifact self-labels** (a patch passing weak tests but failing the
  gold-sanity gate is provably wrong — zero human annotation). **$0 data, ~$50–150 to run the exploit
  battery.** Downside: it's THE benchmark everyone (BenchJack, Fulcrum, the 2606.16062 authors) already
  scans.
- **R2E-Gym + Terminal-Bench + KernelBench** — public RL/agent environments to broaden the exploit corpus
  beyond the most-scanned target.
- **Self-generated exploit tuples** via the published hacker-fixer loop — where any real moat lives
  (cross-vendor breadth), but a **post-traction flywheel, not day-one IP.**
- **Private/commissioned lab graders** — the actual revenue and only proprietary data, but access-gated and
  demand is **unvalidated** (no lab has committed to requiring third-party grader certification).
- **Verdict: SOLID.** Best-possible license/access + deterministic self-labeling = zero annotation, <$200
  launch. The risk is competitive/commercial, not data. **Fallback:** pivot the seed to
  R2E-Gym/Terminal-Bench/KernelBench, or synthesize graders with injected known weaknesses.

**Annotation.** Effectively zero for the launch artifact — the deterministic gate does the correctness
call, leaving you to audit judge behavior (your strength), not hand-verify patches. Optional 2–4 hr
spot-review.

**Executability.** A solo can ship the launch artifact: free MIT data, self-labeling ground truth,
published method, <$200. **Biggest risk is not data or skill — the shippable artifact is already a
COMMODITY** (BenchJack OSS, Fulcrum YC S25, HUD's bundled detector all do the scan today; method fully
published) with an unvalidated certification-buyer.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 4 → **Composite 85.0.**

**Verdict.** Data is SOLID and Exec is a genuine 5 — but the artifact is a commodity with an unvalidated
buyer. It edges Kappa on real impact, not on a defensible founding moat.

---

### 8 · QueryProof — independent text-to-SQL answer verifier — founding — 85.0

**Why it matters.** A confidently-wrong dollar figure from a text-to-SQL system is acted on by a human —
an independent semantic verifier catches it.

**Data availability — SOLID.**
- **Self-generated corpus** — take BIRD/Spider schemas, generate SQL, apply execution-based perturbations
  in DuckDB (drop a filter, swap a join key to fan out, ignore soft-delete), **auto-label correct-vs-wrong
  by comparing execution results.** License-clean, unbounded, <$100. The day-one asset.
- **BIRD + Spider** (both **CC-BY-SA 4.0**, verified) — ample clean substrate; share-alike only triggers on
  redistributing derivative *datasets*, not on shipping a model/API.
- **BEAVER** (arXiv 2409.02038, **CC-BY 4.0**) — ~8k enterprise queries where model accuracy is 17–21% —
  the best proof-of-need headline eval.
- **NL2SQL-BUGs** — 2,018 expert-labeled semantic-error instances; **license ambiguous (no LICENSE file)** —
  optional held-out calibration, not load-bearing.
- **Verdict: SOLID.** A clean license-safe self-generation path (auto-labeled by execution) + CC-BY BEAVER
  + CC-BY-SA schemas mean zero annotation and no license risk. **Fallback:** BEAVER + Spider/BIRD alone
  with pure execution-based auto-labeling — never blocked by the one ambiguous source.

**Annotation.** Effectively ZERO — labels come from execution-based ground truth. ~4–7 hr spot-auditing
~50–100 generated pairs for perturbation realism. Matches your execution-label preference.

**Executability.** Execution-probing in DuckDB is near-zero-cost, labeling is automatic, first results are
days of work under $500. **Biggest risk is competitive timing:** SQLens (Amazon, NeurIPS'25) already
published generator-agnostic fine-grained detection, so the technical wedge is months and the moat is a
post-traction warehouse-metadata flywheel. Secondary: synthetic perturbation drift, mitigated by
calibrating against NL2SQL-BUGs/BEAVER.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 4 → **Composite 85.0.**

**Verdict.** Ship-5/Exec-5 on genuinely SOLID, self-generatable, license-clean data, and beats the
neutral-referee tier on impact — but the founding lane only ties (method already published, Bedrock
kill-risk), so the moat is a post-traction metadata flywheel, not day-one IP.

---

### 8 · MemTrust — cross-vendor agent-memory staleness referee — founding — 85.0

**Why it matters.** Agent memory silently goes stale/contradicted; a vendor-neutral adversarial referee
that catches it is un-pretrainable.

**Data availability — WORKABLE.**
- **Self-generated adversarial fact-lifecycle injection** — insert a fact, contradict/update it on a
  controlled clock, probe recall across Mem0/Zep/Letta/Cognee. **This is the moat and the product
  mechanic** — vendor-neutral, un-pretrainable, unlimited, <$150. Owned outputs.
- **LongMemEval / v2** (**MIT**, verified) — clean, on-target temporal-memory baseline (451 questions,
  1,870 trajectories); static, so vendors can optimize to it.
- **STALE** (arXiv 2605.06527, **CC-BY 4.0**) — 2026-fresh, directly on stale-memory detection; verify the
  release is posted.
- **HaluMem / MemTrace** — perfect content fit but **CC-BY-NC-ND — LEGALLY UNUSABLE in the product** (NC
  blocks commercial, ND blocks derivatives). Use only to design the synthetic generator.
- **Verdict: WORKABLE.** The best-fit ready-made corpora are NC/ND-blocked, but the product's own mechanic
  (self-generated injection) sidesteps that entirely and is free/unlimited, backstopped by MIT LongMemEval
  + CC-BY STALE. **Fallback:** synthetic battery + LongMemEval + STALE only — the leaderboard ships with
  zero licensed data.

**Annotation.** ~2–5 hr one-time — spot-check the generator's staleness/contradiction labels + calibrate
the judge. Labels are auto-emitted by the injection clock (known by construction). Exact skill match.

**Executability.** Vendors are all free-tier or Apache-2.0/OSS self-hostable; ground truth is
self-generated; total spend <$150. **Biggest risk is business, not build:** neutrality ⟂ monetization,
with no legally-forced aligned buyer (vendors are structurally disqualified as the referee), and Patronus
AI could acquire the category.

**Scores:** Ship 5 · Impact 3 · Found 4 · Exec 5 · Hire 4 → **Composite 85.0.**

**Verdict.** Data-clean and fast to ship on a self-generated adversarial corpus, with a genuinely
un-backfillable cross-vendor moat — but gated by the neutrality-vs-monetization problem and no
legally-forced buyer, landing it peer to the strong-WORKABLE tier, not in the 90+ band.

---

### 11 · Kappa — LLM-judge drift monitor — founding — 83.3

**Why it matters.** Teams gate releases on LLM-judge scores, but judges silently rot (provider model swaps,
rubric drift). Recognized, recurring pain.

**Data availability — SOLID.**
- **Your own published RAG-hallucination-judge dataset** — paired judge/human labels, fully usable, the
  exact seed. Single-domain until pilots add breadth.
- **Synthetic drift injection** — now a published, validated methodology (Judge Reliability Harness;
  "Who Drifted: System or Judge?"); manufacture ground-truth drift events on demand. ~$50–200.
- **RewardBench (ODC-BY, ex-AlpacaEval) + JudgeBench** — real human-preference pairs to baseline
  agreement/kappa; no time axis, so drift must be simulated on top.
- **Design-partner live judge outputs** — the only path to the cross-customer drift-prediction moat; slow
  to accrue, unproven cross-customer transfer.
- **Verdict: SOLID.** Every input for a v1 is free and self-generable; the only non-self-generable data
  (cross-customer drift stream) is the moat, not the MVP. **Fallback:** RewardBench + JudgeBench as fixed
  gold sets, demonstrate detection by swapping judge models — a real, reproducible, zero-cost signal with
  no simulation.

**Annotation.** Minimal — you already own labeled judge/human pairs; drift labels are synthetically
generated. 4–7 hr validation slice. No code review.

**Executability.** 6–9 wks to an OSS drift-monitor CLI + demo; free data, bullseye skill fit, <$150.
**Biggest risk is commercial:** Confident AI, Galileo, Arize/Phoenix already occupy most of this surface as
platform features, so "open" is overstated (wedge-exists). The durable moat (cross-customer drift
prediction) is un-self-generable, slow, and unproven.

**Scores:** Ship 5 · Impact 3 · Found 3 · Exec 5 · Hire 5 → **Composite 83.3.**

**Verdict.** Fastest-to-ship, lowest-data-risk candidate and a perfect hire-signal for your exact published
work — but crowded incumbents make "open" overstated, and the only real moat is neither self-generable nor
proven, capping founding upside.

---

### 11 · TrajTrust — agent-trajectory judge-of-the-judge — founding — 83.3

**Why it matters.** A cross-customer per-failure-mode disagreement corpus (where trajectory judges miss)
is the pitch. Kappa's skill at a faster buyer.

**Data availability — WORKABLE.**
- **AgentRewardBench** (McGill-NLP, HF) — 1,302 web-agent trajectories expert-labeled per-axis; **already
  in hand.** **RISK: custom research-only ToS** (HF card declares no license; CC-BY appears only on the
  paper) — cite, don't ship the corpus. And per-failure-mode labels are **thin** (side-effect base rate
  6.7%, only 15 succeeded-but-damaged, ~106/1302 double-annotated) — per-class recall is statistically
  fragile.
- **tau2-bench** (Sierra, **MIT**, verified) — clean commercial license + programmatic reward as weak
  gold, but you must **self-generate** the per-failure-mode human labels.
- **WebArena** (**Apache-2.0**, verified) — clean license + write-heavy task subsets; requires running
  agents and self-labeling.
- **Design-partner human-review streams** — the only path to credible per-class estimates and the moat;
  **zero at t0.**
- **Verdict: WORKABLE.** Free real human-labeled data exists and license-clean substrates support a demo,
  but the human labels the product sells are either thin or must be self-generated, and clean-license data
  ships no human labels. **Fallback:** tau2-bench + WebArena write-heavy subsets, self-label ~200
  trajectories (~$10–15) for a license-clean, publishable blind-spot map.

**Annotation.** ~0 new labels for a v1 blind-spot chart (reuse AgentRewardBench + run one judge); a
*defensible* per-class result needs hundreds of multi-annotator labels — beyond a solo's 4–7 hr.

**Executability.** The dry run is done, the judge harness is written and budget-verified (~$8–38) — the
most de-risked candidate on pure buildability. **Biggest risk: the demo does not establish the moat** — the
cross-customer corpus needs design-partner data that doesn't exist at t0, and free public data is too thin
for credible per-class recall, so a funded eval incumbent (Braintrust, DeepEval, Galileo) copies it in one
roadmap step.

**Scores:** Ship 5 · Impact 3 · Found 3 · Exec 5 · Hire 5 → **Composite 83.3.**

**Verdict.** Most build-ready candidate here — dry run done, clean substrates, exact skill-fit — but the
free labeled data is research-ToS + too thin for the per-class claim, and the moat requires design-partner
data that doesn't exist yet, so it ships fast and hires well but the founding data-moat is unproven.

---

### 11 · InteractionProof — drug-interaction alert verifier — founding — 83.3

**Why it matters.** Drug-interaction databases disagree worse than chance and LLMs miss ~half; an
evidence-grade verifier is the pitch.

**Data availability — WORKABLE.**
- **openFDA / DailyMed drug_interactions SPL field** — 25k+ Rx + 36k OTC labels, **CC0 (commercial-OK, no
  attribution)** — the ONLY fully license-clean, product-safe, self-generatable path. But SPL text is
  unstructured narrative lacking a clean severity taxonomy — you engineer labels yourself.
- **AIChemist 750-set + Rx-LLM** — clinician-validated, fast to a paper, but **MIXED/RISKY:** severity
  labels derive from **LexiDrug (Lexicomp, proprietary)** and licenses conflict (CC-BY vs CC-BY-NC). Ships
  the study; do NOT let the product moat depend on it.
- **OpenDDI** — 2.54M edges, but DrugBank-derived interaction content is CC-BY-NC (non-commercial).
- **Comparative-accuracy study pairs** — free validated disagreement anchors + marketing hook, too small to
  be the gold set.
- **Verdict: WORKABLE.** A license-clean commercial-safe path exists (openFDA CC0) and the core theses are
  verified — but the fastest ready-made labeled benchmarks all derive severity from proprietary sources, so
  they power the PAPER not the commercial gold set. **Fallback:** openFDA self-generated deterministic
  known-pair labels.

**Annotation.** ~4–7 hr for the accuracy/recall pilot (deterministic known-pair true/false = self-labeling).
The differentiating **evidence-grade score needs pharmacist-level judgment you lack** — defer or
design-partner-source it.

**Executability.** A solo can ship the study fast; the constraint is legally-ownable commercial data + the
clinical judgment for the evidence-grade moat, not data availability for the pilot. Audited vendors have a
documented history of refusing to be audited.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 4 · Hire 5 → **Composite 83.3.**

**Verdict.** Clears the bar at 83.3, not above: a fast, high-signal, license-clean-enough study whose
founding case stays capped because the freest labels are proprietary-derived, the evidence-grade moat needs
clinical judgment the solo lacks, and it's a copyable certification brand.

---

### 11 · VeriJudge — LLM-judge validity/confound auditor — founding — 83.3

**Why it matters.** Judges are graded on agreement, not construct validity; an auditor that isolates
verbosity/position/self-preference confounds claims the unclaimed "validity" category.

**Data availability — SOLID.**
- **LLMBar** (princeton-nlp, **MIT** verified) — 419 adversarial-instruction instances + processed sets;
  general validity stressor, not confound-isolated.
- **"Judging the Judges" 375-pair controlled set** — 200 bias-trigger + 25 length + 50 style + 100
  model-origin pairs, **verdict labeled by construction**, plus a **published construction recipe** to
  self-generate unlimited domain-specific probes. Verify the exact license before shipping released data.
- **JudgeBench** (ICLR 2025) — ~620 objective-ground-truth pairs (validity via correctness); mixed-license
  sources, vet before redistribution.
- **llm-judge-calibrator** (OSS) — a working probe battery to fork day-one.
- **Verdict: SOLID.** Multiple free commercial-safe sources + a published self-gen recipe with labels-by-
  construction. But **this same abundance caps foundingUpside** — SOLID data does not rescue the moat.
  **Fallback:** fully self-generated probes over MIT-licensed prompt sources — removes all third-party-data
  risk.

**Annotation.** Near-zero — matched-pair probes carry expected_verdict by construction. Fits inside 4–7 hr
with hours to spare; probe design + spot-checking, not manual code review.

**Executability.** Arguably the single most executable candidate — free abundant data, self-generating
labels, an OSS harness to fork, exact skill-fit; the audit report is a 6-week solo artifact. **Biggest risk
is not execution — the low execution bar is universal:** the exact technique is a public weekend copy, so
there is no data/method moat once the report lands.

**Scores:** Ship 5 · Impact 3 · Found 3 · Exec 5 · Hire 5 → **Composite 83.3.**

**Verdict.** SOLID data locks in ship-5/exec-5 — but that same public abundance is why it ties the
neutral-referee tier rather than beating it: an unclaimed category with a weekend-copyable technique,
defensible only as a neutral certification brand.

---

### 15 · AppealScore — insurance-appeal quality grader — founding — 80.8

**Why it matters.** AI-drafted insurance appeals need a grounding/quality check; the win-prediction axis is
already commoditized.

**Data availability — WORKABLE.**
- **California DMHC IMR** — free, real, labeled appeal-outcome data, license-clean for a research artifact.
  **But it labels only the already-commoditized win-prediction axis** (Rachel/Aegis/USPTO patent), not
  AppealScore's differentiated appeal-quality/grounding axis, and has no (appeal-letter → win/loss) pairs.
  **Commercial use needs OPA approval.**
- **Multi-state IMR** (Texas TDI + 3 states) — fixes CA-centric thinness, same structural gap.
- **Self-generated synthetic (denial, record, appeal) triples** — the only path to the differentiated axis,
  but synthetic with unproven transfer (the exact weakness that capped CascadeProof).
- **Real appeal-letter→outcome corpus** (PMC set / partner data) — research-only / PHI-locked,
  non-redistributable.
- **Verdict: WORKABLE.** Free labeled IMR ships a v1 cheaply, but on the commodity axis; the differentiated
  axis has no free paired data. **Fallback:** multi-state outcome corpus for volume, still no paired-appeal
  text.

**Annotation.** ~4–7 hr for the commodity-axis v1; validating the differentiated axis needs building +
adjudicating synthetic triples (fits if sample-capped). A rigorous win-calibration claim would want a paid
appeals-specialist.

**Executability.** A solo can ship a credible v1 on free DMHC data. **Biggest risk is scope:** the cheap
result proves the commodity win-prediction axis (Rachel, Aegis, granted USPTO patent already own it), and
every natural buyer is a build-not-buy incumbent that owns distribution.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 4 · Hire 4 → **Composite 80.8.**

**Verdict.** A genuinely fast, publishable eval artifact on free real IMR data — but the free data proves
the commoditized win-prediction axis, the differentiated axis has no free paired data, and every buyer is a
build-not-buy incumbent: great study, fragile company. Below its structural twin DenialProof.

---

### 15 · TriageProof — symptom-checker undertriage leaderboard — founding — 80.8

**Why it matters.** A life-or-death undertriage number across symptom-checkers, a near-verbatim re-point of
your exact method.

**Data availability — WORKABLE.**
- **Semigran 45 vignettes** (BMJ 2015) — cleanest free seed with acuity gold, but **TINY and well-worn**
  (every prior study used it) — a v1 demo number, not a moat.
- **AcuityBench** (arXiv 2605.11398) — 914 harmonized cases with the exact undertriage/uncertainty math —
  **but it publicly commoditizes the core measurement**, its clean release is pending publication, and its
  components (HealthBench CC-BY-NC, PMR-Reddit ToS) complicate a commercial corpus.
- **ER-Reason** — 25,174 real ER notes with physician ESI scores, but **PhysioNet credentialed
  research-only — the brief's "free seed" framing is incorrect;** cannot go in the public artifact.
- **Self-generated** — run named engines on Semigran + AcuityBench, grade dispositions vs gold — the real
  deliverable, bounded by the tiny public gold sets.
- **Verdict: WORKABLE.** A free deterministic-to-label seed exists (v1 ships with ~0 new labels), but
  AcuityBench commoditizes the measurement + its clean release is pending, and ER-Reason is credentialed —
  so it cannot go into the public artifact the brief assumes. **Fallback:** Semigran + HealthBench open
  rubric-graded conversations; self-generate the cross-vendor corpus.

**Annotation.** Effectively 0 new labels for v1 (gold acuity pre-labeled; disposition-vs-gold near-
deterministic). ~4–6 hr setup + spot-check. Expanding the gold set needs ER-physician adjudication you
can't self-supply.

**Executability.** A near-verbatim re-point of your published work; seed data free and pre-labeled, zero
PHI, <$500. **Biggest risk is moat, not build:** AcuityBench already publishes the exact undertriage math
(measurement commoditizing in public now), so defensibility needs a frozen vendor-blind gold set +
accumulated real cases — neither self-generable without ER-physician adjudication.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 4 · Hire 4 → **Composite 80.8.**

**Verdict.** A fast, high-impact re-point of your exact method onto a life-or-death number — clears the bar
but the data audit caps Exec at 4: the freest data commoditizes the measurement and the richest data is
credentialed, not the free product seed the brief assumed.

---

## The remaining 11 (compact)

*Composite · data verdict · one-line. Cards above cover the top 15; these round out the set.*

- **Ingestion Corruption Detector** — pilot — **80.0** · **SOLID** · Label-free parse/OCR numeric-corruption
  detector; the cleanest-to-execute pilot in the set (value-flips across renders are their own labels, free
  redistributable FinTabNet.c + SynFinTabs + unlimited public-domain SEC XBRL answer key, ~$50 CPU). Only
  real risk is the method itself (corrupted numbers may read stably-wrong across renders) — the first
  experiment settles it, and a clean null still publishes.
- **RailKit** — found — **79.2** · **WORKABLE** · Drop-in hallucination-guardrail SDK for a legally-primed
  buyer (Air Canada precedent) with a genuine correction-data flywheel; free abundant build data (RAGTruth
  MIT, HaluEval MIT) but source-data licenses (MS MARCO NC, Yelp) bar shipping it, so product/public data
  must be self-generated and the moat data only accrues post-launch — top-tier founding upside,
  product-gated shippability.
- **Reviewer Scrutiny Metric (Stamp Score)** — pilot — **78.3** · **WORKABLE** · Validated measure of
  whether humans really review AI code vs rubber-stamp; CC-BY AIDev + self-computed revert labels + GH
  Archive scale path, but the binding risk is signal/volume — the substantive-review-plus-defect-revert
  positive class is thin and can under-power. Run the power dry-run before committing.
- **GroundTruth Streams** — found — **76.7** · **WORKABLE** · Free public feeds (SEC XBRL public-domain,
  FAERS CC0) → AI-ready eval corpora with zero annotation; the single most executable candidate, but the
  thin moat over free feeds is already being eaten by Kensho/S&P's LLM-Ready API + Stanford's SEFD — treat
  as a publication + hire play (or pivot to FAERS / commercially-licensed lanes), not a venture.
- **ScreenProof** — found — **75.8** · **WORKABLE** · Sanctions-screening rationale verifier; free
  government watchlists (OFAC/EU/UN, public-domain) are the screening denominator not ground truth, the one
  large real labeled asset (OpenSanctions Pairs, 760k) is CC-BY-NC + covers the commodity entity-matching
  axis, so the differentiated rationale-grounding result runs on self-generated synthetic cases with
  unproven live transfer — a solid hire/paper artifact, founding-capped.
- **Callsmith** — found — **75.0** · **WORKABLE** · Outcome-graded AI phone-call tuning with an
  un-reproducible per-vertical transcript→CRM-outcome moat (objective, self-refreshing, vendor-un-copyable)
  — but the whole pilot is gated on landing one multi-location dental/HVAC design-partner client + CRM
  access (weeks-long sales cycle), public corpora are NC + lack outcome linkage: strong company, cautious
  first step.
- **Injection Defense Report Card** — pilot — **74.2** · **SOLID** · Independent A–F card grading
  prompt-injection defenses under adaptive attack; the cleanest pilot data path (AgentDojo MIT + deterministic
  state-diff oracle, OET MIT, CaMeL Apache, HarmBench MIT — all verified) + an elite, current hire signal
  (Promptfoo→OpenAI), but a confounded "did I attack hard enough" null and a genuinely narrow founding moat
  keep it a get-hired play.
- **PV-Grade** — pilot — **70.8** · **WORKABLE** · Public yardstick for AI on 4 high-stakes drug-safety
  decisions with regulator-mandated demand — but FAERS (CC0) lacks the narratives the faithfulness decision
  needs (FOIA-gated), licensed MedDRA threads through both free pillars, and causality gold is expert-gated
  with no clean ceiling, so the honest v1 is a 2-of-4-decision benchmark and the full version is a 9–13-week
  expertise-dependent effort.
- **SuggestionFix-Bench** — pilot — **67.5** · **WORKABLE** · Grades whether AI reproduces the fix a human
  actually merged; clean free data (CC-BY CodeReviewer + self-mined permissive pairs) and a tidy solo
  pipeline, but the verified ~8%-defect-fix base rate keeps the <500-gold volume kill genuinely
  load-bearing — run the yield dry-run before committing. A solid-not-exceptional hire play.
- **Multilingual Safety Meter** — pilot — **53.3** · **RISKY** · Statistically-honest per-language safety
  numbers under a flaky judge; license-clean (modified-MIT RabakBench) and methodologically elegant, but
  the slowest to ship, weakest for founding, and gated on a native-annotator dependency in a thin (n=132)
  Tamil set — the low-resource language that justifies the whole method is volume-fragile and its gold
  can't be self-supplied. The clear low outlier.

---

## Honest caveats

1. **These scores are a single consistent pass — but still judgment.** Everything here was re-scored
   together against shared anchors in one sitting, which fixes the old cross-stream calibration problem
   (where a 91.7 from one aperture and an 84.2 from another weren't on the same scale). What it does *not*
   fix: the rubric is applied by judgment, several composites cluster within 1–2 points of each other (the
   87.5 quartet, the 85.0 trio, the 83.3 quartet, the 80.8 pair), and small scoring differences inside a
   cluster are not meaningfully distinguishable. Treat the *tiers* as real and the *within-tier ordering*
   as soft.
2. **The "independent verifier" monetization shape is a real risk.** The convergent thesis is powerful, but
   an independent verifier can be a fundable SaaS *or* a low-margin trust/media play. The financial/clinical
   ones (DisputeProof, ReasonProof, NoteProof, DenialProof) are strongest precisely because the
   liability-holder is the paying buyer — but the neutral-referee family (Kappa, VeriJudge, TrajTrust,
   MemTrust, Injection Report Card) faces the "vendors won't pay to be audited" trap, which is why they cap
   in the low-80s despite SOLID data.
3. **Per-candidate GTM drags are real and named.** Even the top bets carry a specific go-to-market
   headwind: DisputeProof's outcome-proxy headline, TieProof's unobtainable cross-firm corpus + slow
   audit-firm sales, ReasonProof's controlled-study gap + AVAAS incumbent + examiner-gated procurement,
   NoteProof/PortalProof's gated EHR distribution, DenialProof's payer procurement + Brellium fast-follow,
   and the whole neutral-referee tier's copyable-technique problem. A high composite means "worth
   deep-vetting," not "de-risked."

---

## Recommendation and next step

### The single best pick by your criteria

**DisputeProof (91.7).** In a three-way tie at the top (with TieProof), it wins the tiebreak on the one
thing that matters most for a solo part-timer: **its data is genuinely SOLID** — free, public-domain,
daily-updated, zero license/ToS friction, downloadable today — where TieProof's differentiating channel
must be self-generated and its true moat corpus is unobtainable. DisputeProof pairs that with the most
*legally-forced* buyer in the set (EFTA §1693m private right of action + a confirmed class-action surge that
does not depend on CFPB enforcement appetite) and a near-verbatim reuse of your published grounding judge.
The one caveat (a monetary-relief outcome *proxy* for the seed labels) has a clean synthetic-defect
fallback that grades the real product input. If you run exactly one founding bet, run this.

### Best founding bet

**DisputeProof (91.7)** — for the reasons above. If you want a clinical rather than financial vertical, the
best-data clinical founding bet is **NoteProof (87.5, SOLID)** — free CC-BY zero-PHI ACI-Bench + an aligned
signing-physician buyer.

### Best fast-artifact / hire pilot

**Ingestion Corruption Detector (80.0)** — the cleanest-to-execute pilot: label-free core signal, free
redistributable data, ~$50 CPU compute, null-proof, and a genuine one-step-upstream extension of your
published work. It's the lowest-friction way to ship a real public artifact and a strong hire signal fast.

### The 2–3 to actually run, for breadth

Your operating principle is breadth: run a small portfolio across different areas and let real-world
engagement decide. The honest way to do that is to **mix one fast-ship pilot with one high-ceiling founding
bet**, so you're not betting the whole quarter on a single outcome shape.

1. **Ingestion Corruption Detector** *(pilot — fastest, lowest-risk, null-proof)* — your anchor and the
   quickest path to a shipped artifact + hire signal. Data is SOLID and the only risk is a publishable
   method null.
2. **DisputeProof** *(founding — best overall + best founding bet)* — the swing for the fence. SOLID
   public-domain data, a legally-forced buyer, and a near-verbatim reuse of your judge. Start the v1 in
   parallel; the data download and judge re-point are days of work.
3. *(Optional third)* **NoteProof** *(founding — best-data clinical vertical)* if you want a second
   founding shot in a different vertical, or **Kappa** *(founding — easiest + best hire signal)* if you'd
   rather run the cheapest, most skill-perfect neutral-referee bet in the background — eyes open that its
   founding lane is contested by funded incumbents.

**The honest tradeoff.** Ingestion + DisputeProof gives you one thing that ships fast *and* one thing with
the best ceiling and the cleanest founding data in the set — the strongest two-bet portfolio by your own
weights. If your priority right now is *getting hired fast* over founding, swap DisputeProof for a second
pilot (**Injection Defense Report Card**, elite current hire signal, or **Reviewer Scrutiny Metric**,
bulletproof problem) — you lose founding ceiling but gain speed and legibility.

### Concrete next step

**Run the DisputeProof data + judge dry run this week.** Pull the CFPB CCDB EFT/unauthorized-transaction
slice (free bulk download or the Open Data API), re-point your published RAG-grounding judge at
~150–300 stratified complaint narratives, and check agreement between the judge's defensibility verdict and
the monetary-relief outcome proxy. That single experiment (a few days, ~$0) settles the one real risk —
whether the outcome proxy is signal or noise — and tells you whether to proceed on real CCDB data or pivot
to the synthetic-defect fallback. **In parallel, kick off the Ingestion dry run** (render ~50 FinTabNet.c
tables at 150/200/300 DPI, flag value-flips, check the render-only slice is non-empty) so your fast pilot's
one method risk is settled the same week.
