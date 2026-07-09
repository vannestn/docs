# Startup-Optimized Pilot Specs — ~3 pilots per venture-viable domain

*Written after [09 · startup-lens](09-startup-lens.md) re-scored the domains through a founding
lens. This doc is to 09 what [08 · pilot-specs](08-pilot-specs.md) was to the impact-first
shortlist: it turns the startup-optimized domains into concrete, pre-registered wedge experiments —
but each pilot is now judged on **founding value AND hire value**, not research merit alone. Fifteen
pilots (~3 per domain) were each given a full independent evaluation; this doc collects them.*

## Intro — what this doc is, and the honest frame

The [charter](00-goals-and-operating-principles.md) kept three exit paths open and ranked by
impact. [09 · startup-lens](09-startup-lens.md) inverted that on purpose and asked one question of
each domain: *could this become a company?* This doc carries that lens down to the pilot level. For
every candidate the scoring adds two axes the impact-first pilots ([08](08-pilot-specs.md)) never
tracked:

- **Founding value** — does the artifact seed something *defensible and buyable*, or just something
  publishable?
- **Hire value** — is the artifact a legible credential for a lab / startup / eval team that would
  hire an eval methodologist?

The honest headline, unchanged from 09 and confirmed by every evaluation below: **most of these are
credentials and wedges, not companies.** A benchmark is a paper; a paper is not a company. Across all
fifteen pilots, **founding value never scores above 2** — the same ceiling 09 found at the domain
level (nothing above venture-viability 3). Every "wedge" here is a door-opener, warm-lead generator,
or reputation asset; none is a moat on its own. The recurring pattern from 09 holds at the pilot
level too: the technical core is copyable, incumbents absorb features in days-to-weeks, and the exit
(where one exists) is a tuck-in, not an IPO.

So the operative reframe is this: **for near-term marketability, the hire path is the more reliable
win.** These pilots are strongest as concrete proof-of-competence artifacts that land the researcher
a role at an agent-security / eval / reliability team — with the founding wedge as an option a pilot
*might* reveal, not a plan it guarantees. Where a pilot's founding read is weak, this doc says so
plainly, and preserves each evaluation's honesty rather than inflating a thin verdict to fit the
startup framing.

Every pilot below still obeys the [Stage-2 rules](04-topic-selection-process.md): re-analysis tier
(≤$500, track actuals), ≤~60 hrs / ≤6 weeks, a public artifact as the unit of evidence,
pre-registered success **and** kill criteria, a weekly scoop watch, and cross-vendor judging with
disclosed credits. **Run 2–3 across different domains — not all fifteen** (see the recommended set).

---

## Cross-pilot ranking

All fifteen pilots. Scores are 1–5 from each pilot's independent evaluation
(`feasibility · skillsFit · novelty · foundingValue · hireValue · artifactImpact`). Sorted by
verdict, then by hire + founding value (the startup-marketability blend), then novelty as a
tiebreaker. **Founding never exceeds 2** — read the table with that ceiling in mind.

| # | Domain | Pilot | Feas | Skills | Novelty | **Found** | **Hire** | Artifact | Verdict |
|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| 1 | Agent security & auth | **ScopeBench** | 3 | 5 | 3 | 2 | 4 | 4 | viable |
| 2 | Model behavior QA / drift | **DriftWatch** | 5 | 5 | 3 | 2 | 4 | 4 | viable |
| 3 | Agent security & auth | **SpoofCard** | 3 | 3 | 4 | 2 | 4 | 4 | viable |
| 4 | Agent security & auth | **PoisonPipe** | 3 | 5 | 3 | 2 | 4 | 3 | viable |
| 5 | AI reliability (TypeSafe) | **NinesBench** | 3 | 5 | 3 | 2 | 4 | 3 | viable |
| 6 | AI audit / compliance | **AUDIT-LINT** | 4 | 5 | 3 | 2 | 4 | 3 | viable |
| 7 | Evaluation & LLM-judge | **JudgeFlip** | 5 | 5 | 3 | 2 | 4 | 3 | viable |
| 8 | AI reliability (TypeSafe) | **FormatTax-Live** | 4 | 5 | 2 | 2 | 4 | 3 | viable |
| 9 | AI reliability (TypeSafe) | **SilentCatch** | 5 | 5 | 2 | 2 | 4 | 3 | viable |
| 10 | AI audit / compliance | **RAG-CONFORMITY** | 3 | 5 | 3 | 2 | 4 | 3 | viable |
| 11 | AI audit / compliance | **FOUR-FIFTHS-KIT** | 5 | 5 | 2 | 2 | 4 | 3 | viable |
| 12 | Model behavior QA / drift | **ContractGuard** | 3 | 5 | 2 | 2 | 4 | 3 | viable |
| 13 | Evaluation & LLM-judge | **HalluJudgeBench** | 4 | 5 | 2 | 2 | 4 | 3 | viable |
| 14 | Model behavior QA / drift | **RegressKit** | 5 | 5 | 2 | 2 | 3 | 3 | viable |
| 15 | Evaluation & LLM-judge | **LeaderAudit** | 5 | 5 | 2 | 2 | 3 | 3 | **weak** |

**Read of the table.** Skills-fit is a 5 nearly everywhere — every pilot sits on the researcher's
published LLM-as-judge / eval-methodology / data-pipeline turf, which is exactly why they are
credible hire artifacts. The differentiation is in *novelty* and *founding value*, both of which
compress toward the low end: no clean greenfield exists, and no single benchmark is a company. The
top of the table (ScopeBench, DriftWatch, SpoofCard, PoisonPipe) earns its rank on **artifact impact
+ hire legibility + a slightly better-defended novelty claim**, not on founding upside. LeaderAudit
is the only **weak** verdict — its core claim was published (arXiv:2605.30315) before the pilot could
run, so it self-triggers its own scoop protocol in week one.

---

## Pilots by domain

Each pilot: RQ / gap / method / realistic cost+time / artifact / **founding read** / **hire read** /
closest prior work + delta / success / kill / biggest risk / verdict. Kept scannable.

### Agent security & authentication

The strongest venture domain in 09 (riding the hottest, best-funded 2026 security wave), but also the
one absorbing startups fastest (Prompt Security→SentinelOne, Aim→Cato, Lakera→Check Point). All three
pilots are measurement/assurance wedges, not enforcement products — deliberately, since the
enforcement lane is being rolled up. Founding value is uniformly weak (2); hire value is strong (4).

---

#### ScopeBench — delegation-scope adherence benchmark

