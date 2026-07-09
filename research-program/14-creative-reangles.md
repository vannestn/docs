# Creative Re-angles — beating the kill-mechanisms, not accepting the kills

> **New here? Read [16 · Pilot candidates](16-pilot-candidates.md) instead — it explains the surviving
> ideas in plain English.** This document is the raw *research log* for the **business-shape engine**:
> for each real-but-unfoundable problem, it re-shaped the business around it to dodge the specific reason a
> solo couldn't build a company there, then adversarially killed the weak ones. It is deliberately dense
> and full of scoring/kill-mechanism shorthand (it's an audit trail, not a reader-facing summary). What
> a "shape" means: the business framing — what you make, who it's for, why they'd care. The readable
> synthesis lives in [doc 16](16-pilot-candidates.md).

*Written 2026-07-09. This is the creative-expansion round that follows
[13 · problem validation](13-problem-validation.md). That pass produced a hard, specific
result: **zero of eleven problems earned a clean CONFIRMED, and none died on being unreal.**
Every large, well-evidenced problem drew a landing **solo-founder** kill (KillB signal 4–5).
The pain was real; the *shape* was not foundable by this founder.*

The pivot this round makes explicit: **real ≠ foundable.** In problem-validation the two facts
travelled together only by accident of framing. A problem is real when the pain is primary-sourced and
someone bleeds. A problem is *foundable-by-this-founder* when a solo, part-time, ≤$500/study
researcher with an eval/reliability edge can build a defensible wedge against it. The gap between the
two is not the pain — it is a small set of **recurring kill-mechanisms** that fire on the *business
shape*, not the problem. So instead of accepting the kills, this round did two things: (1) took each
real-but-killed problem and **re-angled the shape** to attack the specific mechanism that killed it,
and (2) **hunted fresh problems chosen for foundable shape from the start.** Everything below was then
run through the same adversarial prior-work + solo-founder vetting as doc 13. The result is not a set of
clean founding companies — it is a ranked, honestly-caveated shortlist where the *lead* opportunities
beat their documented kill on a named axis, most land on the **hire** path with real founding upside,
and a few genuinely died in vetting.

## The seven kill-mechanisms (what we re-angled against)

These are the recurring disqualifiers extracted from doc 13's kill table. The re-angles are
constructed to beat one or more by name.

1. **Red-ocean / incumbent-bundled-free** — the fix ships free inside a platform (almost-right-code).
2. **Commoditized detection / public-good with no buyer** — the thing is easy to detect and nobody
   pays for hygiene (fabricated-citation).
3. **Payer ≠ sufferer** — the buyer pays for compliance/presence, not for the thing that actually
   helps the sufferer (alt-text usefulness).
4. **Procedural remedy / value accrues to expert labor** — the law fixes it with a rule and the money
   goes to humans billing hours, not to software (liar's-dividend / FRE 707).
5. **Enterprise/carrier-owned distribution** — the sufferer is unreachable except through an incumbent
   who owns the channel (voice-clone elder fraud → Pindrop/carriers).
6. **Standards-gated + liability-bearing buyer won't trust a solo** — the buyer needs an accredited
   number and won't take one from an unaffiliated individual (EU AI Act conformity).
7. **Per-domain labeled ground-truth moat needs capital** — the only real moat is human-labeled data
   at a scale a ≤$500 experiment can't reach (silent-ingestion).

The re-angle patterns that recur below, mapped to the mechanisms they attack: **sell the measuring
stick, not the fix** (beats 1, 5); **shift the payer to whoever eats the loss** (beats 2, 3); **use a
free structural ground-truth source** — XBRL identities, internal arithmetic, a document's own
redundancy (beats 7); **claim the number is *false* and *high*, so the regulated party wants it**
(beats 3, 6); **claim the defense *doesn't* hold, so you're on the winning side of the bet and the next
attacker is your ally** (beats a subtler "efficacy-unprovable" variant); and **own the neutral position
an incumbent structurally cannot occupy** without cannibalizing its own product (beats 1, 5).

---

## Ranked shortlist (vetted)

Composite is the vetting agent's 0–100 score. "Beats-kill?" names the specific documented
kill-mechanism the re-angle attacks and whether it lands. "Prior-work" is the scoop verdict from
adversarial search. Verdict is the final disposition.

| # | Title | Path | Comp. | Beats which kill? | Prior-work | Verdict | One-line |
|---|---|---|:---:|---|---|---|---|
| 1 | **PV-Grade** — PV decision-quality benchmark | hire (found upside) | 82.3 | **Inverts payer≠sufferer (3, 6):** the regulated party *wants* the number high & true as inspection evidence | Survives-with-delta (not scooped) | **PROMISING** | Benchmark the four liability-bearing pharmacovigilance decisions academics skip; sponsors under the FDA/EMA 2026 mandate desperately want a defensible number. |
| 2 | **MCP functional-contract conformance** | hire (found upside) | 76.9 | **Escapes red-ocean (1):** function layer sits in the seam security scanners left empty | Survives-with-delta (partly scooped) | **PROMISING** | OSS checker that executes MCP tools against schema args and judges output-vs-claimed-contract; the only cross-registry functional-truthfulness dataset. |
| 3 | **LedgerParity** — XBRL ingestion-fidelity authority | hire (found upside) | 74.6 | **Beats ground-truth-capital moat (7):** free SEC XBRL turns the labeler moat into a cron job | Survives-with-delta (partly scooped) | **PROMISING** | Auto-refreshing "numeric survival rate" leaderboard on free XBRL; ship the observatory, treat attestation as speculative. |
| 4 | **FieldDrop** — field-conditions media-auth error rate | hire (nonprofit floor) | 74.6 | **Beats procedural/expert-labor (4):** build the measuring stick every expert must cite, not the detector | Survives-with-delta (framing scooped) | **PROMISING** | Versioned per-condition FPR/FNR table for deepfake detectors under real degradation — the Daubert number that doesn't exist. |
| 5 | **AdaptiveEval / Kepler Report** — grade injection-defense claims | hire (nonprofit floor) | 73.1 | **Beats enterprise-owned distribution (5)** via structural neutrality no platform-captive tool can copy | Survives-with-delta (method scooped) | **PROMISING** | Recurring versioned report card grading defenses that claim robustness; you have no defense to sell, so you're the neutral party. |
| 6 | **VerifierBench** — neutral grader of RL reward channels | hire (found upside) | 71.5 | **Beats automation-complacency-one-layer-up:** measure the grader, forced buyer already pays | Survives-with-delta (measure scooped) | **PROMISING** | Independent verifier false-accept-rate red-team for RL post-training; private ever-growing exploit corpus as moat. |
| 7 | **Voice-Defense Grading Lab** | hire (nonprofit/found) | 71.5 | **Beats carrier-owned distribution (5):** Pindrop is the *customer* of a neutral grade, not the competitor | Survives-with-delta (~70% scooped) | **PROMISING** | Grade audio-deepfake *detectors* on phone-codec + elderly-speaker in-the-wild degradation; sell report cards to banks/insurers. |
| 8 | **FunctionalAltBench** — useless alt-text as litigable defect | hire (nonprofit floor) | 70.0 | **Attacks payer≠sufferer (3):** name payers for whom usefulness *is* the requirement | Survives-with-delta (not scooped) | **PROMISING** | Score whether alt-text conveys task-needed info, mapped to EN 301 549/ADA clauses so litigants/regulators become the payer. |
| 9 | **NumeriGuard** — self-supervised corruption detection | hire (found upside) | 68.5 | **Beats ground-truth-capital moat (7):** internal arithmetic redundancy *is* the free label | Survives-with-delta (partly scooped) | **PROMISING** | OSS numeric-integrity linter/gate needing no external ground truth; catches silent corruption RAGAS misses at zero labeling cost. |
| 10 | **Habituation Index** — reviewer scrutiny-decay metric | nonprofit (hire on-ramp) | 66.2 | **Beats "needs a budget line":** a standard needs *citers*, not a payer | Survives-with-delta (phenomenon scooped) | **PROMISING** | Own the canonical cross-domain "Scrutiny-Decay Rate" on public review logs; the nonprofit/hire counterweight to VerifierBench. |
| 11 | **Adaptive Loss Table** — actuarial layer for injection insurance | hire (found upside) | 63.8 | **Beats efficacy-unprovable (a variant of 6):** an insurer needs a decay *rate*, not a forever-defense | Survives-with-delta (partly scooped) | **PROMISING** | Sell insurers per-stack adaptive "survival curves" they legally must source externally; recurring by construction. |
| 12 | **PolyRefusal Certified** — per-language safety rating | hire | 60.8 | **Attempts standards-gate (6)** via GPAI systemic-risk track — but the escape doesn't hold | Survives-with-delta (packaging only) | **WEAK** | Signed A–F "Safety Parity Grades" for GPAI labs; the cert body dies, the parity-delta metric survives as a paper. |
| 13 | **Annex-IV-in-a-Box** — self-signable AI-Act evidence harness | hire | 54.6 | **Attempts liability-gate (6)** by changing who signs — but is commoditized and the deadline moved | Survives-with-delta (scooped by Venturalitica) | **PROMISING** (weak) | Open harness that emits Annex-IV evidence the *provider* signs; robustness + error-bars is the only surviving delta. |
| 14 | **Daubert-707 Citation-Support Standard** | hire | 53.1 | **Attempts procedural (4)** by moving to semantic support — but core is built and standard un-mintable | Survives-with-delta (core scooped) | **WEAK** | Legal citation-*support* error-rate standard; LePhantomCite already built the benchmark, the cert body is un-mintable solo. |
| 15 | **VeriTax / SubtleBench** — code-review catch-rate standard | hire | 49.2 | **Attempts red-ocean (1)** by being the scorer above the market — but the neutral slot is taken | KILL (scooped by Martian) | **DEAD** | Neutral catch-rate-vs-false-positive standard for AI code review — already built, adopted, and vendor-cited by Martian. |
| 16 | **Silent model-swap observatory** | hire | 39.2 | **Fresh "compounding-asset" shape** — but the moat runs backwards | KILL (fully scooped) | **DEAD** | Longitudinal cross-provider quality-drift time series — aistupidmeter is 2 years ahead, OSS, and licensing the identical thesis. |

---

## Survivors in detail

Every PROMISING opportunity below carries a real, adversarially-checked delta. All eleven landed on the
**hire** path as the honest primary disposition — a maturation of doc 13's finding, not a contradiction
of it. The re-angles genuinely beat the *documented* kill; what recurs in the vetting is that a *second*
kill (usually distribution, trust, or an adoption-gated moat) reappears at the new layer, capping the
founding path to "upside pending buyer discovery" rather than "clean company." That is the honest
state of the shortlist.

### 1. PV-Grade — decision-quality benchmark for AI in pharmacovigilance · composite 82.3

**Shape.** A public, FAERS-grounded + rule-based-gold benchmark scoring exactly the four
liability-bearing PV decisions academics skip — **causality, seriousness, expectedness, and
narrative-faithfulness** — with an honest leaderboard, then converted to a continuously-refreshed
*private held-out validation set* sold to sponsors/CROs as inspection evidence.

**How it beats the kill.** This **inverts the payer≠sufferer kill (3) and dodges the standards-gate
(6)** in one move. In DenialProof and the alt-text cases the payer wanted the reliability number *low
or absent*; here the FDA/EMA Good AI Practice guiding principles (2026-01-14) plus the context-of-use
credibility framework **legally compel** the regulated party to prove independent validation — with no
instrument existing. The sponsor wants the number *high and true* as defensible inspection evidence.
The ground truth is self-generable by a solo (FAERS gives free verbatim→MedDRA pairs; causality and
seriousness follow published WHO-UMC/CIOMS rules; faithfulness checks against source), which beats the
capital/labeled-data axis (7) the rest of the pool kept dying on.

**Solo-leverage moat.** Named-authority + a private held-out set in a vertical with a
legally-manufactured, accuracy-*wanting* buyer. The core research artifact is a near-verbatim extension
of his published RAG-hallucination-judge study (faithfulness = grounding judgment).

**Who pays / who suffers.** Pharma/biotech sponsors and CROs under the Jan-2026 mandate pay; patients
and sponsors suffer missed serious ADRs. PV-tech vendors (iVigee, Datacreds, Graph AI) sell workflow
tools, not an independent score — they are non-competing.

**Prior-work closest-match + delta.** *Robust or Suggestible?* ([arXiv 2510.13931](https://arxiv.org/abs/2510.13931))
is the closest — it touches all four decisions on FAERS, but as a demographic-robustness/bias study
with **no released benchmark and no headline honest-accuracy number.** Papers-with-Code lists **0
benchmarks / 0 datasets** for pharmacovigilance. CIOMS WG XIV (Dec 2025) deliberately declines to
standardize a benchmark, and vendor due-diligence literature
([IntuitionLabs](https://intuitionlabs.ai/articles/pharma-ai-vendor-due-diligence-checklist)) tells
buyers to *self-build* ~100-case test sets because none exists — the field names the absence. **Delta:**
build the FAERS-grounded rule-gold benchmark scoring these four decisions, publish an honest
leaderboard, convert to a refreshed private set.

**First ≤$500 / ≤6-wk experiment.** Ship the public FAERS-grounded leaderboard scoring the four
decisions as a preprint-with-code; validate the LLM-as-judge against a small human-labeled causality
set. Free data, single-model inference, well inside budget.

**Path.** **Hire-first** (near-perfect signal on his exact published skillset into PV-tech / vertical-AI
safety) **with real founding upside pending buyer discovery.** The residual risk to test before
betting on found: the moment an independently-scored system scores *low*, a signed "your PV AI is X%
wrong on causality" report is discoverable adverse evidence — a rational GC routes that through
privileged counsel, so "sponsors want the instrument to exist" may not extend to "sponsors pay a third
party to unburiably score their own system." Gold-label defensibility for causality (no universal gold
standard) and narrative-faithfulness is the hardest intrinsic research problem and caps the ceiling.

### 2. MCP tool functional-contract conformance · composite 76.9

**Shape.** A free OSS conformance CLI / CI-gate that executes published MCP tools against
schema-generated arguments and **LLM-judges the runtime output against the *claimed* functional
contract**, plus a public leaderboard and a hosted continuous-monitoring / trust-API tier —
accumulating the only cross-registry dataset of functional truthfulness.

**How it beats the kill.** It **escapes the red-ocean kill (1).** The obvious fundable angle
(security scanning) is genuinely crowded — 5+ shipped tools in H1 2026, so the field *feels* covered —
but the **functional-contract layer** sits in the exact unowned seam between security (taken), academic
description-quality snapshots, and app-level agent eval. The buyer of the data/hosted tier (registries
+ enterprises) is *not* the party being measured, escaping the neutrality trap.

**Solo-leverage moat.** The only continuously-updated cross-registry functional-truthfulness dataset —
a byproduct only adoption produces, not ownable by a scanner, academic, or insurer. Contract-checking
*is* grounding judgment: directly his LLM-as-judge craft. Distribution rides the pre-install / pre-merge
moment devs already fear.

**Who pays / who suffers.** MCP registry/gateway operators and enterprises pay for the trust signal;
agent developers suffer tools that silently don't do what they claim (170k+ tools, registries "make no
attempt to verify quality," 97.1% of descriptions carry a quality smell).

**Prior-work closest-match + delta.** `microsoft/mcp-interviewer`
([github](https://github.com/microsoft/mcp-interviewer)) is the closest OSS artifact — it *already*
executes tools and has experimental `--judge-tools` LLM evaluation, but is **per-server only** (no
cross-registry aggregation/dataset/leaderboard) and its judge is explicitly unvalidated. Static work —
DCIChecker ([arXiv 2606.04769](https://arxiv.org/abs/2606.04769)) and "Don't believe everything you
read" ([arXiv 2602.03580](https://arxiv.org/abs/2602.03580)) — checks description-vs-*code* statically,
security-framed, datasets internal. ToolGate ([arXiv 2601.04688](https://arxiv.org/pdf/2601.04688))
verifies output-vs-contract but *caller-side* (protect the caller), not registry-audit. **Delta:** the
fusion — dynamic execution + judge output-vs-*claimed* contract + a public cross-registry
functional-truthfulness leaderboard — is unbuilt.

**First ≤$500 / ≤6-wk experiment.** Wrap the CLI, run it across a few hundred public registry servers,
publish a short paper quantifying how many published tools fail their own contract, with the judge
calibrated against a ~7-hr human-labeled sample.

**Path.** **Hire / credibility wedge** (elite signal, and an OEM/acqui-hire target for
agent-security/eval vendors) **with founding as tuck-in upside.** The cap: `mcp-interviewer` is ~one
focused feature (cross-registry aggregation) away, so speed matters; the moat is adoption-gated; and the
realistic exit is absorption into an MCP-gateway suite, not a standalone company.

### 3. LedgerParity — free-ground-truth ingestion-fidelity authority · composite 74.6

**Shape.** An open benchmark + auto-refreshing public "ingestion-fidelity observatory" that turns
SEC-mandated Inline XBRL into per-cell machine-readable ground truth, computing a **"numeric survival
rate"** — what fraction of dollar/percent values survive an arbitrary ingestion pipeline intact vs the
XBRL-attested truth — hardening toward a parser-agnostic numeric-reconciliation layer.

**How it beats the kill.** It **beats the ground-truth-capital moat (7)** that killed silent-ingestion
in doc 13: XBRL gives free, forever-refreshing per-cell ground truth, so a capitalized incumbent's
human-labeler moat is matched by a cron job. The compounding asset (a multi-year longitudinal corpus of
real corruption incidents keyed to dollar-weighted truth) is uncopyable by a latecomer without waiting
the same calendar years.

**Solo-leverage moat.** The auto-refresh time-moat (a GitHub-Action cron that never staleness-decays)
plus a named, filing-specific metric. Uses his LLM-judge craft for ambiguous XBRL-alignment cases.

**Who pays / who suffers.** Audit / FP&A / IR / lenders and the financial-AI-assurance layer suffer and
would pay; the "500,000 pages, flattened tables, wrong revenue six weeks later" failure has a named
victim.

**Prior-work closest-match + delta.** The *core mechanism is precedented, not invented.* LEDGER
([arXiv 2606.13100](https://arxiv.org/html/2606.13100v1)) already routes every KPI through a
SEC-XBRL→yfinance→Alpha-Vantage waterfall with per-value provenance; the Multi-Agent Financial
benchmark ([arXiv 2603.22651](https://arxiv.org/pdf/2603.22651)) auto-pre-annotates ~60% of fields from
XBRL. Live numeric-accuracy parse leaderboards exist
([ParseBench](https://www.llamaindex.ai/blog/parsebench), SCORE-Bench, RD-TableBench,
[LongExtractionBench](https://www.micro1.ai/benchmark/long-extraction)) — but all are static,
human/VLM-labeled, general-domain. **Delta (defensible, incremental):** the fusion — *auto-refreshing*
XBRL-labeled + a named *numeric-survival-rate* metric + parser-agnostic reconciliation. The
attestation/liability business (the payer-capture claim) is the *least* defensible piece and should be
speculative upside, not the thesis — Reducto/Tensorlake/LlamaIndex/Workiva sit closer to it.

**First ≤$500 / ≤6-wk experiment.** Cron a GitHub Action over EDGAR XBRL, compute numeric-survival-rate
across a handful of open parsers/models on newly-filed 10-Ks, publish the auto-refreshing leaderboard.
Cheapest ship in the pool.

**Path.** **Hire-first** (fast, skill-perfect signal for financial-document-AI vendors and assurance
teams) **with a real longitudinal time-moat as found upside.** The cap: the headline "moat = cron job"
is a demonstrated method; the incumbents can fold an XBRL-reconciled fidelity score into their offering
the moment it gets traction (the "verticalized assurance gets absorbed" pattern from
[09-startup-lens](09-startup-lens.md)).

### 4. FieldDrop — field-conditions error-rate benchmark for media authentication · composite 74.6

**Shape.** A **versioned** field-conditions dataset with a per-method × per-condition error-rate table
(FPR/FNR with confidence intervals) for the real degradations that matter in court — phone-camera
capture, screen-recording, platform re-encoding/codec chains — mapped to the Daubert "known error rate"
prong, on a litigation cadence.

**How it beats the kill.** It **beats the procedural / expert-labor kill (4)** that sank
liar's-dividend-court in doc 13. It does *not* build a detector (unbuildable/unadmissible at ≤$500);
it builds **the measuring stick every detector and expert must cite** (picks-and-shovels), converting
the expert's labor from defending methodology-from-scratch to citing a standard. A detector vendor
can't self-certify (the first thing opposing counsel attacks), and NIST OpenMFC is a research
challenge, not court-cite-ready field-conditions rates on a litigation cadence.

**Solo-leverage moat.** Admitted-case citation lock-in + longitudinal per-model-generation sweeps +
unforkable neutrality; exactly his eval/data-pipeline skills.

**Who pays / who suffers.** Forensic examiners and expert witnesses ($300–750/hr, impeached on lab
numbers that don't hold in the field) and the litigants who rely on them; T&S / content-authenticity
teams.

**Prior-work closest-match + delta.** The **legal framing is scooped**: WJARR 2026 (Onyekwere et al.,
[doi:10.30574/wjarr.2026.30.2.1387](https://doi.org/10.30574/wjarr.2026.30.2.1387)) already maps
detector error rates to Daubert and builds a forensic-suitability scorecard — but as a *secondary
review* re-tabulating others' numbers, with **zero confidence intervals of its own, no released
dataset, not versioned, no primary field-degradation experiments.** Deepfake-Eval-2024
([arXiv 2503.02857](https://arxiv.org/abs/2503.02857)) releases in-the-wild data but reports aggregate
AUC only. **Delta:** the *primary, versioned, released* per-condition FPR/FNR-with-CI table as the
citable Daubert number — cite WJARR as motivation, don't reinvent it.

**First ≤$500 / ≤6-wk experiment.** Audio-first: per-condition error rates via ASVspoof + free
telephony codecs. (Honest caveat: audio codec-robustness is the *furthest* condition from courtroom
video and is partly covered by Speech DF Arena; the genuinely novel slice — video phone-capture /
screen-recording FPR/FNR — is harder and costlier.)

**Path.** **Hire artifact + nonprofit-standards floor with a speculative founding tail.** The caps:
institutional pre-emption (NIST OpenMFC / GenAI Forensics is the most citable Daubert source and can
occupy the neutral seat at any time — timing the solo doesn't control), and citation lock-in requires a
solo benchmark to actually be cited in an admitted Rule 702/707 ruling, a multi-year gatekept process.

### 5. AdaptiveEval Protocol + the Kepler Report — grade injection-defense claims · composite 73.1

**Shape.** An open defense-aware adaptive-evaluation harness + an **A–F "Adaptive Robustness Grade"**
rubric (keyed to the gap between a defense's reported static ASR and its measured adaptive ASR — an
honesty/overclaim metric) + a **recurring, dated, versioned public report card** that re-runs on every
new defense that claims robustness.

**How it beats the kill.** It **beats enterprise-owned distribution (5)** through structural
neutrality. Post-2026 every red-team tool is platform-captive (OpenAI owns Promptfoo, Check Point owns
Lakera, Snyk owns Invariant), which *widens* the neutrality gap — the Kepler Report's entire value is
having no defense to sell, structurally uncopyable by an incumbent (taking defense money destroys the
moat, a one-way ratchet). It also dodges an "efficacy-unprovable" variant: it claims defenses *don't*
hold (the winning side of the bet), so the next adaptive attacker is an ally.

**Solo-leverage moat.** Neutral identity + the honesty-metric rubric + a maintained cadence. Judging
whether an injection succeeded is itself an LLM-as-judge task — a direct hit on his craft.

**Who pays / who suffers.** Defense vendors and their buyers suffer false-robustness; AI-security eval
teams at the acqui-hiring firms (OpenAI/Promptfoo, Check Point/Lakera, Snyk/Invariant, Gray Swan) are
the hire buyers. OWASP GenAI / NIST CAISI are citation anchors.

**Prior-work closest-match + delta.** The **method is fully scooped** and is now field consensus — "The
Attacker Moves Second" ([arXiv 2510.09023](https://arxiv.org/abs/2510.09023)), "Adaptive Attacks Break
Defenses" ([arXiv 2503.00061](https://arxiv.org/abs/2503.00061)),
[OET](https://arxiv.org/abs/2505.00843), PIArena, AutoDojo. Do **not** claim to invent the protocol.
AgentDojo's live leaderboard (agentdojo.spylab.ai) is the closest recurring artifact but is *static*
(defenses post ~0% ASR — it actively launders the false-robustness this exists to correct). **Delta:** a
recurring, dated, versioned report card grading the *claim* (not raw ASR tables) with an A–F rubric — a
positioning/execution bet, not a scientific one. Notably, "The Attacker Moves Second" literally ends by
urging the community to build the recurring adaptive-evaluation layer it did not build.

**First ≤$500 / ≤6-wk experiment.** Confirmed sub-$500 (single H200 + Qwen2.5-7B, released code): wrap
OET into a fixed attack-budget spec, define the A–F rubric, ship a dated v1 grading ~10–15 defenses
that advertise robustness, commit to a re-run cadence.

**Path.** **Hire (proven on-ramp into eval-buying firms) with a nonprofit floor; founding upside low.**
The caps: authority is compute/reputation-gated — a ≤$500 solo fields weaker attacks than the RL/GD
frontier, so a "B" can mean "I didn't attack hard enough" (mitigated by grading on a documented fixed
budget). ETH SpyLab or a frontier group could stand up a maintained *adaptive* leaderboard cheaply; the
edge is "no one has bothered yet," which decays on first-mover.

### 6. VerifierBench — neutral grader of RL reward channels · composite 71.5

**Shape.** A benchmark + eval-as-a-service + **continuously-refreshed private reward-hack attack
corpus**, sold as a CI-gate / pre-run audit keyed to **verifier false-accept-rate (FAR) /
verifier-toxicity** to RL environment-builders and post-training labs. (Merges five near-identical
entries — VerifierBench, reward-hackability audit, reward-model meta-eval, verifier-toxicity CI,
verifier-hacking assurance — into one framing.)

**How it beats the kill.** It **beats automation-complacency one layer up** — the failure mode is the
automated *reviewer* (the RL verifier) rubber-stamping wrong output. Unlike the human version (doc 13's
automation-complacency, which had no budget line), reward-channel quality has a live budget *today*
(Surge/Scale reward-data QA), is machine-measurable and domain-agnostic (measure the grader, not the
human), and has exactly one throat to choke (the RL team owns the run). Payer = sufferer.

**Solo-leverage moat.** A private, continuously-refreshed adversarial corpus (Lakera-Gandalf playbook)
that a public benchmark can't copy, plus vendor-neutrality no environment-builder can claim. His
LLM-judge craft turned adversarial.

**Who pays / who suffers.** RL post-training and reward-data teams pay (they already fund reward-data
QA) and suffer silently-corrupted million-dollar runs (o3 reward-hacks 30.4% of RE-Bench runs; 28.5% of
SWE-bench-Verified tasks pass incorrect patches). Conflicted incumbents (Collinear, Proximal, Scale)
are the fast-follow threat and the acqui-hire buyer.

**Prior-work closest-match + delta.** The **measurement is scooped and shrinking fast.** Collinear.ai's
"Is your RL environment fair?" ([blog](https://blog.collinear.ai/p/is-your-rl-environment-fair-to-your))
already names verifier FP/FN audits — but it is a *conflicted vendor* grading its own homework. Two
mid-2026 papers directly measure verifier FAR: "Fuzzing RLVR Verifiers"
([arXiv 2606.01066](https://arxiv.org/abs/2606.01066)) and "Auditing Reward Hackability in Code RL
Environments" ([arXiv 2606.16062](https://arxiv.org/pdf/2606.16062)) — appearing within ~1 month of the
check. **Delta (business, not research):** neutral + continuously-refreshed *private* corpus + recurring
*CI-gate* keyed to FAR, cross-domain (math/tool-call/agentic, not just code). Do *not* frame it as
"first to measure reward hacking" — that's killed by ~8 papers + 2 benchmarks.

**First ≤$500 / ≤6-wk experiment.** Publish a public multi-domain verifier-FAR leaderboard over common
open verifiers (verifiers spec / Prime Intellect Environments Hub, SWE-bench, KernelBench, RE-Bench are
public attack surfaces), plus a seed corpus and methodology post positioned against conflicted vendors.

**Path.** **Hire (near-perfect signal for reward-data/post-training teams) with found upside.** The
caps: the surviving delta is a *business/trust* delta (BD + lab relationships Collinear/Scale already
have), the corpus-as-moat compounds with a team not a 15-hr/wk cadence, and the researcher's own
startup-lens rates the verifier-QA layer venture-viability 3 ("the most crowded, most-absorbed layer in
AI").

### 7. Voice-Defense Grading Lab — the Epoch/Moody's of anti-vishing detection · composite 71.5

**Shape.** An independent grading body + a versioned in-the-wild benchmark + a private held-out split +
degradation-report-as-a-service: independently grade audio-deepfake *detectors* on a **phone-codec +
elderly-speaker in-the-wild** benchmark and sell report cards to banks, insurers, and regulators who
must set thresholds.

**How it beats the kill.** It **attacks the carrier-owned-distribution kill (5)** head-on. Pindrop at
$100M ARR is the *customer* for a neutral grade, not the competitor, because a vendor can't credibly
grade its own detector — the FrontierMath / Leaderboard-Illusion scandals prove the market punishes
self-grading, and Epoch exists for exactly this. The neutral number a detector vendor structurally
can't self-certify becomes the product.

**Solo-leverage moat.** A continuously re-versioned private held-out split (holdout-as-moat) +
winner-take-one neutrality destroyed by taking any vendor's money. His LLM-judge + agreement-statistics
+ benchmark-verification craft is the whole job.

**Who pays / who suffers.** Banks/insurers setting thresholds pay; elders defrauded by voice clones
suffer (humans detect at ~60%, a 2026 study 37.5%; detectors lose ~43% out-of-distribution).

**Prior-work closest-match + delta.** **~70% scooped** by Podonos
([audio-dfd-benchmark](https://github.com/podonos/audio-dfd-benchmark)) — a self-described neutral
benchmark with a *private held-out split*, narrowband+wideband telephony tracks, commercial-detector
report cards, motivated by fraud/KYC. It lacks **elderly speakers**, **real in-the-wild vishing audio**
(it degrades clean TTS with synthetic codec passes), and the rating-agency business. Speech DF Arena
([arXiv 2509.02859](https://arxiv.org/abs/2509.02859)) is neutral but audio-only/no demographic;
Elderly-CodecFake/BONSAI ([arXiv 2606.21735](https://arxiv.org/abs/2606.21735)) is the first elderly
corpus but has no phone codec and builds a detector. **Delta:** the 3-way intersection — phone-codec ×
elderly speaker × in-the-wild fraud — fused into one versioned benchmark, plus the neutral grading-body
shape.

**First ≤$500 / ≤6-wk experiment.** Build from named public corpora (NCSU FTC calls, TeleAntiFraud-28k)
+ free ffmpeg/opus/AMR codec pipeline; grade a handful of detectors on elderly-speaker-over-phone-codec
degradation.

**Path.** **Hire-first (superb, high-stakes eval artifact) with a contested founding option and a
nonprofit floor.** The caps: top-down pre-emption (UK DSIT + NIST + INTERPOL/Five Eyes are building
operational detector evaluation); Podonos is one telephony update + one elderly corpus from closing the
space; and the most-defensible version (real recipient-side elderly vishing audio) is realistically
unobtainable solo on consent/wiretap grounds.

### 8. FunctionalAltBench — "effectively missing" alt-text as a litigable defect · composite 70.0

**Shape.** A preregistered, **task-anchored usefulness benchmark** — can a blind user complete the
actual downstream task from the alt-text alone (pick the right product variant, answer the news
question, act on the chart)? — plus an open eval and a **failure taxonomy mapped to EN 301 549 / WCAG
1.1.1 clauses** so each failure is litigable/auditable.

**How it beats the kill.** It **attacks the payer≠sufferer kill (3)** that killed alt-text usefulness
in doc 13 ("payer pays for compliance/presence, so generic text satisfies WTP"). It names payers for
whom usefulness *is* the requirement: plaintiff-side firms (must prove functional inaccessibility),
regulators (the FTC's $1M accessiBe fine proves they punish false-quality claims), and deployers
de-risking before suit — and damages/penalties scale with demonstrated user harm, binding payer WTP to
sufferer harm.

**Solo-leverage moat.** A task-anchored usefulness corpus tied to real litigation fact patterns +
preregistered validity (his RAG-judge ancestor + ICC/agreement rigor); the clause crosswalk is the
durable, compounding asset.

**Who pays / who suffers.** Plaintiff firms/regulators/de-risking deployers pay; blind/low-vision users
suffer alt-text that passes audits but is useless.

**Prior-work closest-match + delta.** **Not scooped** — the three ingredients exist separately, fused
by no one. Lundgard & Satyanarayan ([arXiv 2110.04406](https://arxiv.org/abs/2110.04406)) score
semantic *quality*, not task completion; Microsoft's "Alt text that informs" is a qualitative
preference framework with *no* WCAG/EN mapping; the PDF-accessibility benchmark
([arXiv 2509.18965](https://arxiv.org/abs/2509.18965)) tests *presence*. The recurring finding that
CLIPScore doesn't correlate with BLV judgments ([arXiv 2403.15604](https://arxiv.org/pdf/2403.15604))
is unexploited headroom. **Delta:** a task-completion metric bound to a clause-level EN 301 549 defect
taxonomy, positioned for the damages-bearing payer.

**First ≤$500 / ≤6-wk experiment.** Scope to one high-litigation domain (e-commerce product images +
charts), reuse existing image corpora, add a small BLV-anchored or task-rubric annotation pass, ship the
eval harness + legal crosswalk (reviewed by an accessibility-law expert to be litigation-credible).

**Path.** **Hire / nonprofit credential (the RegLab / Gerchick "Hallucination-Free?" archetype).** The
caps that keep it off the founding path: the ~3,000/yr US ADA suits run on cheap presence-based scans
that settle without a usefulness benchmark (thin, case-specific WTP); a de-risking deployer's commission
creates *discoverable* evidence it was non-compliant (adverse selection); and as of mid-2026 the first
EAA ruling ordered broad remediation, not a present-but-useless finding, so the damages-scaled payer
mechanism is asserted ahead of precedent.

### 9. NumeriGuard — self-supervised corruption detection with no external ground truth · composite 68.5

**Shape.** An OSS parser-agnostic **numeric-integrity linter / CI-gate** that exploits a document's
internal arithmetic redundancy (totals must sum, cross-refs must reconcile, net+tax=gross) as free
ground truth — plus a self-supervised-corruption-detection benchmark — catching silent corruption
RAGAS misses at zero labeling cost.

**How it beats the kill.** It **detonates the ground-truth-capital moat (7)** by refusing to need
ground truth at all: internal redundancy *is* the free label (validated for free against XBRL). Distinct
root-mechanism from LedgerParity (self-supervised detection vs XBRL-anchored grading), so both can
coexist. Installs in the buyer's own pipeline, reaching DIY stacks incumbents can't; the reliability-gate
framing dodges platform bundling.

**Solo-leverage moat.** A low-false-positive invariant library across document families + **the
calibrated judge that distinguishes real corruption from rounding/footnote exceptions** — exactly his
specialty and the hard, non-copyable craft.

**Who pays / who suffers.** Doc-AI/RAG reliability teams and finance/legal/healthcare RAG owners (a
flipped cell is liability); DIY stacks on pdfplumber/PyMuPDF that incumbents don't reach.

**Prior-work closest-match + delta.** The **core "arithmetic-as-free-label" mechanism is scooped.**
FinVerBench ([arXiv 2605.29586](https://arxiv.org/pdf/2605.29586)) is essentially the finance version —
self-supervised arithmetic-corruption benchmark from XBRL, 4-category/12-subtype perturbation taxonomy,
public code. Pulse AI ([runpulse.com](https://www.runpulse.com/blog/evaluating-document-extraction))
states NumeriGuard's exact RAGAS-misses-this thesis verbatim and has *promised* an OSS benchmark (the
biggest scoop risk to monitor). **Delta:** parser-agnostic/domain-general + a *shipped* OSS gate (not a
paper) + explicit RAGAS head-to-head. Drop any claim that arithmetic-as-free-label is new.

**First ≤$500 / ≤6-wk experiment.** Ship a PyPI/GitHub numeric-integrity linter over 2–3 document
families with a measured "RAGAS misses this" demo; validate the corruption-vs-rounding judge against a
small labeled sample.

**Path.** **Hire (near-perfect interview artifact for reliability/eval teams) with thin founding.** The
caps: novelty is the weak point (the free-label idea is scooped); the surviving delta is
packaging/DevX, provider-absorbable once published; and arithmetic redundancy only exists in numeric,
self-consistent documents — an important but *bounded* slice of silent corruption.

### 10. Habituation Index — reference metric for human reviewer-engagement decay · composite 66.2

**Shape.** Author and own the canonical **"Scrutiny-Decay Rate"** — a named, debiased, re-runnable
metric for how human error-catching collapses as auto-approval rises with tenure — plus an open
reference implementation and a *living, cross-domain* observatory (code PRs + RLHF labels).

**How it beats the kill.** A standard **beats the "needs a budget line" objection** on a different
axis than VerifierBench: it needs *citers*, not a payer, and domain-specificity becomes a licensed
*family* of instruments rather than a bug. This is the honest nonprofit/hire counterweight to
VerifierBench within the same root problem (automation complacency).

**Solo-leverage moat.** First-mover authorship of the citation + a continuously-updated multi-domain
observatory; his published-author + eval-methodology credibility is what makes a metric stick.

**Who pays / who suffers.** No one pays directly — eval-science/safety hiring managers (Anthropic
Societal Impacts, METR, UK AISI) and RLHF/annotator-QA leads are the audience; on the nonprofit floor it
is a citable instrument for EU AI Act Art. 14 human-oversight compliance.

**Prior-work closest-match + delta.** The **phenomenon is scooped.** "Habituation at the Gate"
([arXiv 2606.22721](https://arxiv.org/pdf/2606.22721)) already named it *habituation*, measured rising
approval + declining scrutiny with tenure on the public AIDev dataset (+14.5pp approval; −22% inline
comments; ρ=−0.556), released scripts, and proposed the same interventions. It does **not** define a
named canonical metric and is **code-only**. **Delta:** a formal, named, debiased *estimator*
(within-reviewer slope of scrutiny vs cumulative-review-index) generalized across code + RLHF into one
living observatory that *subsumes* the code-only result — cite Yu et al. as the code-domain
instantiation. Lead with the cross-domain observatory, not the name/AIDev, since latecomer
standards-ownership is the binding risk.

**First ≤$500 / ≤6-wk experiment.** Near-zero compute: compute the estimator identically on AIDev logs
*and* an RLHF/annotator-QA log set, publish the reference implementation + preprint.

**Path.** **Nonprofit / standard-setter (METR/BetterBench template) with a direct hire on-ramp;
explicitly not a venture** (founding-upside 1 — this is the deliberate nonprofit-floor breadth the
shortlist needs). The cap: a competent paper already owns the memorable name, domain, and headline
numbers, so the field may just cite Yu et al.

### 11. Adaptive Loss Table — actuarial data layer for AI-agent liability insurance · composite 63.8

**Shape.** A neutral adaptive-eval standard + a continuously-refreshed **longitudinal actuarial dataset
("Adaptive Survival Curves")** — time-to-first-adaptive-break under a defense-aware attacker, indexed
per agent × defense × model stack — sold to insurers/reinsurers as raw underwriting input.

**How it beats the kill.** It **beats the efficacy-unprovable variant of the trust-gate (6)** by
flipping it from bug to product: an insurer needs a calibrated decay *rate*, not a defense that holds
forever. The payer *is* the sufferer on one balance sheet (AIUC + Beazley writing up-to-$50M coverage in
2026), and by law must source the number externally — a distinct payer + distinct moat from Kepler
(which sells citation authority).

**Solo-leverage moat.** A multi-quarter longitudinal loss dataset only calendar time can build + carrier
trust that doesn't copy; every silent model update forces a re-measure the insurer buys again (recurring
by construction).

**Who pays / who suffers.** Insurers/reinsurers pricing prompt-injection risk pay and eat the claim;
MGAs/carriers (AIUC, Mount, Beazley) are the hire buyers.

**Prior-work closest-match + delta.** Every ingredient exists by mid-2026; the intersection does not.
The survival-curve *method* is public — "Quantifying LLM Safety Degradation… Using Survival Analysis"
([arXiv 2605.12869](https://arxiv.org/abs/2605.12869)) — so claim no method novelty. AIUC (AIUC-1, $15M
seed) is closest: neutral-ish standard + quarterly third-party red-team + insurance, but **pass/fail
controls certification, vertically-integrated MGA** — not a neutral horizontal data feed. Lakera b3
([b3.lakera.ai](https://b3.lakera.ai/)) is neutral but point-in-time, backbone-only, no insurance
framing. Insurance-framing papers ("Insurance of Agentic AI",
[arXiv 2606.05449](https://arxiv.org/abs/2606.05449)) explicitly ask for exactly this data ("public
evals are not actuarial loss experience") and supply none. **Delta:** adaptive survival curve +
stack-level indexing + neutral horizontal data-layer positioning + continuous refresh.

**First ≤$500 / ≤6-wk experiment.** Publish the first cross-stack adaptive prompt-injection survival
curves as preprint + open benchmark over AgentDojo defense stacks.

**Path.** **Hire (excellent signal into insurance-MGA/reinsurer emerging-risk units and eval-vendor
teams).** The caps that keep it off the solo-founding path: insurers won't buy a novel actuarial feed
from an unaffiliated solo (the carrier-trust moat is the one a solo is *worst*-placed to build — AIUC
needed ~$15M + Friedman/Mann + Orrick); AIUC can add a survival score and bundle it, starving a neutral
feed; and it's a two-sided cold-start (breadth of stacks × insurer trust).

---

## Killed in vetting

| # | Title | Verdict | Composite | Decisive reason |
|---|---|---|:---:|---|
| 12 | **PolyRefusal Certified** | WEAK | 60.8 | **Kill still applies + commoditized.** A solo-issued "certification" has no legal standing (the CoP leaves accreditation undefined; the AI Office has endorsed no pathway), so the standards-gate (6) escape fails; MLCommons AILuminate already ships per-language, per-hazard, per-named-model tiered grades and could add the parity framing "in one release"; only ~5–15 systemic-risk labs exist. The parity-delta *metric* survives as a paper (LSR/Refusal-Centroid-Drift already publishes it), not a cert body. |
| 13 | **Annex-IV-in-a-Box** | PROMISING (weak) | 54.6 | **Scooped + stale urgency.** The self-signable-harness concept is a near-exact match to the funded Venturalitica SDK (Apache-2.0, OSCAL + Annex-IV clause-mapped, arms-dealer positioning) and EuConform; the Aug-2026 urgency premise is factually dead (Digital Omnibus moved Annex-III to Dec 2027 / embedded high-risk to Aug 2028). The only surviving delta — robustness axis + error-bars/CIs + single-vertical depth + per-clause self-attest — is a methods contribution, not a company, and bundles four builds against a 6-week cap. |
| 14 | **Daubert-707 Citation-Support Standard** | WEAK | 53.1 | **Core artifact scooped + standard un-mintable.** Princeton's LePhantomCite ([arXiv 2606.21155](https://arxiv.org/abs/2606.21155), open dataset) already built the legal support-vs-existence benchmark from sanctioned filings with per-model error rates; the "dataset is the moat" claim is false (seed corpus is Charlotin's public DB). Daubert "general acceptance" is institutional and un-mintable at ≤$500; value accrues to expert-witness labor (procedural kill 4 still lands); FRE 707 doesn't bite until Dec 2027. Surviving as a fast on-methodology *hire paper* only. |
| 15 | **VeriTax / SubtleBench** | DEAD | 49.2 | **Neutral slot taken (red-ocean kill 1 still applies).** Martian's Code Review Bench (Feb 2026) already occupies the exact neutral-standard high ground — structurally neutral lab, fully OSS, 200k+ PRs, precision/recall, monthly-versioned, *already cited competitively by vendors* (Qodo, cubic, Baz, CodeRabbit), launch post titled "Towards Billion Dollar Benchmarks." The three residual differentiators (2D Pareto, adversarial synthetic corpus, attestation SKU) are individually small and fast-followable by the incumbent. Brand collision with KRAFTON's VLM-SubtleBench. |
| 16 | **Silent model-swap observatory** | DEAD | 39.2 | **Fully scooped; moat runs backwards.** AI Stupid Level / aistupidmeter (StudioPlatforms) has run a continuous cross-provider drift observatory since 2024 — named Canary Suite, CUSUM drift detection, 25+ models, licensing "2+ years of impossible-to-replicate time series" at $60K–$300K/yr with the *identical* thesis, and is open-source. A solo starting now *is* the "late incumbent" the pitch warns against; every layer of novelty (covert-swap detection, contamination-resistant eval, small-drift statistics, the root problem itself) is independently occupied. |

---

## What advances to the gated solution / pilot round

Five advance. All are hire-shaped in their primary disposition (the honest continuation of doc 13's
result), but they split cleanly by the *secondary* path where the founding/nonprofit upside actually
lives — which is how the next round should gate them.

**Founding-shaped (hire-first, real found upside — gate on buyer discovery):**

1. **PV-Grade** (comp 82.3) — the cleanest payer-inversion in the whole pool and the best hire signal on
   his exact published skillset. Gate: does a sponsor pay a third party to *unburiably* score its own
   system, or only want the instrument to exist?
2. **MCP functional-contract conformance** (comp 76.9) — the strongest of the MCP re-angles, ships
   fast, elite credibility wedge. Gate: ship before `mcp-interviewer` adds cross-registry aggregation.
3. **LedgerParity** (comp 74.6) — cheapest ship in the pool, real longitudinal time-moat. Gate: scope
   to observatory + reconciliation; treat attestation as speculative.

**Hire / neutral-authority-first (found tail is contested — carry as portfolio + watch):**

4. **VerifierBench** (comp 71.5) — near-perfect signal for post-training/reward-data teams; the found
   tail is a business/trust delta a solo seeds but can't compound alone.
5. **AdaptiveEval / Kepler Report** (comp 73.1) — proven acqui-hire on-ramp; neutral-authority artifact
   with a nonprofit floor.

**Nonprofit / standard-setter (deliberate impact-first breadth, explicitly not a venture):**

6. **Habituation Index** (comp 66.2) — carry *one* nonprofit-floor standard for breadth; it is the
   honest counterweight to VerifierBench and the charter's impact-first exception. (If the round wants
   only five, this is the swing pick — advance it *instead of* one founding-shaped item only if breadth
   is the priority.)

The remaining PROMISING survivors — **FieldDrop, Voice-Defense Grading Lab, FunctionalAltBench,
NumeriGuard** — are strong hire artifacts and nonprofit floors but each has a pre-emption or
data-sourcing cap that makes them second-tier for the *founding* gate; carry them as high-value
publish-and-get-hired candidates, not as founding bets.

## The single most surprising finding

**The re-angles worked on the exact axis they targeted — and it changed almost nothing about the path.**
Every lead opportunity genuinely *beats its documented kill*: PV-Grade inverts payer≠sufferer,
LedgerParity/NumeriGuard dissolve the ground-truth-capital moat with free structural labels, FieldDrop
converts an expert-labor problem into picks-and-shovels, Kepler/Voice-Defense/VerifierBench occupy a
neutral seat incumbents structurally can't. Yet **ten of eleven survivors still land on the hire path**,
because beating the *named* kill reliably exposes a *second* one at the new layer — almost always
**distribution or trust** (will the regulated party pay to be measured unburiably; will an insurer or a
court take a solo's number; can the neutral position be held before a funded incumbent copies it). This
is the sharper form of the wide pass's meta-lesson: the binding constraint for this founder is not
finding a real problem, nor even finding a foundable *shape* — it is that **the shapes which beat the
capital and payer kills are precisely the ones whose remaining moat is institutional trust, the one
asset a solo cannot manufacture at ≤$500.** The honest read is that the strongest move is not to found
against these directly but to **use the fast, cheap, skill-perfect artifacts to buy the trust** — get
hired or get cited into the seat, then found from inside it. The runner-up surprise: **two fresh
"foundable-shape" hunts (VeriTax, silent model-swap) died hardest of all** — chosen for shape, they were
already fully built and commercialized by funded incumbents, a reminder that "unhunted by our prior
catalogue" is not the same as "unbuilt by the field."
