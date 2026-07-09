# Problem Validation — the deep, evidence-vs-kill pass

*Written 2026-07-09. This document runs the thorough validation promised at the end of
[11b · expanded problem catalog](11b-expanded-problem-catalog.md). It replaces an earlier shallow
attempt that scored problems from a single angle and did not survive its own kill-check discipline.*

## What "thorough validation" meant here

The 11 problems carried forward from the wide-aperture pass were each run through **four independent
research agents**, produced blind to one another:

- **EVIDENCE — magnitude & reality:** how big, how present, how well-primary-sourced is the pain, and
  who bleeds. Scored 1–5 on strength-of-pain.
- **EVIDENCE — neglectedness, incumbents, buyer, why-now:** is anyone already closing it, is there a
  real buyer with willingness-to-pay, and is the timing forcing-function live. Scored 1–5 on
  neglected-AND-buyable.
- **KILL A (tailored):** the single sharpest disqualifier specific to that problem, argued
  adversarially from primary sources. Scored 1 (kill fails) to 5 (kill lands).
- **KILL B (solo-founder viability):** whether *this* founder — solo, part-time, ≤$500/study,
  eval/reliability edge — can actually win it, independent of whether the problem is real. Scored 1–5.

The scoring rule, applied strictly: **a problem earns CONFIRMED only if BOTH kills fail (≤2) AND the
evidence is strong (magnitude ≥4 and a real buyer exists).** A strong problem whose solo-founder kill
lands is **QUALIFIED** — real and worth carrying, but only in a scoped/reframed form or on a
non-founding exit path. A problem where the tailored kill lands, or the premise itself proved false,
is **KILLED** for the framing as stated (often with a smaller residual noted).

The headline result: **zero of the 11 earn a clean CONFIRMED.** Every problem that is large and real
also drew a landing solo-founder kill (signal 4–5) — the wide pass's own meta-lesson ("importance is
highest exactly where the founder's leverage is lowest") reproduced under adversarial pressure. What
survives is a set of **QUALIFIED** problems whose value is real but concentrated in a *scoped
measurement/eval wedge* on the **hire** or **nonprofit** path, plus two problems whose home-turf
reframing is strong enough to be the lead carry-forwards.

---

## Verdict summary

Signals below are the raw agent scores (1–5). "Mag" = magnitude/reality. "N+B" = neglectedness+buyer.
"KillA" = tailored disqualifier. "KillB" = solo-founder viability. Higher kill = stronger kill.

| Problem | Mag | N+B | KillA | KillB | Verdict | Conf |
|---|:---:|:---:|:---:|:---:|---|---|
| **automation-complacency** (review-gate vigilance decay) | 5 | 3 | 1 | 4 | **QUALIFIED** — hire/measurement | high |
| **silent-ingestion-corruption** (RAG parse fidelity) | 5 | 4 | 2 | 4 | **QUALIFIED** — found(narrow)/hire | high |
| **prompt-injection-undefended** | 5 | 3 | 3 | 5 | **QUALIFIED** — hire (adaptive-eval) | high |
| **non-english-safety-parity** | 3 | 4 | 2 | 5 | **QUALIFIED** — nonprofit/hire | med |
| **almost-right-code-tax** | 5 | 2 | 2 | 5 | **KILLED** for founding — hire | high |
| **fabricated-citation-contamination** | 5 | 2 | 4 | 5 | **KILLED** — residual niche | high |
| **liars-dividend-court** | 3 | 3 | 2 | 4 | **KILLED** for founding — hire/watch | med |
| **ai-alt-text-usefulness** | 4 | 2 | 2 | 5 | **KILLED** for founding — nonprofit | med |
| **voice-clone-elder-fraud** | 4 | 2 | 2 | 5 | **KILLED** for founding — nonprofit/hire | med |
| **euaiact-no-means-to-comply** (deployer) | 4 | 2 | 2 | 5 | **KILLED** as framed | high |
| **low-resource-reliability-vacuum** | 4* | 2 | 4 | 5 | **KILLED** — premise stale | high |

\* magnitude of the *underlying* pain is real, but the literal "no benchmarks exist" premise is false.

**Reading the table:** the three problems where the tailored kill *failed* and magnitude is 5
(automation-complacency, silent-ingestion, prompt-injection) are the genuine survivors — but all three
drew a landing solo-founder kill, so none is a clean founding company; they advance as
**hire-shaped / narrow-wedge** carries. non-english-safety-parity advances on the **nonprofit/hire**
path despite a maximal solo-founder kill, because the tailored "labs are closing it / can't measure it"
kill *failed* and the measurement artifact is genuinely founder-executable and impact-first.

---

## Problem-by-problem

### 1. automation-complacency — reviewers rubber-stamp AI output; "a human approved it" becomes theater

**Verdict: QUALIFIED (hire / measurement-artifact). Confidence: high.**

**Quantified reality (mag 5).** This is one of the best-evidenced pains in the set, converging from
controlled experiments, a systematic review, government incident findings, and production telemetry.
Radiology: experienced radiologists' accuracy fell 82% → 45.5% when an AI gave a wrong BI-RADS
suggestion (Dratsch, *Radiology* 2023, n=27), a near-halving of expert accuracy from a bad hint;
a 2026 *Eur Radiol* replication confirms the effect across all experience levels. E-prescribing:
incorrect clinical decision support raised total prescribing errors 86.6% (n=120). The classic
literature (Parasuraman/Manzey; Goddard *JAMIA* 2012, 74 studies) shows omission errors 41–55% under
automation failure vs ~3% unaided, and that **training does not prevent it**. Real-world: Michigan
MiDAS wrongly accused ~40,000 people at a ~93% error rate with humans nominally in the loop ($20M+
settlement); NTSB's 2020 Tesla-fatality finding names over-reliance explicitly. Anthropic's Feb-2026
production data (millions of sessions) shows the signature of a *durable structural* problem, not a UX
bug: full auto-approve rose from ~20% (<50 sessions) to >40% (~750 sessions), interventions/session
fell 5.4→3.3 over five months.