**RQ.** When an agent is granted a narrow machine-readable delegation scope ("read calendar; NEVER
send email; NEVER spend >$0"), at what rate does it take out-of-scope actions under adversarial
pressure (injected tool output, social-engineering turns, ambiguous tasks) vs. benign conditions —
and does that rate hold under semantically-equivalent rewordings?

**Gap.** arXiv:2605.16282 Finding 6: R10-Robustness is the *sole* agent-safety risk category with
zero primary benchmarks; no benchmark tests behavioral consistency under semantically-equivalent
perturbations. No "AgentDojo for delegation/scope-adherence" exists.

**Method.** A static+dynamic scope-adherence suite implemented as a DoomArena attack-config module
(inherits its harness + earns an upstream PR). ~120–180 cases across 6–8 scoped-delegation profiles,
each with a benign baseline, 3–4 adversarial-pressure variants, and 3 semantically-equivalent
paraphrases. Primary metric: scope-violation rate (SVR); secondary: paraphrase-consistency delta and
refuse-vs-silently-comply breakdown. 3–4 frontier agents cross-vendor + one open-weight, on a common
tool-calling scaffold. Violations caught by **deterministic tool-call assertions** (auditable ground
truth), not LLM judgment. Baselines: raw agent vs. system-prompt scope guard vs. naive allow/deny
wrapper.

**Cost + time (realistic).** The stated "well within $500" is optimistic: ~2,700 distinct configs ×
4 models × 3 seeds ≈ 32K multi-turn rollouts, blended ~$200–450 — inside $500 but thin, cover the
margin with vendor credits. Time is the tighter constraint: hand-authoring 120–180 cases with
variants + paraphrases + assertions + a DoomArena module + a note is **70–90 hrs**, above the stated
50–60.

**Artifact.** Public repo (JSON cases + adversarial variants + DoomArena-compatible harness +
leaderboard table) + an arXiv/technical note; stretch = a merged DoomArena PR.

**Founding read (2).** Weak. Seeds an "eval-as-a-service / scope-guardrail testing" company adjacent
to KYA/agent-passport vendors — but a public leaderboard is a test suite, not a moat, and
Braintrust/Patronus could extend into scope-adherence trivially. Founding value depends on
converting the copyable benchmark into a *non-copyable* private attack corpus + continuous pipeline.

**Hire read (4).** Strong. Ships the exact artifact type the researcher already publishes, extends a
named verified gap, and lands a checkable DoomArena upstream contribution — a concrete signal for any
agent-safety team hiring an eval specialist.

**Closest prior work + delta.** ASTRA (arXiv:2510.26702) is closest and **uncited** — but it
benchmarks a task-to-scope *matcher* on GPT-4o only, with no paraphrase/injection/social-engineering
axes. ScopeGate (arXiv:2606.28679) is a fail-closed *enforcement* mechanism, not a behavioral
benchmark. AgentDojo + DoomArena cover generic injection, not delegation-scope or paraphrase
consistency. **Delta:** the *agent's own behavioral* SVR under adversarial pressure across cross-vendor
frontier agents, with paraphrase-consistency as the novel axis. Scoop risk moderate-to-high and
rising (ASTRA, ScopeGate, AgentDyn all landed within months).

**Success (pre-reg).** All must hold: ≥15pt SVR spread across models OR ≥15pt benign-vs-adversarial
gap on ≥2 profiles; ≥1 model shows ≥10pt paraphrase-consistency delta on ≥2 profiles; ≥90% of
violations caught deterministically; the 3-baseline ladder shows monotone SVR reduction; public repo
+ note ship.

**Kill (pre-reg).** After 3 profiles: all models near-ceiling/floor with <10pt spread; OR
paraphrase-delta <5pt for every model; OR deterministic assertions can't classify >25% of runs; OR a
scoop hit covering both adversarial SVR and paraphrase consistency.

**Biggest risk.** The paraphrase-consistency axis — the sole differentiator vs. ASTRA/ScopeGate/
AgentDojo — may not produce robust signal (frontier agents may already be consistent, or deltas may
be 3-seed noise), collapsing ScopeBench into "yet another injection benchmark" in a crowded field.

**Verdict: viable.** Skills-perfect eval on a real, confirmed gap; strong hire credential. Novelty
moderate not high (ASTRA/ScopeGate crowd the space, ASTRA uncited), founding value weak. Fund as a
credential play with paraphrase-consistency pre-committed as make-or-break; cite ASTRA day one.

---

#### PoisonPipe — tool-output injection channel decomposition

**RQ.** When an agent ingests attacker content inside a TOOL RESULT (retrieved doc, API JSON field,
MCP response, web scrape) rather than the user prompt, what is the attack-success rate for hijacking
a privileged action — and how much survives standard mitigations, broken down by *which channel and
content type* the injection hides in?

**Gap.** The MCP tool-poisoning surface (arXiv:2503.23278; OWASP LLM01) is widely asserted, but no
public eval *isolates* the tool-output channel and ablates whether standard mitigations reduce
residual attack-success by channel and content type.

**Method.** A controlled agent + 6–8 mock tools whose outputs are attacker-controllable. ~150
payloads × placement channels (JSON string field / free-text body / markdown / tool-description
metadata / error message) × a fixed set of target privileged actions. Primary: indirect-injection
ASR by channel; secondary: mitigation-residual ASR after each of 3 named defenses (spotlighting/
quarantine delimiters, untrusted-output system prompt, forced structured outputs). Deterministic
success detection; LLM-judge only as a secondary grader for borderline cases.

**Cost + time (realistic).** Optimistic. ~150 × 5 × 3 × 4 × 3 = ~27K multi-turn trajectories +
baseline arm; at July-2026 frontier pricing that is **$800–3,200 all-in, 2–6× over $500**. Fits <$500
ONLY scoped down: 2 frontier + 1 budget model, 2 seeds, prompt-cached tool schemas, ~100 payloads.
Time 45–55 hrs realistic given existing harness. **Run a $150 pilot slice (1 channel, 1 defense, 2
models) in week 1 to lock the per-run token cost before committing the grid.**

**Artifact.** Public repo (payload corpus + tool harness + channel-by-channel residual-ASR matrix) +
a technical note; optional DoomArena attack config.

**Founding read (2).** Weak. A channel-resolved tool-output injection eval is the diagnostic a
"scan-my-MCP-server / tool-output firewall" product sells — but it points at Cisco DefenseClaw's
already-shipping scan space; it's a diagnostic/wedge, not a company.

**Hire read (4).** Strong. Rigorous mitigation-ablated eval of the top-corroborated attack surface,
reusing the researcher's injection + LLM-judge strengths — a credible portfolio piece for any
agent-security team.

**Closest prior work + delta.** MCPTox (arXiv:2508.14925) isolates the tool-*description* channel
(different channel). InjecAgent (arXiv:2403.02691) covers tool-output IPI but no content-type
decomposition and no defense ablation. Closest: "Defense Against Indirect Prompt Injection via Tool
Result Parsing" (arXiv:2601.04795, Jan 2026) attacks the tool-result channel and ablates the named
defenses — but leaves channel-resolved decomposition open and drives ASR <1% with its own method.
**Delta:** the 3-way matrix {tool-output channel isolated × content-type × residual-ASR per defense}
is genuinely unpublished. **Scoop risk HIGH** — DoomArena makes this a few lines; 2601.04795 sits one
ablation away.

**Success (pre-reg).** (a) ≥1 sub-channel shows residual-ASR ≥15 abs pts above the user-prompt
baseline with non-overlapping bootstrap CIs; (b) the best of 3 defenses still leaves residual-ASR
>20% on ≥1 channel; judge-secondary Cohen's kappa reported; repo + note ship, ideally a merged
DoomArena config.

**Kill (pre-reg).** Week-1 $150 slice shows tool-output ASR indistinguishable from user-prompt
baseline AND the tested defense drives it below threshold → publish the null. Scoop hit on
channel-resolved injection ASR → comparison note, stop. Frontier models near-zero ASR on naive
payloads → strengthen payloads before proceeding.

**Biggest risk.** The finding may be a foregone conclusion or already answered — 2601.04795 already
shows "standard prompting mitigations leave a residual hole" is unsurprising and pre-empted, leaving
only the content-type decomposition as novel. If the channel breakdown is flat (JSON ≈ markdown ≈
error msg), there is no story.

**Verdict: viable.** Strong skills fit and a clean hire credential on the top-corroborated attack
surface. But novelty is narrow (only content-type sub-channel is truly open), scoop risk high, budget
2–6× over unless cut. Do it as a fast, tightly-scoped hire artifact with a week-1 kill gate — not a
startup thesis.

---

#### SpoofCard — agent-identity spoof/bypass matrix

**RQ.** Under a documented threat taxonomy (spoofing, card-downgrade, replay, key-directory
poisoning, capability forgery), what fraction of agent-identity / delegation handshakes can be
bypassed across the competing verification schemes — a Web-Bot-Auth Signature-Agent verifier
(Cloudflare's open reference), an A2A signed-vs-unsigned Agent Card flow, and a delegation-receipt/
capability-token check — and which named attack class each scheme fails to stop?

**Gap.** Structural absence-claim #8: no independent third-party study measures spoof/bypass rates of
Signature-Agent (Web Bot Auth) / Visa TAP verification or key-directory poisoning; every deployment
claim is a capability announcement with no adversarial evaluation. No comparative security analysis of
the competing identity Internet-Drafts exists.

**Method.** A hybrid comparative-threat-model + hands-on adversarial harness. Stand up three minimal
verifier testbeds from open references (Web Bot Auth Ed25519/RFC 9421/JWKS; A2A signed-vs-unsigned
cards; a delegation-receipt/capability-token verifier scaffolded from an active Internet-Draft).
Define a shared 8–12 point attack taxonomy; implement a concrete runnable attempt per (scheme ×
attack) cell with a deterministic blocked/bypassed outcome. Metric: per-scheme bypass rate + a
scheme × attack coverage matrix. Near-zero API cost (crypto/protocol, laptop-scale).

**Cost + time (realistic).** Money genuinely trivial (<$500 with room; ~$5–20 optional API). Time is
the constraint and the 50–60 hr estimate is optimistic: the third testbed (delegation-receipt
verifier from spec text, no reference impl) is 20–30 hrs alone; the full study with ~24–36 runnable
attack cells is **70–90 hrs**.

**Artifact.** Public repo (three runnable verifier testbeds + reusable attack harness + coverage
matrix) + a technical note that doubles as filable IETF WebBotAuth/OAuth WG review comments.

**Founding read (2).** Weak. The first independent spoof/bypass matrix is a credibility asset for a
"Know Your Agent" / agent-passport verification vendor (Vouched, AgentPassport space) — but a bypass
matrix is a test suite, not a moat; 09 scores the domain venture-viability 3 with tuck-in as the
ceiling.

**Hire read (4).** Strong, and the most standards-visible move available to an outsider: it produces
filable IETF WG review comments (open door, no membership fee) and closes absence-claim #8 — an
unmistakable signal for identity/agent-security teams at Cloudflare/Okta/Ping/AWS-adjacent orgs.

**Closest prior work + delta.** arXiv:2511.03841 (Security Analysis of Agentic AI Communication
Protocols) compares a 14-point taxonomy across CORAL/ACP/A2A — but does NOT cover Web Bot Auth /
Signature-Agent and reports *qualitative* findings, not a measured bypass-rate matrix. The A2A
card-spoofing leg is already well-covered by 4 orgs. **Delta:** no existing work stands up a hands-on
Web-Bot-Auth verifier and runs concrete poisoning/downgrade/replay attempts with reproducible
outcomes. Scoop risk moderate-high (crowded, fast-moving corner).

**Success (pre-reg).** All must hold: three testbeds accept a well-formed legitimate handshake
(positive control); a frozen 8–12 point taxonomy published before attacks; each cell has a runnable
script with a deterministic verdict; the matrix shows ≥1 attack class a shipping-relevant scheme
(esp. Web Bot Auth) fails to block in its documented reference config, with reproduction steps.

**Kill (pre-reg).** By end of week 2 the delegation-receipt testbed can't be stood up → drop to a
2-scheme study. Every scheme blocks every attack → pivot the note to "reference configs are robust;
risk is implementer optionality" (pre-registered fallback). Scoop hit → comparison note. Hard stop at
6 weeks; ship the matrix with untested cells marked.

**Biggest risk.** The interesting result may live entirely in *implementer optionality*, not the
schemes — every reference config robust, "bypass" appearing only in a deliberately weak deployment
you built, which critics dismiss as a strawman. Web Bot Auth is explicitly scoped to cooperating
declared bots; a "downgrade/poisoning" finding must be framed as a real deployment path (what
Cloudflare/AWS WAF/Vercel actually ship) or it gets waved away.

**Verdict: viable.** Genuinely novel in a narrow-but-real sense (closest paper skips Web Bot Auth and
reports no bypass-rate matrix), a strong standards-visible hire credential. Founding value weak — a
credibility asset for a KYA vendor, not a company. Gated below "strong" by the understated
delegation-receipt build and the strawman-framing risk.

---

### AI reliability & correctness for automation (TypeSafe domain)

Structured/type-safe generation for unsupervised machine-to-machine pipelines — the TypeSafe domain.
Skills-fit is perfect (evaluation methodology + LLM-judge + pipelines). The recurring problem: the
space is being actively reconciled by well-resourced groups publishing monthly, so novelty is thin
and scoop risk is real. All three are hire credentials / measurement-standard plays.

---

#### FormatTax-Live — structured-output correctness study

**RQ.** For a fixed automation task and model, does forcing structured output raise or lower the rate
of *correct* answers — and does the sign depend on the enforcement METHOD (free-form parse / provider
JSON-mode / decode-time constrained decoding / reason-then-constrain) rather than the task? H1: at
matched schema-validity, constrained decoding lowers task-correctness vs. reason-then-constrain by
≥3pt on reasoning-heavy extraction; H0: all four methods within the nondeterminism floor.

**Gap.** Structured-output *correctness* vs. *task* correctness is unresolved — Let Me Speak Freely
vs. JSONSchemaBench vs. CRANE were never reconciled into a decision-useful, cross-engine answer.

**Method.** 2–3 automation-shaped tasks (messy invoice/contract extraction, multi-label
classification, reason-then-extract eligibility). ~300–500 items each with gold labels. FOUR methods
per item; run BOTH Outlines and XGrammar to control for the engine variance JSONSchemaBench exposed
(the methodological spine). 4–6 models (open + closed). Report schema-validity SEPARATELY from
task-correctness, always relative to a per-cell 3-seed nondeterminism floor. Deliver a
per-(task,model,method) dominance table.

**Cost + time (realistic).** ~$120–250 API plausible ONLY with a disciplined cheap-model roster +
1–2 frontier spot-checks; adding frontier models across all cells breaks $500 fast. Time 50 hrs is
optimistic — engine plumbing (Outlines + XGrammar + 3 provider APIs + 2 local models) is the
bottleneck; realistic **60–75 hrs**.

**Artifact.** arXiv note + OSS "certify-your-format" harness (drop in your task+schema, get the
validity-vs-correctness-vs-cost-vs-latency table across four methods and both engines) + released
decision table / method-selection cards.

**Founding read (2).** Weak. The harness seeds a neutral "which reliability method for YOUR task"
measurement product — whitespace nobody owns (dottxt/Guardrails sell the methods, not the neutral
comparison) — but it is a feature/measurement-standard, not a company.

**Hire read (4).** Strong — the single most hire-legible artifact for dottxt, Guardrails AI,
Cleanlab, TypeSafe, and every agent startup; answers verbatim the question they interview for ("is
our structured output actually correct?").

**Closest prior work + delta.** Two 2026 papers occupy the core. "The Format Tax"
(arXiv:2604.03616) already compares all four methods, separates task-correctness from validity, spans
open+closed models, and its headline IS the pilot's headline. "The Constraint Tax"
(arXiv:2605.26128) already does the validity-vs-correctness separation with BOTH Outlines and XGrammar
— i.e. the engine-variance control the pilot claims as unique is **already published**. ExtractBench
+ Structured Output Benchmark cover invoice/contract. **Delta:** narrow — automation-shaped tasks at
matched validity, packaged as a drop-in harness. **Scoop risk HIGH and partly realized** (two scoop
keywords literally name existing papers).

**Success (pre-reg).** H1 confirmed if constrained decoding ≥3pp below reason-then-constrain on
reasoning-heavy extraction at matched validity, exceeding the per-cell seed floor; ship the dominance
table + the OSS harness (four methods, both engines); a clean null counts as success; explicitly
position delta vs. Format Tax and Constraint Tax.

**Kill (pre-reg).** Null-ship if all deltas inside the floor everywhere. SCOOP kill (raised bar): a
paper doing automation-task extraction at matched validity with an Outlines/XGrammar control →
comparison note, stop. BUILD kill: if by week 2 both engines won't run the target schemas at usable
validity → drop to one engine and reframe as harness + automation-task table only. BUDGET kill at
$400.

**Biggest risk.** The claimed contribution is already published. What's left — the same analysis on
extraction data with a harness — is a genuine but incremental delta a reviewer could dismiss as
"Format Tax on extraction data." Value hinges on harness adoption, not the finding.

**Verdict: viable.** RQ nearly answered already (novelty 2, scoop risk high). Survives ONLY reframed
around the reusable harness on automation-shaped tasks — a strong hire credential, a feature not a
company. Ship it tool-first with a tightened scoop-kill, or pivot the 60 hrs to NinesBench or
SilentCatch, both less crowded.

---

#### NinesBench — pipeline reliability / "nines" benchmark

**RQ.** How many "nines" of reliability does an unsupervised multi-step extraction pipeline deliver
end-to-end under degraded/adversarial inputs — and where in the 4-dimension space (consistency,
robustness, calibration, bounded-failure) does it fall short of the 3–5 nines Princeton names as the
unsupervised-operation threshold? H1: composed pipeline reliability is materially below the product
of per-step accuracies because errors are correlated (pass^k independence violated).

**Gap.** No standard reliability benchmark for *unsupervised automation* — Princeton named the 4
dimensions, ReliabilityBench operationalized three, but both target agent tasks, neither is accepted,
and no benchmark reports results in nines. No "AILuminate for unsupervised pipeline reliability."

**Method.** A narrow non-agent construct: an unsupervised batch pipeline (document → extract →
normalize/validate → emit record), 3–4 chained LLM steps, fixed public dataset + gold end-state.
Metric suite = the artifact: end-to-end schema-validity, SILENT-error rate (human-validated
LLM-judge), run-to-run consistency (pass^k *with* an explicit independence test — do the same items
fail together?), latency variance, robustness delta under degraded inputs. Express results as NINES
per dimension. 4–6 models on Inspect. Null to falsify = the naive per-step-product prediction.

**Cost + time (realistic).** The $150–300 estimate is optimistic — a full sweep (~300 items × 5
conditions × ~6 seeds × 5 models ≈ 45K runs / ~450M tokens) lands **$400–1,000**; feasible <$500 ONLY
with pre-registered cuts (3–4 seeds, clean+3 conditions, ~150–200 items, frontier as a single
spot-check column). 55 hrs credible; the real sink is building a gold dataset with plausible-but-wrong
silent-error cases + human-validating the judge.

**Artifact.** Released NinesBench: HF dataset + Inspect-Evals-compatible harness + a public
per-model/per-dimension nines scoreboard + arXiv paper. The scoreboard is the durable, updatable
artifact.

**Founding read (2).** Weak-but-the-best-in-its-domain. "The reliability score for unsupervised
automation" is whitespace nobody owns, buyers need it third-party-verified (Cleanlab-style), and a
continuously-run scoreboard is a genuine data-moat *seed*. Still: a single benchmark is a credential
and a moat-seed, not a company.

**Hire read (4).** Strong — a public reliability benchmark scoped exactly to TypeSafe's M2M,
latency-sensitive, no-human-in-loop setting is a near-perfect hire signal for TypeSafe and every
agent-reliability team; solo-author reliability benchmarks (ReliabilityBench, Partial Evidence Bench)
prove one practitioner can define the standard.

**Closest prior work + delta.** ReliabilityBench (arXiv:2601.06112) operationalizes the same stress
axes but only for tool-use agents, reporting success rates not nines. "Beyond pass@1"
(arXiv:2603.29231) already models pass^k independence failure for agents — so H1 is
confirmatory-transfer, not novel discovery. ExtractBench (arXiv:2602.12247) does end-to-end PDF→JSON
but flags it does NOT cover chaining, consistency, robustness, or nines (a near-perfect statement of
the gap — and a ready competitor dataset). **Delta:** the intersection {multi-step chained + non-agent/
M2M + degraded-input robustness + silent-error rate + reported in nines}. **Scoop risk MEDIUM-HIGH.**

**Success (pre-reg).** Public release (dataset + Inspect harness + nines scoreboard + note,
pinned-commit reproducible); ≥4 models × ≥3 conditions × ≥3 seeds within ≤$500; a defensible H1 test
(error correlation ρ or observed pass^k vs. naive product, with CIs, on ≥~30 silent-error events); a
clean headline ("X nines vs. Y predicted"); ≥1 concrete pull signal (fork/cite/engagement/TypeSafe-
shaped usability).

**Kill (pre-reg).** Can't run 3–4 steps across ≥4 models <$500 → collapse to 2-step scoreboard.
Silent errors too rare (<~30) → report low base rate, stop. Scoop on {multi-step + non-agent + nines}
→ comparison note. H1 fails, errors compose near-independently → publishable clean confirmation, ship.
Gold dataset can't be built in ~15 hrs → reuse ExtractBench's gold set.

**Biggest risk.** Novelty collapse, not cost. The core claim (correlated-error / pass^k-independence
violation) is already established for agents; the stress-and-nines machinery already exists. Finding
risks landing as "confirmed a known result on a new task shape," and the durable differentiator (the
M2M/pipeline construct + continuous scoreboard) is exactly what a competitor can bolt onto
ReliabilityBench in weeks.

**Verdict: viable.** Skills-perfect with honest kills, but oversold on novelty and founding. The real
contribution is narrow (porting a known result to the batch/M2M surface, first to report nines there
— genuine whitespace, one obvious paper from being scooped). Strong hire credential and a
moat-*seed*, not a company. Ship fast; scope the construct tightly enough it can't be dismissed as
ReliabilityBench-for-pipelines.

---

#### SilentCatch — silent-failure detector eval for pipelines

**RQ.** In an unsupervised extraction/pipeline setting (NOT agent trajectories), what precision/recall
can a silent-error detector achieve at catching confident, well-formed, WRONG outputs — and at what
cost in correct-throughput (abstention/false-flag rate)? H1: an LLM-judge on OUTPUT+INPUT (no env
state) can't exceed AUROC 0.75, mirroring the agent-trajectory ceiling. Second axis: does
self-consistency recover more silent errors than a single judge at the same flag rate, and how much
correct throughput does each sacrifice?

**Gap.** Silent-failure detection has no benchmark for the general pipeline case — Partial Evidence
Bench is the auth-scope slice, arXiv:2606.09863 is the agent-trajectory slice; the single-shot/
pipeline form has no measurement standard.

**Method.** Build known-wrong-but-plausible cases by CORRUPTING gold outputs realistically
(swapped-but-valid values, plausible hallucinated entities, unit-consistent numeric errors, dropped-
but-schema-valid records) mixed with genuine model errors; every item labeled. Detectors on a
precision/recall frontier: single LLM-judge (retargeted from "is this grounded?" to "is this silently
wrong?"), self-consistency/sample-agreement, a cheap logprob/TF-IDF surface baseline. Report correct-
throughput cost at fixed flag rates. Cross-vendor judges.

**Cost + time (realistic).** ~$100–300 (budget $250 for headroom); self-consistency is the cost
multiplier (5–10× calls) but cheap judges + batching keep it in range. 50 hrs / 4–5 wks fair; the
labor sink is the corruption protocol and hardening it against triviality. Comfortably inside tier.

**Artifact.** Released silent-error benchmark (HF dataset of correct vs. silently-wrong records with a
documented corruption protocol) + OSS detector-comparison harness + arXiv paper with the
precision/recall-vs-throughput frontier.

**Founding read (2).** Weak. Silent failure is the defining automation risk with no pipeline-scoped
standard; a detector that beats the naive judge + the benchmark seeds a "catch-your-silent-errors"
product and complements NinesBench — but it's a wedge/feature, not a company.

**Hire read (4).** Strong, tightest skills-fit in the set — reuses the researcher's published
RAG-hallucination LLM-as-judge machinery almost verbatim, retargeted to "is this silently wrong?" —
exactly the competence Cleanlab (TLM), Guardrails, and agent teams hire for.

**Closest prior work + delta.** The pilot names the WRONG nearest neighbor. It anchors on
arXiv:2606.09863 (agent-trajectory-scoped). The TRUE closest is the Cleanlab line, **uncited**: Goh &
Mueller arXiv:2603.18014 (Real-Time Trustworthiness Scoring for Structured Outputs, public benchmark
at github.com/cleanlab/structured-output-benchmark) — exactly the pilot's setting (single-shot
extraction, field-level correct-vs-silently-wrong, LLM-judge vs. logprob, AUROC), already claiming a
detector beats naive judge. **Surviving delta:** (a) an explicit self-consistency arm (absent from
both priors); (b) a correct-throughput-vs-flag-rate frontier (Cleanlab reports AUROC, not the
abstention cost curve); (c) a released dataset from a documented corruption protocol. **Scoop risk
HIGH and partly realized** (Cleanlab is shipping this as a product).

**Success (pre-reg).** Tighten to differentiate from Cleanlab: public HF dataset ≥1,500 labeled
records (documented corruption protocol + a slice of genuine real-run errors); harness reproducing
the frontier for ≥3 detector families; THE differentiator — a correct-throughput-vs-flag-rate curve
at fixed rates (10/20/30%); a clear verdict on self-consistency vs. single judge at equal flag+cost;
an honest comparison note vs. 2603.18014 and 2606.09863.

**Kill (pre-reg).** Corrupted cases trivially detectable (AUROC ~1.0) → harden once; if still trivial,
publish "synthetic corruption doesn't model real silent failure," stop. Can't build plausible-wrong
at scale → report the barrier. Scoop (Cleanlab v3 adds self-consistency OR the throughput frontier) →
comparison note, stop. Self-consistency shows no separation → re-scope to the throughput frontier. On
real errors all detectors sit at AUROC 0.6–0.65 (H1 confirmed) → that IS the paper, ship the
pipeline-generalization result.

**Biggest risk.** It reads as a re-run of an already-shipped, GitHub-released Cleanlab benchmark with
a swapped data-construction method. Compounded by a methodological trap: deliberately corrupting gold
fields produces errors EASIER to detect than genuine hallucinations, so the synthetic slice risks the
triviality kill while the real-error slice is too small to carry the paper. Contribution then rests
entirely on the two deltas, either copyable in a weekend.

**Verdict: viable.** The core setting is not the greenfield the pilot claims — Cleanlab already
published it with a public benchmark, and the pilot cites the wrong prior. What survives is a narrow
but real follow-on (self-consistency arm + throughput frontier + corruption-protocol dataset). A
credible hire credential (near-perfect skills-fit), not a company and not novel enough to headline as
a new benchmark. Viable only if re-scoped around the throughput frontier, positioned honestly against
2603.18014, with a tight scoop kill.

---

### AI audit, compliance & third-party assurance

09's #2 venture path (the "standards + audit + insurance" bundle, AIUC model). The realistic wedge is
the *technical evaluation layer* insurers/GRC platforms depend on, not the full assurance company.
All three pilots are legally-charged, ACLU/EU-AI-Act-adjacent, and reuse the classical-ML + fairness-
stats + LLM-judge stack. Founding value uniformly weak (feature/services-shaped, license
constraints, enforcement vacuums).

---

#### AUDIT-LINT — automated audit-quality linter for LL144

**RQ.** Can a rubric-scored, LLM-assisted "audit-quality linter" automatically detect the defects
Gerchick et al. found by hand in LL144 bias-audit reports (impact ratios >1 that are logically
impossible under LL144's own definition; four-fifths "passes" that flip to fails once missing-data
lower bounds are computed; groups silently dropped via the 2% exclusion rule) at accuracy high enough
to replace manual review — and does report quality vary by auditor firm and over time (2023→2026)?

**Gap.** Gap #6 (audit quality is poor and unmeasured) + Gap #3 (mandates without enforcement → need
cheap compliance verification). Gerchick et al. did this by hand for one snapshot; nobody has
automated or extended it, and the field-improvement-over-time question is open.

**Method.** Substrate: the ACLU open dataset audits_full.csv (116 audits / 44 reports) + a freshly
scraped 2025–2026 extension corpus of LL144 summaries from employer career pages. Build a
deterministic checker for the three mechanical defects (ground-truth labels from the numbers). Then
test whether a cross-vendor LLM-jury (Claude + GPT + one open model, MedHELM-style) reading raw PDFs
can extract impact-ratio tables and flag each defect, scored via precision/recall/F1 + inter-judge
ICC. Baselines: single-model vs. 3-judge jury vs. pure-regex. Secondary: defect rate by firm
(Holistic AI / DCI / BABL ≈ 56% of the market) and by year.

**Cost + time (realistic).** Cost comfortably inside budget — ~$50–150 (batch + prompt caching put
full jury runs well under $100). Time 55 hrs plausible but back-loaded onto the wrong task: the
checker is 1–2 days; the genuine schedule risk is the fresh extension corpus (LL144 summaries
scattered across career pages in non-standard formats; most employers post nothing) — 15–25 hrs and
possibly a thin sample.

**Artifact.** Open-source "LL144 audit-quality linter" (extractor + defect-checker + LLM-judge
harness + per-auditor report cards) + a methods note "Can we automate auditing the audits?" Runs on
any newly posted LL144 summary URL and emits a pass/flag scorecard.

**Founding read (2).** Weak, and materially weaker than framed. The substrate dataset is CC BY-NC 4.0
(no commercial product on it directly); DCWP enforcement is a documented failure (2 complaints in 2
years); the named buyers are a services/one-off market, not recurring SaaS; well-funded incumbents
(Warden AI, Holistic AI) already sell continuous automated bias-audit products. A "self-serve
audit-QA product" is a feature, not a company.

**Hire read (4).** Strong. Directly extends the researcher's LLM-as-judge/RAG methodology onto a
legally-charged, ACLU-blessed dataset; a hireable signal for BABL/Holistic/Data&Society/Ada Lovelace-
type orgs and any eval startup.

**Closest prior work + delta.** Gerchick et al., "Auditing the Audits" (ACLU, FAccT 2025) is the exact
substrate — its GitHub repo already ships audits_full.csv AND R code computing the three defects for
the Nov-2024 snapshot, so the deterministic checker is largely re-implementation. **Genuinely unbuilt:**
(a) an LLM-jury reading raw PDFs and reproducing those labels at measured precision/recall/F1 + ICC
(no one has published this), and (b) the longitudinal by-firm/by-year readout on a fresh corpus.
**Scoop risk MODERATE** — the ACLU team owns the dataset and the automation angle is an obvious
follow-on, scoopable within a semester.

**Success (pre-reg).** On ≥15 held-out report PDFs, the 3-judge jury achieves F1 ≥ 0.85 on each of the
three defects vs. deterministic ground truth, ICC with CIs; jury beats best single model and beats
pure-regex by ≥0.05 F1; a defensible defect-rate-by-firm/by-year table with the extension-corpus
sample size disclosed; public repo + methods note that reproduces or extends a specific ACLU number.

**Kill (pre-reg).** Jury F1 < 0.6 OR extraction fails on >30% of PDFs → publish the negative, stop.
Extension corpus yields <~10 usable post-Nov-2024 reports after 20 hrs → drop the longitudinal claim,
ship the ACLU-corpus result only. Scoop (ACLU/anyone publishes an automated extension) → comparison
note, stop. Scraping ToS/CFAA flag → restrict to the ACLU dataset.

**Biggest risk.** The founding/wedge thesis is weaker than framed, collapsing value to "credential
only": CC BY-NC blocks a commercial product on the substrate; enforcement is a documented vacuum;
methods are copyable and incumbents already sell the product. This is feature-not-a-company, matching
09's venture-viability-3 ceiling for the whole domain.

**Verdict: viable.** Feasible, near-perfect skills fit, ~$100 / ~6 weeks, and the eval-methodology
question (can a jury reproduce hand-found defects at F1≥0.85?) plus the longitudinal readout are
legitimately unpublished. Novelty moderate (half the artifact is re-implementation; scoopable by the
ACLU team). A hire credential and citable note — not a company.

---

#### FOUR-FIFTHS-KIT — correct open reference implementation of the disparate-impact math

**RQ.** The LL144 market produces mechanically wrong disparate-impact numbers (54% of audits report
impossible ratios >1; missing-data handling silently converts fails to passes). Can a single correct,
auditable, open reference implementation of the four-fifths math — with documented handling of the
choices that broke real audits (comparator aggregation, sub-2% groups, intersectional cells,
missing-demographic imputation bounds) — reproduce the ACLU corpus's numbers where right and expose
them where wrong, and generalize to the copycat regimes (CA/IL/NJ, Colorado insurance)?

**Gap.** Gap #1 (no audit standards; "audit" is undefined) + Gap #2 (audits don't convert to
accountability, partly because the numbers are wrong/unverifiable). A correct, shared implementation
is the missing primitive.

**Method.** An open Python toolkit computing selection/scoring rates and impact ratios to the LL144
statutory definition, plus a "defensive mode" reporting lower/upper bounds under missing data (the
Gerchick critique) that refuses to emit impossible ratios. Validate by re-running over audits_full.csv:
reproduce correctly-computed ratios and independently regenerate Gerchick's "impossible ratio" and
"70% of ratios have lower bounds <0.8" findings from raw counts. Then port the metric layer to
neighboring regimes as pluggable definitions (CA CRC / IL HRA framing, Colorado SB 21-169 style).
Cross-check the Holistic-AI regression-metrics critique (arXiv:2302.04119). ~$0 API; laptop.

**Cost + time (realistic).** Cost trivial (~$0–50). Time binding: the ~50 hr estimate is optimistic —
matching Gerchick's PDF-scraped extraction choices and porting to CA/IL/NJ + Colorado (a different
math family, not a config swap; the Colorado ECDIS test is a proxy-race regression audit) is **60–80
hrs**. Honest move: descope to a bulletproof LL144 reference impl + missing-data bounds + Gerchick
reproduction, treat other jurisdictions as documented stubs.

