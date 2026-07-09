# 20 · Decision & Ranking — the one place to choose from

*Written 2026-07-09. This is the single master decision document. It consolidates every candidate
we generated, re-shaped, method-transferred, validated, and data-audited across
[docs 11–19](README.md) into one ranked, stand-alone picture. If you read nothing else, read this.
It supersedes the scattered analysis: where an earlier doc and this one disagree on a number or a
license, **this doc is current.***

---

## What this document is

You now have **11 fully-worked candidates**: 6 research pilots (which ship a paper or a public
artifact fast) and 5 founding bets (higher-ceiling, slower, and — this matters — *companies, not
credentials*). Each has been checked the same way: is the problem real, is the data actually
obtainable and license-clean, how much of your own labeling does it need, can a solo pull it off for
≤$500, and what does a good outcome buy you.

This doc turns all of that into **one ranking, three shortlist picks, and eleven honest cards** so
you can decide without re-reading the raw logs.

**A note on the two types, because it changes how you read the scores:**

- A **research pilot** is a small study you can actually run — ≤$500, part-time, solo — ending in a
  public artifact (a short paper, a released dataset, an OSS tool) with a pre-written win-or-kill
  line. It buys you a *credential* and a *hire signal* fast, and sometimes a founding wedge as a
  bonus.
- A **founding bet** is the seed of a *company*. It can still produce a shippable artifact, but its
  reason to exist is a durable business with a moat. These score higher on founding-upside by
  construction and lower on ship-speed, because a company needs paying users, and several of them
  have a genuine cold-start (no data until a customer shows up).

Do not compare the two types on founding-upside alone and conclude the pilots are weak — a pilot
scoring 4 on founding-upside is remarkable *for a pilot*.

---

## The criteria and exactly how they're weighted

The ranking is computed from **your** stated priorities, not generic ones. Five criteria, each scored
1–5 per candidate, combined into a **0–100 composite** with these weights:

| Criterion | Weight | What it asks |
|---|:--:|---|
| **Ship-speed** | **3.0** | How fast to a public artifact/result? *(your highest priority)* |
| **Impact** | **2.5** | Is the problem real, high-stakes, and does the work move it? |
| **Founding-upside** | **2.5** | Could this become a durable company with a moat? |
| **Executability** | **2.5** | Can *you* actually do it — data, cost, skill-fit, risk? |
| **Hire-signal** | **1.5** | How legible/valuable as a credential to the teams you'd join? |

Two derived views, because the "best" candidate depends on what you're optimizing for:

- **Best potential outcome** = impact + founding-upside + hire-signal (the ceiling if it works).
- **Easiest executability** = executability + ship-speed (the lowest-friction path to *something*).

Composite is the weighted average of all five, rescaled to 0–100. The outcome and ease scores are
rescaled the same way.

---

## Master ranking (all 11, by composite)

| # | Candidate | Type | Composite | Ship | Impact | Found | Exec | Hire | One-line |
|--:|---|---|:--:|:--:|:--:|:--:|:--:|:--:|---|
| 1 | **Ingestion Corruption Detector** (MetaParse + LedgerParity) | pilot | **84.2** | 4 | 4 | 4 | 5 | 4 | Label-free detector for numbers silently mangled at parse time — strongest all-rounder, and a real founding wedge into a $100M-funded parsing-reliability market. |
| 2 | **Kappa** — judge-trust / eval-drift monitoring | founding | **83.3** | 5 | 3 | 3 | 5 | 5 | Catches LLM-judges silently rotting; fastest-ship, best skill-fit, best hire artifact — but founding lane is contested by funded incumbents. |
| 3 | **PV-Grade** (pharmacovigilance decision benchmark) | pilot | **77.5** | 3 | 4 | 4 | 4 | 5 | Public yardstick for AI on 4 high-stakes drug-safety decisions; regulator-mandated demand, best hire+found bet, slowest of the top pilots. |
| 4 | **Reviewer Scrutiny Metric** (Stamp Score) | pilot | **76.7** | 5 | 4 | 2 | 4 | 4 | Validated measure of whether humans really review AI code vs rubber-stamp; bulletproof problem, fast, but weak founding upside. |
| 5 | **GroundTruth Streams** (structured-public-data corpora) | founding | **76.7** | 5 | 3 | 2 | 5 | 4 | Turns free public feeds (SEC XBRL, FAERS) into AI-ready eval sets; fastest cheapest ship, but thin moat over free data an incumbent is already accumulating. |
| 6 | **RailKit** — drop-in hallucination guardrail SDK | founding | **71.7** | 4 | 3 | 3 | 4 | 4 | Your RAG-judge work productized as a reliability SDK; strong hire signal, but the "priced-out solo founder" wedge is already crowded. |
| 7 | **ToolTamer** — agent tool-call repair | founding | **67.5** | 4 | 3 | 2 | 4 | 4 | Small model that repairs malformed agent/MCP tool calls; the headline feature already ships free in Vercel AI SDK. |
| 8 | **Injection Defense Report Card** | pilot | **65.8** | 4 | 3 | 1 | 4 | 5 | Independent A–F card grading prompt-injection defenses under adaptive attack; highest+most-current hire signal, no founding upside. |
| 9 | **Multilingual Safety Meter** (Ternary-PPI) | pilot | **62.5** | 3 | 4 | 1 | 4 | 4 | Statistically-honest per-language safety numbers under a flaky judge; high-impact nonprofit/hire play, essentially no founding upside. |
| 10 | **Callsmith** — outcome-graded AI phone-call tuning | founding | **59.2** | 2 | 4 | 4 | 2 | 3 | Grades/tunes any voice bot on real booking conversions; biggest market + best full-arc fit, but hard cold-start — nothing ships without a live client. |
| 11 | **SuggestionFix-Bench** | pilot | **54.2** | 3 | 3 | 1 | 3 | 4 | Grades whether AI reproduces the fix a human actually merged; clean hire artifact, but crowded space and a real gold-volume kill risk. |

---

## Three picks that matter

### The overall #1 (by your criteria): **Ingestion Corruption Detector** — 84.2

It wins because it's the only candidate that's strong on *every* axis at once. It's **label-free** —
the detector manufactures its own labels by re-rendering a document at different resolutions and
flagging numbers that flip, so there are zero labels to run it and only ~3–6 hours of your own
spot-checking. Release-clean data is solved (FinTabNet.c under CDLA-2.0, SynFinTabs under CC-BY-4.0),
core compute is ~$50 because it's CPU-only, and it's a direct one-step-upstream extension of your
published RAG-hallucination-judge work. And unlike the other pilots, it has a *genuine* founding
wedge: the OSS render-invariance "run-it-yourself" integrity checker is exactly what enterprise
procurement is asking for, in a market that just absorbed $100M+ of parsing-reliability funding
(Reducto alone: $108M raised, ~$40M ARR). It's even null-proof — if corrupted numbers read
stably-wrong across renders, that clean negative still publishes and characterizes OCR failure modes.

### Best potential outcome: **PV-Grade** — outcome score 86.7

