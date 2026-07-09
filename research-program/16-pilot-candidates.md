# 16 · Pilot Candidates — the plain-English version

*Written 2026-07-09. This is the readable synthesis of the two creative-solution rounds —
[14 · creative re-angles](14-creative-reangles.md) and [15 · method-transfer solutions](15-method-transfer-solutions.md).
Those two are raw research logs: every idea we generated, scored, and adversarially killed, written in
insider shorthand. **This doc is the part you actually read to choose.** Each candidate below answers four
questions in plain terms: what is it, why does it exist, what problem does it solve, and how does it solve it.*

---

## The story so far, in three sentences

We found a set of real, well-evidenced problems in AI ([doc 13](13-problem-validation.md)) — but every one was
a poor fit for a *solo-founded company*: not because the problem was fake, but because the obvious business
around it was already owned by an incumbent, given away free, or needed a pile of labeled data we can't afford.
So we ran two creativity engines: one that **re-shapes the business** around each problem to dodge that trap
([doc 14](14-creative-reangles.md)), and one that **mines the top research papers' methods** and recombines them
into a cheaper, cleverer technical approach ([doc 15](15-method-transfer-solutions.md)). The candidates below are
the strongest survivors of both, adversarially checked for "has someone already done this," and fused into
concrete pilots.

## What a "pilot" is here

A pilot is a small study you can actually run: **≤ $500, ≤ 6 weeks, solo**, ending in a **public artifact**
(a short paper, a released dataset, or an open-source tool), with a **pre-written win-or-kill line** so you know
before starting what counts as success and what makes you stop. A pilot is *not* the company or the career — it's
the cheapest possible test of whether an idea is worth going deep on. You'd run 2–3 across different areas and let
real-world engagement decide.

## Two words that show up everywhere: "shape" and "method"

- The **shape** is the *business framing* — what you make, who it's for, and why they'd pay attention. (This is
  what doc 14 generated.)
- The **method** is the *technical trick* — usually: how you measure something, or get the data to measure it,
  without paying for a lab or an army of labelers. (This is what doc 15 generated.)

Most pilots below fuse one of each: a method that makes the study cheap, plus a shape that makes the result matter.

## Why they almost all say "hire" — and why that's still the plan

