# Candidate Research Fields — the Divergent Sweep

*Synthesized July 2026 from eight research sweeps ([briefs/](briefs/)). Serves
[00-goals-and-operating-principles.md](00-goals-and-operating-principles.md): this is the
**breadth** step of "map the field → read prior work → run cheap pilots → then choose."*

## How to read this document

Per the charter's operating principles:

- **Crowded ≠ closed.** "Someone is already exploring X" does not disqualify X — it obligates
  us to read what's published and name the specific gap. Every field below has named,
  sourced gaps that survived that check in its brief.
- **The point is understanding, not ranking.** No field here is scored, ordered by
  attractiveness, or filtered for marketability. Fit notes state facts about skill/budget/on-ramp
  overlap only. Marketability gets one late-stage constraint pass, after a shortlist exists —
  not here.
- **Uncertainty is preserved.** Anything a brief flagged ⚠️ unverified stays flagged. Honest
  unknowns per field feed [03-knowledge-gaps-and-assumptions-ledger.md](03-knowledge-gaps-and-assumptions-ledger.md).
- **Wildcards are first-class.** Field 8 is the dedicated unconventional track; all eight of its
  niches are preserved in full.

Common thread across all eight fields: the solo-viable work is **measurement science** —
designing instruments, running them against models/data/systems, defending the numbers —
rather than training compute. That is an observation, not a selection criterion; it fell out of
the sweeps independently.

---

## 1. Model behavior science

*Brief: [sweep-01-model-behavior-science.md](briefs/sweep-01-model-behavior-science.md)*

