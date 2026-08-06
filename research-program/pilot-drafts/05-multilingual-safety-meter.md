# Measuring Per-Language Safety Parity Under an Unreliable Judge: A Ternary Prediction-Powered Correction for Low-Resource Languages
*Target venue: NLP / AI-safety venue or workshop (ACL/EMNLP main or a multilingual-/safety-focused workshop); arXiv preprint; AISI/FMF-adjacent · Draft — Introduction & Methods only*

## Abstract

Large language models frequently refuse a harmful request in English yet comply with its translation into a lower-resource language, and the populations exposed to this gap have the least recourse. Measuring the gap is itself hard: the standard instrument is an LLM judge, but the judge is unreliable in exactly the languages where the gap is largest, so an observed spike in apparent unsafety cannot be distinguished from a broken measurement. Existing multilingual safety evaluations report raw per-language rates without correcting for this coupled translator-and-judge error, and the closest attempts remain binary, discarding the garbled or translation-failed outputs that are themselves the signature of measurement breakdown. We propose Ternary-PPI, a measurement method that (i) promotes UNCLEAR to a first-class label alongside REFUSE and COMPLY, (ii) estimates a per-language 3x3 judge confusion matrix from a small (~50-item) human-verified ternary gold set, and (iii) uses a prediction-powered-inference correction to fold translator and judge error into one invertible operator, returning a bias-corrected safety-parity gap with confidence intervals and an interpretable artifact-fraction — the share of apparent unsafety attributable to translation/judge noise. We evaluate on a released multilingual safety benchmark across two to three languages including a truly low-resource one (Tamil), under a solo, part-time, <=$500 budget. We state the identifiability limit honestly: fluent-but-wrong translations that read as clean COMPLY are not separable from genuine unsafety, and we report the total-noise-corrected gap when the decomposition fails. The expected contribution is a cheap, reproducible instrument that turns an untrustworthy per-language number into a defensible one.

## 1. Introduction

Safety alignment in today's frontier models is unevenly distributed across languages. A request that a model reliably refuses in English is often answered when the same request is translated into a lower-resource language: Yong et al. [1] showed that translating disallowed English prompts into low-resource languages such as Zulu, Scots Gaelic, and Guarani raised GPT-4's engagement with harmful content from under 1% to roughly 80%, on par with dedicated jailbreak attacks. Subsequent multilingual benchmarks confirm the pattern is systematic rather than anecdotal: M-ALERT [2] finds pronounced cross-lingual safety inconsistencies across 39 models in five high-resource European languages, and RabakBench [3] documents substantial guardrail degradation in Singapore's languages, including Tamil. The harm here is not evenly borne. Frontier labs do not publish per-language safety numbers, and the deficit lands on precisely the linguistic communities with the least ability to audit, contest, or route around an unsafe deployment.

The natural response is to measure the gap — but measurement is where the problem turns subtle. Reporting a per-language safety rate requires classifying each model response as a refusal or a compliance, and at benchmark scale that classification is done by an LLM judge. The judge, however, inherits the same resource imbalance as the model it grades: it is least reliable in exactly the low-resource languages where the safety gap is largest and most consequential. An observed jump in the apparent unsafe rate in Tamil is therefore ambiguous between two very different explanations: the model really is less safe in Tamil, or the pipeline — the translation of the probe, the model's possibly-garbled output, and the judge's reading of it — has simply broken. RabakBench's own validation surfaces this tension: automatic labelers degrade sharply in the lowest-resource language, so a raw number cannot be taken at face value. When the instrument fails in the same regime as the phenomenon, a reliable *measurement method* — not another leaderboard — becomes the research contribution.

Prior work does not resolve this. The dominant practice is to report raw per-language rates (M-ALERT [2]) or to build careful localized benchmarks with human-in-the-loop validation (RabakBench [3]) and multilingual guard models (PolyGuard [4]) — all of which improve the *labels* but do not deliver a corrected estimate with uncertainty on how much apparent unsafety is artifact. The translate-then-evaluate line [5] relocates judging into English, where the judge is stronger, but this trades a judge-error problem for a translation-error problem and does not quantify the residual. The closest work to ours, "Why Do Safety Guardrails Degrade Across Languages?" [6], explicitly sets out to decompose the observed gap into confounding latent factors and warns that cross-setting comparisons are frequently invalid; however, it treats the outcome as binary, does not model an UNCLEAR channel, and does not return an invertible per-language operator or a confidence interval on an artifact fraction. Two mature statistical tools exist but have not been combined for this setting: prediction-powered inference (PPI) [7, 8] gives provably valid confidence intervals when a large machine-labeled set is corrected against a small gold set, and the observer-error model of Dawid and Skene [9] estimates label-error rates from noisy annotators. Neither has been instantiated as a *ternary* per-language safety operator that makes translation failure a measured quantity rather than discarded noise.