**Artifact.** Open-source pip-installable bias-audit toolkit (aedt-fairness or similar): correct
four-fifths engine, defensive missing-data bounds, multi-jurisdiction metric plugins, a Gerchick-
reproduction notebook, and a CLI that ingests an applicant-flow CSV and emits a compliant, defect-free
audit table. MIT-licensed.

**Founding read (2).** Weak — a thin veneer on a crowded shelf. The engine already exists open-source
(pymetrics audit-ai MIT, Aequitas, AIF360, Fairlearn); the multi-jurisdiction plugin wedge already
ships (VerifyWise, active, 16 frameworks incl. LL144/EEOC/California FEHA). Real defensible
contribution shrinks to two features (defensive bounds + impossible-ratio refusal) + a reproduction
credential — copyable by an incumbent in days. A feature + validation study, not a company with a
moat.

**Hire read (4).** Strong. "I built the validated reference implementation that reproduces the ACLU's
peer-reviewed LL144 findings and adds the missing-data bounds the field lacks" is a concrete signal
for BABL/Holistic/DCI/ORCAA and IAAA/ISACA; uses exactly the classical-ML + data-pipeline stack.

**Closest prior work + delta.** Three layers sit almost on top: (1) audit-ai / Aequitas / AIF360 /
Fairlearn implement disparate-impact ratios; (2) VerifyWise ships the multi-jurisdiction plugin moat;
(3) Gerchick et al. is the reproduction target (R code + CC BY-NC dataset). **Real delta (narrow but
genuine):** nobody ships defensive missing-data lower/upper BOUNDS operationalizing the Gerchick
critique, a mode that REFUSES impossible ratios >1 and diagnoses the comparator-aggregation cause, or
a validated pip-installable Python re-implementation reproducing Gerchick aggregates from raw counts.
**Scoop risk moderate-high** (Colorado regression angle actively worked; VerifyWise ships fast).

