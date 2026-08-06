# SuggestionFix-Bench: Grading AI Code-Review Corrections Against Humans' Own Accepted Pull-Request Fixes
*Target venue: an SE / ML-for-code venue or workshop (ICSE/FSE/ISSTA or an ML4Code workshop) · arXiv preprint + released dataset · Draft — Introduction & Methods only*

## Abstract

AI code reviewers are now deployed at scale, and a wave of 2025–2026 benchmarks grades the *comments* they generate against real human review feedback. Almost none grades the *fix*: given a flagged defect, can the model produce the correction a human reviewer actually accepted? We introduce **SuggestionFix-Bench**, a benchmark and released dataset built entirely from real merged GitHub pull requests, with zero manual code review by the researcher. Its gold labels come from a signal that is literal and self-contained: the GitHub review *suggestion block* (a ```` ```suggestion ```` fenced edit), which pairs a set of anchored problem lines with a human-authored replacement. We keep only suggestions that were *accepted* — the suggested text appears at that location in the merged head and no later revert or hotfix touches those lines — so each item is a machine-verified (problem region → accepted fix) pair requiring no human triage. The AI is given the pre-fix region (with or without the reviewer's natural-language concern, as an ablation) and must reproduce the accepted correction; it is graded by AST-normalized exact match, an AST-equivalence band, and, on the subset with runnable tests, behavioral test-verified match. Crucially, divergent-but-valid fixes are routed to test verification and reported as an *alternative-valid* rate rather than penalized as errors, so a smarter-but-different model is not scored as wrong. We report catch and localization as secondary tracks, complemented by a *review-missed* class derived from revert/hotfix commits via SZZ back-tracing, under both a permissive and a conservative SZZ configuration to bound its label noise. We contribute the suggestion-block extraction pipeline, the released dataset and code, and the first fix-correctness (not comment-quality) benchmark grounded in humans' own accepted PR corrections. The study runs under a ≤\$500 budget on CPU and free-tier resources, and pre-registers a clean null.

## 1. Introduction

Large language models now write and review a large and growing share of production code, and the practitioner-facing question has shifted from *can the model flag a problem?* to *can it propose the fix a human would accept?* A code reviewer that raises a plausible concern but offers a wrong or non-applicable correction still leaves the work on the author. The most decision-relevant capability for an AI reviewer is therefore not comment generation but **fix correctness**: producing an edit that a maintainer would actually merge. That capability is measurable only against a source of ground-truth corrections — and the richest such source is the history of real merged pull requests, where humans have already written, reviewed, and accepted millions of corrections for free.

The recent benchmark literature has converged on the *comment* side of this problem. SWR-Bench evaluates whether an AI's generated review comments cover the issues in 1,000 manually verified GitHub PRs, using an LLM judge that agrees with humans about 90% of the time [1]. SWE-PRBench grades AI review comments against the real human review feedback on merged PRs and adds an explicit fabrication penalty, notably classifying a comment on an unflagged-but-correct line as *plausible* rather than a false positive [2]. The CodeReviewer line established the underlying tasks — quality estimation, comment generation, and code refinement — by pre-training on real code changes and reviews across nine languages [3]. What none of these primarily grades is whether the model reproduces the *specific accepted correction* a human made, judged by machine-checkable equivalence to that human's own merged edit.

This is the gap SuggestionFix-Bench fills, and it turns on one clean signal. GitHub's review UI lets a reviewer attach a ```` ```suggestion ```` fenced block: a literal replacement for a set of anchored lines that the author can accept with one click. Each suggestion block is thus a self-contained (original lines at path+line-range → human-authored replacement) pair — a gold correction with a location attached, emitted by real reviewers and captured structurally. Prior descriptive work found that a majority of suggestion blocks are accepted and very few are later reverted, making "accepted and not-reverted" a strong signal that the fix was correct. To our knowledge, no released benchmark uses suggestion blocks specifically as an *exact-match correction oracle*: SWE-PRBench, SWR-Bench, and the Martian benchmark all grade free-text review comments, and the classic code-refinement task grades comment→refined-code pairs rather than the reviewer-facing suggestion signal [1, 2, 3, 4]. That is the wedge — narrow but genuinely unclaimed — that this pilot occupies.

We are explicit about what is already taken, because most of the surrounding space is dense. The neutral Martian Code Review Bench ranks deployed AI reviewers on precision and recall over real PRs, with online ground truth grounded in whether developers actually act on each tool's comments [4]; the catch-vs-noise-on-real-PRs measurement is, for practical purposes, occupied by well-resourced teams. The "revert commit = escaped defect" label is also built and validated: ReDef anchors defective cases in 22 C/C++ projects to revert commits and yields 13,432 function-level items (3,164 defective, 10,268 clean) for just-in-time defect prediction [5]. We therefore do *not* attempt to out-measure precision/recall on review comments, and we treat reverts only as a bounded secondary signal, not the headline. Our differentiated artifact is the fix-correctness label from accepted suggestion blocks, which none of these systems reports.

Two well-documented hazards threaten any PR-mined benchmark, and we confront both directly rather than hiding them. First, **label noise from non-actionable comments**: measured studies find that only ~64% of CodeReviewer's review comments are valid, and even after LLM-based cleaning the valid-comment precision tops out near 85% while removing 25–66% of the data [6]. Second, **weak false-positive semantics**: an AI edit that differs from the human's is not automatically wrong, because humans miss defects and multiple correct fixes exist. The suggestion-block design largely sidesteps both. The suggestion block is by construction an actionable edit (a reviewer bothered to write a concrete replacement), so the dominant comment-noise problem is filtered at the source; and because the task is "reproduce a known-correct fix," recall/correctness dominates and there is no oracle false-alarm axis to over-claim. Where the model diverges from the human, we route the divergence to test verification and report it as *alternative-valid*, never as a false positive.

We make the following contributions:

1. **SuggestionFix-Bench**, the first released benchmark that grades AI code-review *corrections* against humans' own accepted PR fixes, using GitHub suggestion blocks as a literal, machine-checkable correction oracle — with no manual code review by the researcher.
2. **A suggestion-block extraction and acceptance-verification pipeline** that mines (problem region → accepted fix) pairs from real merged PRs at scale, filters to accepted-and-not-reverted suggestions, and snapshots the pre-fix blob as model input.
3. **A test-verified fix-correctness protocol** that converts surface-form "match" into behavioral correctness on the subset with runnable suites, and that reports divergent-but-passing fixes as a first-class *alternative-valid* rate rather than an error.
4. **A bounded review-missed track** derived from revert/hotfix commits via SZZ back-tracing, reported under permissive and conservative SZZ configurations, plus a released dataset, extraction and scoring code, and a pre-registered analysis plan.

We frame all claims cautiously. Suggestion blocks skew toward small, local, mechanically-applicable edits, so external validity is bounded to "suggestion-shaped" corrections; we report fix-complexity strata rather than a single headline that overstates generality. And we pre-register the conditions under which we would report a null.

## 2. Methods

### 2.1 Data and PR-signal extraction

**Primary signal.** Every gold item is a GitHub review *suggestion block*: an inline review comment whose body contains a ```` ```suggestion ```` fenced block, anchored to a path and line range in a specific PR diff hunk. The fenced content is the human-authored replacement; the anchored pre-image lines are the problem region. The suggestion block is not a first-class API field, so we extract it by regexing the comment body between the fenced markers — the same approach as published suggestion-block studies — over comment-body corpora that are already available at scale.

**Sources (all free, solo-scale).** We build primarily from two pre-mined corpora so that the base labeling is already done: (i) `ronantakizawa/github-codereview` (355,807 rows: each a human inline review comment with ~50 lines of pre-fix `before_code`, post-fix `after_code`, the anchored `diff_context`, a 9-way `comment_type` label, and repo metadata; AI/bot reviewers excluded, and "code changed after review" verified) [7]; and (ii) the CodeReviewer corpus, which supplies the (pre-review chunk → comment → corrected chunk) triples across nine languages [3]. We enrich a sampled subset via the GitHub REST/GraphQL review-comments API (5,000 authenticated reads/hr; ample at solo scale) to recover the merged blob at the anchored SHA when it is not already present, and use GH Archive on BigQuery (the `PullRequestReviewCommentEvent` payload carries both `body` and `diff_hunk`) for any custom mining, scoped to a few months to stay within the free 1 TB/month tier. For the review-missed track and a rejected-code class we draw on `hao-li/AIDev` (932,791 agent-authored PRs across 116,211 repos, with `pr_review_comments_v2`, `pr_timeline`, and closed-without-merge labels) [8].

**Acceptance filter (the correctness signal).** From every candidate suggestion block we keep only *accepted* items: (a) the PR was merged; (b) the suggested replacement text appears verbatim (or via GitHub's commit-suggestion merge) at the anchored location in the merged head; and (c) no later revert or hotfix touches those lines, checked by SZZ-style back-tracing over subsequent history. We normalize away whitespace/formatting-only suggestions, cap per-repo counts to prevent one repo dominating, and split strictly by repository so no test repo appears in any tuning. Target size is ~800–1,500 gold items; suggestion blocks are individually rare (roughly 8% of suggestions are defect fixes, the rest style/rename), but they aggregate across thousands of repos, and we report a fix-complexity histogram so the "suggestion-shaped" scope is legible.

**No researcher code review.** The label is the accepted human suggestion; there is no mutant seeding, no behavior-preservation oracle to certify, and no per-item manual defect judgment. This is the design's central advantage over a manual-triage benchmark.

### 2.2 The core method: reproduce the accepted fix

Let a base program region *r* be the pre-image lines at the anchored path and line range, snapshotted from the blob at the review commit SHA, together with a bounded window of surrounding context. A reviewer model *R* is prompted with *r* and, in the main track, the reviewer's natural-language concern *c* (the comment text minus the fenced block); in a harder ablation, with *r* alone and no comment. *R* must output a corrected version *ĝ* of the region. The gold correction *g* is the accepted suggestion-block replacement.

An item is scored **correct** if *ĝ* matches *g* under the metric hierarchy of Section 2.4. A second, secondary **localization track** gives *R* the whole PR diff and asks it to flag the line before fixing; a flag counts only if it lands within *k* lines of the human-anchored line. The primary object of study is the fix, not the flag.

**Handling divergence honestly.** When *ĝ* differs from *g*, we do *not* default to scoring it wrong. On the subset with runnable suites we route *ĝ* to test verification (Section 2.4); if it passes the same tests the human fix makes pass, it is recorded as **alternative-valid** and reported as a first-class rate, not an error. Only fixes that fail the human's tests, or that leave the flagged defect present, count as true misses. This is what makes the false-positive axis structurally benign here: the task is to produce a correct fix, so recall/correctness dominates and there is no "AI flagged a clean line" number to defend.

### 2.3 Baselines and comparators

We compare AI reviewers against, and position the benchmark relative to, the following.

- **Reviewer systems under test.** Two to three frontier general-purpose LLMs under a fixed fix-generation prompt, run identically on all items in both the with-comment and no-comment tracks; where feasible, one dedicated AI code-review or code-editing tool.
- **A copy-the-region baseline.** A trivial system that returns the pre-fix region unchanged establishes the floor; any item it "passes" under AST-normalization is a formatting-only artifact and is excluded upstream.
- **A retrieval baseline (and a bridge to the founding tool).** Nearest-neighbor retrieval of the most similar past (problem → accepted-fix) pair from the training split, optionally adapted by an LLM. This is both a fair non-frontier baseline and a demonstration that the same extraction pipeline feeds a retrieval corpus whose quality compounds as more accepted fixes accrue.
- **Benchmark-level comparators (positioning, not head-to-head scoring).** SWR-Bench [1] and SWE-PRBench [2] grade review *comments*; Martian [4] grades comment usefulness on live PRs; ReDef [5] builds revert-anchored defect labels for JIT prediction. Our contribution is grading the *fix* against the human's accepted suggestion, which none of these reports.

### 2.4 Metrics

Let each gold item carry an accepted fix *g* and a model output *ĝ*.

- **ExactMatch (headline):** *ĝ* equals *g* after AST-normalization that is insensitive to whitespace, comment, and formatting differences. Reported as a binomial proportion.
- **AST-EquivMatch:** token/AST tree-edit distance below a pre-registered threshold, capturing semantically-equivalent fixes with different surface form.
- **Test-Verified-Match (strongest, subset):** on repos with runnable suites, keep items where *g* makes a previously-failing or newly-added test pass; score *ĝ* correct iff it passes the same tests. This converts "match" into behavioral correctness and adjudicates surface-form disputes.
- **Alternative-Valid rate:** fraction of divergent *ĝ* that pass the human's tests (Section 2.2), reported separately so smart-but-different fixes are not counted as errors.
- **LocalizationHit@k (secondary):** fraction where *R* flags the human-anchored line within *k* lines before fixing.
- **Review-missed / rescue-rate (secondary, bounded):** on the SZZ-derived missed-defect set, the fraction *R* would have flagged/fixed at the SZZ-identified line, reported under permissive and conservative SZZ configurations to bound the label noise.

All rates are reported as Wilson score 95% confidence intervals, with cluster-bootstrap intervals resampling by repository to respect within-repo dependence.

### 2.5 Human validation (near-zero)

The bulk labeling is free; a small, concentrated validation tax remains, and we state it honestly.

1. **Label-quality audit.** The comment/`comment_type` filters and any LLM cleaner are themselves imperfect — the "Too Noisy To Learn" study shows valid-comment precision tops out near 85% after cleaning [6]. We hand-check a stratified sample of ~200–400 items (at ~30–60s each) to estimate the residual error rate of the accepted-suggestion label and the comment-type filter, and report that rate as an error bar on every claim rather than assuming clean labels.
2. **Diff-isolation spot-checks.** For any items where the fix is reconstructed from a review-induced diff rather than a literal suggestion block, we confirm on a sample that the post-review change actually addresses the comment (not a tangled unrelated edit); suggestion blocks, being atomic, largely avoid this.
3. **Gold eval slice.** We hand-verify a ~200-item held-out slice to anchor the headline claim.

Total manual effort is budgeted at ~15–30 hours one-time, dropping toward ~5 hours if we only replicate an existing corpus's task without a bespoke gold slice. This is *validation/calibration*, not primary labeling: no diff is manually reviewed for defects, and no correction is hand-authored.

### 2.6 Statistical analysis

**Estimators and uncertainty.** ExactMatch, AST-EquivMatch, Test-Verified-Match, alternative-valid, localization, and rescue rates are binomial proportions with Wilson 95% intervals; AUC-free headline comparisons between reviewers use a paired bootstrap over the shared item set (a McNemar-style paired test on ExactMatch). All intervals are cluster-bootstrapped by repository.

**Power.** With ~1,000 gold items an ExactMatch estimate near 0.5 has a Wilson half-width of roughly ±0.031, tightening toward the extremes — ample to distinguish a useful reviewer from the copy-the-region floor and to separate two frontier systems whose ExactMatch differs by more than ~7 points.

**Confound controls.** Fix complexity (single-line vs multi-line; diff-size bucket) is the primary confound: suggestion blocks over-represent small local edits, so we stratify every metric by complexity and report a size-adjusted headline. We balance `comment_type` strata, hold the prompt fixed across systems, randomize presentation order, and log model/version and decoding parameters so reviewer effects are not confounded with item effects.

### 2.7 Pre-registered success and kill criteria

We pre-register the following before running the frontier reviewers.

**Primary hypothesis.** At least one frontier reviewer achieves ExactMatch (with comment) materially above the retrieval baseline, with a lower 95% CI bound above it, *and* the benchmark discriminates among reviewers (at least one pairwise ExactMatch difference significant at α = 0.05 after paired bootstrap).

**Positive result.** The primary hypothesis holds *and* the label-quality audit finds a residual mislabel rate low enough (pre-registered ≤10%) that the headline is not an artifact of noisy gold.

**Null / kill.** We report a null and stop scaling if **either** (a) the label-quality audit finds >10% of "accepted-suggestion" gold items are mislabeled (e.g., the suggestion was not actually applied, or the edit is formatting-only), invalidating the oracle; **or** (b) after complexity adjustment no reviewer exceeds the retrieval baseline on ExactMatch, and the test-verified track shows no behavioral advantage either; **or** (c) the surviving gold set after acceptance-filtering is too small (<~500 items) to support the pre-registered precision. Consistent with the program guardrails, a clean null is itself reportable: "frontier reviewers do not reproduce humans' accepted suggestion-block fixes above a simple retrieval baseline" is a publishable finding, and we commit to reporting it rather than re-tuning to a positive.

### 2.8 Reproducibility, compute, and budget

**Models and configuration.** Two to three frontier LLM reviewers via API, plus one open/dedicated system if feasible; exact model identifiers, versions, decoding temperature, and prompts are logged and released. Each reviewer is run *n* = 3 times per item to quantify scoring variance.

**Compute and cost.** All heavy computation — suggestion-block extraction, acceptance verification, AST normalization, SZZ back-tracing, and test execution — is CPU-bound on local or free-tier hardware; no GPU is required. The dominant cost is API inference over ~1,000 items × up to 3 reviewers × 3 repetitions × 2 tracks, plus optional LLM cleaning of ~50–100k comments on a cheap model (well under \$100). Total spend is estimated at ~\$100–200, comfortably within the ≤\$500 ceiling; the study is scoped to complete in ≤6 weeks part-time.

**Artifacts.** We release the gold dataset (pre-fix regions, accepted fixes, acceptance certificates, per-item metadata including complexity and comment-type strata), the extraction and acceptance-verification pipeline, the scoring code (AST normalization, test-verification harness, SZZ configurations), the label-audit results, and a reproduction script that regenerates every table from raw model outputs.

## References

[1] X. Chen et al. "Benchmarking and Studying the LLM-based Code Review" (SWR-Bench: Assessing LLM Performance in Real-World Code Review Comment Generation). arXiv:2509.01494, 2025.

[2] "SWE-PRBench: Benchmarking AI Code Review Quality Against Pull Request Feedback." arXiv:2603.26130, 2026.

[3] Z. Li, S. Lu, D. Guo, N. Duan, S. Jannu, G. Jenks, D. Majumder, J. Green, A. Svyatkovskiy, S. Fu, et al. "Automating Code Review Activities by Large-Scale Pre-training" (CodeReviewer). In *Proc. ESEC/FSE*, 2022. arXiv:2203.09095. doi:10.1145/3540250.3549081.

[4] A. Zverianskii, A. Zhang, J. Clyne, A. Garcia, F. Barez, and S. Upadhyay. "Code Review Bench" (Martian). Withmartian, 2026. https://github.com/withmartian/code-review-benchmark.

[5] D. Nam, T. Kim, D. Ryu, and J. Baik. "ReDef: Do Code Language Models Truly Understand Code Changes for Just-in-Time Software Defect Prediction?" arXiv:2509.09192, 2025.

[6] C. Li et al. "Too Noisy To Learn: Enhancing Data Quality for Code Review Comment Generation." arXiv:2502.02757, 2025.

[7] R. Takizawa. "github-codereview: A Dataset of Human Inline Code-Review Comments with Pre/Post-Fix Context." Hugging Face Datasets, 2025. https://huggingface.co/datasets/ronantakizawa/github-codereview.

[8] H. Li et al. "AIDev: A Large-Scale Dataset of AI-Agent-Authored Pull Requests." Hugging Face Datasets, 2025. https://huggingface.co/datasets/hao-li/AIDev.

[9] C. E. Jimenez, J. Yang, A. Wettig, S. Yao, K. Pei, O. Press, and K. Narasimhan. "SWE-bench: Can Language Models Resolve Real-World GitHub Issues?" arXiv:2310.06770, 2023.
