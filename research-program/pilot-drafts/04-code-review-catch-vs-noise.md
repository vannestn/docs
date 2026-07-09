# Catch versus Noise: An Operating-Characteristic Benchmark for AI Code Review on Behavior-Preserving Traps and Test-Passing Subtle Bugs
*Target venue: an SE / ML-for-code venue or workshop (ICSE/FSE/ISSTA or an ML4Code workshop) · arXiv preprint · Draft — Introduction & Methods only*

## Abstract

AI code reviewers are now deployed at scale, yet the two quantities a maintainer most needs before trusting one — how many *subtle* defects it catches, and how often it flags code that is actually correct — are almost never reported together, and never as a tunable trade-off. Existing benchmarks inherit two structural biases: they draw positives from human-flagged bug corpora, so they can only measure defects someone already noticed (survivorship bias), and they estimate false positives against "clean" pull requests whose latent, unnoticed defects silently inflate the false-alarm count. We introduce a benchmark that measures catch-rate against false-positive rate as an operating-characteristic (ROC-style) curve, built from two synthetic but reality-anchored components. **NullPatch** is a catalog of behavior-preserving-but-suspicious-looking diffs (a frightening rename, a removed-redundant guard, an equivalent `<=`/`<` rewrite), each certified clean by a behavior-preservation oracle restricted to near-decidable equivalences, plus a manual audit; it estimates the false-positive *floor* and decomposes wrong flags into *fabricated* versus *plausible*. **SubtleMutants** are semantics-adjacent mutants (an authorization off-by-one, a silent permission-widening) that compile and pass the existing test suite — test-passing survival serving as the subtlety label — each paired with its untouched original as a proven-clean negative. Sweeping reviewer confidence yields catch-rate versus false-positive rate with a maintainer-tolerable FPR ≤ 30% trust cutoff. We evaluate two to three frontier reviewers and report the catch-rate they achieve at that cutoff. We contribute the construction protocol, a released dataset, and the first paired catch-vs-noise operating curve for naturalistic pull-request review.

## 1. Introduction

Large language models now write and review a large and growing share of production code, and the dominant failure mode reported by practitioners is not code that fails to run but code that *looks* right, compiles, and is nonetheless subtly wrong. In a controlled study of experienced open-source developers, access to early-2025 AI tooling *increased* task-completion time by 19% even as developers believed it had made them roughly 20% faster; the authors attribute much of the slowdown to the effort of reviewing plausible-but-imperfect AI output [1]. The cost of AI-assisted development is thus migrating into the review loop, and the review loop is precisely where measurement is thinnest.

The reviewers meant to absorb this load are themselves increasingly automated. AI code-review tools are widely marketed and adopted, and a series of recent benchmarks evaluate their comment quality against real pull requests [2, 3]. Yet a maintainer deciding whether to route an AI reviewer's verdicts into a merge gate needs two numbers that these benchmarks do not report jointly: the *catch-rate* on subtle, consequential defects, and the *false-positive rate* — how often the reviewer raises an alarm on a change that is in fact correct. A reviewer that catches everything by flagging everything is worthless; a reviewer that never cries wolf but misses authorization bugs is dangerous. What matters is the trade-off between the two, at an alarm rate a human team will actually tolerate. This is an operating-characteristic (ROC-style) question, and the field reports it for AI code review essentially nowhere.

Two structural biases make the trade-off hard to measure honestly, and existing datasets do not escape them. First, **survivorship bias in the positives**: benchmarks whose defects are drawn from human-flagged bug reports or historical fix commits can, by construction, only contain bugs a human already noticed. The subtle defects that matter most — the ones that slip past both a test suite and a reviewer — are systematically absent from any human-flagged corpus. Second, **latent-defect contamination in the negatives**: false-positive rate is typically estimated against "clean" pull requests, but a merged PR is not a proven-correct PR. SWR-Bench, which pairs positives with natural clean-PR negatives, explicitly acknowledges that such negatives may harbor undetected defects, which inflates any false-positive count computed against them [2]. Without negatives that are *provably* clean, a reviewer that correctly flags a real-but-unnoticed bug in a "clean" PR is scored as having produced a false alarm — corrupting exactly the number the benchmark exists to measure.