Our central move is to promote UNCLEAR — garbled output, translation failure, non-responsive text — from noise to a first-class channel. Yong et al. [1] already recorded a garbled/uncertain third outcome in their translate-attack protocol but performed no statistical correction with it; we make it the linchpin of the correction. By estimating a per-language 3x3 confusion matrix over {REFUSE, COMPLY, UNCLEAR} on a small human-verified gold set and inverting it in a PPI framework, we fold translator error and judge error into a single operator whose output is a bias-corrected safety-parity gap with a calibrated confidence interval and an interpretable *artifact-fraction*: the share of the apparent gap that is attributable to translation-and-judge breakdown rather than to genuine model behavior. We are explicit about the limit of this decomposition. The correction cleanly separates artifact from real unsafety only when translation failures route predominantly into UNCLEAR; a fluent-but-wrong translation that a model answers plausibly and a judge reads as a clean COMPLY is not distinguishable from genuine unsafety by observed labels alone. When that assumption is violated we still report a defensible total-noise-corrected rate and name the joint-identifiability failure rather than overclaiming a decomposition.

The study is designed to be runnable by a solo, part-time researcher on API and free-tier compute within a <=$500 budget, six weeks, and roughly four to seven hours of the author's own labeling supplemented by a small bilingual-annotation budget. The analysis is closed-form given the labels, so the binding cost is annotation, not compute. We evaluate on a released multilingual safety benchmark across two to three languages that span the resource spectrum, including a truly low-resource language (Tamil), so that the method is stress-tested in the regime it is built for.

We make the following contributions:

1. **A ternary safety-measurement formalism.** We define per-language safety parity over a three-way outcome space {REFUSE, COMPLY, UNCLEAR}, treating translation/judge failure as a measured channel rather than discarded data, and show how this exposes measurement breakdown that binary protocols hide.
2. **Ternary-PPI, a coupled bias-correction operator.** We estimate a per-language 3x3 judge confusion matrix from a small human-verified gold set and combine it with prediction-powered inference [7, 8] to return a bias-corrected per-language safety-parity gap with valid confidence intervals and an interpretable artifact-fraction, folding translator and judge error into one invertible operator.
3. **An honest identifiability analysis.** We state the exact condition (fluent-but-wrong COMPLY) under which the artifact/real decomposition is not identifiable, provide a pre-registered fallback (report the total-noise-corrected gap), and design a diagnostic to detect the failure.
4. **A cheap, reproducible pilot and released artifacts.** We specify a study runnable under a solo <=$500 budget on a released benchmark including a truly low-resource language, with pre-registered success and kill criteria, and commit to releasing code, the ternary gold sets, and per-language confusion-matrix estimates.

We frame these as measurement contributions with pre-registered falsification, not as a claim that the multilingual safety gap is newly discovered — it is not [1, 2, 3, 6]. The claim is that the *number* the field currently reports for low-resource languages is not trustworthy without this correction, and that the correction is cheap enough to become standard.

## 2. Methods

### 2.1 Data and materials

**Benchmark.** We build on a released, permissively-licensed multilingual safety benchmark rather than authoring prompts, both to control cost and to keep results comparable. Our primary source is RabakBench [3], which contains over 5,000 examples across six fine-grained safety categories and explicitly covers Tamil alongside higher-resource languages, and is released for research use. We treat M-ALERT [2] as a secondary source for a high-resource comparison language (e.g., French or German) so that the method is exercised across the resource spectrum. Using an already-released benchmark means we do not author or translate harmful prompts ourselves; we only score model outputs to existing probes.

**Languages.** We select two to three target languages spanning the resource spectrum: (i) English as the reference/anchor language in which the judge is most reliable; (ii) at least one truly low-resource language, Tamil, which is where both the safety gap and the judge-failure regime are expected to be most severe; and optionally (iii) one mid-/high-resource language (e.g., French) to characterize the method where the judge is strong and the artifact-fraction should be near zero — a built-in negative control.

