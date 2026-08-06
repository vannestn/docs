# The Stamp Score: Measuring Review Depth on AI-Generated Pull Requests and Validating It Against Revert History
*Target venue: a software-engineering / human-AI workshop or short-paper track (MSR, an ICSE/EASE workshop, or CSCW-adjacent) · arXiv preprint · Draft — Introduction & Methods only*

## Abstract

Autonomous coding agents now open a large and growing share of pull requests (PRs) on public repositories, and the human review step is increasingly the only safeguard between agent output and the main branch. A growing body of evidence suggests that this safeguard is eroding: as reviewers see more agent PRs, approval rates rise and the depth of their scrutiny falls. Existing measurements of this decay rely on shallow proxies — approval rate, review latency, and raw comment counts — that cannot distinguish a genuine "I checked this and here is why it is wrong" from a rubber-stamped "looks good," and, critically, are never validated against whether the reviewed code actually turned out to be defective. We propose the **Stamp Score**, an LLM-judged rubric that scores each human review for review depth, with *whether the reviewer articulated why the AI's change is wrong* as the headline, hard-to-fake feature. We then validate the score against a free, retroactive ground-truth signal that every repository already records: whether a merged PR was subsequently reverted or hot-fixed. Our central hypothesis is that low review depth predicts a higher subsequent revert/hotfix rate, after controlling for PR size, author, and file churn. Using the public AIDev corpus of agent-generated PRs, we estimate this association with logistic regression and confidence intervals. We pre-register both a positive-result bar and a kill condition; a null (review depth does not predict escaped defects) is itself a reportable contribution. The expected contribution is a validated, reproducible, subject-free instrument for measuring oversight quality on AI-generated code.

## 1. Introduction

Autonomous coding agents have moved from demonstrations to daily practice. Recent large-scale measurement of public GitHub activity finds hundreds of thousands of pull requests authored by agents such as OpenAI Codex, Devin, GitHub Copilot, Cursor, and Claude Code across tens of thousands of repositories [1, 2]. In this regime, the human code review is often the last and only checkpoint between machine-written code and a project's main branch. The reliability of that checkpoint therefore matters directly for software quality, yet it is exactly the step most exposed to automation-induced complacency.

The concern is not hypothetical. A longitudinal study of human review of AI-agent code reports that, as reviewers accumulate exposure to agent PRs, approval rates rise while indicators of scrutiny — such as inline comment density — decline, a pattern the authors term *habituation at the gate* [3]. Complementary work documents that AI now produces code faster than humans can meaningfully review it, straining the review process under enterprise "review-more" mandates [4], and a randomized controlled trial found that experienced developers were measurably slower with AI assistance even as they believed themselves faster — consistent with the effort of vetting plausible-but-imperfect output being systematically underestimated [5]. Together these findings suggest that "a human approved it" is becoming a weaker guarantee precisely as we lean on it more heavily.

The specific problem we address is one of measurement. To manage oversight decay, one must first measure it, and current instruments are inadequate in two related ways. First, they proxy scrutiny with surface-level counts — approval rate, time-to-approval, number of comments [3] — which conflate genuine critical engagement with cheap activity. A reviewer can leave several comments without ever confronting a defect, and a single sentence explaining *why a change is incorrect* can carry more scrutiny than a dozen stylistic nits. Second, and more fundamentally, these proxies are never validated against an outcome. It is asserted, but not shown, that shallower review corresponds to worse code slipping through. Without an outcome anchor, a scrutiny metric is only a description of reviewer behavior, not evidence that the behavior matters.