Prior work supplies pieces of the solution but not their fusion for this setting. In vulnerability scanning, RealVuln introduces "false-positive traps" — safe-but-suspicious code patterns (for example, ORM-parameterized queries) — to measure a scanner's specificity [4]; but its setting is whole-file static analysis over hand-labeled, naturally-occurring vulnerabilities, not diff-level pull-request review, and its traps are curated rather than oracle-certified behavior-preserving mutations. On the catch side, the AI-control line sweeps a suspicion score into a catch-versus-false-positive audit curve over paired honest-versus-backdoored programs under a false-positive-rate-sensitive audit budget [5], and SHADE-Arena evaluates monitors on subtle harmful agent behavior [6] — but these target *adversarial* backdoors in a control/monitoring frame, not the naturalistic, non-adversarial subtle bugs of everyday review. Mutation testing offers a mature apparatus for programmatic, perfectly-labeled fault injection [7, 8], and matched buggy/fixed program pairs are a long-standing device for controlled study [9] — but mutation testing asks whether a *test suite* kills a mutant, not whether a *reviewer* catches one without a test. Behavior-preservation oracles such as ChangeGuard can certify that a diff does not change runtime behavior [10], and sampling-based self-consistency underpins reference-free correctness signals in adjacent domains [11]; neither has been turned toward constructing a clean false-positive floor for code review. The catch-vs-noise operating curve for naturalistic PR review sits in the gap between all of these.

We close that gap with a benchmark built from two synthetic-but-reality-anchored components that together yield an honest operating curve. The first, **NullPatch**, weaponizes mutation testing *in reverse*: rather than seeding bugs, it seeds behavior-preserving-but-suspicious-looking diffs, each certified clean by a behavior-preservation oracle restricted to near-decidable equivalences and confirmed by manual audit, so that every alarm raised against a NullPatch is by construction a false alarm. This yields a clean false-positive floor, decomposed into *fabricated* flags (the reviewer invents a defect that could not exist) and *plausible* flags (a defensible nit on genuinely correct code). The second, **SubtleMutants**, injects semantics-adjacent mutants that compile and pass the existing test suite — using test-passing survival as an objective subtlety label — and pairs each with its untouched original as a proven-clean negative; sweeping the reviewer's confidence produces the catch-vs-noise curve, read off at a maintainer-tolerable FPR ≤ 30% cutoff. The design is explicitly scoped to what a solo, part-time researcher can run under a ≤$500 compute budget with only a few hours of expert manual labeling.

We make the following contributions:

1. **A catch-vs-noise operating-characteristic benchmark for naturalistic pull-request review**, fusing a clean false-positive floor with a survivorship-free catch-rate into a single tunable curve, reported at a maintainer-tolerable FPR ≤ 30% trust cutoff.
2. **NullPatch**, an AST-based catalog of behavior-preserving-but-suspicious diffs, each oracle-certified and manually audited to be clean, giving a false-positive floor that is not inflated by latent defects, and decomposed into fabricated versus plausible flags.
3. **SubtleMutants**, a set of test-passing, semantics-adjacent mutants paired with proven-clean originals, using test-passing survival as an objective, survivorship-free subtlety label.
4. **An empirical operating curve for two to three frontier AI reviewers**, reporting how far catch-rate collapses at a tolerable alarm rate relative to headline accuracy, together with a released dataset, generation code, and a pre-registered analysis plan.

We frame all claims cautiously. The benchmark's validity rests on the "clean" changes being *truly* clean; because behavior-preservation oracles are only probabilistic, a hidden behavior change would reintroduce the exact latent-defect problem we critique. We address this directly by restricting the transformation catalog to near-decidable equivalences and by manually auditing a sample, and we pre-register the conditions under which we would report a null.