**Success (pre-reg).** All must hold: reproduces ≥95% of correctly-computable ratios to within
rounding vs. Gerchick's R code; independently regenerates BOTH headline aggregates from raw counts
(~54% audits with a ratio >1; 70% of ratios with lower bound <0.8); defensive-bounds mode reproduces
≥1 published bound interval; refuses every ratio >1 and re-classifies the DCI-traced cases;
pip-installable + MIT + a CLI + ≥1 external engagement signal within 8 weeks.

**Kill (pre-reg).** Can't reproduce the two headline aggregates within rounding → the reproduction is
the whole credential, no differentiation without it. Divergence >5% traced to your bug → stop. Scoop
(a maintained library ships defensive bounds + impossible-ratio refusal) → replication/comparison note
positioning the Gerchick-reproduction as the contribution. Descope (not kill) if the multi-jurisdiction
port overruns.

**Biggest risk.** Novelty is a thin veneer on a crowded shelf — the engine and the multi-jurisdiction
moat already exist open-source. The defensible contribution collapses to two features + a reproduction
credential; an incumbent absorbs the bounds feature in days, so there is no durable moat, and doing
the audit math correctly is a low-defensibility services/consulting wedge.

**Verdict: viable.** Viable as a hire-credential and clean re-analysis artifact; weak as a company.
Feasibility and skills-fit near-perfect; the reproduction credential is exactly the researcher's
published lane. But the core engine and multi-jurisdiction wedge already exist, so novelty and
founding value are low. Run it only for the hire credential: descope to LL144 reference impl +
Gerchick reproduction, drop the moat/SaaS framing.

---

#### RAG-CONFORMITY — EU AI Act conformity-eval harness + test card