**Neglectedness / buyer (N+B 3).** The specific job — *measure whether a reviewer is genuinely engaged
vs rubber-stamping* — is genuinely unsolved as a product; every practitioner and academic source treats
it as open (the 30+-author "Keeping an Eye on AI" framework lists effectiveness-measurement as an OPEN
challenge). But two funded categories are one product-cycle away: AI-governance GRC (Credo AI ~$42M
raised; Holistic AI; OneTrust) and LLM-observability (LangSmith, Arize, Braintrust) already store
per-reviewer approve/override span-events. The regulatory forcing function (EU AI Act Art. 14) slipped
~18 months (Digital Omnibus: high-risk Annex III → 2 Dec 2027), softening near-term budget urgency.

**Kill A — "it's handled by design / it's a training-UX issue" — FAILED (signal 1).** The strongest
kill in the set to *fail*. Every candidate design fix is documented to reduce-but-not-eliminate:
cognitive forcing functions "did NOT completely eliminate overreliance" and the most effective designs
were "preferred less, trusted less" and only helped high-Need-for-Cognition users (Buçinca/Gajos CSCW
2021, N=199). Training/expertise is empirically insufficient (Dratsch). Dual review fails because AI
errors are correlated and reviewers share blind spots. Laux & Ruschemeier (EJRR forthcoming) argue
Art. 14's awareness mandate "does not adequately address design and context as causes" of automation
bias. A 17-author consensus (Oxford/Cambridge/Stanford/OpenAI/UK-AISI, 2025) calls overreliance
measurement an open, central research problem. The durability of the problem is beyond dispute.

**Kill B — solo-founder viability — LANDS (signal 4).** The disqualifier is structural, not about
durability. (1) Human oversight is *not sold standalone* by any vendor — it is a checkbox absorbed into
GRC/governance/runtime platforms, so there is no existing budget line. (2) Art. 14(4)(b) requires
providers to *"enable awareness"* of automation bias — a capability/input mandate with no
measured-outcome enforcement trigger; a training slide and a paragraph in the instructions-for-use
discharge it. (3) The liability split (provider designs oversight capability; deployer operates it)
means a horizontal third-party tool has no clean owner. (4) Automation bias is domain-specific
(radiology vs loan-underwriting vs legal differ), defeating a horizontal solo play and demanding
regulated-vertical trust/references a solo lacks. The honest residual: a narrow measurement
point-solution (log review-time-per-item, override rate, divergence cases) for one vertical's
deployers — but incumbents in the account can add those metrics trivially, capping it at a feature.

**Sharpened statement:** *There is no validated way to measure whether a human reviewer of AI output is
exercising real judgment vs symbolically rubber-stamping — and the decay worsens with tenure.*

**Surviving slice + fit.** The durable, unowned core is a **measurement discipline**: a
vigilance/engagement metric (override rate, dwell-time, agreement-drift) validated as actually
predicting caught vs missed errors. This is squarely the founder's eval craft and ≤$500-runnable on the
**RLHF/data-labeler-QA buyer** (present-tense pain, no regulatory wait: annotation noise routinely
>20%). Not a defensible standalone company for a solo; a strong **publish-and-get-hired** artifact and a
partner-into-observability/GRC feature.

---

### 2. silent-ingestion-corruption — PDF/table→text mangles meaning before the LLM; RAG eval stops at retrieval

**Verdict: QUALIFIED (narrow founding / hire). Confidence: high.**

