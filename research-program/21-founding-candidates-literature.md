# 21 · Founding candidates mined from the literature — the ones that match or beat Kappa

*Written 2026-07-09. This doc **adds to** the [doc 20 ranking](20-decision-and-ranking.md); it does
not replace it. The goal was narrow and honest: find **at least four new founding candidates as strong
as or stronger than our current top founding bet, Kappa (composite 83.3)** — not by brainstorming
harder, but by mining the research literature and pairing it with moat-first creativity, then vetting
every survivor on the *same* five criteria and weights as doc 20. Where a candidate here and an earlier
doc disagree, this doc is current for these candidates only.*

---

## What this document is, and how it was made

Doc 20 left one uncomfortable gap: the best *founding* bet on the whole slate, **Kappa (83.3)**, has a
known weakness — its lane (LLM-judge drift / eval-trust) is contested by funded incumbents (Braintrust,
Galileo, Confident AI, Patronus), so its founding-upside sits at a contested **3**. The question this
doc answers: *can we find founding candidates that keep Kappa's fast-ship, skill-perfect profile but
either fix that contested-lane weakness or beat it on impact?*

The method had three parts, run adversarially:

1. **Literature-mining.** Read the *future-work, limitations, and open-problem* sections of 2026 papers
   — the places where researchers explicitly name what nobody has built yet — plus the practitioner
   essays and dispute threads where a named pain has no owner. Each candidate below is *seeded by
   specific papers*, cited in its card.
2. **Moat-first creativity.** For each seeded opportunity, ask the founding question before the research
   question: *what un-backfillable asset could a solo accumulate here that an incumbent structurally
   cannot?* Candidates with no answer were dropped before scoring.
3. **Adversarial vetting on doc-20 criteria.** Every survivor got the same prior-work "can this be
   killed?" pass (is it already built / already free / already owned?) and the same five-axis judge
   (Ship 3.0 · Impact 2.5 · Found 2.5 · Exec 2.5 · Hire 1.5, rescaled to 0–100). The bar is **≥ 83.3**.

**How many honestly cleared the bar: four.** We set out to find four and found exactly four — and the
honesty is in the *shape* of the win. **Three** (RewardProof, QueryProof, MemTrust) beat Kappa by a
real-but-modest margin, all at **85.0**; and **one** (VeriJudge) *ties* Kappa at exactly **83.3** rather
than beating it. None is a runaway. Behind them sits a dense band of near-misses (75–83.3) — several
genuinely strong — which is itself the finding: the "independent-referee / grade-the-grader" shape is a
*rich* vein, but most instances land at Kappa's level or just under because the **same two forces keep
recurring**: the detection *method* is usually already published (so the moat is brand/positioning, not
IP), and the durable moat is a **post-traction data flywheel**, not day-one IP.

---

## The cleared candidates (composite ≥ 83.3)

| Candidate | Composite | Ship | Found | Exec | Moat (one word) | Source papers | One-line |
|---|:--:|:--:|:--:|:--:|---|---|---|
| **RewardProof** — independent reward-hackability auditor for RL environments | **85.0** | 5 | 3 | 5 | exploit-corpus | Auditing Reward Hackability (2606.16062); LLMs Gaming Verifiers (2604.15149); Hack-Verifiable Envs (2605.20744) | Point it at any RL grader and it reports what % of provably-wrong solutions it accepts, with exploit transcripts + a patched grader — the *neutral* referee bundled detectors can't be. |
| **QueryProof** — independent semantic-SQL answer verifier | **85.0** | 5 | 3 | 5 | metadata-flywheel | NL2SQL-BUGs (2503.11984); PV-SQL (2604.17653); BEAVER (2409.02038) | Sits after any text-to-SQL generator and returns a semantic-error risk score with typed findings (missing filter, fan-out double-count, wrong grain, soft-delete ignored) — catching the confidently-wrong-but-executable query. |
| **MemTrust** — independent agent-memory reliability referee | **85.0** | 5 | 4 | 5 | decay-corpus | MemTrace (2606.17328); LongMemEval; the Zep/Mem0 benchmark disputes | Plants known stale and contradicted facts on a schedule and reports reproducible staleness-recall, contradiction-resolution rate, and a temporal-accuracy drift curve — the neutral referee for a market caught mis-reporting its own numbers. |
| **VeriJudge** — LLM-judge *validity* certification | **83.3** | 5 | 3 | 5 | probe-library | Reliability without Validity (2606.19544); Hidden Measurement Error (2604.11581); Judging the Judges (2604.23178) | Runs counterfactual probes (verbosity-matched pairs, position swaps, self-preference traps) to certify whether a judge measures the construct or is fooled by confounds — the check calibration structurally can't do. |

