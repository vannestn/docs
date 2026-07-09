# 24 · Founding through liability-holding health & safety verticals — who clears Kappa

*Written 2026-07-09. Plain-English and decision-focused, like [doc 20](20-decision-and-ranking.md) and
[doc 22](22-founding-vertical-and-buyer.md) — not the dense research-log style. This is an **add-on to the
doc-20 ranking**, not a replacement. Doc 20 ranked 11 candidates and put Ingestion (84.2) and Kappa (83.3)
at the top; doc 22 added NoteProof and TrajTrust at 87.5. This doc runs a **fresh founder-scout pass through
one deep aperture** and asks the same narrow question: through that lens, does anyone actually *match or beat
Kappa (83.3)* — and how do they stack against doc-22's NoteProof (87.5)? Where a number here and an earlier
doc disagree, the earlier docs' candidates are unchanged — these are new entrants stacked against the same
bar.*

---

## The aperture, the goal, and how many honestly cleared

**The aperture: liability-holding health & safety verticals, gone deep.** Instead of scanning many
industries shallowly, this pass drilled into clinical-safety sub-workflows where (a) an AI system now drafts
or decides something a human must sign, (b) the *signer* — not the AI vendor — holds legally non-delegable
liability, and (c) Nick's exact published RAG-hallucination / LLM-as-judge method re-points onto free,
license-clean seed data. The recurring shape is the same one that made NoteProof work: an **independent
verifier that grades another vendor's AI output** and hands the liable human an **attestation-log artifact**.
The question is which specific sub-workflow gives that shape the cleanest buyer, the freest seed data, and
the least-crowded lane.

**The goal.** Kappa (83.3) remains the reference founding bet: fastest-ship, best skill-fit, best hire
artifact — but a contested lane. Doc 22 already found two ideas (NoteProof, TrajTrust) at **87.5** that beat
Kappa by trading the crowded lane for an *aligned* liability-holder buyer. So this pass has a harder bar than
doc 22 did: not just *match or beat 83.3*, but ideally *match or beat NoteProof's 87.5* — the new
health-safety high-water mark.

**How many cleared, honestly: three.** Of everything surfaced in this deep aperture, **three candidates land
at or above 83.3**. One — **PortalProof (87.5)** — genuinely ties NoteProof and clears Kappa; it is the
single closest re-point of Nick's exact method onto a *distinct* liability-forced clinical sub-workflow with
near-free seed data. Two more clear Kappa but not NoteProof: **TriageProof (85.0)** and **InteractionProof
(83.3, exactly at the bar)**. Then a long tail of near-misses — the medication-order, radiology, pathology,
denial, and trial-deviation ideas — fell to **75.8–82.5**, held down by the same recurring killers: seed
data that isn't actually free-and-paired, moats you must license from the very incumbent you'd referee, or a
funded YC company one product-decision away. **This was not a pass where everything cleared: six of nine
health-safety ideas fell short of Kappa**, and the reasons are specific and worth reading, because they're
the same traps any future health-safety pitch will hit.

---

## CLEARED — at or above Kappa (83.3)

| Name | Composite | Ship | Found | Exec | Moat | One-line |
|---|:--:|:--:|:--:|:--:|---|---|
| **PortalProof** | **87.5** | 5 | 4 | 4 | Cross-vendor corpus of real in-basket draft errors, packaged as an attestation log for the liable signer | Independent faithfulness/safety verifier for AI-drafted patient-portal replies — flags fabricated instructions, dropped safety-netting, and under-routed emergencies before a clinician signs. |
| **TriageProof** | **85.0** | 5 | 4 | 5 | Cross-vendor corpus of real undertriage cases + a frozen vendor-blind gold-acuity set | Independent, vendor-agnostic undertriage verifier for AI symptom-checkers — the honest fatal-undertriage number every vendor's "94% accuracy" claim hides. |
| **InteractionProof** | **83.3** | 5 | 3 | 5 | Adjudicated cross-engine gold set (severity × mechanism × evidence) + neutrality as structural moat | Independent accuracy + evidence-grade auditor for drug-interaction checkers, in a market where the databases disagree worse than chance. |

**PortalProof** is the only one that ties NoteProof (87.5) and clears Kappa on the same axis NoteProof did —
founding-upside 4, via an aligned liability-holder buyer instead of a contested lane. **TriageProof** and
**InteractionProof** clear Kappa but land below NoteProof: TriageProof because a public benchmark
(AcuityBench) already owns its core measurement, InteractionProof because its moat is a copyable
certification brand and vendors can refuse to be audited. Cards below.

---

### 1 · PortalProof — patient-portal reply faithfulness & safety verifier — 87.5