Prior work is insufficient on exactly these axes. *Habituation at the Gate* [3] establishes the phenomenon on the public AIDev corpus but measures scrutiny only through approval and comment-count proxies, defines no depth rubric, and — by the authors' own account — does not validate scrutiny against downstream defects. Comment-type analyses of AI-generated PRs [6] classify review remarks by coarse function (e.g., steering vs. evaluative) but stop short of a graded depth measure and again do not link review behavior to outcomes. Automated review-quality metrics such as CRScore [7] ground the scoring of review *comments* in code claims and static-analysis smells, but they are designed to evaluate machine-generated reviews against human judgment, not to detect human rubber-stamping, and they are validated against human ratings rather than realized defects. Finally, the general LLM-as-judge literature [8] provides the machinery for rubric-based scoring but says nothing about the validity of such a rubric as a predictor of software defects. The gap that remains is a review-depth metric whose central feature captures *stated disagreement with the AI* and that is validated against a free, reality-anchored outcome.

Our key methodological move is to supply that outcome from an artifact every repository already maintains: version-control history. A merge that is later reverted, or urgently patched by a hotfix, is a retrospective, unpaid, reality-labeled signal that something merged should not have been. Reverts are admittedly noisy — many are feature rollbacks, dependency changes, or unblocking maneuvers rather than defects [3] — so we treat the association between review depth and reverts as an empirical question to be estimated with explicit uncertainty and confound control, not as a definitional truth. This design lets us test whether a depth metric has predictive validity *without* any human-subjects experiment, IRB approval, or paid labeling at scale, which is what makes the study feasible for an independent, budget-constrained researcher.

We make the following contributions:

1. **The Stamp Score**, an LLM-judged review-depth rubric for reviews of AI-generated PRs, whose headline, difficult-to-fabricate component is *whether the reviewer explicitly states why the AI's change is wrong* (alongside citing a specific line, raising a counter-argument, and proposing an alternative).
2. **A revert-validated evaluation protocol** that uses merge-then-revert and hotfix history as a free, retroactive ground-truth signal for whether shallow review lets defects through, requiring no human subjects.
3. **A pre-registered predictive test** of the hypothesis that low review depth predicts higher subsequent revert/hotfix rate on the public AIDev corpus, estimated by logistic regression with confidence intervals and controls for PR size, author, and file churn, together with an explicit kill criterion under which we report and publish the null.

We deliberately frame the primary claim as a validity test rather than a foregone conclusion: the study is designed so that both a significant depth-to-revert association and its absence are informative and publishable.

## 2. Methods

### 2.1 Data and materials

Our primary data source is the public **AIDev** corpus, a large-scale dataset of pull requests authored by autonomous coding agents on GitHub [1, 2]. AIDev aggregates on the order of 4.5 × 10⁵ agent-generated PRs across roughly 6 × 10⁴ repositories, with a curated higher-signal subset (repositories above a star threshold) that includes review comments, reviews, commits, and linked issues — the fields our method requires. We use this curated subset because our unit of analysis (a human review artifact attached to a merged agent PR) depends on the presence of review text and merge/commit metadata.

**Sample construction.** From the curated subset we select repositories with (a) a nontrivial volume of merged agent PRs, (b) publicly available commit history sufficient to detect reverts and hotfixes, and (c) a permissive license or public-data terms consistent with research reuse; we record each repository's license. We restrict to a small number of repositories (target: 3–5) chosen to maximize merged-PR volume while keeping the corpus mineable by a single researcher, and we report exact repository identifiers, the data-collection date, and the AIDev snapshot version so the sample is reconstructable. The analysis unit is a **merged agent-authored PR** that received at least one human review; for each such PR we retain (i) the full text of every human review and review comment, (ii) diff statistics (lines added/deleted, files touched), (iii) the reviewer identity (pseudonymous GitHub handle), and (iv) the merge commit and subsequent commit history needed to detect reverts/hotfixes. PRs authored by bots other than the coding agent, and PRs with no human review, are excluded and counted in a data-flow diagram.

No personal data beyond public GitHub handles is used, and no human subjects are recruited; the study is observational over already-public artifacts and requires no IRB review.

### 2.2 The Stamp Score

Let a merged PR *p* have an ordered set of human review artifacts *R(p) = {r₁, …, rₖ}*, where each *rᵢ* is a review body or review comment together with its anchored diff context. An LLM judge *J* scores each artifact on a small rubric of binary depth features. We define the following features, chosen so that each requires evidence of engagement with the specific change rather than generic approval:

