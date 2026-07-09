# 23 · Founding upside from the capability frontier & adjacent-to-published

*Written 2026-07-09. A focused founder-scout pass through a single, deliberately narrow **aperture**:
ideas that sit on the **capability frontier** (the newest model/agent behaviors people are only just
learning to trust) and are **adjacent to published work** (a paper or public dataset already exists,
so you can start in days, not months). This is an **add-on to the [doc-20 master ranking](20-decision-and-ranking.md)**,
not a replacement — it does not re-score the eleven. It asks one question: does anything in this
aperture actually **match or beat Kappa (83.3)**, the fastest-ship / best-hire founding bet in the
set, using doc-20's exact weights (Ship 3.0 · Impact 2.5 · Found 2.5 · Exec 2.5 · Hire 1.5)?*

---

## The honest headline

**Nothing cleared.** Zero candidates in this aperture reached the 83.3 bar. Three came close and are
worth your attention as *plausible founding wedges and outstanding current hire artifacts* — but none
of them, scored the same way as the eleven, is a clean "this beats Kappa" call. The strongest
(TrueTool, 82.5) lands essentially **at** Kappa on the composite while trading a point of ship-speed
and executability for real gains on impact and founding-upside — a lateral move, not an upgrade.

So read this doc as a *shortlist of near-misses*, honestly labeled. If Kappa or Ingestion still feel
right after doc-20, nothing here should pull you off them. If you specifically want a bet with a
**bigger founding ceiling** and can absorb a heavier build, TrueTool is the one candidate that argues
for itself on those axes.

**How many cleared, stated plainly: 0 of 3 reached 83.3. All three are near-misses (80–82.5).**

---

## CLEARED (composite ≥ 83.3)

| Name | Composite | Ship | Found | Exec | Moat | One-line |
|---|:--:|:--:|:--:|---|---|
| *(none)* | — | — | — | — | — | No candidate in this aperture matched or beat Kappa's 83.3. |

There is no per-cleared card section, because nothing cleared. The three candidates that came closest
are written up in full below as **near-misses** — same card depth doc-20 gives its ranked eleven, so
you can judge them on the merits rather than on a table row.

---

## The three near-misses, in full

*These did not clear 83.3. They are written up at card depth anyway because each is a genuine founding
wedge and, more reliably, a strong hire artifact right now. Read each as "here is what it would take,
and here is exactly why it lands below Kappa."*

---

### A · TrueTool — behavioral "does-what-it-says" certification for MCP tools — 82.5