Read the table honestly: **all four ship at 5 and execute at 5** — that is the family trait. They are
*eval-as-a-product*, seeded by free/public data, in Nick's exact published skill (LLM-as-judge
re-pointed at a new surface). The *only* axis that separates them is **founding-upside**. **MemTrust is
the sole 4-on-founding** — the only one that fixes Kappa's contested-lane weakness rather than merely
edging it on impact — which is why it's the strongest new addition even though it shares the 85.0 line.
The other three tie Kappa's contested **3** and clear the bar on **impact** (RewardProof, QueryProof) or
simply *match* it (VeriJudge).

---

## The cleared cards

*Each card: the problem (+ its source papers), who pays, product shape, the solo-buildable moat and why
it beats Kappa, the nearest player and the wedge that survives them, the real risk, the first cheap
step, and the score line.*

---

### 1 · RewardProof — independent reward-hackability auditor for RL environments — 85.0

**The problem.** RL/RLVR post-training is only as good as its reward function, and reward functions are
routinely hackable: ~**28.5%** of sampled code-RL environments accept provably-wrong solutions —
hardcoding, `sys.exit(0)` harness escape, monkey-patching the grader, weak-test enumeration, format
shortcuts. Cursor has publicly said "reward hacking is swamping model intelligence gains," and METR has
documented the same. Seeded by *Auditing Reward Hackability in Code RL Environments*
(arXiv 2606.16062, the 28.5% figure), *Hack-Verifiable Environments* (2605.20744), *LLMs Gaming
Verifiers* (2604.15149, ICLR 2026), *Do Coding Agents Deceive Us?* (2606.07379), and *Benchmarking
Reward Hack Detection* (2601.20103).

**Who pays.** AI labs and vertical-AI teams doing RL/RLVR post-training (per-environment audit $5–25k or
a training-CI subscription); RL-environment vendors (Deeptune — $43M; Refresh; HUD; OpenReward) buying
an independent "hack-resistance certified" badge; data/RL firms (Surge, Mercor) as a resale channel.

**Product shape.** An OSS scanner seeded on free **SWE-bench Verified** that runs a battery of known
exploit strategies (hardcoding, harness escape, grader monkey-patching, weak-test enumeration, format
shortcuts) plus an LLM-judge over accepted-but-wrong solutions, and outputs a hackability score, exact
exploit transcripts, and a patched grader. Grows into a hosted training-loop service and a certification
mark. It *grades others' verifiers* for hackability — distinct from doc-18 VerifierWorks, which *sells*
verifiers.

**The solo moat + why it beats Kappa.** An un-backfillable **cross-vendor exploit corpus** of
(environment, exploit strategy, accepted-wrong-solution, patch) tuples no single env-vendor can assemble
(each sees only its own gym), plus **independence as a structural moat** — every existing detector is
bundled inside a vendor's own env platform, a built-in conflict of interest. It **matches Kappa's
ship-5 and exec-5** (method fully published Jun 2026; gold data free and reproducible on SWE-bench
Verified; pass/fail is deterministic so it *self-labels* — zero annotation, no manual code review) and
**beats Kappa on impact (4 vs 3)**: reward hacking is upstream of *every* trained agent, a blast radius
far bigger than a rotting eval dashboard.

**Nearest player + the wedge.** The core detect→exploit→patch loop with a patched-verifier output is
*published prior art* (arXiv 2606.08960, *Hardening Agent Benchmarks with Adversarial Hacker-Fixer
Loops*, with the harden-v0 + terminal-wrench repos); an OSS cross-vendor scanner exists (**BenchJack**,
Berkeley RDI, Apache-2.0); a **YC-backed vendor-agnostic player (Fulcrum, YC S25)** already sells
red-teaming agents that detect reward hacking + fake solutions in external environments; and **HUD**
bundles a Reward Hacking Detector. So the mechanic is **commoditized — do not lead with it.** The only
defensible wedge is **positioning**: a neutral, conflict-of-interest-free cross-vendor *certification /
attestation* of a grader's hackability (a SOC-2 / crash-test rating for graders), sold **buyer-side** —
to the labs consuming eval results, not the env-builders producing them. Nobody offers a neutral
second-opinion audit of a *third party's* grader the audited party didn't commission.