**What it is.** The empirical study of LLM behavior from the outside — a field with an
intellectual charter ([Machine Behaviour, Nature 2019](https://www.media.mit.edu/publications/review-article-published-24-april-2019-machine-behaviour/))
but no consolidated name. Seven sub-areas: behavioral fingerprinting
([Idiosyncrasies in LLMs](https://arxiv.org/abs/2502.12150)), behavioral drift
([Chen/Zaharia/Zou 2023](https://arxiv.org/abs/2307.09009)), model psychometrics
([Machine Psychology](https://arxiv.org/pdf/2303.13988) plus a live validity
counter-literature), sycophancy/refusal/values measurement
([ELEPHANT](https://arxiv.org/abs/2505.13995), [XSTest](https://arxiv.org/html/2510.08158v1),
[Values in the Wild](https://www.anthropic.com/research/values-wild)), personas and self-models
([persona vectors](https://x.com/Jack_W_Lindsey/status/1951319747314012412),
["the void"](https://www.lesswrong.com/posts/3EzbtNLdcnZe8og8b/the-void-1)), behavioral
model-diffing ([Anthropic's diff tool](https://www.anthropic.com/research/diff-tool),
[BehaviorBox](https://aclanthology.org/2025.acl-long.923/)), and in-the-wild observatories
([SpeechMap.ai](https://speechmap.ai/), Clio).

**Who does it.** Anthropic (Societal Impacts; the "AI psychiatry" team under Jack Lindsey;
the Fellows Program as an external door), OpenAI's Model Behavior team (⚠️ status post
reported Jang departure unclear); nonprofits [Transluce](https://transluce.org/research)
(closest thing to a model-behavior institute; raising $11M),
[Truthful AI](https://truthful.ai/) ([Emergent Misalignment → Nature](https://www.nature.com/articles/s41586-025-09937-5)),
[Apart Research](https://apartresearch.com/sprints) (weekend sprints; financially precarious),
AI Forensics + AlgorithmWatch; academic clusters at Stanford/CMU; and — distinctive here —
proven independents: xlr8harder (SpeechMap), Sam Paech (EQ-Bench/Spiral-Bench),
janus/Ampdot (Act I, $67k via Manifund), nostalgebraist.

**Strongest small-team exemplar.** [Wiese (PLOS One 2026)](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0339920)
— **one author**, preregistered 10-week × 240-prompt × 3-model longitudinal drift study with a
bias-calibrated Bradley–Terry LLM judge (judge–human correlation 0.38→0.68) and change-point
detection that caught a real drift event. Existence proof that a solo, API-budget observatory is
publishable.

**Named gaps.**
- No sustained public behavioral observatory — nobody continuously tracks persona, values,
  sycophancy, or emotional behavior of deployed models across versions; the GPT-4o sycophancy
  rollback showed [OpenAI itself had no such eval at rollout](https://venturebeat.com/technology/openai-rolls-back-chatgpts-sycophancy-and-explains-what-went-wrong).
- Psychometric validity crisis: transplanted human instruments show
  [broken factor structure](https://arxiv.org/html/2311.05297v2) and
  [agree-bias](https://arxiv.org/html/2311.09718); LLM-native instruments mostly missing.
- Benchmark fragility under audit ([one sprint audit moved ELEPHANT's measured sycophancy 13 points](https://blog.bluedot.org/p/measuring-moral-sycophancy-is-harder)).
- Black-box version-to-version diffing of closed models is nearly empty territory.
- Judge validity inside behavior measurement (judge drift confounds subject drift).
- Model deprecation destroys the study population; only
  [Anthropic has preservation commitments](https://www.anthropic.com/research/deprecation-commitments).
- The qualitative lore (janus/cyborgism) → quantitative measurement bridge is mostly unbuilt.

**Honest unknowns.** No 2025–26 position paper consolidating the field was found; solo-exemplar
sustainability (SpeechMap funding, Paech's status ⚠️) unresolved; real API cost of a Wiese-style
observatory unpriced (assumption: <$500); ToS/legal exposure of publishing per-vendor probe
results unverified; which venues want observatory/negative/audit results specifically is unknown.

**Fit notes (facts).** Wiese's method is a superset of the researcher's published LLM-as-judge
work (prompt banks, judge calibration, change-point statistics; zero training compute). Gaps
#1/#3/#5 are evaluation-methodology problems. Documented part-time on-ramps at every rung:
Apart/BlueDot sprints, Manifund micro-grants, MATS, Anthropic Fellows.

---

## 2. The data science of AI

*Brief: [sweep-02-data-science-of-ai.md](briefs/sweep-02-data-science-of-ai.md)*

**What it is.** The study of what models are trained on. Six sub-areas, roughly ordered by
compute need: dataset documentation/retrospective auditing
([BookCorpus datasheet](https://arxiv.org/abs/2105.05241), [WIMBD](https://arxiv.org/abs/2310.20707)),
data forensics & contamination auditing
([provable black-box contamination tests](https://arxiv.org/abs/2310.17623),
[CONDA](https://conda-workshop.github.io/)), provenance/licensing/consent
([DPI's 1,800-dataset audit in Nature MI](https://www.nature.com/articles/s42256-024-00878-8),
[Consent in Crisis](https://www.dataprovenance.org/Consent_in_Crisis.pdf)), open-data curation
at scale ([FineWeb](https://arxiv.org/html/2406.17557v1), [DataComp-LM](https://arxiv.org/abs/2406.11794),
[Common Pile](https://arxiv.org/html/2506.05209v1)), synthetic-data ecology (model collapse
debate; [machine-translated web](https://aclanthology.org/2024.findings-acl.103/);
[AI content in Wikipedia](https://arxiv.org/abs/2410.08044)), and tokenizer effects
(2–15× low-resource token premiums; [glitch tokens](https://arxiv.org/abs/2405.05417)).

**Who does it.** EleutherAI (nonprofit, open Discord contributor model), Hugging Face FineData,
Ai2 (Dolma/OLMo/WIMBD), the DataComp consortium (**open competition anyone can enter**),
the [Data Provenance Initiative](https://www.dataprovenance.org/) (volunteer collective with an
open contribution email), MLCommons working groups (open to join), Common Crawl Foundation
(tiny nonprofit underpinning everything), Pleias (2-founder startup that shipped a 2T-token
corpus), Spawning (consent infrastructure), DatologyAI ($57.5M startup — the commercial exit
for curation expertise). Individuals: Shayne Longpre, Stella Biderman, Sander Land & Max
Bartolo, Oscar Sainz, Dallas Card.

**Strongest small-team exemplar.** [Fishing for Magikarp](https://arxiv.org/abs/2405.05417)
— **2 authors** (EMNLP 2024) turned the folkloric "SolidGoldMagikarp" glitch into a general,
automatic under-trained-token audit across many models. No training runs; just inference and
analysis. Runner-up: [Bandy & Vincent's BookCorpus datasheet](https://arxiv.org/abs/2105.05241)
(2 grad students, ~zero compute, named "documentation debt").

**Named gaps.**
- License metadata broken at infrastructure level (70%+ omission, 50%+ error rates —
  [Nature MI](https://www.nature.com/articles/s42256-024-00878-8)); automated
  license-verification tooling nascent.
- Consent has no adequate mechanism; nobody has settled how consent propagates through
  derivatives (dataset → filtered subset → synthetic rewrite).
- Open-license data pool too small; bottleneck is extraction (OCR of archives), not licensing.
- Contamination detection is [easy to evade](https://arxiv.org/pdf/2402.02823); community
  evidence base tiny (566 entries, 23 contributors).
- Synthetic-share measurement is methodologically weak — headline "50% of the web is AI"
  numbers trace to commercial detectors; no detector-FPR-corrected estimate of fresh Common
  Crawl exists.
- Model-collapse empirics under realistic web dynamics (accumulation + filtering + human
  selection) untested.
- Tokenizer equity has numbers but few fixes; field got its first venue only in 2025
  ([TokShop](https://icml.cc/virtual/2025/workshop/39998)).
- Single point of failure: Common Crawl.

**Honest unknowns.** Whether HF FineData takes formal outside collaborators ⚠️; DPI's
2026 on-ramp status; Consent in Crisis peer-review venue ⚠️; whether small-scale curation
ablations (~$100–500 GPU) produce rankings that transfer (untested assumption, itself
researchable); legal exposure of solo auditors naming companies.

**Fit notes (facts).** Quality/license classifiers, statistical contamination testing, and the
detector-validation gap are pipeline + classical-ML + evaluation-methodology problems.
Documentation/forensics/provenance/tokenizer sub-areas are CPU/storage/inference-bound;
only full-corpus builds exceed the budget. Confirmed no-affiliation on-ramps: EleutherAI
Discord, DPI volunteer email, MLCommons, DCLM competition, CONDA shared tasks.

---

## 3. AI security research (defensive)

*Brief: [sweep-03-security-and-adversarial.md](briefs/sweep-03-security-and-adversarial.md)*

**What it is.** Classical security methodology applied to systems with no clean data/instruction
trust boundary. Sub-areas: prompt injection & agent-input security (Willison's
[lethal trifecta](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/); Meta's Agents
Rule of Two), jailbreak science (the recurring lesson:
[adaptive attacks break defenses that looked strong statically](https://arxiv.org/abs/2510.09023)),
agentic-security benchmarks ([AgentDojo](https://arxiv.org/abs/2406.13352)), model supply-chain
security ([~250 poisoned docs backdoor models of any size](https://www.anthropic.com/research/small-samples-poison)),
MCP/tool-ecosystem audits (tool poisoning, rug pulls,
[the GitHub MCP private-repo exfiltration](https://invariantlabs.ai/blog/mcp-github-vulnerability)),
and AI bug bounties / coordinated disclosure.

**Who does it.** Invariant Labs (now Snyk research), Gray Swan AI (public arena with cash
bounties; **hired/contracted 14+ arena winners**), Meta (LlamaFirewall), Google DeepMind + ETH
(CaMeL), NVIDIA (garak), Anthropic/OpenAI (bounties + CVD policies); UK AISI (red team; a
MATS stream), NIST CAISI; ETH Zurich SPY Lab (Tramèr); OWASP GenAI (open contribution;
LLM Top 10); nonprofits/independents: Palisade Research, Johann Rehberger (solo disclosures),
Simon Willison (coined "prompt injection"), Kai Greshake
([the indirect-injection landmark](https://arxiv.org/abs/2302.12173) came from a small
independent/academic group).

**Strongest small-team exemplar.** [garak](https://arxiv.org/abs/2406.11036) — a **solo
sabbatical project** (Leon Derczynski, 2023) that became the standard open-source LLM
vulnerability scanner and was adopted by NVIDIA in 2024. The clearest "independent tool →
field infrastructure" path in this space.

**Named gaps.**
- Detection-based guardrails fail under adaptive attack (>90% ASR); standardized adaptive-eval
  protocols are scarce — most defense papers still report static numbers.
- Design-level defenses (CaMeL, Rule of Two) under-evaluated: usability/false-friction costs
  unquantified.
- No broadly-trusted, reproducible audit standard for the exploding MCP server ecosystem.
- Coordinated disclosure is broken for AI: vendors
  [paid agent-hijack bounties without advisories or CVEs](https://thenextweb.com/news/ai-agents-hijacked-prompt-injection-bug-bounties-no-cve)
  (⚠️ single journalistic source); "what counts as a vulnerability" is unsettled.
- Poisoning *detection/attribution* lags far behind the poisoning attack result.
- Supply-chain scanners are rule-based and evadable (picklescan bypasses; GGUF Jinja
  templates fire at inference, invisible at load time).
- Agent-security benchmark proliferation without consolidation — a meta-evaluation gap.

**Honest unknowns.** Several 2026 arXiv IDs seen only in snippets ⚠️; team sizes for Invariant/
Palisade/Gray Swan inferred not confirmed ⚠️; bounty payout economics unknown; whether solo
demonstrations still land in 2026 as they did 2023–25 (untested; the bar for "novel" is rising).

**Fit notes (facts).** Judging whether an injection succeeded is itself an LLM-judge task;
AgentDojo-style benchmarks and the benchmark-consistency critique are evaluation-methodology
problems. Landmark results here are reproducible demonstrations or open tooling, not training
runs. On-ramps across all funding types: OWASP (open), Gray Swan Arena (competition-to-hire),
AISI MATS stream, public bug bounties.

---

## 4. Human-AI interaction & sociotechnical field studies

*Brief: [sweep-04-human-ai-studies.md](briefs/sweep-04-human-ai-studies.md)*

**What it is.** Empirical studies of what AI does to the humans using it. Sub-areas:
reliance/over-reliance ([cognitive forcing functions](https://arxiv.org/abs/2102.09692));
deskilling ([the Lancet colonoscopy result](https://www.thelancet.com/journals/langas/article/PIIS2468-12532500133-5/abstract):
unassisted detection fell 28%→22% after AI-assisted practice); AI companions
([OpenAI×MIT: correlational alarm, experimental null](https://openai.com/index/affective-use-study/));
workplace productivity ([Noy & Zhang](https://www.science.org/doi/10.1126/science.adh2586);
[METR's 19%-slower dev RCT](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/)
vs. [Danish register-data nulls](https://bfi.uchicago.edu/wp-content/uploads/2025/04/BFI_WP_2025-56-1.pdf));
education ([unguarded GPT-4 hurt exam performance; guardrails mitigated](https://www.pnas.org/doi/10.1073/pnas.2422633122));
professional behavior ([physicians+GPT-4 ≈ physicians alone while GPT-4 alone beat both](https://psnet.ahrq.gov/issue/large-language-model-influence-diagnostic-reasoning-randomized-clinical-trial));
human uplift studies (safety framing); log/telemetry analysis (Clio,
[WildChat](https://arxiv.org/abs/2405.01470)); AI-mediated communication; and
benchmark-vs-human-outcome gap studies
([Bean et al.: 94.9% benchmark score → no human uplift](https://arxiv.org/abs/2504.18919)).
The field's signature pattern: big effects in controlled micro studies, murkier or null effects
in the field and at macro scale.

**Who does it.** Anthropic Societal Impacts + Economic Research (with the
[Economic Futures Program](https://www.anthropic.com/news/introducing-the-anthropic-economic-futures-program):
$10k–$50k rolling grants; ⚠️ independent eligibility unconfirmed); Microsoft Research (AETHER,
AICE external-grant network); OpenAI Economic Research; METR (4 staff ran the dev RCT; pays
participants $150/hr); Common Sense Media; academic labs at Harvard (Gajos/Buçinca), Cornell
Tech (Naaman), Princeton (Guingrich & Graziano), Stanford, Wharton (Mollick), Oxford Internet
Institute; the NBER economist pipeline.

**Strongest small-team exemplar.** [Noy & Zhang, Science 2023](https://www.science.org/doi/10.1126/science.adh2586)
— **two MIT econ PhD students**, preregistered online experiment (453 professionals) on a
survey-platform budget; first credible causal estimate of ChatGPT productivity effects.
Also notable at two-person scale: [Guingrich & Graziano's 21-day companion-chatbot RCT](https://arxiv.org/abs/2509.19515).

**Named gaps.**
- Ecological validity: reliance findings on real tasks with real stakes and real practitioners
  are rare (both exceptions are medicine).
- Self-report dominates; METR showed perception is directionally wrong; objective outcome
  measurement outside coding is scarce.
- Micro-macro reconciliation: nobody has a validated account of where the 15–40% micro gains
  go at the macro level.
- No multi-month randomized skill-retention (deskilling) study outside medicine.
- Companion effects: self-selection everywhere; causal question open at long horizons.
- Benchmark-to-human transfer: almost nobody maps which eval scores predict which human
  outcomes — a measurement-science gap, not a data-access gap.
- Log-data asymmetry: labs have Clio; outsiders have WildChat (ended May 2024).
- Weak verification norms — the [fabricated MIT productivity study](https://the-decoder.com/mit-says-a-high-profile-ai-productivity-study-used-data-that-cannot-be-trusted/)
  fooled top economists; preregistration + open data are differentiators.

**Honest unknowns.** Economic Futures / AICE eligibility for unaffiliated independents ⚠️;
commercial-IRB cost/turnaround for a solo Prolific study, and whether Prolific enforces ethics
review ⚠️; whether pre-2024 overreliance findings replicate under agentic paradigms; budget
arithmetic (⚠️ own estimate): $500 ≈ 100–150 Prolific participants × 15 min — pilot scale, not
Noy-Zhang scale. Structural constraint: no home IRB; minors/patients/deception effectively
off-limits solo.

**Fit notes (facts).** Bean-style benchmark-vs-human-transfer studies are evaluation-methodology
problems run with human participants. Pipeline/classical-ML skills apply to WildChat-scale log
analysis (no human-subjects approval needed). Two named external grant channels exist
(Anthropic Economic Futures, MSR AICE). Precedent for two-person top-venue work is
established; IRB access via commercial board or affiliated co-author is the main dependency.

---

## 5. Reproduction, replication & meta-science of AI

*Brief: [sweep-05-reproduction-and-metascience.md](briefs/sweep-05-reproduction-and-metascience.md)*

**What it is.** Checking whether AI claims hold up. Sub-areas: direct reproduction
([Epoch's Chinchilla replication](https://arxiv.org/abs/2404.10102) found the original fit
mis-optimized; the R1-Zero open-reproduction wave); forensics of hyped results that fell apart
(Reflection 70B, [Sakana's reward-hacked CUDA claims](https://techcrunch.com/2025/02/21/sakana-walks-back-claims-that-its-ai-can-dramatically-speed-up-model-training/),
[gzip-beats-BERT](https://kenschutte.com/gzip-knn-paper/)); benchmark auditing
([GSM1k](https://arxiv.org/abs/2405.00332), [MMLU-Redux](https://arxiv.org/abs/2406.04127),
[The Leaderboard Illusion](https://arxiv.org/abs/2504.20879)); meta-analysis
([To CoT or not to CoT](https://arxiv.org/abs/2409.12183)); methodology & standards
([REFORMS](https://www.science.org/doi/10.1126/sciadv.adk3452),
[Questionable Practices in ML](https://arxiv.org/abs/2407.12220)); living reviews and open
lab notebooks ([HEPML Living Review](https://github.com/iml-wg/HEPML-LivingReview),
[Marin](http://marin.community/)). Cultural fact: much of the highest-impact work lives outside
peer review — blogs, LessWrong, GitHub — because venues have no home for "you were wrong."

**Who does it.** Epoch AI (Open Phil-funded; itself caught in the
[FrontierMath disclosure failure](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/)
— credibility is fragile), METR (takes no AI-company money), EleutherAI
(lm-evaluation-harness), The Unjournal (**pays ~$500/evaluation**), Apollo Research
("science of evals"), ReScience C / MLRC ([an official NeurIPS track from 2026](https://blog.neurips.cc/2026/05/04/mlrc-2026-reproducibility-as-an-official-track-at-neurips/));
Princeton (Kapoor & Narayanan — the intellectual center), Stanford (BetterBench, Marin,
Schaeffer/Koyejo), Cohere Labs; companies: Artificial Analysis, Answer.AI. Independents:
Ken Schutte, Gwern, Keller Jordan (NanoGPT speedrun), Jiayi Pan (TinyZero, <$30),
Eric Martínez.

**Strongest small-team exemplar.** [Martínez, "Re-evaluating GPT-4's Bar Exam Performance"](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4441311)
— **solo author**; reworked OpenAI's "90th percentile UBE" marketing claim down to ~48th
percentile vs. licensed attorneys from public data, no GPUs; published in *AI and Law*. The
purest solo template. Runner-up: [Schutte's solo blog takedown](https://kenschutte.com/gzip-knn-paper/)
of gzip-beats-BERT within days.

**Named gaps.**
- No high-status home for refutations — the [R&C track position paper](https://arxiv.org/abs/2506.19882)
  documents flawed studies being *highlighted* at ML conferences with no venue to challenge
  them; MLRC-as-NeurIPS-track is brand new.
- Efficiency/inference claims ("10× faster," "X% cheaper") are under-audited; no standing
  infrastructure beyond the NanoGPT speedrun.
- Contamination detection without weights/data access is demonstrated but not operationalized
  as a routine audit.
- Living systematic reviews are rare outside physics; reasoning-RL/RAG/agents/LLM-judge have
  none.
- "Does X replicate on open models?" is done ad hoc — no standard protocol, preregistration,
  or aggregation (alignment-faking replications: [only 3/16 models faked](https://alignment.anthropic.com/2025/alignment-faking-revisited/), setup-dependent).
- Conflict-of-interest/independence infrastructure immature (FrontierMath; Leaderboard
  Illusion).
- Reporting-standard adoption unmeasured; compliance-checking tooling undone.

**Honest unknowns.** Whether blog-first reputation converts to grants/hiring or stays
respected-but-outside ⚠️; whether any grantmaker funds *individual* reproduction projects at
<$50k; legal/reputational exposure of publishing "this claim is wrong" about a funded startup;
how much compute a credible 2026-era replication needs (unmapped, claim-by-claim); whether
MLRC accepts unaffiliated reproducers.

**Fit notes (facts).** Benchmark auditing, contamination detection, and science-of-evals are
directly continuous with the published LLM-as-judge study; meta-analysis and leakage detection
are classical-ML/statistics problems. The scarce input is credibility, not compute — and
independence is easier to claim as an unaffiliated solo than from inside a lab being audited.
The hardest-landing exemplars (Martínez, Schutte, Schaeffer) used re-analysis of public data.

---

## 6. Domain-vertical evaluation & third-party audit

*Brief: [sweep-06-vertical-evaluation-and-audit.md](briefs/sweep-06-vertical-evaluation-and-audit.md)*

**What it is.** Three overlapping practices sharing one skill — constructing valid measurements
of AI behavior under domain constraints, then defending them. (1) **Vertical evaluation**:
medicine ([MedHELM](https://medhelm.org/) — 121 clinical tasks; LLM-jury validation with
ICC 0.47 vs. clinicians; OpenAI's HealthBench), law
([LegalBench](https://hazyresearch.stanford.edu/legalbench/) — 162 tasks, 40 contributors;
[the legal-RAG hallucination audit](https://arxiv.org/abs/2405.20362)), finance
([FinanceBench](https://arxiv.org/pdf/2311.11944): GPT-4-Turbo+retrieval failed 81%), education
(benchmark-thin; best evidence is [one RCT](https://arxiv.org/abs/2410.03017)), public sector
(fragmented; a [1,300-benchmark meta-review](https://arxiv.org/html/2601.20617) found none meet
public-sector criteria ⚠️ figures not re-verified). (2) **Algorithmic auditing** under legal
mandates: [NYC Local Law 144](https://www.nyc.gov/site/dca/about/automated-employment-decision-tools.page),
[Colorado's insurance ECDIS testing](https://doi.colorado.gov/for-consumers/sb21-169-protecting-consumers-from-unfair-discrimination-in-insurance-practices),
adversarial audits (Eticas, journalism). (3) **Incident analysis**:
[AI Incident Database](https://incidentdatabase.ai/), AIAAIC, OECD AIM, MIT tracker.

**Who does it.** Nonprofits: Responsible AI Collaborative/AIID (open submissions), Eticas,
Ada Lovelace Institute, Data & Society AIMLab, Lighthouse Reports (journalism with published
code), AIAAIC (one founder + volunteers → OECD-cited infrastructure). Professional bodies:
IAAA (CAIA credential), ISACA (AAIA). Firms: BABL AI (trains and hires auditors), ORCAA
(the HireVue scope-capture cautionary tale), Holistic AI, Patronus AI. Academic: Stanford
RegLab/CRFM, BetterBench, Cornell (155 student investigators on LL144). Individuals: Raji
(the field's central theorist), Buolamwini, Obermeyer, McGregor, Pownall.

**Strongest small-team exemplar.** [Gender Shades](https://proceedings.mlr.press/v81/buolamwini18a.html)
— **2 authors** (FAT* 2018), audited three commercial face APIs, found up to 34.7% vs ≤0.8%
error disparity, triggered product changes and the modern audit movement. Modern echo at
similar scale: [the Epic Sepsis Model external validation](https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/2781307)
(single site, routine EHR data, standard ML validation statistics, JAMA IM).

**Named gaps.**
- "Audit" is undefined — no standards; [Who Audits the Auditors](https://facctconference.org/static/pdfs_2022/facct22-3533213.pdf)
  warns unverifiable audit claims may exacerbate harm.
- Audits rarely convert to accountability ([The Broken Bus](https://arxiv.org/abs/2401.14462));
  which audit designs produce consequences is an open research problem.
- Mandates without enforcement: LL144 produced [18 posted reports out of 391 employers](https://arxiv.org/abs/2406.01399)
  and two complaints in two years — verifying compliance ecosystems is itself an open vertical.
- Auditor independence / scope capture (ORCAA-HireVue).
- Data/model access is the binding constraint (Suspicion Machines took six months of FOI
  negotiation for one municipal model).
- Benchmark quality is poor and unmeasured ([BetterBench](https://arxiv.org/abs/2411.12990):
  most benchmarks don't report significance or support replication).
- Vertical coverage uneven: education and government thin; Colorado insurance testing mandated
  but no public methods literature found.
- Incident epistemics unresolved: redundant databases, no shared taxonomy, causal-factor
  annotation nearly absent.

**Honest unknowns.** Funding paths for independent vertical evals unmapped; whether IAAA/ISACA
credentials have real market recognition; who actually performs Colorado's mandated testing;
what makes a vertical benchmark get adopted vs. die (no source found — testable); legal
exposure of independent auditors (not investigated); EU AI Act / DSA audit ecosystem
explicitly out of this sweep's scope.

**Fit notes (facts).** The exemplars used exactly the researcher's stack: public/FOI data +
classical-ML statistics + frontier-API calls; Rotterdam's audited model was literally a
gradient-boosting machine. The legal-RAG audit and MedHELM's LLM-jury validation are
methodologically adjacent to the published LLM-as-judge work. Solo viability shown at every
tier: 2–6-author audits in Science/JAMA/FAT*, a one-founder repository, a credential track
that runs on certification rather than affiliation.

---

## 7. Small/open-model science

*Brief: [sweep-07-small-open-model-science.md](briefs/sweep-07-small-open-model-science.md)*

**What it is.** Treating open-weight models as objects of empirical study on modest GPUs.
Six sub-areas: quantization behavior science
([accuracy hides answer "flips"](https://arxiv.org/abs/2407.09141); PTQ-safety results
"inconclusive"; indie [KL-divergence GGUF audits](https://localbench.substack.com/p/gemma-4-31b-gguf-kl-divergence));
small-vs-large capability divergence ([emergence-as-metric-artifact](https://arxiv.org/abs/2304.15004);
the [small-model learnability gap](https://arxiv.org/abs/2502.12143)); fine-tuning science
([benign fine-tuning erodes safety](https://arxiv.org/pdf/2310.03693);
[LoRA learns less, forgets less](https://arxiv.org/abs/2405.09673);
[Emergent Misalignment](https://truthful.ai/papers/emergent-misalignment/);
refusal-direction → abliteration); distillation effects
([students preserve scores while losing calibration/abstention/safety](https://arxiv.org/pdf/2604.25110));
open-weights ecosystem tracking ([OSAI Index](https://osai-index.eu/about/); HF Hub mining);
on-device behavior (latency studied, behavioral divergence across engines nearly untouched).
[Pythia](https://github.com/EleutherAI/pythia) exists precisely to enable this controlled science.

**Who does it.** EleutherAI (flat volunteer structure, Discord hub), HF Smol Models, Cohere
Labs Open Science Community (5,000+ members, Catalyst grants), Answer.AI (~12 people;
FSDP+QLoRA on gaming GPUs), Nous Research (Discord collective → $65M startup), Marin
(GitHub-mediated preregistered experiments), MIT HAN Lab, IST-DASLab, Radboud (OSAI Index,
2 faculty), Truthful AI, Unsloth (⚠️ reportedly two brothers). Individuals: Tim Dettmers
(bitsandbytes/QLoRA — the most load-bearing person for consumer-GPU science), Maxime Labonne,
Alexia Jolicoeur-Martineau, Rylan Schaeffer, indie quant auditors (oobabooga ⚠️, bartowski).

**Strongest small-team exemplar.** [Tiny Recursion Model](https://arxiv.org/abs/2510.04871)
— **solo author** (Samsung SAIL Montréal): 7M-param recursive net hits 45% ARC-AGI-1, beating
most LLMs; reported <$500 training cost (⚠️ secondary source) — literally within this program's
budget envelope. Also: the [refusal-direction paper](https://x.com/maximelabonne/status/1803108202784997672)
→ [Labonne's solo abliteration tutorial](https://huggingface.co/blog/mlabonne/abliteration)
chain, where a NeurIPS finding became a community technique within weeks.

**Named gaps.**
- No standardized quantization-behavior benchmark — named as missing infrastructure by the
  [r/LocalLLaMA study](https://arxiv.org/html/2606.22211v1); indie audits lack statistics;
  academic metrics (flips, KL) never packaged into an adopted harness.
- PTQ × safety is inconclusive and fragmented; smaller models diverge more across quantization
  methods; quantization can be [deliberately exploited](https://arxiv.org/html/2506.20251v1).
- Distillation has no "what-was-lost" reporting norm despite R1-distills being everywhere.
- Behavioral divergence across on-device inference stacks (same checkpoint, different engines)
  nearly unstudied ⚠️ inferred absence.
- Non-English degradation under compression — measurable, harm-relevant, mostly ignored
  (echoes [Hooker's long-tail compression result](https://arxiv.org/abs/1911.05248) at the
  language level).
- Model-diffing methods young and artifact-prone; method-validation is cheap on Pythia.
- Ecosystem tracking is snapshot-heavy; no maintained license-drift dataset found ⚠️.
- Small-model learnability gap has a mitigation but no mechanism.

**Honest unknowns.** localbench authorship ⚠️; TRM cost figure from secondary reporting ⚠️;
whether a quantization-behavior harness would be adopted (talk to lm-eval-harness maintainers
and quant uploaders first); whether cross-engine on-device diffing is already claimed; whether
weight-quantization × emergent-misalignment is unclaimed (KV-cache version exists); why PTQ
safety results conflict across papers.

**Fit notes (facts).** The core activity — controlled behavioral comparisons and defensible
divergence metrics for model variants — is evaluation methodology applied to open checkpoints.
The tooling (Pythia, QLoRA/bitsandbytes, GGUF) was built to run on one or two consumer GPUs
or short rented bursts. Verified solo and ≤4-author publications exist. Standing
no-employment-required on-ramps: EleutherAI Discord, Cohere Labs community, Marin.

---

## 8. Wildcards — eight unconventional niches

*Brief: [sweep-08-wildcards.md](briefs/sweep-08-wildcards.md). The dedicated unconventional
track required by charter principle 1. All eight niches preserved; two have essentially **no
incumbents**. Common shape: measurement science applied to the AI ecosystem itself — prices,
energy, lifecycles, failures, outputs loose in the world, forecasted trajectories, possible
interests.*

### 8.1 Prediction-market-grade AI capability forecasting
Treating "how good will AI be at X by Y" as a scored forecasting problem.
[ForecastBench](https://www.forecastbench.org/) (FRI; contamination-free by construction;
best LLM Brier 0.101 vs. superforecasters' 0.081) benchmarks LLMs as forecasters;
[AI Digest's timeline](https://theaidigest.org/timeline) retrospectively scores past AI
predictions (Steinhardt's tournaments showed forecasters *underestimating* progress).
**Gap:** no rigorous, resolution-scored public track record of capability predictions by labs,
pundits, and markets exists. ⚠️ Whether ForecastBench accepts outside bot submissions with
public credit is unexamined.

### 8.2 Inference economics — the empirical price of intelligence
[Epoch: price-per-performance falling ~10×/year](https://epoch.ai/data-insights/llm-inference-price-trends);
[Erdil's first theoretical model](https://epoch.ai/blog/inference-economics-of-language-models);
the paradox that per-token prices crash while bills explode
([agentic workflows use 5–30× more tokens per task](https://arxiv.org/html/2511.23455v2)).
**Gaps nobody owns:** price-per-*task* indices, quote archaeology (providers silently edit
pricing pages, and history vanishes), cross-provider arbitrage, token-inflation accounting.
Incumbency: one nonprofit + one startup (Artificial Analysis); near-zero academia.

### 8.3 AI archaeology — behavioral preservation of dying models ★ no incumbents
Capturing what models *were* before they vanish. OpenAI
[retired GPT-4o from ChatGPT and is ending its API access](https://venturebeat.com/ai/openai-is-ending-api-access-to-fan-favorite-gpt-4o-model-in-february-2026);
lifecycles compressed to ~6–12 months (⚠️ from a search summary).
[Johnson & Obradovich (Nature Comms 2024, **2 authors**)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11599761/)
made the policy case but did no empirical capture;
[Anthropic's deprecation commitments](https://www.anthropic.com/research/deprecation-commitments)
preserve weights *internally* with no external-researcher access;
[Chidlow's essay](https://vale.rocks/posts/ai-model-history-is-being-lost) argues ChatGPT-era
systems are already unrecoverable. **Gap:** nobody runs a standing behavioral time capsule —
a versioned, seed-controlled battery run against every major API model in its final months,
outputs archived for future comparative science. Behavior capture needs only API access before
sunset. Time-critical and recurring.

### 8.4 Detection ecology — AI content in the wild and the culture feedback loop
Field ecology on AI-generated content, not detector-building: Liang-lineage distributional
estimates over [1M+ scientific papers](https://arxiv.org/html/2404.01268);
[who adopts AI writing fastest](https://arxiv.org/pdf/2511.15872); the reverse arrow —
[ChatGPT-preferred words increasing in human *spoken* language](https://arxiv.org/abs/2409.01754)
("a closed cultural feedback loop"). **Gap:** prevalence estimates run ~0% to ⚠️ ~35% depending
on method — same phenomenon, incompatible instruments, and **no cross-calibration study of the
estimators has ever been done**.

### 8.5 Agent market ecology — collusion, price wars, machine economics
[Fish, Gonczarowski & Shorrer (**3 authors**, run on granted API credits)](https://arxiv.org/pdf/2404.00806):
LLM pricing agents autonomously reach supracompetitive prices; innocuous prompt phrasing
changes collusion rates. [Vending-Bench](https://arxiv.org/pdf/2502.15840) (Andon Labs,
⚠️ ~2-person startup at publication) → Anthropic's
[Project Vend](https://www.anthropic.com/research/project-vend-1). **Gap:** the
single-agent-shopkeeper genre is crowding, but multi-agent market dynamics — emergent
collusion, price wars, manipulation, welfare effects on simulated consumers — remain thinly
studied, and the collusion result has few follow-ups on detection or mitigation.

### 8.6 NTSB-style open post-mortems of AI product failures ★ no incumbents
Cataloguers exist; investigators do not. [AIID](https://incidentdatabase.ai/) holds 2,000+
reports but its own [roadmap](https://incidentdatabase.ai/research/2-roadmap/) lists post-mortem
support as future work; [AIAAIC](https://www.aiaaic.org/aiaaic-repository) is one editor + ~40
volunteers; an [AIES review](https://dl.acm.org/doi/fullHtml/10.1145/3600211.3604700) found
causal-factor annotation nearly absent across databases. **Gap:** nobody produces the
aviation-style deep single-incident investigation — timeline reconstruction, causal chain,
systemic factors, recommendations — for even one major AI product failure, from public evidence.

### 8.7 Model welfare empirics
Turning "does the model have interests?" into measurement. [Eleos AI](https://eleosai.org/)
(~4–6 people ⚠️) explicitly lists standardized welfare evaluations and lab-independent research
as unfilled priorities; Anthropic now [interviews models before retirement](https://www.anthropic.com/research/deprecation-commitments).
Exemplar: [Kaiser & Enderby (**2 authors**)](https://arxiv.org/abs/2601.15334) used activation
classifiers to *falsify* a prior hidden-sentience claim. Empirical-methods population: maybe a
dozen people. **Gap:** the incumbents themselves say the eval work is missing.

### 8.8 AI energy/water measurement, especially closed API models
Open-model side maturing ([ML.ENERGY](https://ml.energy/), [AI Energy Score](https://huggingface.co/blog/sasha/announcing-ai-energy-score));
closed-model side nearly empty: [How Hungry is AI? (**5 authors**)](https://arxiv.org/abs/2505.09598)
infers per-query energy from public API data and is essentially uncontested; Altman's 0.34 Wh
claim has [no methodology attached](https://towardsdatascience.com/lets-analyze-openais-claims-about-chatgpt-energy-use/).
**Gaps:** no independent replication or sensitivity analysis of the inference chains; nobody
audits provider energy claims; agentic-workload energy unmeasured entirely.

**Honest unknowns (section-wide).** Funding/headcounts for FRI, Sage, Andon Labs, Artificial
Analysis, Eleos inferred not verified ⚠️; provider deprecation-notice policies unmapped; whether
labs would grant a solo researcher pre-deprecation access or accept external "exit interviews"
(untested); ToS exposure of archiving/republishing large API output corpora unchecked; whether
the ⚠️ "35% of new websites" figure survives its own methodology section; whether detection
cross-calibration exists somewhere unfound.

**Fit notes (facts).** Six of eight niches (forecasting, inference economics, archaeology,
detection ecology, agent markets, energy) run on API-driven measurement batteries + classical
statistics with no training compute — Fish et al. ran an economics-journal-grade study on
granted credits. Brier-score evaluation is the same calibration math as judge-reliability
analysis. The two no-incumbent niches require no institutional affiliation to start; their
current thought leaders include a two-person paper team, a volunteer repository, and an
independent blogger.

---

## Fields deliberately NOT yet explored

Adjacent areas the briefs surfaced but did not cover — the starting point for the next
divergence round:

1. **LLM social simulations** (LLMs as simulated humans/populations for social science) —
   explicitly set aside as "a different field" in [sweep 01](briefs/sweep-01-model-behavior-science.md)'s
   ledger; kept surfacing in behavior-science searches.
2. **EU AI Act conformity assessment & DSA audit practice** (notified bodies, GPAI
   evaluations, Big 4 audit involvement) — named out of scope in
   [sweep 06](briefs/sweep-06-vertical-evaluation-and-audit.md), which calls it "the largest
   coming demand source for third-party auditors."
3. **Data provenance beyond text** (speech/video/multimodal — DPI's "Bridging the Data
   Provenance Gap") — referenced but unopened in [sweep 02](briefs/sweep-02-data-science-of-ai.md) ⚠️.
4. **Data-donation infrastructure** (consented, post-WildChat usage-log collection pipelines) —
   flagged as not investigated in [sweep 04](briefs/sweep-04-human-ai-studies.md).
5. **Law & norms of independent AI research** (ToS/CFAA/defamation exposure, researcher safe
   harbor) — flagged as an unmapped dependency by [sweep 02](briefs/sweep-02-data-science-of-ai.md),
   [sweep 05](briefs/sweep-05-reproduction-and-metascience.md), and
   [sweep 06](briefs/sweep-06-vertical-evaluation-and-audit.md); no sweep treated it as a field
   in its own right.
6. **Offensive-AI capability measurement** (automated hacking, honeypots — Palisade-style work
   to inform defense/policy) — mentioned in passing in
   [sweep 03](briefs/sweep-03-security-and-adversarial.md); not swept as a field.
7. **Developer-tool field studies** (Copilot RCT literature — Peng et al., enterprise field
   experiments) — surfaced but unverified in [sweep 04](briefs/sweep-04-human-ai-studies.md).
8. **Meta-analysis/systematic-review tooling for AI literature** — whether existing
   systematic-review infrastructure handles LLM-paper pace/heterogeneity is an open question in
   [sweep 05](briefs/sweep-05-reproduction-and-metascience.md); tool-building for it was not
   explored.
9. **On-device/mobile AI systems research** (latency/energy engineering, as distinct from the
   behavioral divergence angle covered) — adjacent to
   [sweep 07](briefs/sweep-07-small-open-model-science.md).
10. **Qualitative/ethnographic model interaction as method** (cyborgism/Act I-style
    naturalistic ecologies as a research program, not just a lore source) — treated only as
    the "qualitative wing" inside [sweep 01](briefs/sweep-01-model-behavior-science.md).

## The briefs

| # | Field | Brief |
|---|---|---|
| 1 | Model behavior science | [sweep-01](briefs/sweep-01-model-behavior-science.md) |
| 2 | The data science of AI | [sweep-02](briefs/sweep-02-data-science-of-ai.md) |
| 3 | AI security (defensive) | [sweep-03](briefs/sweep-03-security-and-adversarial.md) |
| 4 | Human-AI interaction & field studies | [sweep-04](briefs/sweep-04-human-ai-studies.md) |
| 5 | Reproduction & meta-science | [sweep-05](briefs/sweep-05-reproduction-and-metascience.md) |
| 6 | Vertical evaluation & audit | [sweep-06](briefs/sweep-06-vertical-evaluation-and-audit.md) |
| 7 | Small/open-model science | [sweep-07](briefs/sweep-07-small-open-model-science.md) |
| 8 | Wildcards (8 niches) | [sweep-08](briefs/sweep-08-wildcards.md) |

*Next step per [04-topic-selection-process.md](04-topic-selection-process.md): prior-work checks
on the named gaps, then cheap pilots in 2–3 fields. No field is chosen yet.*