## 2. Methods

### 2.1 Data and materials

**Base corpus.** We construct all items from open-source Python repositories with permissive licenses and a passing test suite, drawn from the SWE-bench family of projects [12] — twelve widely-used PyPI packages that later benchmarks also adopt for their code quality and representativeness [2]. Working within one language and a small set of well-tested repositories keeps the behavior-preservation oracle and the test-execution harness tractable within budget; we record each repository's commit SHA, license, and test-suite pass state so the corpus is reconstructible. Where NullPatch traps are seeded onto clean base diffs, we draw those base PRs from an existing PR-review corpus of the same repositories to preserve naturalism [2].

**Sample sizes.** The pilot targets approximately 150 NullPatch traps and approximately 300 SubtleMutants (each paired with its untouched original, so ~300 proven-clean matched negatives). These sizes are chosen to give usable confidence intervals on the two headline rates (Section 2.6) while remaining within the compute and manual-audit budget (Section 2.8). Positives (mutants) and behavior-preserving traps are generated by AST manipulation over the base corpus; no proprietary or human-subject data is used, and no IRB is required.

**Release.** We release the generated diffs, the oracle certificates and audit labels, the per-item metadata (repository, transform type, subtlety class), and the generation and scoring code, under a license compatible with the source repositories.

### 2.2 The core method: two paired components and an operating curve

Let a reviewer be a function that, given a diff *d* against a base program *P*, returns a real-valued suspicion score *s(d) ∈ [0, 1]* (elicited as a 0–10 confidence that the diff introduces a defect, rescaled) together with a natural-language rationale. A decision at threshold *τ* flags *d* iff *s(d) ≥ τ*.

**Component A — NullPatch (false-positive floor).** We define a catalog of *behavior-preserving transformations* T = {t₁, …, tₖ}, each of which rewrites a code region into a form that is intended to *look* suspicious to a reviewer while provably not changing observable behavior. Concrete transforms include: (i) a *scary rename* (renaming a variable or helper to something alarming but semantically neutral); (ii) *removal of a redundant guard* (deleting a conditional check that is provably dead or subsumed on all reachable paths); and (iii) an *equivalent comparison rewrite* (e.g., rewriting `x < n+1` to `x <= n` where the substitution is provably equivalence-preserving over the relevant domain). For each base region *r*, we apply *t ∈ T* to obtain a trap diff *d = t(r)*. A trap is admitted only if it is certified clean by the oracle *O* (Section 2.2, Assumptions) and survives manual audit; every flag a reviewer raises against an admitted NullPatch is therefore, by construction, a false alarm. Each such flag is further classified as **fabricated** (the reviewer asserts a defect that the transform makes impossible) or **plausible** (a defensible stylistic nit on correct code), following the fabricated/plausible distinction used in PR-review quality work [3].

**Component B — SubtleMutants (catch-rate).** We define a set of *semantics-adjacent mutation operators* M targeting consequential, easy-to-miss logic: authorization/permission off-by-one (e.g., `>=` → `>` on a boundary check), silent permission-widening (broadening an access predicate), and hedge/guard stripping on paths not exercised by the suite. For a base program *P* with passing suite *S*, applying *m ∈ M* yields a candidate mutant *P′ = m(P)*. We retain *P′* iff it (a) compiles and (b) passes *S* in full — i.e., it is a *surviving* mutant in the mutation-testing sense [7, 8]. Test-passing survival is our objective **subtlety label**: a mutant that the existing suite cannot distinguish from correct code is, operationally, subtle. Each retained mutant is paired with its untouched original *P* as a proven-clean matched negative (proven clean because *P* is the unmodified, shipped code). Equivalent mutants — those that are in fact semantically identical to *P* and thus impossible to catch — are triaged out by manual inspection (Section 2.5), since they would otherwise depress the achievable catch-rate and distort the curve.