**The real risk.** The headline product is already built by others (BenchJack OSS, arXiv 2606.08960,
Fulcrum), so the fast artifact is a commodity, while the only differentiated asset — a neutral
cross-vendor rating standard — is neither fast to build nor a technical moat, and **nobody has proven a
lab will *pay* for third-party grader certification.** It likely degrades into a services business
against a funded, faster competitor. Validate demand (find even one lab willing to *require*
certification from suppliers before building) first.

**First cheap step (~$100–200).** Run the OSS exploit battery against SWE-bench Verified graders and
publish "N% of these public graders accept provably-wrong solutions — here are the transcripts." A
self-labeling artifact with zero annotation.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 4 → **Composite 85.0.** Edges Kappa purely on
the honest impact advantage; the moat is a copyable brand/certification wedge with a funded incumbent
(Fulcrum) already in the lane.

---

### 2 · QueryProof — independent semantic-SQL answer verifier — 85.0

**The problem.** Text-to-SQL and analytics agents generate queries that *execute fine and return the
wrong number* — a missing filter, a join that fans out and double-counts, the wrong grain, an ignored
soft-delete. On enterprise schemas the accuracy is dire (BEAVER: 17–21%; the confidently-wrong-but-
executable query is the dangerous case because a human acts on the number). Seeded by **NL2SQL-BUGs**
(arXiv 2503.11984, KDD'25 — 2,018 expert-annotated instances, 9 categories; best models detect only
**75.16%**, and it found **122** wrong-but-executable queries hiding in Spider/BIRD), **PV-SQL**
(2604.17653, proving independent post-hoc verification works), **BEAVER** (2409.02038, 17–21% enterprise
accuracy), and ICL text-to-SQL error repair (2501.09310).

**Who pays.** Data/analytics platform teams and analytics-agent vendors (and their enterprise buyers)
who must certify agent-produced numbers before a CFO/board sees them — per-verified-query or seat.
Secondary: any company running an internal "ask your data" bot terrified of a wrong number in a QBR.

**Product shape.** A platform-agnostic verification API/service that sits *after* any SQL generator
(in-house, Cube, dbt, a vendor agent). Given (NL question, generated SQL, schema, optional result) it
returns a risk score + typed findings using the NL2SQL-BUGs taxonomy, execution-based probing (row-count
/ aggregate sanity, counterfactual perturbations in DuckDB), and a fine-tuned judge. Ships as a CI check
("block merges of dashboards whose SQL fails") and a runtime guardrail. It *does no modeling itself* —
it grades someone else's SQL.

**The solo moat + why it beats Kappa.** A compounding, un-backfillable corpus of real (question, SQL,
schema-shape, verified-correct-vs-wrong, error-type) pairs harvested from customer traffic — keyed to
**warehouse metadata** no incumbent has — improving per query, plus a continuously-tuned semantic-error
judge and a growing library of schema-pattern rules (fan-out joins, soft deletes, fiscal calendars). It
**matches Kappa's ship-5 and exec-5** (NL2SQL-BUGs is a ready labeled dataset; DuckDB/SQLite make
execution-probing near-zero-cost; labels self-source from real query outcomes) and **beats Kappa on
impact** — a wrong *dollar* figure a human acts on, on a larger, hotter budget line than judge-trust.