**The problem (and the papers behind it).** Health systems now let AI draft the replies clinicians send to
patient-portal (in-basket) messages — and the clinician signs and owns that reply. The drafts are dangerous
in three specific ways: they **fabricate instructions** (invented doses, results, or directions), they
**drop required safety-netting** (the "if X gets worse, call us" follow-up), and they **under-route
emergencies** (a message describing a red-flag symptom that the draft answers casually instead of escalating).
The evidence is sharp: a Lancet Digital Health study (Chen et al., 156 replies) found ~7% carried
*severe*-harm potential including death risk; the npj Digital Medicine 2026 guardrails paper
(s41746-026-02621-6, also arXiv 2509.22565) builds the error taxonomy; and the Dartmouth edit-burden study
(arXiv 2601.11344, 146k portal conversations) shows how often drafts go out lightly edited. The liability is
non-delegable: the clinician who signs the reply owns it.

**Who pays (the liability-holder, not the graded vendor).** The health-system medical director / ambulatory
quality-and-risk office and the physician groups whose clinicians sign the outbound reply — the party
holding the signature liability, so their incentive is *aligned* with wanting an honest score. Concretely:
mid-size health systems and large ambulatory/primary-care groups running Epic/Oracle-Health draft-reply
features, plus urgent-care and telehealth groups; later, malpractice carriers and even EHR/draft vendors
white-labeling a "verified reply" badge. Pricing ~$30–100/provider/mo or per-message-verified.

**Product shape.** Send the patient's inbound message + chart context + the AI-drafted reply; get back
per-sentence "supported / unsupported / contradicted / unsafe-instruction" with the cited chart or source
span, a **fabrication flag** (invented dose/result/instruction), an **omission flag** (dropped safety-netting
follow-up), and an **acuity/red-flag flag** (message describes an emergency the draft under-routes). Only
risky replies route to full clinician review; everything exports to an audit/attestation log. It sits
*beside* any draft-reply engine — it grades, it never drafts.

**Moat, and why it beats Kappa / matches NoteProof.** The durable edge is a compounding, un-backfillable
**cross-vendor corpus of real in-basket draft errors** — which drafting engine mis-generated what, from what
inbound message + chart, and the clinician's correction — packaged as a compliance/attestation artifact for
the liable signer. No single EHR/draft vendor can assemble a *cross*-vendor corpus. This is the same class of
flywheel as NoteProof's, on a *distinct* sub-workflow (inbound-message + chart → reply, not visit-audio →
note), which is why it earns 87.5 rather than borrowing it. It beats Kappa on founding-upside (4 vs 3): a
legally-forced, aligned buyer versus Kappa's contested dev-tooling lane.

**Nearest player + the wedge.** No one ships this as an independent product. The closest things are
**vendor-internal**: Epic MyChart **In-Basket ART** (Augmented Response Technology) is the dominant drafter
(~15k clinicians, 150+ systems) but QA is the vendor grading its own homework — red-flag keyword routing and
speed-bumps, not automated faithfulness scoring. **ClinicalSwipe** owns the exact independent-attestation /
signed-record / 7-yr-audit-trail framing today — but it's *human*-in-the-loop and covers notes / prior-auth /
care-plans, *not* message replies. **Patronus Lynx** and **Azure AI Content Safety** (medical groundedness)
are horizontal RAG-grounding engines with no safety-netting or emergency-routing checks and no clinician
attestation. The npj-2026 and Dartmouth works are research artifacts, not products. **The unoccupied wedge:**
the drop-in, automated, per-reply verifier that checks the *three reply-specific failure modes* and outputs
an attestation log the signing clinician can rely on.

**The real risk (be honest).** Two things thin the moat versus NoteProof. (1) **The attestation lane is more
crowded** — ClinicalSwipe is one product decision (automate + extend to replies) from the same positioning,
and Patronus/Azure are off-the-shelf engines a buyer could "good-enough" with. (2) **Seed-data fit is
thinner than NoteProof's** — NoteProof had pristine, purpose-built ACI-Bench (167 conversation-note pairs);
PortalProof's seed is improvised (Dartmouth is *conversations* not message-reply+chart pairs; MIMIC/ClinicalNLP
is a message-style *proxy*). The faithfulness check re-points near-verbatim, but the **safety-netting and
emergency-routing checks are the unproven part** and could thin the wedge to plain groundedness. Plus:
EHR/in-basket distribution is gated, and health systems buy safety through procurement — brutal for a
part-time solo. The pilot needs no PHI; the company does.

