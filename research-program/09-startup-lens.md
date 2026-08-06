# Startup Lens — re-optimizing the shortlist for founding

*Written 2026-07-08, the day the goal shifted. The [charter](00-goals-and-operating-principles.md)
kept three exit paths open in no forced order — hired, founder, nonprofit — and ranked
everything by **impact first**, with marketability as a late, single constraint check. This
doc does the opposite on purpose: it re-scores the same domains through **one lens — could
this become a venture-scale company?** — and lets that ranking function drive.*

## What this pivot demotes, and what it costs

The impact-first exploration is done. The [pilot shortlist](08-pilot-specs.md) was chosen so
each field would ship a public artifact and let real evidence pick the winner. That process
was honest about impact. It was deliberately *silent* on fundability — by design (guardrail
#4). Turning fundability into the ranking function inverts several of those calls:

- **It demotes the nonprofit/analyst-shaped domains the charter treated as first-class.** The
  charter said plainly: "The nonprofit route is not a fallback. In evaluation research
  specifically, the most credible institutions are nonprofits." Under a venture lens that
  strength becomes a liability. **Reproduction/meta-science** and **AI supply-chain
  intelligence** — two of the current five pilots — are the clearest casualties: their entire
  value proposition is *independence*, and independence and scalable revenue are close to
  mutually exclusive (see METR, which explicitly refuses AI-company money;
  [metr.org](https://metr.org)). They remain high-impact. They are not companies.
- **It costs impact, measured honestly.** The domains that score best on venture potential
  (agent security, AI audit/compliance, dev tooling) are also the most crowded and
  best-capitalized — meaning the *marginal* contribution of one more entrant is smaller than
  in the neglected lanes. The venture-optimal pick is rarely the impact-optimal pick. If the
  founding goal is real, that trade is the price of admission; this doc names it rather than
  hiding it.
- **It raises the bar from "credible artifact" to "wedge + moat."** A benchmark is a paper.
  A paper is not a company. Every domain below is judged on whether a pilot artifact can seed
  something *defensible and buyable*, not just something publishable.

Two structural facts recur across every domain and frame the whole document:

1. **Feature-not-a-company.** Most of the strongest technical wedges here (LLM-as-judge
   scoring, trace→eval loops, drift/regression testing, label QA) are already checkbox
   features inside funded platforms. A solo founder builds them faster than they can build
   distribution.
2. **Incumbent absorption is the observed exit, not IPO.** The base rate in 2025–26 is
   acquisition/acqui-hire: Prompt Security→SentinelOne, Aim→Cato, Lakera→Check Point,
   Langfuse→ClickHouse, Galileo→Cisco, Promptfoo→OpenAI, Robust Intelligence→Cisco,
   Cleanlab→Handshake. A tuck-in inside 18–30 months is a legitimate founder outcome — just
   not a unicorn thesis. Where the realistic ceiling is a tuck-in, this doc says so.

---

## Startup-viability ranking

Sorted by venture-viability (1–5; 5 = clean venture-scale path, 1 = nonprofit/services-shaped).
Scores are the per-domain assessments' own `ventureViability`, cross-checked against wedge
strength and 2026 funding shape. All seven candidates are shown — the five current pilots plus
two **alternates** (AI audit/compliance, data-quality/provenance) surfaced during the sweep.

| # | Domain (pilot) | Viability | One-line wedge | Funding-climate signal |
|---|---|:---:|---|---|
| 1 | **Agent security & auth** (ScopeBench) | **3** | Neutral, standards-literate **measurement/assurance** for agent scope-adherence — the one risk category with *zero* public benchmarks | **Hot & consolidating**: Noma $100M B, Astrix $45M B, GitGuardian $50M; but 3 startups absorbed into security suites in 4 months |
| 2 | **AI audit / compliance** (alternate) | **3** | Verticalized, **insurance-priced** technical assurance for agents in one regulated domain — the measurement engine under the AIUC model | **Real but shaped**: ~$422M / 23 deals (May'25–Apr'26); capital favors standards+audit+**insurance**, not audit alone |
| 3 | **Model behavior QA / drift** (PersonaAtlas) | **3** | **Deployer-side behavioral-contract + gating** against silently-updated 3rd-party model APIs — liability-framed, not performance | **Scaled & crowded**: money clusters in eval+observability platforms; behavior/red-team point tools get ~4.5% of safety capital |
| 4 | **AI dev & research tooling** (alternate) | **3** | **Verifier/reward-quality auditor** for RL/agent post-training loops — upstream of where observability plays | **Aggressive but absorbing**: Braintrust $80M/$800M, LangChain $125M/$1.25B; but tooling layer rolled up ~monthly |
| 5 | **Data quality / provenance** (alternate) | **3** | **EU-AI-Act training-data audit** with a detector-FPR-corrected contamination primitive as defensible IP | **Mixed**: adjacent licensing funded (TollBit $31M); *core* data-QA proven feature-shaped (Cleanlab acqui-hired, DatologyAI stalled) |
| 6 | **LLM eval & observability** (JudgeFlip) | **2** | Judge/eval **reliability** as an OEM trust layer sold *to* the incumbents | **Best-funded, fastest-consolidating** corner — the *opposite* of whitespace for a late solo entrant |
| 7 | **Reproduction / meta-science** (ReproCheck) | **2** | Buyer-side **claim-verification** for AI procurement (a pivot *away* from the pure domain) | **Split**: enterprise verification is hot (Qodo $70M, Patronus $50M); the *actual* domain is philanthropy-funded only |
| 8 | **AI supply-chain intelligence** (DiversionDB) | **3\*** | **Compute-finance diligence** data layer for the >$200B GPU-collateralized lending market | **Incumbent-dominated**: Kpler $1B+, Sayari $235M; the venture-shaped middle is narrow, natsec GTM is clearance-gated |

*\* DiversionDB scores 3 on paper but is the weakest realistic path for **this** founder — the
company-shaped fork depends on a compute-finance buyer materializing and on GTM (government
natsec, or SemiAnalysis-style industry access) that a solo technical founder does not have. Its
effective rank is below the others at "3." See the depth section.*

**Read of the table:** nothing scores a 4 or 5. That is the honest headline — every domain a
solo eval-methodologist can credibly enter is either feature-shaped or crowded. The game is
not finding an empty market; it is finding the **thin slab of whitespace inside a hot market**
where a measurement artifact converts into a non-copyable asset (proprietary attack data,
continuous pipeline, compliance workflow, or an insurance/distribution partner).

---

## The domains in depth

Each domain: plain-language **significance** (the context the researcher flagged as missing) →
**commercial wedge + who pays** → **comparables + funding** → **whitespace** → **honest risks**
→ **how the pilot seeds the company.**

### 1. Agent security & authentication — pilot: **ScopeBench**

**Significance (plain).** Companies are handing software agents real authority — to browse,
spend money, call other agents, touch internal systems on a person's behalf. Two things are
broken underneath that. The *content* problem: an agent can be hijacked by hostile text hidden
in a web page, email, or tool output ("prompt injection"), and as of 2026 the labs themselves
say this is unsolved at the architecture level — even Claude Opus 4.5 with adversarial training
still gets fooled ~1% of the time, and Anthropic says "no browser agent is immune." The
*identity* problem: who is this agent, whom does it act for, what is it allowed to do? Scans
keep finding a large fraction of deployed agent-tool (MCP) servers exposed with no
authentication, agent "business cards" forgeable, and cryptographically signed payment mandates
talked out of the agent by injection. The blast radius is money and data, not a bad chatbot
answer — and **there is still no public benchmark measuring whether an agent stays inside the
permissions it was granted when attacked.** That last gap is exactly what ScopeBench targets.

**Commercial wedge + who pays.** Not another "agent firewall" — that lane is already being
rolled up. The defensible wedge is a **measurement-and-assurance company**: a continuous
red-team + eval service answering *"does this agent stay inside its authorized scope under
adversarial pressure, and can you prove it to your auditor/regulator?"* Buyers: (1) enterprises
deploying agents in regulated workflows (financial services, healthcare, insurance) needing
pre-deployment sign-off + ongoing evidence for the EU AI Act and internal risk committees;
(2) agent-platform and authorization vendors (Oso, Cerbos, Astrix, WorkOS) wanting a credible
external benchmark to validate their enforcement; (3) AI-security suites (SentinelOne, Cato,
Check Point) as a licensed eval engine. This is the LLM-as-judge/eval skillset applied to the
one risk category with zero primary public benchmarks.

**Comparables + funding.**
[Noma Security](https://noma.security) — $100M Series B (Jul 2025, ~$132M total), agentic AI
security posture. [Prompt Security](https://www.prompt.security) — acquired by SentinelOne
(~$250M, Aug 2025). [Aim Security](https://www.aim.security) — acquired by Cato Networks
(~$350–400M, Sep 2025). [Lakera](https://www.lakera.ai) — acquired by Check Point (~$300M, Nov
2025), the closest eval-to-acquisition precedent (Gandalf/Guard red-team data became the
credibility Check Point paid for). [Astrix Security](https://astrix.security) — $45M Series B
(~$200M val); ⚠️ Cisco reportedly circling at $250–350M (rumored, unconfirmed).
[GitGuardian](https://www.gitguardian.com) — $50M (Feb 2026), non-human identity.
[Vouched](https://www.vouched.id) — $17M Series A (2025), Know-Your-Agent identity.
[Oso](https://www.osohq.com) / [Cerbos](https://www.cerbos.dev) — authz engines pivoting in.
Market: agentic-AI-security ~$1.65B (2026) → ~$13.52B (2032), ~42% CAGR
([MarketsandMarkets](https://www.marketsandmarkets.com); ⚠️ vendor market-sizing, directional).

**Whitespace.** The **measurement layer** is the genuine opening — the field is "long on
protocol proposals and short on independent measurement." Specifically unbuilt as of Jul 2026:
(1) no public agent-auth / scope-adherence benchmark — the 2026 safety-benchmark taxonomy
([arXiv:2605.16282](https://arxiv.org/abs/2605.16282), Finding 6) found robustness is the *sole*
risk category with zero primary benchmarks; (2) no independent adversarial bypass eval of
shipping standards (Web Bot Auth, Visa Trusted Agent Protocol) — every vendor claim is a
capability announcement, none report measured bypass rates; (3) no comparative security analysis
of the ~5 competing agent-identity IETF drafts; (4) no standardized mandate-integrity suite for
AP2-style signed payments. Differentiated position: the neutral, adversarial, standards-literate
**measurement authority** ("Lakera Gandalf / MITRE ATLAS for scope-adherence") — an
assurance/attestation brand, *not* a proxy in the request path.

**Honest risks.** This is closer to a feature-and-services shape than a clean venture.
(1) **Incumbent absorption is happening right now, fast** — three agent-security startups
rolled into platform suites in four months (above). Agent security is being treated as a
feature of SASE/EDR/AI-SPM, not a standalone category. (2) **Base auth plumbing is being
commoditized by the platforms** — MCP now mandates OAuth 2.1 + RFC 8707, OpenAI requires
OAuth 2.1 + Dynamic Client Registration; pure "agent identity/auth" risks absorption into model
platforms and IAM incumbents (Okta, Ping, Entra). (3) **Eval-as-a-company has a moat problem** —
benchmarks are copyable, saturate, and can be published as free artifacts; Braintrust/Patronus
would extend into scope-adherence trivially. The moat must be proprietary attack data +
continuous pipeline + trust/brand + compliance workflow. (4) **Services drag** toward
consulting/pentest. (5) **Crowding**: Noma, GitGuardian, Astrix, Zenity, Lasso, Lakera-in-CP,
Oso/Cerbos — all with 8–9 figures and a 2–3 year GTM head start.

**Pilot → company.** ScopeBench is a near-ideal *credibility wedge* precisely because a
benchmark is a weak company but a strong door-opener. (1) Publish it as the first public
scope-adherence robustness benchmark — this lands the founder as the named authority on the one
unbenchmarked risk category (the arXiv:2605.16282 gap), mirroring the Lakera→Check Point arc.
(2) Use it to generate proprietary, continuously-refreshed attack corpora + a private
leaderboard of which agent/authz configs actually hold — the copyable public benchmark seeds a
*non-copyable* private dataset. (3) Convert to a paid continuous-assurance product: enterprises
pay for ongoing scope-violation testing + audit-ready attestation; authz/platform vendors pay
to be independently certified. (4) His published skill (LLM-as-judge for RAG hallucination) maps
directly onto LLM-as-judge for delegation/mandate compliance — the core scoring engine.
Realistic outcome: tuck-in acquisition within 18–30 months, not a standalone IPO.

### 2. AI audit, compliance & third-party assurance — **alternate (unspecced vertical-audit pilot)**

**Significance (plain).** As AI gets pushed into hiring, lending, healthcare, insurance, and
agents that take actions on their own, organizations and regulators need to check whether these
systems are safe, fair, and doing what vendors claim. The evidence keeps showing AI fails
quietly at scale — a health algorithm systematically under-served Black patients (Obermeyer
2019), the Epic sepsis model caught only a third of real cases (JAMA 2021), commercial legal AI
hallucinated on 17–33% of queries (Stanford RegLab 2024). The plain problem: buyers can't tell
good AI from dangerous AI, and that uncertainty is now the main thing slowing enterprise AI
adoption. Whoever credibly reduces it unlocks a lot of spending.

**Commercial wedge + who pays.** The version clearly growing into venture-scale companies is
the **"standards + audit + insurance" bundle** for AI agents, exemplified by
[AIUC](https://www.aiuc.com) (Artificial Intelligence Underwriting Company) — $15M seed (Jul
2025, Nat Friedman/NFDG, with Anthropic co-founder Ben Mann + ex-METR COO Rajiv Dattani); it
built "AIUC-1" as SOC-2-for-agents, audits agents against it, and sells liability insurance
priced on the result. Who pays: enterprises buying/deploying agents (to de-risk procurement) and
vendors themselves (to close enterprise deals faster), with insurers underwriting tail risk.
For a solo applied-ML researcher, the realistic wedge is **not** the full assurance company but
the **technical evaluation layer these bundles depend on**: a reproducible test battery for one
high-stakes vertical (his LLM-as-judge/RAG-hallucination stack maps directly onto agent/RAG
assurance), sold as the measurement engine to insurers, GRC platforms, and enterprises who need
a number they can price and defend.

**Comparables + funding.**
[AIUC](https://www.aiuc.com) — $15M seed (Jul 2025), the single strongest venture signal in
this domain; projects a $500B agent-insurance market by 2030 (⚠️ founder projection).
[Credo AI](https://www.credo.ai) — ~$39M raised, $21M Series A-II (Jul 2024, Sands, Mozilla
Ventures). [Holistic AI](https://www.holisticai.com) — UCL spin-out, tied #1 NYC LL144 auditor
by volume. [Vanta](https://www.vanta.com) — $504M raised, $4.15B val, ~$300M ARR (Apr 2026) —
SOC-2/GRC platform *absorbing* AI governance as a feature (the incumbent-absorption threat).
[Drata](https://drata.com) — $2B val (2022), adding ISO 42001 / EU AI Act modules.
[Robust Intelligence](https://www.cisco.com) — acquired by Cisco (~$400M, Oct 2024), folded into
Cisco AI Defense — proof standalone eval tooling gets absorbed.
[BABL AI](https://babl.ai) — ~20 staff, bootstrapped consultancy — the services-shaped,
non-venture archetype. [Complyance](https://www.complyance.ai) — $20M Series A (Feb 2026, GV,
Speedinvest). Pure-play AI-governance funding: ~$421.8M across 23 deals (May'25–Apr'26,
[New Market Pitch](https://www.newmarketpitch.com) tracker) — real but small, crowded with ~22
near-identical entrants.

**Whitespace.** Verticalized, insurance-priced technical assurance for AI agents in **one**
regulated domain — not generic "AI governance." Two specific gaps: (1) no independent,
reproducible agent-assurance benchmark exists for most verticals — insurance-underwriting AI
under Colorado SB 21-169 has a *legal mandate* for quantitative fairness testing but *no*
published methods literature (a genuine, un-served wedge for someone with classical-ML fairness
stats); (2) the audit layer under the AIUC insurance model is thin — insurers need someone who
can turn agent behavior into a priceable risk number per vertical. Whitespace = being the
measurement engine that makes AI risk *underwritable*, where his LLM-as-judge methodology fits
and the standards (AIUC-1, ISO 42001) are too new to have deep vertical benchmarks behind them.

**Honest risks.** (1) **Feature-not-a-company / incumbent absorption is dominant** — Vanta
($4.15B) and Drata ($2B) already bolt EU AI Act / ISO 42001 modules onto SOC-2 platforms;
governance is a feature they absorb. Standalone eval/red-teaming gets bought by security
incumbents (Cisco/Robust Intelligence). (2) **Services-shaped, non-scaling** — classic
algorithmic auditing (BABL, ORCAA, DCI) is headcount-bound consulting; nobody has funded a pure
independent-audit firm at scale, and frontier safety eval (METR, Apollo) is explicitly
nonprofit-shaped. (3) **The mandate is weaker than it looks** — LL144 is a demonstrated
enforcement failure (2 complaints in 2 years; "Auditing the Audits," FAccT 2025, found 54% of
audits had logically-impossible ratios), and *most* EU AI Act Annex III high-risk uses (hiring,
credit, education, insurance) allow **internal self-assessment** — mandatory third-party audit
applies mainly to biometrics and product-embedded AI, so the "regulation creates a huge
forced-audit TAM" thesis is materially overstated. Moat is weak: methodology is publishable and
copyable; the real moats — distribution (GRC platform), balance sheet (insurance), regulatory
designation (notified body) — a solo researcher has none of.

**Pilot → company.** Build the unspecced vertical-audit pilot as a **preregistered, reproducible
assurance benchmark for ONE high-stakes agent/RAG vertical** (his proven wedge: LLM-as-judge
grading of RAG hallucination, extended to agent actions) — archetypes being Stanford's
"Hallucination-Free?" legal-RAG audit and Patronus's FinanceBench, both small-team artifacts
that generated outsized credibility by falsifying vendor claims. The pilot's job: (a) a credible,
defensible number on a named vertical's AI failure rate, and (b) evidence he can build the
measurement layer insurers/platforms can't easily reproduce. That artifact is the credential
that gets him in the door at an AIUC-style insurer (they need vertical-specific technical
evaluators), a GRC platform adding AI modules, or as the technical co-founder to a business
partner holding the insurance/distribution half. It is a wedge and a co-founder signal — not,
by itself, a company.

### 3. Model behavior monitoring / QA — pilot: **PersonaAtlas**

**Significance (plain).** Companies build products on models they rent from OpenAI, Anthropic,
Google — but those models change silently. The vendor pushes an update behind the same API and
behavior shifts overnight, no version bump. Documented, not hypothetical: GPT-4's code accuracy
fell ~52% → ~10% over three months with no version change; a 2025 Anthropic infrastructure bug
degraded ~16% of Claude Sonnet requests. Models also drift in *behavior* — how sycophantic,
cautious, "in character" they are — and that has moved from research curiosity to legal one:
11+ lawsuits against OpenAI, California's SB 243 companion-chatbot law (effective Jan 2026), a
2026 UN report linking chatbot sycophancy to real harms. So *"did my deployed model's behavior
change, and is it still safe and on-spec?"* is a genuine, growing pain. The domain's job: catch
these shifts before users (or regulators) do.

**Commercial wedge + who pays.** Not the pilot (persona clustering) — the fundable wedge is
**deployer-side behavioral regression/drift governance for silently-updated third-party model
APIs.** A service that lets a company codify "behavioral contracts" (sycophancy ceiling, refusal
profile, format compliance, persona consistency, safety posture) as a versioned test suite,
re-run continuously against the live vendor endpoint, gating/alerting when a silent update breaks
the contract. The paper "Governing Updates in the LLM Supply Chain" states outright that **no
product operationalizes deployer-controlled gating today.** Who pays: mid-to-large enterprises
with regulated or safety-sensitive AI products (health, fintech, education, companion apps facing
SB 243 exposure) — buyers in compliance, ML-platform, and trust-and-safety functions. The
behavioral (not just accuracy) framing plus a defensible LLM-as-judge calibration methodology is
the differentiation from generic observability.

**Comparables + funding.**
[Arize AI](https://arize.com) — $70M Series C (Feb 2025), $131M total, ~$1B+ val, Datadog +
PagerDuty participating. [LangChain/LangSmith](https://www.langchain.com) — $125M Series B (Oct
2025) at $1.25B. [LMArena](https://lmarena.ai) — $150M Series A (Jan 2026) at $1.7B, ~$30M ARR
in ~4 months — now facing benchmark-gaming/neutrality accusations (the structural tension of
selling neutrality while taking vendor money). [Braintrust](https://www.braintrust.dev) — $80M
Series B. [Langfuse](https://langfuse.com) — acquired by ClickHouse (Jan 2026).
[Patronus AI](https://www.patronus.ai) — ~$17M Series A (Datadog VC arm participating).
[Haize Labs](https://haizelabs.com) — $12.5M seed, behavioral stress-testing.
[Promptfoo](https://www.promptfoo.dev) — $18.4M Series A (Insight, a16z).
[Transluce](https://transluce.org) — **nonprofit** (501c3), ~$11M, the closest
"model-behavior institute" — notably *not* a for-profit (a tell about the domain's natural
shape). Safety-specific tally: ~$560M across 20 companies (Jul'25–Jun'26,
[newmarketpitch](https://www.newmarketpitch.com)); top-5 deals = 75% of capital; red-teaming
got only ~4.5%.

**Whitespace.** Behavioral (not accuracy/cost) regression testing of **third-party
silently-updated endpoints**, sold to the deployer, framed around safety/liability rather than
performance. Incumbent observability is largely first-party (watch *your* app's traces) and
point-in-time; drift papers cover accuracy/format; SpeechMap covers only refusal. Nobody runs a
continuous, multi-dimensional (persona + sycophancy + values + safety-posture) public observatory
of deployed models across versions, and no product gives a deployer an enforceable behavioral
contract + compatibility gate against a vendor update. The AI-psychosis / SB-243 / UN-report
liability wave creates a fresh, non-performance reason to buy — a compliance-shaped wedge into
an evaluation-shaped market.

**Honest risks.** (1) **Feature-absorption** — the broad category is crowded and consolidating
(Arize, LangSmith, Braintrust, LMArena, Langfuse-in-ClickHouse); Datadog and PagerDuty are
literally investors in Arize. Drift/regression is being marketed as a checkbox *right now*.
(2) **Commodification** — open-source (Langfuse, Phoenix, MLflow) sets the price floor at $0.
(3) **Pilot-is-not-a-company** — persona clustering is the *weakest* commercial slice: provenance
is drifting toward standards (C2PA, SynthID), red-teaming captured ~4.5% of capital and is
flagged as "a feature unless connected to monitoring," and "which model wrote this / persona
taxonomy" is a research artifact, not a P&L. (4) An **independent/neutral evaluator's moat is
fragile** — LMArena, the category's biggest neutral-evaluator success, is already fighting
credible accusations that lab partnerships let vendors game its benchmark. Selling neutrality
while taking vendor money is a structural tension.

**Pilot → company.** PersonaAtlas as-is is a credibility artifact, not the product. Path: use
cross-model persona clustering + calibrated LLM-as-judge to publish a **live, continuously-updated
public observatory** that catches a real silent behavioral drift or sycophancy regression in a
major deployed model *before the vendor announces it* — the way SpeechMap got cited by
press/policy and the Chen–Zaharia–Zou drift paper defined a field. That living artifact does three
jobs: (a) top-of-funnel + trust signal (independent-watchdog reputation), (b) proof the
methodology works on real production endpoints, (c) surfaces the enterprise buyers who feel the
pain first. The company then productizes the *same engine* as a private, deployer-facing
behavioral-contract + gating service. Persona clustering becomes one dimension of the contract
("did my model's character drift"), not the whole pitch.

### 4. AI developer & research tooling — **alternate (verifier-quality auditor pilot)**

**Significance (plain).** Every team shipping an AI product depends on plumbing between them and
the model: fine-tuning, tracing/observability, evals, agent frameworks. The core finding: this
plumbing, not the model, often decides how the system performs and scores — the wrapping code can
swing a coding benchmark by 15–24 points running the *same* model; benchmarks contain enough
label errors to reshuffle leaderboard rankings; the same prompt at temperature 0 gives different
answers. AI systems are unreliable in measurable ways most teams can't see. Commercially:
LangChain's own survey (N=1,340) found 57% have agents in production and quality is the #1
barrier, with 89% collecting traces but only ~52% running evals. That gap between "we log
everything" and "we know if it's good" is what buyers now pay to close.

**Commercial wedge + who pays.** The durable company-shape is the eval-driven
observability/agent-engineering platform — but Braintrust/LangSmith/Langfuse own it. For **this**
founder the honest wedge is a narrow, defensible vertical: a **verifier/reward-quality and
eval-validity auditor sold to teams doing RL/agent post-training** — productizing the "verifier
auditing" and "benchmark rot" gaps as a QA layer for the *training loop*, where his
LLM-as-judge + data-pipeline background is a genuine edge and no incumbent is entrenched
(observability vendors watch production traces, not training loops). Who pays: platform/AI-eng
teams at mid-market and enterprise companies running agents (Braintrust already lists Notion,
Replit, Cloudflare, Ramp, Dropbox, Vercel) — but specifically the subset doing RL fine-tuning.
The eval-methodology work itself is credibility, not the product.

**Comparables + funding.**
[LangChain/LangSmith](https://www.langchain.com) — $125M Series B (Oct 2025) at $1.25B, ~$16M ARR.
[Braintrust](https://www.braintrust.dev) — $80M Series B (Feb 2026) at $800M.
[Patronus AI](https://www.patronus.ai) — $50M Series B (Jun 2026, $70M total), revenue 15x,
pivoted from LLM eval to agent-simulation/stress-testing. [Langfuse](https://langfuse.com) —
acquired by ClickHouse (Jan 2026). [Promptfoo](https://www.promptfoo.dev) — acquired by OpenAI
(Mar 2026, was $86M post-money). [OpenPipe](https://openpipe.ai) — acquired by CoreWeave (Sep
2025). [Predibase](https://predibase.com) — acquired by Rubrik (~$100–500M, Jun 2025).
[CrewAI](https://www.crewai.com) — $18M Series A (Oct 2024), ~$3.2M revenue.
[Confident AI (DeepEval)](https://www.confident-ai.com) — commercial layer on Apache-2.0 OSS.
~80% of Q2 2026 North American venture dollars went to AI ($392B H1 2026,
[Crunchbase](https://news.crunchbase.com); ⚠️ aggregator figure).

**Whitespace.** Genuinely not-yet-productized: (1) a **benchmark-agnostic, standalone
verifier/reward-quality auditor for RL/agent training loops** — the technique is being published
inside individual pipelines (SWE-RM, ASG-SI, R2E-Gym) but no reusable tool or QA service exists,
and it is *upstream* of where every observability vendor plays. (2) cross-harness equivalence
certification for static eval harnesses (lm-eval vs Inspect vs HELM) — the agent-scaffold half is
now occupied by 2026 papers; the classic-eval half is empty. (3) continuous benchmark-rot CI for
live leaderboards. **Caveat:** (2) and (3) are research/standards-shaped and likely have *no
per-seat buyer* — they belong in a paper or grant, not a cap table. Only (1) has a plausible
commercial buyer (RL/post-training teams), and even that is narrow.

**Honest risks.** This is the most crowded, most-absorbed layer in AI. (1) **Feature-not-a-company**
is severe for the parts he's closest to — the "trace → eval dataset" loop is table-stakes inside
Braintrust, LangSmith, MLflow, Confident AI; a standalone converter is a GitHub repo. (2)
**Absorption is the exit, not IPO** — Promptfoo→OpenAI, Langfuse→ClickHouse, OpenPipe→CoreWeave,
Predibase→Rubrik, all within ~12 months. **Fine-tuning-infra as an independent business is
largely over** — vertically integrated into compute providers. (3) **Moat is weak** — the whole
category's credibility runs on open source (lm-eval, Inspect, Promptfoo, DeepEval all OSS);
differentiation is distribution and enterprise trust, not IP — brutal for a solo founder with no
GTM. (4) **Nonprofit/research-shaped** risk on the exact gaps this brief celebrates —
cross-harness metrology, statistical-rigor PRs, benchmark-rot CI are funded as grants (a16z OSS,
GitHub Accelerator), government (UK AISI Inspect, NPL Centre for AI Measurement), nonprofits
(EleutherAI <$3M budget) — research standing, no per-seat buyer.

**Pilot → company.** Scope the pilot as a standalone **verifier-quality / eval-validity auditor**
(generalizing R2E-Gym's distinguishing/toxic-test audit into a benchmark-agnostic OSS tool)
rather than a trace-to-eval converter. Path: (1) ship the OSS auditor + a methodology paper
(NeurIPS D&B / MLSys) quantifying reward-channel toxicity across public RL environments — the
credibility artifact, following the Promptfoo/DeepEval/lm-eval playbook where the open tool *is*
the top-of-funnel; (2) the differentiated wedge on top is a hosted "reward/eval QA" service for
teams doing agent post-training / RL fine-tuning, who currently have no way to know their reward
signal is teaching the wrong thing — a pain observability incumbents don't touch; (3) his
published LLM-as-judge / RAG-hallucination study + data-pipeline skills are directly load-bearing
and hard for a generic observability vendor to replicate. Realistic exit: acqui-hire by an
RL-infra/compute player (CoreWeave, Together, a frontier lab) — a fundable wedge/talent play, not
a decade-long independent SaaS.

### 5. Data quality / contamination / provenance — **alternate (detector-FPR-corrected data-audit pilot)**

**Significance (plain).** Every model is a function of what it was trained on, and almost nobody
can prove what that was. Three pains: (1) **Trust/quality** — models trained on duplicated,
mislabeled, toxic, or benchmark-leaked data behave worse and cheat on evals, so companies can't
tell genuine skill from memorized tests. (2) **Legal/consent** — licenses and origins of most
training data are undocumented or wrong (the Data Provenance Initiative found 70%+ license
omission, 50%+ error rates), now a live copyright-litigation exposure. (3) **Contamination of the
supply itself** — AI-generated text is flooding the web with no error-corrected estimate of how
much of a fresh crawl is machine-written. The EU AI Act (Article 10 + the Jul-2025 GPAI
training-data disclosure template, enforcement Aug 2 2026, fines up to €15M or 3% of revenue)
turns "document your data" from optional hygiene into a legal requirement. The dataset-licensing
market alone was ~$4.8B (2025), projected ~$22.6B (2034) (⚠️ aggregator projection).

**Commercial wedge + who pays.** The one wedge with a paying enterprise buyer and a moat is
**AI-training-data compliance/audit tooling aimed at the EU AI Act**: a product that ingests a
company's training/fine-tuning/RAG corpus and auto-generates the Article 10 / GPAI
data-governance artifact — provenance ledger, license classification, PII/toxicity/dedup/
benchmark-leakage report, exportable timestamped audit trail. Buyers: mid-market and enterprise
teams shipping GenAI into the EU, and labs' downstream customers now asked for data documentation
in due diligence. His exact stack (data pipelines, classifiers, LLM-as-judge, published
RAG-hallucination study) maps directly onto the deliverable — quality/license/leakage classifiers
plus calibrated LLM-judge scoring *are* the product. Contamination-detection research is the
credibility layer, not the SKU.

**Comparables + funding.**
[Cleanlab](https://cleanlab.ai) — $30M raised (Menlo/TQ/Bain/Databricks Ventures);
**acqui-hired by Handshake (Jan 2026)**, ~9 staff moved, product wound down — the key cautionary
comparable. [DatologyAI](https://www.datologyai.com) — $57.6M total (Series A May 2024,
Felicis/Amplify/Radical + Elad Gil/M12); 56 employees (Jun 2026), **no Series B in 2+ years** —
curation-as-a-service not compounding. [Weights & Biases](https://wandb.ai) — acquired by
CoreWeave (~$1.7B, closed May 2025). [Promptfoo](https://www.promptfoo.dev) — acquired by OpenAI
(Mar 2026). [TollBit](https://tollbit.com) — $31M Series A, content-licensing marketplace (funded
"provenance" flavor, but marketplace-shaped not forensics). [ProRata](https://prorata.ai) — $25M
Series A. [Human Native](https://www.humannative.ai) — ~$3.6M seed.
[Truepic](https://truepic.com) — $26M+ raised, C2PA content authenticity — watermarking now
standards- and hardware-commoditized (Pixel/Samsung sign photos by default). Defensibility has
reportedly overtaken growth as the top 2026 VC valuation driver (⚠️ trade-press claim).

**Whitespace.** A **self-serve, developer-first training-data compliance/audit product priced as
software** (not a consulting engagement) that produces regulator- and procurement-grade evidence
for AI Act Article 10 / GPAI disclosure — automated license classification + provenance-lineage
across dataset derivatives (raw → filtered → synthetic-rewrite), benchmark-contamination + PII/
dedup scanning, and **detector-FPR-corrected synthetic-content estimates**, all in one exportable
report. Current players split the problem: GRC vendors do policy paperwork with no data-layer
intelligence; data-quality startups (post-Cleanlab) do label QA with no compliance/provenance
framing; licensing marketplaces do deals, not audits. The unclaimed measurement-science asset — a
validated, error-corrected way to say "X% of this corpus is machine-generated / benchmark-leaked
/ license-unclear" *with real confidence intervals* — is the primitive nobody sells credibly yet.

**Honest risks.** The purest version is feature-shaped, and the market just proved it: Cleanlab —
best-funded standalone data-quality company, MIT founders, real hallucination-detection product
(TLM) — was acqui-hired, product wound down. That is the archetypal outcome: talent grab, not a
scaled company. DatologyAI stuck at Series A for 2+ years. The adjacent eval/observability layer
consolidates into platforms (W&B→CoreWeave, Promptfoo→OpenAI) — capabilities the model providers
bundle free. Watermarking/provenance-of-media is being standardized (C2PA/ISO) and pushed into
hardware, dominated by Adobe/Google/Microsoft — a solo founder can't win a standards-and-OS fight.
Content-licensing marketplaces are two-sided-marketplace/legal-ops businesses, not data-forensics
tooling — a different company from what his skills support. The research-brief crown jewels
(contamination auditing, model-collapse empirics, synthetic-share measurement) are
services/nonprofit/academic-shaped: they name-and-shame companies and datasets, the buyer is
diffuse, natural home a lab or a DPI-style collective. Even the compliance wedge carries
services-drag (audits smell like consulting) and incumbent-absorption risk (GRC and data-catalog
vendors — Credo, OneTrust, Collibra, hyperscalers — will bolt "AI Act data governance" onto
existing suites).

**Pilot → company.** Build the "detector-FPR-corrected data-audit" artifact: take a public corpus
(or a slice of a fresh Common Crawl snapshot), run license/PII/dedup/benchmark-leakage classifiers
plus a calibrated synthetic-text detector, and publish the **first estimate that properly
propagates detector error into the headline number.** Triple duty: (1) a publishable
eval-methodology paper extending his LLM-as-judge/RAG-hallucination track record into data
forensics — instant credibility; (2) a working prototype of the exact audit engine the compliance
product would sell; (3) a demo-able lead magnet — "we measured the contamination in your training
set, corrected for detector error, here's the report" is a warm sales conversation. The report
template becomes the product's output, the classifiers the backend, the calibration methodology
the defensible IP. Fundable **only** if framed as an AI-compliance/audit company with a defensible
measurement primitive; **not** fundable as "we clean/curate training data" or "we detect
contamination" alone.

### 6. LLM evaluation & observability — pilot: **JudgeFlip**

**Significance (plain).** Companies ship software whose "brain" is an LLM, and unlike normal code
an LLM can silently get worse: it hallucinates, drifts on vendor updates, breaks on untested
inputs. Eval and observability is the QA-plus-monitoring layer — it traces what the AI did, scores
output quality (often using another LLM as an automated "judge"), catches regressions before
users do. Every enterprise deploying agents has the same "black box in production" fear and no
traditional test suite for it. Third-party estimates put LLM-observability at ~$2.7B (2026) →
~$9B (2030) (⚠️ aggregator); Gartner predicts explainability/observability will absorb ~50% of
GenAI-deployment investment by 2028 (⚠️ analyst forecast). His exact expertise (LLM-as-judge, RAG
hallucination eval) sits at the technical heart — and the judge is provably unreliable (2026
"coin-flip judge" studies show judges disagree with themselves at near-random rates, scores swing
with inference budget/quantization alone).

**Commercial wedge + who pays.** Not "another observability dashboard." It is **judge/eval
RELIABILITY as an independent, model-agnostic trust layer** — a tool that certifies whether a
customer's LLM-judge actually agrees with humans, is stable across model/quant/version changes,
and reports calibrated error bars — directly extending JudgeFlip. Who pays: (1) enterprise AI
teams who run evals but can't trust the numbers (compliance, EU AI Act external-evaluator regime,
internal sign-off); (2) the observability incumbents themselves (Braintrust, Datadog, Arize,
LangSmith) as an **OEM/embedded reliability module** — every one ships LLM-as-judge scorers and
none has solved judge trustworthiness. A "reliability/QA-for-the-QA" pick-and-shovel play riding
the same growth curve without competing head-on with $800M dashboards.

**Comparables + funding.**
[Braintrust](https://www.braintrust.dev) — $80M Series B at $800M (Feb 2026), customers incl.
Notion, Replit, Cloudflare, Ramp, Dropbox. [LangChain/LangSmith](https://www.langchain.com) —
$125M at $1.25B (Oct 2025), ~$16M ARR. [Arize AI](https://arize.com) — $70M Series C, ~$1B (Feb
2025). [Langfuse](https://langfuse.com) — YC W23, ACQUIRED by ClickHouse (Jan 2026).
[Galileo AI](https://www.rungalileo.io) — $45M Series B, ACQUIRED by Cisco (closed May 22 2026,
into Splunk). [Patronus AI](https://www.patronus.ai) — $50M Series B (Jun 2026), *repositioned*
away from pure eval toward agent-simulation/stress-testing — a tell that "evaluation" alone was
too thin a wedge. [Datadog](https://www.datadoghq.com) — ships native LLM Observability with
custom LLM-as-judge evaluators (GA late 2025), absorbing eval as a feature. AI startups took ~33%
of all VC in 2026 (⚠️ aggregator).

**Whitespace.** Nearly every player ships eval/judge **scoring**; almost none has productized
judge/eval **trustworthiness** — certified human-agreement, cross-version/quantization stability,
calibrated error bars as a first-class deliverable. NIST/UK-AISI International Network practice #7
("include uncertainty estimates") and the EU AI Office's forming external-evaluator qualification
regime create regulatory pull for exactly this, while commercial dashboards still report bare
judge scores. But it is a **thin slab of whitespace inside a saturated, consolidating market** —
which is why it reads as a feature/wedge, not a company.

**Honest risks.** This is the most crowded, best-funded, fastest-consolidating corner of the eval
field, and a solo first-time founder is entering *late*. (1) **Feature-not-a-company is severe and
already materializing** — LLM-as-judge scoring is a checkbox inside Braintrust, Datadog, LangSmith,
Arize; judge-reliability is exactly what these platforms absorb in a quarter. (2) **Incumbent
absorption is the base rate** — ClickHouse/Langfuse, Cisco/Galileo, Datadog building natively.
(3) **Moat weakness** — the core methods (calibration against human labels, position/verbosity
correction, error bars) are publicly published; his edge is know-how, not IP. (4)
**Buyer-builds-it** — Patronus says it "primarily competes against the internal teams AI labs have
already built." (5) **The safety/meta-eval end (METR, HELM, EvalEval) is nonprofit/grant-shaped**
and does *not* scale as a product. (6) **Venture-scale doubt** — a reliability-certification tool
may top out as mid-six-figure ARR or an EU-AI-Act external-evaluator *consulting* engagement,
neither a fundable standalone. Patronus abandoning pure eval is the market's own verdict.

**Pilot → company.** JudgeFlip is well-timed as **credibility**, less so as a company seed. The
2026 "coin-flip judge" literature confirms the problem is live and unsolved, so a rigorous
JudgeFlip artifact — verdict flips across quantization levels and inference budgets, with
calibrated stability metrics — is a strong proof-of-competence opening design-partner
conversations with observability incumbents (who need this and would rather buy/hire than build
the science), an EU AI Act external-evaluator credential, or a senior applied-eval role at
Braintrust/Arize/Patronus/a frontier lab. The honest path is **pilot-as-wedge-into-a-team-or-
partnership**, not pilot-as-Series-A. If forced toward a company, the only defensible framing is
the embedded/OEM reliability layer sold *to* the incumbents (turning "they'll absorb this feature"
into "we're the feature vendor") plus regulated-evaluator certification as initial revenue — both
with real ceiling risk.

### 7. Reproduction / meta-science of AI — pilot: **ReproCheck**

**Significance (plain).** AI progress is reported through claims — "this model scores X," "this
method is 10× faster," "this agent does the job." A striking share don't hold up: benchmarks
contain label errors big enough to reorder rankings (MMLU-Redux found 6.49% wrong); foundational
scaling-law fits were mis-estimated (Epoch's Chinchilla replication); viral results collapsed on
scoring bugs (gzip-beats-BERT); hyped products flopped in honest hands-on tests (Answer.AI's
3-of-20 Devin run); the most-cited leaderboard was accused of structural bias (the Leaderboard
Illusion audit of Chatbot Arena/LMArena). Billion-dollar compute decisions, enterprise
model-purchases, and public trust all rest on numbers frequently gamed, contaminated, or simply
wrong. The domain is the immune system of the field. The scarce input is *credibility and rigor,
not compute* — which is why solo bloggers have repeatedly overturned funded labs' claims.

**Commercial wedge + who pays.** The honest answer: the domain as literally defined (independent
replication + benchmark-health + meta-science) is **not the company — it is the credibility
asset.** The fundable company *adjacent* to it is enterprise eval/verification-as-infrastructure.
The ReproCheck-shaped wedge that could scale: a **"does-this-vendor-claim-hold-up" verification
service for AI BUYERS** — enterprises procuring LLMs/agents who need independent,
contamination-resistant, holdout-based proof that a vendor's benchmark numbers translate to their
use case. Who pays: enterprise AI-procurement/platform teams (*not* the labs being audited — that
is the conflict-of-interest trap Epoch and LMArena fell into). The reproducibility craft is the
moat and top-of-funnel (published takedowns = distribution and trust); the revenue is a repeatable
"trust layer" a buyer runs before signing an ISO-42001/SOC-2-era AI contract. Same pattern Qodo
($120M, code verification) and Patronus ($70M, agent stress-testing) monetized: verification
attached to a decision someone is already paying to get right.

**Comparables + funding.**
[LMArena](https://lmarena.ai) — $100M seed at $600M (May 2025, a16z + UC Investments);
monetization unproven, and it is the entity the Leaderboard Illusion audit accused of bias.
[Patronus AI](https://www.patronus.ai) — $70M total ($50M Series B Jun 2026), pivoted from
mistake-detection to agent stress-testing — the eval money is here.
[Galileo](https://www.rungalileo.io) — $68M total, enterprise eval/observability.
[Qodo](https://www.qodo.ai) — $120M total ($70M Series B Mar 2026) — proof "verification-as-
workflow" is fundable when tied to a paying decision. [Scale AI (SEAL)](https://scale.com) —
benchmark auditing / private-holdout evals as a *feature* inside a data-labeling giant.
[Artificial Analysis](https://artificialanalysis.ai) — for-profit independent benchmarking, small
(⚠️ no confirmed priced round; PitchBook profile inaccessible). [Epoch AI](https://epoch.ai) —
**NONPROFIT**, ~$6.9M Open Phil grant; got burned on undisclosed OpenAI/FrontierMath funding.
[METR](https://metr.org) — **NONPROFIT**, ~$17M via TED Audacious, **explicitly refuses
AI-company money** — the definitive tell that independence and revenue conflict here.

**Whitespace.** Narrower than it looks: (1) **buyer-side, contamination-resistant, holdout-based
verification of vendor claims** for enterprises procuring AI — no venture-backed pure-play exists
(LMArena/Scale/Artificial Analysis serve the labs and the public, not skeptical buyers); the EU
AI Act / ISO-42001 procurement-evidence tailwind is real and 2026-fresh. (2) efficiency/inference-
claim auditing ("10× faster," quantization-quality tradeoffs) — under-audited vs capability
claims, fits his systems strengths (the Sakana CUDA episode shows how easily these are gamed).
(3) living, continuously-updated systematic reviews for core LLM topics. All three are real gaps,
but (2) and (3) are content/nonprofit-shaped; **only (1) has a plausible payer.**

**Honest risks.** The bluntest verdict in the sweep: **the domain as named is nonprofit/media-
shaped, not venture-shaped, and the market has already proven it.** Every pure-play in independent
replication/benchmark-health/meta-science is a nonprofit (Epoch, METR, EleutherAI, Unjournal,
Apollo), an academic group, or a solo blogger — and METR *explicitly refuses payment to stay
independent.* That is the killer structural tension: the entire value proposition is independence,
and the moment you take revenue you inherit the conflict-of-interest that discredits you (Epoch's
undisclosed OpenAI funding; LMArena raising $100M then being accused of gaming its own
leaderboard). Independence and scalable revenue are close to mutually exclusive here. Second,
feature-not-a-company is severe — benchmark auditing and contamination detection are being
absorbed into platforms (Scale SEAL, LMArena, Artificial Analysis, Galileo/Patronus/Braintrust/
Arize). Third, the fundable pivot (enterprise verification) is crowded and well-capitalized —
you'd be a late, undifferentiated entrant against $50–120M-funded incumbents, and reproducibility
credibility does not obviously transfer to selling observability SaaS. Fourth, forensics of hyped
results carries legal/reputational exposure (Reflection 70B) and reads as media/advocacy, not
product. Fifth, contamination detection is scientifically unsettled (rephrasing defeats n-gram
methods) — thin technical moat.

**Pilot → company.** ReproCheck is far more valuable as a **credibility and distribution
artifact** than a product seed. A small number of rigorous, code-backed, well-publicized
takedowns/replications (the Martínez/Schutte template — one headline number, public data, no GPUs)
build the scarce asset this space rewards: a reputation for calling claims correctly and
independently. That reputation is the top-of-funnel and only real moat for the fundable adjacent
business (buyer-side claim-verification). But be honest: this is a **pivot away from the pure
domain, not a straight line from it** — the pilot proves you can be trusted; the company sells that
trust to buyers, not the auditing itself. If the pilot stays in pure meta-science, the realistic
destinations are a research-nonprofit role, a grant/newsletter (AI Snake Oil / Gwern model), the
Unjournal (~$350–450/eval), or an eval-lab hire — respectable, impactful, **not a startup.**

### 8. AI supply-chain / compute intelligence — pilot: **DiversionDB**

**Significance (plain).** The entire AI economy rests on physical chokepoints — one Dutch firm
(ASML) for EUV lithography, TSMC for leading-edge logic, three firms for high-bandwidth memory —
and the decade's biggest policy bets (US export controls, compute-threshold regulation) assume we
can measure what flows through them. We mostly can't. Estimates of how many controlled chips were
smuggled into China span an order of magnitude (~290k to 1.6M H100-equivalents), nobody has done a
rigorous causal study of whether export controls worked, and there's no public tracker of compute
outside the US. Tens of billions in enforcement, hundreds of billions in GPU-backed lending, and
national-security policy are decided on numbers with ~5× uncertainty. Whoever can turn messy public
evidence — customs data, DOJ indictments, satellite imagery, permits — into a reliable, queryable
picture of where compute physically is and where chips actually go holds something governments and
capital markets now need.

**Commercial wedge + who pays.** Not a nonprofit-style smuggling-estimate report (the Epoch/IAPS
lane). The fundable shape is a **compute-and-diversion intelligence platform** on two demand curves
that hardened in 2026: (1) national-security/enforcement — a Sayari/Kharon-style risk-and-diversion
data product sold to BIS, DOJ, allied trade-enforcement agencies, and to Nvidia/OEMs/cloud
resellers now carrying export-control liability; (2) **compute-finance diligence** — a data feed
verifying what GPU fleets exist, are utilized, and are properly located, sold to the private-credit
funds and neoclouds sitting on >$200B of GPU-collateralized debt. DiversionDB (an LLM-extraction
pipeline turning DOJ/BIS filings + press + trade data into a living, structured, citable diversion
dataset) is the wedge artifact — the one asset in this field that doesn't yet exist and that his
skillset can build solo for <$500. Who pays: government contracts (via Carahsoft/In-Q-Tel channels),
chip-vendor and cloud compliance teams, and compute lenders/investors.

**Comparables + funding.**
[SemiAnalysis](https://www.semianalysis.com) — bootstrapped/profitable, ~$20M → ~$100M projected
revenue 2026 (⚠️ figure via a flash-news dispute report, unverified); founder now raising a VC
fund — the one proof the "compute research firm" model is a company, but built on years of unique
industry access, not a clean dataset. [Sayari](https://sayari.com) — $235M Series D (Jun 2025) +
prior $228M TPG majority; export-control/trade-enforcement risk intelligence — closest direct
analog. [Kpler](https://www.kpler.com) — $1B+ minority from Sixth Street (Jun 2026), ~$5B secondary
val; the scaled adjacent that could absorb this vertical. [Altana](https://altana.ai) — $200M
Series C at $1B unicorn (Jul 2024) but only ~$37.5M ARR — unicorn valuations here sit on thin
revenue. [Kharon](https://www.kharon.com) — direct-competitor category, last disclosed round Seed
2020 — a caution signal (never raised big). GeoComply / Multibeam / Fortaegis — named Chip Security
Act beneficiaries; location-verification *hardware* plays, not analytics.
[Palantir](https://www.palantir.com) — the ultimate incumbent absorber for government analytics.
Defense-tech VC hit $14.6B in 2026 (up from $9.6B in 2025, ⚠️ trade-press); the NEW vector is the
>$200B GPU-collateralized private-credit market (Blackstone/Blue Owl/Apollo/Pimco/BlackRock) +
Nvidia's Jul-2026 neocloud backstop, creating fresh demand for compute verification no incumbent
yet serves.

**Whitespace.** Nobody has built the **compute-finance diligence data layer**: an independent,
continuously-updated verification of what GPU fleets exist, where they physically sit, whether
they're utilized — aimed at the >$200B GPU-lending market that only formed in 2025–26. Sayari/Kpler/
Altana track goods and entities, not compute specifically; Epoch tracks facilities as a nonprofit
(~15% coverage) with no non-US tracker and no commercial product; SemiAnalysis has the data but
sells research, not a structured feed/API for underwriters. Secondary whitespace: an independent
audit/red-team of Chip Security Act location-verification claims (the hardware vendors have an
obvious conflict; nobody neutral is measuring spoofability at scale).

**Honest risks.** DiversionDB as conceived is **analyst/nonprofit-shaped, not a company** — a
curated database of smuggling evidence with probabilistic estimates is exactly what Epoch and IAPS
publish for free and what CNAS/CSET fund philanthropically. The gap between "useful dataset" and
"company" is SemiAnalysis's newsletter (nice) vs its ~$100M in report+data sales (the actual
business) — and Dylan Patel got there via years of industry relationships, not a clean dataset.
(1) **Feature/incumbent absorption** — Sayari, Kpler, Altana, Palantir own the government
trade-risk graph; "AI-chip diversion" is one data source they add. (2) **Services/consulting drag**
— natsec data sales are long-cycle, relationship- and clearance-gated; a solo technical founder
with no natsec network or clearance is structurally disadvantaged vs In-Q-Tel-blessed incumbents.
(3) **Thin, contested ground truth** — smuggling volumes are fundamentally unobservable (5× CIs);
you can't productize a number nobody can validate, and being publicly wrong is reputationally fatal.
(4) **Regulatory dependence** — much near-term TAM hinges on the Chip Security Act (H.R. 3447)
becoming law; if it stalls, demand evaporates. (5) **Crowding at the top, emptiness at the bottom**
— the scaled players are well-funded, the open lane is the neglected-nonprofit lane Open Phil funds;
the venture-shaped middle is narrow. **For this founder specifically, this is the weakest realistic
venture path of the eight** despite the on-paper "3."

**Pilot → company.** Credibility-first, not product-first. Build and publish DiversionDB as a
rigorous open artifact — the living, judge-validated diversion database plus a public reconciliation
of the CNAS/Epoch estimates — because that is what earns standing in a field where newsletters and
datasets are load-bearing infrastructure. The pilot's job: make him the name attached to "the
canonical structured picture of chip diversion," the way Grunewald's 2023 IAPS report created a
sub-literature. Two forks: (a) **the SemiAnalysis fork** — parlay reputation + a proprietary data
pipeline into paid research/data subscriptions for compute lenders, chip-vendor compliance, and
neocloud-debt underwriters (a demand that literally did not exist before 2026); (b) **the acqui-feed
fork** — build the best AI-compute-flow data layer and get absorbed by Sayari/Kpler/Altana/Palantir.
Fork (a) is the only genuinely company-shaped outcome, plausible only if the compute-finance buyer
materializes at scale; otherwise this is an excellent analyst/researcher career or an Open-Phil
nonprofit — not a venture.

---

## Recommended startup-optimized shortlist (for confirmation)

Under a venture lens, **three** domains carry a plausible company path, with a **fourth** as a
credential/co-founder hedge. All four re-use his LLM-as-judge / eval-methodology core, so the
pilots are not wasted regardless of which he pursues.

**1. Agent security & authentication — the strongest venture bet.**
*Thesis:* Be the neutral, standards-literate **measurement/assurance authority** for agent
scope-adherence — the one risk category with zero public benchmarks — then convert the benchmark
into proprietary attack data + a continuous-assurance product enterprises and authz vendors pay
for. It rides the hottest, best-funded 2026 security wave with a defensible "measurement, not
enforcement" position that the acquisition-hungry incumbents (SentinelOne/Cato/Check Point) buy
rather than build.
*Wedge experiment:* **Pilot D · ScopeBench.**

**2. AI audit / compliance (agent assurance) — the co-founder / insurance-attached path.**
*Thesis:* Own the **technical evaluation layer under the insurance-priced assurance bundle**
(the AIUC model) for one regulated vertical — turning agent behavior into a priceable risk number
that insurers and GRC platforms cannot reproduce. Strongest when paired with a business co-founder
holding the insurance/distribution half; the EU AI Act + AIUC precedent make the buyer real.
*Wedge experiment:* an **unspecced vertical-audit pilot** (a preregistered agent/RAG assurance
benchmark for one high-stakes domain) — the direct sibling of ScopeBench and the JudgeFlip
methodology.

**3. Model behavior QA / drift governance — the liability-driven differentiator.**
*Thesis:* Sell **deployer-side behavioral contracts + gating against silently-updated third-party
model APIs**, framed on SB-243/liability rather than performance — the one thing the crowded
observability field is first-party and point-in-time about, and the "no product operationalizes
deployer-controlled gating" gap is documented. A live public drift-observatory is the top-of-funnel.
*Wedge experiment:* **Pilot B · PersonaAtlas**, re-scoped from persona clustering to a
continuous public behavioral-drift observatory.

**4. AI dev tooling — verifier/reward-quality QA (hedge).**
*Thesis:* Ship a **benchmark-agnostic verifier/reward-quality auditor for RL/agent post-training
loops** — upstream of where every observability vendor plays, and a genuine skills-fit — with a
realistic exit as an acqui-hire by an RL-infra/compute player. Keep it as a fourth option: the
whitespace is narrow and the layer is the most-absorbed in AI, so treat it as a talent play, not a
decade-long SaaS.
*Wedge experiment:* an **unspecced verifier-quality auditor pilot** (generalizing R2E-Gym's
toxic-test audit into an OSS tool).

### Drop, and why

- **Pilot E · DiversionDB (AI supply-chain) — DROP for the founding goal.** On-paper "3," but the
  only company-shaped fork (SemiAnalysis-style data subscriptions) depends on GTM this founder
  lacks — natsec relationships/clearance or years of industry access — and the ground truth is
  fundamentally unvalidatable (5× CIs). It remains an **excellent nonprofit/analyst artifact and
  Open-Phil-fundable career**, and a genuinely high-impact pilot to *run* — just not a venture.
- **Pilot C · ReproCheck (reproduction/meta-science) — DROP for the founding goal.** The bluntest
  verdict: the domain as named is nonprofit/media-shaped, and *independence and revenue are near
  mutually exclusive* (METR refuses AI-company money; Epoch and LMArena were both discredited the
  moment money entered). The fundable pivot (buyer-side claim-verification) is a *pivot away* from
  the domain into a crowded category. Keep ReproCheck **only as a credibility artifact** — a
  cheap, fast reputation-builder that opens doors — not as a company seed.

### Add

- **ADD: AI audit / compliance** (now #2 above) — it out-scores the two dropped pilots on venture
  potential because it attaches to a real balance-sheet buyer (insurance) and a real regulatory
  mandate, and it is the closest sibling to his existing skills. It was not in the original five;
  it should be.
- **ADD (as hedge): AI dev tooling — verifier-quality QA** (#4) — narrowly, as a talent/acqui-hire
  play, if the verifier-auditor whitespace survives a scoop check.

*Net:* the startup-optimized five become **ScopeBench, vertical-audit (compliance), PersonaAtlas-as-
observatory, verifier-quality auditor, and JudgeFlip-as-credential** — swapping the two nonprofit-
shaped pilots (DiversionDB, ReproCheck) out of the *company* track while keeping them available as
impact/credibility work.

---

## Honest caveats

- **Nothing here scored above a 3.** Every domain a solo eval-methodologist can credibly enter is
  either feature-shaped or crowded-and-consolidating. There is no clean greenfield. If that is
  disqualifying, the honest move is to keep the hired/nonprofit paths primary and treat "founder"
  as opportunistic.
- **Feature-not-a-company is the default failure mode, not the exception.** LLM-as-judge scoring,
  trace→eval loops, drift/regression testing, label QA, benchmark auditing — all are already
  checkbox features inside funded platforms. A benchmark is a paper; a paper is not a company. Every
  recommended thesis above depends on converting a copyable artifact into a **non-copyable asset**:
  proprietary attack/audit data, a continuous pipeline, a compliance/attestation workflow, or an
  insurance/distribution partner. If that conversion isn't credible, it's a feature.
- **A startup needs a wedge AND a moat.** The pilots produce excellent *wedges* (credibility,
  door-openers, warm leads). None of them is a *moat* on its own. The moats available to this
  founder are: (a) proprietary continuously-refreshed data, (b) a regulated-evaluator/attestation
  brand, (c) a co-founder with distribution or balance-sheet, or (d) being early enough to become
  the named authority. At least one must be real before "found a company" beats "get hired / get
  funded as a nonprofit."
- **The observed exit is absorption, not IPO.** For the top domains the realistic outcome inside
  18–30 months is a tuck-in (SentinelOne/Cato/Check Point/Braintrust/ClickHouse/OpenAI/CoreWeave
  pattern). That is a legitimate founder outcome — just calibrate the thesis to it rather than a
  unicorn story.
- **Independence and revenue conflict — permanently — in the neglected lanes.** The domains with
  the *highest impact and least crowding* (reproduction/meta-science, supply-chain intelligence)
  are exactly the ones where taking money destroys the value proposition. This is not a solvable
  business-model problem; it is structural. Those lanes are for the nonprofit/analyst path.
- **Hired and nonprofit remain first-class fallbacks — and often the better fit.** The charter's
  original framing still holds: in evaluation research the most credible institutions are
  nonprofits, and grant funders actively fund this shape of work. Several pilots (JudgeFlip,
  ReproCheck, DiversionDB) are *stronger* as credentials into a lab/nonprofit role than as company
  seeds. Choosing to found should be a positive choice made *after* a pilot reveals a real moat —
  not a default.

---

*Related: [08 · Pilot specs](08-pilot-specs.md) (the five wedge experiments) ·
[05 · Domain comparison index](05-domain-comparison-index.md) (the impact-first scoring this doc
re-weights) · [00 · Goals & operating principles](00-goals-and-operating-principles.md) (the three
exit paths).*
