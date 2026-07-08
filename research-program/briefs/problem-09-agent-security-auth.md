# Problem 09 — Agent Security & Authentication: the identity/auth layer beyond prompt injection

*Brief for a solo, part-time researcher. Grounding: internal map docs
[robustness-and-jailbreaks](../../ai-research-map/03-alignment-interpretability-safety/robustness-and-jailbreaks.md)
and [multi-agent-systems](../../ai-research-map/11-emerging-application-subfields/multi-agent-systems.md).
All external claims link to a page I opened. "⚠️ unverified" = inferred or not directly confirmed against a primary source.*

---

## The problem, concretely — what is actually going wrong / at stake; the measurable sub-problems

The map docs already cover the **content** layer of agent security: prompt injection (OWASP LLM01), jailbreaks, tool-poisoning across 67k+ MCP servers ([arXiv:2503.23278](https://arxiv.org/abs/2503.23278)), and architectural defenses like CaMeL and MELON. This brief is about the layer *underneath* that: **who is this agent, whom does it act for, what is it allowed to do, and who is liable when it goes wrong.** These are not "make the model refuse better" problems; they are distributed-systems identity, delegation, and authorization problems that the ML safety literature has largely not owned.

Concrete failure modes already documented in primary sources:

- **The MCP servers with no auth at all.** The MCP authorization spec defines an OAuth 2.1 + PKCE framework but marks authorization **optional**; a July 2025 scan found **1,862 publicly accessible MCP servers responding to unauthenticated requests** ([Security Boulevard, Apr 2026](https://securityboulevard.com/2026/04/7-mcp-authentication-vulnerabilities-b2b-saas-vendors-must-prevent/)). The widely-used `mcp-remote` OAuth proxy (~437k dev environments) allowed **shell command injection via a malicious `authorization_endpoint`**, and MCP's OAuth handshake has produced **one-click account-takeover** pitfalls ([Obsidian Security](https://www.obsidiansecurity.com/blog/when-mcp-meets-oauth-common-pitfalls-leading-to-one-click-account-takeover)).
- **Agent Cards are spoofable.** A2A agents trust each other via JSON "Agent Cards" that are **broadcast without mandatory end-to-end signing**, so an adversary can forge capabilities, inject false endpoints, or impersonate a trusted agent during discovery; the protocol delegates credential handling entirely to implementers ([CSA MAESTRO threat model](https://cloudsecurityalliance.org/blog/2025/04/30/threat-modeling-google-s-a2a-protocol-with-the-maestro-framework); [arXiv:2504.16902](https://arxiv.org/html/2504.16902v2)).
- **Payment mandates can be talked out of the agent.** Google's AP2 uses cryptographically-signed **Intent / Cart / Payment Mandates**, but a 3-person red-team showed simple prompt injection ("Branded Whisper" / "Vault Whisper") **subverts product ranking and exfiltrates user data** from a Gemini-2.5-Flash ADK shopping agent ([arXiv:2601.22569](https://arxiv.org/pdf/2601.22569)); a separate group showed AP2's spec-level signature guarantees don't stop **replay and context-binding failures at runtime** ([arXiv:2602.06345](https://arxiv.org/pdf/2602.06345)).
- **The "acting on behalf of" gap.** Workload-identity standards (WIMSE) verify *which service* made a request but **not whether a user actually authorized it** ([draft-oauth-ai-agents-on-behalf-of-user](https://datatracker.ietf.org/doc/html/draft-oauth-ai-agents-on-behalf-of-user-00)). Classic OAuth has no notion of "this token is a human's delegation to a specific agent for a specific scope and time window."

**Measurable sub-problems** (things you could put a number on): rate at which a signed-agent verification can be bypassed/spoofed; delegation-scope leakage (does an agent act outside its granted scope under adversarial pressure?); replay/binding-failure rate for signed mandates; false-accept / false-reject rates of "Know Your Agent" verification; the attribution success rate (given an incident log, can you correctly identify the responsible agent/user/operator?). Almost none of these have a public benchmark — see gaps below.

---

## The research field around it — what work exists: sub-areas, methods, maturity

This is a **young, standards-driven, security-flavored** field, distinct from the ML-centric robustness literature. Sub-areas:

1. **Agent identity & authenticated delegation** — extending OAuth 2.0 / OIDC with agent-specific credentials and consent. Anchor academic work: **"Authenticated Delegation and Authorized AI Agents"** (Tobin South et al., MIT/Stanford, [arXiv:2501.09674](https://arxiv.org/abs/2501.09674)). Standards track: **`draft-oauth-ai-agents-on-behalf-of-user`** (new `requested_agent` param + agent-authorization grant type) and **`draft-klrc-aiagent-auth`** ([datatracker](https://datatracker.ietf.org/doc/draft-klrc-aiagent-auth/)). Maturity: **early, live, fluid** — multiple competing Internet-Drafts, none yet a standard.

2. **Web-facing agent verification ("is this bot who it claims?")** — **Web Bot Auth**, built on RFC 9421 HTTP Message Signatures: an Ed25519 key per agent, a `Signature-Agent` header, a JWKS/Signature-Agent-Card directory. Now a chartered **IETF WebBotAuth WG** (co-chairs David Schinazi, Rifaat Shekh-Yusef; deliverables due 2026) ([WG charter](https://datatracker.ietf.org/group/webbotauth/about/); [Cloudflare blog](https://blog.cloudflare.com/verified-bots-with-cryptography/)). Maturity: **shipping** — AWS WAF, Vercel, Shopify, Akamai implementations claimed; Visa/Mastercard adopting it as an auth foundation ([Stellagent overview](https://stellagent.ai/insights/web-bot-auth-cloudflare-ietf)) ⚠️ (vendor-blog claims, not independently benchmarked).

3. **Decentralized / capability-based agent identity** — W3C DIDs + Verifiable Credentials + capability tokens. Internet-Drafts: **AIP (Agent Identity Protocol)** in several competing variants (`draft-singla-...`, `draft-prakash-aip` with Invocation-Bound Capability Tokens / Biscuit chained delegation), and **Delegation Receipt Protocol** (`draft-nelson-agent-delegation-receipts`: user-signed authorization object on an append-only log) ([datatracker AIP](https://datatracker.ietf.org/doc/draft-singla-agent-identity-protocol/); [DRP](https://datatracker.ietf.org/doc/draft-nelson-agent-delegation-receipts/)). Maturity: **proposal-stage, crowded, uncoordinated.**

4. **Agent-to-agent trust** — signed Agent Cards, trusted registries, mutual TLS/PKI, "tool-squatting" defenses via zero-trust registries ([arXiv:2504.19951](https://arxiv.org/pdf/2504.19951)). Comparative protocol security analyses use vulnerability taxonomies ([arXiv:2511.03841](https://arxiv.org/html/2511.03841v1)). Maturity: **threat-modeling and taxonomy phase**, few implemented defenses evaluated head-to-head.

5. **Agentic payments / commerce auth** — **AP2** (Google, 60+ orgs), **Visa Trusted Agent Protocol** (signs agent identity into HTTP headers), **OpenAI + Stripe Agentic Commerce Protocol (ACP)**, **Mastercard Agent Pay**, **Coinbase x402** (HTTP 402 stablecoin payments) ([Google AP2](https://cloud.google.com/blog/products/ai-machine-learning/announcing-agents-to-payments-ap2-protocol); [Visa TAP](https://corporate.visa.com/en/sites/visa-perspectives/newsroom/visa-unveils-trusted-agent-protocol-for-ai-commerce.html)). Maturity: **fast-moving commercial land-grab**, security scrutiny lagging behind adoption.

6. **Attribution, liability & governance framing** — Alan Chan et al.'s **"IDs for AI Systems"** ([arXiv:2406.12137](https://arxiv.org/abs/2406.12137)) and **"Infrastructure for AI Agents"** ([arXiv:2501.10114](https://www.arxiv.org/pdf/2501.10114v1)), which name **attribution / interaction-shaping / detection-and-remediation** as the three functions of agent infrastructure. Legal scholarship on liability allocation is nascent (UETA binds the deploying party but doesn't allocate fault; [Tandfonline 2026](https://www.tandfonline.com/doi/full/10.1080/23311886.2026.2691325); [UChicago Law Review](https://lawreview.uchicago.edu/online-archive/law-ai-law-risky-agents-without-intentions)).

7. **Personhood / distinguishing humans from agents** — **"Personhood Credentials"** (Adler, Hitzig, Jain et al., OpenAI/Harvard/Microsoft, [arXiv:2408.07892](https://arxiv.org/abs/2408.07892)): prove you're human (or that an agent is a delegate of a real human) without revealing identity.

**Method mix:** protocol design + formal-ish security arguments; empirical scanning of deployed servers; adversarial red-teaming of protocols; threat-model taxonomies (MAESTRO, STRIDE-style); and a thin slice of eval/benchmark work. Notably, the rigorous-**measurement** culture that dominates jailbreak research (AgentDojo, InjecAgent, AgentHarm) has **not** yet been transplanted onto the identity/auth layer.

---

## Who does this work — orgs AND individuals; funding models; how outsiders contribute

**Standards bodies (open processes — the key contribution surface for an outsider):**
- **IETF** — WebBotAuth WG ([charter](https://datatracker.ietf.org/group/webbotauth/about/)); OAuth WG drafts for agent delegation; WIMSE WG. Anyone can join the mailing list, comment on drafts, or submit their own Internet-Draft — **no membership fee, no gatekeeping**. This is genuinely the most open door in the whole domain.
- **OpenID Foundation** — **AI Identity Management Community Group (AIIMCG)**, which produced the Oct 2025 whitepaper *"Identity Management for Agentic AI"* ([announcement](https://openid.net/new-whitepaper-tackles-ai-agent-identity-challenges/); [arXiv:2510.25819](https://arxiv.org/abs/2510.25819)). Community groups are open to non-members.
- **W3C** — DID / Verifiable Credentials working groups underpin the decentralized-identity drafts.
- **Cloud Security Alliance** — MAESTRO threat-modeling framework, MCP security research notes.

**Infrastructure / browser companies:** **Cloudflare** (Web Bot Auth reference implementation, [github.com/cloudflare/web-bot-auth](https://github.com/cloudflare/web-bot-auth); "signed agents" allowlist), Vercel, Akamai, AWS. Cloudflare's move is contested: Perplexity and others argue an allowlist blessed by "infrastructure controllers" creates **a two-tiered, gatekept web** ([Contrary Research debate](https://research.contrary.com/report/debating-the-open-internet-cloudflare-vs-perplexity); [HN](https://news.ycombinator.com/item?id=45066258)). That tension is itself a research subject.

**Protocol teams at labs / platforms:** Anthropic (MCP + AP2 core member), Google (A2A, AP2), OpenAI (ACP, personhood credentials), Microsoft. Payments: Visa, Mastercard, Stripe, PayPal, Coinbase/x402 Foundation.

**Academic / nonprofit security & governance groups:** MIT Media Lab (Tobin South), **Centre for the Governance of AI / GovAI** (Alan Chan — now also affiliated with safety-institute-adjacent work), ServiceNow Research (DoomArena), university security labs producing the A2A/AP2 red-team papers.

**Startups building the primitives:** Trulioo + PayOS ("Know Your Agent"), Vouched, AgentPassport, Chimoney/APort — "agent passport" / KYA vendors ([Vouched KYA guide](https://www.vouched.id/learn/blog/know-your-agent-guide)).

**Funding models:** standards work is volunteer/employer-sponsored (open to unaffiliated individuals); academic work via university + AI-safety philanthropic grants (Open Phil / GovAI-style); commercial protocol work is company-funded. **How an outsider contributes:** (a) submit IETF drafts or review comments; (b) publish red-team / benchmark papers on arXiv (the AP2 and A2A security papers are small-team academic outputs, not lab products); (c) ship an open-source eval harness or reference attack; (d) contribute to Cloudflare/ServiceNow open-source repos.

---

## Published exemplars — 4-8 works, favoring small-team/solo; why each mattered

1. **"IDs for AI Systems"** — Alan Chan (GovAI), [arXiv:2406.12137](https://arxiv.org/abs/2406.12137). Near-solo conceptual paper that named the attribution problem and framed IDs as governance infrastructure *before* the standards rush. Mattered because it set vocabulary the later drafts inherit.
2. **"Infrastructure for AI Agents"** — Chan et al., [arXiv:2501.10114](https://www.arxiv.org/pdf/2501.10114v1). Gave the field its three-function skeleton (attribution / interaction-shaping / detection-and-remediation). Small governance team, high citation leverage, no GPUs needed.
3. **"Authenticated Delegation and Authorized AI Agents"** — Tobin South et al., [arXiv:2501.09674](https://arxiv.org/abs/2501.09674). The concrete OAuth/OIDC-extension design that most subsequent IETF delegation drafts echo; translates natural-language permissions into auditable scopes. Academic small team → direct standards influence.
4. **"Personhood Credentials"** — Adler, Hitzig, Jain et al., [arXiv:2408.07892](https://arxiv.org/abs/2408.07892). Reframed "prove you're human" as privacy-preserving infra and explicitly covers "prove this agent is a delegate of a real person." Cross-institution but idea-driven, not compute-driven.
5. **AP2 red-team — "Whispers of Wealth"** — Debi, Zhu, Sen Gupta (3 authors), [arXiv:2601.22569](https://arxiv.org/pdf/2601.22569). A **3-person, laptop-scale** proof that signed mandates don't stop prompt-injection-driven subversion of a payments agent. The clearest template for what *this* researcher could do.
6. **Zero-Trust Runtime Verification for AP2** — Lan, Kaul, Jones, Westrum, [arXiv:2602.06345](https://arxiv.org/pdf/2602.06345). Small team; shows spec-level crypto guarantees ≠ runtime safety (replay/context-binding), and proposes consume-once mandates with ~3.8 ms verification at 10k tps. Attack **and** defense in one small paper.
7. **DoomArena** — ServiceNow Research, [arXiv:2504.14064](https://arxiv.org/abs/2504.14064), [github](https://github.com/ServiceNow/DoomArena). Modular, pluggable security-testing harness for agents (τ-bench, BrowserGym, OSWorld). Mattered as the extensible substrate onto which an auth-specific threat model could be *added* — a natural entry point for a contributor.
8. **A2A + MAESTRO threat model** — CSA, [blog](https://cloudsecurityalliance.org/blog/2025/04/30/threat-modeling-google-s-a2a-protocol-with-the-maestro-framework) + [arXiv:2504.16902](https://arxiv.org/html/2504.16902v2). Systematized Agent-Card spoofing / discovery attacks; widely cited as the reference A2A threat catalog.

---

## Where the gaps are — specific, named, source-grounded

- **No public benchmark for agent-auth robustness.** A 2026 taxonomy of agent safety benchmarks finds **robustness is the sole risk category with zero primary benchmarks** — nothing systematically tests behavioral consistency under semantically-equivalent perturbations ([arXiv:2605.16282](https://arxiv.org/pdf/2605.16282)). There is no "AgentDojo for delegation/scope-adherence." This is the single biggest, most profile-aligned gap.
- **Authorization-boundary awareness is barely measured.** *Partial Evidence Bench* ([arXiv:2605.05379](https://arxiv.org/pdf/2605.05379)) shows agents can't reliably recognize when their answer is incomplete because evidence lies outside the caller's authorization scope — a narrow first probe, wide open for extension to action (not just answer) scoping.
- **Signed-agent verification has no independent adversarial eval.** Web Bot Auth / TAP adoption claims are vendor blogs; I found **no third-party study measuring spoof/bypass rates** of `Signature-Agent` verification or key-directory poisoning. ⚠️ (absence-of-evidence, not confirmed non-existence.)
- **Competing, uncoordinated identity drafts.** At least **four** overlapping AIP/delegation Internet-Drafts (`draft-singla-...`, `draft-prakash-aip`, `draft-nelson-agent-delegation-receipts`, `draft-oauth-ai-agents-on-behalf-of-user`) with no comparative analysis of their security properties, threat coverage, or interop. A rigorous comparison paper does not appear to exist.
- **AP2 mandates: runtime ≠ spec.** Two small papers already breached AP2 via injection and replay; there's no standardized **mandate-integrity test suite** an implementer could run.
- **Attribution/liability is theorized but not operationalized.** Chan's framework names attribution as core; UETA binds the deploying party but doesn't allocate fault ([NatLawReview](https://natlawreview.com/article/contract-law-age-agentic-ai-whos-really-clicking-accept)). No dataset or eval exists for "given an incident trace + delegation receipts, can responsibility be correctly assigned?"
- **The gatekeeping externality is unmeasured.** The Cloudflare-vs-Perplexity dispute ([Contrary](https://research.contrary.com/report/debating-the-open-internet-cloudflare-vs-perplexity)) raises "does signed-agent infra centralize the web?" — a measurable question (allowlist coverage, small-operator exclusion rates) that no one has quantified.

---

## What a solo researcher could do here — 3-6 concrete study shapes (facts/examples, not a ranking)

1. **"AgentAuthBench": a delegation-scope-adherence benchmark.** Build a static+dynamic suite (in the AgentDojo/DoomArena mold) that grants an agent a scoped delegation ("read calendar, do NOT send email >$0") then applies adversarial pressure and measures **scope-violation rate**. Fits the published-benchmark profile directly; runs on frontier APIs + laptop. Extends the acknowledged zero-benchmark gap ([arXiv:2605.16282](https://arxiv.org/pdf/2605.16282)) and DoomArena's pluggable harness ([github](https://github.com/ServiceNow/DoomArena)).
2. **LLM-as-judge for delegation-receipt / mandate compliance.** Reuse the researcher's published LLM-as-judge RAG-hallucination methodology: given an agent trajectory + a signed mandate/delegation receipt, have a judge model rule "did the action stay within the authorized scope?" Study judge reliability, prompt sensitivity, and failure modes — a methodology contribution, cheap to run.
3. **Adversarial replication + extension of the AP2 red-teams.** The "Whispers of Wealth" ([arXiv:2601.22569](https://arxiv.org/pdf/2601.22569)) and zero-trust-runtime ([arXiv:2602.06345](https://arxiv.org/pdf/2602.06345)) papers are 3–4-person, API-scale efforts. Replicate on the open AP2 sample code, add new attack classes (mandate replay across sessions, cart-swap after signature), release an open test suite.
4. **Comparative security analysis of the competing identity Internet-Drafts.** Pure reading + threat-modeling: score `draft-singla-aip` / `draft-prakash-aip` / `draft-nelson-agent-delegation-receipts` / `draft-oauth-ai-agents-on-behalf-of-user` against a shared attack taxonomy (spoofing, replay, scope escalation, revocation latency). No compute; high standards-community visibility; a natural precursor to filing IETF review comments.
5. **Empirical measurement of deployed MCP/A2A auth posture.** Re-run and extend the internet-scan approach (unauthenticated MCP servers, unsigned Agent Cards) as a longitudinal dataset ([Security Boulevard scan](https://securityboulevard.com/2026/04/7-mcp-authentication-vulnerabilities-b2b-saas-vendors-must-prevent/); [67k-server MCP study](https://arxiv.org/abs/2503.23278)). Classical-ML/data-pipeline strength applies to classifying and trending exposure over time.
6. **A signed-agent spoof/bypass eval.** Stand up a Web-Bot-Auth verifier from Cloudflare's open reference ([github](https://github.com/cloudflare/web-bot-auth)) and measure how it fails under key-directory poisoning, header replay, and downgrade to weaker declared auth (the A2A card-downgrade attack, [arXiv:2504.16902](https://arxiv.org/html/2504.16902v2)) — the missing independent adversarial eval of a shipping standard.

---

## What we still don't know — explicit unknowns for the program's ledger

- **Which identity standard wins** (or whether the market fragments) — OAuth-extension vs. DID/VC vs. capability-token camps are all live; no interop or head-to-head security data exists yet. ⚠️
- **Whether cryptographic signing actually reduces harm end-to-end**, given that injection subverts the *agent* before the signature is applied (AP2 red-teams suggest the crypto layer and the LLM-behavior layer are only loosely coupled).
- **Real-world spoof/bypass rates** for Web Bot Auth / TAP in production — all current numbers are vendor claims, not independent measurement. ⚠️
- **How liability will actually be allocated** among user / developer / operator / platform when an authorized agent causes loss — legally unsettled.
- **Whether signed-agent infrastructure centralizes the web** (the Cloudflare gatekeeping critique) — an empirical question no one has quantified.
- **Whether personhood credentials are deployable at scale** without creating new exclusion/privacy harms.
- **What the right unit of "an agent's identity" even is** — per-model, per-deployment, per-session, per-invocation (IBCTs point at per-invocation) — remains contested across the drafts.

---

## Fit notes — domain ↔ profile (facts only)

The single largest, most-cited gap in this domain is the **absence of measurement/benchmarks** for agent-auth robustness ([arXiv:2605.16282](https://arxiv.org/pdf/2605.16282)) — which is exactly the researcher's published specialty (evaluation methodology; LLM-as-judge for RAG hallucination detection). Every study shape above runs on a laptop + frontier APIs + optional <$500 GPU: the exemplar attack papers here are **3–4-person, API-scale** efforts, not compute-bound lab work ([AP2 red-team](https://arxiv.org/pdf/2601.22569)). The standards processes (IETF WebBotAuth/OAuth WGs, OpenID AIIMCG) are **open to unaffiliated individuals at no cost**, keeping nonprofit, startup, and hired paths simultaneously open. The main adjacency-stretch is that the incumbent expertise here is distributed-systems/identity security rather than ML — the researcher's edge would be bringing evaluation rigor to a field currently long on protocol proposals and short on independent measurement.