**The problem (and where it's documented).** MCP tools ship a declared description and JSON schema,
and agents pick which to call based on that declaration — but the declaration routinely lies. *Description-Code
Inconsistency in Real-world MCP Servers* (arXiv 2606.04769) finds ~13% of servers and 11.2% of tools
carry a description that doesn't match the code, and 35% of servers have at least one such mismatch.
*From Docs to Descriptions: Smell-Aware Evaluation of MCP Server Descriptions* (arXiv 2602.18914)
scans 10,831 servers and finds 97.1% carry at least one description "smell." A 100-server / 12,000-trial
stress test attributes 38% of tool-call failures to schema mismatch. MCPTox (arXiv 2508.14925) ships
45 live servers / 353 tools as a public dataset. The pattern: nobody can tell, before wiring a
third-party server into their agent, whether a tool *actually does what its description claims*.

**Who pays — and this is the strongest part.** It's genuinely **two-sided**, and both sides have
budget. *Demand:* enterprise agent/platform teams and MCP gateways/registries (TrueFoundry, AWS,
Glama) that must gate which third-party servers their agents may call — they buy a per-server
behavioral report plus a monitored badge. *Supply:* MCP server publishers who want a
"behaviorally-certified" badge to win selection — a compliant, smell-free server has a documented ~72%
selection probability versus ~20% baseline, so the badge pays for itself in adoption. Pricing mirrors
the MCP Skills ladder (report ~$2, builder ~$29/mo monitored badge, team ~$99/mo, enterprise custom),
but for a signal nobody else sells.

**Product shape.** A behavioral conformance harness that connects to a *live* MCP server and, per
tool: (1) synthesizes valid + boundary + adversarial call cases from the declared schema, (2) actually
calls the tool, (3) uses an LLM-judge plus deterministic checks to score whether the observed
output/side-effect matches the declared description and return contract — yielding a per-tool
"behavior-matches-claim" score, a defect list, and a machine-readable report. Ships as a free CLI +
public leaderboard of certified servers, a paid per-server deep report, and a monitored badge that
re-runs on every version bump.

**Moat, and why it beats Kappa.** A compounding, hard-to-replicate **behavioral-conformance corpus**:
growing pairs of (declared schema/description, generated test cases, real observed behavior,
matched/mismatched verdict, defect taxonomy) across thousands of real servers over time. That corpus
lets you auto-generate high-signal tests, distill a cheap classifier that predicts defects from
description + schema alone, and show longitudinal "this server regressed at version X." Static scanners
and popularity scoreboards *structurally cannot* produce this — **they never call the tools.** It
beats Kappa's moat on two axes: it's genuinely two-sided (buyers *and* sellers pay, where Kappa serves
only eval-owning teams), and the competitive field is **empty on behavioral signal**, versus Kappa's
contested judge-drift lane.

**Nearest player + your wedge.** MCP Scoreboard (63,504 servers) and Dominion Observatory (14,820) own
the registry-wide badge/distribution surface — but both explicitly disclaim functional correctness.
Scoreboard states outright that it "measures how well a server is built, not whether outputs are
correct"; its "agent compatibility" score is an LLM *reading* the schema without calling the tool.
Dominion's "behavioral trust" is telemetry (crowdsourced success-rate/latency + static GitHub/docs
signals), never an invocation compared to a declaration. Security scanners (Invariant mcp-scan, Cisco
mcp-scanner, Snyk agent-scan) look for poisoning/rug-pulls/injection — malicious intent, not
honest-but-wrong. The official `modelcontextprotocol/conformance` suite is protocol-level only. The
OSS eval libraries that *do* check output (lastmile mcp-eval, mcpevals.io, Stacklok mcp-tef) need
hand-written per-tool tests on your *own* server, or measure tool-*selection* routing rather than
output correctness. **Microsoft MCP Certification** is the only genuinely behavioral proximate — and
it confirms the gap: it's *manual*, verified-publisher-gated (Partner Center + you must own the
endpoint + supply Key Vault creds), and walled to Microsoft's own Copilot Studio / Azure Foundry
catalog. Its non-scalable manual method is precisely the opening. **Your wedge:** an automated,
third-party, cross-ecosystem service that invokes each tool and scores behavior-vs-declaration across
the *public* registry — the exact combination {automated, cross-ecosystem, behavioral-output} that no
one occupies today.

