# Problem Space — what's worth solving, before we decide how

*Written 2026-07-09. This document deliberately **precedes** solutions. Docs
[08 · pilot-specs](08-pilot-specs.md), [10 · startup-pilot-specs](10-startup-pilot-specs.md),
and [12 · company-theses](12-company-theses.md) are all early **solution** sketches — benchmarks,
pilots, company shapes. Useful, but they answered "what can I build?" before answering "what
actually hurts, for whom, and why hasn't it been fixed?" This doc supersedes them as the **driver**:
the solution rounds get regenerated FROM these problems, not the other way around.*

## Why problem-first

The program's charter ([00 · goals](00-goals-and-operating-principles.md)) puts **impact first** and
demands **breadth and creativity before convergence**. Both principles point at the same correction:
creativity belongs at the *problem* layer, not the *solution* layer. When you start from a solution
("a scope-adherence benchmark," "Verisk for AI") you inherit its ceiling — you can only be as
important as the problem it happened to attach to. When you start from a catalogued set of real,
present, evidenced pains, the solution space opens up underneath each one and you can pick the
attack that fits your edge.

So this pass went bottom-up. It mined **pain** directly — from practitioner post-mortems, forum
threads, court filings, regulatory clocks, and 2025–26 research — through **eight discovery lenses**,
each looking for a different *kind* of unmet need:

| Lens | What it hunts for |
|---|---|
| **pain-mining** | Documented, present-tense operator suffering (bug reports, "this cost us 400 hours") |
| **second-order** | The consequence of a fix everyone celebrated (cheap generation → verification flood) |
| **frontier-shift** | Problems that did not exist 12–18 months ago (hours-long agents, agent card purchases) |
| **assumed-solved** | Beliefs repeated as settled fact that are quietly false (temp=0 is deterministic) |
| **underserved** | Real pain concentrated on an actor with no leverage or budget (banned solo devs, ESL writers) |
| **dog-didn't-bark** | The expected artifact that is conspicuously *missing* (a behavioral changelog for models) |
| **forcing-function** | An external deadline that manufactures demand (EU AI Act obligations) |
| **founder-crossdomain** | A mature discipline's method that has never been ported (clinical external validation → AI) |

Every problem then went through an **adversarial vet**: a steelman, a skeptic who web-checks the
"nobody is solving this" claim, six 1–5 scores (importance, urgency, neglectedness,
tractability-for-this-founder, buyer-exists, real-not-speculative), and a verdict of
**pursue / maybe / drop**. The vets are preserved honestly below. **Drops stay drops** — several of
the most viscerally important problems (algorithmic benefit denial, AI-detector bias, uninsurable AI)
are *drops for a solo founder* precisely because the pain is real but the buyer doesn't pay or the
incumbents already hold the seat. Keeping that distinction visible is the point.

A note on what "tractability" and "buyer" mean here: they are scored **for this specific founder** —
solo, part-time, ≤$500/study, Claude-heavy, whose edge is **evaluation and reliability
methodology** (published LLM-as-judge / RAG-hallucination work). A problem can be a 5 on importance
and a 2 on tractability because it needs CDN-scale traffic, pooled insurance data, or a standards-body
seat he can't get. That is a feature of the scoring, not a bug.

---

## The problem shortlist

All 33 vetted problems, ranked by a blend that weights **importance × neglectedness × founder-tractability**
(the three axes that decide whether *this* founder can do something real about it), with
real-not-speculative as a floor and verdict as the tiebreaker. `Imp` = importance, `Neg` =
neglectedness, `Trac` = tractability-for-founder, `Buy` = buyer-exists, `Real` = real-not-speculative.