**First cheap step (≤$500, ~4–7 hrs).** Re-point his published RAG-hallucination judge from
retrieval→answer to inbound-message+chart→reply, seed it on the free npj taxonomy corpus + Dartmouth framing
+ MIMIC/ClinicalNLP message-style pairs (~0 new labels, zero PHI), and spot-check. The deliverable is the
number nobody publishes: *"across drafting engines, X% of AI-drafted portal replies carry a fabricated
instruction, a dropped safety-net, or an under-routed emergency."*

**Score line:** Ship 5 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **87.5** (ties NoteProof/TrajTrust, clears
Kappa). Path: found-plausible.

---

### 2 · TriageProof — undertriage verifier for AI symptom-checkers — 85.0

**The problem (and the papers behind it).** AI triage and symptom-checkers output a *disposition*
(self-care / routine / urgent / emergency), and every vendor advertises "~94% accuracy" — a number that
hides the only failure that kills people: **undertriage**, telling an emergency patient to stay home. The
Nature Medicine May-2026 study (Mount Sinai/Harvard, 960 responses) found ChatGPT Health **undertriaged 48%
of emergency cases**. The Coiera group's "evaluation format, not model capability, drives triage failure"
(arXiv 2603.11413) is a direct methodology wedge Nick's eval skills own — the pitch is literally *"your
vendor's safety number is a measurement artifact; here is the honest one."* Free seed data exists today:
**AcuityBench** (arXiv 2605.11398, 914 cases harmonizing 5 public datasets, incl. 217 physician-confirmed
ambiguous cases for uncertainty-alignment), Semigran's 45-vignette BMJ-2015 yardstick, and ER-Reason ESI
cases (arXiv 2505.22919).

**Who pays (the liability-holder).** The party deploying the triage layer whose disposition carries
standard-of-care liability — telehealth companies, health systems, and payer nurse-advice / care-navigation
lines — plus their malpractice carriers. *Aligned:* they want an honest independent undertriage number to
defend their deployment. Per-encounter-verified or a monthly assurance subscription; later a payer/carrier
"independently verified triage safety" attestation.

**Product shape.** Send the patient presentation (chat transcript or structured intake) + the triage
engine's disposition; get back an independent acuity read with calibrated agree/disagree, a specific
**undertriage flag** with the missed red-flag reasoning, the nearest matching gold vignette, and an
**uncertainty-alignment score** (does the engine express clinician-level ambiguity or falsely-confident
concentration). Only true disagreements route to a nurse; everything exports to a safety/audit log. Runs
beside *any* vendor (Ada, Infermedica, K Health, home-grown LLM) — it grades, it never triages.

**Moat, and why it beats Kappa.** A compounding cross-vendor corpus of real **disagreement/undertriage
cases** — which vendor's disposition was unsafe, on what presentation, and the corrected acuity —
un-backfillable because each vendor sees only its own outputs, plus a **frozen vendor-blind gold-acuity set**
the vendors never see. It beats Kappa on founding (4 vs 3): an aligned liability-holder buyer with an
*asymmetric-fatal* pain, versus Kappa's contested lane.

**Nearest player + the wedge.** No independent undertriage verifier exists. Every triage vendor
*self*-grades its own engine: Infermedica (94% accuracy + EU-MDR Class IIb), Ada (a Stanford study of Ada's
own system), Hippocratic AI (validates its own voice-nurse). Adjacent governance/eval platforms — Ferrum,
Signal1, ALIGNMT AI, Complira — are general-purpose and deployer-run (self-grading, one layer up); none sells
undertriage-vs-gold-acuity as a named product. Academics do point-in-time head-to-heads (SMASS, Mount Sinai's
48%, NHS-111 vs GPT-5) but nothing is a productized, continuously re-run, apples-to-apples leaderboard on a
frozen gold set. **The unoccupied wedge:** a triage-specific, cross-vendor, undertriage-focused,
standard-of-care assurance/audit artifact for the liable deployer.

