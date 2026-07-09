# 25 · Founding candidates — regulated-money & liability verticals (deep)

*Written 2026-07-09. This doc drills one aperture hard: **regulated-money and liability verticals** —
places where a specific, named party personally holds legal exposure for a decision, and where an
LLM is now drafting or grading that decision. It ADDS to the [doc-20 ranking](20-decision-and-ranking.md);
it does not replace it. Where doc-20 gives you the whole slate, this gives you the sharpest lane inside
it. The bar to appear in the CLEARED table is **composite ≥ 83.3 — Kappa's score**. The reference points
you already trust from doc-20 are **Kappa at 83.3** (fastest-ship, best hire signal, contested founding
lane) and **NoteProof at 87.5** (the aligned-buyer liability verifier that set the template these candidates
copy).*

---

## The framing — why this aperture, and what "clears" means

Every candidate here is the same *shape*: an **independent, vendor-agnostic verifier** that sits beside
someone else's AI, grades a specific high-stakes decision, and hands the **liability-holder** — not the
graded vendor — an examiner-ready artifact proving the decision was defensible. This is NoteProof's shape,
and the reason to hunt in it is that it fixes Kappa's one real weakness: Kappa's buyer feels *optional
anxiety* (a rotting eval dashboard), whereas these buyers are **legally forced** to have the number — a
private right of action, a signed opinion, a strict-liability sanctions exposure, a physician who must
personally own a denial.

Three things separate a clearer from a near-miss in this aperture, and they map exactly onto doc-20's
"differentiated-half" test:

1. **Free, real, license-clean seed data that labels the DIFFERENTIATED half** of the verdict — not just
   the commodity deterministic-rule check. This is what separated the 87.5 winners from the 75.8 also-rans
   across the whole program.
2. **An aligned, liability-holding buyer** who *wants* an honest score because they eat the exposure.
3. **A moat the graded vendor structurally cannot build** — a self-grading engine is the exact conflict of
   interest the product sells against, so incumbents are channels, not rivals.

Every candidate is a **near-verbatim re-point of his published RAG-hallucination / grounding judge**
(retrieval→answer becomes record→decision), so ship-speed and skill-fit are strong across the board. The
honest differences are all downstream: does the free data prove the *novel* axis or only a commodity one,
is the buyer clean or messy, and does the moat compound before or only after traction.

**Bottom line up front:** four candidates clear Kappa, and three of them clear NoteProof. The aperture is
genuinely rich — richer than the healthcare-only lane — because the same skill transfers to *every*
liability-holding decision, and three verticals ship **free structured government/public data that labels
the differentiated half**: CFPB complaints (with a monetary-relief outcome field), HMDA (with denial-reason
+ protected-class + outcome fields), and SEC filings with XBRL numeric ground truth.

---

## CLEARED — composite ≥ 83.3 (Kappa's bar)

| Name | Composite | Ship | Found | Exec | Moat | One-line |
|---|:--:|:--:|:--:|:--:|---|---|
| **DisputeProof** — Reg E dispute-denial defensibility verifier | **91.7** | 5 | 4 | 5 | Cross-institution denial-defect corpus; §1005.11 attestation artifact | Grades whether an automated "no error" dispute denial rests on a reasonable investigation — **before** it becomes private-right-of-action evidence. |
| **ReasonProof** — adverse-action reason-code faithfulness verifier | **91.7** | 5 | 4 | 5 | Cross-lender reason-code-failure corpus; SR 11-7 independence posture | Verifies each ECOA/Reg-B decline reason a lender sent is actually faithful to the model's true drivers — the MRM control SHAP-on-black-box makes provably unreliable. |
| **TieProof** — audit-evidence grounding & tie-out verifier | **91.7** | 5 | 4 | 5 | Cross-firm AI-evidence-defect corpus; AS 1105/QC 1000 workpaper | Grades each AI tie-out/footnote against the source doc and exports the "we verified the AI" workpaper the signing partner is now personally required to produce. |
| **DenialProof** — medical-necessity denial-defensibility verifier (payer-side) | **86.7** | 4 | 4 | 4 | Cross-plan defensibility corpus; SB 1120 attestation SOR | Grades whether a payer's AI-drafted medical-necessity denial is grounded in the record + cited criteria — before a physician signs it under SB 1120. |

