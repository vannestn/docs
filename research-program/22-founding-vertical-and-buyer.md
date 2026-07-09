# 22 · Founding through a vertical + buyer lens — who clears Kappa

*Written 2026-07-09. Plain-English and decision-focused, like [doc 20](20-decision-and-ranking.md) — not
the dense research-log style. This is an **add-on to the doc-20 ranking**, not a replacement. Doc 20 ranked
11 candidates by your five weighted criteria and put Ingestion (84.2) and Kappa (83.3) at the top. This doc
runs a **fresh founder-scout pass through one specific aperture** and asks a narrower question: through that
lens, does anyone actually *match or beat Kappa (83.3)* as a founding bet? Where a number here and doc 20
disagree, doc 20's 11 are unchanged — these are new entrants stacked against the same bar.*

---

## The aperture, the goal, and how many honestly cleared

**The aperture: vertical-industry + buyer-GTM.** Instead of asking "what eval method can Nick ship,"
this pass asked a go-to-market question: *is there a specific regulated or liability-bearing vertical where
(a) a named buyer already holds the pain and the money, (b) the buyer is the party being helped rather than
the party being graded, and (c) Nick's exact published RAG-hallucination-judge method re-points onto free,
license-clean data in that vertical?* That is a deliberately different filter from doc 20, which scored
methods first and buyers second. Here the buyer comes first.

**The goal.** Doc 20's #2, Kappa (83.3), is the reference founding bet: fastest-ship, best skill-fit, best
hire artifact — but with a contested lane that funded incumbents (Braintrust, Galileo, Confident AI) can
flank. The bar for this pass is simple: **match or beat 83.3 on the same weighted composite**, ideally by
fixing Kappa's one real weakness — a crowded founding lane — with a stronger, aligned buyer.

**How many cleared, honestly: two.** Of everything surfaced in this aperture, **two candidates land at or
above 83.3**, and both land at the same composite — **87.5** — meaningfully above Kappa and just above
doc-20's overall #1, Ingestion (84.2). Neither is a fantasy: both are near-verbatim re-points of Nick's
already-published judge work onto free, public data, so ship-speed and executability match Kappa's 5s, and
both trade Kappa's contested lane for a buyer who *wants the number to exist*. Two more came close but did
**not** clear — they sit at 75.8, held down by data cold-starts and narrower employer pools — and they're
in the near-miss table so you can see exactly why the bar is where it is. This was not a pass where
everything conveniently cleared; two of four founder-shaped ideas fell short, and the reasons are specific.

---

## CLEARED — at or above Kappa (83.3)

| Name | Composite | Ship | Found | Exec | Moat | One-line |
|---|:--:|:--:|:--:|:--:|---|---|
| **NoteProof** | **87.5** | 5 | 4 | 4 | Cross-vendor scribe-hallucination correction corpus + compliance/attestation-log packaging | Vendor-agnostic verifier that scores whether each sentence of an ambient AI scribe's note is grounded in the visit transcript — flagging hallucinated exams before the liable physician signs. |
| **TrajTrust** | **87.5** | 5 | 4 | 5 | Cross-customer judge-vs-human *disagreement* corpus keyed to failure mode | Platform-agnostic judge-trust / blind-spot audit for agent trajectories — shows which failure classes your trajectory judge silently misses, so teams stop shipping on a green-but-wrong dashboard. |