**RQ.** For a regulated, EU-AI-Act-relevant vertical use of an LLM (HR/hiring-screening chat OR
legal-research RAG, both "high-risk"), can a pre-registered, adversarial conformity-eval harness —
modeled on RegLab's "Hallucination-Free?" legal-RAG audit and MedHELM's LLM-jury validation —
quantify a claim a vendor would have to attest to (hallucination/unsupported-assertion rate, or
disparate refusal/quality across protected-attribute-perturbed inputs), and produce a reusable,
vertical-agnostic "conformity test card" mapping each metric to a specific EU AI Act / NIST AI RMF
obligation?

**Gap.** The EU AI Act conformity-assessment ecosystem is the largest coming demand source for
third-party auditors, is out of prior scope, and is methods-thin. Also Gap #7 (uneven vertical
coverage) and Gap #4 (independence) — a preregistered vendor-independent harness is the antidote to
scope capture.

**Method.** Pick ONE narrow high-risk task. A small preregistered test set: realistic queries +
counterfactual perturbations that flip only inferred protected attributes, plus factual-grounding
probes. Measure (a) unsupported-assertion/hallucination rate via a cross-vendor LLM-jury validated
against a hand-labeled subset (report jury-vs-human ICC) and (b) disparate quality/refusal across
perturbations via standard fairness stats. Wrap outputs in a "conformity test card" citing which EU AI
Act high-risk requirement (Art. 9/10/15) and NIST AI RMF function each number speaks to. 2–3 frontier
models cross-vendor.

**Cost + time (realistic).** Money NOT the binding constraint — realistic spend **$50–200** even with
~10 pre-registration iterations. The binding constraint is the 60hr/6wk cap: this bundles FOUR
non-trivial builds (perturbation generator, hand-labeled validation subset, fairness-stats pipeline,
the novel test-card spec + preprint) — the most ambitious of the trio; the test-card spec alone can
eat a week.

**Artifact.** Open "conformity-eval harness" repo (task dataset + perturbation generator +
cross-vendor LLM-jury judge + fairness stats) + a reusable "AI Act / NIST-RMF conformity test card"
spec + a worked example report on 2–3 named models + a short preprint.

**Founding read (2).** Weak, and it depends on a standard that does not yet exist. The
notified-body/conformity market is the largest coming demand source and methods-thin, and the harness
+ card is vertical-portable — but no notified bodies are even designated yet, no official standard
exists to map against, and a solo researcher's self-authored crosswalk carries no regulatory
authority. Incumbents (BABL/Holistic/notified bodies) are better positioned to own the standard.

**Hire read (4).** Strong — the most legible hire credential of the researcher's options; extends his
exact published work (preregistered LLM-as-judge RAG-hallucination eval, ICC validation) into the
single highest-demand regulatory context. A direct signal for AVERI/METR/Apollo/Patronus/BABL/
Holistic.

**Closest prior work + delta.** Two axes each occupied; the bet is the intersection is empty. Legal/
technical mapping: arXiv:2512.13907 maps 11 AI Act requirements to 66 verification activities but has
ZERO empirical LLM measurement (case study is automotive). Hiring-fairness measurement is CROWDED (the
real scoop threat): PopResume (arXiv:2603.22714) already does causal counterfactual protected-
attribute perturbation on LLM screeners across six models; arXiv:2507.11548 audits intersectional
resume bias. **Delta:** the unclaimed contribution is the test-card spec + validated-jury layer, NOT
the perturbation measurement (which PopResume largely did). **Scoop risk MODERATE-HIGH** on the hiring
instantiation, peaking right at the Aug-2026 high-risk deadline; legal-RAG is less scooped.

**Success (pre-reg).** Freeze ONE task (recommend legal-RAG to escape the crowded resume field and
stay on the RAG-hallucination turf); freeze prompt set (≥150 grounding probes + ≥150 counterfactual
pairs), the 3-judge jury, and the ≥100-item dual-annotated validation subset before scoring. SUCCESS
= jury-vs-human ICC ≥ 0.6 AND ≥1 significant grounding-failure or disparate-refusal gap (α=0.05,
corrected) AND a completed test-card mapping every metric to a named AI Act article + NIST function. A
clean null still ships if the ICC gate passes.

**Kill (pre-reg).** ICC < 0.4 → publish the negative methods finding ("LLM-jury unreliable for
conformity attestation here"), stop. Harness can't discriminate + no perturbation disparity → stop.
Scoop (an AI-Act conformity harness+card ships first) → comparison note, stop. TIME kill: at 30 hrs
without a ≥0.6-trending ICC → cut to the test-card spec + a single-model worked example.

**Biggest risk.** The test-card spec is the ONLY genuinely novel component and the softest,
least-defensible part. The measurement layer is largely done (PopResume, RegLab); the legal-to-
technical mapping exists at framework level. With no designated notified bodies and no official
standard, a solo crosswalk risks being dismissed as an unauthoritative opinion mapping — the exact
"audit is whatever the auditor says it is" failure mode the domain names as Gap #1.

**Verdict: viable.** The most legible hire credential of the researcher's options — extends his exact
published work into the highest-demand regulatory context. But novelty is thinner than claimed (the
measurement layer is occupied; only the conformity test card is new, the softest part, with real
scoop pressure at the Aug-2026 deadline). Founding value weak (a benchmark+card is a wedge, incumbents
better placed to own the standard). Run it for the hire signal, choose the less-crowded legal-RAG
task, pre-declare the delta vs. PopResume.

---

### Model behavior QA / drift monitoring

09's #3 venture path (deployer-side behavioral contracts + gating against silently-updated third-party
APIs, liability-framed). The domain is crowded/consolidating on the observability side, but the
liability + third-party-endpoint framing is the thin whitespace. All three pilots produce living/CI
artifacts; founding value weak (feature-absorption, low-moat).

---

#### DriftWatch — live multi-axis behavioral drift observatory

**RQ.** Do deployed, closed production models exhibit detectable behavioral drift (persona,
sycophancy, expressed values, emotional tone) across time and silent version updates, and can a
black-box weekly probe catch a drift event before or faster than the vendor discloses it?