- *f_line(rᵢ)*: the review cites or is anchored to a specific line, symbol, or code location.
- *f_counter(rᵢ)*: the review raises a substantive counter-argument or identifies a concrete problem with the change (not a style preference).
- *f_alt(rᵢ)*: the review proposes a concrete alternative implementation, value, or approach.
- *f_wrong(rᵢ)* (**headline feature**): the review explicitly states *why the AI's change is incorrect, unsafe, or inadequate* — i.e., articulated disagreement with the agent's output, with a reason.

Each feature is elicited as a JSON verdict with a short justifying quote from the review text, which grounds the judgment and supports auditing. We define a per-artifact depth score and aggregate to the PR level. The per-PR **Stamp Score** is

    S(p) = w_line · 1[∃i f_line(rᵢ)] + w_counter · 1[∃i f_counter(rᵢ)]
         + w_alt · 1[∃i f_alt(rᵢ)] + w_wrong · 1[∃i f_wrong(rᵢ)],

where the indicators are taken over all review artifacts on *p* (a PR "counts" a feature if any of its reviews exhibit it) and the weights *w* are fixed in advance. Our pre-registered default weights the headline feature most heavily (w_wrong = 2, others = 1), and we additionally report the binary headline indicator D_wrong(p) = 1[∃i f_wrong(rᵢ)] on its own, because it is the least gameable and the primary quantity of interest. To probe robustness we also report an equal-weight variant and the raw feature vector.

**Assumptions.** (A1) The four features are recoverable from review text with acceptable reliability by an LLM judge; we test this directly in §2.5. (A2) The headline feature *f_wrong* is harder to satisfy vacuously than comment count is, because it demands a stated reason tied to the change; this is a design assumption, not a claim of unforgeability. (A3) Depth expressed in any single review generalizes to the PR — encoded by the existential aggregation — which we treat as a modeling choice and test against a count-based aggregation in a sensitivity analysis.

### 2.3 Baselines and comparators

We compare the Stamp Score against the shallow proxies used in prior work so that any added predictive value is attributable to depth rather than to activity. The comparators, computed on the identical PR sample, are:

- **Approval-only**: whether the PR was approved, ignoring content [3].
- **Comment count**: number of human review comments on the PR [3].
- **Review latency**: time from PR ready-for-review to approval/merge [3].
- **Comment-type mix**: the distribution of coarse comment functions (e.g., steering vs. evaluative) following comment-type classification of AI-PR reviews [6].
- **CRScore-style comment quality**: a reference-free review-comment quality score grounded in code claims/smells [7], included as a strong non-rubric quality baseline.

The Stamp Score's incremental contribution is assessed by whether it predicts reverts *beyond* these baselines (§2.6).

### 2.4 Metrics

