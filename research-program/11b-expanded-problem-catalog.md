# Expanded Problem Catalog — the wide-aperture pass

*Written 2026-07-09. This document deliberately **widens** [11 · problem-space](11-problem-space.md).
That round mined pain through eight discovery lenses and produced 33 vetted problems — but with
hindsight it was **too narrow**: almost every one of the 33 lived inside the founder's own
eval/reliability home turf (uncalibrated judges, ingestion integrity, agent trajectories, snapshot
drift). Useful and honest, but it answered "where can my existing edge apply?" before answering "what
is actually hurting people across the whole AI economy right now?" — which is the exact inversion the
charter's **breadth-and-creativity-before-convergence** rule exists to prevent
([00 · goals](00-goals-and-operating-principles.md), Principle 1).*

*So this pass re-ran the mining with a **much wider aperture**: 16 source-mined lenses — consumers,
healthcare, legal-finance, physical/industrial, education-creative, global-access, trust-and-info,
builders, GitHub-issues, forums, VC-RFS, jobs, product-reviews, incidents, regulatory clocks, and a
"wide critic" completeness pass — surfacing ~102 raw problems from CNBC, court dockets, NCMEC data,
FBI/IC3 losses, arXiv, GitHub issue trackers, regulatory texts, and 2025–26 survey research. This
document **merges** those with round-1's strongest items (nothing is lost), deduplicates, clusters
everything into themes that span **far beyond eval/reliability**, and produces a fresh shortlist and
validation list against the same founder profile.*

**What this document is NOT:** a re-scoring of everything for solo-founder foundability. Round-1
already did that honestly and its drops stay drops *for founding*. This pass is about **not missing
important problems** — including ones that are drops-for-founding but live (nonprofit, get-hired, or
advocacy) under the charter's other two exit paths. Importance is scored on its own axis here, then
crossed with neglectedness and *this* founder's tractability only in the shortlist.

A reminder on the founder ([00 · goals](00-goals-and-operating-principles.md)): solo, part-time,
≤$500/study, Claude-heavy, whose edge is **evaluation and reliability methodology** (published
LLM-as-judge / RAG-hallucination work). Tractability tags below are scored *for him specifically*.

---

## How the merge was done

1. **Dedup within round-2.** The 16 lenses overlapped heavily (as designed — repeated independent
   discovery is a strength signal). Six problem *families* were each surfaced 3–6 times by different
   lenses and are collapsed to one canonical entry with the strongest evidence, noting the convergence.
2. **Dedup against round-1.** Several round-2 items are wider-lens restatements of round-1 problems
   (AI-code review burden, ingestion/RAG-table parsing, model-deprecation, detector bias, verification
   cost). Those are merged, keeping round-1's vet and adding round-2's fresh evidence.
3. **Cluster into 11 themes** spanning the whole AI economy, not just the measurement stack.
4. **Tag each** with a one-line pain, who-has-it, an evidence link, and a rough
   **importance / neglectedness** read (H/M/L each) plus a founder-fit note.
5. **Shortlist ~18** strongest overall, and name the **~11 to carry into deep validation.**

Tags: **Imp** = importance (breadth × severity of harm), **Neg** = neglectedness (is anyone actually
closing it?), **Fit** = this founder's tractability (eval/reliability edge, ≤$500, solo). H/M/L.

---

## The convergence signal (dedup summary)

Before the clusters, the single most useful output of running 16 lenses independently: **which
problems got discovered over and over.** Independent rediscovery across unrelated lenses is the
strongest "this is real and load-bearing" signal the method produces.