Both beat Kappa on the **founding-upside axis** (4 vs Kappa's 3) by trading a contested lane for an aligned
buyer, while tying Kappa on ship-speed and hire-signal. NoteProof adds higher impact (patient safety +
physician liability); TrajTrust adds a faster-growing buyer (agent teams) with genuinely no
"judge-of-the-judge" incumbent. Cards below.

---

### 1 · NoteProof — clinical-scribe faithfulness verifier — 87.5

**The problem (and the papers behind it).** Ambient AI scribes (Abridge, Nuance DAX, Suki, DeepScribe,
Freed, Heidi) now draft the clinical note from the visit audio — and they hallucinate. They invent physical
exams that never happened and drop facts the clinician said. A simulated-encounter study measured a **mean
error rate of 26.3%** (ScienceDirect); *"Beyond human ears"* (npj Digital Medicine 2025, PMC12460601) and a
Frontiers-in-AI-2025 note-quality study document the same failure modes on real notes. The public **ACI-Bench**
dataset (Yim et al., *Scientific Data*/Nature 2023) ships 167 conversation-note pairs to measure it against —
free, today. And the liability is now legally sharp: 2026 reaffirmed the *Captain of the Ship* doctrine —
the **signing physician**, not the scribe vendor, bears primary liability — and the cited proven defense is a
verifiable user-verification log. So a physician is signing, under their own name, a note that may contain a
fabricated exam, with no independent check that it matches what was actually said.

**Who pays.** The medical director / compliance-and-risk office — **not the graded scribe vendor.** That is
the whole point: the buyer is the party holding the signature liability, so their incentive is *aligned* with
wanting an honest score. Concretely: independent and small physician groups, urgent-care and specialty
clinics, and mid-size health-system compliance offices carrying malpractice-and-signature liability; later,
malpractice carriers and even scribe vendors white-labeling a "verified" badge. Pricing ~$40–120/provider/mo
or per-note-verified. This is an *aligned buyer*, which is the exact inversion of the usual "who pays to be
measured" problem.

**Product shape.** Send the visit transcript (or audio) plus the scribe's draft note; get back per-sentence
"supported / unsupported / contradicted" with the cited transcript span, a **fabrication flag** for
hallucinated exams and an **omission flag** for dropped facts. Only risky sentences route to a ~60-second
clinician review; everything exports to an audit log. It sits *beside* any scribe — it grades, it never
drafts.

**Moat, and why it beats Kappa.** The durable edge is a compounding, un-backfillable **cross-vendor corpus
of real scribe hallucination/omission cases** — which vendor mis-generated what, from what transcript, and
the clinician's correction — packaged as a compliance/attestation-log artifact for the liable signer. No
single scribe vendor can assemble a cross-vendor corpus; each sees only its own output. It beats Kappa on
**founding-upside (4 vs 3)** because the buyer is aligned and the pain is legally forced (mandatory review,
no vendor liability), where Kappa's buyer is generic and its lane is flanked by incumbents shipping
kappa+drift as a feature. It ties Kappa on **ship-speed (5)**: this is nearly Nick's published
RAG-hallucination-judge work re-pointed from retrieval→answer to transcript→note, and the seed data
(ACI-Bench) is free and public *today*, so a first agreement/faithfulness result needs ~0 new labels and
~4–7 hrs of spot-checking. Impact is higher than Kappa's dev-tooling (patient safety + liability).

**Nearest player + the wedge.** The closest shipping thing is **Amplif.AI Professional Chart Review** — it
*is* vendor-agnostic and *is* sold on "closing notes more defensibly," matching NoteProof's positioning
exactly — but it uses **human scribes**, not automated sentence-level grounding. The other two adjacent
things are vendor-*internal*: **Abridge's** confabulation scorer (trained on 50k+ examples, 5 transcript-
support categories, ~97% catch) and **Scribeable's** per-sentence transcript citations both do automated
grounding, but only over notes *they themselves* generated. The nearest funded YC startup, **Adentris
(S25, ~$1.8M)**, does real-time EHR compliance via activity-log monitoring — not transcript-vs-note
faithfulness. Horizontal groundedness APIs (Azure AI Content Safety, Patronus) are not scribe-specific or
liability-facing. **The wedge is the intersection none of them occupy: automated (undercuts Amplif.AI's
human cost), cross-vendor drop-in (undercuts vendor-locked Abridge/Scribeable), and framed as a
liability/attestation-log artifact for the signing physician.**

**The real risk.** Fast-follow squeeze from two sides: **Abridge** already ships automated sentence-level
grounding internally and could expose it cross-vendor; **Amplif.AI** already owns the vendor-agnostic +
liability positioning and could add automation. Compounding this, the graded scribe vendors may **refuse to
let a third party audit their output**, choking the cross-vendor corpus that *is* the moat. And healthcare
distribution / BAA-PHI sales cycles are brutal for a solo part-timer — the pilot needs no PHI, but the
company does, and it risks stalling at go-to-market even if the eval artifact is excellent. The verifier
*model* is also commoditizing fast (Abridge internal, Scribeable, the CARE conformal safety layer,
Azure groundedness, MedHal-Loc) — so defensibility must live in the data/trust/distribution, not the tech.

**First cheap step.** Run Nick's RAG-judge, re-pointed to transcript→note, over the free ACI-Bench pairs
this week: produce a per-sentence supported/unsupported/contradicted verdict for ~50–100 note sentences and
hand-adjudicate a slice against the transcript (~4–7 hrs). That single run proves the core faithfulness
number on free public data with zero PHI and settles whether the method transfers cleanly before any
health-system conversation.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 87.5** (path: found-strong).

