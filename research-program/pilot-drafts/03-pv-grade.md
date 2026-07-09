# PV-Grade: A Public Benchmark for the Decision Quality of Large Language Models on Liability-Bearing Pharmacovigilance Tasks
*Target venue: clinical-NLP / medical-informatics (JAMIA or Drug Safety short paper; ACL clinical-NLP or ML4H workshop; arXiv preprint) · Draft — Introduction & Methods only*

## Abstract

Regulators now expect drug-safety ("pharmacovigilance", PV) systems that use artificial intelligence to be independently validated for the specific decisions they inform, yet no public benchmark exists against which such systems can be measured. We introduce **PV-Grade**, an openly released benchmark that grades large language models (LLMs) on four consequential PV decisions applied to individual case safety reports (ICSRs): drug–event **causality** (graded on the WHO–UMC / CIOMS scale), **seriousness**, **expectedness**, and **narrative faithfulness** (whether a model's case summary is grounded in the source ICSR). Ground truth is assembled without purchasing labels: seriousness and expectedness are derived by published rule from structured public FAERS fields; causality is anchored to a small expert-adjudicated gold set because it has no universal reference standard; and faithfulness is scored by an LLM judge validated against human labels, extending prior work on grounding judgment for retrieval-augmented generation. We report an honest, calibrated leaderboard across frontier and open-weight models, with agreement statistics, bootstrap confidence intervals, and prediction-powered estimates that correct automatic labels using the human anchor. We pre-register a positive result (the LLM judge reaches substantial agreement with human causality labels; per-decision accuracies are separable across models) and a null-and-stop condition (the judge fails to clear the agreement floor). The contribution is the first reproducible instrument for the decisions that PV validation actually turns on, together with an explicit account of its measurement-validity limits.

## 1. Introduction

Pharmacovigilance is the science of detecting, assessing, and preventing adverse effects of medicines after they reach patients. Its operational unit is the individual case safety report (ICSR): a structured-plus-narrative record of a suspected adverse drug reaction. Every day, safety teams and regulators make a small number of high-consequence judgments on these reports — whether the drug plausibly *caused* the event, whether the event is *serious*, whether it is *expected* given the product's known profile, and whether a case summary *faithfully* reflects its source. These are not incidental annotations; they gate expedited regulatory reporting, signal detection, and, ultimately, whether a dangerous reaction is escalated or missed. A single-digit change in the accuracy of these decisions has a direct safety and liability footprint.

Large language models are being deployed against exactly these tasks — case intake, coding, narrative generation, and triage — and their use is now the subject of explicit regulatory attention. The U.S. FDA's 2025 draft guidance on AI to support regulatory decision-making sets out a risk-based *credibility assessment* framework in which the evidence required scales with the decision's consequence and the AI's role in it [1]. The CIOMS Working Group XIV report on AI in pharmacovigilance, aligned with EMA and WHO positions, makes validity, robustness, and human oversight central obligations for context-of-use deployment [2]. The common thread is a demand for *decision-specific, independent validation*: it is not enough to show that a model extracts fields accurately; a deployer must show that the model is accurate on the decisions the deployment actually informs.

There is, however, no public instrument that measures this. To our knowledge, no released benchmark or dataset grades LLMs on the four PV decisions above; vendor due-diligence practice reflects the vacuum by advising buyers to hand-build their own small internal test sets because none is available. The closest published work, *Robust or Suggestible?* [3], touches all four decision areas on FAERS data, but studies them as a *demographic-robustness / bias* probe — it asks whether socio-demographic personas shift a model's predictions, not how accurate those predictions are, and it releases no benchmark and reports no headline decision accuracy. The result is a field with a well-articulated validation *requirement* and no shared *yardstick* to satisfy it. This is the gap PV-Grade addresses.

Building such a yardstick is non-trivial for a specific reason that we treat as a first-class methodological concern rather than a footnote: **causality assessment has no universal gold standard.** The two most established instruments — the WHO–UMC global-introspection categories [4] and the Naranjo probability scale [5] — are expert-consensus methods with only moderate inter-rater agreement, and structured algorithms disagree with global introspection on a non-trivial fraction of cases. Any benchmark that reports a single "correct" causality label without acknowledging this is measuring its own annotation policy, not ground truth. We therefore design PV-Grade so that its two rule-derivable decisions (seriousness, expectedness) are anchored to published, reproducible criteria applied to structured FAERS fields, while its two judgment-laden decisions (causality, faithfulness) are treated as measurement problems: causality is scored against a small, expert-adjudicated gold set with reported agreement and uncertainty, and faithfulness is scored by an LLM judge that is *itself validated* against human labels before it is trusted. This last step is a direct extension of prior work on LLM-as-judge grounding for hallucination detection in retrieval-augmented generation, where the object of judgment is precisely whether a generated summary is supported by a source document [6, 7, 8].

We also want the benchmark to be *honest* in a way leaderboards frequently are not. Automatic labels are cheap but biased; human labels are trustworthy but scarce. Rather than choose one, we combine them using prediction-powered inference [9], which produces valid confidence intervals for a model's accuracy by de-biasing a large automatically-labeled sample with a small human-labeled anchor. This lets us report calibrated per-decision accuracies — with intervals that widen honestly when the human anchor is thin — instead of a single optimistic number.

We make the following contributions:

1. **A public benchmark, PV-Grade,** that grades LLMs on four liability-bearing PV decisions (causality, seriousness, expectedness, narrative faithfulness), constructed entirely from public FAERS data plus published clinical criteria, with a released dataset, prompts, and scoring code.
2. **A rule-based gold protocol** that makes seriousness and expectedness reproducible from structured fields, paired with an explicit, small, expert-adjudicated causality gold set that reports inter-rater agreement instead of pretending to a universal standard.
3. **A validated LLM-as-judge for narrative faithfulness,** extending prior grounding-judgment methodology, together with a prediction-powered leaderboard that reports calibrated per-decision accuracy with confidence intervals across frontier and open-weight models.
4. **A pre-registered analysis** with quantitative success and null-and-stop criteria, and a candid treatment of causality's measurement-validity ceiling as a stated limitation rather than a hidden one.

## 2. Methods

### 2.1 Data and materials

**Primary source.** All case data are drawn from the FDA Adverse Event Reporting System (FAERS), a public-domain database of adverse-event and medication-error reports released as downloadable quarterly extracts. FAERS is not subject to copyright and requires no license or data-use agreement; it contains no direct patient identifiers. We use the structured tables (demographics, drug, reaction, outcome, indication, report source) and, where available in the public extracts, the associated MedDRA-coded verbatim reaction terms. Because access is by public download, the study requires no IRB review and no data-purchase budget.

**Case construction.** We sample a benchmark of ICSR-derived cases stratified to be usable and non-degenerate. The target sample is *n* ≈ 1,000 cases, drawn from recent quarters, filtered to reports that (i) contain at least one suspect drug, one coded reaction, and a populated seriousness/outcome field, and (ii) are complete enough that a human could in principle make the four decisions. Because FAERS provides structured fields but not always a free-text narrative, each case is rendered into a standardized natural-language case narrative by a *fixed, model-independent* template (drug, dose/indication where present, reaction term(s), temporal and outcome fields), so that all graded models see identical inputs and no model is advantaged by input formatting. For the faithfulness task we additionally construct *paired* items: a faithful summary (grounded in the case) and a perturbed summary that introduces a controlled unsupported claim (e.g., an added reaction, an altered seriousness, a fabricated temporal relationship), following the perturbation-and-detection paradigm standard in citation and grounding evaluation [7, 8].

**Reference product information.** Expectedness requires a reference list of labeled reactions for the suspect product. Where a machine-readable reference exists (e.g., structured product-label reaction sections), we use it; where it does not, the case is excluded from the expectedness subset rather than guessed, and this exclusion is reported. This keeps the expectedness gold reproducible at the cost of coverage, which we state.

### 2.2 The PV-Grade grading procedure

Let a case be $c$ with a model-independent narrative $x(c)$. A graded model $m$ is queried with a fixed prompt template $p_d$ for each decision $d \in \{\text{caus}, \text{ser}, \text{exp}, \text{faith}\}$, producing a structured answer $\hat{y}_{m,d}(c)$ and, where the prompt elicits it, a confidence. Each decision has an output space and a gold source:

- **Causality** ($d=\text{caus}$): output is an ordinal WHO–UMC category (*certain / probable / possible / unlikely / unclassifiable*) [4]; the model may optionally emit a Naranjo-style score [5], which we bucket to the same ordinal scale. Gold is the expert-adjudicated label from §2.5 (small set), reported with agreement statistics; we do **not** claim a universal reference standard.
- **Seriousness** ($d=\text{ser}$): binary (*serious / non-serious*) plus, where present, the ICH E2B seriousness sub-criteria (death, life-threatening, hospitalization, disability, congenital anomaly, other medically important). Gold is *rule-derived* from the structured FAERS outcome/seriousness fields by a published, deterministic mapping $g_\text{ser}(\cdot)$; this is the highest-reliability subset by construction.
- **Expectedness** ($d=\text{exp}$): binary (*expected / unexpected*), gold-derived by matching the coded reaction against the reference labeled-reaction list $L$ for the product, $g_\text{exp}(c) = \mathbb{1}[\text{reaction}(c) \notin L]$, restricted to cases with a machine-readable $L$.
- **Faithfulness** ($d=\text{faith}$): binary (*faithful / unfaithful*) on the paired summaries, i.e., does the summary make only claims supported by $x(c)$. Gold is the construction label (faithful item = supported; perturbed item = unsupported) for the automatically-generated subset, and the human label from §2.5 on the audited subset. Faithfulness is scored by a validated LLM judge $J$; the judge is treated as an *estimator to be measured*, not an oracle.

For a decision $d$ over a set of cases $C$, a model's raw accuracy is
$$\text{Acc}_{m,d} = \frac{1}{|C|}\sum_{c \in C} \mathbb{1}\!\left[\hat{y}_{m,d}(c) = g_d(c)\right],$$
with ordinal causality additionally scored by quadratic-weighted Cohen's $\kappa$ against the gold ordinal so that near-misses (probable vs. possible) are penalized less than gross errors (certain vs. unlikely).

**Assumptions, stated.** (A1) The template $x(c)$ is a faithful, model-neutral rendering of the structured case — audited on a sample (§2.5). (A2) The rule maps $g_\text{ser}, g_\text{exp}$ are correct *transcriptions of published criteria*, not clinical truth; they inherit FAERS reporting quality, which we treat as the operational target of validation (a deployer must be right about what the report says). (A3) Causality gold is a *human-consensus* label with quantified disagreement, not a ground-truth cause; all causality claims are conditioned on this.

### 2.3 Baselines and comparators

The comparators are the graded systems themselves plus reference points that make the numbers interpretable:

1. **Frontier LLMs** accessed by API (a small, fixed panel of current frontier chat models), zero-shot with the fixed prompts.
2. **Open-weight LLMs** run on free-tier / low-cost GPU (e.g., a mid-size instruction-tuned open model and one small model), to establish the accessible-compute frontier and support full reproducibility for readers without API budgets.
3. **A rule/lexical baseline** for seriousness and expectedness (direct application of $g_\text{ser}, g_\text{exp}$ to the *narrative* via keyword extraction), which lower-bounds the task and exposes whether LLMs add value over transcription.
4. **A majority-class baseline** per decision, to contextualize accuracy against class imbalance (e.g., seriousness prevalence).

For faithfulness we additionally compare the LLM judge $J$ against a standard NLI-entailment scorer as a non-LLM grounding baseline, consistent with entailment-based citation/support evaluation [8], to show the judge is not merely re-encoding a cheaper signal.

### 2.4 Metrics

For each model $m$ and decision $d$ we report:

- **Accuracy** and, for imbalanced binary decisions, **balanced accuracy** and **macro-F1**:
$$\text{macro-F1}_{m,d} = \frac{1}{2}\left(F_1^{+} + F_1^{-}\right).$$
- **Agreement with gold** for causality via **quadratic-weighted $\kappa$**; for binary decisions via **Cohen's $\kappa$** to correct for chance.
- **Calibration** (Brier score / expected calibration error) where the model emits a usable confidence, since PV triage cares about *how sure* a model is, not only whether it is right.
- **Judge validity** (for $J$ only): agreement of $J$ with human faithfulness labels, reported as $\kappa$ and as an **Alternative Annotator Test** outcome — does $J$ agree with the human panel at least as well as a held-out human annotator does, at a stated cost handicap [10]. This is the gate that licenses using $J$ on the large unlabeled portion.

"Success" on a decision is defined per-metric against the pre-registered bars in §2.7; a model "wins" a decision only on non-overlapping confidence intervals, not point estimates.

### 2.5 Human validation and labeling

Human labels are needed for exactly two purposes, both small and both feasible within the author's ~4–7 hour manual budget plus a small paid-annotation top-up:

1. **Causality gold set (author + one clinician review).** For a random subset of ≈ 60–80 cases, the author assigns a WHO–UMC causality category by applying the published WHO–UMC criteria to the standardized narrative; a clinically-qualified second rater (a pharmacist or physician recruited for a small paid session) independently rates the same cases. The plain task: *read the case and choose one of five causality categories using the WHO–UMC decision rules.* Domain expertise is required because causality is an expert-consensus judgment; a single lay label would not be defensible, which is precisely why we report **inter-rater agreement** ($\kappa$) and adjudicate disagreements rather than assert a single truth. This set anchors both the causality leaderboard and the prediction-powered correction (§2.6).

2. **Faithfulness audit (author only).** For ≈ 100 summary items, the author labels *faithful / unfaithful* — the plain task: *does the summary state anything the case does not support?* This is the author's established competency (grounding judgment for RAG hallucination) and needs no external clinician. These labels validate the LLM judge $J$ (§2.4) and de-bias its automatic labels (§2.6).

Seriousness and expectedness require **no** new human labeling: their gold is sourced directly from existing structured FAERS fields and published criteria, which is the core cost-avoidance move of the design. We also manually audit a ≈ 30-case sample of template renderings $x(c)$ to check assumption A1.

### 2.6 Statistical analysis

**Estimation.** Per-decision accuracy is an average of indicators; we report **95% bias-corrected accelerated (BCa) bootstrap** confidence intervals over cases (10,000 resamples), which make no normality assumption and handle the small causality subset honestly. Between-model comparisons use paired bootstrap over the shared case set; a model is reported as better only if the paired difference interval excludes zero.

**Prediction-powered correction.** For causality and faithfulness, where a large automatically-labeled set is paired with a small human-labeled anchor, we report **prediction-powered inference (PPI)** estimates of accuracy [9]: PPI de-biases the automatic labels using the human anchor and yields valid intervals that reduce to the human-only interval when the automatic labeler is uninformative and tighten as it becomes reliable. This is what lets a solo study report a *calibrated* number from mostly-automatic labels without over-claiming.

**Judge validation as a hypothesis test.** Before $J$ is used at scale, we test $H_0$: "$J$ does not reach the pre-registered agreement floor with humans." Failing to reject at the human-anchor sample size triggers the null path (§2.7).

**Confounds and power.** (i) *Class imbalance*: reported via balanced accuracy / $\kappa$, not raw accuracy alone. (ii) *Template artifacts*: the audit of $x(c)$ (A1) and the rule/lexical baseline guard against the LLMs merely exploiting formatting. (iii) *Causality subset size*: with ≈ 70 gold causality cases, a $\kappa$ of ~0.6 is estimable with a 95% interval half-width on the order of ±0.15; we pre-state that causality conclusions are *interval-reported and hedged*, and that the seriousness/expectedness subsets (n up to ~1,000) carry the statistically strong claims. (iv) *Prevalence drift* across FAERS quarters is controlled by fixing the sampling window and reporting it.

### 2.7 Pre-registered success and kill criteria

We pre-register the following before running the graded models on the full set.

**Judge-validity gate (must pass first).** The faithfulness judge $J$ is accepted only if it reaches **Cohen's $\kappa \ge 0.6$** with the human faithfulness labels *and* passes the Alternative Annotator Test at a modest cost handicap [10]. If $J$ does not clear this bar, we **do not** publish a faithfulness leaderboard; we report the judge-validation null ("an off-the-shelf LLM judge is not yet a valid faithfulness grader for ICSRs") and restrict the benchmark to causality/seriousness/expectedness.

**Positive result (benchmark ships as designed).** Declared if *all* of: (a) the judge-validity gate passes; (b) on seriousness and expectedness, at least one graded model exceeds its majority-class baseline with a paired-bootstrap interval excluding zero; (c) the per-decision accuracy ordering across models is *separable* on at least two of four decisions (non-overlapping 95% intervals for the best vs. worst model); and (d) causality inter-rater agreement between the two human raters reaches $\kappa \ge 0.5$ (i.e., the gold itself is coherent enough to grade against).

**Null-and-stop (report and halt the causality-leaderboard claim).** If human inter-rater causality agreement is $\kappa < 0.4$, we **do not** publish a causality accuracy leaderboard; we report the measurement-validity null ("causality gold is not reliably constructible at this scale/policy") and ship only the rule-based decisions plus faithfulness. If additionally (b) fails — no model beats majority class on the rule-based decisions — we report the full null: current LLMs do not add measurable decision value on public-ICSR PV tasks under this protocol, and stop.

This design guarantees a publishable artifact on either branch: a working benchmark, or a documented, quantified account of why the hardest decision cannot yet be benchmarked cheaply.

### 2.8 Reproducibility, compute, and budget

**Models and versions.** The graded panel comprises a small fixed set of frontier API models and 1–2 open-weight models; exact model identifiers, API dates, and quantization settings are pinned in the release. All prompts are fixed strings released verbatim; decoding is greedy (temperature 0) for graded outputs, with seeds fixed where the API honors them, and each item is queried once with a documented (small) re-query audit to characterize residual nondeterminism.

**Compute and cost.** Inference is API-metered plus free-tier / low-cost GPU for open models. With *n* ≈ 1,000 cases × 4 decisions × ~6 models × single-pass greedy decoding, plus judge calls on the faithfulness subset, projected API spend is on the order of $150–300; open-model runs are near-zero on free-tier GPU. Paid annotation (one clinician session for the causality gold) is budgeted at ≤ $150. Total is comfortably within the ≤ $500 envelope and ≤ 6-week part-time timeline.

**Artifacts released.** (1) The PV-Grade case set (FAERS-derived narratives + task labels, with the rule scripts $g_\text{ser}, g_\text{exp}$ and the reference-list construction), (2) the human causality and faithfulness gold sets with per-rater labels and agreement, (3) all prompts and the judge specification, (4) scoring, bootstrap, and PPI code, and (5) the leaderboard with confidence intervals. Everything derives from public-domain FAERS and published criteria, so the artifact is redistributable; the release documents the exact FAERS quarters used.

## References

[1] U.S. Food and Drug Administration. *Considerations for the Use of Artificial Intelligence to Support Regulatory Decision-Making for Drug and Biological Products.* Draft Guidance for Industry, January 2025.

[2] Council for International Organizations of Medical Sciences (CIOMS). *Artificial Intelligence in Pharmacovigilance.* Report of CIOMS Working Group XIV, 2025.

[3] Robust or Suggestible? Exploring Non-Clinical Induction in LLM Drug-Safety Decisions. arXiv:2510.13931, 2025.

[4] World Health Organization – Uppsala Monitoring Centre. *The Use of the WHO–UMC System for Standardised Case Causality Assessment.* WHO/UMC.

[5] Naranjo CA, Busto U, Sellers EM, et al. A method for estimating the probability of adverse drug reactions. *Clinical Pharmacology & Therapeutics*, 30(2):239–245, 1981.

[6] Manakul P, Liusie A, Gales MJF. SelfCheckGPT: Zero-Resource Black-Box Hallucination Detection for Generative Large Language Models. arXiv:2303.08896, 2023.

[7] Es S, James J, Espinosa-Anke L, Schockaert S. RAGAS: Automated Evaluation of Retrieval Augmented Generation. arXiv:2309.15217, 2023.

[8] Gao T, Yen H, Yu J, Chen D. Enabling Large Language Models to Generate Text with Citations (ALCE). arXiv:2305.14627, 2023.

[9] Angelopoulos AN, Bates S, Fannjiang C, Jordan MI, Zrnić T. Prediction-powered inference. *Science*, 382(6671):669–674, 2023. DOI: 10.1126/science.adi6000.

[10] Calderon N, Reichart R, Dror R. The Alternative Annotator Test for LLM-as-a-Judge: How to Statistically Justify Replacing Human Annotators with LLMs. arXiv:2501.10970, 2025.