| Problem family | Independently surfaced by lenses | Reading |
|---|---|---|
| **Voice-clone / impersonation fraud on the elderly** | consumers, trust-info, forums, surveys, incidents | 5× — the most-rediscovered problem in the entire set |
| **AI-detector false accusations + inverted burden of proof** | consumers, edu-creative, trust-info (+ round-1 #30/#31) | 4× — spans students, ESL writers, freelancers |
| **The verification / "almost-right code" review tax** | builders, surveys, jobs, github (+ round-1 #2/#15/#17/#20) | 4× — the round-1 core, re-confirmed from every builder angle |
| **AI notetaker all-party-consent / wiretap exposure** | incidents, vc-rfs, reviews | 3× — same consolidated Otter/Fireflies litigation |
| **Payer/insurer AI denial engineered around appeal-apathy** | healthcare, legal-fin, incidents | 3× — nH Predict / Cigna PXDX |
| **The "liar's dividend" — real evidence dismissed as AI** | legal-fin, trust-info, incidents | 3× — courtroom authentication crisis |
| **OSS maintainers buried under AI "slop" submissions** | edu-creative, github, forums, reviews (+ round-1 #17) | 4× — curl bounty shutdown, Jazzband closure |
| **Enterprise "last-mile" integration wall / FDE bottleneck** | vc-rfs, jobs | 2× — 95% of GenAI pilots no P&L impact |
| **Model deprecation as involuntary loss (users + builders)** | consumers, forums (+ round-1 #13/#26) | 3× — GPT-4o→5 grief + prod breakage |

That nine problems each recur across 2–5 unrelated lenses is itself the headline: the wide aperture
did not just add noise — it repeatedly re-derived the same live pains from different starting points.

---

## The clusters

Eleven themes. The first two are the founder's home turf (and heavily overlap round-1). Themes 3–11
are what the wider aperture actually added — most of them **outside** eval/reliability entirely.

### Cluster 1 — The measurement stack is uncalibrated *(founder home turf; from round-1)*

The metrology-for-AI program. Carried intact from round-1; not re-litigated here.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Unvalidated graders** (R1 #1) | Evals score against LLM-judges whose own accuracy was never measured · eval engineers, benchmark authors · [arize](https://arize.com/blog/long-horizon-agent-benchmarks-field-guide/) | H/M/**H** |
| **Contested ground truth** (R1 #7) | "Gold standard" is collapsed contested expert judgment · dataset builders, SMEs · [arXiv 2508.00143](https://arxiv.org/pdf/2508.00143) | H/M/M |
| **Reference-free trajectory quality** (R1 #6) | No accepted way to say an hours-long agent "did it right" · agent teams · [confident-ai](https://www.confident-ai.com/blog/llm-agent-evaluation-complete-guide) | H/L/M |
| **temp=0 ≠ deterministic** (R1 #8a) | Batch-invariance makes "deterministic" evals drift; A/B wins are noise · eval/CI teams · [vllm #40896](https://github.com/vllm-project/vllm/issues/40896) | M/L/**H** |
| **Pinned snapshot ≠ frozen behavior** (R1 #9) | A "stable" model ID drifts under an unchanged endpoint · prod LLM teams · [tianpan](https://tianpan.co/blog/2026-04-29-semver-lie-llm-minor-update-breaks-production) | M/L/**H** |
| **Silent ingestion corruption** (R1 #3) | PDF/table→text mangles meaning before the LLM; no integrity gate · enterprise RAG · [arXiv 2606.15020](https://arxiv.org/pdf/2606.15020) | H/M/**H** |

**Round-2 addition to this cluster — RAG is the least-supported area of AI dev, empirically.** A
Stack Overflow + GitHub study (arXiv 2510.25423) shows RAG-engineering questions are **88.4%
unanswered** with 87.4-hour median resolution — the worst metrics of any category — while
install/dependency questions resolve in ~12h. The hard problems (retrieval quality, vector-store
behavior) are also the *low-engagement* ones: a genuine knowledge/tooling vacuum, not solved-but-tedious.
[arXiv 2510.25423](https://arxiv.org/html/2510.25423v2) · **Imp H / Neg M / Fit H** — direct
extension of the founder's RAG-hallucination work.

### Cluster 2 — The human review gate is quietly failing *(founder-adjacent; from round-1, re-confirmed 4×)*

Round-2 hammered this from every builder/jobs/survey angle. The round-1 mechanism (habituation at the
gate) plus the round-2 volume data now form one coherent picture: **AI shifted the bottleneck from
writing to verifying, and verification capacity did not scale.**

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Automation-complacency at the review gate** (R1 #2) | Reviewers habituate; "a human approved it" becomes theater · any HITL org · [arXiv 2606.22721](https://arxiv.org/pdf/2606.22721) | H/**H**/H |
| **The "almost-right code" verification tax** (R2 builders/surveys/jobs; R1 #15/#20) | AI code looks right, isn't; review is slower than for human code, burden on reviewers · senior devs, maintainers · [Sonar](https://www.sonarsource.com/company/press-releases/sonar-data-reveals-critical-verification-gap-in-ai-coding); [METR 2507.09089](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) | H/M/M |
| **Review capacity didn't scale (the "AI Paradox")** (R2 builders) | Agent PRs merge fast but subtly wrong; delivery stalls even as coding speeds up · eng teams · [GitLab report](https://www.infoq.com/news/2026/06/ai-coding-outpaces-governance/) | H/M/M |
| **Experts can't verify at production speed** (R1 #16) | The named human-in-the-loop can't check outputs fast enough · medicine/law/finance · (round-1) | H/L/M |
| **The finance "verification tax"** (R2 legal-fin) | Time AI saves is eaten reconstructing/defending its output for auditors · finance teams · [diginomica/IDC](https://diginomica.com/ais-verification-tax-real-sage-and-idc-warn-finance-leaders-are-having-adapt-meet-fresh-challenge) | H/M/M |
| **Physicians rubber-stamp AI-drafted portal replies** (R2 healthcare) | Fluent AI drafts carry clinical errors; 35–45% submitted unedited, 75% rated "safe" · PCPs, patients · [npj Digital Medicine](https://www.nature.com/articles/s41746-025-01586-2) | H/M/M |

The finance verification-tax and the physician-portal study are the sharpest **new** evidence: they
quantify the review-gate decay in dollars ($78k/yr/leader) and in clinical error-passthrough (each
seeded error missed by 13–15 of 20 physicians) — turning round-1's mechanism claim into measured harm
in two regulated verticals.

### Cluster 3 — Consumer & bodily harms from generative AI *(NEW — wholly outside round-1)*

The wide aperture's biggest blind-spot fill. Round-1 had essentially nothing here; these are among
the most viscerally important problems in the entire merged set. Most are **drops for solo founding**
(no paying buyer, or the payer is the harm-causer) but strong **advocacy / nonprofit / measurement-artifact**
candidates under the charter's third path.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Nudify deepfakes of ordinary women/girls** (R2 consumers) | Non-celebrity victims deepfaked by app-store "nudify" tools; non-distribution = "no crime," no takedown path · ~90% female victims, teens · [CNBC](https://www.cnbc.com/2026/01/27/apple-google-host-dozens-of-ai-nudify-apps-like-grok-report-finds.html) | **H**/M/L |
| **AI-CSAM poisons the child-safety triage pipeline** (R2 trust-info) | Synthetic images clog reporting; investigators burn hours distinguishing fake from a real child in danger · NCMEC/ICAC/FBI · [NCMEC 2025 data](https://www.missingkids.org/blog/2026/the-work-never-stops-first-look-at-ncmecs-2025-data) | **H**/M/L |
| **Companion chatbots as unguarded teen therapy** (R2 healthcare) | No crisis-detection/escalation; failures fatal · vulnerable minors · [Fortune](https://fortune.com/2026/01/08/google-character-ai-settle-lawsuits-teenage-child-suicides-chatbots/) | **H**/M/L |
| **AI Overviews give dangerous medical advice** (R2 consumers) | Confidently-wrong health guidance atop most searches; undetectable to anxious laypeople · patients · [OECD.AI incident](https://oecd.ai/en/incidents/2026-01-02-62fb) | H/M/**M** |
| **Voice-clone fraud on the elderly** (R2 consumers/trust-info/forums/surveys/incidents — 5×) | 3s of audio clones a grandchild; no recipient-side verification layer · seniors + families · [FBI/Forbes](https://www.forbes.com/sites/larsdaniel/2026/04/19/senator-hassan-demands-answers-from-elevenlabs-after-fbi-reports-893-million-in-ai-voice-scams/) | **H**/M/M |
| **Griefbots + AI obituary spam exploit the bereaved** (R2 trust-info) | Deadbots reanimate the dead without consent; scraped obituaries posted for ad revenue · grieving families · [Cambridge](https://www.cam.ac.uk/research/news/call-for-safeguards-to-prevent-unwanted-hauntings-by-ai-chatbots-of-dead-loved-ones) | M/**H**/L |
| **Model-deprecation grief** (R2 consumers/forums; R1 #13) | Users bonded to a model version grieve its patch/retirement; no continuity · adult users (women 20–40 skew) · [MIT Tech Review](https://www.technologyreview.com/2025/08/15/1121900/gpt4o-grief-ai-companion/) | M/**H**/L |

The voice-clone fraud entry is the **most-rediscovered problem in the whole exercise** (5 lenses,
$893M–$2.3B in 2025–26 losses depending on source) — yet the recipient-side verification gap is
essentially unowned. Founder-fit is only M (it needs a caller-authenticity signal, not a benchmark),
but a **measurement artifact** — "how reliably can humans/detectors distinguish cloned voices at the
point of need" — is squarely in eval range and would be high-impact advocacy.

### Cluster 4 — AI-decision harms on the powerless *(NEW breadth; round-1 had #24 only)*

Opaque algorithmic decisions that deny benefits, care, jobs, or freedom — where the accused bears the
burden and cannot see or contest the black box. Round-1 flagged this abstractly (#24) and dropped it
for founding; round-2 fills it with concrete, docketed, high-magnitude instances.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Payer AI denial engineered around appeal-apathy** (R2 healthcare/legal-fin/incidents — 3×) | 67% don't appeal because they expect to lose, so bad denials are structurally invisible · patients, physicians · [AMA](https://www.ama-assn.org/press-center/ama-press-releases/physicians-concerned-ai-increases-prior-authorization-denials); [nH Predict suit](https://www.cbsnews.com/news/unitedhealth-lawsuit-ai-deny-claims-medicare-advantage-health-insurance-denials/) | **H**/M/L |
| **State benefit-fraud algorithms accuse the poorest** (R2 critic) | Opaque tools suspend benefits pre-hearing; Michigan MiDAS 93% wrong · UI/welfare claimants · [IEEE Spectrum](https://spectrum.ieee.org/michigans-midas-unemployment-system-algorithm-alchemy-that-created-lead-not-gold) | **H**/M/L |
| **Facial-recognition "leads" become probable cause** (R2 incidents) | Uncorroborated match → wrongful arrest, overwhelmingly Black · the arrested, public defenders · [WaPo "Arrested by AI"](https://www.washingtonpost.com/business/interactive/2025/police-artificial-intelligence-facial-recognition/) | **H**/M/L |
| **AI-scored aerial imagery drops home insurance** (R2 physical) | A shadow read as roof damage → non-renewal, no way to see/contest the image · homeowners in cat-exposed states · [CA DOI](https://www.insurance.ca.gov/0400-news/0100-press-releases/2025/release029-2025.cfm) | H/M/L |
| **Insurers auto-deny at machine speed w/o competent review** (R2 legal-fin) | Cigna PXDX: 1.2s avg physician review across 300k+ denials · patients · [Courthouse News](https://www.courthousenews.com/judge-advances-class-claims-over-cigna-use-of-automated-algorithm-to-deny-benefits/) | **H**/M/L |
| **Jobseeker AI-vs-AI double bind** (R2 consumers) | Rejected by algorithm w/ no feedback; also punished for using AI to apply · everyday applicants · [Enhancv](https://enhancv.com/blog/ai-hiring-statistics/) | H/M/L |
| **Surveillance pricing charges individuals different prices** (R2 critic) | Personalized prices by inferred price-sensitivity, no disclosure, no counterfactual visible · consumers · [FTC 6(b)](https://www.ftc.gov/system/files/ftc_gov/pdf/sp6b-issue-spotlight.pdf) | H/**H**/L |

**Cross-cutting shape:** every one of these inverts the burden of proof onto the person least able to
carry it, and the harm's *invisibility* (un-appealed denials, undisclosed pricing, discarded imagery)
is the sharp under-recognized angle. The founder can't sell to these buyers, but the "measure the
un-appealed error rate" framing is a real eval contribution and a strong nonprofit/advocacy artifact.

### Cluster 5 — The trust & provenance layer is broken *(NEW breadth; round-1 touched only #26/#30)*

Everything about "can I tell what's real / who made this / whether this evidence is authentic." Two
directions: fake content polluting trusted channels, and the inverse — real content dismissed as fake.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **The "liar's dividend" in court** (R2 legal-fin/trust-info/incidents — 3×) | Authentic audio/video dismissed as "a deepfake"; burden flips, detection unreliable · judges, litigants, abuse survivors · [Thomson Reuters](https://www.thomsonreuters.com/en-us/posts/ai-in-courts/deepfakes-evidence-authentication/) | **H**/**H**/M |
| **Fake exhibits reach courtrooms; FRE 901 unequipped** (R2 legal-fin/incidents) | Deepfaked evidence submitted; no admissibility standard · courts · [Mendones/CU Boulder](https://www.colorado.edu/today/2025/11/17/deepfakes-and-ai-courtroom-report-calls-legal-reforms-address-troubling-trend) | H/M/M |
| **C2PA provenance stripped on upload** (R2 trust-info) | Every major platform strips Content Credentials exactly when they'd matter · creators, fact-checkers · [World Privacy Forum](https://worldprivacyforum.org/posts/privacy-identity-and-trust-in-c2pa/) | H/M/M |
| **Scientific literature contaminated with fake citations** (R2 critic) | Fabricated refs pass peer review, become permanent/citable; 1/458→1/277 in a year · scientists, reviewers, model trainers · [Forbes](https://www.forbes.com/sites/michaeltnietzel/2026/05/12/ai-blamed-for-rise-in-fabricated-citations-found-in-recent-research-papers/) | **H**/M/**M** |
| **Marketplace impersonation damages the real creator** (R2 edu-creative) | Deepfake knockoff books shadow a real release within days; readers blame the author · authors, musicians · [Rolling Stone](https://www.rollingstone.com/culture/culture-features/amazon-ai-book-knockoffs-1235450690/) | M/M/L |
| **Commons janitor burden (Wikipedia/OSS cleanup)** (R2 edu-creative/forums) | Volunteers conscripted to sift AI drafts; ~5% of new Wikipedia articles AI-made · volunteer editors · [WikiProject AI Cleanup](https://en.wikipedia.org/wiki/Wikipedia:WikiProject_AI_Cleanup) | M/M/M |

The **fabricated-citation contamination** is the standout new find with founder-fit: it's a
measurement problem (prevalence auditing, reference-validation), it poisons the corpus that future
models train on, and the prevalence nearly doubled in a year. The liar's dividend scores **H/H** — high
importance *and* high neglectedness (C2PA solves the opposite direction) — but needs forensic
authentication, not eval, so founder-fit caps at M.

### Cluster 6 — Agent security & the identity/authorization gap *(NEW breadth; overlaps round-1 frontier)*

Agents got tool access, credentials, and payment authority in 2025–26 faster than the security,
identity, and auth stack could adapt. Round-1's frontier cluster touched agent *reliability*; this is
agent *security and authorization*, a different and largely unowned lane.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Prompt injection is intrinsic & undefended** (R2 builders/jobs) | Any ingested text can hijack a tool-using agent; #1 OWASP LLM risk, no robust fix · any agent deployer · [Vectra](https://www.vectra.ai/topics/prompt-injection); [Anthropic espionage](https://www.anthropic.com/news/disrupting-AI-espionage) | **H**/M/M |
| **Agent payments break the fraud/identity stack** (R2 vc-rfs) | KYC/MFA assume a human acts; no way to bind "this agent, for this user, within limits" to a payment · banks, merchants · [IMF/bankinfosecurity](https://www.bankinfosecurity.com/banks-face-dual-authentication-crisis-from-ai-agents-a-30711) | **H**/**H**/L |
| **MCP auth is broken in practice** (R2 github) | Clients don't implement spec auth flows; mcp-remote shipped a critical RCE · enterprises, MCP authors · [modelcontextprotocol #1963](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1963) | H/**H**/M |
| **Enterprise agents = uninsured, unpriced liability** (R2 regulatory) | Courts hold deployers liable (Air Canada) while insurers default to AI exclusions · agent deployers · [Clifford Chance](https://www.cliffordchance.com/insights/resources/blogs/talking-tech/en/articles/2026/02/agentic-ai-and-the-liability-gap-your-contracts-may-not-cover.html) | H/**H**/L |
| **Shadow AI: security teams blind to data flows** (R2 surveys) | 78% bring their own AI tools; 86% of orgs blind to AI data flows · CISOs · [CIO/IBM](https://www.cio.com/article/4124760/roughly-half-of-employees-are-using-unsanctioned-ai-tools-and-enterprise-leaders-are-major-culprits.html) | H/M/L |

Prompt injection is the deepest structural item — the vulnerability is intrinsic to how LLMs process
untrusted text, so it can't be "patched," only bounded. **"Know Your Agent"** (agent-payment identity)
and **MCP auth** both score **H/H** neglectedness because the standards don't exist yet — but both need
protocol/infra work outside a solo eval founder's reach. A *benchmark* for injection-resistance or
agent-authorization correctness is the founder-shaped sliver.

### Cluster 7 — The verification/attestation & insurability market *(from round-1 Cluster D; round-2 sharpened)*

The load-bearing trust infrastructure: insurability, procurement verification, professional-liability
coverage. Round-1 filed these as "right problem, wrong founder-shape." Round-2 added a **structural
insurance break** that makes the pain sharper and more datable.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Blanket AI exclusions strand regulated professionals** (R2 legal-fin) | E&O/CGL renewals insert "arising out of generative AI" exclusions; incidental use may trigger · law/CPA/advisory firms · [Lathrop GPM](https://www.lathropgpm.com/insights/the-ai-coverage-gap-what-new-insurance-exclusions-mean-for-your-business/) | H/**H**/L |
| **Insurers/buyers can't quantify AI reliability** (R1 #18) | No independent reproducible rating both sides accept · insurers, buyers · (round-1) | H/M/M |
| **Procurement can't verify vendor accuracy claims** (R1 #22) | No GAAP-equivalent attestation for AI performance · enterprise buyers · (round-1) | H/M/M |
| **Radiologist AI-disagreement malpractice trap** (R2 healthcare) | Disagreeing with a correct AI flag raises juror-assigned culpability ~16pts · radiologists, insurers · [NEJM AI](https://ai.nejm.org/doi/full/10.1056/AIoa2400785) | H/**H**/L |
| **Explainability compliance trap in credit AI** (R2 legal-fin) | 1000+-variable vendor models can't produce legally-sufficient adverse-action reasons · lenders · [CFPB](https://www.consumerfinance.gov/about-us/newsroom/cfpb-issues-guidance-on-credit-denials-by-lenders-using-artificial-intelligence/) | H/M/L |

The **radiologist juror-perception asymmetry** is a genuinely novel find (**H/H**): AI's mere presence
raises the standard-of-care bar and shifts legal risk onto physicians who don't control the tool —
and it's a *measurement* question (how should AI disagreement be weighed evidentially), which nudges
founder-fit above the rest of this cluster.

### Cluster 8 — Regulatory forcing functions with no means to comply *(NEW depth; round-1 had #4/#33)*

Hard-dated obligations where the regulator created demand but not the means to satisfy it — the
purest "forcing-function" lens material. All EU AI Act, all enforceable **Aug 2, 2026** (weeks away).

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Art. 50(2) watermarking mandate with no working technique** (R2 regulatory) | Must mark AI output "robust & interoperable"; no method meets all four criteria · GenAI providers · [arXiv 2603.26983](https://arxiv.org/html/2603.26983v1) | H/**H**/M |
| **Art. 27 FRIA with no official template** (R2 regulatory) | Fundamental-rights impact assessment due, but the mandated tool isn't published · banks, insurers, public bodies · [AI Act Service Desk](https://ai-act-service-desk.ec.europa.eu/en/ai-act/article-27) | H/**H**/M |
| **Art. 12 logging closed APIs can't emit** (R2 regulatory) | Deployers must log events the closed vendor model won't expose · high-risk deployers · [AI Gov Desk](https://aigovernancedesk.com/eu-ai-act-articles-12-13-decision-traceability/) | H/**H**/M |
| **Art. 53 training-content summary vs. litigation** (R2 regulatory) | Must publish training-data summary that's self-incriminating in copyright suits & hard to reconstruct · GPAI providers · [WilmerHale](https://www.wilmerhale.com/en/insights/blogs/wilmerhale-privacy-and-cybersecurity-law/european-commission-releases-mandatory-template-for-public-disclosure-of-ai-training-data) | H/**H**/M |
| **Bias-audit mandates no one can verify (LL144/NAIC)** (R2 regulatory) | Bias audits required but regulators lack expertise to detect non-compliance · NYC employers, insurers · [NY Comptroller](https://www.osc.ny.gov/state-agencies/audits/2025/12/02/enforcement-local-law-144-automated-employment-decision-tools) | H/**H**/M |

**Caveat carried from round-1:** the round-1 attribution problem (#4) had its forcing function *deferred
to Dec 2027* by the Digital Omnibus. These five are **high-risk Annex III / GPAI obligations on the
Aug-2-2026 track** — verify each is not also deferred before treating the clock as live (this is a named
kill-check in the validation list). If live, the whole cluster is unusually founder-friendly:
every item is a **measurement/attestation** artifact (how do you *prove* watermark robustness, a
defensible FRIA, a bias audit that actually detects disparate impact) — exactly the founder's craft,
with a legally-manufactured buyer.

### Cluster 9 — Creative & knowledge-labor economic collapse *(NEW — wholly outside round-1)*

Not "AI might take my job" but measured, present-tense **rate collapse and pipeline destruction**.
Importance is high; founder-fit is low (these need policy/union/market solutions, not eval) — but
several are excellent **research/measurement** subjects.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Rate collapse for translators/illustrators/voice/stock** (R2 edu-creative) | Surviving work reclassified as low-status "babysit-the-machine" post-editing at ~25% of legacy rates · creative pros · [The Bookseller](https://www.thebookseller.com/news/a-third-of-translators-report-losing-work-to-generative-ai-systems-soa-survey-reveals) | H/M/L |
| **Publisher referral-traffic / funding collapse** (R2 consumers/edu-creative) | AI Overviews answer in-page; local/original reporting defunded specifically · publishers, small sites · [SparkToro](https://sparktoro.com/blog/in-2026-less-than-one-third-of-google-searches-still-send-a-click/) | **H**/M/L |
| **AI eliminates the entry-level career rung** (R2 critic) | 22–25yos in exposed roles −13%; need experience to get experience · recent grads · [Stanford/CNBC](https://www.cnbc.com/2025/08/28/generative-ai-reshapes-us-job-market-stanford-study-shows-entry-level-young-workers.html) | **H**/M/L |
| **Higher-ed credential validity crisis** (R2 edu-creative) | Take-home work indistinguishable from AI; can't certify learning happened · faculty, employers · [ADN/AP](https://www.adn.com/nation-world/2026/04/22/perfect-homework-blank-stares-why-colleges-are-turning-to-oral-exams-to-combat-ai/) | H/M/M |
| **Data-annotation labor: trauma + wage theft** (R2 global-access/reviews) | The workers who make AI safe suffer uncompensated psychological injury & pre-payday bans · Global South annotators · [Equidem/SOMO](https://www.somo.nl/big-tech-sets-unfair-terms-and-conditions-for-ai-data-workers-globally/) | **H**/M/L |

The **entry-level-rung collapse** is the highest-importance new labor find — a self-reinforcing
pipeline trap with first-order payroll evidence (Stanford, 25M workers). The **credential-validity
crisis** has the best founder-fit here: "can we certify a skill was actually acquired" is an
assessment/measurement problem adjacent to eval.

### Cluster 10 — Global-access & inverse-equity gaps *(NEW — wholly outside round-1)*

The populations with the weakest alternative infrastructure get the least-reliable AI, and the
measurement gap hides the failure. Deeply important, low founder-buyer, but the **measurement gap
itself** is an eval contribution.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **LLM safety/quality degrades silently in non-English** (R2 global-access) | Same query gets safe English answer, dangerous native-language answer; users can't cross-check · asylum seekers, refugees · [Respond Crisis Translation](https://respondcrisistranslation.org/en/blog/2025-0915-lost-in-ai-mistranslation-llms-put-to-the-test) | **H**/**H**/**M** |
| **Low-resource languages: least reliable, no benchmarks** (R2 forums/global-access) | The measurement gap hides how bad it is for hundreds of millions · low-resource-language speakers · [arXiv 2502.19582](https://arxiv.org/html/2502.19582v1) | **H**/**H**/**M** |
| **The tokenization tax** (R2 builders) | Non-English costs 2–15× more tokens; pricier, slower, context-starved · non-English-market builders/users · [HF](https://huggingface.co/blog/omarkamali/tokenization) | H/M/**M** |
| **Biometric welfare auth excludes the poorest** (R2 global-access) | Worn fingerprints / aged irises fail; ~20M failed auths/month in India, documented deaths · elderly/manual-labor beneficiaries · [Biometric Update](https://www.biometricupdate.com/202507/high-rates-of-aadhaar-biometric-verification-failure-leads-to-uidai-scrutiny) | **H**/M/L |
| **AI alt-text passes audits but is "functionally blind"** (R2 global-access) | Fluent descriptions miss context; audits verify existence not usefulness; no error path · screen-reader users · [Silktide](https://silktide.com/blog/the-downsides-of-ai-alt-text/) | H/**H**/**M** |
| **Proof-of-humanity locks out uncertified devices** (R2 global-access) | QR reCAPTCHA requires a Google/Apple-approved phone → banking/services denied · de-Googled & low-income users · [Cybernews](https://cybernews.com/privacy/google-qr-code-recaptcha-requires-approved-phone/) | H/**H**/L |
| **Moderation & dermatology AI fail out-of-distribution** (R2 global-access) | Amharic hate speech unmoderated; derm AI worse on dark skin — no per-language/skin-tone reporting · Global South users · [Rest of World](https://restofworld.org/2023/ai-content-moderation-hate-speech/) | **H**/**H**/**M** |

This cluster is the wide aperture's richest **founder-fit-within-high-importance** vein: four of the
seven (non-English safety parity, low-resource benchmarks, alt-text usefulness measurement, OOD
moderation/derm reporting) are fundamentally **"measure the reliability cliff nobody is reporting"**
problems — exactly eval methodology, and exactly the kind of neglected, high-importance,
nonprofit/publishable work the charter's impact-first rule elevates. Several score **H/H/M** — the best
importance×neglectedness combos in the merged set that the founder could actually execute.

### Cluster 11 — Physical/industrial deployment & infrastructure *(NEW — wholly outside round-1)*

Where AI meets the physical world and the buildout that powers it. Mostly low founder-fit (needs
domain access or capital), but important and largely unowned.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **Data-center costs socialized onto ratepayers** (R2 critic) | Households absorb grid buildout cost for hyperscaler compute; no opt-out · residential ratepayers · [EESI](https://www.eesi.org/articles/view/data-center-power-demands-are-contributing-to-higher-energy-bills) | **H**/M/L |
| **AI-datacenter memory boom prices out local-AI builders** (R2 forums) | HBM demand diverts wafers; DRAM +300%, forecloses grassroots local-model participation · PC builders, small labs · [Tom's Hardware](https://www.tomshardware.com/pc-components/ram/ram-price-index-2026-lowest-price-on-ddr5-and-ddr4-memory-of-all-capacities) | H/M/L |
| **Warehouse robots increase worker injuries** (R2 physical) | Pacing algorithms set to robot throughput, no human-ergonomic model; injuries ~54% higher · floor workers · [UNC JOLT](https://journals.law.unc.edu/ncjolt/blogs/do-more-robots-really-lead-to-fewer-workplace-accidents-a-rise-in-injuries-at-amazons-automated-distribution-centers-may-complicate-a-common-assumption/) | H/M/L |
| **Enterprise "last-mile" integration wall** (R2 vc-rfs/jobs — 2×) | 95% of GenAI pilots no P&L impact; dies at legacy/integration, not model quality · enterprises, labs · [MIT NANDA/Fortune](https://fortune.com/2025/08/18/mit-report-95-percent-generative-ai-pilots-at-companies-failing-cfo/) | **H**/M/M |
| **Data-center/grid workforce bottleneck** (R2 jobs) | ~340k unfilled roles; commissioning & interconnection skills un-substitutable · hyperscalers, utilities · [Introl](https://introl.com/blog/data-center-workforce-shortage-340000-unfilled-positions-2026) | H/M/L |
| **Driverless-freight liability void** (R2 physical) | Safety drivers gone in 2025; no settled OEM/software/operator liability, insurance case-by-case · small fleets, victims · [FreightWaves](https://www.freightwaves.com/news/autonomous-trucking-faces-growing-product-liability-risks) | H/M/L |
| **Factory AI pilots die at the data layer** (R2 physical) | Siloed legacy PLC/SCADA data never structured for AI; proof-of-concept purgatory · manufacturers · [Manufacturing Dive](https://www.manufacturingdive.com/news/opinion-ai-pilot-problem-manufacturing-latent-kandasamy/757440/) | H/M/L |
| **Ag AI gives wrong advice, no liability chain** (R2 physical) | Wrong dose/timing/disease-ID loses a crop; agronomist disintermediated, vendor disclaims · farmers · [Mondaq](https://www.mondaq.com/unitedstates/new-technology/1803520/cultivating-accountability-in-agricultural-ai) | H/M/L |
| **Scientific instrument data locked in proprietary formats** (R2 vc-rfs) | Can't extract clean data to train AI-for-science; "Ticketmaster of biotech software" · labs, manufacturers · [TetraScience](https://www.tetrascience.com/blog/proprietary-data-formats-are-killing-your-ai-initiative) | H/M/L |
| **AI crawlers break the open-web economic model** (R2 surveys; R1 #32) | Uncompensated bot traffic defeats robots.txt; volunteers block whole countries · OSS sysadmins, small sites · [Slashdot](https://tech.slashdot.org/story/25/03/26/016244/open-source-devs-say-ai-crawlers-dominate-traffic-forcing-blocks-on-entire-countries) | H/M/L |
| **Semiconductor supply chain runs blind past tier-1** (R2 vc-rfs) | Spreadsheets/email, zero multi-tier visibility; $300 chip halts $50k car · chip buyers, fabs · [YC RFS](https://www.ycombinator.com/rfs) | H/M/L |

The **last-mile integration wall** is the highest-importance item here with non-trivial founder-fit:
the failure is diagnosed as a *learning/adaptation* gap ("tools don't learn from workflows"), which
has an evaluation angle (how do you measure whether a deployed agent actually adapted to the local
workflow). The **GGUF/local-inference support lag** and **silent framework failures** from the github
lens also belong to the builder side of this cluster and overlap Cluster 1's measurement concerns.

### Cluster 12 — Consumer product-experience failures *(NEW — smaller, from reviews/consumers lenses)*

Everyday AI products that make things worse, with the SMB or consumer eating the cost.

| Problem | One-line pain · who · evidence | Imp/Neg/Fit |
|---|---|---|
| **AI customer service worse at the escalation seam** (R2 reviews) | Bot loops you, then hands to a human with zero context → 2–3× longer · consumers, businesses · [CNBC](https://www.cnbc.com/2026/04/01/ai-chatbot-customer-service-complaints-refunds.html) | M/M/M |
| **SMB AI receptionists hallucinate operational facts** (R2 reviews) | Invented availability/prices/hours; owner can't detect until customers complain · small businesses · [lseo](https://lseo.com/answer-engine-optimization-services/managing-hallucination-risk-in-agent-initiated-bookings/) | M/M/M |
| **SMB AI-capability divide is a knowledge gap** (R2 surveys) | 82% of micro-firms think AI "doesn't apply"; can't tell what to adopt · small businesses · [ITJones](https://www.itjones.com/blogs/2025-ai-adoption-report-what-40-percent-cost-barriers-mean-for-smes) | H/M/L |
| **Enterprise autonomy ceiling** (R2 surveys) | 92.5% of prod agents route to a human; can't trust unsupervised action · enterprise eng · [Berkeley MAP/dbreunig](https://www.dbreunig.com/2025/12/06/the-state-of-agents.html) | H/M/**M** |
| **Agentic cost runaway** (R2 builders; R1 #25) | Tasks fan out to 10–30 calls; four/five-figure overspends found after the fact · agent teams · [LeanOps](https://leanopstech.com/blog/agentic-ai-cost-runaway-token-budget-2026/) | H/M/M |

The **enterprise autonomy ceiling** connects directly to the founder's edge: 92.5% of production
agents can't be trusted to close the loop because *there's no way to bound or verify long-horizon
behavior* — which is the reference-free-trajectory-quality problem (Cluster 1) restated as the ROI
blocker the whole enterprise-agent economy is stuck on.

---

## Expanded shortlist — the ~18 strongest, merged

Ranked by a blend of **importance × neglectedness × founder-tractability** (round-1's criterion),
but with importance and neglectedness now scored across the *whole* AI economy, and with the
charter's three exit paths (found / hire / nonprofit) all in view — so a low-founder-fit problem can
still make the list if its importance+neglectedness is high enough to matter as a nonprofit/advocacy
or publish-and-get-hired target. `Imp/Neg/Fit` = importance / neglectedness / this-founder-fit (H/M/L).
"Path" = the exit path it best serves.

| # | Problem (short) | Cluster · lens/source | Who has it | Why now | Who's solving | Imp/Neg/Fit | Path |
|---|---|---|---|---|---|---|---|
| 1 | **Unvalidated graders** | 1 · R1 founder-crossdomain | eval engineers, leaderboard authors | LLM-judge became default prod infra 2024–25 | academic meta-eval + vendors absorbing it | H/M/**H** | hire/found |
| 2 | **Automation-complacency at the review gate** | 2 · R1 second-order | any HITL org | AI is now majority of reviewers' queue; EU Art.14 | ~nobody at mechanism level | H/**H**/**H** | found/hire |
| 3 | **Silent ingestion corruption / RAG least-supported** | 1 · R1 assumed-solved + R2 github | enterprise RAG builders | RAG is the dominant 2025–26 use case; empirically hardest area | parsers compete on extraction, not integrity | H/M/**H** | found/hire |
| 4 | **Non-English safety/quality parity gap** | 10 · R2 global-access | asylum seekers, refugees, LRL speakers | free LLMs quietly substituted for interpreters | one small nonprofit measuring it | **H**/**H**/**M** | nonprofit/hire |
| 5 | **Low-resource-language reliability + missing benchmarks** | 10 · R2 forums | hundreds of millions of LRL speakers | 2025–26 first benchmarks make the gap legible | small academic/community cohort | **H**/**H**/**M** | nonprofit/hire |
| 6 | **Fabricated citations contaminating the literature** | 5 · R2 critic | scientists, reviewers, model trainers | prevalence ~doubled 2025→2026 | publishers detect reactively; detection lags | **H**/M/**M** | nonprofit/hire |
| 7 | **The liar's dividend in court** | 5 · R2 legal-fin/trust-info/incidents (3×) | judges, litigants, abuse survivors | first courtroom cases 2025; FRE 707 comment open | C2PA solves the opposite direction | **H**/**H**/M | hire/nonprofit |
| 8 | **Voice-clone fraud on the elderly** | 3 · R2 (5×, most-rediscovered) | seniors + families | cloning crossed indistinguishable threshold; losses exploding | warnings only; recipient-verification unowned | **H**/M/M | nonprofit/advocacy |
| 9 | **EU AI Act obligations with no means to comply** | 8 · R2 regulatory | GenAI providers, high-risk deployers | Aug 2 2026 enforceable (verify not deferred) | NGOs/consultancies guess; no blessed method | H/**H**/**M** | found/hire |
| 10 | **Payer/state AI denial engineered around appeal-apathy** | 4 · R2 (3×) + critic | patients, welfare claimants | active litigation/discovery 2025–26 | litigation per-defendant; structural gap open | **H**/M/L | nonprofit/advocacy |
| 11 | **Prompt injection intrinsic & undefended** | 6 · R2 builders/jobs | any agent deployer | agents got real tool access at scale 2025–26 | vendors chase it; no robust fix (intrinsic) | **H**/M/M | hire/found |
| 12 | **"Almost-right code" verification tax + review non-scaling** | 2 · R2 (4×) + R1 #15/#20 | senior devs, OSS maintainers | AI code crossed ~84% of devs; trust *declining* | static-analysis vendors touch fragments | H/M/M | hire/found |
| 13 | **OSS maintainers buried under AI slop** | 5/11 · R2 (4×) + R1 #17 | volunteer maintainers, security triagers | curl bounty shutdown Jan 2026; Jazzband closed | ad-hoc bans; SlopGuard experimental | H/M/M | nonprofit/found |
| 14 | **AI alt-text passes audits but is functionally blind** | 10 · R2 global-access | screen-reader users | AI alt-text bundled into CMSs as compliance shortcut | advocacy orgs warn; no tool ships the fix | H/**H**/**M** | nonprofit/hire |
| 15 | **Radiologist AI-disagreement malpractice trap** | 7 · R2 healthcare | radiologists, insurers | AI triage now common; open medicolegal question | academics quantify; no evidentiary framework | H/**H**/L | hire/nonprofit |
| 16 | **Enterprise autonomy ceiling / reference-free trajectory** | 1/12 · R1 #6 + R2 surveys | enterprise agent teams | $37B spend trapped in assistive mode 2025 | crowded observability corner | H/M/M | hire/found |
| 17 | **Model deprecation as involuntary loss** | 3 · R2 consumers/forums + R1 #13 | attached users + prod teams | deprecation cadence sharpened 2025–26 | Anthropic weight-preservation; multi-provider routers | M/**H**/M | hire/advocacy |
| 18 | **Enterprise last-mile integration wall** | 11 · R2 vc-rfs/jobs (2×) | enterprises, labs | boards demanding ROI; FDE hiring +729% | humans (FDEs) thrown at it; not productized | **H**/M/M | hire/found |

**Preliminary read on the blend.** The founder's eval edge concentrates in **#1, #3, #16** (home turf,
crowded) and — the genuinely new insight — in **#4, #5, #6, #14** (Cluster 10 global-access +
fabricated citations), where a *measurement* contribution is high-importance, high-neglectedness, and
executable solo, but the exit path is **nonprofit / publish-and-get-hired** rather than founding
(the affected populations don't pay). **#9 (EU forcing functions)** is the best *founding-shaped*
new addition if the Aug-2026 clock survives the kill-check: legally-manufactured buyers plus a
pure attestation/measurement deliverable. **#2** remains the single best real×neglected×tractable
carry-forward, now corroborated 4× from the builder side.

---

## What round 1 missed

The wider aperture's payoff, concentrated. These are the best **new** problems — real, evidenced,
important — that an eval/reliability-shaped aperture structurally could not surface.

1. **An entire class of bodily/consumer harm was invisible (Cluster 3).** Nudify deepfakes of
   ordinary women and girls, AI-CSAM poisoning the child-safety triage pipeline, companion chatbots
   as unguarded teen therapy with fatal outcomes, voice-clone fraud draining the elderly. These are
   among the most viscerally important problems in the merged set and round-1 had **zero** rows for
   them — because a "where can my eval edge apply?" lens never points at them. They are drops for
   *founding* but live under the charter's nonprofit/advocacy path, and several (voice-clone
   distinguishability, nudify-detection accuracy) have a legitimate measurement core.

2. **The inverse-equity / global-access cluster is the best high-importance × high-neglectedness ×
   founder-executable vein in the whole exercise (Cluster 10).** Non-English safety-parity collapse
   (a dangerous native-language answer where English refuses), low-resource-language reliability with
   *no benchmarks to even measure it*, alt-text that passes audits while being useless, moderation/derm
   AI failing out-of-distribution with no per-language/skin-tone reporting. Every one is fundamentally
   **"measure the reliability cliff nobody reports"** — squarely eval methodology, squarely neglected,
   squarely impact-first. Round-1's eight deep-dives contained nothing like it. This is arguably the
   single most valuable correction the wide pass produced.

3. **The "liar's dividend" — real evidence dismissed as AI — scores H/H and round-1 only had the
   forward direction.** Round-1 had detector-bias (#30) and provenance-contract-missing (#26), i.e.
   *proving AI origin*. The corrosive inverse — authentic audio/video waved away as a deepfake,
   burden flipped, detection unreliable — was surfaced by three independent lenses and may be the more
   damaging failure. It threatens the evidentiary foundation of courts, journalism, and abuse cases.

4. **EU AI Act "no means to comply" is a five-item cluster, not one problem (Cluster 8).** Round-1
   had the attribution problem (#4) and the fine-tuner-classification trigger (#33) — and the acute
   one (#4) got *deferred to 2027*. Round-2 surfaced five *live* Aug-2026 obligations (watermarking,
   FRIA, logging, training-summary, bias-audit-verifiability) where the regulator manufactured demand
   but not the means — and each is a measurement/attestation deliverable the founder could actually
   build. This is the strongest *founding-shaped* material the wide pass added.

5. **Fabricated citations poison the corpus future models train on (Cluster 5).** Distinct from the
   well-covered OSS-slop story: this contaminates the *formal, permanent, peer-reviewed* record, the
   prevalence nearly doubled in a year, and it's a measurement problem (prevalence auditing,
   reference validation) with a clean nonprofit/publishable shape.

6. **A specific novel liability find: the radiologist juror-perception asymmetry (Cluster 7).** AI's
   mere *presence* raises the standard-of-care bar and shifts malpractice risk onto physicians who
   don't control the tool — scored H/H, and it's an evidentiary-weighting (measurement) question, not
   a generic "AI bias" claim. Round-1's Cluster D had the insurability/attestation problems abstractly
   but nothing this sharp or this datable (randomized NEJM AI study, n=1,334).

7. **The physical/industrial and infrastructure economy (Cluster 11) was entirely absent.** Data-center
   costs socialized onto ratepayers, the memory boom foreclosing grassroots local-AI, warehouse robots
   *increasing* injuries, the semiconductor supply chain running blind past tier-1, driverless-freight
   liability voids. Low founder-fit, but high importance and largely unowned — and the "last-mile
   integration wall" (95% of pilots, no P&L) has a real evaluation angle.

8. **The convergence signal is a finding in itself.** Nine problem families were each independently
   rediscovered by 2–5 unrelated lenses (voice-clone fraud 5×, detector accusations 4×, verification
   tax 4×, OSS slop 4×). Round-1's single-aperture pass would have counted each once; the wide pass
   shows which pains are load-bearing enough to be derivable from many directions.

The meta-lesson: round-1's honest conclusion — *"importance is highest exactly where the founder's
leverage is lowest"* — survives and **strengthens** under the wider aperture. The most important new
problems (Clusters 3, 4, 9-creative, 10, 11) are overwhelmingly drops-for-founding. But the wide pass
found a real exception the narrow one couldn't: **Cluster 10 (global-access) and fabricated-citation
auditing are high-importance, high-neglectedness, AND founder-executable** — just on the
nonprofit/publish path rather than the founding path. That is precisely the kind of option the
charter's impact-first rule exists to protect from premature pruning.

---

## Ready for deep validation

The top ~11 to carry into a thorough validation pass — **multiple evidence angles + multiple kill
attempts each**. Chosen to span all three exit paths and both the founder's home turf and the
best new wide-aperture finds. For each: the core claim to stress-test and the sharpest kill-shot to
attempt first.

1. **Automation-complacency at the review gate** (#2). *Validate:* is the within-reviewer vigilance
   decay robust beyond the one arXiv study; is EU Art.14 a real datable buyer trigger? *Kill first:*
   can a governance incumbent bolt a "vigilance-decay metric" onto an existing dashboard, collapsing
   the moat? (Carried from round-1 as top pick; re-confirmed 4× by round-2 builder data.)

2. **Silent ingestion corruption + RAG-as-least-supported-area** (#3). *Validate:* does the
   RAG-eval-stops-at-retrieval gap still hold; is the arXiv 2510.25423 "88% unanswered" finding
   corroborated? *Kill first:* have extraction vendors' field-level confidence + bbox citations
   already closed the integrity gate? (Carried from round-1; strengthened by round-2 empirics.)

3. **Non-English safety/quality parity gap** (#4). *Validate:* is the "safe in English, dangerous in
   Pashto" divergence reproducible on current models with a ≤$500 eval; do major labs really not
   report per-language safety parity? *Kill first:* has any lab quietly shipped multilingual safety
   parity since the Respond Crisis study? (New; best high-Imp/high-Neg/founder-executable find.)

4. **Low-resource-language reliability + benchmark vacuum** (#5). *Validate:* is the "no benchmarks
   exist to measure it" claim still true for the target languages; can a solo build a credible LRL
   reliability benchmark under budget? *Kill first:* has the African Languages Lab / Lugha-Llama
   cohort already filled the specific gap? (New; pairs with #4.)

5. **Fabricated-citation contamination** (#6). *Validate:* is the 1/458→1/277 prevalence trend
   corroborated across sources; is pre-publication reference-validation genuinely unsolved at scale?
   *Kill first:* have publisher paper-mill detectors (Springer) already closed the pre-pub gap?
   (New; clean nonprofit/publishable shape with founder-fit.)

6. **EU AI Act "no means to comply" cluster** (#9). *Validate — this is itself the first kill-check:*
   confirm each of the five obligations (Art. 50(2), 27, 12, 53, LL144/NAIC) is on the **live Aug-2-2026**
   track and NOT deferred by the Digital Omnibus (which pushed round-1's #4 to Dec 2027). *Then:* is
   the deliverable a measurement/attestation artifact a solo can build, and is the buyer real?
   *Kill first:* deferral + "affidavit-and-process discharges the duty, no technical tool needed."

7. **The liar's dividend in court** (#7). *Validate:* how many real cases beyond Mendones; is
   after-the-fact authentication of real evidence genuinely unsolved (vs. C2PA's forward direction)?
   *Kill first:* does a solo eval founder have any tractable wedge here, or is this pure
   forensic-authentication + rules-committee territory (i.e., a watch/hire target, not a build)?

8. **Prompt injection intrinsic & undefended** (#11). *Validate:* is the "no robust fix, it's
   intrinsic" claim current; is an injection-resistance *benchmark* an unowned slot? *Kill first:*
   the frontier is crowded with well-funded AI-security vendors — is the benchmark sliver defensible,
   or absorbed the quarter it's shown?

9. **"Almost-right code" verification tax** (#12). *Validate:* is the METR 19%-slower / 39-point
   perception-gap finding replicated; is the "flag which lines were AI-generated, verify harder"
   artifact genuinely missing? *Kill first:* is this just round-1 #2/#15 re-labeled (dedup risk),
   and do IDE/static-analysis incumbents own the fix?

10. **AI alt-text usefulness gap** (#14). *Validate:* do automated accessibility audits really verify
    existence-not-usefulness; is there no shipped human-in-the-loop + feedback-path tool? *Kill
    first:* is the buyer (accessibility-overlay vendors) structurally incentivized *against* the fix,
    making this advocacy-only? (New; high-Neg, clean measurement core, nonprofit path.)

11. **Voice-clone fraud on the elderly** (#8). *Validate — as a measurement artifact, not a product:*
    can humans/detectors distinguish cloned voices at the point of need, and is that distinguishability
    rate the unowned gap? *Kill first:* is there any solo-buildable, solo-fundable wedge at all, or is
    this purely telecom/standards + advocacy (drop-for-founding, keep-for-advocacy)? (Most-rediscovered
    problem in the exercise — validate its shape even if the verdict is "advocacy-only.")

**Deliberately held back from the validation cut** (important but structurally drop-for-this-founder,
kept visible as nonprofit/advocacy or watch targets): payer/state AI-denial recourse (#10 — advocacy),
radiologist malpractice asymmetry (#15 — hire/watch), OSS-slop triage (#13 — nonprofit/watch),
model-deprecation continuity (#17 — hire/advocacy), enterprise last-mile wall (#18 — hire), the entire
Cluster 11 infrastructure set (capital/domain-access gated), and the Cluster 3 bodily-harm set beyond
the voice-clone measurement angle (advocacy/nonprofit). These are respected as drops-for-founding per
round-1's discipline, not forgotten.

---

*This document widens [11 · problem-space](11-problem-space.md) without discarding it: round-1's 33
vetted problems and their honest drops stand; this pass adds ~55 net-new deduplicated problems across
11 clusters that span the whole AI economy, and re-derives the shortlist and validation list with
importance scored on its own axis and all three exit paths in view. The next artifact runs the deep
validation pass (multiple evidence angles + multiple kill attempts) against the 11 above.*

---

### Summary

- **Totals:** merged round-1's 33 + round-2's ~102 raw items → after dedup (6 within-round-2 families
  collapsed, ~9 merged against round-1), **~90 distinct problems across 12 clusters** spanning far
  beyond eval/reliability (consumer/bodily harm, AI-decisions-on-the-powerless, trust/provenance,
  agent security & identity, EU forcing-functions, creative-labor collapse, global-access inverse-equity,
  physical/industrial infra, product-experience).
- **Convergence signal:** 9 problem families were each independently rediscovered by 2–5 lenses;
  voice-clone elder fraud (5×) is the single most-rediscovered problem.
- **Best NEW problems the wider aperture found:** (a) the **global-access / inverse-equity** cluster —
  non-English safety-parity collapse and low-resource-language reliability with *no benchmarks to
  measure it* — the rare high-importance × high-neglectedness × founder-executable vein; (b) the
  **liar's dividend** (real evidence dismissed as AI, H/H); (c) the **five-item EU-AI-Act "no means to
  comply"** cluster (best founding-shaped material, pending an Aug-2026-vs-deferred kill-check);
  (d) **fabricated citations** poisoning the training corpus; (e) the **radiologist AI-disagreement
  malpractice asymmetry** (novel, H/H); (f) an entire **consumer/bodily-harm** class (nudify deepfakes,
  AI-CSAM triage poisoning, teen-companion fatalities) round-1 was blind to.
- **Meta-lesson:** round-1's "importance highest where founder leverage is lowest" holds and
  strengthens — but the wide pass found the real exception: **Cluster 10 (global-access) + fabricated-citation
  auditing are high-Imp, high-Neg, AND founder-executable on the nonprofit/publish path.**
- **Top-10-for-validation (11 items):** 1) automation-complacency at the review gate, 2) silent
  ingestion corruption / RAG-least-supported, 3) non-English safety-parity gap, 4) low-resource-language
  reliability + benchmark vacuum, 5) fabricated-citation contamination, 6) EU AI Act "no means to
  comply" cluster (clock kill-check first), 7) the liar's dividend in court, 8) prompt injection
  intrinsic & undefended, 9) "almost-right code" verification tax, 10) AI alt-text usefulness gap,
  11) voice-clone elder fraud (validate as a measurement artifact).