| # | Problem (short) | Lens | Imp | Neg | Trac | Buy | Real | Verdict |
|---|---|---|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | **Unvalidated graders** — evals score against LLM-judges whose own accuracy was never measured; the "calibrate the instrument" second cycle is structurally absent | founder-crossdomain | 5 | 2 | **5** | 3 | 5 | maybe |
| 2 | **Automation-complacency at the review gate** — human reviewers habituate to mostly-fine AI output; approval rises, scrutiny falls, "a human approved it" becomes theater | second-order | 4 | **4** | 4 | 3 | 4 | maybe |
| 3 | **Silent ingestion corruption** — PDF/table→text parsing silently mangles meaning before the LLM sees it; no integrity check between parse and retrieval | assumed-solved | 5 | 3 | 4 | 4 | 5 | maybe |
| 4 | **Deployer can't attribute AI harm** — EU high-risk deployers must report "serious incidents" but can't attribute a black-box vendor model's output to model-vs-config-vs-input | forcing-function | 4 | **4** | 2 | 3 | 3 | maybe |
| 5 | **Silent semantic corruption in long agents** — a valid-but-wrong tool result poisons context; the agent reasons on top and compounds it with no error | frontier-shift | 5 | 2 | 4 | 3 | 5 | maybe |
| 6 | **Reference-free trajectory quality** — no accepted way to say an hours-long agent "did it right" when many valid paths exist and ground truth is absent | frontier-shift | 5 | 2 | 4 | 4 | 5 | maybe |
| 7 | **Contested ground truth** — evals assume a stable gold standard; for subjective tasks it's contested expert judgment collapsed to one label, discarding real uncertainty | founder-crossdomain | 5 | 2 | 3 | 2 | 5 | maybe |
| 8 | **temp=0 ≠ deterministic** — batch-invariance + FP non-associativity make "deterministic" evals drift; A/B "wins" are often noise treated as signal | assumed-solved | 4 | 2 | 4 | 2 | 5 | maybe |
| 9 | **Pinned snapshot ≠ frozen behavior** — a "stable" model ID drifts under you (routing, safety re-tune, checkpoint swap); silent regressions, no code to blame | assumed-solved | 4 | 2 | 4 | 2 | 4 | maybe |
| 10 | **Structured-output reasoning tax** — JSON-mode/schema constraints silently cut reasoning 10–30%; output parses perfectly while being measurably dumber | assumed-solved | 4 | 2 | 4 | 2 | 5 | maybe |
| 11 | **Semantic-cache false hits** — "safe" cost optimization serves confidently-wrong cached answers via fuzzy-key false positives, poisoning, and invisible staleness | assumed-solved | 4 | 2 | 4 | 2 | 5 | maybe |
| 12 | **Agent-caused incidents invisible in postmortems** — monitoring built for humans/cron can't attribute a cascade to an agent's action; the agent vanishes in the root cause | pain-mining | 4 | 3 | 4 | 3 | 4 | maybe |
| 13 | **Prompt-as-contract voided on model update** — provider updates silently break pinned prompts (JSON/verbosity/tone), no systematic way to know which prompts a new model breaks | pain-mining | 4 | 2 | 4 | 3 | 5 | maybe |
| 14 | **Judge-validation standard missing** — no portable "this judge is calibrated for this task" attestation; recursive eval can drift to ground-truth-detached fixed points | dog-didn't-bark | 4 | 2 | 3 | 3 | 4 | drop |
| 15 | **Reviewing AI PRs ≠ reviewing human code** — reviewer must forensically reconstruct intent the agent never recorded; review degrades as a quality gate | pain-mining | 4 | 2 | 3 | 4 | 5 | maybe |
| 16 | **Experts can't verify at production speed** — the named "human in the loop" in medicine/law/finance can't check outputs fast enough; is the loop even a real control? | dog-didn't-bark | 5 | 2 | 2 | 4 | 4 | maybe |
| 17 | **Verification-cost asymmetry (meta)** — cheap generation floods human verification gates everywhere (OSS, PRs, SOC, hiring); nobody owns the verification-cost ledger | second-order | 5 | 2 | 2 | 4 | 5 | maybe |
| 18 | **Insurers/buyers can't quantify AI reliability** — no independent reproducible reliability rating both sides accept; insurers exclude, buyers "take our word for it" | dog-didn't-bark | 5 | 2 | 2 | 4 | 4 | maybe |
| 19 | **Domain experts locked out of authoring evals** — eval tooling assumes coding; SME judgment can't become an eval; error analysis skipped or delegated | pain-mining | 4 | 2 | 3 | 3 | 4 | maybe |
| 20 | **Code review can't scale to AI volume** — 98% more PRs, review time +91%, 96% distrust yet 48% verify; unreviewed AI code merges | frontier-shift | 5 | 1 | 2 | 3 | 5 | drop |
| 21 | **Offline→production transportability gap** — no pre-deployment estimate of how much a benchmark score degrades on YOUR distribution (medicine's TRIPOD, unported) | founder-crossdomain | 4 | 2 | 2 | 2 | 4 | maybe |
| 22 | **Verification asymmetry in procurement** — buyers can't independently test vendor accuracy claims; no GAAP-equivalent attestation layer for AI performance | founder-crossdomain | 4 | 2 | 2 | 3 | 4 | maybe |
| 23 | **Wrongful deprovisioning of small builders** — solo devs banned instantly by false-positive abuse detection, no human appeal, no data export; nobody measures the rate | underserved | 3 | **4** | 3 | 2 | 3 | maybe |
| 24 | **Affected people can't contest AI decisions** — benefits/insurance/fraud denials arrive with no intelligible reason, no verification, no appeal; burden on the least-resourced | underserved | 5 | 3 | 2 | 2 | 5 | maybe |
| 25 | **AI cost can't be attributed** — orgs see total spend but can't isolate an agent's cost or link it to value; 3–5x overruns, can't build/kill rationally | pain-mining | 5 | 2 | 2 | 4 | 5 | drop |
| 26 | **No behavioral-compatibility contract for APIs** — providers change weights/routing behind an unchanged endpoint; no behavior changelog, no drift signal until users complain | dog-didn't-bark | 4 | **4** | 2 | 2 | 4 | drop |
| 27 | **Eval compute cost gatekeeps verification** — agentic evals cost $40k/sweep, resist compression; no shared reuse layer for the expensive cases | dog-didn't-bark | 4 | 2 | 2 | 2 | 4 | drop |
| 28 | **AI accessibility tools break assistive tech** — tools sold as accessibility fixes degrade screen readers/ASR; disabled users' failure reports never enter the eval loop | underserved | 4 | 2 | 3 | 2 | 5 | drop |
| 29 | **Contaminated training corpora** — practitioners can't cheaply tell if a corpus is human or recycled model output; silent collapse surfaces later | second-order | 4 | 2 | 3 | 3 | 3 | drop |
| 30 | **AI-detectors used as ground truth** — biased detectors penalize ESL/neurodivergent/plain writers; accusation with no falsifiable evidence, burden on the accused | second-order | 5 | 2 | 3 | 3 | 5 | maybe |
| 31 | **Detector bias in hiring/education (underserved framing)** — ESL/dialect writers misclassified as cheats, freelancers lose pay; no appeal, inverted burden of proof | underserved | 4 | 2 | 3 | 2 | 5 | drop |
| 32 | **Crawler externality + spoofed identity** — AI crawlers dump infra cost on non-consenting operators; spoofed user-agents break attribution for any billing/blocking | second-order | 4 | 2 | 2 | 2 | 5 | drop |
| 33 | **Fine-tuner accidentally becomes "provider"** — EU "significant modification" trigger turns on undisclosed base-model compute; a bet-the-company classification made blind | forcing-function | 4 | 2 | 2 | 2 | 3 | drop |

Ancillary drops with high raw importance but structural buyer/tractability failure for a solo eval
founder: **agent-payment dispute infrastructure** (frontier-shift, drop — AP2 + card networks own it),
**AI-content watermark robustness mandate** (forcing-function, drop — "as far as technically feasible"
safe harbor + NIST already on it), **AI-literacy adequacy measurement** (forcing-function, drop —
the regulator explicitly said no measurement/certificate required), **agent-commerce analytics blindness**
(frontier-shift, maybe — Web Bot Auth is closing the identity half), **cost-safety layer for solo devs**
(underserved, drop as product / maybe as a cost-variance benchmark).

---

## Problems worth solving, in depth

The eight below are the ones with the best blend of importance, neglectedness, and *this founder's*
tractability — the problems where a solo eval/reliability person could plausibly move the needle and
where the "nobody's solving it" claim survived at least partial scrutiny. **No solutions appear
here** — only the pain, the evidence, the why-now, who's already circling, why it's under-recognized,
and the honest two-sided verdict. Solutions come in the next round.

### 1. Unvalidated graders — the uncalibrated instrument under the whole eval stack

**The pain.** Almost every AI evaluation in production and in published leaderboards rests on a
grader — an LLM-judge, a rubric scorer, an automated checker — whose own accuracy has never been
measured against ground truth. In metrology you calibrate the instrument before you trust its
readings; in AI the instrument is routinely shipped unvalidated. Teams and leaderboards report
scores as if they were measurements when they are unaudited judgments from a tool with its own
position bias, length bias, agreeableness bias, and drift. The second, meta-evaluation cycle — "how
good is the grader?" — is structurally absent, so nobody knows the true error bars on any capability
or safety claim.

**Who has it.** Anyone who makes a decision on an eval score: eval/ML engineers gating releases on
judge scores, benchmark authors, model developers comparing checkpoints, safety teams whose "safety
pass rate" comes from an ungraded grader. **The founder hits this directly** — his published
LLM-as-judge RAG-hallucination work lives exactly here.

**Evidence.** A 2026 long-horizon-agent field guide states plainly that "every benchmark ships with
the second cycle missing — nobody put ground-truth labels on the grader"
(https://arize.com/blog/long-horizon-agent-benchmarks-field-guide/). 2025–26 audits put LLM-judge
error rates above 50%, driven by position/length/agreeableness bias, and found outcome-only grading
missed 44% of safety violations. Practitioner guidance now prescribes a 100–500-example human-labeled
calibration set run against the judge monthly, recalibrating when agreement drops below ~75%
(https://arxiv.org/pdf/2504.19076; https://eugeneyan.com/writing/llm-evaluators/) — an admission
that most pipelines don't do this.

**Why now.** LLM-as-judge went from research curiosity to default production infrastructure in
2024–25; by 2026 it gates real releases and safety claims at scale. The reliability audits exposing
>50% judge error and the meta-evaluation papers (RubricEval, "Know Thy Judge") are all 2025–26 — the
field just discovered its foundation is uncalibrated and has no standard practice for fixing it.

**Who's circling.** Academic meta-eval exists (RubricEval, meta-judge frameworks, "Know Thy Judge,"
IRT-for-judges). Vendors increasingly ship judge-alignment as a feature (Confident AI, LangSmith
annotation queues, Braintrust human-vs-judge side-by-side, MLflow judge alignment, Galileo Autotune).
"Validate your judge against human labels" is becoming standard 2026 advice.

**Why under-recognized.** The field pours effort into building new benchmarks and judges (the first
measurement cycle) and treats validating the judge as a footnote. The metrology framing — "you may
not report a measurement from an uncalibrated instrument" — is standard in every mature measurement
science but has no cultural foothold in AI eval yet.

**Steelman / skeptic.** *Steelman:* real, load-bearing, and multiply-corroborated (isReal=5);
near-ideal founder fit (5/5 tractability), extends his published work, tractable well under $500
(label 100–500 examples, run judges). If graders are wrong half the time and unaudited, a large
share of published and internal AI numbers are noise dressed as measurement — a foundational crisis.
*Skeptic:* neglectedness is dropping fast under the founder's feet — vendors are converting
judge-calibration into a built-in feature and academic meta-eval is crowding. Buyer willingness is
soft: teams *know* they should calibrate and skip it anyway; a standalone meta-eval service risks
being absorbed as a checkbox by whoever owns the eval workflow. Meta-evaluation also has a regress
problem (who validates the human labels?). **Verdict: maybe** — a strong *pursue* on the
research-credibility/get-hired path (execute a sharp meta-eval study, own the metrology framing
publicly); only a qualified maybe as a standalone company unless the wedge is one incumbents
structurally can't copy (an independent third-party calibration authority for public leaderboards, or
a vertical where ground truth is genuinely hard).

### 2. Automation-complacency at the review gate — when "a human approved it" becomes theater

**The pain.** When humans are put "in the loop" to review AI output, they habituate: repeated
exposure to mostly-fine artifacts erodes vigilance, so approval rates climb and scrutiny drops
*precisely as volume rises*. This is distinct from raw overload — even reviewers with time available
rubber-stamp — and organizations keep counting the human sign-off as a control it no longer is.

**Who has it.** Engineering teams relying on human PR review as their AI-code safety net; more
broadly any org whose compliance/safety posture rests on a human "approving" AI output (clinical
scribes, underwriting, content moderation, legal review).

**Evidence.** The arXiv study *Habituation at the Gate* (June 2026) tracked ~400 repeat reviewers
across 11,429 reviews: approval rose 30.1%→36.8% (+14.5pp cumulative) while review latency rose 3.5x
*and* inline-comment effort fell 22% — more time in queue, less actual inspection — an effect that
persists after controlling for calendar time and PR difficulty and is agent-specific
(https://arxiv.org/pdf/2606.22721). Corroborated: AI-coauthored PRs carry ~1.7x more issues and up to
2.74x more security vulns, yet reviewers scrutinize them less
(https://hackernoon.com/heres-why-code-review-is-having-trouble-scaling-to-the-ai-era).

**Why now.** Habituation requires sustained repeated exposure; only in 2025–26 do individual
reviewers see AI output as the *majority* of their queue, long enough for complacency to set in and
be measurable longitudinally. And there is a rare **hard why-now**: EU AI Act Article 14 (enforceable
Aug 2, 2026) requires deployers to remain aware of automation bias and demonstrate *effective*
oversight, with logs and auditor verification — turning a human-factors finding into a compliance
obligation.

**Who's circling.** Essentially nobody at the mechanism level. Vendors sell "AI code review" tools
that add another AI reviewer; nobody measures or counteracts the erosion of human vigilance itself.
Override-rate monitoring is becoming boilerplate advice and HITL-oversight vendors (Galileo,
Acceldata, WitnessAI) plus two academic teams are beginning to circle.

**Why under-recognized.** Regulators, auditors, and enterprises are betting on "human-in-the-loop" as
the primary safeguard across high-stakes domains. If the human gate predictably decays into a rubber
stamp, every governance framework built on it is silently compromised — but the failure is invisible
until an incident or audit.

**Steelman / skeptic.** *Steelman:* unusually hard evidence for a "trend" problem — a within-reviewer
longitudinal signature that rules out the obvious confounds — plus a datable regulatory forcing
function and a near-perfect fit to reliability *methodology* (instrument a control's decay; define
when a gate stops being a gate) on a <$500 budget (data is observable in PR/audit logs). *Skeptic:*
the pain is second-order and *unwanted knowledge* — the buyer's felt problem is "pass the audit,"
not "prove my control rotted," so you're selling against the buyer's interest absent a
regulator/post-incident forcing function. The *idea* is going mainstream fast, and a governance
incumbent could bolt a vigilance-decay metric onto an existing dashboard. And whether anyone can
reliably *reverse* the decay is an open research question a buyer would demand answered.
**Verdict: maybe** — pursue only if framed as an audit/compliance-attestation instrument (measurable,
saleable to the auditor's checkbox) rather than a standalone tool nobody asks for. This is the highest
**neglectedness** score (4) in the entire shortlist.

### 3. Silent ingestion corruption — the invisible layer before the LLM

**The pain.** The document-ingestion layer that turns PDFs/tables/scans into the text an LLM actually
reads is treated as solved plumbing ("we parse the PDF, then RAG handles the rest"). In reality it
silently corrupts meaning: tables flatten into uninterpretable value-sequences, layout-detection
errors cascade into scrambled OCR, footnotes vanish. Because users never see the extracted text, they
blame the LLM or the retriever for wrong answers — not the invisible pre-LLM step. There is no
standard "did we lose meaning here?" integrity check between parse and retrieval.

**Who has it.** Enterprise RAG/document-AI builders ingesting real-world PDFs (financial filings,
contracts, forms, scientific papers) — and the domain experts who trust the resulting answers.

**Evidence.** *Semantic Integrity Failures in Document-to-LLM Supply Chains* names the "hidden
ingestion layer users cannot observe or audit" and catalogs 25 extraction gaps across 16 stacks × 7
LLM services (https://arxiv.org/pdf/2606.15020). Practitioner analysis *Your Chunks Failed Your RAG
in Production* calls tables "the single most common cause of silent retrieval failures in enterprise
RAG" (https://towardsdatascience.com/your-chunks-failed-your-rag-in-production/). Parser benchmarks
report poor parsing raising RAG hallucinations up to 30% and degrading accuracy 10–15% on complex
docs (https://www.firecrawl.dev/blog/best-pdf-parsers); a single accuracy metric masks collapse
(GPT-4o-mini: 75% text accuracy but 13% structure similarity).

**Why now.** Enterprise RAG over proprietary document sets is the dominant 2025–26 LLM use case, and
the retrieval/model layers have improved enough that ingestion is now the dominant silent failure
source — yet it remains the least monitored layer in the stack.

**Who's circling.** A crowded market of PDF parsers (Unstructured, LlamaParse, Firecrawl, Reducto,
Tensorlake, LandingAI) competes on *extraction quality*, not on telling you when extraction silently
failed for a given document. Critically, RAG observability/eval tools (Arize/Phoenix, Ragas, TruLens,
DeepEval) all start at **retrieval** — none evaluate whether chunks were extracted correctly from the
source. That "integrity gate between parse and retrieval" is a genuinely empty slot.

**Why under-recognized.** "PDF-to-text is solved" has been folk wisdom for a decade, so teams treat
ingestion as a commodity library call. The failure is doubly hidden: it happens before the LLM, and
the corrupted intermediate text is never surfaced to the person judging the output.

**Steelman / skeptic.** *Steelman:* the evidence is overwhelming and current, the buyers are
regulated (finance, legal, insurance) where confidently-wrong answers carry liability, and the gap
(RAG eval stops at retrieval) is real and verified. Fits eval + data-pipeline strengths and a <$500
budget. Highest importance-plus-buyer combination among the assumed-solved cluster. *Skeptic:*
extraction vendors already ship field-level confidence, bbox citations, and grounding — a partial
answer a pure integrity-checker risks being absorbed by. The cited paper itself proposes the two
obvious defenses (static screening scanner + dual-view render/extract consistency), so the
novel-insight moat is thin. Verifying extraction integrity *without ground truth* is hard and the
most reliable check is compute-heavy. Willingness to pay for a diagnostic vs. buying a better parser
that just fixes it is unproven. **Verdict: maybe** — real, high-stakes, current, with a true gap; the
winning move is likely a sharp wedge (a vendor-neutral integrity benchmark, or a specific regulated
vertical) rather than the problem as stated. **Neglectedness 3 — the least-crowded of the top three.**

### 4. Deployer can't attribute AI harm — liability without observability

**The pain.** Companies that merely *deploy* someone else's AI in EU high-risk workflows are legally
on the hook to detect and report "serious incidents" (Art. 73, tiered 15/10/2-day clock) and run
continuous post-market monitoring (Art. 72/26) — but the harm-causing behavior lives inside a
black-box vendor model they didn't build and can't inspect. They cannot answer the core question the
law forces on them: did OUR use of this model just cause a reportable harm, and was it the model, our
prompt/config, or the input data?

**Who has it.** Mid-size and enterprise *deployers* of third-party AI in regulated workflows (HR,
lending, insurance, hospital IT) — non-AI-native companies that bought AI, not the labs that built
it — and their compliance/risk officers and small ML teams.

**Evidence.** Legal analysis of Article 73 flags the attribution problem directly: "operators are
often unable to gain sufficient technical insight to identify specific causes, while providers often
do not have direct access to all real operating conditions"
(https://www.taylorwessing.com/en/insights-and-events/insights/2025/10/eu-ai-act-deep-dive). The
tiered reporting clock is Art. 73 (https://artificialintelligenceact.eu/article/73/); Art. 72
requires "active and systematic" analysis, not passive storage
(https://artificialintelligenceact.eu/article/72/). A 2026 category survey of AI-Act compliance
software confirms *none* of the tool categories (GRC automation, AI governance, LLM observability)
address causal attribution for serious incidents.

**Why now — and the honest correction.** The problem was framed around a "~4 weeks out" Aug 2026
enforcement date. **That is now factually wrong:** the Digital Omnibus deferring high-risk Annex III
obligations to 2 Dec 2027 cleared Council (29 June 2026) and Parliament (16 June 2026). The acute
forcing function has evaporated; the real clock is ~17 months out.

**Who's circling.** GRC/questionnaire vendors sell policy templates; observability startups sell
tracing. Both address documentation and telemetry, not the hard part: causal attribution of a
harmful output to model-vs-config-vs-input under a legal "reasonable likelihood of a causal link"
standard.

**Why under-recognized.** The compliance conversation is about *documentation*; the attribution
question hides between security (abuse detection) and consumer protection, and the hardest technical
core (proving causation inside a model you can't inspect) is exactly why nobody's solved it.

**Steelman / skeptic.** *Steelman:* the attribution gap is legally real, named by serious lawyers,
and genuinely neglected on its *hard part* — the buyer (non-AI-native regulated deployer with no
in-house ML) is real and budget-holding, and it's one of only two shortlist problems scoring
neglectedness 4. *Skeptic:* the load-bearing "why now" is broken (deferral to Dec 2027). Even absent
the delay, "serious incident" is under-defined, so most deployers will discharge the duty with
lawyer-blessed process + logs, not a technical attribution engine — the legal standard is
"reasonable likelihood," an affidavit-and-judgment problem more than model-forensics. And the
hardest technical core may be unsolvable to a compliance-grade bar by a solo builder with no model
access. **Verdict: maybe** — reclassify as a **2027-horizon bet worth watching**, not a summer-2026
emergency. Before pursuing, resolve whether the legal standard is satisfiable by a technical tool at
all, and whether a solo builder can reach a defensible bar without model access.

### 5. Silent semantic corruption in long-running agents

**The pain.** When an agent runs for hours and one of its dozens of tool calls returns a
structurally-valid-but-wrong result (wrong DB row, mis-coerced argument, stale value), the agent does
not error — it silently reasons on top of the corrupted output and every downstream step compounds
the corruption. It surfaces later as a wrong business decision, corrupted record, or bad autonomous
action. There is no accepted way to detect at runtime that context has quietly gone off the rails
when nothing threw.

**Who has it.** Engineering teams shipping long-running / multi-step LLM agents in production;
reliability/QA owners responsible for agent output correctness.

**Evidence.** A developer who logged every tool call from a Claude agent for 72 hours found 37% had
parameter mismatches that never raised an error, with the comment section reporting the same across
OpenAI, Anthropic, and local setups (https://www.roborhythms.com/fix-ai-agent-tool-call-errors/).
Corroborated as a top production failure mode: "the LLM simply improvises around the broken response
and continues the workflow with corrupted context"
(https://dev.to/hadil/why-ai-agents-fail-in-production-and-how-engineering-teams-are-fixing-it-in-2026-job).
A 2026 benchmark (AgentProp-Bench, arXiv 2604.16706) measured propagation-to-wrong-final-answer at
~0.62 across nine models; real incidents (PocketOS production-DB wipe by a Cursor/Claude agent) give
it teeth.

**Why now.** Agents chaining dozens of unsupervised tool calls over hours only became common in
2025–26. Task-duration capability is doubling ~every 7 months and doubling task duration roughly
quadruples failure rate (https://theaidigest.org/time-horizons), so the corrupted-context blast
radius grows with horizon length — and as agents get write/act permissions, an undetected corrupted
step becomes an autonomous wrong action.

**Who's circling.** The *product* gap is real (Galileo/Maxim/Latitude detect aggregate drift and
post-hoc traces, not single-run semantic corruption). But the *research* frontier is crowded and
moving fast in H1 2026: TrajAD (arXiv 2602.06443) does runtime trajectory anomaly detection for
exactly valid-but-semantically-wrong outputs; AgentProp-Bench ships a runtime Interceptor; plus
SHIELDA, ClawGuard, self-healing orchestrators.

**Why under-recognized.** Agent-observability discourse is dominated by "traces for debugging your
agent's quality"; the specific class — semantically-wrong-yet-schema-valid mid-run corruption — is
the dangerous "Layer 2" that schema validation passes and correctness-focused eval tools miss.

**Steelman / skeptic.** *Steelman:* real, important (5), urgent, strong evidence, excellent founder
fit, buildable solo under $500 (LLM-judge + benchmark, no training). *Skeptic:* fails the
neglectedness bar — it's an actively-researched frontier with well-funded observability vendors
positioned to absorb it. The market's actual response to incidents was human-in-the-loop and
restricted write scopes (cheaper, "good enough"), not a semantic-corruption detector. The detection
primitive is inherently probabilistic, so it competes on a fuzzy accuracy curve, hard to sell as a
guarantee. **Verdict: maybe** — pursue only with a sharp wedge incumbents structurally miss (runtime,
not post-hoc, single-run detection for write/act-capable agents in one vertical, benchmarked against
the existing 2026 methods rather than against nothing).

### 6. Reference-free trajectory quality for long-horizon agents

**The pain.** Because a single valid-looking agent trajectory can be reached through many
equally-correct paths and runs are non-deterministic and non-reproducible, there is no accepted way
to say whether an hours-long agent "did the task right." Final-answer checks miss trajectory
failures; ground-truth trajectories are expensive, brittle, and often don't exist for open-ended
enterprise tasks. Teams deploying hours-long agents cannot reliably measure quality, catch
regressions, or compare agent versions.

**Who has it.** Teams building and operating long-horizon / enterprise agents who must certify
quality before deploy and detect regressions after; eval and reliability engineers — **directly the
founder's evaluation-methodology specialty.**

**Evidence.** "Errors compound across steps, runs are long and autonomous, trajectories are
non-deterministic," and LLM-vs-ground-truth comparison fails because "multiple alternative valid
trajectories exist for the same request"
(https://www.confident-ai.com/blog/llm-agent-evaluation-complete-guide). A wave of 2026 papers
targets this explicitly: *Beyond Binary Correctness: Scaling Evaluation of Long-Horizon Agents on
Subjective Enterprise Tasks* (https://arxiv.org/html/2603.22744v1) and TRACE, which evaluates
"without reliance on pre-defined ground-truth trajectories, which are often restrictive and expensive
to create" (https://arxiv.org/pdf/2606.00611). LangChain's 2026 survey has quality as the #1 deploy
barrier (32%).

**Why now.** Autonomous hours-long agents are a 2025–26 phenomenon; before that, eval-on-final-answer
sufficed. The mismatch between horizon length and eval methodology is new, and the cost of not
measuring escalates with task duration.

**Who's circling.** Active but unsettled — a burst of competing 2026 academic frameworks (TRACE,
RoadmapBench, "Beyond Binary Correctness," "Long-Horizon Task Mirage") and the single most crowded,
best-capitalized commercial corner in AI: LangSmith ($1.25B), Braintrust ($800M), Arize (~$1B),
Galileo (Cisco), Langfuse, Confident AI, Maxim — all ship trajectory eval today via golden datasets +
LLM-as-judge + replay. No consensus method for *reference-free* trajectory quality on open-ended
tasks, though.

**Why under-recognized.** "Reliability" claims for agents are unfalsifiable without this measurement,
so the field either over-trusts (autonomous wrong actions) or under-deploys (never leaves the human
in the loop). Evaluation is the gating function on the entire long-horizon-agent economy.

**Steelman / skeptic.** *Steelman:* present-tense, multiply-corroborated pain with a tight skills fit
— his LLM-as-judge / hallucination-detection work *is* the scoring engine this needs, at laptop +
API scale. *Skeptic:* neglectedness is the fatal axis — this is the most crowded and consolidating
corner of AI, and even the academic side has a 2026 burst of competing frameworks. The truly-open
sliver (reference-free scoring where multiple valid paths exist) is exactly what funded platforms
will absorb the quarter it's demonstrated, and it's partly a *definitional* problem (what "did it
right" means on subjective tasks) that may have no clean general answer. Buyers pay for agent eval
bundled, not as a standalone reference-free scorer. **Verdict: maybe** — excellent *research topic*
and credibility artifact; a strong pursue as a publishable wedge, viable as a company only if the
reference-free method converts into a non-copyable asset (a proprietary long-horizon failure corpus,
a continuous pipeline, or an attestation brand).

### 7. Contested ground truth — the mirage under every eval

**The pain.** The entire eval edifice assumes a stable "ground truth" to score against, but for most
consequential tasks that ground truth doesn't exist as a *fact* — it is expensive, contested,
disagreement-laden expert judgment. Treating majority-vote or a single expert as "correct" silently
manufactures a false gold standard; genuine reasoned disagreement (which reflects real task
ambiguity, not annotation error) gets collapsed into one label, and every downstream metric,
judge-calibration, and benchmark inherits that fiction — while the skilled human labor that produces
it is unbudgeted, uncredited, and non-reproducible.

**Who has it.** Eval methodologists and dataset builders; domain experts (clinicians, lawyers,
teachers) whose reasoned disagreement is erased; and every team whose judge-calibration and benchmark
rests on these labels — **including the founder**, whose LLM-judge work depends on a human reference
standard.

**Evidence.** "Consensus does not always equate to correctness"; high inter-annotator agreement can
mask shared bias; expert disagreement "should not be treated as ground truth upon which to evaluate
model performance" (CrowdTruth line; https://arxiv.org/pdf/2508.00143 *Beyond Agreement*;
https://arxiv.org/pdf/2506.10150). Individual human-vs-consensus agreement runs as low as κ≈0.13
while LLM–LLM agreement is ~0.45 (arXiv 2606.03043), so "the judge matches humans" can be an artifact
of collapsed labels. Practitioner guides concede the fragility by prescribing a single "benevolent
dictator" domain expert to force a decision (https://hamel.dev/blog/posts/evals-faq/).

**Why now.** As AI moves from objective-answer tasks (math, compiling code) to subjective high-stakes
judgment (medical advice, legal reasoning, safety, empathy), the single-ground-truth fiction breaks
down exactly where the stakes are highest — and 2025–26 work is only now naming disagreement-as-signal
rather than noise, with regulatory scrutiny (a June-2026 Nature Medicine study exposing an FDA
validation gap; FDA GMLP; ITU FG-AI4H) adding pressure.

**Who's circling.** CrowdTruth has pushed "disagreement as signal" since ~2014; xRR / perspectivist
modeling / soft-aggregation and a dozen 2025–26 papers exist; DeepFact's Audit-then-Score is a
competing protocol. Commercially, SuperAnnotate ships tooling to "measure and resolve disagreements,"
and Braintrust/Galileo/Future AGI sell judge-vs-human calibration. "No adopted standard" is true, but
standards get set by incumbents/consortia, not solo founders.

**Why under-recognized.** "Ground truth" is such a foundational, unquestioned term that few pause to
ask whether it *exists* for the task at hand. The field treats the reference standard as given input,
not as a constructed, uncertain, labor-intensive artifact that deserves its own measurement science.

**Steelman / skeptic.** *Steelman:* the deepest layer of the measurement crisis — underneath judge
validity and error bars. If the reference standard is a mirage, every capability claim built on it is
anchored to fiction; the skills fit is strong and the regulatory why-now is real in medical/legal.
*Skeptic:* academically crowded and partially covered by incumbents; today's buyer wants a single
shippable pass/fail number, so willingness-to-pay is largely future-tense, and preserving
disagreement often makes the buyer's decision *harder*. More a measurement-science/methodology
problem than a product. **Verdict: maybe** — pursue as a sharply scoped wedge (a
disagreement-preserving reference-standard + judge-calibration harness aimed at a regulated vertical
being forced to defend validity), not as an attempt to redefine "ground truth" for the field.

### 8. The "assumed-solved" reliability cluster — temp=0, pinned snapshots, structured output, semantic caches

These four are grouped because they share a signature: a belief repeated as settled fact that is
quietly false, a failure that is *silent and schema-valid* rather than a crash, and a fix the docs
increasingly already name. Each is real (isReal 4–5) and squarely in the founder's wheelhouse; each
fails on **buyer** (2) because the pain is subtle and the remedy is often free.

- **temp=0 is not deterministic.** Batch-invariance failures in GPU reduction kernels + non-associative
  FP make identical prompts at temp=0 drift run-to-run, so a large fraction of reported eval deltas
  and A/B "wins" are measurement noise nobody re-runs to check. Root cause precisely characterized by
  Thinking Machines' *Defeating Nondeterminism*
  (https://www.llmwatch.com/p/eli5-defeating-nondeterminism-in); drift measured in arXiv 2408.04667
  and 2601.19934. *Skeptic:* the general remedy (run N times, report variance) is a crowded 2024–26
  conversation, and the practitioner fix collapses into it regardless of the exotic root cause.
  **Verdict: maybe** (covered — a wedge/content angle into a broader eval offering, not a company).

- **Pinned snapshot ≠ frozen behavior.** A "stable" model ID drifts under an unchanged endpoint
  (platform system prompts, safety layers, checkpoint swaps evolve independently), and snapshots are
  force-deprecated on short timelines. DigitalOcean's teardown confirms "two requests to the same
  pinned model on different days can behave differently"; OpenAI's own page confirms six GPT-5/o3
  dated snapshots hard-retiring Dec 11 2026. *Skeptic:* pin+canary+CI-eval is now openly called
  "standard practice," academia has named the framework, and the engineers in pain can self-serve a
  golden-set regression harness in a weekend. **Verdict: maybe** — a sharp wedge (a continuous "your
  pinned snapshot's behavior changed" signal tied to the deprecation calendar), not a company.

- **Structured-output reasoning tax.** Forcing schema-compliant tokens (especially
  answer-before-reasoning field ordering, on capacity-limited/open-weight models) silently degrades
  reasoning 10–30% and suppresses tool-calling; the output parses and looks trustworthy while being
  measurably dumber, and the loss is mis-attributed to the model. Quantified across *Let Me Speak
  Freely?* (2408.02442), *Capacity, Not Format* (2606.09410), *Constraint Tax in Open-Weight LLMs*
  (2606.25605). *Skeptic:* OpenAI's docs already recommend the fix (reason first, then serialize), the
  mitigation is widely published, and the papers ship their own harnesses — and the fix is free.
  **Verdict: maybe** — a high-signal wedge/content angle, not a fundable standalone.

- **Semantic-cache false hits.** Adopted as a "safe" cost optimization, semantic caching silently
  serves confidently-wrong answers via false-positive similarity matches, first-answer-wins
  poisoning, and undetectable staleness — no error signal because the cached response is fluent and
  schema-valid. Documented across ~6 2026 production writeups plus a peer-reviewed NDSS 2026
  cache-poisoning paper (TrueFoundry, PyImageSearch, Maxim, Portkey). *Skeptic:* the mitigation
  playbook is already published and gateways expose cache-hit/similarity metadata; the top
  recommendation for high-stakes routes is "use a conservative threshold or no semantic caching at
  all" — a free config toggle. **Verdict: maybe** — worth a scoped detection experiment (turnkey
  "was this a bad cache hit?" detection is the genuinely-unsolved sliver), not a company unless
  buyers pay beyond "just tune the threshold."

The cluster's collective lesson: these are excellent **portfolio/credibility artifacts and content
wedges** — sharp, cheap, publishable, and directly in the founder's voice — but each is
feature-not-company because the fix is cheap and the buyer subtle. They belong in the research-and-get-hired
column, not the found-a-company column.

---

## Clusters & meta-patterns

Grouping the 33 problems reveals five themes. The founder's eval/reliability edge lines up cleanly
with the first two; the last three are where importance is highest but *this founder's* leverage is
weakest.

### Cluster A — The measurement stack is uncalibrated (founder's home turf)
*#1 unvalidated graders, #7 contested ground truth, #8 temp=0 / pinned-snapshot / structured-output /
cache, #14 judge-validation standard, #6 reference-free trajectory quality.*

Every one of these says the same thing at a different layer: **AI's measurement instruments are
themselves unmeasured.** The judge is uncalibrated (#1), the reference standard it's calibrated
against is a mirage (#7), the "deterministic" run it scores is noisy (#8a), the pinned model it scores
has moved (#8b), and there's no accepted way to score the trajectory at all (#6). This is a *coherent
research program*, not five unrelated bugs — and it is exactly the metrology-for-AI framing where a
published LLM-as-judge author has genuine standing. **The catch, uniform across the cluster:
neglectedness is 2.** Vendors are absorbing calibration as a feature and academia is crowding. So the
cluster's value is overwhelmingly **research-credibility and hireability**, with company potential
only where a non-copyable asset (an independent calibration authority, a proprietary hard-ground-truth
corpus) can be manufactured.

### Cluster B — The human gate is quietly failing (highest-neglectedness lane)
*#2 automation-complacency, #15 reviewing AI PRs, #16 experts can't verify at speed, #19 experts
locked out of authoring, #17 verification-cost asymmetry.*

The industry's universal safety story is "a human reviews it." This cluster is the evidence that the
human review layer is degrading under AI volume in ways nobody instruments: reviewers habituate (#2),
the review task itself changed shape (#15), the designated expert can't keep pace (#16), and the
scarce expert whose judgment defines correctness can't even participate in the eval loop (#19). **#2
is the single most neglected mechanism-level problem in the entire set (neglectedness 4)** and it has
a rare hard regulatory why-now (EU AI Act Art. 14). This is a human-factors *measurement* problem —
still the founder's craft — but with a harder buyer story ("your control rotted" is unwanted
knowledge) that only a compliance/audit forcing function unlocks.

### Cluster C — Agents broke the assumptions the stack was built on (frontier)
*#5 silent semantic corruption, #6 trajectory quality, #12 agent-caused incidents invisible, #13
prompt-as-contract voided.*

Everything downstream of "agents got long horizons and write access in 2025–26" lives here. The
common shape: the failure is *silent, formatted, and exogenously triggered* — a poisoned tool result
(#5), an unattributable cascade (#12), a provider update that voids a working prompt (#13). Real and
urgent (mostly isReal 4–5), but the frontier is crowded with well-funded observability vendors and
fast-moving academic work, so neglectedness caps at 2–3.

### Cluster D — Verification/attestation as market infrastructure (right problem, wrong founder-shape)
*#18 insurers can't rate reliability, #22 procurement can't verify claims, #4 deployer attribution,
#26 no behavioral contract, #24 affected people can't contest.*

These are the load-bearing *trust* problems — insurability, procurement, due process, incident
attribution. Importance is uniformly high (4–5). But they share a structural trap the
[12 · company-theses](12-company-theses.md) pass already surfaced: **the durable asset is a
neutral-authority brand, a regulatory designation, or pooled proprietary data — and in mid-2026 those
are owned by incumbents (Armilla, Munich Re, ISO 42001, Big-4 attestors) or unreachable by a solo
builder.** The founder's measurement edge is the *commodity* input; trust is the load-bearing part he
can't mint alone. These stay drops-or-maybes for founding, but are strong *"get hired into / partner
with"* targets.

### Cluster E — The externalities land on the powerless (high importance, no paying buyer)
*#23 wrongful deprovisioning, #24 benefit-denial recourse, #28 accessibility, #30/#31 detector bias,
#32 crawler externality.*

The most morally weighty problems in the set — and the clearest illustration of why importance ≠
foundability for a solo builder. In each, the actor with the acute pain (banned devs, benefit
claimants, ESL writers, disabled users, small publishers) is **structurally unable or unwilling to
pay**, and the actor who *could* pay is either exiting the category (institutions dropping detectors)
or is the one causing the harm (platforms won't fund being measured). These are **advocacy /
measurement-artifact / nonprofit-shaped** problems — which is not nothing given the charter keeps a
METR/Epoch-style nonprofit path open — but they are drops as ventures.

**The meta-pattern across all five clusters:** the founder's eval/reliability edge is real and
consistent (tractability 4–5 wherever the problem is measurement-shaped), but it is an *input*, not a
*moat*. It lines up best with the **most neglected** problems in Clusters A and B (#2, #4, #3), and it
is least useful exactly where importance is highest (Clusters D and E) because those need trust,
capital, or data access he doesn't have. The highest-leverage overlap — real, neglected, and
tractable — is a narrow band: **#2 (automation-complacency), #3 (ingestion integrity), #1
(grader calibration).**

---

## What surprised us / what the domain taxonomy missed

Going bottom-up from pain, rather than top-down from the existing
[05 · domain-comparison index](05-domain-comparison-index.md), surfaced problems the taxonomy simply
didn't have rows for. The payoff of the exercise is concentrated here:

1. **The "assumed-solved" reliability class is invisible to a domain map.** temp=0 non-determinism,
   pinned-snapshot drift, the structured-output reasoning tax, and semantic-cache false hits (#8) are
   not "fields" — they're *false beliefs* baked into every practitioner's mental model. A field-map
   organized by research area will never list "things everyone believes that are wrong," yet these are
   among the sharpest, cheapest, most-in-voice study opportunities the founder has. The taxonomy
   measures topics; this lens measures *wrong assumptions*, and that's a different axis.

2. **Automation-complacency (#2) is a human-factors problem, not an AI-eval problem — and it's the
   most neglected thing here.** It comes from decades-old aviation/vigilance research (Parasuraman),
   not from the AI benchmarking literature. A domain map rooted in AI evals would file it under
   "human-in-the-loop" and miss that the *measurable decay of the control itself* is unowned. The
   cross-domain import is the whole insight.

3. **The deployer-attribution gap (#4) sits in a blind spot between three fields.** It's not
   observability (that watches your own agent), not governance (that documents), and not
   security (that detects abuse) — it's *forensic causal attribution against a black-box you're liable
   for*. No single domain row captures a problem defined by a legal standard ("reasonable likelihood
   of a causal link") applied to a technical artifact you can't inspect.

4. **The most important problems are the ones the founder is worst-positioned for.** The bottom-up
   pass kept surfacing 5-importance problems — uninsurable AI, benefit-denial due process, the
   verification-cost meta-asymmetry — that a top-down "where can I contribute?" map would rank highly
   and that turn out to be **drops or maybes for founding** on buyer/data/trust grounds. That
   inversion (importance highest exactly where personal leverage is lowest) is only visible when you
   score real problems against a real founder, not fields against a wish list. It's the single most
   useful thing this pass produced.

5. **Second-order and dog-didn't-bark lenses found problems by their *absence*.** The
   verification-cost asymmetry (#17) and the missing behavioral-compatibility contract (#26) aren't
   pains anyone reports as a ticket — they're structural gaps you only see by asking "given cheap
   generation, what *should* exist and conspicuously doesn't?" A pain-mining-only pass (or a topic
   taxonomy) would have missed both. #26 in particular scored neglectedness 4 precisely because it's
   the artifact nobody is incentivized to build — and that's exactly why it's a *drop*: unbuyable and
   un-foundable, but a genuine insight.

6. **Provenance and contamination are more crowded than the map implied.** The taxonomy would suggest
   corpus-contamination detection (#29) and AI-content provenance are open; the vets found Pangram,
   Binoculars, NeMo Curator, and the whole Web Bot Auth / C2PA stack already occupying them. Going
   bottom-up and web-checking each "nobody's solving this" claim is what caught the staleness — and
   turned several plausible-looking topics into honest drops.

---

## Next move

Carry the following into a **problem-seeded solution round** that regenerates pilots and company
theses *from these problems* — explicitly superseding the solution-first drafts in docs 08, 10, and
12. The selection criterion for this list is the shortlist blend (real × neglected × tractable) plus
the charter's impact-first rule, and it deliberately spans both the **founding** and the
**publish-and-get-hired** paths the charter keeps open.

1. **#2 — Automation-complacency at the review gate.** The best single carry-forward: highest
   neglectedness (4) in the set, a rare hard regulatory why-now (EU AI Act Art. 14, Aug 2026), a
   human-factors *measurement* problem that fits the founder's craft, and a <$500 data path (PR/audit
   logs). Solution round should explore the compliance/audit-attestation framing that makes the
   unwanted-knowledge buyer story tractable.

2. **#3 — Silent ingestion corruption.** The least-crowded of the high-importance problems
   (neglectedness 3), a genuinely empty slot (RAG eval stops at retrieval), regulated buyers with
   liability, and a clean eval/data-pipeline fit. Solution round should test the vendor-neutral
   integrity-benchmark wedge and a single regulated vertical.

3. **#1 — Unvalidated graders / grader calibration.** The best **founder-fit** problem (tractability
   5), a direct extension of his published work, and the anchor of the coherent "metrology for AI"
   research program (Cluster A). Carry it primarily as a **research-credibility / get-hired** artifact
   — own the metrology framing publicly — while probing the one company-shaped wedge incumbents can't
   copy (an independent third-party calibration authority for public leaderboards).

4. **#5 — Silent semantic corruption in long agents** *(as a scoped validation sprint).* Real,
   important, excellent fit, cheap to prototype — but only worth pursuing against the existing 2026
   methods (TrajAD, AgentProp-Bench) with a runtime, single-run, one-vertical wedge. Carry it as a
   *test*, not a commitment: cheap kill criteria up front.

5. **#4 — Deployer attribution** *(as a watch-list 2027-horizon bet).* Genuinely neglected on its
   hard part and a real budget-holding buyer, but the acute forcing function moved to Dec 2027. Do not
   pursue now; revisit when the regulatory clock re-tightens, and only after resolving whether the
   legal causation standard is satisfiable by a technical tool without model access.

**What is explicitly not carried:** the Cluster D/E high-importance problems (#18, #22, #24, #25, #26,
#20) as *ventures* — they are drops-or-maybes for a solo founder on buyer/trust/data grounds and the
vets should be respected as written. Several remain excellent as **nonprofit or get-hired targets**
(the charter's third and first paths), and #24 / #28 / #30 remain worthy **advocacy/measurement
artifacts** if impact-first ever outranks foundability for a given season.

---

*This document is the problem-first foundation. The next artifact regenerates solutions from
problems 1–5 above and re-runs the founding-vs-hire-vs-nonprofit lens against each — this time with
the problem, not the solution, in the driver's seat.*

---

### Summary

- **Method:** 33 problems mined bottom-up through 8 discovery lenses (pain-mining, second-order,
  frontier-shift, assumed-solved, underserved, dog-didn't-bark, forcing-function, founder-crossdomain),
  each adversarially vetted with a steelman/skeptic and 6 scores; drops kept as drops.
- **Top problems (real × neglected × tractable):** #2 automation-complacency at the review gate
  (neglectedness 4, hard EU-AI-Act why-now); #3 silent document-ingestion corruption (empty slot: RAG
  eval stops at retrieval); #1 unvalidated graders (the uncalibrated instrument under the whole eval
  stack).
- **Best founder-fit:** #1 grader calibration — tractability 5, a direct extension of his published
  LLM-as-judge work and the anchor of a coherent "metrology for AI" program — best carried as a
  research-credibility/get-hired artifact, not a solo company.
- **Most surprising under-recognized:** #2 automation-complacency — a human-factors vigilance-decay
  problem imported from aviation research, invisible to an AI-eval topic map, and the single most
  neglected mechanism-level problem in the set.
- **Meta-pattern:** the founder's eval edge is a strong *input* but not a *moat*; it lines up best with
  the most neglected problems (Clusters A/B) and is least useful exactly where importance is highest
  (Clusters D/E — insurability, due process, procurement), which need trust/capital/data a solo builder
  can't mint. Importance is highest precisely where personal leverage is lowest.
- **Carry forward** into a problem-seeded solution round: #2, #3, #1 (pursue), #5 (scoped sprint), #4
  (2027 watch-list). Docs 08/10/12 are superseded as the driver.
