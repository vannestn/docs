# The Evaluation Field Map

*The program's definitive internal map of the AI evaluation/benchmarking ecosystem. Synthesized July 2026 from six research briefs (linked throughout); every factual claim traces to a brief, and through it to a primary source. ⚠️ flags from the briefs are preserved. Serves [00-goals-and-operating-principles.md](00-goals-and-operating-principles.md): this is the "map the field" stage — **no topic is chosen here**.*

**Source briefs:**
[01 Institutions & funding](briefs/eval-01-institutions-and-funding.md) ·
[02 Intellectual structure](briefs/eval-02-intellectual-structure.md) ·
[03 Benchmark case studies](briefs/eval-03-benchmark-case-studies.md) ·
[04 Methodology & standards](briefs/eval-04-methodology-and-standards.md) ·
[05 Career paths](briefs/eval-05-career-paths.md) ·
[06 Frontier & whitespace](briefs/eval-06-frontier-and-whitespace.md)

---

## 1. What this field is, and why it is unusually open to solo researchers

AI evaluation research in 2026 is two layers:

- **Layer A — building measurement instruments:** benchmarks, arenas, uplift trials, harnesses.
- **Layer B — "evaluation science":** studying the instruments themselves — validity, statistics, contamination, judge bias, cost, gaming. The founding text is Apollo Research's [We Need a Science of Evals](https://www.apolloresearch.ai/science/we-need-a-science-of-evals/) (Jan 2024); the agenda paper is [Toward an Evaluation Science for Generative AI](https://arxiv.org/abs/2503.05336) (Weidinger, Raji, Wallach et al., 2025). The B-layer got formal institutional recognition in 2026: the [NeurIPS track was renamed "Evaluations & Datasets"](https://blog.neurips.cc/2026/03/23/introducing-the-evaluations-datasets-track-at-neurips-2026/) explicitly because "evaluation itself becomes an object of scientific study." → [Brief 02](briefs/eval-02-intellectual-structure.md)

The openness claim is grounded, not hype. Four observable facts:

1. **The canon was built by tiny teams.** Solo (Chollet's ARC-AGI; Evan Miller's [Adding Error Bars to Evals](https://arxiv.org/abs/2411.00640)), 2 people (SWE-bench's PhD-student leads; Vending-Bench; Artificial Analysis), 3–8 (GPQA, τ-bench, GAIA, AgentDojo, BetterBench, HAL, MMLU). Consortium-scale construction (HLE's 1,100 contributors) shipped the *highest* error rate in the case-study set. → [Brief 03](briefs/eval-03-benchmark-case-studies.md)
2. **The B-layer's compute profile is laptop + API.** Its exemplars are statistics papers, audits of public data, literature reviews, and community databases — [metabench](https://arxiv.org/abs/2407.12844) ran IRT on public leaderboard results with no model training; the [SWE-Bench Illusion](https://arxiv.org/abs/2506.12286) used two cheap diagnostic probes. → [Briefs 02](briefs/eval-02-intellectual-structure.md), [06](briefs/eval-06-frontier-and-whitespace.md)
3. **Open, credited on-ramps exist at every tier:** harness PRs (EleutherAI, Inspect Evals) → data contributions with co-authorship (EvalEval shared task, CONDA contamination DB) → funded work (AISI bounty ⚠️ current-round status unverified, LTFF grants) → org hiring (METR, Apollo, AISI all hiring in 2026). → [Brief 01](briefs/eval-01-institutions-and-funding.md)
4. **The field itself says it's undersupplied** — its leaders publish named gap lists (§7) and the [EvalEval cost analysis](https://huggingface.co/blog/evaleval/eval-costs-bottleneck) argues eval costs are now the field's bottleneck.

Honest counterweights: the biggest career wins had institutional tailwinds (§6); survivorship bias is unquantified — no one publishes the base rate of benchmarks that change nothing; and the *running* of frontier agent evals is emphatically **not** cheap ($40k per HAL sweep) — solo economics work for auditing and analyzing others' results, not reproducing them.

---

## 2. The institutional landscape

Full org profiles, funding details, and the grant table: → [Brief 01](briefs/eval-01-institutions-and-funding.md).

The field has stratified into a distinctive three-tier economy (READ across brief-01 sources; synthesis inferred):

- **VC-scale money at the leaderboard/tooling end** — LMArena at [$1.7B](https://techcrunch.com/2026/01/06/lmarena-lands-1-7b-valuation-four-months-after-launching-its-product/), Braintrust, Patronus, LangSmith.
- **Government institutionalization in the middle** — UK AISI, US CAISI/NIST, EU AI Office.
- **An under-resourced science/commons layer** — HELM in maintenance mode (June 2026), HF Open LLM Leaderboard archived, METR's task bounty paused.

### The nonprofit pattern, made explicit

The most credible *independent* evaluators are nonprofits or grant-funded orgs, and the pattern is consistent enough to be a template:

| Org | Structure | Funding model | Notable |
|---|---|---|---|
| [METR](https://metr.org/about) | 501(c)(3) | Philanthropy (Audacious/RAND ~$17M of $38M, Schmidt Sciences, Packard, Longview) + **EU AI Office contract**; **no AI-company money** (free compute credits only) | ~40–50 staff (briefs vary); founded by one ex-OpenAI researcher (Beth Barnes) |
| [Epoch AI](https://epoch.ai/about) | Nonprofit | Open Philanthropy grants ($1.96M/$4.13M/$6.92M on their funding page) + commissioned work (Stanford AI Index, UK DSIT) + lab money (the FrontierMath/OpenAI controversy) | Founded 2022 by an ex–Open Phil contractor (Jaime Sevilla) |
| [Apollo Research](https://www.apolloresearch.ai/) | Fiscally sponsored 501(c)(3) → **Public Benefit Corp, Jan 2026** — converted explicitly to grow and diversify funding | Bootstrapped on EA-adjacent philanthropy (Rethink Priorities sponsorship, Manifund); post-PBC mix ⚠️ unverified | ~35–40+ staff; founded 2023 |
| [Palisade Research](https://palisaderesearch.org/about) | Nonprofit, 9 staff | Donations; SFF 1:1 match to $1.1M; **~7 months runway as of Dec 2025** | The live example of how thin this funding is |
| [EleutherAI](https://www.eleuther.ai/) | 501(c)(3) (grew out of a Discord) | Stability, HF, Canva, Open Phil, Mozilla, etc.; compute donated | Maintains lm-eval-harness, the de-facto open standard |
| [ARC Prize Foundation](https://arcprize.org/about) | 501(c)(3) formed 2025 around one person's benchmark | Donations + prize sponsors | Solo benchmark → foundation path |

The template: *small founding team → philanthropic grants (Open Phil/Coefficient, SFF, LTFF, Schmidt) → public artifact labs depend on → institutional form follows*. Fiscal sponsorship (Rethink Priorities for Apollo) and micro-regranting rails (Manifund, Open Collective) let individuals start without incorporating. The charter's nonprofit exit path (METR/Epoch/Apollo-shaped) is this exact documented pattern — though Palisade's runway and Apollo's PBC conversion show the funding is genuinely precarious, not a safe harbor.

### The rest of the map, compressed

- **Government:** [UK AISI](https://www.aisi.gov.uk/) (Inspect framework + Inspect Evals + a published research agenda naming open problems); [US CAISI](https://www.nist.gov/caisi) (40+ assessments, pre-deployment agreements with five frontier labs ⚠️ counts from secondary press; convenes the [International Network](https://www.nist.gov/news-events/news/2026/02/international-network-advanced-ai-measurement-evaluation-and-science)); [EU AI Office](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) — actively creating a **regulated market for third-party evaluators** (qualification-requirements workshop July 2026; capacity call operational by 2027).
- **Companies:** LMArena, Scale Labs/SEAL (Meta owns ~49% of Scale — independence question live), Hugging Face (lighteval, hosts EvalEval), Vals AI (vertical benchmarks), plus the observability layer (Braintrust, Langfuse→ClickHouse, LangSmith, Patronus).
- **Academic:** Stanford CRFM (HELM — maintenance mode), Princeton Kapoor/Narayanan (HAL; the most consistent B-layer group), Berkeley Sky Lab (BFCL; LMSYS origin), ETH SPY Lab, Oxford Internet Institute, NYU.
- **Coalitions/consortia:** [EvalEval](https://evalevalai.com/) (HF + Edinburgh + EleutherAI; Every Eval Ever, Evaluation Cards, ACL 2026 workshop with co-authorship-granting shared task); [MLCommons](https://mlcommons.org/ailuminate/) (AILuminate; working groups open to join).

**Funding for an independent:** LTFF ($20k–200k, explicitly funds independents without long track records), SFF (est. $20–40M in 2026; ~1-week Speculation Grants), Coefficient Giving (ex-Open Phil; $200k–2M first grants; its closed capability-evals RFP named eval-science gaps as funding priorities), Schmidt AI2050, NAIRR (compute ⚠️ independent eligibility unverified), Anthropic/OpenAI researcher API-credit programs, UK AISI bounty (⚠️ status unverified). Full table with caveats: → [Brief 01](briefs/eval-01-institutions-and-funding.md#the-grant-landscape-for-an-independent-eval-researcher).

---

## 3. The intellectual taxonomy

Ten sub-areas, with canonical work and maturity. Full treatment: → [Brief 02](briefs/eval-02-intellectual-structure.md).

| # | Sub-area | Canonical work | Maturity |
|---|---|---|---|
| 1 | Capability benchmarks (knowledge/reasoning/code/math) | [MMLU](https://arxiv.org/abs/2009.03300), [GPQA](https://arxiv.org/abs/2311.12022), [FrontierMath](https://arxiv.org/abs/2411.04872), [HLE](https://arxiv.org/abs/2501.14249) | Mature and saturating; building is solved, *interpretation* is not |
| 2 | Agentic evals | [SWE-bench](https://arxiv.org/abs/2310.06770), [OSWorld](https://arxiv.org/abs/2404.07972), [GAIA](https://arxiv.org/abs/2311.12983), [τ-bench](https://arxiv.org/abs/2406.12045), [GDPval](https://arxiv.org/abs/2510.04374) | Hottest area; methodology visibly immature — the [ABC audit](https://arxiv.org/abs/2507.02825) found flaws causing up to ~100% relative misestimation |
| 3 | Safety & dangerous-capability evals | [WMDP](https://arxiv.org/abs/2403.03218), [Cybench](https://arxiv.org/abs/2408.08926), [in-context scheming](https://arxiv.org/abs/2412.04984), [AI Control](https://arxiv.org/abs/2312.06942), [sandbagging](https://arxiv.org/abs/2406.07358) | Young, well-funded, methodologically contested (AISI's ["Lessons from a chimp"](https://www.aisi.gov.uk/category/science-of-evaluations) critique) |
| 4 | LLM-as-judge & meta-evaluation | [MT-Bench/Arena judge paper](https://arxiv.org/abs/2306.05685), [self-preference](https://arxiv.org/abs/2404.13076), [RewardBench 1](https://arxiv.org/abs/2403.13787)/[2](https://arxiv.org/abs/2506.01937), AISI's "Skewed Score" | Adolescent: heavily used in production, under-theorized |
| 5 | Contamination & saturation science | [GSM1k](https://arxiv.org/abs/2405.00332), [contamination survey](https://arxiv.org/abs/2502.14425), [SWE-Bench Illusion](https://arxiv.org/abs/2506.12286) | Diagnosis mature, treatment immature; cheap to contribute to |
| 6 | Dynamic/live benchmarks & arenas | [LiveBench](https://arxiv.org/abs/2406.19314), [LiveCodeBench](https://arxiv.org/abs/2403.07974), [Chatbot Arena](https://arxiv.org/abs/2403.04132) + [The Leaderboard Illusion](https://arxiv.org/abs/2504.20879) | Operationally mature, scientifically contested |
| 7 | Eval validity & psychometrics | [Everything-Benchmark critique](https://arxiv.org/abs/2111.15366), [measurement-theory position](https://arxiv.org/abs/2502.00561), [Error Bars](https://arxiv.org/abs/2411.00640), [metabench](https://arxiv.org/abs/2407.12844), [BetterBench](https://arxiv.org/abs/2411.12990) | Emerging fast; the field's theoretical core — arguably the best publication-per-dollar sub-area (brief-02 assessment) |
| 8 | Human-uplift & human-AI studies | [METR developer RCT](https://arxiv.org/abs/2507.09089) (19% *slower* with AI), [time-horizon metric](https://arxiv.org/abs/2503.14499), [bio-uplift RCT](https://arxiv.org/abs/2602.16703) | Most rigorous methods, tiny sample of studies; expensive (human subjects) |
| 9 | Red-teaming as evaluation | [Perez et al. 2022](https://arxiv.org/abs/2202.03286), [HarmBench](https://arxiv.org/abs/2402.04249), [StrongREJECT](https://arxiv.org/abs/2402.10260), [Petri](https://alignment.anthropic.com/2025/petri/) | Tooling consolidating; attack-success measurement still weak |
| 10 | Eval tooling & infrastructure | [Inspect](https://inspect.aisi.org.uk/), [lm-eval-harness + Lessons from the Trenches](https://arxiv.org/abs/2405.14782), [HELM](https://arxiv.org/abs/2211.09110), [HAL](https://arxiv.org/abs/2510.11977) | Mature engineering; Inspect becoming the de-facto safety-eval standard (inference); sustainability unsolved |

Cross-cutting observations from the briefs: sub-areas 4, 5, and 7 interlock (judge bias is a statistics problem; contamination is a validity problem) and together constitute most of the B-layer; sub-area 2 is where B-layer critique is landing hardest; and eval-awareness + sandbagging (in 3) threaten the validity of *every* behavioral eval — the [International AI Safety Report 2026](https://internationalaisafetyreport.org/publication/international-ai-safety-report-2026) now names this "evaluation gap" explicitly.

---

## 4. How benchmarks succeed and die

Distilled from 12 case studies (MMLU, HumanEval, GPQA, SWE-bench, Chatbot Arena, GAIA, ARC-AGI, FrontierMath, HLE, RewardBench, AgentDojo, τ-bench): → [Brief 03](briefs/eval-03-benchmark-case-studies.md).

**Success factors (each observed in ≥3 cases):**

1. **Fill a measurement vacuum, not a difficulty gap.** RewardBench (reward models), τ-bench (reliability/pass^k), AgentDojo (prompt injection), Arena (chat preference) each measured something nobody measured. None needed maximal difficulty.
2. **One scalar + public leaderboard + runnable harness.** Benchmarks without maintained harnesses don't get run.
3. **Small teams are the norm.** The canon is 1–8 authors; HLE's 1,100-contributor funnel bought scale but shipped ~18–29% bad chem/bio items ([FutureHouse audit](https://www.futurehouse.org/research/hle-exam)).
4. **Adoption is often exogenous** — Devin's marketing made SWE-bench famous; o3's announcement made ARC-AGI and FrontierMath famous. You can design for it (prize, private holdout labs must come to you for) but not control it.
5. **A theory of what's measured extends lifespan.** ARC-AGI and GAIA versioned gracefully; pure difficulty piles (MMLU) just saturated.
6. **Difficulty anchored to verified human baselines** makes numbers interpretable (GPQA's expert-vs-nonexpert gap; GAIA's human 92%).

**Failure modes (each killed or wounded at least one case):**

1. **Contamination** — SWE-bench models recite problem statements verbatim from task IDs ([retirement discussion](https://www.latent.space/p/swe-bench-dead)).
2. **Saturation** — effective half-life of a static frontier benchmark now looks like **~18–36 months** (⚠️ whether this generalizes to narrow/domain benchmarks is an untested assumption our own planning depends on — brief-03 ledger).
3. **Construction error debt** — ~6.5% of MMLU erroneous ([MMLU-Redux](https://arxiv.org/abs/2406.04127)); >10% of HumanEval ground truths wrong ([EvalPlus](https://arxiv.org/abs/2305.01210)); 68% of raw SWE-bench filtered by [OpenAI's Verified annotation](https://openai.com/index/introducing-swe-bench-verified/); FrontierMath [corrected errors in 42% of Tier-4 problems](https://epoch.ai/benchmarks/frontiermath-tier-4-v2) *after* it had shaped frontier narratives. Verification consistently lags release and is done by third parties.
4. **Gaming/capture** — Arena's private-variant testing and data asymmetry ([Leaderboard Illusion](https://arxiv.org/abs/2504.20879)); RewardBench cue-exploitation.
5. **Validity drift near saturation** — remaining variance measures artifacts, not capability.
6. **Funder/access conflicts** — FrontierMath's undisclosed OpenAI exclusivity ([TechCrunch](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/)); Arena's revenue from evaluated labs.
7. **No statistical hygiene or maintenance plan** — [BetterBench](https://arxiv.org/abs/2411.12990): most of 24 assessed benchmarks report no significance and resist replication.

**The meta-lesson the case studies keep repeating:** grants fund *construction*; nobody funds *maintenance, QA, and retirement* — yet the lifecycle evidence says that's the real cost center. Auditing an existing benchmark (EvalPlus, MMLU-Redux, GSM1k, the FutureHouse HLE audit) is a recognized, high-impact, near-zero-compute genre of its own.

---

## 5. The standards layer

Where eval methodology becomes something regulators can lean on: → [Brief 04](briefs/eval-04-methodology-and-standards.md).

- **US:** NIST/[CAISI](https://www.nist.gov/caisi) runs evals, the ARIA sociotechnical field-testing program, and the 10-member [International Network](https://www.nist.gov/news-events/news/2026/02/international-network-advanced-ai-measurement-evaluation-and-science), which published consensus areas on automated-evaluation practices (Feb 2026) — the clearest signal that eval best practices are becoming intergovernmental standards material (⚠️ the consensus doc itself not yet read — ledger item).
- **EU:** the [GPAI Code of Practice](https://code-of-practice.ai/) requires systemic-risk models to be evaluated for four named risks (CBRN, loss of control, cyber offense, harmful manipulation) via "benchmarks, red teaming, and human uplift studies"; Art. 101 enforcement begins **2 Aug 2026**. [CSET's read](https://cset.georgetown.edu/article/eu-ai-code-safety/): risk thresholds are "almost universally undefined" and under half of firms substantively test dangerous capabilities — **regulators now require evals that barely exist**. Harmonized standards (CEN-CENELEC JTC 21) slipped from Apr 2025 to ~Q4 2026. The AI Office is defining external-evaluator qualification requirements (workshop July 2026) — a regulated third-party-evaluator market with no agreed qualifications yet; whether individuals/micro-orgs can qualify is an open ledger question directly relevant to this program.
- **Consortium:** MLCommons [AILuminate](https://arxiv.org/abs/2503.05731) (12 hazards, single-turn only — multiturn/agentic named as future work) plus the Feb 2026 [Global Assurance Program](https://mlcommons.org/2026/02/ailuminate-global-assurance/); working groups open to join. ISO/IEC 42001 is a *management* standard — it doesn't say which evals to run (inferred).
- **De-facto standards are the tools:** Inspect (AISI; Apollo publicly adopted it), lm-eval-harness, Every Eval Ever's schema. Meanwhile HELM is in maintenance mode and OpenAI's Evals platform shuts down Nov 2026 — governance and sustainability of shared eval infrastructure is itself an unsolved standards question.

---

## 6. Documented career and impact paths

Full case table: → [Brief 05](briefs/eval-05-career-paths.md).

**The recurring mechanism:** ship a public artifact labs come to depend on (benchmark, leaderboard, harness, or critique) → the institutional form (hire / nonprofit / startup) follows the dependence.

Documented conversions, one per path shape:

| Path | Case | Arc |
|---|---|---|
| Student benchmark → industry standard | Jimenez & Yang, [SWE-bench](https://arxiv.org/abs/2310.06770) | Princeton students → OpenAI co-built Verified with them → 2M+ downloads |
| Side project → company | Chiang & Angelopoulos, Chatbot Arena | Berkeley PhD side project → [LMArena, $1.7B](https://techcrunch.com/2026/01/06/lmarena-lands-1-7b-valuation-four-months-after-launching-its-product/) |
| Lab researcher → eval nonprofit | Beth Barnes → [METR](https://metr.org/about); Marius Hobbhahn → Apollo | Philanthropic grants, no VC |
| Independent analyst → org founder | Jaime Sevilla → [Epoch AI](https://epoch.ai/about) | Open Phil contractor → data nonprofit |
| Solo/no-institution benchmark → lab role | Aidan McLaughlin, [AidanBench](https://github.com/aidanmclaughlin/AidanBench) → OpenAI | ⚠️ causal link is inference; timeline consistent, no source states it |
| 2-person weird eval → frontier-lab partner | Andon Labs, [Vending-Bench](https://arxiv.org/abs/2502.15840) → Anthropic's [Project Vend](https://www.anthropic.com/research/project-vend-1) | Clearest recent "small team ships eval → lab comes to them" |
| Critique/meta-science → reputation & policy influence | Kapoor & Narayanan (AI Snake Oil, HAL, TIME100); Reuel (BetterBench → Stanford HAI policy brief) | No benchmark ownership required |
| Two people publishing rigorous numbers → industry infrastructure | [Artificial Analysis](https://pitchbook.com/profiles/company/680302-90) (~20 staff by late 2025) | Started on a $250k grant ⚠️ wiki source |

**Part-time/remote on-ramps documented as real:** Epoch's contract analyst roles (5–15 hrs/week, remote), AISI's Inspect open-source surface (job specs list Inspect experience as a qualifying skill — public PRs are a legible credential), EvalEval shared tasks (co-authorship), CONDA's PR-based contamination DB, ARC Prize Kaggle, and (historically) METR's $300/hr task bounty, which METR stated was a hiring pipeline — currently paused.

**Survivorship-bias caveat (from brief 05, verbatim in spirit — read before imitating anyone above):**
- Every case is a winner; **there is no denominator.** Hundreds of benchmarks ship yearly; almost none change careers. Nothing read quantifies the base rate.
- The biggest wins had **institutional tailwinds** (Princeton, Berkeley, Stoica's network, Epoch's lab relationships). Hendrycks and Chollet had standing *before* their benchmarks were famous. The solo counter-examples (AidanBench, Artificial Analysis, Andon) all paired the artifact with **relentless public distribution**.
- Eval fame carries **reputational tail risk**: the FrontierMath scandal and the Leaderboard Illusion landed on the *eval builders*, not just the labs.

---

## 7. The named gaps

Consolidated from all six briefs; deduplicated; each with its citable source (the source *complaining about the gap*, per brief 06's method). Deep versions: → [Brief 06](briefs/eval-06-frontier-and-whitespace.md) (20 gaps in 4 groups), plus the gap sections of [01](briefs/eval-01-institutions-and-funding.md), [02](briefs/eval-02-intellectual-structure.md), [03](briefs/eval-03-benchmark-case-studies.md), [04](briefs/eval-04-methodology-and-standards.md).

**Measurement science**
1. **No consensus methods; evals "not yet resistant to scrutiny"** — [Apollo, We Need a Science of Evals](https://www.apolloresearch.ai/science/we-need-a-science-of-evals/); [UK AISI research agenda](https://www.aisi.gov.uk/research-agenda).
2. **Statistical malpractice is the norm; the fix exists but isn't adopted** — [Miller 2024](https://arxiv.org/abs/2411.00640) (clustered SEs >3× naive) vs. [BetterBench](https://arxiv.org/abs/2411.12990) and [Measuring what Matters](https://arxiv.org/abs/2511.04703) (445 benchmarks: near-absence of statistical tests). The adoption gap itself is unaudited — a publishable audit (brief-06 ledger). ⚠️ Whether Inspect/lm-eval now ship Miller-style SEs by default is unchecked; if absent, a contribution target (brief-04 ledger).
3. **Construct validity asserted, not established** — [Raji et al. 2021](https://arxiv.org/abs/2111.15366); [Wallach et al.](https://arxiv.org/abs/2502.00561); no benchmark ships with a validity argument; no standard for one exists.
4. **Predictive validity untested** — Apollo's own [negative result](https://www.apolloresearch.ai/blog/research-note-our-scheming-precursor-evals-had-limited-predictive-power-for-our-in-context-scheming-evals/): precursor evals didn't predict scheming evals; AISI names "capability prediction models" as open.
5. **Eval incentives shape model pathologies** — [OpenAI, Why Language Models Hallucinate](https://arxiv.org/abs/2509.04664): binary grading rewards guessing over calibrated IDK; adoption of IDK-rewarding scoring ⚠️ unmeasured.

**Benchmark quality control & lifecycle**
6. **No standing benchmark-verification infrastructure** — every major audit (EvalPlus, MMLU-Redux, FutureHouse/HLE, GSM1k) was ad hoc and post hoc; grounded in [BetterBench](https://arxiv.org/abs/2411.12990) and FutureHouse's root-cause finding (HLE reviewers capped at ~5 min).
7. **No funding/ownership model for maintenance** — SWE-bench needed OpenAI's money to get verified; [Latent Space retirement discussion](https://www.latent.space/p/swe-bench-dead); LiveBench's refresh needs a corporate sponsor.
8. **Contamination detection fails where it matters** (closed models, paraphrase/cross-lingual leakage) and isn't a release norm — [survey 2502.14425](https://arxiv.org/abs/2502.14425); [GSM1k](https://arxiv.org/abs/2405.00332); [SWE-Bench Illusion](https://arxiv.org/abs/2506.12286).
9. **Saturation/lifecycle science is brand new** — systematic studies only appeared late 2025–2026 ([plateau study](https://arxiv.org/abs/2602.16763), [Benchmark Health Index](https://arxiv.org/pdf/2602.11674)); retirement criteria are wide open and data-analysis-shaped.

**Judges, agents, and validity in the wild**
10. **Judge/meta-evaluation under-theorized relative to production usage** — [Zheng et al.](https://arxiv.org/abs/2306.05685); [self-preference](https://arxiv.org/abs/2404.13076); AISI's Skewed Score; [criteria drift](https://arxiv.org/abs/2404.12272) makes static judge rubrics theoretically unsound with no settled fix; judge evals lack calibrated error reporting ([Nov 2025](https://arxiv.org/pdf/2511.21140)). Domain-specific judge validity (e.g., hallucination detection) mostly unmapped; no StrongREJECT-style meta-evaluation found for hallucination judges (brief-02 ledger — a genuine open-niche check).
11. **Agent benchmarks systematically broken; cost/reliability unreported** — [ABC audit](https://arxiv.org/abs/2507.02825) (~100% relative misestimation); [AI Agents That Matter](https://arxiv.org/abs/2407.01502); [HAL](https://arxiv.org/abs/2510.11977); [EvalEval](https://evalevalai.com/research/2026/04/29/eval-costs-bottleneck/) (60% single-run → 25% under 8-run consistency).
12. **The "evaluation gap": scores don't predict deployment** — [International AI Safety Report 2026](https://internationalaisafetyreport.org/publication/international-ai-safety-report-2026); [Weidinger et al.](https://arxiv.org/abs/2503.05336) lesson #1.
13. **Eval-awareness and sandbagging undermine everything behavioral** — [Needham et al.](https://arxiv.org/abs/2505.23836) (AUC 0.83 at detecting eval contexts); [van der Weij et al.](https://arxiv.org/abs/2406.07358); no accepted correction protocol.
14. **Vertical/regulated-domain evals: huge headroom, almost no independent coverage** — Vals AI's [Finance Agent Benchmark](https://arxiv.org/pdf/2508.00828) (best model 46.8%); the [medical-benchmark position paper](https://arxiv.org/abs/2503.10694). Multi-turn/agentic safety is officially a hole ([AILuminate's own limits](https://arxiv.org/abs/2503.05731)).

**Ecosystem, economics, governance**
15. **Eval cost is the new access barrier and concentrates power** — [EvalEval cost analysis](https://huggingface.co/blog/evaleval/eval-costs-bottleneck): $40k/HAL sweep; "whoever can pay for the evaluation gets to write the leaderboard"; named tractable problems incl. benchmark compression for agent evals (static compresses 100–200×, agentic only 2–3.5×).
16. **Leaderboard governance / auditing the evaluators is nearly unoccupied** — [The Leaderboard Illusion](https://arxiv.org/abs/2504.20879); the main arena is a $1.7B company selling private evals to the labs it ranks.
17. **Funder-conflict and disclosure norms unwritten** — FrontierMath/OpenAI ([TechCrunch](https://techcrunch.com/2025/01/19/ai-benchmarking-organization-criticized-for-waiting-to-disclose-funding-from-openai/), [LessWrong postmortem](https://www.lesswrong.com/posts/8ZgLYwBmB3vLavjKE/some-lessons-from-the-openai-frontiermath-debacle)); Scale/Meta; [Evaluation Cards](https://huggingface.co/blog/evaleval/evaluation-cards-launch) is an early attempt.
18. **Independent verification of lab-reported scores nearly nonexistent** — Epoch's [self-reported-GPQA check](https://epoch.ai/data-insights/self-reported-gpqa) is the rare positive example; Epoch couldn't verify OpenAI's o3 FrontierMath claim at announcement.
19. **No legal safe harbor for independent testing** — [Longpre et al.](https://arxiv.org/abs/2403.04893); Anthropic's [third-party-testing post](https://www.anthropic.com/news/third-party-testing) concedes the needed regime doesn't exist.
20. **Results don't accumulate** — [Every Eval Ever](https://arxiv.org/abs/2606.14516): results scattered across 31 incompatible formats; frameworks give divergent scores for nominally identical evals ([Lessons from the Trenches](https://arxiv.org/abs/2405.14782)).
21. **Commons sustainability** — HELM maintenance mode, Open LLM Leaderboard archived, METR bounty paused (READ on all three; synthesis inferred); Open Phil's closed [capability-evals RFP](https://www.openphilanthropy.org/request-for-proposals-improving-capability-evaluations/) named GCR-benchmark supply, eval science, and third-party access as funding gaps.
22. **Human-uplift studies too few and small to settle anything** — [bio RCT n=153](https://arxiv.org/abs/2602.16703); METR's developer RCT; null results may be power-limited.

Every gap above must still survive this program's own prior-work check before being treated as a topic candidate (charter principle 2). Open ⚠️ items feeding [03-knowledge-gaps-and-assumptions-ledger.md](03-knowledge-gaps-and-assumptions-ledger.md) are listed in each brief's "What we still don't know" section.

---

## 8. Implications for this program

Facts and options only — **no topic is chosen here** (that is [04-topic-selection-process.md](04-topic-selection-process.md)'s job, after pilots in 2–3 fields per the charter).

**Facts this map establishes:**

- The B-layer (evaluation science) matches this program's constraints as documented: its exemplar papers are 1–6 authors, laptop + API scale, and several ran purely on public data. The A-layer's agent-eval end does not (multi-$10k sweeps) — solo economics favor auditing/analyzing others' results over running frontier sweeps.
- The researcher's published LLM-as-judge/RAG-hallucination work sits inside sub-area 4 (judge meta-evaluation), which all six briefs independently flag as adjacent to named, sourced gaps (#2, #10 above) — including one specific unoccupied niche check (no StrongREJECT-analog for hallucination judges found).
- The charter's three exit paths all have multiple documented precedents in this field (§6), with a quantified survivorship caveat and evidence that public distribution was load-bearing in every solo success.
- The nonprofit route named in the charter is the field's dominant credible-independence structure (§2), *and* its funding is demonstrably thin (Palisade's 7-month runway, Apollo's PBC conversion, the commons in maintenance mode).
- Institutional demand for independent evaluators is being created by regulation on a knowable clock: EU CoP enforcement Aug 2026, evaluator-qualification criteria being drafted now, EU capacity call operational by 2027, NIST consensus practices published Feb 2026.
- Low-friction, credit-bearing entry points exist today and are enumerated (EvalEval shared task → co-authorship; CONDA PRs; Inspect/lm-eval PRs; Epoch part-time contracting; NeurIPS Evaluations & Datasets track as a venue).

**Option classes the map surfaces (candidates for cheap pilots, not commitments):**

1. **Meta-evaluation of judges** — extend the published judge work toward the named statistics/calibration gaps (#2, #10).
2. **Benchmark forensics/auditing** — the EvalPlus/GSM1k/SWE-Bench-Illusion genre; no standing infrastructure exists (#6, #8).
3. **Lifecycle/saturation analysis** — brand-new, data-analysis-shaped, matches classical-ML skills (#9).
4. **Cost/reliability analysis of public rollout data** — EvalEval names the problems and provides free data (#11, #15).
5. **Adoption audits** — measure whether the field's published fixes (error bars, ABC checklist, IDK scoring) are actually used; flagged as publishable and unclaimed (#2, #5).
6. **Auditing the evaluators / governance** — Leaderboard-Illusion-style work; nearly unoccupied but carries the documented reputational tail risk (#16–18).
7. **Standards-adjacent contribution** — working groups (MLCommons, EvalEval, national bodies) as a low-barrier seat at the table while the evaluator-qualification question resolves (§5).

**What must happen before any choice:** per the charter, (a) the prior-work check on any gap pursued, (b) the ledger items from all six briefs get triaged into [03](03-knowledge-gaps-and-assumptions-ledger.md) — the highest-stakes unknowns for this program being EU evaluator-qualification criteria for individuals, the half-life assumption for narrow benchmarks, whether harnesses already ship the statistics fixes, and EvalEval's actual co-authorship mechanics — and (c) this field is weighed against the other candidate fields in [02-candidate-research-fields.md](02-candidate-research-fields.md), which this map deliberately does not do.