If you weight *ceiling* over *ease* (impact + founding + hire), PV-Grade is the top of the set. Three
forces line up that no other candidate gets all of: **regulators now mandate independent, decision-
specific validation** of drug-safety AI (FDA Jan-2025 draft guidance; CIOMS Working Group XIV,
Dec-2025), **no public benchmark exists** for the four consequential PV decisions, and — rare — **the
party being graded actually wants a credible score** to show regulators, which inverts the usual "who
pays to be measured" problem. It's the most role-specific credential in the set (ArisGlobal, Oracle
Health, IQVIA, Veeva, PV-AI startups) and has a real institutional-trust moat. The catch is that its
causality-gold dependency makes it the slowest of the top pilots — ship a narrow 3-decision v1 first.

### Easiest executability: **Kappa** — ease score 100

If you just want the lowest-friction path to a real, shipped result, Kappa is it: perfect ease score.
The data is ready (NVIDIA's Judge's Verdict benchmark is purpose-built for exactly this, plus your own
study seeds the demo), the math is standard agreement/kappa work you already do, there's ~0 new
labeling, no code review, and it's under $150 all-in for a 6–9-week OSS CLI + drift report. It's also
the single most legible proof-of-expertise for an eval/reliability seat — the incumbents themselves
(Galileo, Braintrust, Confident AI, Patronus) are plausible employers. The honest caveat is that as a
*company* the lane is contested; treat the founding angle as a wedge to prove, not an open field.

---

## The eleven cards

*Ordered by composite. Each card gives you: why it matters, whether the data is real, what you'd have
to label, whether you can execute it, what a good outcome buys, the scores, and a verdict.*

---

### 1 · Ingestion Corruption Detector (MetaParse + LedgerParity) — pilot — 84.2

**Why it matters.** Silent numeric corruption at the parse/OCR step is a documented, high-stakes
failure no RAG eval tool catches. OHR-Bench (ICCV 2025) shows even the best OCR loses ~14% F1 overall,
with tables degrading worst; FinCriticalED (Nov 2025) finds digits, decimals, signs, and unit markers
are the *most* error-sensitive OCR elements and "have not yet achieved the reliability required for
high-stakes financial interpretation." A flipped figure produces a confident wrong answer with no
exception raised — blast radius is finance/legal/medical RAG. Market pull is strong and growing:
Reducto raised $108M (a16z-led $75M Series B), ~$40M ARR, 1B+ pages processed, and just shipped an
"Agentic OCR" self-review layer. Procurement sentiment — "the only benchmark you should trust is one
you run yourself" — is *literally* a demand for a label-free per-document integrity checker.

**Data availability.** Four researched options.
- **OHR-Bench** (HF, ICCV 2025) — human-verified per-cell gold for 8,500+ pages incl. finance. License
  conflict (CC-BY-4.0 but "research only"): **measure-only** — benchmark against it, don't re-release.
- **FinTabNet.c** (HF) — ~89k pages / 112k S&P-500 tables, cell structure + coords, source PDFs are
  public-domain SEC filings. **CDLA-Permissive-2.0 — the release-safe anchor.**
- **SynFinTabs** (HF, arXiv 2412.04262) — 100k synthetic tables + open generation code. CC-BY-4.0 and
  regenerable, so you can *plant* known corruptions to measure detector recall precisely.
- **SEC EDGAR Inline XBRL** (data.sec.gov) — public-domain tagged facts; a nightly cron could score any
  pipeline's "numeric survival rate" forever (the LedgerParity leaderboard).
- **Verdict:** *solved* for the core method (it's label-free; validation gold comes free from
  FinTabNet.c/SynFinTabs, OHR-Bench measure-only). The only non-trivial data engineering is XBRL-to-
  cell alignment for the leaderboard — the secondary artifact, scope it down or defer.

**Annotation.** Zero labels to *run* it — value-flips across renders are the labels. Validation only:
~50-cell perturbation-nullity audit + ~50–100 render-only-flag adjudication, **you alone, table-
literacy only** (read "(1,234)" = −1,234; no accounting/ML/code-review). ~3–6 hrs total. **Best
labeling profile of the six pilots**; comfortably inside your 4–7 hr ceiling.

**Executability.** ~9–13 part-time weeks realistic (a public v1 in a few weeks; the sink is the
rigorous head-to-head Venn analysis and optional XBRL alignment). Cost well under $500 (~$50 CPU +
~$100–200 API). Excellent skill-fit — your stack, one step upstream. **Top risk:** method could be a
null if corrupted numbers read stably-wrong across resolutions (the pre-registered kill line); DPI
sensitivity is empirically real (~200 DPI optimum), so the render-only slice is plausibly non-empty —
but genuinely unknown until the dry run. Secondary risk: XBRL alignment eating weeks — demote
LedgerParity to v2 if so.

**Outcome.** Publishable (FinNLP@EMNLP / RAG-eval workshop + a used OSS tool/leaderboard; NeurIPS D&B
stretch), and **null-proof** — a clean negative publishes at DMLR/TMLR. **Scoop check passes:** closest
works (Semantic Integrity, OCR-Reasoning-Robustness, Cross-Modal Inconsistency, FinCriticalED,
Consensus Entropy) all use ground truth or a different axis — none uses same-parser-many-renders
value-flips as a label-free corruption detector. Hire signal strong (Reducto/Unstructured/LlamaIndex,
RAG-eval teams). Founding upside genuine but earned-over-time — tied-best in the set with PV-Grade;
the moat is institutional trust via a used artifact, not defensible tech.

**Scores:** Ship 4 · Impact 4 · Found 4 · Exec 5 · Hire 4 → **Composite 84.2** (outcome 80, ease 93.3).

**Verdict.** The strongest all-around bet: easiest to execute, fast to a public artifact, null-proof,
and — via the OSS checker rather than the crowded leaderboard — a real founding wedge into a
just-funded market. The one genuine risk (a method null) the design turns into a publishable finding.

---

### 2 · Kappa — judge-trust / eval-drift monitoring — founding — 83.3

**Why it matters.** Teams gate releases and compliance dashboards on LLM-as-judge scores, but judges
silently rot — provider model swaps and rubric drift arrive with no warning. Drift is documented
(GPT-4 prime-identification accuracy fell 84%→51% over three months in 2023; a 2026 LLM-supply-chain
study found ~22.9% of prompt behaviors regress on model updates). The eval/observability category is
large and funded (Braintrust: $80M Series B at $800M, Feb 2026; Galileo, LangSmith, Arize, Confident
AI all active), and every 2026 best-practice guide prescribes continuous judge calibration against
human labels via Cohen's kappa — so the pain is recognized, not hypothetical.

**Data availability.** Four options; **strongest data story of any candidate.**
- **NVIDIA Judge's Verdict** (HF/GitHub, arXiv 2510.09738) — 1,994 items × 3 expert annotations (5,982
  total), judge-vs-human on RAG answer accuracy, inter-annotator κ=0.79. **Purpose-built for exactly
  this.** Verify HF license before commercial redistribution.
- **Your own RAG-hallucination-judge study data** — release-clean, on-brand (your published work *is*
  the product). Narrow (one domain) until pilots add breadth.
- **Chatbot Arena / MT-Bench / UltraFeedback / RewardBench-2** — tens of thousands of human-preference
  pairs for volume. **License triage required:** UltraFeedback MIT (OK), RewardBench-2 ODC-BY, Arena
  *outputs* CC-BY-NC (non-commercial — research-only).