**The real risk (be honest — this is why it lands at 85, below NoteProof's 87.5).** Two things. (1) **The
core measurement is already public.** AcuityBench (Columbia/Elhadad, May 2026) is a public, academic-owned
harmonized acuity corpus with the exact undertriage/over-triage math *and* the uncertainty-alignment set —
the raw eval math is commoditizing *now*, not later. (2) **The buyer-liability discovery paradox.** The
liable buyer wants an honest undertriage number only until that signed audit *finds* undertriage — at which
point it becomes plaintiff's Exhibit A in a standard-of-care suit. That pushes buyers toward vendor
self-grading or attorney-privileged internal review, making willingness-to-pay for an *un-buriable*
independent referee structurally contested. Defensibility must live in the frozen vendor-blind gold set +
the liability report + accumulated real cases, not in the eval math.

**First cheap step (≤$500, ~4–7 hrs).** Re-point his judge/agreement work from answer-faithfulness to
disposition-vs-gold-acuity on AcuityBench + Semigran + ER-Reason (~0 new labels, zero PHI), publish the
honest fatal-undertriage number for the top named engines, and lead with the Coiera "format drives failure"
framing.

**Score line:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 4 → **85.0** (clears Kappa; below NoteProof).
Path: found-plausible.

---

### 3 · InteractionProof — accuracy + evidence-grade auditor for drug-interaction checkers — 83.3 (exactly at the bar)

**The problem (and the papers behind it).** Drug-interaction checkers are trusted to catch dangerous
combinations — but the reference databases **disagree worse than chance** (Micromedex vs WebMD kappa −0.126;
Micromedex/Lexicomp only 39.4% agreement), clinicians override ~90% of the alerts they *do* fire (Felisberto
et al., DOI 10.1177/14604582241263242), and LLM-based checkers are weak (ChatGPT ~47% sensitivity; Rx-LLM
missed a Category-X andexanet–heparin interaction). So a checker's advertised accuracy hides two separate
failures: **what fraction of true severe interactions it misses (recall)**, and **whether each alert it fires
even carries a mechanism, direction, and evidence base** or is just an unsupported "possible interaction."

**Who pays (the liability-holder).** Health-system pharmacy informatics / P&T + medication-safety officers
who own alert governance and eat *both* the missed-interaction lawsuit and the alert-fatigue burnout; plus
digital-health/AI-pharmacist vendors needing an independent "interaction-screening validated" badge, and
DDI-content vendors wanting neutral third-party attestation as a channel. *Aligned:* the party carrying the
miss-liability wants an honest recall number. Per-formulary accuracy audit + monitoring subscription;
secondary = carriers/payers requiring validation.

**Product shape.** A neutral referee: point it at *any* interaction engine (a database, a CDS ruleset, or an
LLM checker) + a patient med-list stream; it reports calibrated **per-severity recall**, false-positive /
over-alert rate, and — the differentiator — an **evidence-grade score** (does each fired alert carry a
mechanism, direction, and evidence base?). Outputs a blind-spot map ("your engine misses N% of Category-X,
over-alerts M% on Category-C"), a portable accuracy badge, and an alert-governance report the P&T committee
can act on.

**Moat, and why it ties Kappa (not beats it).** A compounding, un-backfillable adjudicated cross-engine gold
set keyed to **severity × mechanism × evidence quality** — scarce precisely because no database vendor will
grade its own misses, and because the databases disagree so much that a neutral adjudicated reference *is
itself the asset*. **Independence is a structural moat:** every existing detector is bundled inside a vendor
whose incentive is to look good. It matches Kappa on impact (4 vs Kappa's 3 — a missed Category-X interaction
is patient harm) but ties on founding, because the moat is a copyable **certification brand** more than
defensible tech.

**Nearest player + the wedge.** No independent DDI-accuracy referee exists. Comparative-accuracy academic
studies grade databases but ship no product. Alert-governance tools (**Phrase Health, VigiLanz, Wolters
Kluwer "precision drug alerting"**) *tune/suppress* alerts but don't score an engine's recall or evidence
quality — and WK is conflicted, owning Medi-Span/Lexicomp. AI-pharmacist vendors (Sully.ai) self-report their
own accuracy (80–89%, no severity-stratified recall, no evidence grading). **The unoccupied wedge:** a
neutral, cross-engine, evidence-grade-aware accuracy audit sold to the liability-holding P&T buyer.

**The real risk (be honest — this is why it sits exactly at 83.3, not above).** Two documented threats. (1)
**Vendors decline to be audited.** In the ONC-reference comparison study, **Medi-Span and Gold Standard
declined to participate** — a live warning that incumbent engine vendors may refuse, gutting the cross-engine
gold-set moat and forcing the beachhead onto the provider/P&T side. (2) **The moat is a copyable brand + a
slow P&T sales motion**, and DDI-content incumbents could bolt on a self-serving claim; the Joint Commission's
live (June 2026) RUAIH certification looms as a brand threat. Adjudicating a gold set keyed to
severity+mechanism+evidence also needs more clinical judgment than a pure agreement study, so **validate that
≥1 design partner will pay for third-party certification before building.**

**First cheap step (≤$500, ~4–7 hrs).** Re-point his agreement/recall math to interaction alerts on free
public data (Rx-LLM DDI task, DDI-Bench, AIChemist, the 750-scenario clinician-annotated severity benchmark)
with deterministic true/false labels for known pairs (self-labeling, minimal manual review). The viral hire
artifact writes itself: *"we graded the top interaction checkers — one misses half of severe interactions and
can't explain the other half."*

**Score line:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 5 → **83.3** (exactly at Kappa; below NoteProof).
Path: found-plausible.

---

## NEAR-MISSES — real ideas that fell short (75.8–82.5)

These are genuine liability-holder shapes that *didn't* clear Kappa. They're here because the *reasons* they
fell short are the sharpest lesson in the whole pass — every one of them is a health-safety idea that looked
like an 87.5 and got dragged down by one specific, checkable flaw.

| Name | Composite | Why it fell short (one line) |
|---|:--:|---|
| **DoseGuard** | 82.5 | Life-or-death and aligned, but you must **license reference dose data from the FDB/Wolters-Kluwer duopoly you'd referee**, and the cross-vendor corpus has a hard cold-start + FDA/CDS overhang. |
| **RxAgentProof** | 82.5 | Independence wedge is real, but **no free medication-trajectory corpus exists** (the trajgate dry-run was generic web tasks, not meds), Parachute is one decision away, and validated "actually-wrong" labels need paid clinical judgment. |
| **DermPathCheck** | 78.3 | Unclaimed second-opinion-enforcement gate is a real wedge, but **no clean labeled melanoma-synoptic corpus** (scarce PDFs → synthetic + self-grading) and the danger-grading needs dermatopath expertise the solo founder lacks. |
| **DeviationGrade** | 75.8 | Textbook NoteProof-family verifier on a fresh FDA mandate, but **Panoptive (YC) is one feature-decision away** and the "important vs other" labels are a judgment call, not a free rubric lookup. |
| **RadReconcile** | 75.8 | Novel, loudly-validated liability wedge, but the **grade is self-undermining for its own buyer** (a signed "unreasonable override" is discoverable against the radiologist) and the logging half is an easy incumbent bolt-on. |
| **DenialProof** | 75.8 | High-impact and regulation-forced (CMS-0057-F), but the **flagship paired gold (denial + de-identified record + criterion) is PHI-walled behind a design partner**, so the solo v1 is synthetic-only. |

The pattern is consistent: each near-miss keeps NoteProof's *shape* (aligned buyer, attestation artifact) but
loses on one of exactly three axes — **seed data that isn't actually free-and-paired** (RxAgentProof,
DermPathCheck, DenialProof, DeviationGrade), a **moat you'd have to license from your own competitor**
(DoseGuard), or an **artifact the liable buyer doesn't actually want to exist** (RadReconcile). That's the
same trap-set to screen any future health-safety pitch against.

---

## Honest closing — the strongest, versus Kappa (83.3) and NoteProof (87.5)

**The strongest here is PortalProof (87.5).** It is the one candidate in this deep aperture that genuinely
ties NoteProof and clears Kappa on the axis that matters — founding-upside 4 via an aligned liability-holder
buyer, on a *distinct* sub-workflow with a distinct un-backfillable corpus. It is, essentially, NoteProof's
sibling: the single closest re-point of Nick's exact published method onto another liability-forced clinical
surface with near-free seed data and zero PHI in the pilot. If you want a second founding bet in the
NoteProof family, this is it.

**But two honest caveats keep it *tied with*, not *ahead of*, NoteProof.** First, its **attestation lane is
more crowded** — ClinicalSwipe already ships the independent-attestation framing and is one product decision
from replies. Second, its **seed-data fit is thinner** — NoteProof had pristine ACI-Bench; PortalProof
improvises from proxies, and its two distinctive checks (safety-netting, emergency-routing) are the unproven
part. It lands **found-plausible, not found-strong**, for those reasons.

**TriageProof (85.0) and InteractionProof (83.3)** clear Kappa but sit clearly below NoteProof, each for a
concrete reason worth remembering: TriageProof's core measurement is *already public* (AcuityBench) and its
buyer has a discovery-paradox on the number; InteractionProof's moat is a *copyable certification brand* and
vendors have a documented history of *refusing to be audited*.

**Net for the decision.** This aperture did **not** produce something that beats NoteProof — the health-safety
high-water mark is still 87.5, and PortalProof matches rather than exceeds it. If Nick wants to run one
health-safety pilot next, the honest ranking is **PortalProof ≈ NoteProof (87.5) > TriageProof (85.0) >
InteractionProof / Kappa (83.3)**, with PortalProof's edge being that it's the freshest, least-explored of
the top tier. Everything below 83.3 is a good hire artifact but a compromised company — read the near-miss
reasons before pitching any of them.