---

### 2 · TrajTrust — judge-trust / blind-spot audit for agent trajectories — 87.5

**The problem (and the papers behind it).** Teams gate releases and prod dashboards on **trajectory judges**
— LLM-as-judge scorers that grade whether an agent's multi-step run succeeded. The problem: those judges
silently miss whole classes of failure, so the dashboard reads green while the agent is wrong.
*"Catching One in Five: LLM-as-Judge Blind Spots in Multi-Turn Transaction Agents"* (arXiv 2606.10315)
gives a per-failure-mode taxonomy of exactly what trajectory judges miss in production; *"Time to REFLECT"*
(arXiv 2605.19196) and *AgentProp-Bench* (arXiv 2604.16706) extend it. The failure classes are concrete:
tool-selection errors, wrong-argument, loop/backtrack, premature-completion, injected self-scoring. Free
labeled trajectory data exists to power it — MIT's **tau2-bench**, plus **WebArena / AgentBench** for
volume — and Nick has already done a **dry run** (`trajgate-dryrun/`) downloading and analyzing
WebArena/WorkArena/AssistantBench trajectory annotations, so ship-speed is de-risked by actual work, not a
promise.

**Who pays.** AI-app and agent teams (seed–Series C) whose release gate or prod dashboard depends on a
trajectory judge — the buyer is the **eng lead / head of AI**; seat + usage pricing. Secondary buyers are
the eval/observability platforms themselves (Braintrust, Langfuse, Arize, Confident AI) OEMing a rigorous
agent-judge-trust module they don't own.