- **Synthetic drift** (BabelJudge-style perturbations; judge/model-version replay) — the *only* way to
  demonstrate the core promise, since public sets are snapshots. Under $100.
- **Verdict:** *solved* — judge-vs-human paired data is abundant and free. The one gap is longitudinal
  drift, which you synthesize (cheap, standard) — that's the differentiating asset, not a download.

**Annotation.** First result: ~0 new labels (Judge's Verdict already carries 3 expert annotations/
item). Scaled: a thin per-customer human-label stream sourced from *customers'* review queues, not you.
Your hands-on stays at a 4–7 hr validation slice. No code review — pure scoring/label-comparison, your
home turf. **Strong fit.**

**Executability.** 6–9 part-time weeks to an OSS judge-drift-monitor CLI + drift report — the low end
of the band because data and math are ready. Under $150 all-in. **Best skill fit on the whole slate.**
**Top risk:** the competitive whitespace is thinner than hoped — Evidently (OSS) already ships
judge-vs-human kappa + 20+ drift tests + alerting; Galileo Autotune converts SME corrections into
calibration; DeepEval/Confident AI monitor judges over time. The value can collapse into a feature
incumbents bundle, so you must win the unclaimed sliver: **platform-agnostic cross-customer drift
*prediction* + a portable judge-trust badge**, not drift detection per se.