**Gap.** No sustained public observatory continuously tracks persona/values/sycophancy/emotion of
deployed models across versions in public (gap #1); judge validity / judge-drift confounds
subject-drift and is never systematically characterized (gap #5). Hostile search confirmed no
continuously-running multi-dimensional public observatory exists.

**Method.** A fixed ~200–250 item prompt bank across 4 behavioral axes (persona self-consistency,
sycophancy via ELEPHANT-style perspective-flip, expressed-values probes, emotional/boundary tone).
Probe 3–4 endpoints weekly by API alias, pinning explicit version strings AND the floating "latest"
alias so silent swaps are visible. Score with a Bradley-Terry bias-calibrated LLM-judge anchored to a
human-labeled set. CRITICAL judge-validity control (closes gap #5): freeze the judge, keep a held-out
human-anchored calibration set each wave, and run a **judge-drift sentinel** (re-grade a fixed golden
transcript set each wave) to separate grader change from subject change. Change detection via
PELT/change-point + Hedges' g per axis.

**Cost + time (realistic).** Cost sound and conservative — ~$50–150 total (crons free, static hosting
free-tier). Time is the real constraint: 50–60 hrs is optimistic because it must cover a FOUR-axis
scoring harness + a small human-anchored calibration set for EACH axis (four labeling passes) + a
maintained dashboard; realistic **60–80 hrs**. Passive weekly runs are genuinely cheap and hands-off
once wired.

**Artifact.** A continuously-updated public web observatory (living dashboard + versioned open dataset
+ weekly change-note posts, SpeechMap-style) + a methods writeup on the judge-drift-vs-subject-drift
separation protocol.

**Founding read (2).** Weak but with the clearest commercial pain of the domain. The GPT-4o sycophancy
incident + Anthropic's "could have been automatically flagged" note make a black-box early-warning
service unclaimed; the living artifact IS the demo for a "behavioral drift monitoring / model-behavior
SLA" seed. But the wedge is weakly defensible — a behavioral-drift SLA competes against well-funded
observability incumbents who add a reference-probe feature the moment it proves valuable.

**Hire read (4).** Strong — an operating public observatory is exactly the artifact SpeechMap's
xlr8harder and Wiese used to become field-legible; maps onto Transluce (Monitor/Docent), Anthropic
Societal Impacts, and Fellows on-ramps.

**Closest prior work + delta.** Wiese, PLOS One (Feb 2026) — solo, preregistered, 10-week × 240-prompt
× 3-model drift study with a Bradley-Terry judge + PELT — is DriftWatch's exact statistical machinery,
already peer-reviewed. **Delta vs. Wiese:** continuous/living observatory (vs. one-shot), FOUR
behavioral axes (vs. accuracy/format/safety), and the per-wave judge-drift SENTINEL (Wiese calibrated
the judge but ran no golden-transcript sentinel) — that third point (closes gap #5) is the single
most novel contribution. SpeechMap covers refusal only. **Scoop risk underweighted:**
github.com/lechmazur/sycophancy is a live, actively-maintained public multi-model sycophancy
leaderboard — it already occupies one of DriftWatch's four axes (though point-in-time, so the temporal
cut survives).

**Success (pre-reg).** Across ≥6 weekly waves on 3–4 pinned endpoints, detect ≥1 significant
change-point (PELT) on ≥1 axis with |g| ≥ 0.5 AND judge-drift ruled out (sentinel variance < the
flagged shift; report both). Artifact success: a continuously-updated dashboard + open dataset + ≥2
weekly change-notes; the separation protocol written up; ≥1 concrete version-swap event on a "latest"
alias timestamped against the vendor's release note. Wedge signal (pre-registered so it can fail): ≥3
inbound contacts, OR ≥1 design-partner conversation, OR a documented would-have-flagged instance.

**Kill (pre-reg).** Judge-drift sentinel variance EXCEEDS subject variance across the first 3 waves
(instrument fails). No detectable drift on ANY axis across 6 powered waves AND no "latest"-alias swap
occurs → downgrade to a negative-result methods note, stop. Scoop (a competing continuous multi-axis
observatory, or lechmazur/xlr8harder ship longitudinal multi-axis first) → comparison note. Effort
overrun: by week 4 without 2 axes working end-to-end → cut to a 2-axis observatory.

**Biggest risk.** Measurement validity swamping the signal: four-axis subjective scoring via LLM-judge
is far noisier than accuracy domains, and after subtracting golden-sentinel variance, no subject-drift
may clear |g|≥0.5 with only ~50 items/axis (underpowered). The BlueDot ELEPHANT audit (52% of flipped
items lost key detail, moving measured sycophancy 13 points) warns these probes are fragile. The
project could produce a real-but-unglamorous methods result (judge instability dominates) rather than
the marketable "we caught a drift event" headline.

**Verdict: viable.** A well-scoped, genuinely feasible (~$50–150, ~60–80 hrs) solo project squarely on
the researcher's published strength, shipping a legible living artifact of the SpeechMap/Mazur class
that maps onto Transluce/Anthropic-Fellows on-ramps — a strong hire credential. But it is a credential,
not a company: Wiese published the spine, Mazur runs a live sycophancy leaderboard, and drift
monitoring is a ~$2.7B field of deployer-centric incumbents. Its one truly novel contribution (the
per-wave judge-drift sentinel) is also its biggest failure mode.

---

#### RegressKit — black-box behavioral regression harness for closed models

**RQ.** Can a black-box behavioral regression-testing harness — version-to-version behavioral diffing
on CLOSED production models — automatically surface a specific, human-legible behavior that changed
between two model versions, at re-analysis-tier cost and without weights?

**Gap.** Diffing asymmetry: internals-rich vs. black-box-poor; Anthropic crosscoders need open weights,
black-box diffing (BehaviorBox/VERBA) is embryonic; version-to-version diffing of CLOSED production
models is nearly empty.

**Method.** Take pairs of production model versions both still queryable. Run a large categorized
behavioral probe suite (refusal edge cases from XSTest/OR-Bench, sycophancy flips, instruction-
following, value probes, boundary pairs). OUTPUT-ONLY diffing that clusters prompts by behavioral
delta (per-prompt divergence = LLM-judge rubric distance + a lightweight embedding-shift signal), then
auto-verbalizes each cluster into a named regression. Validate discovered regressions against public
release notes / known incidents. Metric: precision@k vs. human-confirmed changes; false-positive rate;
whether it rediscovers a documented change. Baseline: aggregate benchmark deltas + a held-out "no
change" control pair.

**Cost + time (realistic).** API cost trivially under budget (~$30–100). Time 55–60 hrs plausible for
a v1, but building a cluster-and-verbalize pipeline that BEATS the now-published Kempf baseline + mining
release-note ground truth pushes to the top of the range or over. The binding constraint is researcher
hours + finding version pairs with DOCUMENTED behavior changes to validate against.

**Artifact.** Open-source pip-installable harness (probe suite + black-box diff/cluster/verbalize
pipeline) + a public "model version regression report" for 2–3 real closed pairs, reproducible repo +
scorecard.

**Founding read (2).** Weak. Teams building on APIs have no behavioral CI; "behavioral regression
testing / snapshot diffing as a service" is a clean B2B dev-tools wedge — but a thin one, and the
method is now largely scooped, so the wedge narrative is soft.

**Hire read (3).** Moderate — lower than the domain's other pilots because the headline novelty is
gone. As proposed it's a solid eval-engineering credential reading for CMU-Neubig-adjacent, Transluce,
and Anthropic-diff-tool audiences, but only if repositioned around a real delta.

**Closest prior work + delta.** DIRECT SCOOP: Kempf/Schrodi/Cywinski/Brox/**Neel Nanda**/Arthur Conmy,
"Simple LLM Baselines are Competitive for Model Diffing" (arXiv:2602.10371, Feb 2026, code released)
already does LLM-based model diffing on CLOSED API models (Claude, GPT-5, Grok-4) with cluster+verbalize
into named differences and defined eval metrics beating SAE baselines — ~90% of RegressKit's method,
from a top interp lab. **Delta remaining:** (a) framing as version-to-version REGRESSION CI and (b)
validation against DOCUMENTED real production regressions as ground truth. Also: pip-installable "LLM
Behavior Diff" tools and governance-CI papers already exist. **Scoop risk high and already partially
realized.**

**Success (pre-reg).** On ≥1 closed pair with a PUBLICLY DOCUMENTED behavior change, the harness
independently rediscovers it as a top-10 cluster (precision@10 ≥ 0.5, ≥2 human-verifiable named
regressions); beats BOTH aggregate benchmark deltas AND the reproduced Kempf baseline on the same
pairs; a "no change" control yields ≤1 spurious regression; pip-installable harness + scorecard repo +
report on 2–3 real pairs.

**Kill (pre-reg).** precision@10 < 0.3 across ALL pairs; OR every "regression" reproducible on the
control (decoding randomness); OR fails to rediscover even one documented change; OR does not
outperform the reproduced Kempf baseline on any metric on any pair → stop, publish a comparison note
only. Scoop-stop on the CI-regression + real-incident-ground-truth angle.

**Biggest risk.** The core method was already published ~5 months ago by a Neel-Nanda/Conmy team on
closed API models with clustering and verbalization. The brief's premise ("black-box closed
cross-version diffing is nearly empty") is stale. Unless RegressKit pivots hard to the DOCUMENTED-
production-regression ground truth + a head-to-head beat of Kempf, it ships a strictly-worse
reproduction.

**Verdict: viable.** Cheap, fast, dead-on his skills, and the CI-for-model-behavior framing is
genuinely useful — but the headline novelty is gone (Kempf/Nanda/Conmy already did closed-model
diffing with cluster+verbalize). Survives only if repositioned around rediscovering DOCUMENTED
regressions as ground truth and beating the Kempf baseline in a CI harness. As proposed, a solid
eval-engineering credential and a thin dev-tools wedge; as novel research, largely scooped.

---

#### ContractGuard — behavioral-contract gate + benchmark-fragility audit

**RQ.** Can a lightweight, executable "behavioral contract" spec + gate — NL behavioral assertions
compiled into automated black-box tests with calibrated pass/fail thresholds — reliably GATE a model
swap by catching contract-violating behavior changes, and does it hold up under an adversarial audit
of its own validity?

**Gap.** Gap #3 (benchmark fragility under audit — almost no behavior benchmark independently audited;
auditing is cheap/publishable/needed) + gap #2 (psychometric validity crisis — human/ad-hoc
instruments give unstable, agree-biased results; LLM-native instruments with demonstrated reliability
mostly missing).

**Method.** A small DSL/schema for behavioral contracts (assertion in NL + probe set + rubric +
calibrated threshold + CI). Ship ~15–20 reference contracts across sycophancy, over-refusal, persona
stability, value-consistency. The gate runs all contracts and BLOCKS if a contract regresses beyond
threshold. The research contribution is VALIDITY: (a) audit the underlying benchmarks for fragility
(replicate the BlueDot ELEPHANT finding — 52% of flipped items lost key detail, moving measured
sycophancy 13 points — and report item-survival under a quality filter); (b) measure test-retest
reliability of each contract; (c) report threshold calibration against a human-anchored set.

**Cost + time (realistic).** Tight but plausible <$500 ONLY with tiering — a naive 15–20 contracts ×
~60 items × ~8 reruns × ~6 versions ≈ 57K generations + a judge pass each blows past $500 at frontier
prices; at Haiku/mini-class for bulk + frontier only for the calibration anchor it lands **$150–400**.
Time 55–60 hrs optimistic; a DSL + runner + calibration + audit + stats + write-up is **70–90 hrs**.
Descope to a thin YAML schema over Inspect/promptfoo rather than a new compiler.

**Artifact.** Open-source "behavioral contract" spec + gate CLI (YAML contracts + runner + calibrated
thresholds) shipped WITH an audit report: reliability + benchmark-fragility scorecard for every
reference contract, so the tool ships with its own validity evidence.

**Founding read (2).** Weak. Turns model-behavior QA into an executable CI gate (contracts are the
recurring, versionable asset; the audit report is the trust-builder) — but the concept is already
published (NTNU, Apr 2026), the gate surface is commoditized (promptfoo/DeepEval/LLMQ), and contracts
are trivially cloneable. The "moat" is a one-time trust artifact, not a recurring asset.

**Hire read (4).** Strong strictly as a credential — the validity-audit angle (test-retest reliability
+ a BlueDot-style item-survival scorecard shipped WITH the tool) is a genuine, publishable, on-brand
extension of the LLM-as-judge strength; benchmark-fragility auditing is explicitly "cheap, publishable,
needed," reading for Apart, Transluce, and eval workshops.

**Closest prior work + delta.** Three 2026 works land nearly on top: (1) "Test Before You Deploy:
Governing Updates in the LLM Supply Chain" (arXiv:2604.27789, NTNU) IS the core primitive
(deployer-side "Production Contracts" with thresholds + compatibility gates that BLOCK updates,
validated on 7 Claude versions) — but explicitly leaves threshold calibration, test-retest
reliability, and coverage OPEN. (2) "BenchGuard" (arXiv:2604.24955) is the benchmark-audit half. (3)
"Reliability without Validity" (arXiv:2606.19544) owns the reliability-of-scoring methodology (541K
judgments, Krippendorff alpha). Commodity tools already ship NL-rubric assertions + thresholds + CI
gates. **Delta:** the validity-audit-of-behavior-contracts framing. **Scoop risk HIGH on tool/concept,
MEDIUM on the framing.**

**Success (pre-reg).** ≥10 of ~15–20 contracts clear a pre-set test-retest floor (Krippendorff alpha ≥
0.67 over N≥5 reruns) with CIs; false-block rate below a pre-set ceiling (<5%) on a control no-change
pair; gate precision/recall on ≥8 pre-specified known-good vs. known-regressed pairs, beating BOTH the
raw-benchmark baseline AND the naive-fixed-threshold baseline at p<0.05; a benchmark-fragility
scorecard with item-survival per contract.

**Kill (pre-reg).** Fewer than half the contracts clear the floor; OR the reference benchmarks are too
broken to gate on and no cheap fix restores them; OR the calibrated gate doesn't beat the naive
fixed-threshold baseline (validity work adds no value); OR scoop (calibrated + reliability-audited
behavioral-contract gating ships first). Early kill at ~15 hrs if the thin-schema-over-Inspect isn't
running 3 contracts end-to-end.

**Biggest risk.** The concept is already published (NTNU) and its two hard sub-problems (reliability,
calibration) are being worked by better-resourced groups, while the tool surface is commoditized.
ContractGuard risks being neither novel research (scooped primitive) nor a defensible product
(cloneable contracts) — collapsing into "a nicer wrapper with an audit appendix."

**Verdict: viable.** Viable strictly as a hire credential, not a company. The validity-audit angle is
a genuine, publishable, on-brand extension of the researcher's strength. But the founding thesis is
weak: NTNU scooped the primitive, commodity tools ship the gate, contracts aren't a moat. Reframe to
the pure audit-and-reliability contribution (drop the SLA/product narrative), descope the DSL to a
thin schema, treat it as an eval-workshop/portfolio credential.

---

### Evaluation & LLM-as-judge (hire credential)

09's #6 domain — the best-funded, fastest-consolidating corner, the *opposite* of whitespace for a
late solo entrant. These are the purest hire-credential plays: dead-center on the researcher's
published turf, but in the most commoditized, fastest-scooped lane. Founding value uniformly weak; two
of three have novelty 2 and one (LeaderAudit) is the set's only **weak** verdict.

---

#### JudgeFlip — judge-swap / quantization flip-rate vs. nondeterminism floor

**RQ.** For RAG-hallucination verdicts rendered by an LLM-as-judge, does swapping the judge model
family or quantization level flip more verdicts than the judge's own run-to-run nondeterminism floor?
Falsifiable: judge-swap and quantization-swap flip rates exceed the floor by a statistically
significant margin (paired McNemar, p<0.05), meaning published pass/fail "hallucination" numbers are
an artifact of judge choice, not of the answer.

**Gap.** Eval statistics exist but nobody uses them, intersected with AILuminate's named "grader
uncertainty" limitation: nobody has quantified whether LLM-judge verdicts survive judge-swap/
quantization relative to a nondeterminism floor, and judge outputs are almost never reported with
clustered error bars.

**Method.** Reuse the researcher's existing published RAG-hallucination setup + dataset (re-analysis
tier). Fix ~300–500 (query, context, answer) items with human labels. Three swap axes: (a)
NONDETERMINISM FLOOR (same judge, same prompt, 5 repeat calls); (b) MODEL-FAMILY swap (≥4 judges, ≥3
vendors + one open-weight); (c) QUANTIZATION swap (one open-weight judge fp16 vs 8-bit vs 4-bit
locally). Primary: per-axis verdict flip rate + clustered SE (cluster by source document, per Miller
2411.00640) + paired McNemar tests vs. the floor. Secondary: does flipping correlate with judge
confidence or answer length (confound check)?