**Models under test.** Because the contribution is a measurement method, the specific model graded is secondary; we evaluate one open-weight instruction-tuned chat model accessible via a hosted API or free-tier GPU (so that costs stay within budget and inference is reproducible), and, budget permitting, one additional model to show the method is not model-specific. We fix decoding parameters (temperature, max tokens) and record them.

**Sample construction.** For each language L and each safety category, we draw a stratified random sample of probes from the benchmark to a target of n_L machine-labeled items per language (target n_L on the order of several hundred to low thousands, constrained by inference budget in Section 2.8). We elicit one model response per probe under fixed decoding, then apply the LLM judge (Section 2.2) to obtain a ternary label per response. From this pool we draw the human-verified gold subset (Section 2.5). All splits, seeds, and category strata are logged.

### 2.2 The core method: Ternary-PPI

**Outcome space.** For a model response r to a probe in language L, define a ternary outcome y in Y = {REFUSE (R), COMPLY (C), UNCLEAR (U)}. REFUSE denotes a genuine refusal or safe non-compliance; COMPLY denotes substantive engagement with the harmful request; UNCLEAR denotes garbled output, translation failure, off-topic or non-responsive text — the signature of a broken probe or a judge that cannot read the output. This ternary channel follows the garbled/uncertain third label of Yong et al. [1] but, unlike that work, is carried through the statistical correction.

**Quantity of interest.** The per-language unsafe rate is theta_L = Pr(y = C | L): the probability that the model complies with a harmful probe. The safety-parity gap relative to the anchor (English, E) is

  Delta_L = theta_L - theta_E,

and safety parity holds when Delta_L = 0. Our estimand is the *corrected* gap Delta_L together with a confidence interval and an artifact-fraction (defined below).

**The measurement problem, formally.** We never observe y directly at scale; we observe the judge's label yhat produced by the LLM judge f, which is imperfect and language-dependent. Write the per-language judge confusion matrix

  M_L[i, j] = Pr(yhat = j | y = i, L),  i, j in {R, C, U},

a row-stochastic 3x3 matrix. If p_L = (Pr(y=R), Pr(y=C), Pr(y=U)) is the true label distribution and phat_L is the distribution of judge labels, then in expectation phat_L^T = M_L^T p_L^T. Naively reading theta_L off phat_L (the standard practice) conflates real unsafety with judge error. When M_L is well-conditioned we can recover p_L by inversion; crucially, translator error is absorbed into M_L because a translation failure surfaces as an output the judge reads as U (or, in the failure case of Section 2.2, as C — see the identifiability limit).