Four clear. The top three (**DisputeProof, ReasonProof, TieProof**) tie at **91.7** and sit *above*
NoteProof's 87.5. **DenialProof** clears Kappa comfortably at 86.7 but sits a half-step under NoteProof.
Two more (**AppealScore 85.0**, **ScreenProof 83.3**) technically touch or exceed the bar but carry
founding caps that make them second-tier — they're in the near-miss discussion below with an honest note
on why.

*(A note on the numbers: the three 91.7s were argued up from pitched self-scores by the judge; the judge's
own composite math on their 5·4·4·5·5 dimension profiles lands them at ~87–88, i.e. **at parity with
NoteProof, not a full four points above it**. Read the top three as "tied with NoteProof at the top of the
pool," and treat the 91.7 as the optimistic end of a 87.5–91.7 band. The dimension scores, which drive the
decision, are solid.)*

---

## The cleared cards

### 1 · DisputeProof — independent Reg E dispute-denial defensibility verifier — 91.7

**The problem.** Banks, credit unions, and fintechs now auto-draft Reg E dispute denials ("we investigated,
no error found") with AI. Under **12 CFR §1005.11**, that denial is only lawful if it rests on a *reasonable
investigation* — and a wrongly-denied claim is not just a reversal, it is **EFTA §1693m private-right-of-action
evidence**. The regulator is explicit and the enforcement is live: the **CFPB v. Block/Cash App consent order
(2025-01)** cited "failing to conduct reasonable investigations"; the 2025 *Consumer Compliance Outlook*
("Error Resolution Under Regulation E: Examiner Insights and Common Violations") and Winston & Strawn's
"Reg E Reader" both document a live EFTA/Reg E private class-action wave. Vendors (Quavo ARIA "AutoDeny",
Pega Smart Dispute GenAI) automate the denial and *self-grade* it — the exact conflict.

**Who pays (the liability-holder).** The bank/CU/fintech **dispute-operations + Reg-E-QA/BSA-compliance
office** that OWNS the denial and carries the EFTA private-right-of-action, enforcement, and reversal
exposure — *not* the graded vendor. Inverted, aligned buyer. Later: Quavo/Pega/Lorikeet white-labeling a
"defensible-denial" attestation, and E&O carriers. ~$1–3/denial-verified or a monthly compliance seat.

**Product shape.** Send the consumer error notice + the investigation record the bank relied on + the drafted
denial letter; get back per-claim (1) an investigation-reasonableness verdict grounded in §1005.11, (2) a
letter-completeness check (right-to-request-documents language, provisional-credit handling), and (3) a
calibrated denial-defensibility probability with the specific weakness flagged. Only risky denials route to a
reviewer; everything exports to an audit log. **Grades denials; never decides the dispute.**

**Moat + why it beats Kappa/NoteProof.** A compounding, un-backfillable **cross-institution corpus of
denial-defect cases** — which claim shapes were wrongly auto-denied, which letters were deficient, and (via
the outcome proxy) which denials later got reversed — that no single dispute vendor can assemble (each sees
only its own book), packaged as a §1005.11 attestation artifact. It is NoteProof's exact shape with three
edges NoteProof lacks: (a) **free zero-label seed data for the exact decision** — the **CFPB Consumer
Complaint Database** (public domain, bulk + API, `cfpb.github.io/api/ccdb`) ships real unauthorized-transaction
narratives AND a "company response" field ("Closed with monetary relief" vs "Closed with explanation") as an
outcome proxy for denial-defensibility, so a first agreement result needs ~0 new labels + ~4–7 hrs
spot-adjudication; (b) the buyer is **even more legally forced** than NoteProof (a private right of action +
a live class-action wave, not a doctrine); (c) near-verbatim re-point of his published RAG-grounding judge, so
Ship 5 / Exec 5 hold. This is why it clears Kappa: it fixes the contested-lane weakness with a legally-forced
buyer and beats Kappa on impact.

**Nearest player + wedge.** Quavo (QFD/ARIA AutoDeny), Pega Smart Dispute, Lorikeet (incl. Coach QA), FINBOA,
Fini all AUTOMATE and SELF-GRADE their own deny decisions inside their own platform; CrossCheck Compliance +
bank internal-audit do manual, after-the-fact transaction testing. **None offers an independent, cross-vendor,
pre-send per-denial defensibility verifier.** The wedge is the strict conjunction {independence + cross-vendor
(sits beside any engine, incl. homegrown) + pre-send gate tied to private-right-of-action liability}. An engine
grading its own AutoDeny is structurally disqualified from being the neutral grader.

**The real risk.** The seed decision is graded against CFPB complaint *narratives* + a *monetary-relief outcome
proxy*, not the bank's actual §1005.11 investigation record — so the first result measures "does the public
narrative ground a no-error denial," a noisier stand-in for "was the investigation reasonable." If the proxy is
too weak, the eval headline softens. Secondary: the moat is neutrality-positioning until the corpus compounds,
and the live threat is a self-grading QA layer (Lorikeet Coach, Rulebase) or an incumbent bolting on a
"defensibility score."

**First cheap step.** Pull the CFPB CCDB unauthorized-transaction narratives + company-response field, re-point
the RAG-grounding judge to score "does this narrative ground a no-error denial under §1005.11," spot-adjudicate
~4–7 hrs against the monetary-relief proxy, publish a "defensibility-vs-outcome agreement" result. <$500,
part-time, ~0 new labels.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 91.7** (judge honest band ~87).

---

### 2 · ReasonProof — independent adverse-action reason-code faithfulness verifier — 91.7

**The problem.** Every credit decline must ship ECOA/Reg-B **adverse-action reason codes**. Lenders generate
them by bolting SHAP onto a black-box model — and the literature shows that is provably unreliable: reason
codes are **unstable under re-seeding** and, under feature collinearity, **attribution is impossible**. Papers:
*Explanation Multiplicity in SHAP* (arXiv 2601.12654), *The Attribution Impossibility under collinearity*
(arXiv 2605.21492), *From Accuracy to Auditability: Determinism in Financial AI* (arXiv 2605.23955),
*Interpreting LLMs as Credit Risk Classifiers* (arXiv 2510.25701), *Do Fair Models Reason Fairly?*
(arXiv 2605.12701). Regulators: **CFPB Circulars 2022-03 and 2023-03**, and the **Jan-2025 Supervisory
Highlights**. Fannie/Freddie + agencies are explicit that buying AI does not outsource the audit answer.

**Who pays (the liability-holder).** The **creditor/lender** — MRM + fair-lending/compliance offices at banks,
credit unions, mid-market fintech lenders — who **signs the adverse-action notice and owns the exam**. Aligned
buyer. Secondary: compliance consultancies (Asurity, CrossCheck, ncontracts) white-labeling it; later E&O/D&O
carriers.

**Product shape.** Send the model (or its scored decisions) + the reason codes it emitted for a set of declines;
get back per decision a "faithful / unsupported / contradicted" verdict on each stated reason against the model's
true drivers, a **stability score** (does the reason survive re-seeding/perturbation), a fabrication flag for
reasons the model didn't rely on, and an examiner-ready attestation log. Delivered as an OSS "reason-code
faithfulness" CLI + hosted attestation service. **Grades reasons, never makes the decision.**

**Moat + why it beats Kappa/NoteProof.** Two-layered. Day-one moat is **positioning**: independence
(**SR 11-7 effective-challenge forbids a self-attesting generator from being its own check**) + cross-vendor +
decision-flip test — a structurally defensible wedge. Durable moat is a **cross-lender corpus of reason-code
failures** (which vendor/method produced an unfaithful reason, on what feature geometry, whether the corrected
reason survived) that no single underwriting vendor can assemble. It beats Kappa the same way DisputeProof does
— aligned liability-holder on a *surviving* ECOA duty — and it has the aperture's cleanest data story: **HMDA is
free, license-clean, real TODAY** (10M+ records/yr, 99 fields, denial reasons + protected class + decision), and
critically **ground truth is self-generated, not annotated** (train a transparent model, compute true drivers,
grade vendor-style codes against them) — removing NoteProof's clinician-spot-check bottleneck → Exec 5. This is
the doc-20 "differentiated-half" worked example: HMDA labels the *differentiated* half (was the reason
legitimate?), not just a commodity rule check.

**Nearest player + wedge.** Zest AI, Scienaptic, Upstart, Sei AI, SolasAI, Stratyfy all **GENERATE** their own
reason codes and self-attest (Sei's own guidance even warns "SHAP on a black box gives you a story, not the
driver" — for their own pipeline only). FairPlay + Stratyfy do disparate-impact/LDA/proxy detection, **not
reason-code faithfulness**. Fiddler/Arthur/Arize are self-service dashboards for the model owner. The closest
genuine independent validator, **AVAAS (avaas.ai)**, sells to this exact buyer but is scoped to runtime/deployment
verification, **not per-decline reason-code faithfulness + re-seed stability**. The wedge = {independence +
cross-vendor + decision-flip-and-re-seed, not another attribution score}. Primary residual threat: AVAAS
scope-creeping into faithfulness.

**The real risk.** The drag is at **company stage, not build stage**: examiner-gated bank/CU compliance sales
cycles are slow and relationship-heavy for a solo part-timer, so revenue and corpus-compounding both lag.
Secondary: AVAAS already owns the buyer relationship and is one scope-creep away from collapsing the independence
differentiator.

**First cheap step.** Take cleaned HMDA (2007–2017 toolkits exist), train a transparent model, compute true
drivers, generate SHAP-style vendor codes, and run the faithfulness + re-seed-stability verdict — no annotation
needed. Publish "reason-faithfulness rate" as the headline metric nobody has measured. <$500, part-time.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 91.7** (judge honest band ~87).

---

### 3 · TieProof — independent audit-evidence grounding & tie-out verifier — 91.7

**The problem.** Audit firms now use AI (DataSnipper, Fieldguide, Trullion) to tie out figures and summarize
evidence — and under new **PCAOB AS 1105 & AS 2301** technology-assisted-analysis amendments (effective FYs
beginning on/after **Dec 15 2025**) and **QC 1000** (effective **Dec 15 2026**), the signing partner is now
*personally* required to document that they verified the AI's work. The 2024 PCAOB inspection cycle showed a
**39% Part I.A deficiency rate**. Vendors grade their own output and explicitly leave validation to the auditor
— the "executor cannot be the auditor" gap is discussed in the market but unfilled.

**Who pays (the liability-holder).** The **engagement partner / national-office audit-quality function signing
the opinion** — the party holding personal PCAOB/AICPA liability, not the graded AI tool. Aligned buyer.
Buyers: mid-market and regional audit firms (top-100 ex-Big-4) and internal-audit/SOX-ICFR functions; later
E&O carriers.

**Product shape.** Pipeline-agnostic verifier beside any audit-AI tool. Feed the source doc (bank statement,
invoice, contract, prior workpaper, SEC filing) + the AI's asserted tie-out/summary/footnote support; get back
per-assertion supported/unsupported/contradicted with the cited source span, a **fabrication flag** (evidence
cited that isn't in the source) and an **omission flag** (material item the AI dropped). Routes only risky
assertions to a ~60-sec reviewer and exports the exact AS 1105 / QC 1000 documentation. **Grades, never drafts.**

**Moat + why it beats Kappa/NoteProof.** A cross-firm corpus of real AI-evidence defects (asserted support,
source doc, reviewer verdict, defect class) that no single audit-AI vendor can assemble (each sees only its own
output), packaged as the AS 1105/QC 1000 workpaper the partner is personally required to produce. It is the
NoteProof structure ported to a second liable-signer vertical AND it fixes what dropped TaxProof (80.0): it now
**HAS free, license-clean, real seed data**, so Ship/Exec hit 5s. Numeric tie-outs are **self-labeling** like
the Ingestion Detector (a figure agrees with SEC XBRL/FinQA or it doesn't → zero manual labels); the narrative
grounding judge is seeded by **AuditFraudBench** (arXiv 2606.08345, CC-BY-4.0, real restated 10-K/10-Q + SEC
AAERs) and **FinVerBench** (arXiv 2605.29586, real SEC-filing claim verification with supported/refuted/NEI
labels) with ~0 new labels + a 4–7 hr spot-check. Plus **FinQA** (8,281 QA pairs, numeric tie-out ground truth)
and **SEC EDGAR Inline XBRL** (public-domain numeric ground truth). It beats Kappa on the legally-forced buyer
(AS 1105/QC 1000 mandatory documentation vs optional anxiety) and on impact (public-company audit reliability +
partner liability).

**Nearest player + wedge.** DataSnipper + Fieldguide do tie-outs/evidence extraction; Trullion does control-linked
evidence — all three grade their OWN output and explicitly leave the auditor responsible. MindBridge does
full-ledger anomaly detection, not source-vs-assertion faithfulness. Horizontal groundedness APIs (Patronus/Lynx,
Vectara/HHEM, Azure) aren't audit-shaped and none has shipped an audit vertical. Bylaw (YC) gates an agent's own
action, not a workpaper. The wedge = {independent + pipeline-agnostic + AS 1105/QC 1000 workpaper artifact}.
**Wedge-shaping constraint (not a kill):** validation is the engagement team's *non-delegable* duty, so this must
be sold as *the team's own tool for generating the defensible artifact*, NOT as an outsourced "we independently
audited your AI" service.

**The real risk.** **Corpus choke + slow distribution.** The cross-firm defect corpus that IS the moat depends
on firms/vendors letting a third party ingest AI outputs and reviewer verdicts — audit-AI vendors have every
incentive to refuse — and mid-market/regional audit-firm sales cycles are relationship-gated and brutally slow
for a solo part-timer. Fast-follow squeeze from DataSnipper/Fieldguide adding a "review-any-file" upsell (still
self-ecosystem) or a horizontal verifier launching an audit vertical (none has yet).

**First cheap step.** Seed the numeric channel on FinQA/XBRL (self-labeling, zero annotation) and the narrative
channel on FinVerBench + AuditFraudBench; re-point the grounding judge to score source→workpaper-assertion;
publish a per-assertion supported/contradicted + fabrication/omission benchmark. <$500, no client PHI-equivalent,
part-time.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 91.7** (judge honest band ~87). Note:
this **ties** NoteProof, it does not exceed it — the only real improvement (Exec 5 vs 4, no PHI/BAA friction) is
offset by a slower/narrower buyer and a corpus-access risk that bites harder in audit than in healthcare.

---

### 4 · DenialProof — independent medical-necessity denial-defensibility verifier (payer-side, pre-send) — 86.7

**The problem.** Payers auto-draft medical-necessity denials with UM AI, and California's **SB 1120 ("Physicians
Make Decisions Act")** now legally forces a licensed physician to own and sign each one. The liability is live:
**Estate of Lokken v. UnitedHealth** (nH Predict; MN discovery order 2026-03-09, >90% appeal-reversal) and
**Kisting-Leung v. Cigna** (PxDx, 300k+ claims). **CMS-0057-F** + the 2026-03-31 public prior-auth-metrics
mandate report an MA overturn rate of 80.7%. A wrongly-denied claim is patient harm + wrongful-denial liability.

**Who pays (the liability-holder).** The party that ISSUES the denial and holds the liability — the **health
plan / UM medical director / CMO / compliance-and-appeals office** at a plan, Medicaid MCO, or TPA, now legally
forced by SB 1120 to have a physician own and sign each denial. Aligned buyer. Later: stop-loss/E&O carriers.
~$3–15/denial-verified or a per-reviewer compliance subscription.

**Product shape.** Send the denial's clinical rationale + the submitted record + the cited criteria
(InterQual/MCG/NCD/LCD/plan policy); get back per-assertion supported/unsupported/contradicted with the cited
record span, a **conclusory-statement flag** (the exact DMHC penalty pattern), a missing-criteria-element flag,
and a **calibrated overturn-risk score** benchmarked against the real IMR outcome corpus. Only high-risk denials
route to a ~60-sec physician review before signature; exports to an SB 1120 attestation audit log. **Grades,
never drafts or decides.**

**Moat + why it beats Kappa (and why it trails NoteProof).** A compounding cross-plan defensibility corpus
(denial rationale, submitted record, cited criteria, grounded/conclusory verdict, later overturn/uphold outcome)
keyed to service line + criteria set + plan. Seeded free from **California DMHC IMR** determinations
(`data.chhs.ca.gov`, free CSV, 2001–2026, labeled overturn/uphold), **Texas TDI IRO**, and **HHS Medicare
Appeals Council** — and **CEUR-WS "Textual Evidence for the Perfunctoriness of IMRs"** (KiML 2020, Vol-2657)
shows the reviewer-rationale text is highly predictive of outcome. It clears Kappa on impact (patient safety +
hard liability vs dev-tooling) and on the legally-forced SB 1120 buyer. **It trails NoteProof (86.7 vs 87.5)
for one honest reason** flagged by doc-20's differentiated-half test: the free DMHC IMR data proves the
**already-existing overturn-prediction axis** (Revecore, Epic "Likelihood of Payment", conformal models all do
this), NOT the **novel pre-send record-grounding axis**, which has **no free paired labels** (IMR gives no
denial-letter→submitted-record pairs). So the fast free result demonstrates a commodity capability; the
differentiator needs synthetic denial construction + a paid clinician second-rater → Ship 4, Exec 4.

**Nearest player + wedge.** No independent, cross-plan, pre-send medical-necessity DEFENSIBILITY grader exists.
UM-AI vendors (Cohere Unify, Optum InterQual AutoReview/nH Predict, Availity AuthAI, EviCore) self-grade only
their own determinations; provider-side RCM (Aspirion, Revecore) fight denials from the opposite side;
DMHC/state IROs review only after the fact on appealed cases. **Brellium ($16.7M)** is the closest structural
analog but provider-side (hardens the chart), a credible future pivot risk. The wedge = {independent +
vendor-agnostic + payer-side + pre-send + grounding, not overturn-prediction} — pitch the independent pre-issuance
grounding grade, with overturn-risk as a secondary signal, never as the differentiator.

**The real risk.** The fast, cheap, free-data result proves the *wrong thing* (overturn-prediction, already
built by others), not the novel pre-send grounding axis. Secondary: IMR outcomes are CA-centric (thin external
validity), Brellium can fast-follow, and payer procurement is a punishing solo motion.

**First cheap step.** Seed on DMHC IMR (free, labeled) to ship the overturn-risk axis fast as a credibility
anchor, then construct synthetic (denial-letter, record, criteria) triples + a light paid-clinician second-rater
to validate the grounding axis that is the actual moat. <$500, part-time; budget the clinician spot-check.

**Scores:** Ship 4 · Impact 5 · Found 4 · Exec 4 · Hire 5 → **Composite 86.7** (above Kappa, just under
NoteProof).

---

## NEAR-MISSES — composite 75.0–83.3

| Name | Composite | Why it missed |
|---|:--:|---|
| **AppealScore** — vendor-agnostic appeal-WIN grader | **85.0** | Above the bar by the number, but Found 3: prior-work commoditizes the win-probability primitive (CombineHealth/Rachel, Aegis, a USPTO patent) and the natural buyers (Counterforce, Claimable) are build-not-buy incumbents who own distribution. Great artifact, fragile company. |
| **ScreenProof** — LLM/AI sanctions & PEP screening validator | **83.3** | Ties the bar exactly, but Found 3: vendor-neutral filter testing is already occupied (SWIFT, AMLA, ClearBench); the open seat is a narrow three-way conjunction whose hardest leg (live-production rationale monitoring) is not solo-buildable. |
| **DispoProof** — defensibility grader for AI AML alert-dispositions | **80.0** | NoteProof-class idea (aligned MLRO buyer, huge suppressed-true-SAR blast radius), but the defensibility gold is NOT self-labeling and the moat corpus is confidential-SAR-locked; Bylaw + the now-named "agentic oversight" architecture let incumbents fast-follow. |
| **AuthAudit (WISeR Watch)** — accuracy audit of prior-auth AI non-affirmations | **80.0** | Hottest fire on the slate (Impact 5, EFF/AHA/CMS tailwind, un-backfillable cross-vendor moat) but inherits DenialProof's buyer trap: the company-grade buyer won't pay to manufacture adverse evidence, and the buyer who wants the number is advocacy-shaped/low-WTP. |
| **CascadeProof** — false-negative auditor for AI alert-suppression | **75.8** | Sharpest founding *seat* in the aperture (structurally uncopyable independence, maximally liability-aligned MLRO), but loses TaxProof's one advantage: its outcome labels and moat corpus are **sealed BSA data** a solo can't obtain on <$500, so the shippable v1 is a synthetic demo of unproven real-world transfer. |

*(Two additional AML/insurance candidates — FairLens 71.7 and DeclineAudit 71.7 — fell to hire-only and sit
below this band; they're covered in doc-20's full slate, not here.)*

---

## Honest closing — the strongest one or two vs Kappa (83.3) and NoteProof (87.5)

**The aperture pays off.** Four candidates clear Kappa and three tie NoteProof at the top of the pool. That is a
genuinely strong result — and it is *not* an artifact of grade inflation, because the reason these clear is
structural and specific: three of the four ship **free, real, license-clean government/public data that labels
the differentiated half** of the verdict (CFPB monetary-relief outcome, HMDA denial-reason+protected-class+outcome,
SEC XBRL numeric ground truth). That is the exact property doc-20's differentiated-half test rewards, and it is
rarer than the healthcare-only lane made it look.

**The strongest two, and they are close:**

1. **ReasonProof (91.7)** is the single sharpest bet in the aperture. It is the only candidate whose **ground
   truth is self-generated, not annotated** — train a transparent model, compute true drivers, grade the codes —
   which removes the one bottleneck (clinician/SME spot-check) that caps DenialProof and every healthcare
   verifier. HMDA is the cleanest free data on the whole program, the SR 11-7 independence posture is a
   *regulatorily-grounded* moat (not just positioning), and the ECOA duty is a surviving, non-contested lane. Its
   only real drag is company-stage go-to-market speed into examiner-gated buyers — a *slower*, not *weaker*,
   founding story. If you want the highest-ceiling founding bet in this aperture, this is it.

2. **DisputeProof (91.7)** is the fastest, most legally-forced bet. Free zero-label seed data with a built-in
   outcome proxy, a buyer facing an *active class-action wave* (not just a doctrine), and a near-verbatim re-point
   of his published judge. Its honest cap is that the free outcome proxy (monetary-relief field) is noisier than
   HMDA's structured labels, so the eval headline is a touch softer than ReasonProof's.

**Versus the anchors.** All three top candidates **clear Kappa decisively** — they replace Kappa's optional-anxiety
buyer with a legally-forced one and add an aligned liability-holder, which is exactly Kappa's documented weakness.
Versus **NoteProof (87.5)**, the honest read is **parity, not domination**: the judge's own composite math lands
the three 91.7s at ~87–88 on their 5·4·4·5·5 profiles, i.e. tied with NoteProof, with the 91.7 as the optimistic
end of the band. **TieProof in particular ties rather than beats NoteProof** — its Exec-5 edge (no PHI/BAA
friction) is offset by a slower audit-firm buyer and a harder corpus-access risk.

**The one caveat that applies to all three winners.** In every case the *day-one* moat is independence-positioning
plus a free-data head start; the *durable* moat — the un-backfillable cross-institution defect corpus — is a
**post-traction flywheel**. Pre-traction, defense rests on the neutrality story against self-grading incumbents,
and in each vertical there is a named live threat that can bolt on a "defensibility score" (Lorikeet Coach /
Rulebase for DisputeProof; AVAAS for ReasonProof; DataSnipper/Fieldguide for TieProof). The bet is that he converts
early liability-owner design partners into the corpus before that happens. That is a real bet — but it is the same
bet NoteProof and Kappa carry, so it does not distinguish them downward; it just means the winner is decided by
**go-to-market speed into a legally-forced buyer**, which is why ReasonProof (surviving duty, self-generated ground
truth) and DisputeProof (active class-action wave, zero-label data) are the two to run.