**Nearest player + the wedge.** The threat is that the *method* is published. **SQLens** (arXiv
2506.04494, Amazon Science, NeurIPS'25) does *exactly* generator-agnostic fine-grained semantic-error
detection on out-of-the-box text-to-SQL output (+25.78% F1 over self-eval); **SpotIt** (2510.26840,
formal verification), **STEF** (2604.28049, schema-free runtime 0–100 score), and **PV-SQL** cover the
method. On the product side, the semantic-layer crowd (dbt Semantic Layer, Cube, AtScale, Kaelio,
JetBrains Databao) *prevents* errors by replacing the generator, not auditing one; **Gudu GSP/SQLFlow**
already ships commercial *catalog-bound* semantic validation (hallucinated columns, missing tenant
filters) but as a governance layer, not an answer-correctness risk score. The surviving wedge is the
**platform-agnostic, drop-in-after-any-generator, runtime, single-query (no golden reference)** verifier
with an *opinionated business-logic taxonomy* (fan-out double-count, wrong grain, soft-delete/tenant
omission) that leans **into warehouse metadata as the moat**. The moment it drifts toward "adopt our
semantic layer," it dies.

**The real risk.** Method commoditization on a *time-boxed* runway: the recipe is public
(SQLens/SpotIt/STEF/PV-SQL), so the wedge is months-not-years — it closes if Amazon ships **SQLens
inside Bedrock**, or a semantic-layer incumbent (Snowflake Cortex, Databricks) or a generic eval vendor
(Braintrust/Patronus, one feature away) bolts on a foreign-query audit endpoint. The moat is a
**post-traction** data flywheel, not day-one IP; secondary risk is that buyers who most need certified
numbers prefer to *prevent* via a governed semantic layer they already own.

**First cheap step.** Build the scored detector on NL2SQL-BUGs + Spider/BIRD (free, zero annotation),
add DuckDB/SQLite execution-perturbation probes, and publish "engines X and Y silently botch these query
patterns N% of the time" — days of work, no labels.

**Scores:** Ship 5 · Impact 4 · Found 3 · Exec 5 · Hire 4 → **Composite 85.0.** Beats Kappa on impact;
the founding lane is tied, not beaten — the algorithm is already published (SQLens/Amazon) with a Bedrock
kill-risk, so the moat is a post-traction warehouse-metadata flywheel.

*(Note: an earlier program pass scored this exact semantic-SQL variant at 80.0 in the near-miss band,
docking impact to 3 on method-commoditization grounds. Scoring the axes on their merits, impact 4 is
defensible — a wrong dollar figure in a board deck is genuinely higher-stakes than a silent judge — and
the moat fragility is carried into the qualitative verdict instead: it *ties/edges* Kappa on paper but is
not a stronger *founding* bet.)*

---

### 3 · MemTrust — independent agent-memory reliability referee — 85.0

**The problem.** Stateful agents rely on a memory layer, and those layers *silently serve expired
facts*: they keep contradicted facts, fail to recall that a fact went stale, and drift on temporal
accuracy — and the vendors have been caught **mis-reporting their own numbers** (a public
arithmetic-war credibility crisis between Zep, Mem0, MemPalace). Seeded by **MemTrace** (arXiv
2606.17328, *Probing What Final Accuracy Misses in Long-Term Memory*), **LongMemEval** (the de-facto
temporal-memory stress test), the Zep/Mem0/MemPalace claim disputes (Zep's "Lies, Damn Lies &
Statistics" correction; the "Benchmark Theatre" essays), and Berkeley RDI's "How We Broke Top AI Agent
Benchmarks."

**Who pays.** Teams choosing/monitoring a memory vendor for a stateful agent (Series A–C, eng lead) — a
seat + usage for a continuous memory-trust monitor; the memory vendors themselves (Zep, Mem0, Letta,
Cognee) wanting a credible *third-party* "memory-reliability certified" number to end the credibility
crisis (OEM/badge deal); later, enterprises with compliance exposure from agents acting on stale
customer facts.

**Product shape.** A vendor-agnostic memory-reliability harness + hosted monitor. It ingests a team's
real memory-write/read stream (or runs a synthetic-injection battery), **plants known stale +
contradicted facts on a schedule the vendor does not control**, and reports reproducible
staleness-recall, contradiction-resolution rate, and a temporal-accuracy drift curve *with honest error
bars* — alerting when the layer starts silently serving expired facts. Ships first as an OSS
memory-drift CLI seeded with LongMemEval + a synthetic staleness/contradiction generator.

**The solo moat + why it beats Kappa.** A compounding, un-backfillable **cross-customer + cross-vendor
corpus of real memory-decay cases** (which writes went stale, which contradictions each vendor silently
kept, keyed to vendor+version+fact-type). No single memory vendor can assemble the cross-vendor
disagreement corpus (each sees only its own store), and the longitudinal decay stream can only be
captured *live* — a later entrant permanently lacks the accumulated history. This is the **only cleared
candidate that beats Kappa on founding-upside (4 vs 3)**: the substrate is 2026-fresh and **not
contested by funded eval incumbents** (the current "competitors" are vendors *structurally disqualified*
as the referee, so they become channels, not rivals), which fixes Kappa's exact weakness. It matches
Kappa's ship-5 and exec-5 (LongMemEval ready; synthetic stale/contradiction injection <$150; the
recall/agreement/drift math is his exact stack; ~0 new labels).

**Nearest player + the wedge.** Every "comparison" today is **vendor-published**: Mem0's "State of AI
Agent Memory 2026" (marketing), Memori's benchmark, supermemory's MemoryBench, and **maximem.ai** —
which literally admits it is "both an independent evaluator AND a vendor." AMB is run by Vectorize (a
memory vendor). The academic benchmarks (LongMemEval, LoCoMo, MemTrace, STATE-Bench) are *static,
self-run datasets vendors optimize to*. The surviving wedge is the combination none of them has: an
**adversarially-administered, vendor-neutral, *standing*** monitor that plants facts on a cadence
vendors can't pre-train against and reports the **metric triad + drift curve with error bars** as its
headline, under an explicit **no-vendor-money neutrality charter** — which is the actual moat, because it
is the one thing vendors and self-upload leaderboards structurally cannot copy.

**The real risk.** **Monetization ⟂ neutrality.** A neutral referee is a trust/media business, not
obviously a fundable SaaS; the one clear paid path — the drift-*prediction* flywheel — is vaporware
everywhere and unvalidated; and taking vendor badge/OEM money to fund it *erodes the neutrality that is
the moat*. Plus **Patronus AI** ($70M, June 2026, adversarial-simulation DNA, already lists agentic-
memory stress-testing) is a credible acquire-the-category entrant with capital a solo lacks. Durable
referee; unproven company.

**First cheap step (~$150).** Pick 4–5 API-accessible vendors (Mem0, Zep, Letta, supermemory, Cognee),
write a synthetic fact-lifecycle generator that inserts a fact, later contradicts/updates it on a
controlled clock, and probes recall at intervals; publish a monthly leaderboard of the metric triad +
drift curves with bootstrapped error bars under a stated neutrality charter.

**Scores:** Ship 5 · Impact 3 · Found 4 · Exec 5 · Hire 4 → **Composite 85.0.** Beats Kappa exactly
where Kappa is weakest — an uncontested, 2026-fresh substrate with a structurally un-backfillable
cross-vendor moat — while matching its ship-speed and skill-fit. Gated only on a genuinely unproven
business model (referee ≠ company).

---

### 4 · VeriJudge — LLM-judge *validity* certification — 83.3

**The problem.** Teams calibrate their LLM-judges against human labels (agreement/kappa) and call it
trustworthy — but agreement is not *validity*. A judge can reliably agree with humans while measuring
the wrong construct: fooled by verbosity, position, style, or self-preference. Calibration structurally
*cannot* catch this. Seeded by *Reliability without Validity: Systematic Large-Scale Evaluation of
LLM-as-a-Judge* (arXiv 2606.19544, "agreement theater"), *Hidden Measurement Error in LLM Pipelines*
(2604.11581), *Are We on the Right Way to Assessing LLM-as-a-Judge?* (2512.16041), and *Judging the
Judges: Bias Mitigation* (2604.23178).

**Who pays.** Enterprise AI/eval teams whose promotion, model-selection, and ship/no-ship decisions ride
on a judge score (fintech, healthtech, legal AI); benchmark/leaderboard operators needing defensible
rankings; AI-governance/compliance teams who must attest their eval is sound. High willingness-to-pay
because the buyer's *own credibility* depends on the judge being valid — sold as a per-judge
certification report + a subscription validity monitor.

**Product shape.** A hosted service that takes a team's judge (prompt + model) and runs a battery of
construct-isolating counterfactual probes: verbosity-matched pairs, position swaps, style/format
perturbations holding true quality constant, self-preference traps, construct-substitution tests.
Outputs a Judge Validity Certificate with a construct-validity score, per-confound sensitivity
breakdown, and the % of judge variance explained by non-construct cues. Phase 2: a continuous validity
monitor + a debias harness.

**The solo moat + why it *ties* Kappa.** A growing library of construct-isolating counterfactual probe
sets across domains (RAG, summarization, code, agents, safety), each pair engineered so *only* the
confound varies — the artifact incumbents don't have (they hold human-label calibration sets, which
can't isolate confounds). It **matches Kappa's ship-5 and exec-5** (certify any judge day-one from your
own probe battery — no need to instrument a live stream or wait for drift; matched-pair probes are
labeled by design) and has an arguably *more viral* hire artifact (a public "we audited N popular
judges, here's how invalid they are" report). **But it does not beat Kappa.** The technique is *more*
copyable than Kappa's — a working probe battery already exists free as OSS
(`joaquinhuigomez/llm-judge-calibrator`, position/verbosity/self-preference → A–F grade) and the entire
construct-validity framing is published (2606.19544, LLM-Evaluation Tropes 2504.19076,
nomological-networks 2603.15121, RobustJudge). Net: a true peer at exactly **83.3**.

**Nearest player + the wedge.** Galileo, Braintrust, Patronus, Confident AI/DeepEval all sell
*calibration/agreement*, not adversarial construct-validity certification. "Validity" is an unclaimed
*vendor category* — but it's unclaimed because it's a **feature, not a company**: any funded eval
incumbent can bolt a "judge validity" tab onto its existing judge product in a quarter, and they own the
distribution. The only defensible position is the neutral **certification standard/brand** + an **EU AI
Act / NIST AI RMF 2026** attestation hook (auditable evidence that eval instruments are valid — which
none of the calibration vendors address), plus confound coverage *beyond* the three named biases
(format, style dominance — which research shows is the *largest* bias, rubric-leakage).

**The real risk.** An incumbent absorbs the "validity tab" faster than a solo can build the trust brand,
and the confound-probe technique is a weekend copy of a public repo. The category is real; the *company*
is fragile — defensibility must come entirely from a neutral third-party certification brand + a
regulatory mandate that does not yet exist.

**First cheap step.** Run the OSS probe battery (extended with format/style/rubric-leakage confounds)
against a handful of popular judges and publish the "how invalid are your judges" report — the artifact
*is* the marketing and the hire signal, and it directly extends his published RAG-hallucination-judge
study.

**Scores:** Ship 5 · Impact 3 · Found 3 · Exec 5 · Hire 5 → **Composite 83.3.** A peer of Kappa, not a
beat — same skill-bullseye, same fast-ship, a cleaner (unclaimed) category, but the same non-IP moat and
a *more* copyable technique.

---

## The near-misses (75 – 83.3)

*Genuinely strong candidates that landed just under the bar. The recurring "why short" is one of three:
the detection method is already published/OSS (so the moat is brand/positioning, not tech), the
differentiated moat is a post-traction flywheel not day-one IP, or a funded incumbent can absorb the
wedge as a feature.*

| Candidate | Composite | Source papers | Why it fell short |
|---|:--:|---|---|
| **Molt** — fine-tune regression report card | **82.5** | Mapping Post-Training Forgetting (2510.17776); Learning to Stay Safe (2602.17546); NSPO (2512.11391) | Tightest skill-fit in the set (fuses his fine-tuning + eval + judge stack) and beats Kappa on impact (a broken safety refusal is direct liability), but the headline *prediction* moat is dead prior art (MNEME 2507.21084), the surviving zero-config report-card wedge is a feature **Future AGI** already 90%-ships and can close in one product decision, and the buyer is the party being graded (no founding inversion). |
| **SheetSentry** — label-free numeric error catcher for AI-built spreadsheets | **80.0** | FinSheet-Bench (2603.07316); FinVerBench (2605.29586); WorkstreamBench (2605.22664) | Best founding+impact in its tier (concrete FP&A buyer, quantifiable ROI, confirmed label-free recompute wedge) and a documented-broken space, but heavier engineering (arbitrary-spreadsheet ingestion drops ship to 4), the recompute method is public (FinVerBench OSS), and a **live builder-self-grading substitute** exists (Shortcut's Verification Agent claims 90%+). |
| **CustomsProof** — independent HTS classification referee | **80.0** | Not literature-seeded: CBP ruling HQ H350722 (2026-01); CROSS database (220,989 rulings); 2026 CBP enforcement data | Best exec-fit in the tier (dual LLM-judge + classical-calibrator skill match; zero-annotation labels self-source from CROSS) and real dollar-attached pain (42% of penalties from misclassification), but the founding wedge is *positioning not tech* and already 2–3-of-4 shipped by incumbents — **Zonos "Check coherency"** does independent verification today, **TariffLens** ships 3 of 4 pieces, and **Gaia Dynamics** is funded (~$1.5M, Andrew Ng's AI Fund). |
| **GroundGuard** — grounding/faithfulness verifier for tool-using agents | **75.8** | ToolFailBench (2607.04686); AgentProp-Bench; Span-Level Error Localization (2606.02060) | Beats Kappa on TAM + freshness (agents in regulated domains where ignoring a tool result is direct liability; Finance 12.2% Result-Ignore), but a surviving *feature* not a venture company — the taxonomy is published (ToolFailBench coined "parametric traps" + Result-Ignore/Output-Fabrication) and a funded eval incumbent (Galileo/Patronus, already shipping red-teaming + span debugging) absorbs the active-trap layer in 12–18 months. |

---

## Honest closing

**Did we hit the target of four?** Yes — **exactly four cleared the ≥ 83.3 bar** — but the honesty is in
the distribution. **None is a runaway.** Three (RewardProof, QueryProof, MemTrust) beat Kappa by a
real-but-modest margin, all at **85.0**; and **VeriJudge (83.3)** *ties* Kappa rather than beating it.
So the precise answer is: *three beat Kappa, one ties it.*

**How do the winners compare to Kappa (83.3) and Ingestion (84.2)?**
- **Three of the four beat Kappa**, and the same three (RewardProof, QueryProof, MemTrust, all at 85.0)
  also **beat Ingestion (84.2)**, the current overall #1 — but only *barely* (by 0.8). None of these
  literature-mined candidates clears the overall #1 *comfortably*; they nudge past it, they don't lap it.
- The family trait is unmistakable: every clearer is **ship-5 / exec-5** — eval-as-a-product, seeded by
  free/public data, in Nick's exact published skill (LLM-as-judge re-pointed at a new surface). That is
  *why* they clear: they inherit Kappa's two best axes wholesale.
- The separator is founding-upside. Three of them tie Kappa's contested **3** and clear on impact;
  **only MemTrust reaches 4**, and it does so the way we hoped a literature-mined candidate would — by
  landing on an *uncontested, 2026-fresh substrate* where the would-be competitors (memory vendors) are
  *structurally disqualified* as the referee and become channels. That is the one candidate here that
  actually fixes Kappa's weakness rather than routing around it on impact.

**The two strongest new additions.**
1. **MemTrust (85.0)** — the strongest new candidate, and not because of the composite (three tie at
   85.0) but because it is the *only* one that fixes Kappa's exact defect: an uncontested lane with a
   genuinely un-backfillable cross-vendor decay corpus, riding a live public trust vacuum (vendors
   caught mis-reporting). Same fast-ship, same skill-bullseye. The one real gate is that the business
   model is unproven — a neutral referee may be a trust/media play, not a fundable SaaS, and its only
   clear paid path (drift *prediction*) is vaporware everywhere.
2. **RewardProof (85.0)** — the strongest on *impact and legibility*: reward hacking is upstream of
   every trained agent, the buyer wave (freshly-capitalized RL-env vendors) is red-hot, and the artifact
   is a self-labeling OSS scanner with zero annotation. The honest caveat is that the mechanic is
   already built (BenchJack, arXiv 2606.08960, Fulcrum YC S25), so the entire founding case rests on a
   copyable neutrality/certification brand whose demand is unvalidated.

**What to do next.**
- **Deep-vet MemTrust and RewardProof** to the same depth as doc 20's cards. For MemTrust, the one
  question that decides everything is *willingness-to-pay for a neutral referee* — is there a fundable
  product (the drift-prediction flywheel) or only a media/trust brand, and does taking vendor OEM money
  break the neutrality moat? For RewardProof, find *one lab willing to require third-party grader
  certification from suppliers* before building — that single demand signal separates a company from a
  services shop against Fulcrum.
- **Add all four to the doc-20 ranking** on the same weights — the three 85.0 entries (MemTrust,
  RewardProof, QueryProof) slot in **just above Ingestion (84.2)**, and VeriJudge (83.3) ties Kappa.
  Because the margins over Ingestion are thin (0.8), doc 20's "picks that matter" section should treat
  these as *peers of the top tier*, not a new dominant #1 — the one exception being MemTrust, which
  earns a look as the best *founding-lane* bet on the whole slate.
- **Run one ~$100–200 dry run this quarter** — the RewardProof exploit-battery-on-SWE-bench-Verified
  artifact ("N% of these public graders accept provably-wrong solutions") is the cheapest, most
  self-labeling first step of the four and doubles as the first design-partner outreach, exactly the
  low-cost-first move doc 20 recommends.