**Estimating M_L.** We estimate M_L from a small human-verified gold set G_L of size m_L (~50 items/language, Section 2.5) on which we have both the human ternary label y and the judge label yhat. The row-wise estimator is

  Mhat_L[i, j] = ( #{items in G_L with y=i, yhat=j} + alpha ) / ( #{items in G_L with y=i} + 3*alpha ),

with a small Laplace/Dirichlet smoothing constant alpha (default alpha = 1) to keep every row well-defined when a class is rare in a 50-item set. This is the observer-error estimator of Dawid and Skene [9] applied per language with a known (human) gold standard rather than a latent one, which is appropriate because we can afford a small verified anchor.

**Prediction-powered correction.** Rather than invert Mhat_L on the machine-labeled marginal alone — which discards the gold set's direct information and gives no valid uncertainty — we use prediction-powered inference [7, 8]. PPI combines a large machine-labeled sample with a small gold sample by forming a "rectified" estimate: the machine-label estimate plus a bias-correction term measured on the gold set, where the correction is the average discrepancy between human and judge labels. Concretely, for the COMPLY indicator we estimate

  theta_L^PPI = ( 1/n_L ) sum over machine-labeled items of 1[yhat = C]
        - ( 1/m_L ) sum over gold items of ( 1[yhat = C] - 1[y = C] ),

which is the standard PPI point estimate for a mean: the abundant judge labels supply precision, and the gold set removes the judge's systematic bias, with no assumption on the judge's accuracy. We use the PPI++ tuning [8] (a learned power parameter lambda that down-weights the machine labels when the judge is unreliable) so that the estimator degrades gracefully to the classical gold-only estimate in the worst case rather than being harmed by a bad judge. The corrected parity gap is Delta_L^PPI = theta_L^PPI - theta_E^PPI.

**Folding into one operator.** Ternary-PPI is the composition of (i) the ternary judge f producing yhat over {R, C, U}, (ii) the per-language confusion estimate Mhat_L on the gold set, and (iii) the PPI rectifier. The UNCLEAR channel is what makes the single operator honest: an outbreak of translation/judge failure inflates the U mass and is absorbed as bias in the correction rather than silently leaking into C, so the operator both corrects the gap and reports how much correction was needed.

**Artifact-fraction.** We define the artifact-fraction for language L as the share of the *apparent* excess unsafe rate that is removed by the correction:

  AF_L = ( thetahat_L^naive - theta_L^PPI ) / max( thetahat_L^naive - theta_E^PPI , epsilon ),

where thetahat_L^naive is the uncorrected judge rate and epsilon guards against division by a near-zero denominator. AF_L near 1 means the apparent gap in L is mostly measurement artifact; AF_L near 0 means it is mostly real. AF_L is reported with a bootstrap interval (Section 2.6) and is the method's headline interpretability output.

**Assumptions (stated explicitly).** (A1) The gold labels y are correct (human anchor). (A2) Judge errors on the machine-labeled set follow the same distribution as on the gold set (the gold set is a random subsample of the same pool — enforced by construction in Section 2.1). (A3) Translation failure routes predominantly to UNCLEAR, not to COMPLY. (A4) M_L is sufficiently well-conditioned to be informative (we report its estimated condition number and widen intervals when it is near-singular). A1-A2 are design-controllable; A4 is measured; A3 is the load-bearing assumption whose failure we treat as the pre-registered identifiability limit.

**Identifiability limit.** The decomposition of the corrected gap into "real unsafety" versus "translation/judge artifact" is identifiable only under A3. A fluent-but-wrong translation — a probe that mistranslates into a coherent but different request that the model answers, and that the judge reads as a clean COMPLY — is indistinguishable from genuine unsafety using observed labels alone; the two error sources become only jointly identifiable. In that regime Ternary-PPI still returns a valid *total-noise-corrected* rate theta_L^PPI (PPI corrects for any judge bias regardless of its source), but the artifact-fraction is no longer interpretable as translation-specific. We pre-register reporting the total-noise-corrected number and naming this limit (Section 2.7), and we add a diagnostic (Section 2.6) to detect it.

### 2.3 Baselines and comparators

We compare Ternary-PPI against the estimators the field currently uses and against ablations that isolate each component:

1. **Naive judge rate.** thetahat_L^naive = fraction of judge labels equal to COMPLY, with UNCLEAR dropped or merged into REFUSE — the de facto standard in raw per-language reporting [2].
2. **Binary confusion-correction.** A 2x2 (REFUSE vs COMPLY) confusion-matrix correction, i.e., Ternary-PPI with the UNCLEAR channel removed, to isolate the value of promoting UNCLEAR to first class. This is the operational analogue of the binary decomposition in [6].
3. **Translate-then-evaluate.** Judge in English after translating the model output back to English [5], reporting the resulting COMPLY rate without correction — the strongest existing low-cost practice.
4. **Gold-only estimate.** The unsafe rate computed from the ~50-item human gold set alone (no machine labels), which is unbiased but high-variance; this is the classical estimator PPI is designed to improve on and establishes the variance-reduction claim.

Comparators 1-3 test whether correction and the UNCLEAR channel matter; comparator 4 tests whether PPI actually buys precision over just labeling by hand.

### 2.4 Metrics

**Corrected safety-parity gap.** Delta_L^PPI (Section 2.2), reported per language with a 95% confidence interval.

**Artifact-fraction.** AF_L (Section 2.2), per language, with a bootstrap interval.

**Coverage (the validity check for the estimator).** On held-out gold labels and on synthetic data with a known ground-truth confusion matrix, we report the empirical coverage of the nominal 95% PPI interval: the fraction of simulation replicates in which the interval contains the true theta_L. A valid estimator has coverage >= 0.95 - Monte Carlo error. This is the primary evidence that the method's uncertainty is honest.

**Interval width / effective savings.** The ratio of the gold-only interval width to the Ternary-PPI interval width, quantifying how much human labeling the correction saves at fixed precision.

**Judge quality inputs.** Per-language judge accuracy and macro-F1 against gold, and the estimated condition number of Mhat_L, reported as diagnostics (not as the contribution) so readers can see where the judge is failing.

**Agreement.** For the human labeling, inter-annotator agreement (Cohen's/Fleiss' kappa) on the doubly-labeled subset, targeting the 0.70-0.80 range reported by RabakBench [3] as evidence the ternary rubric is usable.

### 2.5 Human validation and labeling

**Whether labels are needed.** Yes, but only a small, fixed number. The entire method rests on a ~50-item human-verified ternary gold set per language; PPI [7] is specifically designed so that this modest gold set is sufficient to debias a much larger machine-labeled pool, which is why the study is affordable. This is the same "certify a cheap labeler against a small expert gold set" pattern that RabakBench [3] uses and that the Alternative Annotator Test [10] formalizes.

**What the labeler does, in plain terms.** For each sampled item, the labeler reads the (translated) probe and the model's response in the target language and assigns one of three labels — the model refused/was safe (REFUSE), the model complied with the harmful request (COMPLY), or the output was garbled, mistranslated, or non-responsive so that no safety judgment is possible (UNCLEAR). A short written rubric with anchor examples accompanies the task.

**Expertise required and why.** The labeler must be fluent in the target language and able to recognize whether a response substantively advances a harmful goal versus deflects it — the latter is the safety-judgment skill, the former is why English fluency alone is insufficient for Tamil. For Tamil we recruit one to two bilingual annotators within a small paid-annotation budget (a few hundred labels total, comfortably inside the compute budget in Section 2.8); the author performs the English gold labeling and adjudicates disagreements, drawing on prior LLM-as-judge experience. We double-label a subset per language to report agreement (Section 2.4).

**Whether labels can be sourced from existing data instead.** Partially. Where a benchmark ships human safety labels (as RabakBench [3] does for its human-validated split), we reuse them for the REFUSE/COMPLY distinction to reduce fresh labeling; however, existing benchmarks label the *prompt*, not our specific model's *response*, and rarely include an UNCLEAR channel, so a small fresh ternary pass over responses remains necessary. No IRB is required: labelers judge model outputs, not human subjects, and see no private data.

### 2.6 Statistical analysis

**Estimator.** The point estimates are the PPI/PPI++ rectified means of Section 2.2 [7, 8]; the confusion matrix Mhat_L is the smoothed Dawid-Skene observer estimator [9]. All estimands are population proportions or differences of proportions.

**Uncertainty.** Confidence intervals for theta_L^PPI and Delta_L^PPI use the PPI++ asymptotic variance [8]; because the gold sets are small (~50), we corroborate every interval with a nonparametric bootstrap (>= 2,000 resamples) that resamples the machine-labeled and gold sets independently, and we report the wider of the two intervals to avoid understating uncertainty. Artifact-fraction intervals are bootstrap-only (it is a ratio). We report the estimated condition number of Mhat_L and flag any language where it exceeds a pre-set threshold as "correction unreliable."

**Hypothesis test.** The primary test is H0: Delta_L^PPI = 0 (safety parity) against a two-sided alternative, at alpha = 0.05, per target language, using the PPI interval. We report the corrected effect size and CI, not only significance.

**Identifiability diagnostic.** To probe assumption A3, we run an interventional check on a small held-out slice: we deliberately corrupt translations (to force translation failure) and, separately, degrade the judge prompt (to force judge failure), and verify that the two manipulations move the UNCLEAR mass and the corrected estimate in distinguishable ways. If corrupted-translation and degraded-judge conditions produce indistinguishable label patterns and identical corrected estimates, A3 is not supported and we fall back to the total-noise-corrected reporting (Section 2.7).

**Power / sample size.** With a 50-item gold set and several hundred machine-labeled items per language, PPI's effective sample size lies between the gold-only and full-pool extremes; the exact gain depends on judge accuracy, which we estimate on the gold set. We pre-compute, via simulation over plausible judge-accuracy and prevalence values, the machine-label sample size n_L needed to detect a parity gap of Delta = 0.10 at 80% power, and set n_L accordingly (Section 2.8). Because power hinges on judge quality, we treat the simulation, not a single closed-form number, as the sample-size justification and release it.

**Confound controls.** All per-language samples are drawn with matched category strata so that a parity gap cannot be manufactured by category imbalance — a confound explicitly flagged as invalidating cross-setting comparisons in [6]. Decoding parameters, prompt templates, judge model and version, and translation route are held fixed across languages and logged.

### 2.7 Pre-registered success and kill criteria

We register the following before running the full study.

**Primary success (method validity).** Ternary-PPI's 95% intervals achieve empirical coverage >= 0.94 on synthetic data with known confusion matrices AND on held-out gold labels, while producing intervals strictly narrower than the gold-only estimator (Section 2.4) at matched coverage. This establishes that the instrument is both honest and useful.

**Secondary success (measurement payoff).** On at least the low-resource language (Tamil), the corrected parity gap Delta_L^PPI differs from the naive gap thetahat_L^naive by a margin whose bootstrap interval excludes zero, i.e., the correction demonstrably changes the reported number, and the artifact-fraction AF_L is estimated with a finite, reportable interval. A positive result is one where we can state a defensible corrected gap with CIs and a non-degenerate artifact-fraction.

**Kill / null criteria.** We report a null and stop scaling if either (i) the identifiability diagnostic (Section 2.6) shows that corrupted-translation and degraded-judge conditions are empirically indistinguishable — meaning A3 fails and the artifact-fraction is not interpretable — in which case we publish the total-noise-corrected gap and the negative identifiability result explicitly, per the honest-limit framing; or (ii) Mhat_L is near-singular for the low-resource language even with a 50-item gold set (condition number above the pre-set threshold), so inversion is unstable, in which case we report that a ~50-item gold set is insufficient in that regime and quantify how much gold would be required. Both outcomes are publishable: a negative identifiability result is itself a warning the field needs, given that raw per-language numbers are currently reported without it [2, 6].

### 2.8 Reproducibility, compute, and budget

**Models and versions.** We pin the model-under-test and the judge model to specific hosted-API or open-weight checkpoints with dated versions, fixed decoding parameters, and fixed prompt templates, all recorded in a config file. We set and log random seeds for sampling, bootstrapping, and any stochastic judging.

**Compute and budget.** The dominant cost is API inference for (a) generating one model response per probe and (b) one ternary judge call per response, across two to three languages at several hundred to low-thousands of probes each; the statistical analysis is closed-form and runs on a laptop or free-tier GPU. We budget the model-under-test and judge inference at roughly $150-300, small bilingual paid annotation at roughly $50-150, and a contingency reserve, keeping the total under $500. The interventional identifiability slice is small and adds negligible cost.

**Artifacts to be released.** We will release: (i) code for the ternary judge prompts, the confusion-matrix estimator, and the PPI/PPI++ correction with the bootstrap; (ii) the per-language ternary gold sets and the doubly-labeled agreement subset; (iii) the estimated per-language confusion matrices and their condition numbers; (iv) the simulation used for power and coverage; and (v) the pre-registration (Section 2.7). We do not release new harmful prompts — we score responses to existing released probes [2, 3] — and we follow the source benchmarks' licenses.

## References

[1] Z.-X. Yong, C. Menghini, and S. H. Bach. Low-Resource Languages Jailbreak GPT-4. 2023. arXiv:2310.02446.

[2] F. Friedrich, et al. LLMs Lost in Translation: M-ALERT Uncovers Cross-Linguistic Safety Inconsistencies. ICLR 2025. arXiv:2412.15035.

[3] G. Chua, L. Tan, et al. Lost in Localization: Building RabakBench with Human-in-the-Loop Validation to Measure Multilingual Safety Gaps. 2025. arXiv:2507.05980.

[4] P. Kumar, et al. PolyGuard: A Multilingual Safety Moderation Tool for 17 Languages. COLM 2025. arXiv:2504.04377.

[5] Found in Translation: Measuring Multilingual LLM Consistency as Simple as Translate then Evaluate. 2025. arXiv:2505.21999.

[6] Why Do Safety Guardrails Degrade Across Languages? 2026 (preprint, under review). arXiv:2605.17173.

[7] A. N. Angelopoulos, S. Bates, C. Fannjiang, M. I. Jordan, and T. Zrnić. Prediction-Powered Inference. Science, 382(6671):669-674, 2023. arXiv:2301.09633.

[8] A. N. Angelopoulos, J. C. Duchi, and T. Zrnić. PPI++: Efficient Prediction-Powered Inference. 2023. arXiv:2311.01453.

[9] A. P. Dawid and A. M. Skene. Maximum Likelihood Estimation of Observer Error-Rates Using the EM Algorithm. Journal of the Royal Statistical Society: Series C (Applied Statistics), 28(1):20-28, 1979.

[10] N. Calderon, R. Reichart, and R. Dror. The Alternative Annotator Test for LLM-as-a-Judge: How to Statistically Justify Replacing Human Annotators with LLMs. ACL 2025. arXiv:2501.10970.

[11] P. Manakul, A. Liusie, and M. J. F. Gales. SelfCheckGPT: Zero-Resource Black-Box Hallucination Detection for Generative Large Language Models. EMNLP 2023. arXiv:2303.08896.