**Outcome.** High for a pilot write-up ("measuring and predicting LLM-judge drift" with kappa curves)
— sits next to Judge's Verdict/BabelJudge. **Very strong hire signal** — the most legible eval/
reliability credential, with incumbents as plausible employers/acquihirers. Founding upside moderate:
real recurring anxiety-driven pain, and a genuine data-flywheel moat (cross-customer disagreement
stream that predicts miscalibration *before* the customer's own gold set), but the moat only accrues
after paying design partners — pre-traction it's a promise.

**Scores:** Ship 5 · Impact 3 · Found 3 · Exec 5 · Hire 5 → **Composite 83.3** (outcome 73.3, ease 100).

**Verdict.** GO — the fastest-to-ship, best-skill-fit, cleanest-data bet and an outstanding hire
artifact. Rank it top for ship-speed/executability/hire. Treat founding upside as a wedge to prove
(incumbents already ship drift+kappa features); the one defensible edge is standalone cross-customer
drift *prediction*.

---

### 3 · PV-Grade (pharmacovigilance decision benchmark) — pilot — 77.5

**Why it matters.** Regulators now demand decision-specific, independent validation of drug-safety AI
(FDA Jan-2025 draft guidance on AI credibility; CIOMS Working Group XIV, Dec-2025, the first
consensus framework, with "validity and robustness" as a core principle). Yet no public yardstick
exists for the four consequential PV decisions (causality, seriousness, expectedness, faithfulness) —
vendor due-diligence tells buyers to hand-build their own ~100-case sets. Stakes are direct (a missed
serious/causal reaction harms patients and creates liability) and the market is real (~$2.86B PV
software in 2026, ~13% CAGR; Oracle Argus ~60% share, ArisGlobal, IQVIA all aligning AI roadmaps to
these mandates). **The graded party wants a credible score** — the incentive is inverted.

**Data availability.** Four options.
- **openFDA FAERS** — millions of reports, CC0, no IRB. Structured fields only → you template cases
  into narratives (an audit burden). MedDRA-coded reactions (see caveat).
- **i4Ds/drug-safety-narratives** (GitHub) — 1,139 *real* FAERS narratives via FOIA, **MIT**. No
  structured labels shipped (join back by case ID); a supporting/validation set, not the full
  benchmark, but strengthens external validity.
- **OnSIDES** (tatonetti-lab) — 7.1M drug-ADE pairs, **MIT**, for expectedness reference lists.
  MedDRA-coded, so expectedness gold inherits the MedDRA constraint.
- **Published clinical rules** (WHO-UMC, Naranjo, ICH E2B/E2A, CIOMS) — free public docs; make
  seriousness/expectedness deterministic and free. Causality does *not* reduce to a rule.
- **Verdict:** *largely solved* — FAERS (CC0) + real FOIA narratives (MIT) + OnSIDES (MIT) + free
  rules give **3 of 4 decisions essentially free at scale.** Gaps: (a) MedDRA-licensed strings — ship
  a rebuild script + de-MedDRA'd labels; (b) causality — an annotation problem, not availability.

**Annotation.** ~60–80 causality cases + ~100 faithfulness items to start. Seriousness (~1,000) and
expectedness need **zero** new labels (rule-derived). Faithfulness you label yourself (your RAG-
grounding competency). **Causality needs genuine PV/clinical expertise** as a second rater (a lay
label isn't defensible) — the one thing you can't fully self-supply. Recruitable: medical experts on
Upwork at $22–35/hr; a comparable PV study cost ~$1,432 total. Your 4–7 hrs + a paid clinician session
(~$150–250 for 60–80 cases). No code review anywhere. **YELLOW, not a blocker** — the causality gold
is small, cheap, and recruitable.

**Executability.** ~9–13 part-time weeks (narrow v1 deferring causality ~6–8). ~$150–350 total. Very
strong skill-fit; only causality outsourced. **Top risk:** low causality inter-rater agreement caps
the headline — but a pre-registered null still publishes and ships the other 3 decisions.

**Outcome.** Strong and near-null-proof (low model scores *are* the regulatory-relevant headline).
Homes: ML4H / GenAI4Health / ClinicalNLP workshop + a *Drug Safety*/JAMIA short paper (highest-leverage
for the hire/found audience); borderline NeurIPS D&B. **Highest, most role-specific hire signal in the
set** (ArisGlobal, Oracle Health, IQVIA, Veeva, PV-AI startups). Founding upside genuine but
conditional — sponsors pay for a private continuously-refreshed validation set; moat is institutional
trust. **Validate willingness-to-pay early:** a signed "your PV-AI is X% wrong on causality" report is
discoverable legal evidence, so a cautious pharma lawyer may want the yardstick to *exist* but refuse
to be scored on the record.

**Scores:** Ship 3 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 77.5** (outcome 86.7, ease 73.3).

**Verdict.** GO — the strongest founding-and-hire bet in the set (regulator-driven demand, verified
near-free data, elite skill-fit). Only caveat: the causality-gold dependency makes it the slowest of
the top pilots to a *complete* artifact — ship a narrow 3-decision v1 first to protect ship-speed.

---

### 4 · Reviewer Scrutiny Metric (Stamp Score) — pilot — 76.7

**Why it matters.** Human review is the last checkpoint between autonomous-agent code and production,
and the evidence it's decaying is strong and multi-sourced: Anthropic's production data shows
auto-approval climbing ~20%→40%+ with session count (trust/habituation, not model improvement);
"Habituation at the Gate" (arXiv 2606.22721, 400 reviewers / 11,429 reviews) finds approval up
+14.5pp with inline-comment effort down 22%. It's industry-scale (AIDev: ~933k agent-authored PRs
across 116k repos), the downstream cost is measurable (DORA + Faros AI: incident-per-merged-PR more
than tripled with AI adoption), and regulation is converging (EU AI Act Art. 14 treats rubber-stamping
as non-compliant). **Flagged internally as the most bulletproof problem in the program.**

**Data availability.** Four options.
- **AIDev** (HF + Zenodo) — curated subset 33,596 agent PRs from 2,807 repos with reviews, inline
  comments, approval records + timestamps, diffs. Release derived feature/outcome tables keyed to
  public IDs (repos keep their own licenses — clean). Volume trap: only ~15% of merged agent PRs carry
  a substantive review.
- **Revert/hot-fix labels** — self-generated from git history (deterministic). The ground-truth moat
  *and* the biggest risk: reverts are ~2.7% of merge deviations and noisy (rollbacks/dep-bumps), so
  the answer key is small and partly mislabeled.
- **GH Archive on BigQuery** — the whole public GitHub firehose, 1 TB/month free — the scale fallback
  to lift the positive class above the power floor.
- **Widen agent-PR set via known bot accounts** — potentially hundreds of thousands of agent PRs; the
  concrete lever for the power question.
- **Verdict:** *solved* for inputs and largely for outputs. The unsolved part is **volume** — whether
  enough defect-driven reverts co-occur with reviewed agent PRs to power the test. A cheap first-week
  dry-run question, not a blocker.

**Annotation.** ~150–200 review artifacts hand-labeled on 4 binary depth features + ~50 reverts triaged
defect-driven vs. rollback. **You alone, ordinary working-engineer review-literacy** (substantive
objection vs. style nit). Outcome labels free from git; depth scores LLM-generated at scale. It's
*reading* reviews, not authoring code fixes — **dodges the code-review dislike.** Inside 4–7 hrs.

**Executability.** 6–9 part-time weeks (lightest/fastest of the pilots alongside Ingestion). ~$100–200.
Near-perfect skill-fit (direct reuse of your hallucination-judge methodology). **Top risk:** statistical
power / thin positive class — the reviewed-AND-reverted intersection may be too small at 3–5 repos.
Mitigation built in (GH Archive scale-out + a blinded power dry-run *before* the confirmatory test),
and a rigorous null still publishes, so the risk caps finding-strength, not shippability.

**Outcome.** Solid workshop grade (HEAL@CHI, KDD-SE, MSR/EASE) + released dataset; MSR registered-report
upgrade. **Null-robust** ("review depth does not predict escaped defects, here's a better proxy" is
welcomed). Clear novelty delta (Habituation uses shallow proxies + no defect validation; CRScore
validates against human ratings not realized defects). Strong current hire signal into a well-funded
AI-code-review sector (CodeRabbit $60M Series B ~$550M; Greptile $25M Series A; ~$420M ARR category).
**Founding upside weak — the honest limit:** output is a standard/measurement whose only moat is
institutional trust, the product adjacency is crowded/capitalized, and no graded party is a paying
buyer (unlike PV-Grade). Nonprofit/hire is the realistic ceiling.

**Scores:** Ship 5 · Impact 4 · Found 2 · Exec 4 · Hire 4 → **Composite 76.7** (outcome 66.7, ease 86.7).

**Verdict.** A GO and a top-tier ship-speed pick — your exact skillset, free/verified data, ~$100–200,
no code review, null-robust: the sharpest fast credential in the set. But treat it as a **hire/nonprofit
play** (founding upside is genuinely weak) and settle the thin-revert power question with a dry-run in
week one before committing.

---

### 5 · GroundTruth Streams (structured-public-data corpora) — founding — 76.7

**Why it matters.** Every fintech/reg-tech/health AI team re-does the same drudgery: pulling structured
public feeds (SEC XBRL, FAERS) and cleaning them into grounded QA/eval sets, because raw feeds ship as
relational dumps needing DB expertise. Financial reasoning is an active pain point (FinanceBench,
SEC-QA, FinTagging, FinAuditing, PHANTOM, FinGround all 2024–26), and the training-data market is
enormous (Surge ~$1.2B revenue; Mercor $10B valuation; Anthropic reportedly discussing $1B+ on RL
environments). Fresh grounded eval data is the scarce input for trustworthy financial/health LLMs.

**Data availability.** Four options — **best-in-class.**
- **SEC EDGAR XBRL** — public-domain, ~3000 TB/yr served free; quarterly zips + no-auth JSON APIs.
  Release-clean for commercial redistribution of *derived* corpora. **Most contested** — Kensho (S&P
  Global) already published SEC-QA, the same "accumulation clock" from a resourced incumbent.
- **FDA FAERS / openFDA** — public/open, redistribution-friendly; genuinely underserved for AI-ready
  packaging, but needs relational-DB assembly and the health-AI buyer pool is narrower.
- **USPTO PatentsView + ClinicalTrials.gov AACT** — open bulk data; diversification that proves the
  "many public streams" thesis, but each is a fresh cleaning project with no shared pipeline leverage.
- **Existing open financial eval sets** (FinanceBench, FinQA, TAT-QA, ConvFinQA) — scaffolding + gap-
  map; notably FinanceBench is CC-BY-NC (non-commercial), leaving a clean commercially-licensed opening.
- **Verdict:** *completely solved, best-in-class* — multiple free, public-domain, release-clean,
  continuously-updated feeds with zero annotation. **The bottleneck is not data; it's differentiation**
  — the raw material is equally free to every competitor.

**Annotation.** Effectively zero. ~500 grounded numerical-QA + hallucination-eval pairs auto-generated
from XBRL facts with Claude judges; your only human effort is a 4–7 hr hand-validation of a ~50–100
stratified slice (a spot-check that doubles as the publication's credibility metric). No domain
annotators, no crowd, no code review. XBRL provides ground-truth values, so labels self-source.

**Executability.** 3–6 part-time weeks to a shippable pilot — **among the fastest of all candidates.**
Well under $500. Near-perfect skill-fit (pure data-pipeline + LLM-as-judge). **Top risk: differentiation,
not execution.** The accumulation clock is weak against a solo — Kensho already built continuously-
refreshing SEC-QA, free academic corpora proliferate, and the high-value data-for-labs market is
dominated by funded players (Surge, Mercor, Scale). The real risk is building a beautiful corpus
nobody pays a recurring fee for.

**Outcome.** High for a pilot artifact (a fresh, commercially-licensed, continuously-refreshing
financial hallucination/numerical-reasoning eval set with judge-agreement numbers → HF release +
EMNLP/NeurIPS-D&B/FinNLP writeup). Strong hire signal — arguably **best pure hire-signal-per-week** —
a public data+judge pipeline is a direct audition for data-foundry/lab-data teams. **Founding upside
is the weakest dimension:** thin moat over free public data, out-accumulable by incumbents; a data
product/on-ramp, not a venture company. Defensible variants only: a narrow commercial-license wedge
(vs CC-BY-NC free sets) or a pivot to expert-verified RLVR verifiers where labels stop being free.

**Scores:** Ship 5 · Impact 3 · Found 2 · Exec 5 · Hire 4 → **Composite 76.7** (outcome 60, ease 100).

**Verdict.** A near-perfect fast, cheap, zero-annotation **ship-and-hire** bet (and an ideal always-on
background project extending your published work), but a **weak founding bet** — the moat is free public
data an incumbent (Kensho/S&P) is already accumulating. Treat it as a publication + hire-signal play,
not a company, unless you pivot toward commercially-licensed or expert-verified RLVR verifiers.

---

### 6 · RailKit — drop-in hallucination guardrail SDK — founding — 71.7

**Why it matters.** Hallucination liability is live and priced: *Moffatt v. Air Canada* (2024) held a
company liable for its chatbot's invented policy; in April 2025 Cursor's own support bot fabricated a
login policy that drove real cancellations. The exposed population is huge (YC batches ~60% AI, ~11%
solo, "vibe-coder" founders shipping AI-native SaaS everywhere), and willingness-to-pay is externally
validated — affirmative AI E&O insurance covering hallucinations now exists (Vouch, Munich Re aiSure/
Mosaic up to $15M, HSB).

**Data availability.** Four options.
- **RAGTruth** (MIT) — ~18k responses / ~3k source instances, span-level hallucination annotations.
  Best free seed for the grounding judge + a cheap distilled classifier; generic domains, not vertical
  policy text.
- **HaluEval** (MIT) — 35k QA/dialogue/summarization pairs for judge benchmarking + hard-negative
  mining; synthetic hallucinations skew easy vs. real silent errors.
- **HaluBench** (Patronus) — 14,900 CQA-label rows. **CC-BY-NC — non-commercial:** great as a published
  pilot benchmark, but keep out of the shipped product/moat data.
- **Pilot correction/override logs** (generate live) — the *only* defensible dataset, un-backfillable,
  but a chicken-and-egg cold-start: zero on day one, thin from small seed customers.
- **Verdict:** bootstrap data *solved* (RAGTruth + HaluEval MIT fully seed the judge + a distilled
  classifier for free); the **moat data is not solved** — the cross-domain correction corpus only
  exists after paying customers route live traffic, exactly the resource a solo lacks.

**Annotation.** First judge: 0–200 self-labels; scaled: none of yours — moat labels auto-mined from
pilot override/block actions ("this was fine" / "this was wrong" *is* the label). You validate a
~100–200 RAGTruth/HaluEval slice. No code review. $0–50. Fits the ceiling comfortably.

**Executability.** A thin SDK (wrap one outbound LLM call, run a domain-configured grounding judge,
block/route/log) is 3–5 part-time weeks; the credible founding version (hosted judge + dashboard +
distilled classifier) is 9–13 weeks. Under $500 (Haiku-class judge ~$0.15–0.30 / 1k messages). Very
high skill-fit — your published RAG-judge work productized. **Top risk: wedge erosion, not build** —
the "solo founder priced out of Galileo" gap is largely already served: Patronus ships self-serve
pay-as-you-go eval+guardrails with a hallucination model (Lynx), Guardrails AI Pro is a managed
service, natural-language rule config already exists (Maxim/Bifrost, GraySwan Cygnal), Guardrails AI
OSS is free. Differentiation must be the cross-domain flywheel + English config — thin and cold-start-
dependent.

**Outcome.** Moderate as a pilot (an English-configured-judge-vs-human agreement study on RAGTruth/
HaluBench extends your paper → EMNLP/NeurIPS workshop or a strong blog+HF release; least novel of your
candidates scientifically). Strong hire signal — a shipped reliability SDK + hosted judge + live
cost/latency/agreement chart is exactly what Galileo/Patronus/Braintrust hire for. Founding: real,
funded category (Galileo ~$68M, Patronus $50M Series B) with a reachable buyer, but you'd enter where
funded incumbents already offer self-serve English-configured guardrails, competing on a flywheel moat
you don't yet have.

**Scores:** Ship 4 · Impact 3 · Found 3 · Exec 4 · Hire 4 → **Composite 71.7** (outcome 66.7, ease 80).

**Verdict.** Fastest, cheapest, most skill-aligned path to a shippable reliability SDK and a strong
hire signal — but as a founding bet the "priced-out solo founder" wedge is already crowded and the only
real moat is a correction corpus with a hard cold-start. **A conditional go:** build it fast for the
artifact and hire leverage; treat the company as an upside option, not the thesis.

---

### 7 · ToolTamer — agent tool-call repair — founding — 67.5

**Why it matters.** Tool/MCP calls are the point of maximum pain in the 2026 agent wave: 52% of
enterprises run agents in production, and malformed arguments/schema violations either fail silently
(agents hallucinate around a bad return) or trigger expensive frontier round-trips and documented
recursive loops that burn thousands in credits overnight. Failure concentrates in the cheap/local-
model and complex-nested-schema segment (budget models 70–85% well-formed; even Opus 4.8 / Sonnet 5
flagged for occasional invalid args), across 9,652+ official and ~20,000 community MCP servers. Runtime
reliability is where 2026 funding is moving (agent-governance seed rounds = 50% of deals; CodeIntegrity
$5M).

**Data availability.** Four options.
- **MCP registries** (~9,652 official, ~20,222 indexed) — public schemas → fuzz into malformed→repaired
  pairs. License-clean but synthetic (plausible-not-real errors); **not the moat.**
- **Berkeley Function Calling Leaderboard** (HF, permissive) — thousands of function-call cases + gold
  calls to corrupt (AST-checkable). Eval harness, not repair.
- **ToolFailBench** (arXiv 2607.04686, CC-BY-4.0) — 1,000 labeled tool-failure cases; taxonomy is
  behavioral, does *not* cover repair — an eval/negative seed.
- **Self-generated from real agent traces** via an OSS interceptor — the intended moat, but zero at
  launch, grows only with adoption.
- **Verdict:** data to *build and demo* is fully solved and free (public schemas + BFCL + CC-BY
  ToolFailBench, all fuzzable, zero human labeling); the **moat data (real live correction triples) is
  not solved for a solo** and only accrues after distribution.

**Annotation.** ~0–2 hours — essentially zero. A hand-validated ~50–100 fuzzed-pair slice for realism.
Light JSON/schema literacy, **no code review** (labels are schema-validator + retry outcomes, which you
prefer). Self-labeling: JSON-schema validation gives the pass/fail label for free. **One of the lowest-
annotation candidates.**

**Executability.** 7–11 part-time weeks (~2 wk interceptor, ~2–3 wk fuzz pipeline, ~2–3 wk fine-tune a
1–3B repair model + eval, ~1–2 wk OSS packaging). $150–450 (LLM synth + one GPU fine-tune + hosting).
Strong ML skill-fit; **gap:** production SDK/runtime engineering (in-path latency, framework
integrations, npm/pip DX) is software-eng outside your eval/ML core. **Top risk: the core value prop is
already a free framework primitive** — Vercel AI SDK ships `experimental_repairToolCall`, and frontier
models self-correct on a second attempt at 95–99%. The only wedge is a tiny repair model clearly
faster/cheaper than a frontier round-trip *plus* a corpus you can't get solo.

**Outcome.** Moderate as a pilot (an engineering result, not novel research: "a 1–3B model recovers X%
of malformed calls at 1/Nth the cost/latency, on BFCL + ToolFailBench"). High hire signal — the hottest
2026 buyer wave, shows the full interceptor→corpus→fine-tune→eval loop; an adopted npm/pip package is a
strong portfolio artifact. **Founding: weakest of the strong candidates** — headline feature already
free in Vercel AI SDK, frontier reliability rising, moat needs an install base a solo can't bootstrap.
More likely a hire-magnet/acqui-hire OSS than a defensible company.

**Scores:** Ship 4 · Impact 3 · Found 2 · Exec 4 · Hire 4 → **Composite 67.5** (outcome 60, ease 80).

**Verdict.** Fastest-to-ship and lowest-annotation of the founding bets with excellent self-labeling
data and strong hire signal — but a weak founding case (repair is commoditized, frontier reliability
is rising, the moat needs an installed base). **Treat it as an OSS hire-magnet, not a company.**

---

### 8 · Injection Defense Report Card — pilot — 65.8

**Why it matters.** Prompt injection is OWASP LLM Top 10 #1 (2024 and 2025), at the exact layer where
deployment is exploding (agents send email, move money, query DBs over untrusted content). The
methodological stakes are large: "The Attacker Moves Second" (arXiv 2510.09023, USENIX Sec '26) broke
12 published defenses at >90% ASR despite near-zero self-reported rates; Zhan et al. (NAACL '25) broke
every evaluated agent defense at >50% ASR — so buyers can't distinguish robustness from marketing.
Market pull is current: **OpenAI acquired Promptfoo (March 2026)** to embed injection/red-team testing
into its enterprise platform, proving both demand and that independent injection-eval expertise is a
hot hire/acquisition target.

**Data availability.** Four options — **richest, cleanest data path of the six pilots.**
- **AgentDojo** (MIT) — 97 user tasks + 629 security test cases, with a *programmatic* state-diff success
  oracle (no LLM judge needed for ground truth). Its own live leaderboard is static — that's the gap you
  exploit. 629 cases clear the power requirement.
- **Released adaptive-attack code** — OET (MIT) + Zhan et al. + Attacker-Moves-Second, wrapped under a
  fixed budget. Caveat: AdaptiveAttackAgent is all-rights-reserved → **re-implement, don't vendor.**
- **Defenses under test** — CaMeL (Apache-2.0), AgentDojo baselines (MIT), Meta-SecAlign, spotlighting/
  PromptArmor/MELON/Progent/FIDES. Caveat: Meta-SecAlign *code* is CC-BY-NC → **grade via released
  weights, not code.**
- **Grader-gameability (OracleProof)** — HarmBench validation set (596 human-labeled completions, MIT);
  documents benign-framing wrappers flipping judges 57–100% — directly usable as the grader-gaming test.
- **Verdict:** *fully solved* — every ingredient exists under permissive licenses with a deterministic
  oracle, and volume clears the power bar. The only two caveats are license-hygiene fixes, not blockers.

**Annotation.** ~150–200 agent transcripts hand-labeled attack-succeeded/failed/ambiguous to validate
the oracle + anchor the OracleProof flip-rate. **You alone** — AgentDojo task semantics + injection
success conditions ("was the money actually transferred?"), no security depth, **no code review.**
Mostly sourced free (deterministic oracle + reused 596-item grader set). Fits 4–7 hrs. One of the
lightest loads in the set.

**Executability.** ~6–9 part-time weeks (fast substrate; person-weeks concentrate in faithfully
reproducing 10–15 defenses to their reported static ASR + per-defense adaptive harnessing). Well under
$500 (single rented GPU + judge API). **Strong-to-moderate skill-fit** — LLM-as-judge/eval fits, but
security-adversarial-optimization plumbing (GCG/search wrappers, defense reimplementation) is the
least-familiar surface. **Top risk: under-attack confound** — a ≤$500 solo can't attack as hard as a
funded lab, so any favorable grade is confounded with "budget too small," and the null ("defenses
hold") is the weakest in the set. Secondary: fast-moving competition shrinking the referee window.

**Outcome.** Solid workshop tier (NeurIPS/ICLR safety, SaTML) + a living leaderboard as the credibility
engine. Moderate novelty (attack method imported; the contribution is the standardized recurring graded
protocol + the OracleProof grader-gameability audit). **Highest, most CURRENT hire signal in the set** —
the Promptfoo→OpenAI acquisition makes independent injection-eval a directly-hirable specialty.
**Founding upside low:** the only moat is neutral-referee trust (uncopyable at ≤$500, slow to earn), no
data/IP asset, and vendors are *absorbing* red-team tooling. **Moat weak and eroding** — PIArena
(arXiv 2604.08499, Apr 2026), independent adaptive re-evals (arXiv 2606.26479), and commercial ranked
lists already exist; the unclaimed combo (recurring dated A–F card + grader-gameability audit) survives
today but is defensible in months, not years.

**Scores:** Ship 4 · Impact 3 · Found 1 · Exec 4 · Hire 5 → **Composite 65.8** (outcome 60, ease 80).

**Verdict.** A high-hire-signal, data-solved, self-doable pilot that ships in ~6–9 weeks — **take it as
a marketable safety/security credential** (ride the Promptfoo→OpenAI wave), not a founding bet, and
**move soon** because the neutral-referee window is measurably closing.

---

### 9 · Multilingual Safety Meter (Ternary-PPI) — pilot — 62.5

**Why it matters.** The multilingual safety gap is real, large, and lands on the least-protected
populations: Yong et al. showed translating disallowed prompts into low-resource languages (Zulu,
Scots Gaelic, Guarani) raised GPT-4's harmful engagement to ~79–80% (arXiv 2310.02446); M-ALERT found
cross-lingual inconsistencies across 39 models; IndicSafe (2026) reports only 12.8% cross-language
safety agreement across 12 Indic languages (~1.2B speakers). Labs publish no per-language numbers, and
UK AISI / Frontier Model Forum fund independent multilingual-safety work. The field's real gap: the
reported per-language number is untrustworthy because the LLM judge fails in exactly the low-resource
regime it grades — the specific hole this method fills.

**Data availability.** Four options — **materially better than the briefs assumed.**
- **RabakBench** (HF, govtech-singapore license — *not* "modified-MIT" as doc 19 said) — ~132 items/lang
  incl. Tamil, prompts-only with human safety labels. The only clean-license source covering Tamil, but
  responses aren't free (generate them) and 132 Tamil items is thin.
- **PolyGuardPrompts** (COLM 2025, arXiv 2504.04377) — **CC-BY-4.0 (best license here)**, 29,300 samples
  × 17 languages, each with prompt + response + human refusal/harm labels. **Game-changer:** removes the
  "responses not free" *and* much of the "gold not free" blocker for the high-resource control arm
  (Hindi/Chinese). No Tamil.
- **IndicSafe** (GitHub, arXiv 2603.17915) — ~6,000 culturally-grounded prompts × 12 Indic langs incl.
  Tamil; verify repo license (treat measure-only until confirmed); still needs self-generated responses.
- **LinguaSafe** (arXiv 2508.12733) — 45k entries, incl. Malay/Bengali — a fallback low-resource language
  if Tamil annotator recruitment fails.
- **Verdict:** *solved* for a solo pilot — PolyGuardPrompts unlocks free responses+gold for the control
  arm; RabakBench/IndicSafe supply Tamil prompts. Remaining cost: (a) generate Tamil responses, (b) the
  ~50-item native-Tamil ternary gold set — neither free. Avoid M-ALERT (CC-BY-NC-SA) for release.

**Annotation.** ~50 human-verified ternary {REFUSE, COMPLY, UNCLEAR} gold labels **per language**
(PPI debiases a several-hundred-item machine-labeled pool from this small gold). Total across 2–3 langs
≈ 100–250. You do English gold + adjudication yourself. **Non-negotiable:** the Tamil labeler must be
native/fluent *and* able to judge whether a response advances a harmful goal — the one thing you can't
self-supply. Recruitable (Upwork/Prolific Tamil freelancers, ~$15–30/hr → ~$50–150 for the set). No
code review. Fits tightly; **the load-bearing risk is recruiting a reliable native annotator**, not the
label count.

**Executability.** ~7–10 part-time weeks (estimator is off-the-shelf: `ppi_py`'s `ppi_mean_ci`; effort
is data plumbing + response generation + gold recruitment + coverage-simulation writeup). ~$150–300 API
+ ~$50–150 annotation. Very high skill-fit + a light PPI lift. **Top risk: the pre-registered
identifiability limit** — if fluent-but-wrong translations read as clean COMPLY rather than routing to
UNCLEAR, the artifact-vs-real decomposition isn't identifiable and the headline "artifact-fraction"
collapses to a total-noise-corrected number. Secondary: thin Tamil volume + native-annotator quality.
All mitigable (add IndicSafe/LinguaSafe volume, swap language, pre-registered fallback) but the ceiling
caps how exciting the result can be.

**Outcome.** Solid but capped — an ACL-family workshop (TrustNLP/MRL/SoLaR) with a Findings shot if the
identifiability result is clean across 3 languages. A measurement-methods contribution (ternary
confusion matrix + PPI), not a new phenomenon; **a null publishes only if framed as an identifiability
finding** — a narrower escape hatch than the other pilots. Strong hire signal for safety/eval roles
(AI Safety Institutes, frontier-lab safety-eval) + a clean grant on-ramp (UK AISI, FMF AI Safety Fund).
**Founding upside weak — the clear downside vs. your founding goal:** no paying buyer (labs that would
buy per-language numbers are the ones who look bad in them), the artifact is a method + small dataset,
no durable moat. Nonprofit/hire only.

**Scores:** Ship 3 · Impact 4 · Found 1 · Exec 4 · Hire 4 → **Composite 62.5** (outcome 60, ease 73.3).

**Verdict.** A high-impact, high-skill-fit, cheap-and-executable safety-eval pilot with a strong
hire/grant on-ramp — but middling ship-speed (generate responses + recruit a native annotator) and
essentially no founding upside. **Rank it as a nonprofit/hire play, not a company bet.** PolyGuardPrompts
meaningfully de-risks the data path for the control arm.

---

### 10 · Callsmith — outcome-graded AI phone-call tuning — founding — 59.2

**Why it matters.** The SMB voice-agent market is large and fast (~$4.8B Q1 2026, up from $1.9B in 2024,
~47% CAGR; virtual-receptionist slice ~$4.6B; SMB adoption past the 30% acceleration threshold). The
pain is dollarized: a Feb-2026 Peerlogic analysis of 4,280 calls across 26 dental practices found 38% of
inbound calls unanswered and new-patient conversion at 25%; practices are told they lose $47K–$140K/yr
to missed/mishandled calls. But the specific gap Callsmith targets (grading/tuning *any* bot on business
conversion, vendor-agnostic) is more contested than "open."

**Data availability.** Four options.
- **First-party design-partner client** (one multi-location dental/HVAC group already running a bot):
  pull 2–4 weeks of recordings/transcripts + their CRM/calendar, match each call to its outcome. **This
  is the moat data** — outcome-labeled transcript→result. HIPAA/PII → private use only, not public. A
  cold-start services grind: you must sell a client *before* you have any data.
- **Voice-vendor APIs** (Vapi structuredData + successEvaluation; Retell/Bland) — transcript + native
  per-call outcome flag once you have client credentials. **Double-edged:** vendors already extract
  outcomes natively, shrinking the moat to attribution quality + tuning.
- **Public call-center corpora** (CallCenterEN/AIxBlock 92k; AxonData) — **CC-BY-NC-4.0**, no outcome
  labels: prototype the judge only, useless as moat data or shippable product.
- **Synthetic seeded corpus** — build/demo the judge with no client dependency, but synthetic calls
  don't carry the real transcript↔CRM-outcome linkage that is the entire value prop.
- **Verdict:** *NOT solved — the crux risk.* No public corpus links transcript to business result; the
  moat corpus must be generated first-party via a live client (chicken-and-egg), public sets are
  outcome-unlabeled and non-commercial, and the vendors Callsmith would grade already emit per-call
  outcomes natively.

**Annotation.** Hand-attribute ~200–600 of one client's calls (booked / no-show / never-contacted /
lost), then calibrate an LLM judge. **You** — outcome attribution is judgment labeling in your
LLM-as-judge wheelhouse, **not code review.** Partly sourced (ground truth lives in the client's CRM →
labels mined by matching call→record). Fits 4–7 hrs *if* a live client with CRM access is secured first
— the labeling is cheap; **the prerequisite client is the hard part.**

**Executability.** 8–13 part-time weeks realistically, of which **3–6 are non-technical** (find/close a
design partner, get CRM/PHI access, data-use agreement) *before* the build. $100–400. Excellent on the
technical arc (data pipeline + attribution judge + tuning — best full-arc fit of the set), **poor on the
non-technical prerequisite** (sales/services-first, negotiating PHI access solo). **Top risk: cold-start
client dependency** — nothing ships until a real client shares recordings + booking data. Secondary: the
moat is thinner than stated (Invoca Signal AI, Peerlogic dental analytics, native Vapi/Retell outcome
fields occupy adjacent ground).

**Outcome.** Low as a research artifact — a product/services bet, not a paper (a case study/blog at
best; your RAG-judge paper already covers the methodology-publish need). Strong-to-moderate hire signal
(an end-to-end outcome-attribution+tuning demo on real calls reads well for applied-AI/forward-deployed
roles; less legible to a research lab). **Founding upside real but contested and services-flavored** —
concrete buyer + ROI pitch (genuinely founder-shaped), but the lane is flanked (Peerlogic, Invoca,
Hamming, native vendor outcomes) and the moat is per-vertical, non-portable, erodable, and starts empty.

**Scores:** Ship 2 · Impact 4 · Found 4 · Exec 2 · Hire 3 → **Composite 59.2** (outcome 73.3, ease 40).

**Verdict.** Biggest market and best full-arc skill-fit of the SMB-voice bets, but it **fails your top
criterion**: nothing ships until a live client hands over recordings + CRM outcomes, the moat data can't
be seeded for free, and the lane is already flanked. A strong FOUND idea to keep on the list, but a weak
fastest-shippable pick — **rank it below the OSS-seedable candidates.**

---

### 11 · SuggestionFix-Bench — pilot — 54.2

**Why it matters.** AI code review is deployed at scale but its most decision-relevant capability —
producing the fix a human would actually *merge*, not just flagging a concern — is essentially
unmeasured; the whole 2026 benchmark wave (SWE-PRBench, SWR-Bench, Martian's 200k-PR benchmark,
CR-Bench) grades review *comments*, and SWE-PRBench shows 8 frontier models catch only 15–31% of
human-flagged issues. The stakes are concrete (AI writes plausible-but-wrong code, the #1 developer
complaint; a rigorous study found AI made experienced devs ~19% slower while they *felt* faster). The
catch: the surrounding measurement space is crowded and moving fast — this matters as a narrow wedge,
not a field-definer.

**Data availability.** Four options.
- **CodeReviewer** (Microsoft, Zenodo, **CC-BY-4.0 verified**) — large, 9 languages, comment→refined-code
  pairs. The release-clean backbone, but pairs are comment→code, not the ```suggestion``` block signal
  — the differentiated oracle must be re-derived; comment noise ~64% valid needs filtering.
- **ronantakizawa/github-codereview** (HF, **license: other → index-only**) — 355,807 rows, before/after
  + comment_type already labeled, bots excluded, change-verified. Perfect shape but can't be re-hosted.
- **Self-mine accepted suggestion blocks** from permissive repos via GH Archive + GitHub API — the
  release-clean path to the differentiated data, and **where the volume kill lives:** only ~8% of
  suggestions are true defect fixes (verified: 142/1,775 in Bouraffa/Pham/Maalej 2025), so surviving
  accepted-and-not-reverted defect-fix gold could fall below the ~500-item floor.
- **AIDev** (CC-BY-4.0 wrapper) — for an agent-authored / review-missed extension; only ~15% of agent
  PRs have substantive review, so it thickens the story rather than solving the gold-volume risk.
- **Verdict:** *solved for running the study* (three verified free corpora, labels come structurally
  from merged PRs), **not solved for the differentiated artifact** — the release-clean defect-fix
  accepted-and-not-reverted gold is volume-fragile, and the "accepted = correct" oracle rests on your own
  label audit rather than prior validation. **Run the <500-gold dry run before committing.**

**Annotation.** Zero primary labeling (the gold label *is* the human's accepted suggestion, captured
structurally). One-time validation: a ~200–400 item label-quality audit + ~200-item eval slice. **You
alone, code-literacy level, NO manual code review for defects** (matches your dislike). Labels sourced
free from merged-PR history. **PARTIAL fit:** the brief's ~15–30 hr one-time validation *exceeds* your
4–7 hr ceiling — the 4–7 hr bar is only met if you ship the thinnest replicate-an-existing-task version;
the defensible bespoke-gold version is ~15–30 hrs of your audit time.

**Executability.** ~6–9 part-time weeks (thin version ~5–6; defensible with SZZ acceptance verifier ~9).
~$100–200. **Strong skill-fit** (eval + data pipelines + LLM-as-judge map onto AST/test-verified fix
scoring; the GH Archive/BigQuery + SZZ pipeline is the one piece slightly outside comfort). **Top risk:
the <500-gold volume kill**, now empirically corroborated (~8% fix rate; after also requiring accepted +
not-reverted + runnable-tests the surviving gold could collapse below the floor). Secondary: label noise
— acceptance/revert rates are under-quantified, so the ~85%-precision filter ceiling must be validated
by hand.

**Outcome.** Solid for a pilot (ML4Code/SE workshop or NeurIPS Evals + dataset; a clean null is welcomed
and pre-registered). Moderate novelty on a narrow axis — the metric hierarchy is standard APR; the
novelty is entirely the data source. **High, current hire signal** (CodeRabbit, Qodo, Greptile, Cursor,
GitHub, Sourcegraph — directly on-thesis with the hot 2026 code-review-eval space). **Founding upside
low:** the broad space is saturated by funded 2026 entrants; **moat weak and time-boxed** — the one
unclaimed slice (suggestion-block-as-literal-fix oracle) has close uncited prior art (Review4Repair
2020, 55,060 comment→fix pairs scored by exact match) and erodes as soon as a funded team copies it.

**Scores:** Ship 3 · Impact 3 · Found 1 · Exec 3 · Hire 4 → **Composite 54.2** (outcome 53.3, ease 60).

**Verdict.** A clean, cheap, skill-perfect **hire artifact** for the crowded code-AI-eval market — **go
only if the <500-gold defect-fix dry run passes**, since the ~8%-fix rarity and an under-validated
"accepted = correct" oracle are the two things that can sink it. Near-zero founding upside, and its
~15–30 hr validation exceeds your 4–7 hr ceiling unless you ship the thinnest replicate version.

---

## Recommendation

### The single best pick by your criteria

**Ingestion Corruption Detector (84.2).** It tops the composite because it's the only candidate that's
strong on all five axes at once, and — uniquely — it's *both* the easiest to execute (label-free,
release-clean data, ~$50 core compute, no code review, perfect skill-fit) *and* a genuine founding wedge
(the OSS run-it-yourself integrity checker, into a parsing-reliability market that just took $100M+). It's
null-proof, so even the worst case is a publishable finding. If you run exactly one thing, run this.

### The 2–3 to actually run, for breadth

Your own operating principle is breadth: run a small portfolio across different areas and let real-world
engagement decide. The honest way to do that is to **mix one fast-ship pilot, one high-ceiling founding
bet, and (optionally) one credential play** — so you're not betting the whole quarter on a single
outcome shape.

1. **Ingestion Corruption Detector** *(pilot, fast + found-upside)* — your anchor. Best all-rounder,
   lowest-friction, and the only pilot with a real founding wedge. Start here.
2. **PV-Grade** *(pilot, best ceiling + best hire)* — the highest potential outcome and the most
   role-specific credential, in a regulator-driven market where the graded party *wants* a score. Ship
   the narrow 3-decision v1 first (defer causality) so it doesn't drag your ship-speed. This is your
   "swing for the fence."
3. **Kappa** *(founding, easiest + best hire signal)* — if you want a third, this is the cheapest,
   fastest, most skill-perfect one to run in parallel/in the background. It's an outstanding hire
   artifact and a wedge worth proving, as long as you go in eyes-open that the founding lane is
   contested by funded incumbents.

**The honest tradeoff.** Ingestion + PV-Grade gives you one thing that ships fast *and* one thing with
the best ceiling — but PV-Grade is the slowest of the top pilots (the causality-gold dependency), so
you'll feel that drag if you don't hold it to the narrow v1. Adding Kappa is nearly free on effort and
maximizes hire optionality, but it's a *third front* and its company-story is the weakest of the three
on moat. If you'd rather keep it to two, run **Ingestion + PV-Grade** and treat Kappa as a background
project. If your priority right now is *getting hired fast* over founding, swap PV-Grade for
**Reviewer Scrutiny Metric** (5 on ship-speed, bulletproof problem, null-robust) — you lose founding
ceiling but gain speed and certainty.

### Concrete next step

Start the **Ingestion Corruption Detector dry run this week**: render ~50 numeric tables from
FinTabNet.c at 150/200/300 DPI through one open OCR engine, flag value-flips, and check whether the
render-only slice is non-empty against a multi-parser + self-consistency baseline. That single
experiment (a few days, ~$0) settles the one real risk — whether corrupted numbers read stably-wrong
across resolutions — and tells you whether the method is a go or a publishable null before you commit
any real time. In parallel, send 2–3 outreach messages to gauge PV-Grade willingness-to-pay (does a
sponsor want the yardstick to *exist*, and would a lawyer let them be scored on the record) so that
bet's central risk is de-risked early too.