**Product shape.** A platform-agnostic service + OSS CLI: point it at your agent-judge (any framework) plus a
thin human-label stream from your existing review queue. It maintains a versioned trajectory gold set,
computes **per-failure-mode** judge-vs-human agreement (kappa/alpha), draws a **blind-spot map** ("your judge
misses silent-success at N% recall, tool-selection at M%"), flags when the judge drops below the trust bar,
and emits a portable **judge-trust badge** per agent and per failure mode. The key differentiator vs every
incumbent: it reports *per-failure-class* blind spots, not a single global agreement number.

**Moat, and why it beats Kappa.** Same core skill and math as Kappa (judge-vs-human agreement/drift) — so it
inherits Kappa's ship-speed and executability — but pointed at a **stronger, faster-growing buyer**. Kappa's
#1 weakness is a lane contested by incumbents who ship kappa+drift *as a feature*. TrajTrust dodges that:
incumbents ship trajectory *judges*, but nobody sells independent **trust of** those judges — the 2026 papers
exist precisely because the gap is open, and the agent buyer has no judge-of-the-judge incumbent. The moat is
a compounding cross-customer **disagreement** corpus keyed to failure mode that predicts which blind spots a
new customer's judge has before their own gold set catches it. That beats Kappa on **founding-upside (4 vs 3)**
via the cleaner buyer, and ties it on **executability (5)** — the dry run is the proof.

**Nearest player + the wedge.** Every eval/observability incumbent ships trajectory LLM-as-judge scoring as a
platform *feature*: **Braintrust** ($80M+, framework-agnostic trajectory ingestion), **Arize AX / Phoenix**
(trajectory judge + explanation), **LangSmith** (Align Evals + multi-turn evals), **Galileo** (ChainPoll +
coverage dashboards), **MLflow** (OSS judge-alignment loop). The closest capability is **Confident AI /
DeepEval**, which already "compares metric scores against human annotations to surface false positives and
negatives" — but that is *global* FP/FN surfacing inside their own platform. **None of them ships a
standalone, platform-agnostic, per-failure-mode blind-spot map for trajectories.** The wedge is exactly the
three things they lack: (a) per-failure-class taxonomy depth, (b) trajectory-specific defect classes (silent
success, cross-turn state, tool-use), and (c) true platform-agnostic normalization across their exports.

**The real risk.** Two-layered. **Business:** it's a feature, not yet a category — incumbents own the judge,
the human-annotation loop, and framework-agnostic ingestion, so they are one roadmap step from bolting on a
per-failure-mode trust view; the open gap is real *today* but closes fast, so TrajTrust must move on the
independence + blind-spot-map framing before they do. **Technical/credibility:** the dry run itself flags
that the thesis is statistically fragile on public data — only ~106/1302 trajectories have 2+ annotators,
and the headline silent-success class has ~15–87 positives, so per-class judge-recall estimates are shaky
until design partners supply multi-annotator gold. He must invest in taxonomy depth and multi-annotator gold
precisely where incumbents can copy the output.

**First cheap step.** Extend the existing `trajgate-dryrun/` analysis into a one-page blind-spot map on
tau2-bench: run one off-the-shelf trajectory judge, compute per-failure-mode recall against the human
annotations already downloaded, and show at least one failure class where the judge's recall is
embarrassingly low. That's the whole pitch in a chart, on free data, in a few days — and it doubles as the
design-partner funnel.

**Scores:** Ship 5 · Impact 4 · Found 4 · Exec 5 · Hire 5 → **Composite 87.5** (path: found-plausible).

---

## NEAR-MISSES — real founding shapes, but below 83.3 (range 75–83.3)

| Name | Composite | Why it fell short (one line) |
|---|:--:|---|
| **SARShield** | **75.8** | Better founding *shape* than Kappa (liability buyer, inverted willingness-to-pay), but loses on the three highest-weighted axes to a confidential-data cold-start — SAR narratives + case files are legally protected (31 USC 5318(g)(2)), so there's no free real corpus to seed it. |
| **BenefitProof** | **75.8** | Strong, higher-impact idea in Kappa's family, but corpus-assembly (a versioned cross-jurisdiction policy corpus) drags ship-speed and executability off Kappa's 5s, and named incumbents (Nava/Imagine LA, Propel) can extend into the eval/verification lane first. |

Both are genuinely founder-shaped and both survive the prior-work check with a real wedge — **SARShield** is
an independent, vendor-agnostic, FinCEN-element-aware pre-file SAR verifier (nearest players — Hummingbird,
Zyphe, DataWalk, Co-Investigator AI — all self-grade only their own drafts); **BenefitProof** is an
independent cross-jurisdiction grounding verifier for public-benefits eligibility AI with a public
leaderboard (nearest — Nava/Imagine LA self-cite, Propel explains not verifies). They fall short for the same
structural reason: unlike NoteProof (free ACI-Bench) and TrajTrust (free tau2-bench + a done dry run),
**neither has a free, license-clean, real labeled corpus to seed a credible v1**, and both face a live risk
that a trusted incumbent closes the gap first. Impact and founding-upside are strong; ship-speed and
executability — Nick's two highest-weighted, fastest axes — are where they lose to the bar.

---

## Honest closing — the strongest one or two vs the bar

Through the vertical + buyer aperture, **two candidates clear Kappa (83.3), both at 87.5 — and both also
edge past doc-20's overall #1, Ingestion (84.2).** That is not grade inflation: both are near-verbatim
re-points of Nick's *already-published* RAG-hallucination-judge method onto *free, public* data
(NoteProof → ACI-Bench; TrajTrust → tau2-bench, with a dry run already run), so they inherit Kappa's
top-of-scale ship-speed and executability, and both fix Kappa's one real defect — a contested founding lane —
by pointing at a buyer who wants the number to exist.

**If you run exactly one, run NoteProof.** It has the cleaner founding story: the buyer is the party holding
the liability (the signing physician / medical director), not the vendor being graded, and the pain is
*legally forced* by the 2026 Captain-of-the-Ship reaffirmation, not merely felt. It carries the higher impact
of the two (patient safety) and a real, un-backfillable cross-vendor correction corpus no single scribe
vendor can assemble. The honest caveats are that the verifier model is commoditizing and that healthcare
BAA/PHI distribution is punishing for a solo — so the moat has to be earned in data, trust, and distribution,
and the company (not the pilot) is where the drag lives.

**TrajTrust is the near-tie and the safer executability bet** (Exec 5 vs NoteProof's 4, thanks to the
existing dry run, zero PHI, and a faster-growing buyer with no judge-of-the-judge incumbent). Its weakness is
the mirror image of its strength: because it's Kappa's exact skill on a hotter buyer, it's one incumbent
roadmap step from being copied, and the public data is thin for per-class estimates until design partners
show up.

Net for the doc-20 picture: this aperture surfaced the **first two candidates that beat both Kappa and
Ingestion on the weighted composite** — a genuine finding, worth folding into the master ranking after a
willingness-to-pay pass. The two near-misses (SARShield, BenefitProof, both 75.8) are strong
found-plausible ideas that stayed below the bar for a consistent, honest reason: no free real data to seed
them fast. Cheapest next move is the NoteProof ACI-Bench dry run and the TrajTrust tau2-bench blind-spot map —
both a few days, both ~$0 — run them before choosing between the two.