**Cost + time (realistic).** Cost dramatically over-budgeted — realistic **~$30–100**, not $500 (a
RAG-judging item costs well under a cent; Batches API halves it; quantized inference free on laptop).
The true budget is TIME: 50–60 hrs plausible IF the existing labeled dataset is reused; the
Inspect-Evals/lm-eval scorer-plugin packaging is the underestimated sink (15–20 hrs alone). Realistic
**55–70 hrs**; kill/pivot fast if labels aren't in hand.

**Artifact.** A short preprint + a reusable "judge-flip harness" notebook (takes any (item, label,
judge-set) triple → flip-rate-vs-floor tables with clustered SEs + McNemar) shipped as an
Inspect-Evals / lm-eval-harness-compatible scorer plugin.

**Founding read (2).** Weak. The flip-rate harness seeds a "judge reliability certification" offering
for the commercial eval/observability layer (Braintrust/Langfuse/Confident AI class) — but that is a
thin benchmark, not a company, and 09 rates this the best-funded, fastest-consolidating corner.

**Hire read (4).** Strong (primary). The researcher's exact published niche upgraded with the field's
live methodology frontier (Miller-style clustered SEs + nondeterminism accounting) — a direct, legible
signal to AISI/Apollo/MLCommons/eval-vendor hiring managers.

**Closest prior work + delta.** "The Coin Flip Judge?" (arXiv:2606.13685, June 2026) measures the
nondeterminism floor (13.6% mean pairwise flip rate) + biases, but ONLY on OpenAI models, no
cross-vendor family swaps, no quantization, and — critically — does NOT run the paired swap-vs-floor
comparison that is JudgeFlip's spine. **Defensible delta:** the combination {RAG-hallucination verdicts
+ cross-vendor + quantization + McNemar-tested excess over the floor with document-clustered SEs}. No
single paper does all three. **Scoop risk HIGH** — the field's documented gold-rush lane; a
cross-vendor + quantization follow-up is the obvious next paper. Note: a 2026 study found cross-family
judge agreement so high (κ=0.93, ρ=0.97) that judge choice did NOT reorder rankings — direct
counter-evidence, meaning the "clean null" is a live and arguably likely outcome.

**Success (pre-reg).** Pre-registered on a frozen ~300–500 item set: for BOTH swap axes, a paired
McNemar test shows the swap flip rate exceeds the floor at p<0.05 on ≥1 metric, surviving
document-clustered SEs (report naive-vs-clustered side by side — survival is itself a headline). A
reusable Inspect/lm-eval scorer plugin that ≥1 external person runs on their own data within 60 days.
Preprint + notebook posted. A statistically clean, honestly-clustered NULL counts as full success.

**Kill (pre-reg).** Scoop (the cross-vendor-swap-AND-quantization-vs-floor comparison on hallucination/
faithfulness ships first) → comparison/replication note, stop. Labels can't be assembled/reused in ~8
hrs → pivot to RAGTruth/HaluEval or report the label-reliability barrier. Same-judge run-to-run flips
so high no swap could exceed them at n≈400 → report "nondeterminism dominates," stop. Zero of 3–5 cold
outreach contacts would use the scorer plugin → don't invest in packaging.

**Biggest risk.** Commoditization + scoop, not feasibility. The LLM-judge-reliability niche is the
field's most crowded lane, a near-identical June-2026 neighbor exists, and the obvious extension is the
next paper dozens of groups will write. Worse, published κ=0.93/ρ=0.97 evidence argues the core
prediction may be FALSE, evaporating the positive headline into a null. Credential value hinges almost
entirely on the DISTRIBUTION EDGE (a genuinely adopted Inspect/lm-eval scorer a named lab runs), which
this plan has no validated demand for.

**Verdict: viable.** Feasible to the point of trivial ($30–100) and a perfect skills fit on his exact
published turf — but novelty is a real-but-narrow delta in the field's most commoditized, fastest-
scooped lane, with a June-2026 near-neighbor and live counter-evidence (κ=0.93) that the headline may
null out. A legible hire signal ONLY if the scorer plugin gets adopted (unvalidated); as a founding
wedge it's a thin benchmark. Run only with pre-registered scoop + null protocols, reuse existing
labels, gate the packaging tier on 2 real "we'd use this" replies.

---

#### HalluJudgeBench — construct-validity meta-benchmark for hallucination judges

**RQ.** Do the LLM-as-judge configs used to score RAG-hallucination benchmarks actually measure
hallucination, or something incidental (length, fluency, hedging, refusal)? Predictions: (a)
inter-judge agreement across vendors on the SAME items is materially below the human-human ceiling; (b)
judge verdicts are predictable from surface features at above-chance AUC after controlling for the true
label — low construct validity per Bean et al. 2511.04703.

**Gap.** The construct-validity strand + the AILuminate "grader uncertainty" limitation applied
specifically to RAG-hallucination judges: no meta-benchmark testing whether these judges measure
hallucination vs. surface features, nor a construct-validity checklist for them.

**Method.** Assemble a labeled item set (existing dataset + a modest new hand-adjudicated slice for the
human ceiling). Score every item with a matrix of judge configs (≥4 judges × common prompt variants:
strict/lenient rubric, with/without CoT, with/without context shown). Compute: (1) inter-judge
agreement (Cohen's/Fleiss kappa with bootstrap CIs) vs. a human-human ceiling from double-annotation;
(2) construct-validity probe (train a lightweight classifier to predict each judge's verdict from
surface features, report AUC controlling for the true label); (3) a small operational construct-
validity CHECKLIST for hallucination judges. Baselines: human ceiling + a trivial length/overlap
heuristic judge.

**Cost + time (realistic).** Roughly right but tighter than stated. The 4-judge × 6-variant × 500-item
× 3-seed matrix ≈ 36K judge calls; ONE premium judge alone (Opus 4.8) is ~$540 — over budget. Stays
<$500 (realistically $150–350) ONLY if most of the matrix is mid/cheap models and/or the CoT sweep is
capped to a subset. The real cost is HOURS for the human double-annotation slice; 55–60 hrs plausible
only if reusing existing labeled RAG-hallucination data.

**Artifact.** A public hallucination-judge meta-benchmark (labeled item set + judge-config score matrix
+ agreement/construct-validity report card) + a reusable construct-validity checklist and harness,
positioned as an EvalEval shared-task / Inspect Evals contribution.

**Founding read (2).** Weak. A validated hallucination-judge meta-benchmark + checklist is a buyable
trust artifact for the RAG/eval-tooling market (hallucination detection is the commercial layer's
flagship claim) — but it's a trust artifact, not a company.

**Hire read (4).** Strong. Fuses the researcher's two documented strengths (LLM-as-judge for RAG
hallucination + agreement statistics) with the field's hottest methodology theme (construct validity,
Bean et al. NeurIPS 2025) into the grad-student-led-meta-evaluation shape that lands (BetterBench,
Measuring What Matters) — signals fit to Oxford OII / EvalEval / MLCommons AI Risk & Reliability WG.

**Closest prior work + delta.** Three published works occupy the core one-to-one: (1) "The Illusion of
Progress" (arXiv:2508.08285, EMNLP 2025) already shows answer-LENGTH baselines rival hallucination
detectors with LLM-judge + human kappa 0.799 — prediction (b) done. (2) "Judge's Verdict"
(arXiv:2510.09738) evaluates 54 judges on RAG/agentic samples vs. a human-human ceiling (kappa 0.801)
— prediction (a) done. (3) "Reliability without Validity" (arXiv:2606.19544) runs 21 judges across 9
providers, ships a judge validation checklist, and found verbosity bias tiny (<0.011). **Real delta:**
the fusion applied to RAG-hallucination JUDGE CONFIGS with a rubric × CoT × context-shown matrix — a
thin, genuine sliver. **Scoop risk HIGH** (the field published 8 judge-reliability papers in one 5-day
June-2026 window; verbosity bias may already be "solved").

**Success (pre-reg).** Artifact ships publicly (labeled set + score matrix + report card + harness +
checklist). Positive success IF (a) inter-judge kappa across ≥4 vendors falls ≥0.15 below the
double-annotated human ceiling with non-overlapping bootstrap CIs AND (b) ≥1 judge config's verdicts
predictable from surface features at AUC≥0.65 after controlling for the true label. A well-powered NULL
also ships. Hire success (the real target): a named eval group engages/cites/merges within ~3 months.

**Kill (pre-reg).** Scoop (the RAG-hallucination-judge fusion ships first) → comparison/replication
note extending their result on his own labeled data, stop. Uninteresting null (judges match the
ceiling AND verbosity bias near-zero, as already found) → downgrade to a blog note, don't scale. Human
ceiling can't be built in <15 hrs → report the barrier. Budget >$400 on first audit → cut to 3 judges
+ subset the variant sweep.

**Biggest risk.** Novelty collapse under a fast-moving crowd. Both predictions are already substantially
demonstrated in adjacent published work, leaving a thin "hallucination-judge-configs specifically"
sliver in a subfield publishing ~8 papers a week. Most likely outcome: a competent-but-derivative
meta-benchmark reading as "yet another judge-reliability study," or a mid-flight scoop.