**The operating curve.** For a fixed reviewer, we sweep *τ* over [0, 1] and, at each threshold, compute the catch-rate (true-positive rate on SubtleMutants) and the false-positive rate (fraction of proven-clean items — matched originals and admitted NullPatch traps — that are flagged). Plotting catch-rate against false-positive rate gives the operating-characteristic curve; the area under it summarizes discrimination, and the **headline number** is the catch-rate at the maintainer-tolerable cutoff FPR ≤ 30% (Section 2.4). Reporting NullPatch and matched-original false positives separately lets us distinguish the *adversarial* false-positive floor (NullPatch, designed to look guilty) from the *incidental* one (originals).

**Assumptions.** The load-bearing assumption is that admitted NullPatch traps and retained SubtleMutants carry the labels we assign. For NullPatch this requires the behavior-preservation oracle *O* to be sound in practice; because oracles such as ChangeGuard are learning-guided and therefore probabilistic [10], we deliberately restrict T to *near-decidable* equivalences (pure renames; guarded comparison rewrites with a discharged equivalence obligation; dead-guard removals confirmed by differential testing) and back the oracle with manual audit. For SubtleMutants we assume that test-passing survival plus equivalent-mutant triage yields genuinely present, genuinely subtle defects; we state both assumptions explicitly and test their failure modes in the kill criteria (Section 2.7).

### 2.3 Baselines and comparators

We compare AI reviewers against, and position the benchmark relative to, the following.

- **Reviewer systems under test.** Two to three frontier general-purpose LLM reviewers under a fixed diff-review prompt, and where feasible one dedicated AI code-review tool, run identically on all items. The comparison of interest is each system's operating curve, not a single accuracy scalar.
- **A trivial-length / heuristic baseline.** A reviewer that flags proportionally to diff size (or a fixed random flag policy) establishes the no-skill diagonal against which discrimination is judged.
- **Benchmark-level comparators (for positioning, not head-to-head scoring).** RealVuln's false-positive traps [4] motivate the false-positive-floor construction but differ in setting (whole-file SAST, curated traps); SWR-Bench and SWE-PRBench [2, 3] evaluate PR-review quality but against natural clean-PR negatives and human-flagged issues, inheriting the two biases we target; the AI-control catch-vs-noise curve [5] and SHADE-Arena [6] sweep an analogous curve but for adversarial backdoors. Our contribution is the fusion of oracle-clean negatives and survivorship-free positives into an operating curve for *non-adversarial* PR review.

### 2.4 Metrics

For a reviewer at threshold *τ*, let TP be flagged SubtleMutants, FN be missed mutants, FP be flagged proven-clean items, and TN be un-flagged proven-clean items.

- **Catch-rate (recall / TPR):** `CR(τ) = TP / (TP + FN)`.
- **False-positive rate (FPR):** `FPR(τ) = FP / (FP + TN)`, computed overall and separately for NullPatch traps and matched originals.
- **Operating-characteristic curve and AUC:** the parametric curve `{(FPR(τ), CR(τ)) : τ ∈ [0,1]}`, summarized by its area under the curve (AUC) via the trapezoidal rule.
- **Headline: catch-rate at the trust cutoff:** `CR@30 = CR(τ*)` where `τ*` is the largest threshold with `FPR(τ*) ≤ 0.30`. The 30% cutoff operationalizes a maintainer-tolerable alarm rate; we report a sensitivity sweep at 10%, 20%, and 30%.
- **False-positive floor and its decomposition:** at the most permissive threshold, the NullPatch flag-rate, split into a **fabrication rate** (fabricated flags / traps) and a **plausible-nit rate** (plausible flags / traps).

For each flagged mutant, a flag counts as a *true catch* only if the reviewer's rationale localizes to the mutated region (agreement is region-level, not merely a binary "something is wrong"); this guards against rewarding lucky alarms. Rationale-to-region matching is adjudicated by an LLM-as-judge calibrated against the author's manual labels (Section 2.5).