Across both rounds, one honest pattern held: even after re-shaping and re-methoding, most of these lead to
**getting hired** (into an AI startup or lab) rather than cleanly **founding** a company. The reason is specific:
the ideas that beat the "needs capital / already owned" problems tend to leave *one* remaining moat —
**institutional trust** (will a court, a regulator, or an enterprise take a solo's number seriously) — which money
can't buy at ≤$500 but a great public artifact *can earn over time*. So the strategy isn't "give up on founding."
It's: **ship a cheap, skill-perfect artifact → get hired or get cited into the seat → found from inside it.** A few
below (marked "found upside") keep a real path to a company if a paying buyer shows up.

---

## The candidates at a glance

Higher "vetting score" = stronger (0–100, from the adversarial judge; two numbers = method score / shape score).

| # | Pilot | What it is, in one line | The problem it cracks | Best path | Vetting |
|--:|---|---|---|---|:--:|
| 1 | **Ingestion Corruption Detector** | An OSS tool + public leaderboard that catches numbers silently mangled when documents are fed to AI | RAG systems answer confidently wrong because parsing quietly corrupts tables/numbers and nothing checks | hire → **found upside** | 80 / 75 |
| 2 | **Reviewer Scrutiny Metric** | A validated score for whether a human is *really* reviewing AI output vs rubber-stamping | "A human approved it" is becoming theater; oversight decays as AI does more of the work | hire / nonprofit | 81 |
| 3 | **PV-Grade** | A public benchmark grading AI on the four high-stakes drug-safety decisions | Drug-safety AI must be independently validated by law, but no yardstick exists | hire → **found upside** | 82 |
| 4 | **SuggestionFix-Bench** | Grades whether an AI reproduces the fix a human actually got merged (GitHub suggestion blocks) — no manual review | AI writes plausible-but-wrong code; nobody measures whether the AI's *fix* matches what a human accepted | hire | narrow wedge |
| 5 | **Multilingual Safety Meter** | A statistical method to measure if a model is less safe in other languages, robust to a flaky judge | Models refuse harm in English but comply in low-resource languages; labs don't measure it | nonprofit / hire | 77 / 70 |
| 6 | **Injection Defense Report Card** | An independent A–F report card grading prompt-injection defenses under *adaptive* attack | Defenses claim ~100% and fail >90% once the attacker adapts; no neutral referee exists | hire | 73 |

---

## Labeling & publishability at a glance

*From the per-pilot analysis ([raw output](14-creative-reangles.md) methodology; run 2026-07-09). Two YELLOW
labeling flags (PV-Grade, Multilingual) — no hard blockers, but both need expertise you can't fully self-supply.*

> **Honest effort correction.** The "≤ 6 weeks" framing above was optimistic. Realistic time to a *submittable*
> output is **~6–13 part-time weeks** (at ≤15 hrs/wk); a genuine ≤6-week version means shipping a deliberately
> narrow v1. The **≤ $500 budget holds for all six.**

**Human-labeling burden**

| Pilot | Burden | Who labels / expertise | Labels free or sourced? | Human hours |
|---|:--:|---|---|---|
| 1 · Ingestion Corruption | 🟢 GREEN | You; table-literacy only | Self-supervised; gold from OHR-Bench; XBRL answer key | ~3–6 hrs, spot-check |
| 2 · Reviewer Scrutiny | 🟢 GREEN | You; working-engineer level | Reverts free from git; PRs from AIDev; small hand-calibration | ~4–7 hrs |
| 3 · PV-Grade | 🟡 YELLOW | Causality needs a PV/clinical specialist | 3 of 4 decisions free (FAERS, OnSIDES); causality isn't | Your 4–7 hrs + a few hrs of a clinician |
| 4 · SuggestionFix-Bench | 🟢 GREEN | none — no manual code review | labels = humans' accepted PR suggestion-fixes (GitHub) | ~15–30 hrs one-time validation |
| 5 · Multilingual Safety | 🟡 YELLOW | Native/fluent speaker per language (mandatory) | Prompts free (RabakBench/IndicJR); the ~50 gold labels/lang are **not** | 1–2 native annotators/language |
| 6 · Injection Report Card | 🟢 GREEN | You; read tool-call traces | Success labels free/deterministic (AgentDojo); tiny judge-validation | ~4–7 hrs |

**Publishability & effort**

| Pilot | Novelty | Realistic venue | Effort (pt-wks) | Null still publishes? |
|---|:--:|---|:--:|---|
| 1 · Ingestion Corruption | moderate | FinNLP@EMNLP workshop → NeurIPS Evals/DMLR stretch | ~9–13 | Yes (DMLR/TMLR) |
| 2 · Reviewer Scrutiny | moderate | HEAL@CHI / KDD-SE workshop → MSR registered report | ~6–9 | Yes (a strength) |
| 3 · PV-Grade | moderate | ML4H/ClinicalNLP workshop + *Drug Safety* journal → D&B stretch | ~9–13 | Yes (low scores = the headline) |
| 4 · SuggestionFix-Bench | moderate (narrow) | ML4Code/SE workshop or NeurIPS Evals + dataset | ~6–9 | Yes (welcomed) |
| 5 · Multilingual Safety | moderate | ACL-family workshop (TrustNLP/MRL/SoLaR) → Findings stretch | ~7–10 | Only as an identifiability finding |
| 6 · Injection Report Card | moderate | NeurIPS/ICLR safety workshop or SaTML + living leaderboard | ~6–9 | Weakest (under-attack confound) |

**Data path** (audited 2026-07-09; full detail + fallbacks in [19 · pilot data paths](19-pilot-data-paths.md)). All
six have a legitimate path to obtaining or generating data — every one **WORKABLE, none RISKY**. In three cases the
binding risk is *volume*, not licensing.

| Pilot | Obtain/gen | Release-clean source | The caveat |
|---|---|---|---|
| 1 · Ingestion | obtain + gen | FinTabNet.c (CDLA-2.0) + SynFinTabs + SEC XBRL (public domain) | OHR-Bench is research-only → measure-only, don't re-release |
| 2 · Reviewer Scrutiny | obtain + gen | AIDev (CC-BY-4.0) + git revert labels (self) | volume: ~15% of agent PRs have real reviews → check power first (GH Archive to widen) |
| 3 · PV-Grade | obtain + gen | openFDA FAERS (CC0) + OnSIDES (MIT) + published rules | MedDRA terms licensed → ship a rebuild script, release de-MedDRA'd labels |
| 4 · SuggestionFix | obtain + gen | CodeReviewer (CC-BY-4.0) + self-mined permissive pairs | github-codereview is "license: other" → internal index only; <500-gold volume risk |
| 5 · Multilingual Safety | obtain + gen | RabakBench (modified-MIT) + self-gen responses + native gold | responses NOT free (generate them); Tamil n=156 thin; avoid M-ALERT/IndicJR for release |
| 6 · Injection Report Card | obtain | AgentDojo/OET/CaMeL/HarmBench/InjecAgent (MIT/Apache) | re-implement (don't vendor) no-license AdaptiveAttackAgent; grade Meta-SecAlign via weights |

Per-pilot detail is in each brief below, under **Human labeling** and **Publishability & effort**; data-path detail is in [doc 19](19-pilot-data-paths.md).

---

## The briefs

### 1 · Ingestion Corruption Detector
*Fuses method **MetaParse** (doc 15) + shape **LedgerParity / NumeriGuard** (doc 14).*

**What it is.** An open-source "numeric integrity" checker that flags numbers a document pipeline silently
corrupted, plus a public, auto-updating leaderboard scoring how faithfully different pipelines preserve the numbers
in a document.

**Why it exists / the problem.** When you feed PDFs and tables into an AI system, the *parsing* step quietly
mangles things — a table cell shifts, a "1,234" becomes "1234" or "1.234", a column merges. The AI then answers
confidently using the corrupted number. Today's RAG evaluation tools don't catch this: they assume the extracted
text is correct and only check whether the AI used it faithfully. So the error is invisible until it surfaces as a
wrong answer (a flipped figure in a financial or medical document). Benchmarks show ~50% accuracy drops on
table questions from this alone. A company (Reducto) already makes ~$1M/year with 4 people selling reliability here
— proof people pay.

**How it solves it.** The usual blocker: to know a number got corrupted you need the *correct* answer to compare
against, and building that answer key for every document type is expensive. The trick is that **you don't need an
answer key.** Render the *same page* at three different resolutions and feed each to the *same* parser. A correct
parser reads "1,234" as "1,234" regardless of resolution — so if the extracted value *changes* when the only thing
you changed was the resolution, that number is unreliable. The disagreement itself is the alarm, and it costs
nothing. (A second free check: blank out a number and ask a model to predict it from surrounding context; if its
confident guess contradicts the parser, flag it.) For the public leaderboard, you get a *real* answer key for
free from SEC filings, which by law publish their numbers in machine-readable form — so a nightly script can score
any pipeline's "numeric survival rate" forever.

**What you'd build first (≤$500).** Take a free numeric-table benchmark with known answers → one open-source OCR
engine → render each table at 150/200/300 DPI → flag any cell whose value flips → compare against two existing
approaches (running many parsers; running the model repeatedly) → report which errors *only* the resolution trick
caught. CPU-only, ~$50.

**Why it fits you / path.** This is your published RAG-hallucination-judge work moved one step upstream. **Hire**
into financial/document-AI or assurance teams; **found upside** as a neutral fidelity authority if a buyer appears.

**How it could fail (the kill line).** If corrupted numbers read *stably wrong* across resolutions too, the trick
catches nothing new → you publish a clean null and stop. The first experiment is designed to answer exactly this.

**Prior work → your delta.** Closest is *Semantic Integrity Failures* ([2606.15020](https://arxiv.org/pdf/2606.15020)),
which detects corruption by disagreement between *different parsers*; you invert it to *one parser, many
renderings*, catching the confident errors parser-voting misses.

**Human labeling.** 🟢 Green — none needed to *run* it (self-supervised: value-flips across resolutions are its
own labels; the leaderboard's answer key is free SEC XBRL). Labeling is only for *validation* — you personally
spot-check ~150–400 flagged cells against the source PDF (~3–6 hrs), and even that is largely pre-solved by
OHR-Bench's human-verified gold set. Expertise needed is table-literacy only (knowing a cell printed "(1,234)"
means −1,234), not accounting or ML.

**Publishability & effort.** Moderate novelty; realistic home is a workshop (e.g. FinNLP@EMNLP) plus a
genuinely-used OSS tool/leaderboard, with a stretch to the NeurIPS Evaluations & Datasets track if the method
result is clean. **~9–13 part-time weeks** — the real work is the *method* head-to-head, not the quick leaderboard
cron. A clean null publishes (DMLR/TMLR). Strong hire signal; best "found" optionality alongside PV-Grade.

---

### 2 · Reviewer Scrutiny Metric
*Fuses method **Stamp Score** (doc 15) + shape **Habituation Index / VerifierBench** (doc 14).*

**What it is.** A validated score that tells whether a human reviewing AI output is exercising real judgment or
just rubber-stamping — published as an open standard (a "scrutiny-decay rate") or as a tool that grades automated
checkers.

**Why it exists / the problem.** As AI does more of the work, the humans who are supposed to check it disengage and
approve on autopilot — and it gets *worse* the longer they do it. Anthropic's own production data shows
auto-approval climbing from ~20% to over 40% as reviewers rack up sessions; in medicine, a wrong AI hint nearly
*halved* expert radiologists' accuracy. "A human is in the loop" is quietly becoming theater. This was the most
bulletproof problem in the entire program — every attempt to argue it away failed.

**How it solves it.** Normally you'd need a controlled lab study to know if a reviewer is really paying attention.
The trick combines two *free* signals. (1) Have an AI grade each human review for depth — did they point to a
specific line? argue why the AI is *wrong*? propose an alternative? A shallow "looks good" scores low. (2) Check
that depth score against something every code repository already records for free: which merged changes later had
to be **reverted or hot-fixed**. If shallow reviews reliably come *before* reverts, you've proven the depth score
actually predicts missed bugs — with no lab, no volunteers, and no ethics-board approval.

**What you'd build first (≤$500).** Mine 3–5 public repos with heavy AI-generated-PR activity → build the AI depth
rubric (~$50) → score every human review → separately mark which merged PRs were later reverted/hot-fixed (free,
from git history) → test whether low depth predicts reverts, with error bars. ~$100.

**Why it fits you / path.** LLM-as-judge craft again. **Nonprofit/hire** as an open standard (a standard needs
citers, not a budget); **hire with found upside** as "VerifierBench," grading the automated reward-checkers that
AI labs already pay to get right.

**How it could fail (the kill line).** Reverts are noisy — most are feature rollbacks, not missed bugs. If review
depth shows no real link to reverts after controlling for change size, the headline collapses. But that negative
("review depth doesn't predict escaped bugs — here's a better proxy") is itself publishable.

**Prior work → your delta.** Closest is *Habituation at the Gate* ([2606.22721](https://arxiv.org/pdf/2606.22721)),
which measures scrutiny only by approval rates and comment counts — no depth rubric, and crucially no
revert-validation. Your delta is the "did they say why the AI is *wrong*" feature plus using reverts as a free
answer key.

**Human labeling.** 🟢 Green and self-doable. Outcome labels (was a PR later reverted/hot-fixed) are free from git
history; depth scores across the whole corpus are LLM-generated; you hand-label only a small calibration +
revert-triage sample (~4–7 hrs) to confirm the judge and separate defect-driven reverts from feature rollbacks.
The labeler must be a working engineer (you qualify), no per-codebase specialism. Raw PRs come free from the AIDev
dataset; the revert label is computed, not shipped.

**Publishability & effort.** Moderate novelty; a workshop + released dataset now (HEAL@CHI, KDD-SE), upgradeable to
an MSR registered report. **~6–9 part-time weeks** — biggest sink is constructing a defensible "revert = missed
defect" label. A rigorous null is a genuine strength here. Strong hire signal for AI-code-review teams (CodeRabbit,
Qodo, Greptile).

---

### 3 · PV-Grade — drug-safety decision benchmark
*Shape only (doc 14) — the highest-scoring idea in the whole set. (No method-transfer pass yet; I'd run a quick one first.)*

**What it is.** A public benchmark that grades how well AI makes the four legally-consequential pharmacovigilance
("drug-safety monitoring") decisions — did this drug plausibly *cause* the event, is it *serious*, is it
*expected*, and does the AI's summary faithfully match the source report.

**Why it exists / the problem.** As of January 2026, FDA/EMA guidance requires drug companies to *prove* the AI
they use to process adverse-event reports is accurate and independently validated — but **there is no yardstick to
measure it.** (Papers-with-Code lists zero benchmarks and zero datasets for this; vendor checklists literally tell
buyers to hand-build their own ~100-case test sets because none exists.) Patients suffer when a serious drug
reaction is missed; companies face liability.

**How it solves it.** You build the missing yardstick — and you can do it without buying labeled data. The
government's public FAERS database gives you free real adverse-event reports; published medical rules (WHO-UMC,
CIOMS) define the "right answer" for causality and seriousness; and judging whether an AI summary faithfully
matches its source is *exactly* your published expertise. The deeper reason this one is special: **unlike every
other idea, the party being graded actually wants a high, credible score** — because they legally need to show
regulators independent validation. So the usual "who would pay to be measured?" problem inverts in your favor.

**What you'd build first (≤$500).** Ship the public FAERS-grounded leaderboard scoring the four decisions as a
paper-with-code; validate your AI judge against a small human-labeled causality set. Free data, single model,
comfortably under budget.

**Why it fits you / path.** A near-direct extension of your published RAG-hallucination-judge study
(faithfulness = grounding). **Hire** into drug-safety-AI or vertical-AI-safety teams; **found upside** if sponsors
pay for a private, continuously-refreshed validation set.

**How it could fail (the honest catch).** The moment your independent score comes back *low* for a system, a signed
"your drug-safety AI is X% wrong on causality" report becomes discoverable legal evidence — so a cautious company
lawyer might refuse to let a third party score them on the record. "They want the yardstick to exist" may not
extend to "they'll pay *you* to grade them." That's the specific thing to test before betting on founding. Also:
causality has no universal gold standard, which caps how clean the benchmark can be.

**Prior work → your delta.** Closest is *Robust or Suggestible?* ([2510.13931](https://arxiv.org/abs/2510.13931)),
which touches the same four decisions but as a bias study — no released benchmark, no honest accuracy number. Your
delta is the actual benchmark + honest leaderboard.

**Human labeling.** 🟡 The catch. Three of the four decisions get labels essentially free from structured data —
*seriousness* (FAERS serious-flags + CIOMS rules), *expectedness* (label-ADR resources like OnSIDES), and much of
*faithfulness*. But *causality* — the headline decision — needs genuine drug-safety expertise (a pharmacist / PV
specialist / clinical pharmacologist) and has **no universal gold standard**. Your ~4–7 hrs can seed it, but a
defensible causality gold really wants a few hours of a clinician's time (recruitable — this is the load-bearing
risk). A true 6-week v1 could ship seriousness + faithfulness first and defer causality.

**Publishability & effort.** Moderate novelty; workshop-strong (ML4H / GenAI4Health / ClinicalNLP) plus a parallel
*Drug Safety*-style journal version that is the highest-leverage move for the hiring/founding audience; borderline
Datasets & Benchmarks track. **~9–13 part-time weeks** (high — the causality gold pipeline is the crux; exceeds
≤6wk). Near null-proof: low model scores *are* the mandate-relevant headline. Best-targeted credential for
vertical-AI-safety / PV-tech, with real found upside.

---

### 4 · SuggestionFix-Bench — grade AI fixes against real accepted PR corrections
*Redesigned 2026-07-09 to use real GitHub PR data instead of any manual code review (per your preference). It grades
the **fix**, not the flag. Full draft: [pilot-drafts/04](pilot-drafts/04-code-review-catch-vs-noise.md).*

**What it is.** A benchmark that checks whether an AI reviewer can reproduce the *correction a real human actually
made and got merged* — using GitHub "suggestion blocks" (the one-click inline fix a reviewer proposes) as
machine-verified gold. **Zero code review by you.**

**Why it exists / the problem.** AI writes code that looks right and compiles but is subtly wrong — the #1 developer
complaint (66% of 49,000 surveyed); a rigorous study found AI made experienced developers **19% slower** while they
*felt* faster, because reviewing almost-right output eats the time. Everyone sells AI code review, but nobody
measures whether the AI's *fix* matches the correction a competent human actually accepted.

**How it solves it (no manual review by you).** GitHub review "suggestion blocks" are literal (problem-lines →
human-authored replacement) pairs with a location attached. Keep only the **accepted** ones — the suggested text is
in the merged code and no later revert/hotfix touched those lines — and you have a machine-verified (problem →
accepted-fix) gold pair, authored by real programmers, needing zero code review from you. The AI must reproduce the
human's accepted correction, scored by AST-normalized exact match, an AST-equivalence band, and (on repos with
runnable suites) behavioral test-verified match. Divergent-but-valid AI fixes are routed to test-verification as
"alternative-valid," not penalized.

**What you'd build first (≤$500).** Download an existing labeled corpus (`ronantakizawa/github-codereview`, 355k
inline-comment rows with before/after + comment types) + the CodeReviewer corpus → regex out the ```suggestion
blocks → keep accepted-and-not-reverted (merged-head check + revert back-trace) → assemble ~800–1,500 gold
(problem → accepted-fix) pairs, split by repo → run 2–3 frontier LLMs (with-comment and no-comment) + a
nearest-neighbor retrieval baseline → score exact / AST-equiv / test-verified. CPU/free-tier + ~$100–200 API.

**Why it fits you / path.** Eval + data-pipeline craft; a differentiated credential for any code-AI team (CodeRabbit,
Qodo, Cursor, GitHub). **Hire** (the founding wedge is narrow — see below).

**How it could fail (the kill line).** Two live risks. (1) **Label noise** — comment/type filters cap ~85%
precision; if >10% of the "accepted-suggestion" gold is mislabeled (never actually applied, or formatting-only), the
oracle breaks → pre-registered kill. (2) **Scope/scoop** — suggestion blocks are *rare* (only ~8% are true defect
fixes), so the gold set may be small and skewed to tiny local edits; **kill if <~500 gold items survive filtering,
or if no reviewer beats the plain retrieval baseline.**

**Prior work → your delta.** The hard scoop check came back **KILL on the broad framing** — grading code review from
PR data is saturated: SWR-Bench ([2509.01494](https://arxiv.org/abs/2509.01494)), SWE-PRBench
([2603.26130](https://arxiv.org/abs/2603.26130)), Martian's Code Review Bench, CodeReviewer
([2203.09095](https://arxiv.org/abs/2203.09095)), ReDef ([2509.09192](https://arxiv.org/abs/2509.09192)). **The one
surviving wedge:** all of those grade the review *comment* (or do defect prediction); *none* uses accepted
**suggestion blocks as a literal exact-match / test-verified fix-correctness oracle.** Genuinely unclaimed — but
"defensible for months, not years."

**Human labeling.** 🟢 Green — and now **genuinely no manual code review by you** (your ask). The label *is* the
human's accepted suggestion, captured structurally from merged PRs; you author no corrections and inspect no diffs
for defects. The only remaining tax is one-time *validation*: a ~200–400-item audit that the "accepted-suggestion"
gold holds up + a ~200-item hand-verified eval slice — ~15–30 hrs total (as little as ~5 hrs if you just replicate
an existing corpus's task).

**Publishability & effort.** Moderate novelty on a *narrow* axis; realistic home is an ML4Code/SE workshop or the
NeurIPS Evaluations & Datasets track + a released dataset. **~6–9 part-time weeks** (lighter than the old design — no
mutant triage). Cleaner, cheaper, and less scoopable *on its specific axis* than the manual-review version — but the
wedge is narrow and dataset-size-fragile, so the "<500 gold items" kill is load-bearing. Not a founding wedge (the
broad space is taken).

---

### 5 · Multilingual Safety Meter
*Method (doc 15): **Ternary-PPI** or **PARITY-DIF**.*

**What it is.** A statistical *method* (not just another benchmark) to reliably measure whether a model is less
safe in other languages — and, importantly, one that stays trustworthy even though the AI judge you'd use to score
it is itself shaky in those languages.

**Why it exists / the problem.** A model will refuse a dangerous request in English but comply when it's asked in a
low-resource language. Frontier labs don't publish per-language safety numbers at all. The harm lands on exactly
the populations with the least recourse. Validation surfaced the real twist: to *check* safety in Tamil you'd use
an AI judge — but the judge is also unreliable in Tamil, so you can't tell a genuine safety gap from a broken
measurement. That means a *reliable measurement method* is itself the research contribution.

**How it solves it.** Borrow a move from testing science, which long ago learned to separate "this student is
weaker" from "this exam question is unfair." Instead of forcing every answer into safe/unsafe, you track a *third*
outcome explicitly — "the output was garbled or unclear" — as its own category. Then, from a small set of ~50
human-checked examples per language, you build a correction table that mathematically backs out how much of the
apparent "unsafe" rate is really just translation-and-judge noise. The output is an honest safety gap *with error
bars*, instead of a scary number you can't trust.

**What you'd build first (≤$500).** On one released multilingual safety benchmark, score answers as
refuse/comply/unclear per language → hand-build (or recruit 1–2 bilingual helpers — within your ~7-hour budget) a
~50-item answer key in 2–3 languages including Tamil → apply the correction and report the true gap with error
bars. Closed-form math, ~$150.

**Why it fits you / path.** LLM-judge methodology, extended into safety + multilingual — a strong profile for an AI
Safety Institute / Frontier Model Forum grant *and* a safety-team hire. **Nonprofit / hire.**

**How it could fail (the kill line).** The correction only cleanly separates translation error from real unsafety
if garbled translations mostly land in the "unclear" bucket; a fluent-but-wrong translation that reads as a clean
"comply" breaks the separation. If so, you still ship the total-noise-corrected number and name the limit honestly.

**Prior work → your delta.** Closest is *Why Do Safety Guardrails Degrade Across Languages?*
([2605.17173](https://arxiv.org/abs/2605.17173)) — binary, no "unclear" channel, no error bars on the noise
fraction. Your delta is the three-way correction with honest confidence intervals per language.

**Human labeling.** 🟡 The one pilot where labeling is genuinely *necessary and not free*: the method is "measure
the measurer," so it needs a small trustworthy gold set (~50 items/language) to estimate and invert the judge's
error. Each labeler must be **native or fluent** in the target language (Tamil, etc.) — the non-negotiable
requirement, and beyond what you can self-supply. Prompts and even model responses are free (RabakBench, IndicJR);
the ternary gold labels are not. Plan: recruit 1–2 native annotators per language for a few hours (within/near
budget).

**Publishability & effort.** Moderate novelty; a solid ACL-family workshop (TrustNLP / MRL / SoLaR) with a Findings
shot if the identifiability result comes back clean across 3 languages. **~7–10 part-time weeks.** A null publishes
*only* if framed as an identifiability/methods finding. Strong safety/eval hire + grant on-ramp (UK AISI, Frontier
Model Forum AI Safety Fund both fund independents); weak for founding.

---

### 6 · Injection Defense Report Card
*Fuses shape **Kepler Report** + method **OracleProof** (docs 14 & 15).*

**What it is.** An independent, recurring **A–F report card** grading prompt-injection defenses by how well they
hold up against a *smart, adapting* attacker — not the fixed test suites the vendors grade themselves on.

**Why it exists / the problem.** Prompt injection is the top security risk for tool-using AI agents. Vendors ship
defenses and report they stop ~100% of attacks — but that's against a *static* list. When a researcher lets the
attacker *adapt* to the defense, the same defenses fail **over 90%** of the time. There is no standard, independent
referee that grades defenses under adaptive attack, so buyers can't tell real robustness from marketing.

**How it solves it.** You become the referee. Run adaptive attacks against every defense that advertises
robustness, and publish a dated A–F card grading the gap between what they *claim* (near-zero break rate on their
static test) and what actually holds up (break rate under adaptation) — an honesty score. Your credibility comes
from a position the big players can't copy: **you have no defense of your own to sell**, and every major red-team
tool is now owned by a security vendor with a conflict of interest. The clever technical add: also test whether the
*grading itself* can be gamed (a rigged referee is worthless), which is the genuinely unclaimed slice.

**What you'd build first (≤$500).** Confirmed doable on one rented GPU + a small open model with released attack
code: wrap an existing adaptive-attack tool into a fixed "attack budget," define the A–F rubric, publish a v1 card
grading ~10–15 defenses that claim robustness, and commit to re-running it. Add the "can the scoring be gamed"
check.

**Why it fits you / path.** Judging whether an injection succeeded is an LLM-as-judge task. This is a *proven*
hiring on-ramp — OpenAI acquired the eval company Promptfoo. **Hire** (founding upside is low here).

**How it could fail (the kill line).** Your authority depends on attacking *hard* — a ≤$500 solo can't attack as
hard as a well-funded lab, so a "B" grade might just mean "I didn't try hard enough." You mitigate by grading
against a *documented, fixed* attack budget so results are comparable. The edge ("no one has bothered to be the
neutral referee yet") also erodes once someone else does.

**Prior work → your delta.** The adaptive-attack *method* is already well-established (*The Attacker Moves Second*,
[2510.09023](https://arxiv.org/abs/2510.09023)) — you don't claim to invent it. The existing public leaderboard
(AgentDojo) is *static*. Your delta is the recurring, dated report card grading the *claim*, plus the
"is-the-referee-gameable" check. (A close sibling idea was already killed — scooped by a paper called LaunchSafe.)

**Human labeling.** 🟢 Mostly free and deterministic — AgentDojo decides injection success by comparing the
resulting environment state to a released attacker-goal state, no humans in the loop. You hand-label only a small
judge-validation sample (~4–7 hrs, reading tool-call traces — "was the money actually transferred?"), which is
general-technical, no security-research depth needed. A released 596-item human-labeled slice exists for the
grader-gaming (OracleProof) check.

**Publishability & effort.** Moderate novelty — the adaptive-attack method is *imported, not invented*; the
contribution is the standardized recurring graded protocol + grader-robustness. Workshop-solid (NeurIPS/ICLR
safety, SaTML) with a *living leaderboard* as the real credibility engine. **~6–9 part-time weeks.** Weakest null
in the set (a "defenses hold" result is confounded with a solo under-attacking). Direct, current hire signal
(OpenAI acquired Promptfoo in 2026).

---

## Honorable mentions (real, but second-tier for now)

- **MCP tool conformance checker** (score 77) — an open-source tool that runs published AI "MCP" tools and checks
  whether they actually do what they claim. Ships fast, elite credibility; the race is that a Microsoft OSS project
  is ~one feature away.
- **FieldDrop / FunctionalAltBench / Voice-Defense Grading Lab** — solid "build the measuring stick everyone must
  cite" artifacts for deepfakes-in-court, accessibility, and voice-fraud detection respectively. Each is a good
  publish-and-get-hired project but has a data-sourcing or someone-got-there-first cap that makes it weaker as a
  *founding* bet.

---

## How to choose

The four questions that actually decide it — and only you can answer the first:

1. **Which would you genuinely spend nights on?** Energy is the real tiebreaker; the scores are close enough that
   interest dominates.
2. **Hire vs found appetite?** If founding upside matters most: Ingestion Corruption Detector and PV-Grade keep the
   clearest path to a company. If a strong credential fast matters most: Reviewer Scrutiny Metric and Code-Review
   Bench are the cleanest, quickest wins.
3. **Fastest to a shipped artifact?** Ingestion Corruption Detector (~$50, CPU-only) and Reviewer Scrutiny Metric
   are the fastest to something public.
4. **Breadth?** The staged plan says run 2–3 in *different* areas. A natural trio: one document/RAG (Ingestion),
   one human-oversight (Reviewer Scrutiny), one safety/security (Multilingual Safety or Injection Report Card).

**Full paper drafts.** Each pilot now has a publication-grade **Introduction + Methods** written out (working
title, abstract, formalized method, metrics, human-validation procedure, statistics, and pre-registered
success/kill criteria) in [pilot-drafts/](pilot-drafts/) — detailed enough to run the study from, and doubling as a
pre-registration.

**Next step:** pick 2–3. For each, I'll run a final "has anyone already done exactly this" check on the combined
form, then write a one-page pre-registration (question · method · what counts as success · what makes you stop ·
cost · the public artifact) so you can start.