**The real risk.** **Distribution, not technique.** Scoreboard and Dominion already own the
registry-wide badge surface, and invocation-based conformance is a feature they've *chosen* not to
build — not a technical wall. A badge is worth only what buyers see and trust, and an incumbent who
owns the directory can bolt on invocation the moment you prove demand. The load-bearing *technical*
risk is behavioral test generation for **stateful, side-effecting, and auth-gated tools** at ecosystem
scale — a v1 that only handles read-only stateless tools ships fast but delivers a weak, gameable
signal (near-duplicate of Scoreboard's existing read-only smoke tests); a v1 that credibly certifies
side-effecting tools needs per-tool adjudication that strains your 4–7 hr labeling budget and drifts
toward the manual inspection you dislike. Tertiary: LLM-as-judge on output-vs-description is noisy for
ambiguous descriptions, so the headline conformance number may not survive skeptical scrutiny without
heavy human validation.

**First cheap step.** Point the harness at the free, ToS-clean surface that already exists — MCPTox
(45 servers / 353 tools) plus MCP-Atlas (36 servers / 220 tools) — and produce a first-of-its-kind
"behavioral conformance of the MCP ecosystem" mini-study on read-only tools, *with an explicit
side-effecting-tool feasibility probe*. That single artifact is the make-or-break: it either proves you
can generate credible behavioral tests beyond the trivial slice, or it tells you the moat collapses to
read-only smoke-testing that Scoreboard already ships. No partner, no ToS friction, under budget.

**Score line.** Ship 4 · Impact 4 · Found 4 · Exec 4 · Hire 5 → **Composite 82.5** (found-plausible).
Trades Kappa's Ship 5 / Exec 5 for two points of Impact + Found; lands essentially *at* Kappa, not
clearly above. The hire artifact — a first-of-its-kind ecosystem-wide behavioral-conformance study on
the hottest 2026 buyer wave — is more novel than another judge-drift paper.

---

### B · Blindspot — the retrieval-lock-in detector — 80.0

**The problem (and where it's documented).** RAG hallucination detectors come in two families, and
both are structurally blind to one high-prevalence failure class: the *confidently-wrong, locked-in*
answer. *When Confidence Takes the Wrong Path: Diagnosing Retrieval-State Lock-In in RAG* (arXiv
2606.22728, 2026) shows that **42% of KG-RAG and 59% of dense-retrieval errors carry zero answer
dispersion** — every sample agrees, so consistency/disagreement detectors (semantic entropy,
SelfCheckGPT, the sampling half of Cleanlab TLM) see nothing wrong; and the wrong answer is *faithful*
to the wrong retrieved context, so faithfulness detectors (Vectara HHEM, Galileo Luna-2, Patronus
Lynx) also pass it. The paper ships an OSS framework (OntoGraphRAG) that logs retrieval state.
Supporting: Skill-RAG (arXiv 2604.15771), GaRAGe grounding-annotated benchmark (arXiv 2506.07671).

**Who pays.** Series A–C AI-native teams and enterprise platform teams running RAG/agents in
high-stakes flows (support, finance ops, healthcare, legal) who **already bought a faithfulness scorer
and are still getting burned** by confident-wrong answers it passed. Buyer is the eng lead / head of
AI. Usage-based per-query API + per-corpus calibration fee; later OEM to the observability incumbents
whose scorers have this exact blind spot.

**Product shape.** A drop-in detector API that runs *beside* any RAG pipeline. Instead of scoring the
answer surface, it separately probes the three things a single confidence score conflates — the
answer, the retrieved evidence, and the retrieval *state* (is it degenerate / near-identical across
perturbed retrievals?). Returns a calibrated "this looks locked-in, escalate/abstain" flag plus a
per-query lock-in signature. Ships as an OSS detector (the funnel + data intake) with a hosted
per-customer calibration + monitoring service on top.

**Moat, and why it beats Kappa.** A cross-customer corpus of **live retrieval-state signatures paired
with confirmed-wrong outcomes** — a lock-in taxonomy no single-tenant scorer accumulates.
Un-backfillable, because the signature only exists at query time, and it deepens with every escalation
labeled right/wrong; it warm-starts each new customer's calibration. This is a *better-constructed*
moat than Kappa's judge-drift telemetry. And unlike Kappa, it is **not contested by funded eval
incumbents** — it beats them on a failure class their products can't catch, so incumbents become
prospective **OEM buyers rather than competitors**. That flips Kappa's single biggest weakness
(contested lane) into a distribution channel.

**Nearest player + your wedge.** The real displacement risk is **Cleanlab TLM**, not the faithfulness
vendors. TLM is a *hybrid* (self-reflection + sampling consistency + logprob/probabilistic) and markets
3× precision over faithfulness scorers, so its non-consistency components already give it *partial*
coverage of confident errors — the pitch's "every disagreement-based detector structurally cannot see
this" is true only for *pure-dispersion* methods, not TLM. **Your wedge over TLM is retrieval-awareness:**
TLM scores the answer/prompt as a black box and ignores the retrieval mechanism, so it cannot use
retrieval-state concentration as a signal — a lock-in detector can. Vectara HHEM 2.1, Galileo Luna-2,
Arize Phoenix, Patronus Lynx, LettuceDetect are all faithfulness/consistency scorers that confirm the
gap rather than fill it.

**The real risk.** **Cleanlab TLM, and one unrun experiment.** Everything downstream — OEM channel,
moat, hire signal — rests on a make-or-break test you have not run: score TLM's trust value against the
lock-in paper's zero-dispersion error set and show its precision degrades on exactly those cases. **If
TLM already catches them via self-reflection, the wedge collapses to a kill.** Secondary: the moat
requires customers who *expose retrieval state* (an integration constraint TLM's black-box approach
dodges), and it accrues only post-traction — the same cold-start as Kappa.

**First cheap step.** Run the make-or-break experiment before building anything: take the lock-in
paper's zero-dispersion error set (or reproduce it via OntoGraphRAG), run Cleanlab TLM's trust score
across it, and measure precision on exactly those confident-wrong cases. If TLM's precision holds, kill
it. If it degrades, you have both a publishable "we catch what TLM can't" result *and* the wedge —
cheap, uses public artifacts, no labeled download needed.

**Score line.** Ship 4 · Impact 4 · Found 4 · Exec 4 · Hire 4 → **Composite 80.0** (found-plausible).
Beats Kappa on impact and found; loses on the three axes Kappa is strongest at (ship, exec, hire), and
its central structural-blindness claim is materially overstated against TLM until the experiment says
otherwise. Just below the bar.

---

### C · TaxProof — independent line-level verifier for AI-drafted tax returns — 80.0

**The problem (and where it's documented).** As of June 24, 2026, IRS Circular 230 §10.22 plus **OPR
Alert 2026-19** create an explicit, documentable duty for tax professionals to *verify* AI-produced
facts, citations, and calculations — and audits will now ask for that documentation. There is no single
benchmark paper; the grounding is regulatory (Circular 230 §10.22, OPR Alert 2026-19), analytical
(Bloomberg Tax "AI Hallucinations in Tax"), and a direct transfer of legal-citation-faithfulness work
(CiteCheck, arXiv 2502.10881) plus your own RAG-hallucination-judge study. The pain: AI drafting tools
produce returns and research memos with citations to authority that may not exist or may not say what's
claimed, and the preparer carries personal §6694 / §10.22 liability for it.

**Who pays.** CPA and tax-prep firms (solo through mid-market) and the offshore review shops they use;
per-return or per-seat subscription tied to filing season. The buyer is the firm's risk/quality
partner who now carries an explicit verification duty and **personal liability** — a rare case where
the party being graded *wants* the score. Bookkeeping/advisory firms adopting agentic accounting
(post-Basis-AI) are an expanding second buyer.

**Product shape.** Send the AI-drafted return or research memo + client facts; get back a **per-line
verdict** — is this deduction/credit supported, does the cited authority exist and actually say this,
does the math tie out — each flag linked to the controlling primary source, surfaced as a "review only
the risky lines" queue *and* an examiner-ready verification log that satisfies the Circular 230
documentation duty. Pipeline-agnostic: it grades any drafting tool's output and does no drafting
itself.

**Moat, and why it beats Kappa.** A **correction flywheel over authority-grounding**: every preparer
accept/override on a flagged line is a labeled (draft claim, cited authority, correct authority,
outcome) triple, accumulating into an un-backfillable corpus of "which AI-drafted positions are
actually wrong and what overturns them," plus a citation-resolution index — a compliance
system-of-record firms won't rip out mid-season. Stronger and more solo-earnable than Kappa's moat
(Kappa's flywheel is a pre-traction promise in a lane funded incumbents already ship into). And the
horizontal eval incumbents (Braintrust, Galileo) don't touch tax-authority grounding — the vertical +
compliance-log wrapper is the defensible wedge, driven by a hard regulatory *mandate* rather than
Kappa's recognized-but-optional anxiety.

**Nearest player + your wedge.** **Basis AI** ($100M Series B, ~$1.15B) has an internal "Review and
Filing Agent" — but it validates *its own* drafts with full context on the source docs, not sold as an
independent cross-tool verifier. **Filed's Reviewer** likewise checks only its own drafts.
**VerifyMyReturn** is independent + pipeline-agnostic but consumer-facing ($30 flat, risk ratings not
primary-authority citations, no Circular 230 framing). Research tools (Bizora, Blue J, Checkpoint
Edge/CoCounsel) cite primary authority but grade research *answers*, not completed-return lines.
Legal-side citation checkers (CiteSentinel, Clearbrief) prove the audit-trail-against-hallucinations
shape is fundable but have not crossed into tax. **Your wedge:** the unoccupied intersection — an
*independent, pipeline-agnostic* verifier that grades each *line* of a completed return against
*primary* authority (IRC / Treas. Reg / rulings) and emits a Circular 230 §10.22 due-diligence
audit-trail artifact tied to the preparer's personal liability.

**The real risk.** **A time-boxed wedge plus a gold-label crux.** The independent-verifier *concept*
is already commercialized, so incumbents (Basis, Filed, Thomson Reuters) can bolt on an
"independent-verification report" + Circular 230 audit trail, and VerifyMyReturn can move upmarket into
pro/citation territory — a months-not-years window while OPR Alert 2026-19 is fresh. And while primary
authority is free/public-domain, a *validated* corpus of AI-drafted return lines with known-correct /
known-wrong positions and what overturns them is **not** free — it needs real tax-domain judgment for
the "actually wrong" labels (the same second-rater-cost pattern that gates PV-Grade's causality gold),
and line-decomposition of a completed return plus a citation-resolution index is a heavier build than
Kappa's point-at-judge-outputs CLI.

**First cheap step.** Build the citation-entailment core on free public authority (IRC, Treasury Regs,
IRS pubs are machine-readable) and validate it against a small hand-curated set of AI-drafted return
lines with known outcomes — proving the "does the cited authority exist and say this" check before
touching the heavier line-decomposition + audit-log system. Move on the *pro + primary-authority +
compliance-artifact* combination now, while the OPR alert is new.

**Score line.** Ship 4 · Impact 4 · Found 4 · Exec 4 · Hire 4 → **Composite 80.0** (found-plausible).
Beats Kappa's founding story (a regulatory mandate, a liable buyer who *wants* the score, an
un-backfillable correction moat) but trades it for Kappa's two 5s on the highest-weighted (ship) and
hire axes; the heavier build and the not-free known-wrong gold-label dependency drop it just under.
This is the vertical-AI-reliability "independent verifier" family — essentially CreditProof (doc-18 #17)
generalized from Form 6765 to full-return line grading.

---

## NEAR-MISSES (composite 75–83.3)

*All three near-misses are already carded in full above. Table repeated here for scanning.*

| Name | Composite | Ship | Impact | Found | Exec | Hire | One-line |
|---|:--:|:--:|:--:|:--:|:--:|:--:|---|
| **TrueTool** | **82.5** | 4 | 4 | 4 | 4 | 5 | Empty-field, two-sided MCP behavioral-conformance play with a real compounding corpus; lands *at* Kappa, gated on distribution incumbents own + hard-to-test side-effecting tools. |
| **Blindspot** | **80.0** | 4 | 4 | 4 | 4 | 4 | Catches the retrieval-lock-in confident-wrong class both detector families miss; better-built moat than Kappa, but gated on an unrun make-or-break TLM experiment. |
| **TaxProof** | **80.0** | 4 | 4 | 4 | 4 | 4 | Mandate-driven, liability-anchored line-level tax verifier; better founding story than Kappa, but a heavier build + a gold-label crux drop it under the bar. |

*For completeness — everything scored in this aperture pass, including the ones that fell well below
75: RewardProof (74.2), MemVerdict (74.2), ClaimCheck (74.2), ScribeGuard (70.8), GraderGuard (62.5,
hire-only), WorkProof (60.8, hire-only), HackWatch (57.5), TrueRep (46.7, dead — killed by prior work).
None warrants a card.*

---

## Honest closing

**Nothing in this aperture clears the bar.** The strongest one or two, measured against the doc-20
reference points:

- **TrueTool (82.5) vs Kappa (83.3):** a *lateral move, not an upgrade*. It essentially ties Kappa on
  the composite — it trades Kappa's frictionless Ship 5 / Exec 5 for two points of Impact and
  Founding-upside. The case *for* it over Kappa is real and specific: it is genuinely two-sided (buyers
  and sellers both pay), the competitive field is empty on behavioral signal (versus Kappa's contested
  judge-drift lane), and the hire artifact is more novel. The case *against*: the badge's value hinges
  on distribution that Scoreboard/Dominion already own, and the defensible version requires cracking
  behavioral tests for side-effecting tools — an unproven, budget-straining, manual-drifting problem.
  If you want a bigger founding ceiling and can absorb a heavier build than Kappa, TrueTool is the one
  candidate that argues for itself. If you want the lowest-friction path to a shipped, legible result,
  Kappa still wins.

- **TrueTool (82.5) vs Ingestion (84.2):** Ingestion stays ahead. Ingestion is the only bet in the
  program strong on *every* axis at once — label-free, ready release-clean data, ~$50 compute,
  null-proof, and a founding wedge into a just-funded market. TrueTool matches it on founding ambition
  and hire novelty but is behind on ship-speed and executability (an invocation harness across
  transports/auth is real engineering; Ingestion's labels come free from re-rendering). **Nothing here
  displaces Ingestion as the #1.**

**Bottom line for the decision.** This capability-frontier / adjacent-to-published aperture did *not*
produce a new #1 or #2. It produced a strong lateral alternative to Kappa (TrueTool) for someone who
specifically wants more founding ceiling, and two more plausible-but-gated founding wedges (Blindspot,
TaxProof) that are, more reliably, excellent *current* hire artifacts. If doc-20's shortlist
(Ingestion + PV-Grade, with Kappa as a near-free third) already feels right, **keep it** — nothing in
this pass earns a re-open. The single most useful thing to carry forward is TrueTool's first cheap
step: the MCPTox/MCP-Atlas behavioral-conformance mini-study is a legible, on-frontier artifact worth
running *regardless* of whether you found the company, and it doubles as the experiment that would tell
you whether the founding wedge is real.
