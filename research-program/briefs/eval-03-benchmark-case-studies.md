# Benchmark case studies: how influential evals get built, adopted, and die

*Researched 2026-07-08. Method: primary sources (arXiv abstracts, org pages, leaderboards) plus reporting; every claim links to a page actually opened. Aggregator-sourced 2026 scores are flagged. Companion brief to the eval field map.*

---

## The shape of this space — what the work actually consists of

Building an influential benchmark is not one activity; the case studies below decompose into five distinct kinds of work, each with its own skill profile:

1. **Task sourcing & construction** — hand-writing items (HumanEval), scraping+filtering real artifacts (SWE-bench's GitHub issues), paying experts per item (GPQA, FrontierMath), or crowdsourcing with prizes (HLE's $500k pool). Cost ranges from ~$0 (repurposing existing data — MMLU, RewardBench) to hundreds of thousands of dollars (HLE, FrontierMath).
2. **Validation & QA** — expert cross-checking, adversarial filtering against frontier models, annotation campaigns. This is where most benchmarks fail: MMLU shipped with ~6.5% erroneous questions ([MMLU-Redux](https://arxiv.org/abs/2406.04127)), HLE with ~18–29% bad chem/bio items ([FutureHouse](https://www.futurehouse.org/research/hle-exam)), original SWE-bench with ~68% underspecified/unfair tasks ([OpenAI's Verified analysis](https://openai.com/index/introducing-swe-bench-verified/)).
3. **Harness & leaderboard operation** — the running code, submission process, and public ranking. Adoption correlates strongly with a maintained harness (SWE-bench's Docker environments, AgentDojo's extensible framework, Chatbot Arena's live site).
4. **Lifecycle management** — refreshing items (LiveBench replaces ~1/6 of questions monthly — [LiveBench paper](https://arxiv.org/abs/2406.19314)), releasing harder successors (MMLU-Pro, RewardBench 2, GAIA→Gaia2, ARC-AGI-1→2→3, τ→τ²), and retiring the benchmark (OpenAI formally abandoned SWE-bench Verified in Feb 2026 — [Latent Space interview](https://www.latent.space/p/swe-bench-dead)).
5. **Meta-evaluation / benchmark science** — auditing other people's benchmarks ([EvalPlus](https://arxiv.org/abs/2305.01210), [GSM1k](https://arxiv.org/abs/2405.00332), [BetterBench](https://arxiv.org/abs/2411.12990), [The Leaderboard Illusion](https://arxiv.org/abs/2504.20879)). This is a recognized sub-genre that itself produces influential papers.

**Sub-areas by benchmark type:** static knowledge exams (MMLU, GPQA, HLE) → code/verifiable-execution (HumanEval, SWE-bench) → human-preference platforms (Chatbot Arena) → agentic/environment benchmarks (GAIA, τ-bench, AgentDojo, Gaia2/ARE) → component benchmarks for the training stack (RewardBench) → intelligence-definition benchmarks (ARC-AGI) → frontier-difficulty expert benchmarks (FrontierMath, HLE). The field has moved roughly left-to-right in that list over 2020→2026.

---

## Case studies (12)

### 1. MMLU (2020) — the graduate-student default that ran the industry for four years
- **Origin:** [arXiv Sep 2020, ICLR 2021](https://arxiv.org/abs/2009.03300). Seven authors: Dan Hendrycks, Collin Burns, Steven Basart, Andy Zou, Mantas Mazeika, Dawn Song, Jacob Steinhardt — a UC Berkeley group where the lead and several co-authors were PhD/undergrad students at the time (affiliations not on the abstract page; student status is widely reported — ⚠️ inferred, not read on a primary page).
- **Construction & cost:** 57 subjects, questions collected from freely available practice exams and online sources (⚠️ construction detail from the paper body, not re-verified in this pass) — i.e., near-zero marginal cost, no expert payments.
- **Adoption:** became *the* headline capability number for GPT-4-era model launches; the paper's framing ("multitask accuracy") gave labs a single scalar to market.
- **Lifecycle:** saturated — frontier models cluster in the low 90s by 2026 ([benchmark explainer](https://benchmarkingagents.com/mmlu/) ⚠️ secondary source). [MMLU-Redux (2024)](https://arxiv.org/abs/2406.04127) found ~6.49% of questions erroneous overall and **57% of the Virology subset**. Successor [MMLU-Pro](https://github.com/TIGER-AI-Lab/MMLU-Pro) (TIGER-Lab, U. Waterloo, NeurIPS 2024) went to 10 options + reasoning-heavy items, dropping accuracy 16–33%.
- **Lesson:** cheap-to-build + broad + one scalar number = massive adoption; but zero QA budget means errors surface years later at scale, and a benchmark with a fixed ceiling has a fixed lifespan.

### 2. HumanEval (2021) — 164 hand-written problems that defined code eval
- **Origin:** shipped inside OpenAI's [Codex paper](https://arxiv.org/abs/2107.03374) (58 authors) — a big-lab byproduct, not a standalone project. Problems were hand-written to avoid GitHub contamination (⚠️ rationale from the paper body, not re-verified here).
- **Adoption:** pass@k on HumanEval became the standard code-model number for ~3 years, mostly because it was tiny, executable, and free.
- **Lifecycle:** [EvalPlus (NeurIPS 2023)](https://arxiv.org/abs/2305.01210) showed the tests were far too weak — 80× more tests reduced pass@k by up to 19.3–28.9% and **>10% of the original ground-truth solutions were themselves wrong**, enough to change model rankings. By 2024–25 frontier models exceeded 95%+ and the field moved to SWE-bench-style tasks.
- **Lesson:** executable ≠ rigorous. Test adequacy is a separate validity dimension, and a two-student audit paper (EvalPlus) can become as cited as the benchmark it audits.

### 3. GPQA (2023) — the small-team gold standard for expensive, validated construction
- **Origin:** [arXiv Nov 2023](https://arxiv.org/abs/2311.12022). Eight authors led by David Rein, a PhD student in Sam Bowman's NYU lab (⚠️ affiliations — NYU/Cohere/Anthropic — from memory; abstract page doesn't list them).
- **Construction & cost:** 448 questions written by paid PhD-level domain experts, then double-validated: experts scored 65% (74% correcting for identified errors) vs 34% for skilled non-experts *with 30+ min of web access* — the "Google-proof" test. Payment amounts not in the abstract (⚠️ total cost unverified; expert compensation is described in the paper body).
- **Adoption:** the Diamond subset (198 hardest items) became the standard "PhD science" number on every frontier model card, explicitly motivated by scalable-oversight research needs.
- **Lifecycle:** frontier models at 91–94% by April 2026 ([DemandSphere tracker](https://www.demandsphere.com/research/demandsphere-radar/ai-frontier-model-tracker/benchmarks/gpqa-diamond/) ⚠️ aggregator). Epoch's audit ["GPQA Diamond: What's Left?"](https://epochai.substack.com/p/gpqa-diamond-whats-left) found ≥90% of items valid — an unusually *good* post-hoc verdict — and Epoch separately verified that [labs' self-reported GPQA scores are accurate](https://epoch.ai/data-insights/self-reported-gpqa). Now demoted to a component of composite indices.
- **Lesson:** a ~1-lab team with a real validation budget produced the *most error-robust* exam benchmark of its generation. Measuring the expert/non-expert gap during construction is the transferable technique.

### 4. SWE-bench (2023) — two PhD students, real GitHub issues, and the agent era
- **Origin:** [arXiv Oct 2023, ICLR 2024](https://arxiv.org/abs/2310.06770). Carlos E. Jimenez and John Yang (Princeton PhD students) + five co-authors incl. Shunyu Yao, Ofir Press, Karthik Narasimhan.
- **Construction:** 2,294 task instances scraped from real issue→PR pairs across 12 popular Python repos, filtered so the PR's tests verify the fix — construction by pipeline, not by hand.
- **Adoption:** the inflection was **Cognition's Devin launch (March 2024)** claiming [13.86% vs prior SOTA ~2–5%](https://cognition.com/blog/swe-bench-technical-report) — a startup marketing moment made the benchmark famous. OpenAI then invested in it: [SWE-bench Verified (Aug 2024)](https://openai.com/index/introducing-swe-bench-verified/) paid **93 professional developers to annotate 1,699 samples**, finding 38.3% underspecified statements and 61.1% unfair tests — **68.3% of samples filtered out** — leaving a 500-task subset built *with* the original authors.
- **Lifecycle:** declared dead by OpenAI in **Feb 2026** ([Latent Space: "The End of SWE-Bench Verified"](https://www.latent.space/p/swe-bench-dead)): frontier models plateau ~80%, >60% of remaining failures are unsolvable tasks, and models can reproduce problem statements **verbatim from task IDs alone** (direct contamination evidence). OpenAI endorses Scale's SWE-bench Pro as successor; [SWE-rebench](https://arxiv.org/pdf/2602.23866) automates fresh task collection.
- **Lesson:** (a) real-artifact pipelines scale but import real-artifact noise; (b) adoption can be *given* to you by a third party's marketing; (c) a lab paying six figures to verify your benchmark is the strongest adoption signal there is — and even that buys only ~18 months of life.

### 5. Chatbot Arena / LMArena (2023) — grad-student side project to $1.7B company
- **Origin:** launched May 2023 by UC Berkeley's LMSYS group; [paper Mar 2024](https://arxiv.org/abs/2403.04132) (Wei-Lin Chiang, Lianmin Zheng, Ying Sheng, Anastasios Angelopoulos, … Ion Stoica) with 240k+ crowdsourced pairwise votes ranked via Bradley-Terry/Elo.
- **Adoption:** solved the "no ground truth for chat quality" problem with live human preference; became the de-facto public scoreboard labs raced on.
- **Lifecycle — not saturation but *capture*:** [The Leaderboard Illusion (Apr 2025)](https://arxiv.org/abs/2504.20879) (Cohere-led, 13 authors incl. Sara Hooker, Sayash Kapoor) documented undisclosed private variant testing (Meta tested ~27 Llama-4 variants pre-release), sampling asymmetries (Google+OpenAI ≈ 39.6% of all battles), and estimated up to 112% relative gains from arena-data access. Meanwhile the project [incorporated (Apr 2025) and raised a $100M seed at $600M](https://techcrunch.com/2025/05/21/lm-arena-the-organization-behind-popular-ai-leaderboards-lands-100m/) (a16z + UC Investments), then a [$150M Series A at $1.7B (Jan 2026)](https://techcrunch.com/2026/01/06/lmarena-lands-1-7b-valuation-four-months-after-launching-its-product/).
- **Lesson:** live human-preference platforms don't saturate — they get *gamed and monetized*. Operating a benchmark creates incentive entanglement with the labs being measured; the critique paper is now as canonical as the platform.

### 6. GAIA (2023) — design-principles benchmark for the agent era
- **Origin:** [arXiv Nov 2023](https://arxiv.org/abs/2311.12983). Six authors spanning Meta AI + Hugging Face (Mialon, Fourrier, Swift, Wolf, LeCun, Scialom). 466 hand-crafted questions, 300 held out for a leaderboard.
- **Design bet:** "conceptually simple for humans, hard for AIs" — humans 92% vs GPT-4+plugins 15%. Explicitly rejected the "ever-harder exam" trend.
- **Lifecycle:** top agents went 33%→65% during 2024 ([H2O.ai press](https://h2o.ai/company/press-releases/ai-is-only-30-away-from-matching-human-level-generalintelligence-on-gaia-benchmark/)) → ~75% pass@1 / 82% pass@3 by late 2025 ([JoyAgent report](https://arxiv.org/pdf/2510.00510)). Meta superseded it with [ARE + Gaia2 (Sep 2025)](https://arxiv.org/abs/2509.17158): 800 scenarios in simulated asynchronous environments testing ambiguity, temporal constraints, and multi-agent collaboration.
- **Lesson:** a small cross-org team (6 people) can define a whole category by articulating *design principles* rather than maximizing difficulty. Held-out answers + a Hugging Face leaderboard was the whole adoption machine.

### 7. ARC-AGI (2019→) — one person's definition of intelligence, weaponized by a prize
- **Origin:** François Chollet, solo, in ["On the Measure of Intelligence" (2019)](https://arcprize.org/arc-agi) — measures skill-acquisition efficiency on novel tasks with only core-knowledge priors. Ignored by the mainstream for ~4 years.
- **Adoption mechanism — a prize, not a paper:** [ARC Prize 2024](https://arxiv.org/abs/2412.04604) ($1M+, co-founded with Zapier's Mike Knoop) drew 1,400 teams / 17,000 submissions; the [ARC Prize Foundation](https://www.maginative.com/article/the-arc-prize-will-become-a-nonprofit-that-benchmarks-agi/) became a 501(c)(3) with Greg Kamradt as president. Used by OpenAI, Anthropic, GDM, xAI.
- **Lifecycle:** OpenAI's o3 broke ARC-AGI-1 in Dec 2024 — [75.7% at the $10k compute limit, 87.5% at 172× compute](https://arcprize.org/blog/oai-o3-pub-breakthrough) — making it the canonical "test-time compute changes everything" moment. [ARC-AGI-2 (2025)](https://arxiv.org/pdf/2505.11831) reset the field: Kaggle-track SOTA 24% at $0.20/task ([2025 results](https://arcprize.org/blog/arc-prize-2025-results-analysis), won by NVIDIA's NVARC with a 4B model + test-time training), while unconstrained frontier systems reportedly reach ~85% ([BenchLM aggregator](https://benchlm.ai/benchmarks/arcAgi2) ⚠️ unverified against arcprize.org; the efficiency-constrained grand prize remains unclaimed). [ARC-AGI-3 (2026)](https://arxiv.org/pdf/2603.24621) moved to interactive/agentic games.
- **Lesson:** longevity came from (a) a theory of what's being measured, (b) an efficiency-per-task cost axis, not just accuracy, and (c) versioning as explicit strategy. A prize converts a dataset into a movement.

### 8. FrontierMath (2024) — expert-sourced difficulty, and the funder-conflict cautionary tale
- **Origin:** [Epoch AI](https://epoch.ai/frontiermath) (nonprofit), lead mathematician Elliot Glazer; several hundred unpublished research-level problems written and peer-reviewed by professional mathematicians, organized in Tiers 1–4 + an Open Problems set. Contributors were paid roughly **$300–$1,000/problem** ([LessWrong postmortem](https://www.lesswrong.com/posts/8ZgLYwBmB3vLavjKE/some-lessons-from-the-openai-frontiermath-debacle)).
- **The scandal (Jan 2025):** OpenAI funded the benchmark and held exclusive access; contributing mathematicians weren't told; the Nov 2024 paper omitted the funding ([TechCrunch](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/)). Epoch's Tamay Besiroglu admitted a transparency "mistake" (NDA'd until o3's launch), and Epoch could not independently verify OpenAI's claimed o3 score at announcement time.
- **Lesson:** the *funding and access structure* of a benchmark is part of its validity. Data agreements, holdout access, and contributor disclosure are design decisions with reputational teeth.

### 9. Humanity's Last Exam (2025) — crowdsourcing at prize scale, and the error-rate bill
- **Origin:** [CAIS + Scale AI](https://scale.com/blog/humanitys-last-exam) (Hendrycks again); [paper](https://arxiv.org/abs/2501.14249) lists 1,100+ contributor-authors. Funnel: **70,000 submissions → 13,000 expert-reviewed → ~2,500 public + 500 private holdout**, incentivized by a **$500,000 pool** ($5k × top 50, $500 × next 500) plus co-authorship. Frontier models scored <10% at release.
- **Lifecycle:** [FutureHouse (2025)](https://www.futurehouse.org/research/hle-exam) found **29 ± 3.7% of text-only chem/bio answers contradicted by peer-reviewed literature** — root cause: reviewers were capped at ~5 minutes and not required to verify rationales. HLE's own follow-up conceded ~18% problematic in that subset ([The Decoder](https://the-decoder.com/nearly-29-percent-of-humanitys-last-exam-questions-are-wrong-or-misleading/)); third parties shipped fixes (FutureHouse's Bio/Chem Gold; [HLE-Verified, Feb 2026](https://arxiv.org/html/2602.13964v2)).
- **Lesson:** prize-crowdsourcing solves *sourcing* at scale but not *verification* — QA cost scales with question difficulty, precisely because only rare experts can check rare-expert questions. Third-party verification of famous benchmarks is now a publishable niche of its own.

### 10. RewardBench (2024) — first-mover on a component nobody was measuring
- **Origin:** [AI2, Mar 2024](https://arxiv.org/abs/2403.13787), led by Nathan Lambert; AI2 explicitly billed it as [the first benchmark & leaderboard for reward models](https://allenai.org/blog/rewardbench-the-first-benchmark-leaderboard-for-reward-models-used-in-rlhf-1d4d7d04a90b). Construction was cheap: repurposed prompt-chosen-rejected trios across chat/reasoning/safety with verifiable preference reasons.
- **Adoption:** instant default because it filled a vacuum — everyone trained RMs, nobody could compare them.
- **Lifecycle:** models overfit to it (artificial cues, brittleness under paraphrase); [RewardBench 2 (Jun 2025)](https://arxiv.org/abs/2506.01937) used *unseen human prompts* and lands ~20 points harder, with the stated caveat that RM benchmark scores don't guarantee downstream PPO performance ([Lambert's writeup](https://natolambert.substack.com/p/rewardbench-2-and-the-state-of-preference)).
- **Lesson:** the highest-leverage benchmark is often for an *internal component* of the training stack with zero existing measurement. First-mover on a component defines the category — and inherits the obligation to version it when it's gamed.

### 11. AgentDojo (2024) — PhD-led security benchmark designed as an environment, not a dataset
- **Origin:** [ETH Zurich SPY Lab, Jun 2024, NeurIPS 2024](https://arxiv.org/abs/2406.13352) — Edoardo Debenedetti (PhD student, first author) with Florian Tramèr's group. 97 realistic tasks + 629 security test cases across workspace/Slack/travel/e-banking environments, testing prompt-injection attacks and defenses.
- **Design bet:** an *extensible dynamic framework* (new attacks/defenses pluggable) rather than a static test set — explicitly built not to saturate the way static suites do.
- **Adoption:** standard reference for agent-security evaluations; vendor system cards now publish injection-resistance numbers in the same genre ([VentureBeat on Anthropic's published injection failure rates](https://venturebeat.com/security/prompt-injection-measurable-security-metric-one-ai-developer-publishes-numbers)). ⚠️ Whether official lab system cards run AgentDojo itself (vs. internal derivatives) was not verified in this pass.
- **Lesson:** in adversarial domains, ship the *arena* (attack/defense API) rather than the dataset — the benchmark stays alive as long as the arms race does. Also a clean example of a single PhD student defining a category benchmark.

### 12. τ-bench / τ²-bench (2024–25) — a company benchmark that the field adopted anyway
- **Origin:** [Sierra Research, Jun 2024](https://arxiv.org/abs/2406.12045) — four authors (Shunyu Yao, Noah Shinn, Pedram Razavi, Karthik Narasimhan). Tests agents interacting with *LLM-simulated users* under domain policies (retail, airline); introduced **pass^k** for reliability across repeated trials (GPT-4o <50% pass@1; retail pass^8 <25%).
- **Adoption:** despite the vendor origin (Sierra sells customer-service agents), the simulated-user + policy-compliance + reliability-metric design filled a real hole; [τ²-bench (2025)](https://github.com/sierra-research/tau2-bench) added telecom/voice/dual-control domains and is tracked by third parties like [Artificial Analysis](https://artificialanalysis.ai/evaluations/tau2-bench). ⚠️ Presence in specific frontier model cards not verified this pass.
- **Lesson:** a benchmark can encode a *metric innovation* (pass^k reliability) as its main contribution; simulated users make interaction evaluable at near-zero marginal cost, at the price of simulator-realism questions.

---

## Recurring success factors and failure modes

**Success factors (observed across ≥3 cases each):**
1. **Fill a measurement vacuum, not a difficulty gap.** RewardBench (RMs), τ-bench (user interaction/reliability), AgentDojo (injection), Chatbot Arena (chat preference) each measured something *nobody else measured* — none needed maximal difficulty to win.
2. **One scalar + a public leaderboard + a runnable harness.** MMLU, SWE-bench, GAIA, Arena all reduced to a single number with public infrastructure. Benchmarks without maintained harnesses don't get run.
3. **Small teams are the norm, not the exception.** Solo (Chollet), 2 PhD students (SWE-bench), 4 authors (τ-bench), 6 (GAIA, AgentDojo), 7 (MMLU) built the canon. Big-consortium construction (HLE's 1,000 contributors) bought scale but shipped the highest error rate in the set.
4. **Adoption is often exogenous.** Devin's marketing made SWE-bench famous; o3's announcement made ARC-AGI and FrontierMath famous; a lab paying to *verify* your benchmark (OpenAI × SWE-bench Verified) is peak validation. You can design for this (prize, held-out set labs must come to you for) but not fully control it.
5. **A theory of what's measured extends lifespan.** ARC-AGI (skill-acquisition efficiency) and GAIA (human-robustness principles) versioned gracefully; pure difficulty piles (MMLU) just saturated.
6. **Difficulty anchored to verified human baselines.** GPQA's expert-vs-nonexpert gap and GAIA's human 92% are what made their numbers interpretable.

**Failure modes (each killed or wounded at least one case):**
1. **Contamination** — SWE-bench models recite problem statements from task IDs ([Latent Space](https://www.latent.space/p/swe-bench-dead)); GSM8k overfitting up to 8% ([GSM1k](https://arxiv.org/abs/2405.00332)). Mitigations that worked: live refresh (LiveBench), private holdouts (GAIA, HLE, FrontierMath — which introduce access-politics of their own).
2. **Ceiling/saturation** — MMLU, HumanEval, GPQA-Diamond, SWE-bench Verified all hit it in 2–4 years. Effective half-life of a static frontier benchmark now looks like ~18–36 months.
3. **Construction error debt** — 6.5% (MMLU), >10% wrong ground truths (HumanEval), ~29% (HLE chem/bio), 68% task-quality failures (raw SWE-bench). Verification consistently lags release and is done by *third parties*.
4. **Gaming/capture** — Arena private-variant laundering ([Leaderboard Illusion](https://arxiv.org/abs/2504.20879)); RewardBench cue-exploitation. Preference platforms and static suites are both gameable, differently.
5. **Validity drift** — near saturation, remaining variance measures artifacts ("guessing how to name a function" — OpenAI on SWE-bench Verified), not capability.
6. **Funder/access conflicts** — FrontierMath's undisclosed OpenAI exclusivity; Arena's revenue relationship with evaluated labs.
7. **No statistical hygiene or maintenance plan** — [BetterBench](https://arxiv.org/abs/2411.12990) (Stanford, NeurIPS 2024) assessed 24 benchmarks against 46 practices: most don't report statistical significance and are hard to reproduce.

---

## Who does this work — orgs and notable individuals

| Org | What it does | Funding/type | Size | Hiring/collab |
|---|---|---|---|---|
| [Epoch AI](https://epoch.ai/about) | FrontierMath, capability data, benchmark audits (e.g. [GPQA audit](https://epochai.substack.com/p/gpqa-diamond-whats-left)), independent evals | Nonprofit, donor-funded (Open Philanthropy per [TechCrunch](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/)); also commissioned research | Multidisciplinary global team (size undisclosed) | Careers page; does commissioned evals for gov/nonprofits |
| [ARC Prize Foundation](https://arcprize.org/about) | ARC-AGI-1/2/3 benchmarks + annual $1M-class prize | 501(c)(3), donations ([donate page](https://arcprize.org/donate)) | Small (board: Chollet, Knoop, Kamradt) | Hiring + research-partnership sections on site |
| [LMArena](https://news.lmarena.ai/new-lmarena/) | Chatbot Arena leaderboards, human-preference eval | Company; $100M seed @$600M (a16z, UC Investments), [$150M A @$1.7B](https://techcrunch.com/2026/01/06/lmarena-lands-1-7b-valuation-four-months-after-launching-its-product/) | Startup (ex-Berkeley LMSYS) | Standard startup hiring |
| [Scale AI / SEAL labs](https://scale.com/blog/humanitys-last-exam) | HLE (with CAIS), GSM1k, SWE-bench Pro, private leaderboards | Company (data-annotation revenue) | Large company; SEAL is the research arm | Hires researchers; ran HLE's paid crowdsourcing |
| [CAIS](https://safe.ai/blog/humanitys-last-exam) | HLE co-creator; safety benchmarks (Hendrycks' org) | Nonprofit | Small-mid | Fellowships/collabs (⚠️ current programs not checked this pass) |
| [Ai2](https://allenai.org/blog/rewardbench-the-first-benchmark-leaderboard-for-reward-models-used-in-rlhf-1d4d7d04a90b) | RewardBench 1/2, open post-training (Tülu) | Nonprofit institute (Allen endowment) | Mid-size institute | Hires; very open-source-collaborative |
| Academic labs | Princeton NLP (SWE-bench; also the [Holistic Agent Leaderboard](https://arxiv.org/pdf/2510.11977)), NYU (GPQA, LiveBench), ETH SPY Lab (AgentDojo), TIGER-Lab Waterloo (MMLU-Pro), Berkeley (Arena origins), Stanford (BetterBench) | Academic grants | 1–8 person projects | PhD-student led; external collaborators common on all of these |
| [Hugging Face](https://arxiv.org/abs/2311.12983) | GAIA co-creator, hosts leaderboards, Open LLM Leaderboard | Company | Mid | Leaderboard hosting = de-facto collaboration channel |
| [Sierra Research](https://github.com/sierra-research/tau2-bench) | τ-bench/τ²-bench | Company (agent vendor) | Small research arm | Public leaderboard submissions |
| Frontier labs (OpenAI, Meta FAIR) | HumanEval; SWE-bench Verified (93 paid annotators); Gaia2/ARE | Company | Dedicated evals teams | OpenAI funded external benchmarks (FrontierMath) — with the conflicts noted above |

**Notable individuals:** Dan Hendrycks (MMLU→MATH→HLE; the single most prolific benchmark author, started as a student); François Chollet (solo → foundation); Nathan Lambert (RewardBench, writes openly about its flaws); Clémentine Fourrier (GAIA + HF leaderboards); David Rein (GPQA as PhD student); Carlos Jimenez & John Yang (SWE-bench as PhD students); Wei-Lin Chiang (Arena → LMArena CEO ⚠️ title unverified); Shunyu Yao (SWE-bench *and* τ-bench); Edoardo Debenedetti (AgentDojo as PhD student); Elliot Glazer (FrontierMath lead); Anka Reuel (BetterBench, PhD student); Sara Hooker (Leaderboard Illusion).

---

## Published exemplars (small-team-weighted)

1. **[GPQA](https://arxiv.org/abs/2311.12022)** — 8 authors, PhD-student-led (NYU). Landed because paid-expert construction + dual validation (expert 65–74% vs non-expert-with-Google 34%) made "Google-proof" a measurable property. The construction protocol is the reusable artifact.
2. **[SWE-bench](https://arxiv.org/abs/2310.06770)** — 2 Princeton PhD students leading 7 authors. Landed via real-artifact automation + executable verification + a third party's (Devin's) marketing moment. Its full arc (release → Verified → contaminated → formally retired Feb 2026) is the best-documented benchmark lifecycle on record.
3. **[EvalPlus](https://arxiv.org/abs/2305.01210)** — student-led audit (UIUC ⚠️ affiliation from memory) that changed model *rankings* by strengthening tests 80× — proof that auditing an existing benchmark is a high-impact, near-zero-cost contribution.
4. **[AgentDojo](https://arxiv.org/abs/2406.13352)** — 6 authors, PhD-student first author, NeurIPS 2024. Landed because it shipped an extensible attack/defense environment in a domain (agent security) with no incumbent.
5. **[τ-bench](https://arxiv.org/abs/2406.12045)** — 4 authors. Landed on a metric innovation (pass^k reliability) + simulated users; adopted despite vendor origin.
6. **[Chatbot Arena](https://arxiv.org/abs/2403.04132)** — grad-student project → default industry scoreboard → [$1.7B company](https://techcrunch.com/2026/01/06/lmarena-lands-1-7b-valuation-four-months-after-launching-its-product/); paired reading: [The Leaderboard Illusion](https://arxiv.org/abs/2504.20879).
7. **[BetterBench](https://arxiv.org/abs/2411.12990)** — 6 authors (Stanford). The meta-exemplar: a rubric + living repository assessing benchmarks themselves; NeurIPS spotlight.
8. **[GAIA](https://arxiv.org/abs/2311.12983)** — 6 authors across two orgs; principles-first design that named the agent-benchmark category.

---

## Where the gaps are — specific and named

1. **Benchmark verification has no standing infrastructure.** Every major audit was ad hoc and post hoc: MMLU-Redux (errors found 4 years post-release), EvalPlus, FutureHouse's HLE audit, OpenAI's paid SWE-bench annotation, [HLE-Verified](https://arxiv.org/html/2602.13964v2). [BetterBench](https://arxiv.org/abs/2411.12990) found most of 24 assessed benchmarks lack statistical significance reporting and reproducibility. Nobody runs continuous QA on live benchmarks; there is no equivalent of a "registered report" for benchmark releases. (Grounded in: BetterBench findings; FutureHouse's explicit root-cause — HLE reviewers capped at 5 minutes.)
2. **No funding or ownership model for maintenance.** SWE-bench needed OpenAI's money to get verified; HLE needed FutureHouse to volunteer corrections; LiveBench's monthly-refresh model requires a corporate sponsor (Abacus.AI). The lifecycle evidence says maintenance is *the* cost center, but grants fund construction, not upkeep. (Grounded in: [Latent Space/OpenAI retirement discussion](https://www.latent.space/p/swe-bench-dead); [LiveBench](https://arxiv.org/abs/2406.19314) refresh design.)
3. **Statistical reporting on agent benchmarks is absent where it matters most.** τ-bench showed pass^k collapses (pass^8 <25% where pass@1 ≈ 50%), yet most agent leaderboards still report single-run pass@1 without CIs; Princeton's [Holistic Agent Leaderboard](https://arxiv.org/pdf/2510.11977) calls standardized agent-eval infrastructure "missing." (Grounded in: τ-bench results; HAL paper title/framing.)
4. **Contamination checking is not a release norm.** GSM1k had to be built from scratch to demonstrate GSM8k overfitting; SWE-bench's verbatim-recall test was run only at retirement. Cheap canary/recall tests exist but aren't standard in benchmark papers or model cards. (Grounded in: [GSM1k](https://arxiv.org/abs/2405.00332); [SWE-bench retirement](https://www.latent.space/p/swe-bench-dead).)
5. **Conflict-of-interest structure is unregulated and recurring.** FrontierMath (funder = evaluated lab, undisclosed), Arena (revenue from evaluated labs, asymmetric access), vendor benchmarks (τ-bench, SWE-bench Pro by Scale which sells data services). The community response so far is one-off exposés, not disclosure norms. (Grounded in: [TechCrunch](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/), [Leaderboard Illusion](https://arxiv.org/abs/2504.20879), [LessWrong postmortem](https://www.lesswrong.com/posts/8ZgLYwBmB3vLavjKE/some-lessons-from-the-openai-frontiermath-debacle).)
6. **Independent verification of lab-reported scores is nearly nonexistent.** Epoch's [self-reported-GPQA check](https://epoch.ai/data-insights/self-reported-gpqa) is a rare positive example; Epoch itself couldn't verify OpenAI's o3 FrontierMath claim at announcement. (Grounded in both linked pages.)

---

## What we still don't know — ledger items

- **True construction costs.** Only fragments are public: HLE's $500k prize pool, FrontierMath's ~$300–1,000/problem, SWE-bench Verified's 93 annotators (dollar cost unpublished), GPQA's expert payments (total unpublished). ⚠️ We could not build a cost-per-validated-item table; a follow-up dig through paper appendices/acknowledgments could.
- **2026 SOTA numbers from aggregators are unverified**: ARC-AGI-2 "~85% frontier" ([BenchLM](https://benchlm.ai/benchmarks/arcAgi2)), GPQA "94.3% Gemini 3.1 Pro" ([DemandSphere](https://www.demandsphere.com/research/demandsphere-radar/ai-frontier-model-tracker/benchmarks/gpqa-diamond/)), MMLU "low 90s". Check against arcprize.org leaderboard and primary model cards before citing anywhere.
- **Adoption mechanics are inferred, not measured.** We infer leaderboard+harness+marketing-moment drives adoption from case narratives; a citation/usage-trajectory analysis (e.g., benchmark mentions in model cards over time) would test this. ⚠️ inference.
- **Whether AgentDojo/τ²-bench appear in official frontier model cards** (vs. internal derivatives) — unverified; check Anthropic/OpenAI system cards directly.
- **HLE current SOTA and whether the Feb 2026 paper revision incorporated error corrections** — unverified.
- **Coverage gaps in this brief:** METR's task suites, HELM, BIG-bench (the 400-author contrast case), OSWorld, Cybench, and LiveCodeBench were not case-studied; BIG-bench vs HLE would sharpen the "consortium vs small team" comparison.
- **Assumption to test:** that the ~18–36-month half-life generalizes to *narrow/domain* benchmarks (e.g., RAG-hallucination or judge benchmarks) rather than just frontier-capability exams — our own planning depends on this.

---

## Fit notes

The dominant pattern in this space — 1–4 person teams building category-defining benchmarks by combining a construction pipeline, a validation protocol, and a maintained harness — matches the researcher's existing stack: data-pipeline engineering maps to SWE-bench-style artifact mining, and the published LLM-as-judge/RAG-hallucination evaluation work is directly adjacent to the benchmark-verification genre (EvalPlus, MMLU-Redux, FutureHouse's HLE audit), which runs on laptop + API budgets well under $500/study. The recurring unfunded cost centers identified here (post-release QA, contamination checks, statistical reporting, maintenance) are precisely evaluation-methodology work rather than compute-heavy work. Both nonprofit (Epoch, ARC Prize Foundation, Ai2, CAIS) and company (LMArena, Scale, Sierra) structures demonstrably absorb or collaborate with independent benchmark researchers, and several canonical entries began as side projects of people with no institutional eval mandate.