**Outcome (ground truth).** For each merged PR *p* we define a binary label *y(p) = 1* if the merge was subsequently **reverted or hot-fixed** within a fixed observation window, else 0. Detection combines (i) explicit revert commits (git's `Revert "…"` convention and commits that revert the merge commit), and (ii) hotfix signals: a follow-up commit or PR touching the same files within a short window and matching hotfix/patch conventions (labels, branch names, or commit-message patterns). Every detection rule is specified in advance and released as code. Because reverts are noisy, we report the base rate of *y* and a manual audit of a random sample of positives (§2.5) to estimate how many revert/hotfix events are plausibly defect-driven versus non-defect (feature rollbacks, dependency bumps).

**Judge reliability.** Agreement between the LLM judge and human labels on each feature is reported as Cohen's κ and raw percent agreement (§2.5).

**Predictive metrics.** For the primary hypothesis we report, for the Stamp Score and each baseline, the logistic-regression coefficient on the depth term with a 95% confidence interval, the odds ratio, and out-of-sample discrimination (AUC) under grouped cross-validation by repository. "Success" for the predictive claim is defined quantitatively in §2.7.

### 2.5 Human validation and labeling

Human labels are required for two limited purposes, both within a solo researcher's ~4–7 hour manual budget plus a small optional paid-annotation allowance.

**(1) Judge validation.** The author manually labels the four depth features on a stratified random sample of review artifacts (target: ~150–200 artifacts, stratified so that likely-shallow and likely-deep reviews are both represented). The labeling task, stated plainly: *read the review and its diff context, and mark for each feature whether the review does that thing (cites a specific line; raises a substantive problem; proposes an alternative; states why the AI is wrong).* The expertise required is ordinary software-engineering code-review literacy — enough to tell a substantive objection from a style nit — which the author possesses; no specialized domain knowledge is needed. These labels are compared to the LLM judge to establish reliability (§2.4). If a paid-annotation micro-budget is used, a second annotator labels an overlap subset to report inter-human agreement as a ceiling on achievable judge agreement.

**(2) Revert-label audit.** The author manually inspects a random sample of detected revert/hotfix events (target: ~50) and classifies each as plausibly defect-driven or not (feature rollback, dependency change, unrelated churn). This audit does not produce the analysis labels — those come for free from git history — but it quantifies the noise in the outcome and is reported as a limitation and, if warranted, as a sensitivity restriction to defect-plausible reverts.

Crucially, no labels are needed for the outcome variable at scale: the revert/hotfix signal is sourced entirely from existing version-control data, which is what keeps the study within budget.

### 2.6 Statistical analysis

The primary model is a logistic regression of the revert/hotfix outcome on review depth with confound controls:

    logit Pr(y(p) = 1) = β₀ + β₁ · depth(p) + βᵀ · controls(p),

where *depth(p)* is, in the primary specification, the headline indicator *D_wrong(p)* (and, in secondary specifications, the full Stamp Score *S(p)* and each baseline). The controls are the confounds named in the study design: **PR size** (log lines changed), **file churn** (number of files touched and, where available, historical churn of those files), and **author** (agent identity and, where estimable, a reviewer effect). We include repository as a grouping factor via clustered standard errors or a repository random intercept (mixed-effects logistic regression) to account for between-repository heterogeneity in both review culture and revert conventions. The hypothesized effect is *β₁ < 0*: greater depth, lower revert odds.

**Uncertainty.** All effects are reported with 95% confidence intervals; where the mixed model is used we report profile or cluster-robust intervals. To assess incremental value we compare nested models (controls only vs. controls + depth) by likelihood-ratio test and by change in out-of-sample AUC under repository-grouped cross-validation, so that predictive credit is not leaked across repositories.

**Power and sample size.** The binding constraint is the positive class: defect-driven reverts are rare. Before committing to the confirmatory test we conduct a blinded feasibility count of *y = 1* events in the assembled corpus and a power analysis for a logistic coefficient given that event count, the observed prevalence of *D_wrong*, and the expected control correlations. If the corpus cannot support ≥80% power to detect a pre-specified minimum effect (an odds ratio of 0.6 for the headline feature), we expand the repository set within budget before unblinding; if adequate power is unattainable within constraints, we report the study as descriptive and under-powered rather than over-claim a null. This power decision is made and recorded before the outcome is regressed on depth.

### 2.7 Pre-registered success and kill criteria

We fix the following before running the confirmatory analysis.

- **Primary hypothesis (H1).** On the headline specification (depth = *D_wrong*, full controls, repository grouping), *β₁ < 0* with a 95% confidence interval excluding 0.
- **Positive result.** H1 is supported **and** the depth term improves out-of-sample discrimination over the controls-only model (positive change in repository-grouped AUC with a confidence interval excluding 0) **and** the result survives the sensitivity analyses (equal-weight Stamp Score; count-based aggregation; restriction to defect-plausible reverts from the §2.5 audit). We additionally require that the effect not be an artifact of a single repository (leave-one-repository-out does not flip the sign or cross 0).
- **Kill / null result.** If, after the pre-specified controls, the depth term shows no significant association with reverts (confidence interval includes 0) in the headline specification and the incremental AUC is not distinguishable from 0, we stop and report the null: *review depth, as operationalized here, does not predict escaped defects on this corpus.* Consistent with the pilot's design, this null is itself a contribution — it bounds the usefulness of revert history as a validity anchor and motivates a better outcome proxy — and we will publish it with the same rigor as a positive result. An inability to reach adequate power (§2.6) is reported as a separate, third outcome (inconclusive), not laundered into either a positive or a null.

### 2.8 Reproducibility, compute, and budget

**Models and judge.** All depth features are elicited from a single, named LLM judge at temperature 0 with a fixed, versioned prompt; we record the exact model identifier and version, decoding parameters, and prompt text. We report judge robustness by re-scoring a subset with a second model family and with a paraphrased prompt to check that conclusions are not artifacts of one model or one wording. Analysis code (revert/hotfix detection, feature aggregation, and the statistical models) is deterministic given fixed seeds, which we record.

**Cost.** Compute is dominated by judge API calls over review artifacts and is comfortably within budget: at the sample sizes above, judging on the order of low-tens-of-thousands of review artifacts with a mid-tier model is expected to cost on the order of \$50–\$150, with the remainder of the ≤\$500 envelope reserved for judge-robustness reruns and an optional small paid-annotation overlap. Revert detection and statistical analysis are CPU-only and effectively free. The full study is designed to run in ≤6 weeks part-time on API access plus a personal machine, with no GPU required.

**Artifacts.** We will release: (i) the depth rubric and exact judge prompts; (ii) the revert/hotfix detection code and rule specification; (iii) the derived, redistribution-permitted feature and outcome tables keyed to public PR identifiers (respecting each source repository's license and GitHub's terms, releasing identifiers and derived features rather than re-hosting third-party code where required); (iv) the analysis scripts and pre-registration; and (v) the human-labeled validation set used for judge reliability. The intended outcome is a reusable, subject-free instrument for auditing oversight quality on AI-generated code, together with an honest statement — positive, null, or inconclusive — of whether that instrument predicts real defects.

## References

[1] Y. et al. *AIDev: Studying AI Coding Agents on GitHub.* arXiv:2602.09185, 2026.

[2] *The Rise of AI Teammates in Software Engineering (SE) 3.0: How Autonomous Coding Agents Are Reshaping Software Engineering.* arXiv:2507.15003, 2025.

[3] H. Yu, L. Liu, X. Jiang, Y. Jia, S. Wang, P. Qian, and Y. Chen. *Habituation at the Gate: Rising Approval and Declining Scrutiny in Human Review of AI Agent Code.* KDD 2026 Workshop on Agentic Software Engineering (SE 3.0). arXiv:2606.22721, 2026.

[4] *AI Writes Faster Than Humans Can Review: A Longitudinal Study of an Enterprise "2×" Mandate.* arXiv:2607.01904, 2026.

[5] J. Becker, N. Rush, et al. *Measuring the Impact of Early-2025 AI on Experienced Open-Source Developer Productivity.* METR. arXiv:2507.09089, 2025.

[6] K. Duma, P. Wróblewski, J. Bobińska, J. Winiarska, and P. Przymus. *These Aren't the Reviews You're Looking For: How Humans Review AI-Generated Pull Requests.* EASE 2026. arXiv:2605.02273, 2026.

[7] A. Naik, M. Alenius, D. Fried, and C. Rosé. *CRScore: Grounding Automated Evaluation of Code Review Comments in Code Claims and Smells.* NAACL 2025. arXiv:2409.19801, 2024.

[8] L. Zheng, W.-L. Chiang, Y. Sheng, S. Zhuang, Z. Wu, Y. Zhuang, Z. Lin, Z. Li, D. Li, E. P. Xing, H. Zhang, J. E. Gonzalez, and I. Stoica. *Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena.* NeurIPS 2023 Datasets and Benchmarks. arXiv:2306.05685, 2023.