**Quantified reality (mag 5).** Both halves hold up on peer-reviewed primaries. Ingestion silently
degrades accuracy: OHR-Bench (ICCV 2025; 350 PDFs / 4,012 pages / 6 domains) isolates ingestion and
finds even the best OCR (MinerU) causes semantic noise producing **~50% F1 drop on table-related
questions**, ~11% absolute retrieval loss, and concludes "none is fully capable" of building a
high-quality RAG knowledge base. "Lost in OCR Translation?" (DocEng '25) measures the downstream hit at
**23.6 points** (67.6% correct on standard OCR vs 91.2% with perfect text). OmniDocBench (CVPR 2025)
shows SOTA parsers fail real tables (LlamaParse TEDS 0.38 on side-by-side). Half two: RAGAS — the
dominant RAG-eval framework — measures only retrieval (context precision/recall) and generation
(faithfulness/answer relevancy); it treats the *retrieved context as ground truth*, so a table mangled
at ingestion passes faithfulness (the LLM faithfully echoes garbage) while the answer is wrong. The
eval blind spot is confirmed by the framework's own metric taxonomy. Who bleeds: finance/legal/
manufacturing/healthcare RAG, where a flipped cell is liability.

**Neglectedness / buyer (N+B 4).** Strongest buyer picture in the set. Reducto crossed $1M ARR with 4
employees and raised $108M ($75M a16z Series B, Feb 2026) — hard proof this buyer pays for ingestion
reliability. >85% of enterprise RAG pilots never reach production. The specific whitespace is a
**parser-agnostic ingestion-corruption eval layer** ("did this number get silently corrupted,
regardless of which parser you used?") — no product sells this as its core; it sits between parsing
vendors (who sell "use our parser") and RAG-eval (which stops at retrieval).

**Kill A — "multimodal-native ingestion designs away the conversion step; parsers own quality" —
FAILED (signal 2).** Native PDF ingestion still tokenizes pages as images (~1,500–3,000 tokens/page),
uneconomic at corpus scale, so the 2026 production pattern *keeps* an explicit conversion step. Going
multimodal doesn't remove silent corruption — it relocates it (VLMs "hallucinate content when
information is missing," Gemini-1.5 OCR ~50% on Finance/News). And vendors own *parsing*, not
*ingestion-error measurement in the RAG loop* — even a parser vendor's own blog calls parsing "far from
a solved problem" with "a massive long tail."

**Kill B — solo-founder viability — LANDS (signal 4).** Procurement is bundled at the platform layer,
not standalone; the eval benchmark is free AND declared *saturated* (OmniDocBench: GLM-OCR 94.6%);
Ragas (free OSS) is bundled into funded eval platforms; incumbents are heavily funded and
vertically-entrenched with SOC2/HIPAA (Reducto $108M / >1B pages; Unstructured $65M / ⅓ of the Fortune
500 / permanent free tier). The real moat is **per-domain labeled ground truth**, which needs human
reviewers and capital, not a ≤$500 experiment.

**Sharpened statement:** *RAG evaluation treats ingested text as ground truth, so silent
parse/OCR corruption of tables and numbers is structurally invisible until it surfaces as a wrong
answer — and no parser-agnostic tool audits ingestion fidelity in production.*

**Surviving slice + fit.** The one survivable lane both kills concede: pick **one regulated vertical /
document type** (e.g., a specific insurance or clinical form), hand-label ground truth, and sell a
**parser-agnostic ingestion-QA / corruption-flagging layer** — measurement-first, continuous, plugged
into the buyer's existing pipeline (including DIY pdfplumber/PyMuPDF stacks). This is the best
**founding-shaped** carry in the set for this founder, precisely because it maps onto his published
RAG-hallucination work and the buyer demonstrably pays — but only if he abandons the horizontal framing
and acquires vertical ground truth.

---

### 3. prompt-injection-undefended — any ingested text can hijack a tool-using agent; no robust fix

**Verdict: QUALIFIED (hire — adaptive-evaluation artifact). Confidence: high.**

**Quantified reality (mag 5).** Corroborated across four evidence types. A 272,000-attack public
competition (arXiv 2603.15714; 13 frontier models) produced 8,648 successful attacks and found **all
models vulnerable** (ASR 0.5%–8.5%), with universal strategies transferring across model families —
"fundamental weaknesses in instruction-following architectures." Production CVEs: EchoLeak
(CVE-2025-32711, CVSS 9.3) — zero-click M365 Copilot data exfiltration; GitHub Copilot RCE, Cursor
CurXecute/MCPoison. Vendor admissions: Anthropic — browser-agent hijack 31.5% pre-safeguard → ~1% post,
but "No browser agent is immune"; OpenAI (Dec 2025) — "unlikely to ever be fully solved." OWASP ranks
it LLM01 for the third straight edition. The best principled defense (DeepMind CaMeL) gives provable
security on only 77% of AgentDojo tasks.

**Neglectedness / buyer (N+B 3).** The *technical* premise is true; the *market* premise ("neglected")
is false — this is one of the hottest corners of cybersecurity. Lakera → Check Point (~$300M, Nov 2025);
Prompt Security → SentinelOne (~$250M); Promptfoo → OpenAI (Mar 2026); Noma $132M; Palo Alto absorbed
Protect AI. A solo building "a prompt-injection defense product" enters a knife fight against $100M+ war
chests. **The one genuinely neglected, non-proprietary slice** is *adaptive / defense-aware evaluation*:
"The Attacker Moves Second" (arXiv 2510.09023, OpenAI+Anthropic+GDM authors) bypassed 12 published
defenses — with near-zero *static* ASR — at **>90% adaptive ASR**; the field "lacks a standardized,
independent, defense-aware adaptive protocol." Adjacent work (arXiv 2606.26479) ran on a single H200 +
7B open agent, i.e. plausibly ≤$500-reproducible.

**Kill A — "crowded + being absorbed by providers; no room" — PARTIAL (signal 3).** The *crowding* half
is real for enterprise runtime-guardrails (do not build another Lakera). The *absorbed/no-room* half
fails: the bought defenses largely don't work (>90% adaptive bypass), OpenAI/Brave call the problem
architecturally permanent, and the primary benchmark (AgentDojo) is maintained by an *independent*
academic lab (ETH SpyLab). Provider acquisitions of eval startups (Promptfoo) prove hiring demand for
exactly this skill.

**Kill B — solo-founder viability — LANDS for founding (signal 5).** Value has consolidated into
platforms; buyers are actively de-prioritizing point tools (IDC Dec-2025: 84% platformizing); effective
defense needs native model-level access + continuous adaptive red-teaming (Google's Gemini-defense
paper); and efficacy is *unprovable* for a solo — any static defense is broken by the next adaptive
attacker (Carlini/Tramèr, arXiv 2502.02260), and validating durability needs red-team scale a solo
lacks. The concession: an eval/red-team *product* into one vertical caps ~$1–3M ARR and is best-case
acqui-hire.

**Sharpened statement:** *Published prompt-injection defenses report near-zero attack success on static
benchmarks yet fall to >90% under adaptive attack, and there is no standardized, independent,
defense-aware adaptive evaluation protocol across systems, attack families, and models.*

**Surviving slice + fit.** Not a company for this founder, but an **excellent hire-shaped artifact**: a
sharp, reproducible **adaptive / defense-aware evaluation harness** (a "MITRE-ATT&CK-for-prompt-injection
defenses") or an MCP-tool-output-injection benchmark. Cheap, high-signal, and a proven route into the
exact firms buying eval teams. Reframed as the "get hired" goal, KillB's own author drops this to ~3.

---

### 4. non-english-safety-parity — safe answer in English, dangerous answer in a low-resource language

**Verdict: QUALIFIED (nonprofit / hire). Confidence: medium.**

**Quantified reality (mag 3).** Historically severe and still present, but bifurcating fast — which
caps magnitude. Canonical result (Yong et al., ICLR 2024): translating harmful prompts into
low-resource languages made GPT-4 comply 79% of the time vs <1% English. Still present on open-weight
models in 2026: harmful-refusal collapses 87.9% → 43.9% high→low-resource (arXiv 2606.01196); TukaBench
shows GPT-4o direct-prompt ASR rising 3% (English) → 20–22% (Yoruba/Amharic). **But** the very newest
flagships have largely closed the gap (a 2026 multi-model study reports only a 2.3pp low-vs-high gap,
with GPT-5.2 / Claude Opus 4.5 showing *negative* gaps). So the durable pain concentrates in
open-weight/self-hosted models and truly long-tail languages — exactly where the Global South deploys.
Structural root cause is well-evidenced: 78.5% of surveyed safety datasets are English-only.

**Neglectedness / buyer (N+B 4).** Bifurcated. The research/benchmark layer is *saturated* (LinguaSafe,
PolyGuard, IndicSafe, SomaliBench, RabakBench, MLCommons — 5+ new benchmarks in 2025–26); a new generic
benchmark is low-differentiation. The **operational** layer is thin: production guardrails that hold
refusal parity in low-resource languages barely exist (Llama Guard 3 covers 8 high/mid-resource
languages; incumbent Lakera itself calls multilingual moderation "one of GenAI's most overlooked
vulnerabilities"). Why-now: the EU AI Act GPAI Code of Practice (effective Aug 2025) requires
systemic-risk evals across "all major European languages and other languages supported by the model."
Non-dilutive funding exists (UK AISI, Frontier Model Forum AI Safety Fund).

**Kill A — "labs are closing it fast; can't measure it without native teams" — FAILED (signal 2).**
The kill's own author tried hard and both prongs failed. Prong 1: the GPT-5 system card (Jan 2026) has
*no* language-disaggregated safety metrics; Claude Opus 4.6 has no dedicated multilingual safety
section — labs aren't even transparently *measuring* it. Independent 2026 work still finds large gaps
(West African refusal 100% English → 30–45% in-language; IndicSafe cross-language judgment agreement
12.8%; "The Multilingual AI Gap Is Not Closing, It Is Being Rebranded"). Prong 2: solo/tiny-team
benchmarks already exist (SomaliBench is single-author) — ~100 native-verified prompts across a few
languages is reachable within ≤$500 via community translators. A genuine sub-finding *reframes* rather
than kills: LLM-as-judge is measurably unreliable in low-resource languages, so a reliable low-cost
measurement method is itself a research contribution.

**Kill B — solo-founder viability — DISQUALIFIES for founding (signal 5).** No recurring solo buyer
(red-teaming is only ~4.5% of AI-safety funding; multilingual safety is not a named funded category);
the real buyers (frontier labs) source through Scale/Appen/Surge and demand vetted native-SME networks +
security infra a solo can't mint; the canonical artifact (a benchmark) is produced free by governments/
academics (RabakBench by GovTech Singapore); and the crude jailbreak is "largely patched on frontier
models." As a *company*, disqualified.

**Sharpened statement:** *Frontier labs do not publicly measure per-language safety parity, and
open-weight/long-tail-language models still give dangerous answers in a native language that they refuse
in English — the harm is concentrated on populations with the weakest recourse.*

**Surviving slice + fit.** The tailored kill failing is what keeps this alive: a **reliable, low-cost,
LLM-judge-robust measurement method for a specific under-covered language cluster** (one the founder or
a community collaborator can natively verify) is high-importance, high-neglectedness, and
≤$500-executable. This is the archetypal **impact-first / publish-and-get-hired / grant** artifact the
charter's third path exists to protect — not a founding company.

---

### 5. almost-right-code-tax — AI code looks right, isn't; review is slower than for human code

**Verdict: KILLED for founding (advance as hire). Confidence: high.**

**Quantified reality (mag 5).** Arguably the best-documented pain in the AI-dev space — the problem
statement is almost verbatim a 49k-developer survey line. Stack Overflow 2025 (n=48,916): the #1 AI
frustration, cited by **66%**, is "AI solutions that are almost right, but not quite"; 45.2% cite
debugging AI code as more time-consuming; trust inverted (32.7% trust vs 45.7% distrust). METR's RCT
(arXiv 2507.09089) is the gold-standard causal anchor: AI made 16 experienced OSS devs **19% slower**
while they believed they were 20% faster — a ~40-point perception/reality gap driven by
reviewing/cleaning almost-right output. Sonar (n=1,149): 96% don't fully trust AI code; 38% say
reviewing it takes *more* effort than reviewing a human's. Apiiro: AI shifts errors from obvious
(syntax −76%) to subtle (privilege-escalation paths +322%) — the core of the "looks right" pain.

**Neglectedness / buyer (N+B 2).** The buyer is airtight but the category is a red ocean, the *opposite*
of neglected: CodeRabbit ($60M Series B, $550M valuation, ~$40M ARR / +700% YoY, 8,000+ paying
customers); Qodo ($120M total, explicitly selling "code verification"); Greptile ($25M, Benchmark-led);
plus GitHub Copilot code review shipping the fix **bundled free** into ~2.4M Copilot Business seats. The
exact "looks-right-but-subtly-wrong" framing is the marketing copy of $500M+ companies.

**Kill A — "tools are absorbing it / the problem is shrinking" — FAILED (signal 2).** The "shrinking"
claim is falsified: the tax *grew* as models improved (METR; Cursor's own BugBot postmortem: "as coding
agents became more capable, we found ourselves spending more time on review"; one 2026 survey shows
review time 11.4 h/wk now exceeds writing 9.8 h/wk). Even top models leave ~⅓ of review bugs untouched.
The kill only supports the *crowded/feature-shaped* half — a GTM caveat, not proof of absorption.

**Kill B — solo-founder viability — DISQUALIFIES for founding (signal 5).** The pain has crystallized
into "AI code review," owned by the three actor-types a solo cannot outrun: IDE/platform vendors bundling
free (GitHub/Cursor/Anthropic), heavily-funded pure-plays, and a trust moat that is a step function
(>30% false positives → devs triage with suspicion; SonarSource's 3.2% FP took years of tuning over
137M issues). Thin margins ($1–1.50 inference per run), horizontal scope, and a small already-split TAM
(~$420M ARR in 2026). A ≤$500 solo enters last.

**Sharpened statement:** *AI generates code that passes a glance and compiles but is subtly wrong, so
the bottleneck moved from writing to verifying — and verification capacity did not scale.*

**Killed because:** real and worsening, but a consolidating, incumbent-bundled, capital-gated red ocean
with no solo wedge. **Advance only as hire:** deep demonstrated expertise in this exact pain (e.g., a
neutral benchmark of subtle-logic catch-rate vs false-positive noise — the one thing the space lacks a
trusted measure of) is highly hireable at any funded player.

---

### 6. fabricated-citation-contamination — fabricated references pass review, poison the permanent corpus

**Verdict: KILLED (residual semantic-verification niche). Confidence: high.**

**Quantified reality (mag 5).** Large, accelerating, three-blast-zone, primary-sourced. Scholarly
corpus: two independent 2026 studies converge — a 111M-reference audit estimates ~147k hallucinated
citations in 2025 (arXiv 2605.07723); *The Lancet* (CITADEL) directly confirms ~4,000 fabricated
citations, a **6× rise** (1-in-2,828 in 2023 → 1-in-277 in early 2026). Peer-review penetration:
26.2% of accepted NeurIPS and 34.9% of USENIX 2025 papers carried ≥1 hallucinated reference, with
reviewer scores *unaffected*. Legal: Charlotin's database tracks >1,000 US court decisions citing
AI-hallucinated material, sanctions escalating ($110k Oregon, May 2026).

**Neglectedness / buyer (N+B 2).** The core detection task (does this reference *exist*?) is
commoditized — a DOI/metadata lookup against free public DBs (Crossref, OpenAlex, PubMed, Semantic
Scholar), with 8+ commercial checkers (Citely, SwanRef-free, CiteMe), a Microsoft-CTO open-source
project (RefChecker, MIT-licensed), and the publisher buyer channel already captured by infrastructure
players (Digital Science + Silverchair's Dimensions Author Check in 9,000+ journal sites; STM Integrity
Hub screening 125k papers/month).

**Kill A — "publishers/reference managers/plagiarism tools already catch this; it's diffuse" — LANDS
(signal 4).** Existence-checking is commoditized (no data moat; free public DBs; free tools). Covered at
every layer (Springer Nature flagged ~25k papers; Paperpal ships it with distribution to 5M+
researchers; Zotero plugins validate DOIs). And the "poison the corpus" framing is diffuse: base rate is
0.56% and there is no single buyer for corpus hygiene — it is a public good, not a product.

**Kill B — solo-founder viability — DISQUALIFIES (signal 5).** Commoditized core with no moat;
saturated with mostly-free tools serving a no-budget base (grad students); paying buyers (publishers)
own the channel and build in-house; and the one defensible version — cleaning the *training corpus /
downstream retrieval* — requires inside access to a frontier lab's pretraining/decontamination pipeline
that a ≤$500 solo cannot reach.

**Sharpened statement:** *Fabricated citations survive peer review into the permanent record and
downstream training corpora, but the only unsolved part — semantic verification that a real reference
actually supports the claim — has no buyer a solo can reach.*

**Killed because:** both kills land and the buyer premise fails. **Residual worth noting:** *semantic*
citation verification (real references that misrepresent their source; retraction propagation;
paper-mill citation rings) is genuinely under-solved (CiteAudit shows SOTA LLMs fail at claim-support)
— but it is technically hard, close to the same incumbents, and still lacks a solo-reachable buyer.
A nonprofit/publishable prevalence-audit artifact remains possible; a company does not.

---

### 7. liars-dividend-court — authentic audio/video dismissed as "a deepfake"; burden flips

**Verdict: KILLED for founding (advance as hire/watch). Confidence: medium.**

**Quantified reality (mag 3).** The *mechanism* is strongly evidenced (Schiff et al., *APSR* 2024,
n=15,287: false "it's misinformation" claims cut scandal opposition ~10–12 pts) — but crucially the
effect was **strong for text and negligible for video**, undercutting the "authentic AV evidence gets
dismissed" framing. The *courtroom* manifestation is real but low-volume and mostly anticipatory: the
Berkeley Tech Law Journal survey (Jun 2025) concludes "very few cases so far have been impacted," and in
nearly every documented instance (Reffitt, Huang v. Tesla, Rittenhouse) the deepfake defense **failed**.
Judicial anxiety is real and rising (Forbes Dec 2025: judges "not ready"); the more common 2025 failure
mode is fabricated evidence being *submitted* (Mendones), a related but different problem.

**Neglectedness / buyer (N+B 3).** Strong why-now (proposed FRE 707, effective no earlier than Dec 2027)
but **not neglected commercially**: Magnet Forensics (Magnet Verify), Cellebrite, Truepic, TrueScreen,
Verisk, the C2PA consortium, and WITNESS's expert-review force already occupy authentication/provenance.
The pure liar's-dividend buyer (proving genuine media real) is *episodic/per-case*, not recurring SaaS;
the big recurring budgets are for the inverse (detecting fakes submitted as real).

**Kill A — "courts/experts already handle authentication; it's a legal-process issue, not a buildable
product" — PARTIAL (signal 2).** Correct that the *remedy* is procedural (Delfino's FRE 901(c)
burden-shift; FRE 707) and not solo-buildable. But wrong that no measurable gap exists: detectors fail
Daubert, real-world accuracy drops 45–50% lab-to-field, and Grossman states plainly "we aren't at the
place where we can count on the reliability of automated tools." The kill bundles two claims and only
the GTM half stands.

**Kill B — solo-founder viability — LANDS (signal 4).** Wrong buyer (the gatekeeper is the judge; value
accrues to the testifying expert's *labor* at $300–750/hr, not software); a court-admissible product
needs expert-witness credibility minted over years of testimony; a competitive detector is
scientifically unbuildable at ≤$500 (needs large multi-manipulation datasets + compute + team) and
unadmissible if black-box; the provenance side is owned by C2PA (6,000+ members).

**Sharpened statement:** *Deepfake detectors are too unreliable to establish authenticity in court, so
the liar's dividend has no Daubert-survivable, published-error-rate benchmark — but the remedy is
procedural (rules of evidence), not a product a solo can sell.*

**Killed because:** magnitude in the target setting is still anticipatory, the remedy is procedural, and
the buyer/credential moat is fatal for a solo. **Advance as hire/watch:** a Daubert-survivable
detection/authentication benchmark with published error rates (a gap NIST's program only partly fills)
is a credible reputation artifact into a forensics incumbent.

---

### 8. ai-alt-text-usefulness — AI alt-text passes accessibility audits but is functionally useless to blind users

**Verdict: KILLED for founding (advance as nonprofit/eval). Confidence: medium.**

**Quantified reality (mag 4).** Real, present, quantified — but bifurcating by product generation. CHI
2024 diary study (n=16, 316 entries): satisfaction 2.76/5, trust 2.43/4, accuracy 1.95/3. Blind users
detect only ~49% of the AI's errors (they can't verify visually, so wrong descriptions silently
mislead), with concrete harms (a misread date, a wrong phone extension → wrong call). The strongest
recent number: a product-captioning study (86 BLV participants, 1,859 real images) — best VLM 98% on
clean images drops to **75% once real-world quality issues** (64% of BLV photos had poor lighting) are
present. Counter-evidence caps it below 5: Be My AI reports ~90% resolution / 4.85-of-5 satisfaction;
frontier VLMs are far better than the legacy Facebook/Seeing-AI generation the pain literature critiques.

**Neglectedness / buyer (N+B 2).** The problem is real but the **buyer is broken**: those who suffer
(BLV users) don't pay; those who pay (e-commerce/enterprises) buy *compliance and SEO*, and lawsuits
target **missing** alt text, not **unhelpful** alt text — so a generic "Image of a graph" satisfies the
check-writer's entire willingness-to-pay. The FTC's $1M accessiBe fine shows regulators punish false
quality claims, not reward genuine quality. Payer/sufferer misalignment is the disqualifier.

**Kill A — "native platforms are improving fast + market is small/served by accessibility orgs" —
PARTIAL (signal 2).** True for consumer *consumption* (Apple VoiceOver Image Explorer 2026; Be My AI;
Google Lookout — all free, incumbent-owned). But the durable, fundable pain is publisher-side
*context-aware authoring for compliance/meaning*, which platforms don't touch and regulation (EAA,
effective Jun 2025, penalties to €100k/4% revenue) is expanding — so the "small market" prong fails.

**Kill B — solo-founder viability — DISQUALIFIES (signal 5).** Payer/sufferer split (WTP is for
compliance, not usefulness); the usefulness side is free and owned by trillion-dollar incumbents; the
paid B2B side is commoditized thin wrappers on vision APIs (AltText.ai 88,000+ sites); and the quality
bar requires BLV co-design + labeled "what is useful per context" data governed by "nothing about us
without us" — trust/data a sighted ≤$500 solo cannot mint.

**Sharpened statement:** *Automated accessibility audits verify that alt-text exists, not that it is
useful, so AI descriptions pass compliance while being functionally blind — and the only party who
cares about usefulness (the BLV user) never pays.*

**Killed because:** the payer optimizes the dimension the founder wants to fix *out* of scope.
**Advance as nonprofit/eval:** an artifact that *measures alt-text usefulness for BLV users* (feeding
BLV-preference reward signals) sold/published to VLM labs and accessibility-services firms is the only
reframe that dodges the trust/data kill — impact-first, not a company.

---

### 9. voice-clone-elder-fraud — 3s of audio clones a grandchild; no recipient-side verification

**Verdict: KILLED for founding (advance as nonprofit / hire measurement artifact). Confidence: medium.**

**Quantified reality (mag 4).** The umbrella pain is enormous; the *specific* elder-voice-clone slice is
real and government/press-validated but not cleanly quantified. FBI IC3 2025: $7.7B elder losses; $893M
AI-related, of which $352M has an elder AI component — but AI losses are *dominated by investment fraud*
(~$632M); the pure distress/grandparent voice-clone confirmed figure is only ">$5M," flagged as
undercounted. The mechanism and the measurement gap are the strongest evidence: humans cannot detect
clones (UC Berkeley, *Nature Sci Reports* 2025: ~60% accuracy, near chance; a 2026 vishing study: 37.5%,
*below* chance). This kills "just train people to listen" and validates automated measurement as the
need — but the clean elder-voice-clone dollar number does not yet exist in any primary source.

**Neglectedness / buyer (N+B 2).** Enterprise detection is well-served and incumbent-owned (Pindrop
~$100M ARR, 5B call recordings + 20M labeled deepfakes, 8 of the 10 largest banks). The elderly-benchmark
whitespace is *already claimed* by 2025–26 labs (Elderly Codecfake/SeniorTalk, TeleAntiFraud-28k). The
buyer is mismatched: no one pays a solo for a benchmark; enterprises buy productized detection from
moat-holders; funders (FTC/AARP) operate at grant scale (the FTC Voice Cloning Challenge awarded $35k
total).

**Kill A — "it's a fraud/telecom/law-enforcement problem, unmeasurable/unbuildable by a solo eval
researcher" — FAILED (signal 2).** Audio-deepfake detection is a legitimate ML field with an open
generalization problem (detectors lose 43% out-of-distribution; ASVspoof called "obsolete" vs 2024–26
TTS) — squarely the founder's lane. A near-zero-cost measurable artifact exists as a template (the
vishing perception study: 22 participants, 16 clips). Data access is solved with public assets (NCSU's
1,432 real FTC fraud calls; TeleAntiFraud-28k). Telecom (STIR/SHAKEN) is a parallel, non-competing
lever the FCC itself says is "not definitive proof a call is legitimate."

**Kill B — solo-founder viability — DISQUALIFIES for founding (signal 5).** The paying customer is
enterprise, not the elderly (elder scams are the *least* org-monetizable slice); distribution to elders
is owned and given away free by carriers/OS vendors (Verizon/AT&T/T-Mobile Scam Shield, Google on-device
detection); real-world measurement needs a private adversarial test set at Pindrop scale; and the fix is
moving upstream to provenance-at-generation (ElevenLabs SynthID + C2PA), risking obsolescence of
downstream detection.

**Sharpened statement:** *Humans and detectors cannot reliably distinguish cloned from real voices at
the point of need, and there is no realistic in-the-wild benchmark for elder-targeted, phone-codec
vishing — but the fix is a carrier/telecom signal, not a product a solo can sell.*

**Killed for founding because:** the most-rediscovered problem in the whole exercise (5 lenses) has no
solo-fundable wedge — enterprise-owned buyer, carrier-owned distribution, upstream-moving fix.
**Advance as nonprofit / hire:** a rigorous, scenario-realistic **elder-vishing distinguishability
benchmark** (how badly do lab detectors degrade on real phone-codec, elderly-speaker scam audio) is
≤$500-buildable, high-impact advocacy, and a strong portfolio artifact into Pindrop / Reality Defender /
imper.ai.

---

### 10. euaiact-no-means-to-comply — deployers have no concrete tooling/methods to meet obligations

**Verdict: KILLED as framed. Confidence: high.**

**Quantified reality (mag 4).** Readiness gaps are severe and well-measured (Deloitte: only 35.7% of
German firms well-prepared; appliedAI: 40% of 106 enterprise systems can't even be classified high- vs
low-risk; CSA: >50% lack an AI inventory). The EU *itself* acknowledged the infrastructure doesn't
exist — CEN-CENELEC missed the harmonised-standards deadline (now end-2026+), and the 7 May 2026 Digital
Omnibus deferred high-risk obligations to 2 Dec 2027 *because* standards and compliance tools weren't
ready. So the pain is real but the acute deadline moved ~18 months out.

**Neglectedness / buyer (N+B 2).** For the *deployer* framing, the premise is largely false. A primary
deployer guide walking every Art. 26 obligation concludes "No significant inability identified" — each
duty is met by contract review + checklist + provider-generated logs, no specialized tooling required;
SME cost is €20–50k with "one named person, 2–3 hours/week" and no Quality Management System. The
governance-tooling space is crowded and funded (Credo AI ~$41M; OneTrust, Holistic AI, IBM,
Vanta/Drata), and free FRIA generators / literacy assessments already cover the named obligations. The
"no means to comply" pain is genuine for **providers** (evals, conformity assessment, Annex IV technical
docs) — a *different* problem than the deployer-framed one under review.

**Kill A — "deadlines deferred + Big-4/GRC own it" — PARTIAL (signal 2).** Self-defeating in part: the
delay's stated reason (missing standards/tools) *confirms* a technical gap, and GPAI (since Aug 2025) +
Art. 50 transparency (Dec 2026) are live. And the genuine gap is *technical evidence-generation* (eval
harnesses, bias/robustness suites, log/traceability artifacts), which Big-4/GRC don't sell. But that is
the **provider** gap, not the deployer problem as framed.

**Kill B — solo-founder viability — DISQUALIFIES (signal 5).** Four compounding, near-fatal axes: the
"means to comply" is a *standards/methodology* gap only CEN-CENELEC/the Commission can authoritatively
fill (and incumbents productize instantly once it lands); the obligations are legal/liability-bearing
and non-delegable, so buyers pay accountable names (lawyers/Big-4), not an unknown solo's unaccredited
tool against €15M/3%-turnover exposure; the market is saturated with better-capitalized players *and*
free self-serve tools (Legalithm free through ~2028; KLA free FRIA generator); and urgency evaporated
with the Dec-2027 slip.

**Sharpened statement (corrected):** *Deployers can already satisfy Art. 26 with process and checklists;
the real unmet gap is provider-side technical evidence-generation (conformity-assessment eval harnesses,
bias/robustness suites) — but that is standards-gated, liability-bearing, and incumbent-adjacent.*

**Killed because:** the deployer framing's premise is false, both the buyer picture and solo-viability
fail, and the deadline slipped. The provider-side technical-eval layer is a real, harder, separate
problem worth a *fresh* validation — not a rescue of this entry.

---

### 11. low-resource-reliability-vacuum — "no benchmarks exist to even measure LRL reliability/quality"

**Verdict: KILLED — premise stale. Confidence: high.**

**Quantified reality (mag 4 for the underlying pain; premise false).** The literal problem statement is
**factually wrong**. A dense, still-growing measurement layer exists: GlobalBench, Belebele (122
variants), the AI Language Proficiency Monitor (a *government-backed*, daily-updating benchmark across
100–200 languages / 80–95% of speakers), MMLU-ProX, IrokoBench, SEA-HELM, Sahara, Cohere Aya (101
languages), FLoRes-200, and dozens of per-language 2024–26 benchmarks. The *underlying* reliability
pain is real (MT hallucination-free rate 85% English vs 24% low-resource; MMLU-ProX 24.3-pt gaps; safety
measurement much thinner than accuracy) — but that is a **sparse-and-unreliable** measurement layer, not
a vacuum. The genuine narrow whitespace is *reliability/hallucination* measurement for the truly-low
tail (Mu-SHROOM covers only 14 mid/high-resource languages) — which is unfilled because it is a hard
data problem (no reference corpora exist), not an unnoticed one.

**Neglectedness / buyer (N+B 2).** Accuracy/proficiency measurement is one of the *more crowded* corners
of NLP, with a government-funded incumbent (BMZ/GIZ/DFKI) squarely in the "measurement layer" niche.
Money flows as **grants to academic/nonprofit consortia** (Lacuna Fund $1M+; Masakhane LINGUA Africa up
to $250k cash + $400k compute) and as in-house budgets to sovereign-AI programs (Korea $390M, India
IndiaAI $1.2B) — *not* as commercial contracts to an outside individual. No private company was found
paying for a standalone low-resource reliability benchmark.

**Kill A — "academic-only, no buyer, too fragmented, grant-shaped not company-shaped" — LANDS
(signal 4).** Confirmed: FLoRes-200 released free (CC-BY-SA) as a research contribution; the layer is
funded by philanthropy/grants by name; ~7,000 languages with no cross-language economies of scale in the
artifact; the field is dominated by one-off academic outputs. The counter-signal (frontier labs pay
~$1B/yr for LRL data via Surge/Scale, bundled) softens it to a services angle, not a benchmark product.

**Kill B — solo-founder viability — DISQUALIFIES (signal 5).** The premise is stale/closing; the buyer
(frontier labs) demands native-speaker teams + security/governance + fair-labor compliance a solo can't
mint; the artifact is a public good (every benchmark is free/open-source); and the viable indie eval
path is *adjacent* (language-agnostic runtime tooling, already crowded/YC-backed), not this.

**Sharpened statement (corrected):** *Reliability and safety measurement for the truly-low-resource tail
is sparse and the metrics themselves degrade there — but "no benchmarks exist" is false, and what's
missing is a hard data problem funded by grants, not a company.*

**Killed because:** the premise is false and both kills land. Note the near-total overlap with #4
(non-english-safety-parity): the *reliability-cliff-measurement-for-a-specific-cluster* artifact that
survives here is the same nonprofit/hire artifact that survives there. Carry it once, under #4.

---

## What advances to solutioning

No problem earned a clean CONFIRMED. Four advance as **QUALIFIED**, each carried only in its scoped,
kill-survived form. Ranked by strength (magnitude × surviving-buyer × founder-fit).

**1. silent-ingestion-corruption — FOUNDING-shaped (narrow) / hire.**
*Scoped form to carry:* a **parser-agnostic ingestion-corruption eval/monitoring layer for one
regulated vertical document type** (e.g. clinical or insurance forms) — hand-label ground truth, flag
silently-corrupted tables/numbers in production, plug into the buyer's existing pipeline. This is the
only survivor with a *demonstrated paying buyer* (Reducto $1M ARR at 4 people) and direct alignment to
the founder's RAG-hallucination work. The ≤$500 first experiment: measure ingestion→answer corruption
on one document class against a small labeled set. *Kill to keep watching:* incumbent parsers adding
corruption-detection as a feature — stay parser-agnostic and vertical.

**2. automation-complacency — HIRE / measurement-artifact.**
*Scoped form to carry:* a **validated vigilance/engagement metric** (override rate, dwell-time,
agreement-drift) shown to actually predict caught-vs-missed errors, first proven on the **RLHF/data-
labeler-QA buyer** (present-tense pain, no regulatory wait). The tailored kill *failed* (the problem is
durable and unowned as a measurement discipline); only the solo-company kill landed. ≤$500 experiment:
measure override/dwell/agreement drift on a labeling task and correlate with seeded-error catch rate.

**3. non-english-safety-parity (absorbing low-resource-reliability) — NONPROFIT / hire.**
*Scoped form to carry:* a **reliable, LLM-judge-robust reliability/safety-parity measurement method for
one under-covered language cluster** the founder or a collaborator can natively verify. The tailored
kill *failed* (labs don't even publish per-language safety; solo benchmarks demonstrably exist). This is
the charter's impact-first exception — high-importance, high-neglectedness, ≤$500-executable — on the
publish/grant path, not founding. (This is where the killed #11 artifact lives too.)

**4. prompt-injection-undefended — HIRE (adaptive-eval).**
*Scoped form to carry:* an **independent, defense-aware adaptive-evaluation harness** (or an
MCP-tool-output-injection benchmark) — the one non-proprietary slice, since published defenses fall to
>90% adaptive ASR and no standardized adaptive protocol exists. Not a company for a solo; a
high-signal, ≤$500-reproducible artifact that provider acquisitions (Promptfoo) prove is directly
hireable-into.

---

## Killed / parked

| Problem | Verdict | Decisive reason |
|---|---|---|
| **almost-right-code-tax** | KILLED (found) → hire | Red ocean: incumbent-bundled free (GitHub/Cursor), funded pure-plays (CodeRabbit $550M, Qodo $120M), step-function trust moat; small already-split TAM. Real + worsening, but no solo wedge. |
| **fabricated-citation-contamination** | KILLED | Existence-checking commoditized (free public DBs, free tools, MS-CTO OSS); publisher channel captured; corpus-hygiene is a public good with no buyer; only-defensible (training-corpus) version needs frontier-lab access. |
| **liars-dividend-court** | KILLED (found) → hire/watch | Remedy is procedural (FRE 707/901); value is expert-witness *labor* not software; detector unbuildable/unadmissible at ≤$500; magnitude still anticipatory (defense fails in nearly every real case). |
| **ai-alt-text-usefulness** | KILLED (found) → nonprofit | Payer/sufferer split: buyers pay for compliance (missing-alt lawsuits), not usefulness; usefulness side free + incumbent-owned; quality bar needs BLV co-design/data a solo can't mint. |
| **voice-clone-elder-fraud** | KILLED (found) → nonprofit/hire | Enterprise-owned buyer (Pindrop), carrier-owned free distribution to elders, fix moving upstream to provenance. Measurement artifact survives; company does not. |
| **euaiact-no-means-to-comply** | KILLED (as framed) | Deployer premise false (Art. 26 met by process/checklist); crowded+free tooling; standards-gated + liability-bearing buyer won't trust a solo; deadline slipped to Dec 2027. Provider-side technical-eval gap is a *different* problem. |
| **low-resource-reliability-vacuum** | KILLED (premise stale) | "No benchmarks exist" is false (gov-backed 100–200-language monitor, FLoRes-200, 122-variant Belebele, etc.); real gap is grant-funded public good, not a company. Surviving artifact merged into #3. |

---

## Summary

- **automation-complacency:** QUALIFIED (hire) — durable, unowned as a *measurement discipline* (tailored kill failed); solo-company kill lands.
- **silent-ingestion-corruption:** QUALIFIED (narrow founding/hire) — strongest surviving buyer; carry as a parser-agnostic, single-vertical ingestion-QA layer.
- **prompt-injection-undefended:** QUALIFIED (hire) — real+undefended; only the adaptive-eval benchmark slice is solo-executable.
- **non-english-safety-parity:** QUALIFIED (nonprofit/hire) — tailored "labs closing it" kill failed; the impact-first measurement artifact survives.
- **almost-right-code-tax:** KILLED for founding (hire) — red-ocean, incumbent-bundled free.
- **fabricated-citation-contamination:** KILLED — commoditized detection, no buyer for corpus hygiene.
- **liars-dividend-court:** KILLED for founding (hire/watch) — procedural remedy, expert-labor value, unadmissible detectors.
- **ai-alt-text-usefulness:** KILLED for founding (nonprofit) — payer optimizes usefulness out of scope.
- **voice-clone-elder-fraud:** KILLED for founding (nonprofit/hire) — enterprise buyer, carrier distribution, upstream fix.
- **euaiact-no-means-to-comply:** KILLED as framed — deployer premise false; real gap is provider-side and standards-gated.
- **low-resource-reliability-vacuum:** KILLED — "no benchmarks exist" premise is stale; merged into #3.
- **Advancing (4):** silent-ingestion-corruption (narrow founding), automation-complacency (hire), non-english-safety-parity (nonprofit/hire), prompt-injection adaptive-eval (hire).
- **Most surprising:** the tailored kill on **automation-complacency scored 1** — every "handled by design/training" fix is documented to reduce-but-never-eliminate the effect, and Anthropic's own production data shows it *worsening* with tenure; the problem is the most durable in the set, yet still un-foundable by a solo. Runner-up surprise: **euaiact "no means to comply" is a mis-framing** — deployers can already comply with a checklist; the genuine gap is provider-side.