### 2.5 Human validation and labeling

Human labeling is required, and is deliberately small and concentrated where automation is unsafe:

1. **NullPatch cleanliness audit.** The author manually audits a sample (≥20%) of oracle-admitted traps to confirm behavior preservation, and audits every trap in the two transform classes with the highest residual risk (comparison rewrites and dead-guard removals). *In one sentence:* the labeler reads the diff and the oracle certificate and confirms the change cannot alter observable behavior. This requires a competent Python programmer who can reason about program equivalence — the author's applied-ML/software background suffices — and cannot be sourced from existing data, because no existing corpus certifies these bespoke synthetic traps.
2. **Equivalent-mutant triage.** The author inspects each retained SubtleMutant to exclude semantically-equivalent mutants (uncatchable by definition). *In one sentence:* the labeler confirms the mutant actually changes behavior on some feasible input. Same expertise; again not available from existing data.
3. **LLM-judge calibration for rationale-to-region matching.** The author hand-labels a ~50-item gold set of reviewer rationales as correctly-localized or not, and the automatic judge is accepted only if it clears a pre-set agreement threshold (Cohen's κ ≥ 0.6) against this gold set — following the certify-a-cheap-labeler-against-a-small-gold-set pattern established in prior LLM-as-judge work and the author's own prior study on LLM-as-a-judge for RAG hallucination detection.

Total manual effort is budgeted at roughly 4–7 hours; a small paid-annotation budget is held in reserve to add a second auditor on a subset for inter-rater agreement on cleanliness, strengthening the central validity claim.

### 2.6 Statistical analysis

**Estimators and uncertainty.** Catch-rate, FPR, and the fabrication/plausible rates are binomial proportions; we report Wilson score 95% confidence intervals for each, and cluster-bootstrap intervals (resampling by *repository*, then by *base region*) for AUC and for `CR@30`, to respect within-repository dependence. Reviewer-to-reviewer differences in `CR@30` are tested with a paired bootstrap over the shared item set (a McNemar-style paired comparison at the fixed `τ*`).

**Power / sample-size reasoning.** With ~300 mutants, a catch-rate estimate near 0.5 has a Wilson half-width of roughly ±0.057, tightening toward the extremes; with ~150 NullPatch traps a false-positive-floor estimate near 0.2 has a half-width of roughly ±0.065. These precisions are adequate to distinguish a useful reviewer (say `CR@30` ≈ 0.6) from a no-skill one and to detect a fabrication rate materially above zero, which is the pilot's decision-relevant contrast.

**Confound controls.** Diff size is the primary confound for both rates (larger diffs draw more scrutiny and more alarms); we stratify all curves by diff-size bucket and report size-adjusted `CR@30`. We balance transform types across repositories, hold the review prompt fixed across systems, randomize item presentation order, and record model/version and decoding parameters so that reviewer effects are not confounded with item effects.

### 2.7 Pre-registered success and kill criteria

We pre-register the following before running the frontier reviewers.

**Primary hypothesis.** At least one evaluated frontier reviewer achieves `CR@30 ≥ 0.50` (catch-rate at FPR ≤ 30%) with a lower 95% CI bound above the no-skill baseline, *and* the benchmark discriminates among reviewers (at least one pairwise `CR@30` difference significant at α = 0.05 after paired bootstrap).

**Positive result.** The primary hypothesis holds *and* the NullPatch construct validity check passes: admitted traps bait at least one reviewer at a non-trivial rate (adversarial false-positive floor materially above the matched-original floor), demonstrating the traps are informative.

**Null / kill.** We report a null and stop scaling if **either** (a) the manual cleanliness audit finds that behavior-preserving transforms are not reliably clean — operationally, >5% of audited traps exhibit a behavior change — since this reintroduces the latent-defect contamination the benchmark exists to remove and invalidates the false-positive floor; **or** (b) NullPatch traps fail to bait reviewers (adversarial floor ≈ incidental floor ≈ 0), making the trap catalog uninformative; **or** (c) after equivalent-mutant triage and diff-size adjustment, no reviewer exceeds the no-skill baseline on `CR@30`. Consistent with the author's program guardrails, a clean null is itself a reportable result: "oracle-certifiable behavior-preserving traps do not bait frontier reviewers" or "test-passing subtle mutants are not caught above chance at a tolerable alarm rate" is a publishable finding, and we commit to reporting it rather than re-tuning to a positive.

### 2.8 Reproducibility, compute, and budget

**Models and configuration.** Two to three frontier LLM reviewers accessed via API, plus one open dedicated reviewer if feasible; exact model identifiers, versions, decoding temperature, and prompts are logged and released. Generation uses deterministic AST operators; reviewer calls fix temperature and record seeds where the API exposes them, and we run each reviewer *n = 3* times per item to quantify scoring variance.

**Compute and cost.** All heavy computation (rendering, AST mutation, test execution, oracle checks) is CPU-bound and runs on free-tier or local hardware; no GPU is required. The dominant cost is API inference over roughly 450 items × up to 3 reviewers × 3 repetitions, plus judge-calibration calls, estimated at approximately $100–200 and comfortably within the ≤$500 ceiling. The study is scoped to complete in ≤6 weeks part-time.

**Artifacts.** We release the dataset (diffs, oracle certificates, audit and equivalence labels, per-item metadata), the generation and evaluation code, the LLM-judge prompt and its calibration gold set, and a reproduction script that regenerates all tables and the operating curves from raw model outputs.

## References

[1] J. Becker, N. Rush, et al. "Measuring the Impact of Early-2025 AI on Experienced Open-Source Developer Productivity." arXiv:2507.09089, 2025.

[2] "Benchmarking and Studying the LLM-based Code Review" (SWR-Bench: assessing LLM performance in real-world code-review comment generation). arXiv:2509.01494, 2025.

[3] "SWE-PRBench: Benchmarking AI Code Review Quality Against Pull Request Feedback." arXiv:2603.26130, 2026.

[4] "RealVuln: Benchmarking Rule-Based, General-Purpose LLM, and Security-Specialized Scanners on Real-World Code." arXiv:2604.13764, 2026.

[5] R. Greenblatt, B. Shlegeris, K. Sachan, and F. Roger. "AI Control: Improving Safety Despite Intentional Subversion." arXiv:2312.06942, 2023.

[6] J. Kutasov et al. "SHADE-Arena: Evaluating Sabotage and Monitoring in LLM Agents." arXiv:2506.15740, 2025.

[7] M. Papadakis, M. Kintis, J. Zhang, Y. Jia, Y. Le Traon, and M. Harman. "Mutation Testing Advances: An Analysis and Survey." *Advances in Computers*, vol. 112, pp. 275–378, 2019.

[8] Y. Jia and M. Harman. "An Analysis and Survey of the Development of Mutation Testing." *IEEE Transactions on Software Engineering*, 37(5):649–678, 2011.

[9] R. Just, D. Jalali, and M. D. Ernst. "Defects4J: A Database of Existing Faults to Enable Controlled Testing Studies for Java Programs." In *Proc. ISSTA*, 2014. doi:10.1145/2610384.2628055.

[10] "ChangeGuard: Validating Code Changes via Pairwise Learning-Guided Execution." arXiv:2410.16092, 2024.

[11] P. Manakul, A. Liusie, and M. J. F. Gales. "SelfCheckGPT: Zero-Resource Black-Box Hallucination Detection for Generative Large Language Models." arXiv:2303.08896, 2023.

[12] C. E. Jimenez, J. Yang, A. Wettig, S. Yao, K. Pei, O. Press, and K. Narasimhan. "SWE-bench: Can Language Models Resolve Real-World GitHub Issues?" arXiv:2310.06770, 2023.