**Verdict: viable.** Excellent skills-fit and feasible, which clears "viable" — but novelty is weak:
the two headline predictions are each already published in near-identical form, leaving only a thin
sliver in a subfield shipping ~8 reliability papers a week. A hire credential (shows he can execute
the field's hottest methodology on his own turf); a trust artifact, not a company. Recommend running
JudgeFlip or the leaderboard stat-audit first (cleaner novelty for the same skills), and only run
HalluJudgeBench if a fresh scoop check shows the sliver still open.

---

#### LeaderAudit — clustered-SE re-audit of static/agent leaderboards

**RQ.** Across prominent STATIC capability/agent leaderboards (not Arena, which already ships
Bradley-Terry CIs), how many headline "model A > model B" rankings survive proper clustered standard
errors and paired-difference tests at p<0.05? Prediction: a large fraction (pre-registered, e.g. >30%)
of adjacent-rank gaps on ≥1 major leaderboard are NOT statistically significant once clustered SEs
(clustering by shared passage/repo/task-family) and paired tests are applied — the published order is
partly noise.

**Gap.** Eval statistics exist but nobody uses them — recomputing public rankings with clustered SEs +
paired tests, sharpened by the finding that Arena already has CIs so the real vacuum is static
capability/agent leaderboards.

**Method.** Re-analysis over PUBLIC per-item score data. Target 2–3 leaderboards where per-item results
are downloadable (an lm-eval/HELM-style multi-task board + an agent board such as SWE-bench-family or
GAIA where per-instance pass/fail is public). For each: recompute scores with clustered SEs (cluster =
shared passage / repo / subfamily); run paired McNemar between adjacent rank pairs on the SAME items;
run a power analysis (how many more items to resolve current ties). Deliver a "significance-corrected
leaderboard" with ranks collapsed into statistical tie-bands.

**Cost + time (realistic).** Cost low and accurate — SWE-bench's public experiments repo ships
per-instance resolved/unresolved for every submission (free); an optional API re-run slice is trivially
<$500. Time (40–55 hrs / 4–5 wks) realistic and if anything conservative — the prior paper is a
published reference implementation, so this is largely re-running a known pipeline on new (agent) data.
Scoped to the survivable delta: 2–3 wks as an extension note.

**Artifact.** A public "stat-check" notebook/CLI (ingests a leaderboard's per-item results → clustered
SEs, pairwise paired tests, tie-bands, required-N power estimate) + a short paper + a living
"significance-corrected leaderboard" page as the case study.

**Founding read (2).** Weak. The "stat-check" engine is a natural component for the commercial
eval-tooling layer or a BetterBench-style certification service, and "the person who audited the
leaderboards" is durable positioning — but the positioning is already taken (see delta), and the engine
is a feature.

**Hire read (3).** Moderate — downgraded because the standout "first to audit the leaderboards"
credential is gone. It still demonstrates the statistical-methodology strength the brief flags as the
highest-fit gap, using only public data, but reads as a derivative extension rather than a distinctive
credential.

**Closest prior work + delta.** NEAR-COLLISION: "Resolution Diagnostics for Paired LLM Evaluation"
(arXiv:2605.30315, May 2026, solo author) already does ~70–80% of LeaderAudit — recomputes public
static leaderboards (Open LLM Leaderboard v1, MMLU-Pro) with paired McNemar / paired-bootstrap +
cluster-robust methods, reports the exact headline metric (11/40 gaps below resolution on OLL v1),
clusters by task-family, confirms the paired-vs-unpaired required-N result, and SHIPS a pip-installable
tool (llm-power) "for leaderboard maintainers." It is the exact solo-author credential comparator the
pilot cites. **Delta that survives:** it explicitly EXCLUDES agent leaderboards and pairwise/judge
boards, listing those as FUTURE WORK. So the open lane = agent boards (SWE-bench/GAIA), clustering by
repo/issue, + the tie-band visual. **Scoop risk HIGH and RETROACTIVE** — the pilot's own week-1 scoop
keywords surface 2605.30315 immediately, so by its own rules it must narrow or publish a comparison
note and stop.

**Success (pre-reg).** Target ≥2 AGENT leaderboards with public per-instance pass/fail; recompute with
cluster-robust SEs (repo/issue for SWE-bench; task-family for GAIA) + paired McNemar on shared
instances; SUCCESS = >30% of adjacent-rank gaps evaporate at p<0.05, AND ship a tie-band "significance-
corrected agent leaderboard" + a CLI extending (and explicitly citing) Kotawala's llm-power to the
agent/repo-clustered setting + a required-N power estimate; a named agent-board maintainer or eval
scientist engages.

**Kill (pre-reg).** Scoop-extended (a paper/tool covers agent-board significance re-analysis with
repo/task clustering) → comparison note, stop. Null (<10% of gaps flip AND boards already report
adequate uncertainty — some, like SWE-bench Pro, now ship ±3.5pt CIs) → report the null, stop. Data
(per-instance pass/fail not downloadable for enough models on ≥2 boards) → report the transparency gap,
stop. Derivative-check: if the honest framing collapses to "I re-ran Kotawala on agent data," ship it
as a 2–3 wk extension note — do NOT scale it into the flagship credential.

**Biggest risk.** The core claim is already published. The premise ("nobody recomputes public rankings
with clustered SEs + paired tests; nobody built the tool") is FALSE — Kotawala owns the framing, the
headline metric, and a released tool, and the "person who audited the leaderboards" positioning is
taken. As written it self-triggers its own scoop protocol in week one.

**Verdict: weak.** Feasibility and skills-fit are a 5 (public paired data, near-zero cost, dead-center
in his eval lane), but novelty has collapsed: a solo-author 2026 paper (arXiv:2605.30315) already
recomputes static leaderboards with clustered SEs + paired McNemar, reports the exact metric, and ships
the tool — leaving only agent/judge boards as future work. What survives is an incremental extension
shippable in 2–3 weeks but reading as derivative rather than the "first to audit the leaderboards"
credential the spec promises. Recommend either dropping it for a less-crowded eval pilot or explicitly
re-scoping it as a cited Kotawala-extension note with modest expectations.

---

## Recommended starting set

The [Stage-2 rule](04-topic-selection-process.md) still holds: **run 2–3 across different domains, not
all fifteen.** The pilots exist to compare domains on real evidence, then the survivor earns the deep
commitment. Optimizing for startup marketability — while respecting that the hire path is the more
reliable near-term win — the recommended trio spans three different domains and balances
speed-to-artifact against founding upside:

**1. DriftWatch (Model behavior QA / drift) — the strongest founding wedge, and the best living
artifact.** *Why:* it is the only pilot whose wedge attaches to a *documented, named commercial pain*
(the GPT-4o sycophancy rollback; Anthropic's own "could have been automatically flagged" statement)
rather than a hypothetical buyer, and its living public observatory is a self-refreshing top-of-funnel
in the SpeechMap/Mazur mold that maps directly onto Transluce/Anthropic-Fellows hire on-ramps. It is
also feasible (~$50–150) with genuinely hands-off passive weekly runs, and its one novel contribution
(the per-wave judge-drift sentinel) is a real methodological claim. Its founding value is still only a
2 — but it is the *least weak* founding read in the set, and it double-scores as a strong hire
credential.

**2. ScopeBench (Agent security & auth) — the highest-artifact-impact hire credential in the hottest
venture domain.** *Why:* 09 named agent security the strongest venture bet, and ScopeBench targets the
single most profile-aligned gap (arXiv:2605.16282 Finding 6 — the one risk category with zero primary
benchmarks) while landing a checkable DoomArena upstream contribution. It is the most differentiated
security pilot (SpoofCard is more novel but needs a hand-built testbed and has a shakier
skills-fit at 3; PoisonPipe is 2–6× over budget and more scooped). Fund it as a credential play with
paraphrase-consistency pre-committed as the make-or-break axis, and cite ASTRA on day one.

**3. JudgeFlip (Evaluation & LLM-judge) — the fastest-to-artifact, dead-on-turf hire credential.**
*Why:* it is the cheapest ($30–100) and most directly reuses the researcher's published RAG-
hallucination judging work, so it is the fastest route to a shipped, legible artifact for AISI/Apollo/
MLCommons and the eval-vendor layer. It is the pure hire play — founding value is a thin benchmark —
but it is the lowest-risk-to-ship of the trio and a natural first pilot to run while ScopeBench's cases
are being authored. **Gate the packaging tier on 2 real "we'd use this" replies**, and run it only with
pre-registered scoop + null protocols (the κ=0.93 counter-evidence makes a null a live outcome).

**Fastest to artifact:** JudgeFlip (~$30–100, reuses existing labels, 55–70 hrs — start it first).
**Strongest founding wedge:** DriftWatch (the only documented-commercial-pain wedge + a self-refreshing
living artifact). **Sequencing:** start JudgeFlip while speccing ScopeBench; stand up DriftWatch's
passive weekly cron early so its 6-wave clock runs in the background.

*Substitution notes:* if a week-1 scoop check kills ScopeBench, NinesBench (TypeSafe) is the strongest
substitute — the least-crowded reliability construct with the best moat-seed (a continuously-run nines
scoreboard). If DriftWatch's judge-drift sentinel proves too noisy, AUDIT-LINT (compliance) is the
next-best living-artifact/hire play. Avoid running two pilots from the same domain, and avoid
LeaderAudit (weak) and the two novelty-2 TypeSafe/eval pilots (FormatTax-Live, HalluJudgeBench) except
as fallbacks after a fresh scoop check.

---

## Honest caveats

Preserving the frame from 09 and every evaluation above, without inflation:

- **Founding value never exceeds 2 — feature-not-a-company is the default, not the exception.** Every
  one of the fifteen is a wedge or a credential, not a company. Scope-adherence eval, tool-output
  injection scans, drift/regression testing, behavioral-contract gates, judge-reliability scoring,
  bias-audit linters — all are already checkbox features inside funded platforms (Braintrust, Datadog,
  Arize, VerifyWise, Cleanlab, Cisco DefenseClaw). A solo founder builds the feature faster than the
  distribution. A benchmark is a paper; a paper is not a company.

- **The hire path is the more reliable near-term win.** Skills-fit is a 5 almost everywhere and hire
  value is a 4 on twelve of fifteen — because these artifacts are exactly what agent-security, eval,
  reliability, and compliance teams interview for. The honest recommendation is to treat these as
  proof-of-competence credentials first, and to let a *specific pilot* reveal a real moat before
  choosing "founder" over "get hired."

- **Crowding and scoop risk are pervasive and, in several cases, already realized.** LeaderAudit's core
  claim was published (arXiv:2605.30315) before it could run — the only **weak** verdict, and a live
  example of the risk. FormatTax-Live's engine-variance control is already published (Constraint Tax,
  arXiv:2605.26128). SilentCatch's setting is already a shipped Cleanlab benchmark
  (arXiv:2603.18014, uncited by the pilot). RegressKit's method was published by a Neel-Nanda/Conmy
  team (arXiv:2602.10371). ContractGuard's primitive was scooped by NTNU (arXiv:2604.27789).
  HalluJudgeBench's two predictions are each already demonstrated. The weekly scoop watch is
  load-bearing, not decorative — and several pilots must cite a close, sometimes uncited neighbor on
  day one.

- **Novelty is thin where founding value is highest, and vice versa.** SpoofCard is the most novel (4)
  but has the weakest skills-fit (3) and a hand-built testbed that understates the hours. The
  cheapest, most-on-turf pilots (JudgeFlip, SilentCatch, FOUR-FIFTHS-KIT) are the most crowded. There
  is no pilot that is simultaneously novel, cheap, defensible, and un-scooped — the thin slab of
  whitespace inside a hot market that 09 described.

- **Budgets are optimistic on the compute-heavy pilots; time is optimistic almost everywhere.**
  PoisonPipe is realistically 2–6× over $500 unless cut; NinesBench and HalluJudgeBench break $500 if
  frontier models run across all cells. Hours estimates understate on ScopeBench (70–90), SpoofCard
  (70–90), FOUR-FIFTHS-KIT (60–80), ContractGuard (70–90), and the four-axis DriftWatch harness
  (60–80). Run the week-1 cost/scope slices the specs call for before committing a full grid.

- **The observed exit is absorption, not IPO — and independence and revenue conflict in the neglected
  lanes.** Where a founding path exists at all, the realistic 18–30-month outcome is a tuck-in
  (SentinelOne/Cato/Check Point/Braintrust/ClickHouse/OpenAI/CoreWeave pattern). And the domains with
  the highest impact and least crowding remain the ones where taking money destroys the value
  proposition — the nonprofit/analyst path, unchanged from the charter.

---

*Related: [09 · Startup lens](09-startup-lens.md) (the founding re-scoring this doc operationalizes) ·
[08 · Pilot specs](08-pilot-specs.md) (the impact-first pilot format this extends) ·
[00 · Goals & operating principles](00-goals-and-operating-principles.md) (the three exit paths).*
