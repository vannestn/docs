# Method-Transfer Solutions — re-angling the METHOD, not the business

*Written 2026-07-09. Companion to [14 · Creative re-angles](14-creative-reangles.md), which re-angled the
business SHAPE of the four surviving problems. This round re-angles the **method**. It mines the top papers'
techniques for the sub-problems that still lack good solutions, then **mutates / combines / transfers** those
techniques across fields to invent creative technical solutions, then vets each adversarially for scoop risk
and soundness.*

## The approach: inspiration by alter / combine / transfer

The [problem-validation pass](13-problem-validation.md) left every surviving problem with the same shape: the
pain is real and the *business* is hard, but the durable, unowned core is a **measurement / method** gap. The
bottleneck is not "is there a problem" — it is "is there a method that cracks the crux without a lab, without
labels, or without capital the crux says you don't have."

So this pass treats existing published methods as raw material and applies three operations, borrowed from the
oldest move in research — *inspiration from prior work*:

- **ALTER (mutate):** take one method and change one load-bearing variable — the axis of stochasticity, the
  polarity of the manipulation, the unit of analysis, the direction of an inversion.
- **COMBINE:** fuse two or more methods so each supplies what the other structurally lacks (e.g. a live
  process signal + a delayed outcome label; a cheap noisy sensor + a statistical de-biaser).
- **TRANSFER:** import a mature apparatus from a distant field (psychometrics, manufacturing QC, pharmacology,
  epidemiology) into a problem it was never built for but fits exactly.

Every candidate was then run through an adversarial **prior-work check** (targeted web/arXiv/GitHub searches
against each component *and* the assembled artifact) and an independent **judge** scoring it on addresses-the-crux,
novelty, feasibility, soundness, impact, and ship-speed. The composite is the judge's weighted score; the
prior-work verdict is separate and can veto novelty even when the composite is high. Nothing here is
SURVIVES-CLEAN — every survivor is **SURVIVES-WITH-DELTA**, because in a fast-moving field the honest finding is
that the *idea* is rarely new; the defensible contribution is the specific synthesis plus a testable claim.

Problem keys used below map to the [validation doc](13-problem-validation.md):
`automation-complacency`, `silent-ingestion` (RAG parse fidelity), `almost-right-code` (subtle-logic catch vs
FP noise), `non-english-safety`, `prompt-injection-adaptive-eval`, `fabricated-citation-semantic`.

---

## Ranked table of vetted solutions

Composite is the judge's 0–100 score. "Op" = the transfer operation. Verdict is the final judge verdict
(all survivors are SURVIVES-WITH-DELTA on prior-work). STRONG = advance-candidate; PROMISING = live but
delta-dependent; WEAK = do not advance.

| # | Title | Problem | Op | Comp | Prior-work | Verdict | One-line |
|--:|---|---|---|--:|---|---|---|
| 1 | **Stamp Score** | automation-complacency | combine | 80.8 | survives-w-delta | PROMISING | LLM-graded review-depth + counter-argument rate, validated against git **revert/hotfix history as free retroactive ground truth**. |
| 2 | **MetaParse** | silent-ingestion | transfer+combine | 80.0 | survives-w-delta | PROMISING | Hold the OCR engine fixed, perturb the **render** along semantically-null axes; a number cell whose value flips is a corruption fingerprint. |
| 3 | **NullPatch** | almost-right-code | mutate+transfer | 78.3 | survives-w-delta | PROMISING | Seed **behavior-preserving-but-scary-looking** diffs, each proven clean by an oracle, to measure the reviewer false-positive floor. |
| 4 | **Ternary-PPI** | non-english-safety | combine+mutate | 76.7 | survives-w-delta | PROMISING | 3×3 per-language judge confusion matrix that promotes **UNCLEAR to a first-class channel** and folds translator+judge error into one invertible operator. |
| 5 | **SubtleMutants ROC-Bench** | almost-right-code | combine+transfer | 76.7 | survives-w-delta | PROMISING | Test-passing subtle mutants + matched clean negatives; sweep reviewer confidence to plot **catch-rate vs FP as an operating curve** with the FPR≤30% trust cutoff. |
| 6 | **CiteLeak** | fabricated-citation-semantic | combine+mutate | 75.0 | survives-w-delta | PROMISING | Destroy the evidence, keep the claim plausible; **Leakage Rate = fraction of verdicts that DON'T flip** proves whether a checker reads the source or recalls it. |
| 7 | **OracleProof** | prompt-injection-adaptive-eval | mutate | 73.3 | survives-w-delta | PROMISING | Attack the **grader**, not the defense: a cross-oracle gameability score (LLM-judge / consensus / state-diff), bidirectional. |
| 8 | **PARITY-DIF** | non-english-safety | transfer | 70.0 | survives-w-delta | PROMISING | Import psychometrics' Differential Item Functioning: uniform DIF = real safety gap; item-level decoupling = broken probe. |
| 9 | **InjectCal** | silent-ingestion | combine | 70.0 | survives-w-delta | PROMISING | Repoint an open corruption-injection engine at numeric cells to manufacture labels; train a tiny calibrated fusion classifier. |
| 10 | **Dawid-Skene Parity** | non-english-safety | combine | 69.2 | survives-w-delta | PROMISING | Native + multiple pivot-translation routes as **decorrelated noisy sensors**; Dawid-Skene + PPI anchor for label-free per-language rates. |
| 11 | **Dose-Response of AI complacency** | automation-complacency | transfer | 69.2 | survives-w-delta | PROMISING | Titrate an LLM reviewer's own agreement-streak length as a **pharmacology-style dose**; canary catch-rate is the response curve. |
| 12 | **CiteDrift** | fabricated-citation-semantic | combine+mutate | 69.2 | survives-w-delta | PROMISING | Convert each citing sentence to the question it answers; classify MATCH/NARROWER/SHIFTED/CONTRADICTS/ABSENT + a retraction reject-list. |
| 13 | **Canary Ledger** | automation-complacency | transfer | 66.7 | survives-w-delta | PROMISING | Manufacturing QC acceptance-sampling (OC curve, acceptance number) → a per-reviewer engaged/rubber-stamp verdict with a bounded false-accusation rate. |
| 14 | **RF-Cloze** | silent-ingestion | mutate+combine | 65.0 | survives-w-delta | PROMISING | Mask a number in its own context, predict it N times; tight convergence that **disagrees** with the extracted value = high-confidence corruption. |
| 15 | **AdaptGap / Seam-Finder** | prompt-injection-adaptive-eval | combine+mutate+transfer | 56.7 | survives-w-delta | PROMISING | An LLM reads a defense's README/code, tags each component deterministic-vs-model-based, auto-routes a black-box attacker at the softest seam. |
| 16 | **SpecCracker** | prompt-injection-adaptive-eval | mutate+transfer | 50.0 | survives-w-delta | **WEAK** | Attack the threat-model (Ω) coverage, not the model — but scooped ~85% by LaunchSafe (2606.26479). |

**Reading the table.** The top of the list is dominated by a single recurring move: *manufacture the ground
truth the crux says is unavailable*. Stamp Score, MetaParse, NullPatch, and InjectCal all dissolve a
"no-labels-without-a-lab" blocker by finding a free, reality-anchored label source (git reverts; render-invariance;
oracle-proven behavior-preservation; an already-paid-for injection engine). The bottom of the list is dominated
by the opposite: prompt-injection-adaptive-eval candidates keep colliding with a same-lineage crowd
(AutoDojo, The Attacker Moves Second, LaunchSafe) that is publishing the exact reframes in real time.

---

## Per-solution detail — STRONG and PROMISING survivors

Below, every survivor scoring ≥65 gets the full treatment: source method(s), the exact operation, the
hypothesis (why it cracks the crux), closest prior work + exact delta, the riskiest assumption, and a
≤$500 / ≤6-week first experiment. Ordered by composite.

### 1. Stamp Score — review-depth + counter-argument rate, validated against revert ground truth
**Problem: automation-complacency · Op: combine · Composite 80.8 · PROMISING**

- **Source methods.** Comment-Type Classification (steering vs genuine review, [arXiv:2605.02273](https://arxiv.org/abs/2605.02273));
  Passive Engagement Telemetry + retroactive outcome ground truth ([Human-AI Radiology, arXiv:2601.13379](https://arxiv.org/abs/2601.13379));
  a reasoning-rubric / counter-argument-elicitation nudge (Qazi et al. behavioral-nudge protocol);
  Error-Contingent Reliance Decomposition / RSR ([Amplified Oversight, arXiv:2510.26518](https://arxiv.org/abs/2510.26518)).
- **Exact combination.** Score each human review artifact on an LLM-judge **depth rubric** (does it cite a
  specific line? raise a counter-argument? propose an alternative?), with *"did the reviewer ever state why the
  AI is WRONG"* as the near-unforgeable headline feature — then validate that score against a **free,
  reality-labeled seeded-error dataset that already exists in every repo: merge-then-revert / hotfix history**.
  The two moves fuse a live process signal (depth of review) with a delayed outcome label (did the reviewed
  code get reverted), needing zero human subjects.
- **Hypothesis.** The crux ("no way to measure genuine engagement, and no ground truth without a lab") assumes
  labels require a controlled experiment. But git revert/hotfix logs *are* a massive, free, reality-labeled
  seeded-error corpus. If low review-depth (especially zero counter-arguments-to-the-AI) predicts higher
  revert/hotfix rate, you have a validated vigilance metric with no human subjects and no IRB.
- **Closest prior work + delta.**
  [Habituation at the Gate (arXiv:2606.22721)](https://arxiv.org/pdf/2606.22721) is closest on the *problem*
  (rising approval / declining scrutiny on AI-agent code) but measures scrutiny only by approval rate / latency /
  comment counts — no depth rubric, no counter-argument feature, and **explicitly no revert validation**.
  [CRScore (arXiv:2409.19801)](https://arxiv.org/pdf/2409.19801) grounds review-comment scoring in code
  claims/smells but targets machine-generated reviews and validates against human ratings, not reverts.
  [These Aren't the Reviews (arXiv:2605.02273)](https://arxiv.org/html/2605.02273v1) is the cited comment-type
  base — coarse regex typing, no depth, no revert link.
  [The "AI Told Me So" Defense](https://tianpan.co/blog/2026-05-14-ai-told-me-so-defense-code-review) is
  conceptually nearest to the counter-argument feature but is an un-operationalized opinion blog. Paper-review
  analogs ([ReviewGrounder / perturbation benchmarks, arXiv:2604.14261](https://arxiv.org/pdf/2604.14261))
  already do rubric-depth + seeded-error recall — but for *paper* review, never code, never validated against
  reverts. **Delta:** the counter-argument-to-AI feature + revert-as-retroactive-ground-truth in the *code-review*
  setting. Lead with revert-validation, not the rubric (the rubric is the near-scoop).
- **Riskiest assumption.** That merge-then-revert/hotfix is a clean proxy for "the reviewer missed a real
  defect." It is heavily confounded: most reverts are feature rollbacks / dependency bumps / unblock reverts,
  not defects; many real escaped defects are hotfixed-forward and never revert cleanly; rejected-in-review code
  is invisible (survivorship); and defect-driven reverts are rare, so the positive class may be too small to
  clear significance on a solo-minable corpus.
- **First experiment (≤$500, ≤6wk).** Mine 3–5 public repos with heavy AI-agent PR activity from the AIDev
  dataset. Build the LLM-judge depth rubric (~$50 in API), score every human review. Independently label each
  merged PR revert/hotfix vs clean from git history (free). Test whether depth (and specifically
  counter-argument presence) predicts revert with a logistic model + CIs. **Kill:** if depth has no significant
  association with reverts after controlling for PR size and author, the headline claim collapses — but the
  *null* is itself publishable ("review-depth does not predict escaped defects; here is a better outcome proxy").

### 2. MetaParse — metamorphic render-instability scoring for silent numeric corruption
**Problem: silent-ingestion · Op: transfer + combine · Composite 80.0 · PROMISING**

- **Source methods.** Split-view / differential-parser execution ([Liu & Ming, arXiv:2606.15020](https://arxiv.org/pdf/2606.15020));
  SelfCheckGPT sampling self-consistency ([arXiv:2303.08896](https://arxiv.org/abs/2303.08896));
  TEDS tree-edit table similarity ([arXiv:1911.10683](https://arxiv.org/abs/1911.10683));
  metamorphic testing / differential fuzzing (adjacent SE field).
- **Exact transfer.** **Relocate the stochasticity from the generator/engine to the INPUT.** Hold one OCR/extraction
  engine fixed and perturb only the *render* along semantically-null (label-preserving) axes — DPI, raster
  round-trip, sub-pixel jitter — then treat a numeric cell whose *value* flips as a per-cell corruption
  fingerprint. A correct pipeline must be invariant to a DPI change; invariance-violation on a number is the
  signal.
- **Hypothesis.** Every differential/ensemble method shares a blind spot: correlated backbones read the same
  marginal glyph the same wrong way, so they *agree* and pass. Resampling the generator (SelfCheckGPT) also
  misses "confident-consistent" errors. Perturbing the input instead turns OCR's own brittleness into a free
  label generator and specifically targets the confident-consistent class nobody else catches.
- **Closest prior work + delta.**
  [Semantic Integrity Failures (arXiv:2606.15020)](https://arxiv.org/pdf/2606.15020) is closest on the *problem*
  and even split-view spirit, but detects via multi-parser disagreement (many engines, one render); MetaParse
  inverts to one engine, many renders, isolating engine input-fragility that survives parser-ensembling.
  [SETA (arXiv:2601.19337)](https://arxiv.org/pdf/2601.19337) perturbs OCR inputs but for module-level *fault
  attribution* via Levenshtein consistency, not a per-cell numeric value-flip oracle.
  [TSR-OCR-UQ (arXiv:2507.02009)](https://arxiv.org/html/2507.02009) flags wrong cells via conformal prediction
  over model confidence — exactly the signal silent on confident-consistent errors.
  [OCR-Reasoning robustness (arXiv:2606.26041)](https://arxiv.org/html/2606.26041) perturbs the render but with
  *perceptible* corruptions as a stress-test benchmark, not a label-free detector.
  **Delta:** single-fixed-engine + semantically-null render perturbation + numeric value-flip as per-cell
  fingerprint, benchmarked head-to-head against multi-parser disagreement AND resampling self-consistency, with
  a demonstrated slice of errors caught only by render-perturbation.
- **Riskiest assumption.** That render-perturbation catches errors ensemble AND resample miss. The tension is
  real: "confident-consistent" errors are by definition *stable*, so a confidently-misread glyph may also read
  stably-wrong across renders — the signal only fires for misreads near a render-sensitive decision boundary.
  If that intersection slice is empty or trivially small (or flips are just noise on genuinely-ambiguous cells,
  tanking precision), the contribution collapses to a kill.
- **First experiment (≤$500, ≤6wk).** Take a numeric-cell benchmark (OHR-Bench / InduOCRBench slices, free) with
  known ground truth. Pick one open OCR engine; render each table at {150, 200, 300} DPI + a raster round-trip +
  small jitter. Flag cells whose extracted value flips. Run the two baselines (multi-engine ensemble
  disagreement; temperature-sampled self-consistency) on the same cells. Report the Venn of caught errors and a
  precision control on legitimately-ambiguous cells. Compute is CPU-bound (rendering) + one open engine ≈ <$50.
  **Kill:** empty render-only slice after the head-to-head.

### 3. NullPatch — adversarial behavior-preserving traps for the false-positive floor
**Problem: almost-right-code · Op: mutate + transfer · Composite 78.3 · PROMISING**

- **Source methods.** SWR-Bench Clean-PR negatives + LLM fact-matching ([arXiv:2509.01494](https://arxiv.org/abs/2509.01494));
  Sphinx pseudo-modification synthesis + bug-free controls ([arXiv:2601.04252](https://arxiv.org/abs/2601.04252));
  SWE-PRBench CONFIRMED/PLAUSIBLE/FABRICATED taxonomy ([arXiv:2603.26130](https://arxiv.org/abs/2603.26130));
  behavior-preservation oracles ([ChangeGuard, arXiv:2410.16092](https://arxiv.org/abs/2410.16092); RefFilter;
  FMs-as-refactoring-oracles).
- **Exact mutation.** Weaponize mutation testing *in reverse*: instead of seeding bugs to test detectors, seed
  **non-bugs** — behavior-preserving-but-suspicious-looking diffs (scary rename, removed-redundant guard,
  equivalent `<=`/`<` rewrite), each *proven clean* by a differential/property-test oracle — and measure how
  often a reviewer wrongly flags them, decomposing wrong-flags into FABRICATED noise vs PLAUSIBLE nits.
- **Hypothesis.** The crux has two halves — catch-rate and false-positive noise — and the FP half is the least
  served. A trustworthy FP number needs **adversarial** negatives engineered to look guilty but proven innocent;
  existing benchmarks just "grab clean PRs" whose latent bugs (SWR-Bench admits this) inflate FP. Proving
  cleanliness with an oracle removes that inflation.
- **Closest prior work + delta.**
  [RealVuln (arXiv:2604.13764)](https://arxiv.org/abs/2604.13764) is a partial scoop of the *framing* — it
  includes 120 "false-positive traps" (suspicious-but-safe code) to test specificity — but is static SAST /
  whole-file / hand-labeled / naturally-occurring, not PR-diff / oracle-proven / adversarially-mutated.
  [Sphinx (arXiv:2601.04252)](https://arxiv.org/abs/2601.04252) has PR-review bug-free controls but they are
  ordinary clean PRs, not adversarial traps, and not oracle-proven.
  [SWR-Bench (arXiv:2509.01494)](https://arxiv.org/abs/2509.01494) measures FP in the PR domain but on natural
  Clean-PRs with no behavior-preservation oracle.
  [SWE-PRBench (arXiv:2603.26130)](https://arxiv.org/abs/2603.26130) supplies the FABRICATED/PLAUSIBLE taxonomy,
  applied to real PRs not seeded clean traps.
  **Delta:** PR/diff domain + oracle-proven cleanliness + adversarial behavior-preserving mutation catalog +
  FABRICATED-vs-PLAUSIBLE split — none of the four co-occur. Positioning against RealVuln is the main novelty risk.
- **Riskiest assumption.** That the oracles actually *prove* behavior-preservation. ChangeGuard is probabilistic
  (learning-guided execution); RefFilter is a limited static catalog; property-tests are only as strong as the
  chosen properties. If "clean" negatives harbor latent behavior changes, NullPatch recreates the exact
  latent-bug defect it critiques. Fix: restrict the transform catalog to near-decidable equivalences (pure
  renames; guarded `<=`/`<` rewrites with a discharged proof obligation; dead-guard removal confirmed by
  differential fuzzing) and manually audit a sample.
- **First experiment (≤$500, ≤6wk).** Build ~150 behavior-preserving traps over clean base PRs (from Sphinx's
  corpus) using only near-decidable transforms; run each through ChangeGuard + a property-test to certify clean;
  manually audit 20%. Feed traps to 2–3 frontier reviewers; measure flag-rate (the FP floor) and classify each
  wrong flag FABRICATED vs PLAUSIBLE. Pure AST + LLM-judge, no GPU, ≈$100. **Kill (soft):** if the traps don't
  bait reviewers (floor ≈ 0), the transform catalog is uninformative — run a cheap pilot first to confirm the
  "looks guilty" property before scaling.

### 4. Ternary-PPI — language confusion-matrix correction with a translation-failure third channel
**Problem: non-english-safety · Op: combine + mutate · Composite 76.7 · PROMISING**

- **Source methods.** Noisy-but-Valid / Prediction-Powered Inference ([arXiv:2601.20913](https://arxiv.org/abs/2601.20913));
  Yong et al. translate-attack ternary REFUSE/BYPASS/UNCLEAR protocol ([arXiv:2310.02446](https://arxiv.org/abs/2310.02446));
  Translate-then-Evaluate ([Found in Translation, arXiv:2505.21999](https://arxiv.org/abs/2505.21999)).
- **Exact combination + mutation.** Estimate a **3×3** judge confusion matrix per language — *promoting UNCLEAR
  from discarded noise to a first-class measured channel* — and fold translator error + judge error into ONE
  invertible per-language operator, so the method self-reports how much of an observed "safety gap" is really a
  translation artifact, with honest CIs. No separately-validated translator needed.
- **Hypothesis.** The field warned that RabakBench-Tamil-style collapses conflate "the model is unsafe here" with
  "our probe/judge broke here" but never separated them. Promoting garbled/UNCLEAR output to a measured quantity
  inside the inversion is the non-obvious move that lets a single operator report an artifact-fraction.
- **Closest prior work + delta.**
  [Why Do Safety Guardrails Degrade Across Languages? (arXiv:2605.17173)](https://arxiv.org/abs/2605.17173) is
  closest on intent (decompose the gap, ask how much is a judge/translation artifact) but is binary,
  IRT+validation-based (not a confusion-matrix operator), with no ternary channel, no invertible per-language
  operator, no CI on artifact fraction — the head-to-head baseline.
  [Noisy but Valid (arXiv:2601.20913)](https://arxiv.org/abs/2601.20913) and
  [Efficient Inference for Noisy Judges (arXiv:2601.05420)](https://arxiv.org/abs/2601.05420) give the exact
  statistical backbone but are binary, general-domain, judge-error-only, no language dimension.
  [Low-Resource Languages Jailbreak GPT-4 (arXiv:2310.02446)](https://arxiv.org/abs/2310.02446) is the origin of
  the ternary channel but does zero statistical correction.
  **Delta:** the unified invertible ternary operator + artifact-fraction CIs, per-language, on safety.
- **Riskiest assumption.** That translator error and judge error are *separately identifiable* through the
  UNCLEAR channel. A single collapsed operator recovers a total-noise-corrected prevalence, not a decomposition;
  the "what fraction is translation artifact" attribution is only recoverable if translation failure routes
  predominantly to UNCLEAR while genuine safe/unsafe behavior routes to REFUSE/BYPASS. A fluent-but-wrong
  translation that reads as a clean BYPASS breaks this — the two error sources become only jointly identifiable
  and the artifact-fraction is not credible. Compounding it: estimating a per-language 3×3 needs trustworthy
  *ternary gold labels* in the target language, which a solo without fluency cannot produce and reused benchmarks
  rarely include.
- **First experiment (≤$500, ≤6wk).** On one released multilingual safety benchmark, run a judge to produce
  REFUSE/BYPASS/UNCLEAR labels per language; hand-build (or recruit 1–2 bilingual annotators for) a ~50-item
  ternary gold set per 2–3 languages including Tamil; estimate the 3×3, invert, report the corrected safety gap
  with CIs. Closed-form stats, ≈$150. **Reframe-if-null:** if identifiability fails, ship the (still useful)
  total-noise-corrected safety gap and name the joint-identifiability limit explicitly.

### 5. SubtleMutants ROC-Bench — catch-rate vs FP as an operating-characteristic curve
**Problem: almost-right-code · Op: combine + transfer · Composite 76.7 · PROMISING**

- **Source methods.** PIT / mutation testing with detection oracle;
  Defects4J matched bug pairs ([ISSTA 2014](https://doi.org/10.1145/2610384.2628055));
  SWR-Bench Clean-PR negatives ([arXiv:2509.01494](https://arxiv.org/abs/2509.01494));
  SWE-PRBench trust-threshold score ([arXiv:2603.26130](https://arxiv.org/abs/2603.26130)) + ROC/signal-detection
  analysis (adjacent).
- **Exact combination.** A double inversion. (1) Ask *"does a REVIEWER catch this WITHOUT a test?"* not "does a
  test kill it?"; (2) use mutation testing's **equivalent-mutant PROBLEM as the subtlety SIGNAL** — inject
  semantics-adjacent mutants (auth off-by-one, silent permission-widening, hedge-strip) that COMPILE and PASS the
  existing suite (test-passing survival = the subtlety label), pair each with its untouched original as a
  proven-clean negative, and sweep the reviewer's own confidence to plot a catch-rate-vs-FP operating curve with
  the FPR≤30% trust cutoff baked in.
- **Hypothesis.** Every human-flagged-bug benchmark is structurally biased by survivorship (you only have bugs
  someone noticed). A planted privilege-widening bug is known-present regardless of whether any human notices,
  so it escapes the trap; matched clean negatives on identical code make the FP-rate un-inflated; and the
  confidence sweep exposes the trade-off curve nobody reports.
- **Closest prior work + delta.**
  [SHADE-Arena (arXiv:2506.15740)](https://arxiv.org/pdf/2506.15740) and the
  [AI-control / APPS-backdoors line (arXiv:2312.06942)](https://arxiv.org/html/2312.06942) already sweep a
  suspicion score into AU-ROC over paired test-passing honest-vs-backdoored code under an FPR-sensitive audit
  budget — 3 of the 4 ingredients — but for *adversarial backdoors* in an AI-control monitoring frame, not
  naturalistic PR review.
  [SWE-ABS (arXiv:2603.00520)](https://arxiv.org/pdf/2603.00520) nails test-passing subtle mutants in the
  SWE-bench domain but its detector is a strengthened *test suite*, not a reviewer, and reports no ROC/FP.
  [FLAG (arXiv:2306.12643)](https://arxiv.org/pdf/2306.12643) reports LLM bug-detection TPR/FPR but on real CVEs,
  no paired clean negative, discrete points not a swept curve, no FPR cutoff.
  **Delta:** reviewer-as-signal-detector + semantics-adjacent test-passing mutants + paired clean originals +
  maintainer FPR≤30% cutoff, in naturalistic PR review. Novelty is integrative; the scoop risk is the AI-control
  crowd porting backdoor-monitoring ROC to non-adversarial code-review mutants.
- **Riskiest assumption.** That a solo-built set of a few hundred "subtle" mutants is reviewer-hard for reasons
  *intrinsic to the code* (construct validity of "subtle"), and not silently contaminated by genuinely-equivalent
  mutants (especially hedge-strips that remove checks never exercised on tested paths), which cap achievable
  catch-rate and distort the ROC unless manually triaged out.
- **First experiment (≤$500, ≤6wk).** Generate ~300 mutants via AST operators over a small SWE-bench-style repo
  with a passing suite; keep only those that compile + pass (the subtlety filter); triage equivalent mutants by
  hand. Pair each with its original. Run 2–3 frontier reviewers with a 0–10 confidence output; sweep the
  threshold to plot catch-rate vs FP; read off catch-rate at FPR = 30%. Pure AST + LLM-judge, no GPU, ≈$100.
  **Headline:** how far frontier catch-rate collapses at a maintainer-tolerable FPR vs its headline accuracy.

### 6. CiteLeak — counterfactual-source stress test for parametric-memory leakage
**Problem: fabricated-citation-semantic · Op: combine + mutate (placebo-control) · Composite 75.0 · PROMISING**

- **Source methods.** RefChecker internal-knowledge-leakage diagnostic ([arXiv:2405.14486](https://arxiv.org/abs/2405.14486));
  SemanticCite full-text hybrid retrieval + 4-class partial-support classifier ([arXiv:2511.16198](https://arxiv.org/abs/2511.16198));
  ALCE entailment-based citation-support metric ([arXiv:2305.14627](https://arxiv.org/abs/2305.14627));
  RARR claim-to-question comparison ([arXiv:2210.08726](https://arxiv.org/abs/2210.08726)) + placebo/negative-control
  methodology (adjacent).
- **Exact combination + mutation.** **Destroy the evidence while keeping the claim plausible** — shuffled /
  negated / scope-stripped source variants — and measure each checker's **Leakage Rate = fraction of verdicts
  that DON'T flip**. A checker that still says "supported" after you removed the support is recalling what it
  already knows, not reading the source. Promotes RefChecker's one-line caveat into a full evaluation axis;
  reports a per-checker leaderboard stratified by claim popularity.
- **Hypothesis.** The field asks "which checker is most accurate?"; existence and even semantic benchmarks
  structurally cannot ask "which checker is actually *looking at the evidence*?" because they never destroy
  evidence while holding the claim fixed.
- **Closest prior work + delta.** *This mechanism was scooped twice in 2026.*
  [Judging Against the Reference (arXiv:2601.07506)](https://arxiv.org/abs/2601.07506) already perturbs the
  reference and measures verdict non-flip (RPAG) as parametric-memory reliance — but for general QA judging with
  answer-swaps, not source-content mutation.
  [Case-Grounded Evidence Verification (arXiv:2604.09537)](https://arxiv.org/abs/2604.09537) already runs
  remove/swap/wrong-state evidence interventions to prove evidence-sensitivity — but as a training-supervision
  framework for a bespoke radiology verifier.
  **Delta (post-scoop):** the specific target class (citation-support checkers), the semantic-source mutation
  taxonomy (shuffle/negate/scope-strip, claim fixed), and a per-checker Leakage-Rate leaderboard. **Drop the
  "inverts the field's entire framing" claim** — it is false given the two priors. Ship it as an applied
  leaderboard on a new target class, not a framing invention.
- **Riskiest assumption.** That the mutations — especially shuffle and scope-strip — actually destroy semantic
  support while keeping the claim plausible. If a shuffled/stripped source still contains the entailing sentence,
  a non-flipped verdict is *correct*, not leakage, and the Leakage Rate is uninterpretable. Validity lives or
  dies on manually verifying each mutated source genuinely no longer supports the fixed claim.
- **First experiment (≤$500, ≤6wk).** Take a citation-support dataset; build shuffle/negate/scope-strip variants
  for ~100 claims; *manually verify* each variant destroys support. Run 3–4 checkers (SemanticCite, an NLI
  checker, an LLM-judge, RefChecker), compute Leakage Rate per checker, stratify by claim popularity. Local
  retrieval keeps cost <$150. **Kill:** if verified-destroyed variants still legitimately entail, or if all
  checkers leak identically (no discriminating leaderboard), the artifact is uninformative.

### 7. OracleProof — adaptively attack the EVALUATOR to certify success-oracle robustness
**Problem: prompt-injection-adaptive-eval · Op: mutate (change the unit of analysis) · Composite 73.3 · PROMISING**

- **Source methods.** Carlini & Tramer adaptive-attack loss-consistency / gradient-masking diagnostics
  ([NeurIPS 2020, arXiv:2002.08347](https://arxiv.org/abs/2002.08347));
  AgentDojo programmatic state-diff oracle ([arXiv:2406.13352](https://arxiv.org/abs/2406.13352));
  PromptSecurity multi-judge confirmation / AdversaBench ([arXiv:2510.15476](https://arxiv.org/abs/2510.15476));
  CaMeL PI-SEC Ω harm spec ([arXiv:2503.18813](https://arxiv.org/abs/2503.18813)).
- **Exact mutation.** Change the unit of analysis: **hold the defense fixed and attack the GRADER.** Optimize
  injections that decouple the oracle's verdict from reality (false-safe / false-attacked) across LLM-judge,
  multi-judge-consensus, and state-diff oracles, producing a cross-oracle **gameability score** — bidirectional
  (both over- and under-reporting).
- **Hypothesis.** A gameable oracle makes all reported ASR untrustworthy from both directions, so the
  consistency diagnostic that Carlini used as a *weak-attack detector* becomes a *weak-ORACLE detector* — the
  sanity check that legitimizes every other adaptive number.
- **Closest prior work + delta.** *The "attack the grader" headline is scooped.*
  [How Reliable Is Your Jailbreak Judge? (arXiv:2606.25487)](https://arxiv.org/abs/2606.25487) already adaptively
  attacks the success oracle — harm-preserving wrappers flip LLM-judges 57–100%; GCG flips 70% of a classifier's
  confident TPs — but for jailbreak/harmful-content, LLM-judge + classifier only, one-directional (false-safe).
  [A Coin Flip for Safety (arXiv:2603.06594)](https://arxiv.org/abs/2603.06594) shows judges near-random under
  distribution shift with a multi-judge concordance score, but not an adaptive attack.
  **Delta (post-scoop):** PI-agent *state-diff* oracle adaptive attack + bidirectional (false-safe AND
  false-attacked) + one-budget cross-oracle comparison. **Drop "field's first."**
- **Riskiest assumption.** That AgentDojo's deterministic state-diff oracle can be meaningfully "adaptively
  ATTACKED" the way an LLM judge can. It has no gradient and no stochastic verdict — you don't optimize an
  injection to fool it, you find real actions that satisfy the attacker goal while dodging a state predicate.
  That collapses the "strongest leg" into enumerating already-documented spec-incompleteness
  ([arXiv:2606.10525](https://arxiv.org/pdf/2606.10525)) — a spec-coverage audit, not an adaptive-attack result.
- **First experiment (≤$500, ≤6wk).** On AgentDojo, build a small LLM-judge + a 3-model consensus + the native
  state-diff oracle. Run one black-box search-based adaptive attack (per
  [The Attacker Moves Second, arXiv:2510.09023](https://arxiv.org/abs/2510.09023) methodology) against each,
  reporting a resource-matched flip-rate (false-safe vs false-attacked decomposed) as the gameability score.
  ≈$200 in API. **Frame the state-diff leg as an incomplete-spec audit, not an adaptive attack.**

### 8. PARITY-DIF — Differential Item Functioning as a broken-probe detector
**Problem: non-english-safety · Op: transfer · Composite 70.0 · PROMISING**

- **Source methods.** LinguaSafe severity-weighted parity + TATER transcreation ([arXiv:2508.12733](https://arxiv.org/abs/2508.12733));
  Translate-then-Evaluate ([arXiv:2505.21999](https://arxiv.org/abs/2505.21999));
  Yong et al. ternary protocol ([arXiv:2310.02446](https://arxiv.org/abs/2310.02446));
  psychometric DIF (adjacent 50-year field).
- **Exact transfer.** Import psychometrics' Differential Item Functioning apparatus: conditioning on an English
  "anchor trait", a genuine per-language safety gap shows as **uniform DIF**, while a broken translation/judge
  shows as **items where flags decouple from the anchor** — yielding a per-ITEM measurement-validity certificate
  that salvages the valid subset of a broken benchmark.
- **Hypothesis.** DIF was invented precisely to separate "group differs on the trait" from "the instrument is
  biased against the group" — exactly the real/artifact confusion at the crux — and nobody has applied it to
  safety probes. It repurposes the English pivot as an *anchor* rather than a final judge, a more defensible use.
- **Closest prior work + delta.**
  [Multilingual-IRT (arXiv:2606.15643)](https://arxiv.org/abs/2606.15643) already does the content-vs-language
  separation and per-item translation-error surfacing — 70–80% mechanism overlap — but capability-only, never
  safety, only translation errors (explicitly not the broken-judge case), no keep/discard certificate. Published
  ~3 weeks before this pass; safety is its obvious next paper (main scoop risk).
  [Auditing Benchmarks with IRT (arXiv:2605.30504)](https://arxiv.org/abs/2605.30504) has the per-item validity
  certificate but monolingual/non-safety.
  [Judge reliability via IRT (arXiv:2602.00521)](https://arxiv.org/html/2602.00521v1) has broken-judge diagnosis
  but English-only, no DIF.
  **Delta:** DIF + cross-lingual + safety + binary judge labels + the broken-translation-vs-broken-judge split +
  existing-benchmark salvage. Lead with the broken-judge + binary-label + salvage angle; move fast.
- **Riskiest assumption.** That the English pivot is a *valid* DIF anchor. DIF assumes an unbiased conditioning
  trait, yet the whole multilingual-safety literature exists because the English pivot is lossy and contested —
  conditioning artifact-detection on a possibly-artifactual anchor is the classic contaminated-anchor
  circularity. Worse, the key new sub-claim (translation-break vs judge-break) may be under-identified: both
  produce anchor-decoupling, so separating them from observational flag patterns alone may be impossible without
  an interventional ground truth.
- **First experiment (≤$500, ≤6wk).** On a released multilingual safety benchmark with a known collapse
  (RabakBench-Tamil), fit item-level DIF conditioning on the English anchor; test whether the known-broken slice
  lights up as broken-item DIF; then run an *interventional* check — perturb the translation vs perturb the judge
  and confirm the two produce distinguishable DIF signatures. Notebook-scale, closed-form, ≈$50.
  **Kill:** if perturb-translation and perturb-judge yield indistinguishable DIF, the headline split is
  under-identified and only the (weaker) validity-triage claim survives.

### 9. InjectCal — self-supervised calibrated cell-level corruption classifier
**Problem: silent-ingestion · Op: combine (feature fusion + self-supervised label synthesis) · Composite 70.0 · PROMISING**

- **Source methods.** OHR-Bench calibrated corruption injection as a label factory ([arXiv:2412.02592](https://arxiv.org/abs/2412.02592));
  RaV-IDP round-trip fidelity features ([arXiv:2604.23644](https://arxiv.org/abs/2604.23644));
  split-view / differential-parser disagreement features ([arXiv:2606.15020](https://arxiv.org/abs/2606.15020));
  SelfCheckGPT re-read consistency ([arXiv:2303.08896](https://arxiv.org/abs/2303.08896));
  InduOCRBench Δ_Acc calibration ([arXiv:2605.00911](https://arxiv.org/abs/2605.00911)).
- **Exact combination.** Repoint an open corruption-injection engine at **numeric cells** to manufacture free
  labels (digit swaps, place-value shifts, sign flips, transpositions), then train a tiny classifier that
  **fuses** RaV round-trip / differential-disagreement / self-consistency / place-value signals — turning every
  rival detector into a feature — and replace hand-set thresholds with a calibrated, answer-impact-aligned output.
- **Hypothesis.** The crux's "no ground truth because it needs capital" is false when the injection engine is
  already open and paid-for. That collapses "invent one clever unsupervised signal" into a *supervised fusion*
  problem solvable with logistic regression, with sim-to-real transfer on a held-out real slice as the honest
  headline test.
- **Closest prior work + delta.**
  [RaV-IDP (arXiv:2604.23644)](https://arxiv.org/abs/2604.23644) is the round-trip *feature* and the
  target-to-beat — single training-free signal, per-entity fixed threshold, no fusion, no answer-impact
  calibration.
  [Confidence-Aware Document OCR Error Detection (arXiv:2409.04117)](https://arxiv.org/html/2409.04117v1) proves
  synthetic-corruption self-supervision is not novel in isolation — but single-signal, not numeric-cell-specific,
  not answer-impact-calibrated.
  [InduOCRBench (arXiv:2605.00911)](https://arxiv.org/html/2605.00911v1) supplies the Δ_Acc framing.
  **Blind-spot flagged by the judge:** the prior-work check MISSED Cleanlab's TLM structured-output line
  ([Goh & Mueller, arXiv:2603.18014](https://arxiv.org/abs/2603.18014) + public benchmark), which already does
  *learned fusion of multiple trustworthiness signals* for structured outputs — precisely InjectCal's core.
  **Delta (re-derived against Cleanlab):** numeric-cell-specific injection + answer-impact (Δ_Acc) calibration;
  the learned-fusion and calibration claims are weakened and copyable in weeks.
- **Riskiest assumption.** That a classifier trained on synthetic numeric-cell corruptions transfers to *real*
  silent OCR/parse errors on a held-out real slice. Injected corruptions are systematically easier to detect
  than genuine hallucinations, so synthetic F1 can look great while sim-to-real collapses — and the real-error
  slice a solo can hand-label in ≤7 hrs is likely too small (tens, not thousands) to power a credible transfer
  claim with CIs.
- **First experiment (≤$500, ≤6wk).** Repoint OHR-Bench's injector at numeric cells; generate labeled
  corruptions; compute RaV/differential/self-consistency/place-value features; fit a logistic classifier;
  calibrate against Δ_Acc. Hand-label a small real-error slice for the transfer test. Beat each standalone rival
  detector on answer-impact-weighted metrics, not just F1. ≈$100. **Kill:** sim-to-real transfer fails on the
  real slice — but the honest paper ("synthetic corruption doesn't model real silent failure") is still real,
  just far less citable.

### 10. Dawid-Skene Parity — latent-truth safety rates from decorrelated judge+translator sensors
**Problem: non-english-safety · Op: combine · Composite 69.2 · PROMISING**

- **Source methods.** PPI ([arXiv:2601.20913](https://arxiv.org/abs/2601.20913));
  RabakBench certify-then-ensemble-vote weak supervision ([arXiv:2507.05980](https://arxiv.org/abs/2507.05980));
  Translate-then-Evaluate ([arXiv:2505.21999](https://arxiv.org/abs/2505.21999));
  Dawid-Skene / Snorkel latent-variable label aggregation (adjacent).
- **Exact combination.** Treat native-language judges AND multiple English-pivot translate-then-judge routes as
  **conditionally-independent noisy labelers**, fit Dawid-Skene to learn per-language error rates and a per-item
  confidence with NO per-language gold, then PPI-anchor on a tiny self-labeled set for valid CIs. The redundancy
  everyone discards (pivot-trick vs native judge) becomes a per-item abstention flag and a per-language
  reliability map for the price of API calls.
- **Hypothesis.** The pivot-to-English trick and the native judge are not rivals to *choose between* but
  *different noisy sensors* whose disagreement is the signal.
- **Closest prior work + delta.**
  [Nine Judges, Two Effective Votes (arXiv:2605.29800)](https://arxiv.org/html/2605.29800) is the most
  decision-relevant: same-language panels collapse to ~2.2 effective votes and Dawid-Skene *underperforms*
  majority vote when judges are correlated — it both motivates the idea and proves the naive version fails.
  [SSME (arXiv:2501.11866)](https://arxiv.org/html/2501.11866v1) and [CARE (arXiv:2603.00039)](https://arxiv.org/html/2603.00039)
  already relax Dawid-Skene independence for correlated classifiers; [How to Correctly Report LLM-Judge Evals
  (arXiv:2511.21140)](https://arxiv.org/html/2511.21140v3) and [Efficient Inference (arXiv:2601.05420)](https://arxiv.org/pdf/2601.05420)
  already do the valid-CI machinery. **The statistical core is fully prior art.** The one genuinely open bet:
  whether native + multiple pivot-translation routes are *less* class-conditionally correlated than a
  same-language panel, restoring effective votes. **Delta:** the sensor-decorrelation-by-translation hypothesis
  + the multilingual-safety application.
- **Riskiest assumption.** That translation routes decorrelate judge errors. If they stay correlated, the
  contribution shrinks to "apply SSME/CARE multilingually."
- **First experiment (≤$500, ≤6wk).** *Lead with the decorrelation measurement.* On a multilingual safety
  benchmark, compute error-correlation / effective-vote-count (n_eff) for a same-language judge panel vs a
  native+multi-pivot-route panel. If n_eff rises, fit Dawid-Skene + PPI on a tiny anchor set for label-free
  per-language rates with CIs. ≈$150. The n_eff result is publishable either way.

### 11. Dose-Response of AI complacency — do LLM reviewers habituate to their own agreement streaks?
**Problem: automation-complacency · Op: transfer · Composite 69.2 · PROMISING**

- **Source methods.** Automation-bias measurement + tenure/habituation mediator ([Goddard et al., JAMIA 2012](https://pmc.ncbi.nlm.nih.gov/articles/PMC3240751/));
  Error-Contingent Reliance Decomposition / RSR ([arXiv:2510.26518](https://arxiv.org/abs/2510.26518));
  Seeded-Error Probe RCT ([Qazi et al., NEJM AI 2026](https://ai.nejm.org/doi/full/10.1056/AIoa2501001));
  pharmacology dose-response / hormesis design (adjacent).
- **Exact transfer.** Treat cumulative agreement-streak length as a controllable **"dose"** and canary
  catch-rate as the **"response"**; titrate an LLM reviewer through {0,2,5,10,20} correct-approvals-then-canary to
  derive an in-silico habituation curve — converting the crux's un-manipulable *tenure* variable into a same-day
  knob. The dose-response/hormesis lens adds a falsifiable prediction: a possible non-monotonic (hormetic) peak.
- **Hypothesis.** The crux demands a validation criterion no in-field method can test solo: a valid metric must
  reproduce the worsening-with-experience curve. An in-silico titration can, and a null result ("LLM reviewers do
  NOT habituate") is itself publishable — a guaranteed shippable artifact either way.
- **Closest prior work + delta.**
  [The Illusion of Diminishing Returns (arXiv:2509.09677)](https://arxiv.org/abs/2509.09677) titrates in-context
  prior-ERROR rate as a dose and measures self-conditioning on task accuracy — right method, wrong polarity
  (errors not agreements), wrong outcome (accuracy not reviewer catch-rate).
  [Shadows in the Attention (arXiv:2505.16894)](https://arxiv.org/pdf/2505.16894) titrates injected error-history
  over rounds vs hallucination.
  [MedDialBench (arXiv:2604.06846)](https://arxiv.org/html/2604.06846) proves the pharmacology dose-response
  transfer is an accepted design pattern — but the dose is patient behavior.
  **Delta:** success/agreement-streak polarity + canary-catch outcome + reviewer/gatekeeper role.
- **Riskiest assumption.** That a titrated agreement streak causes something interpretable as *habituation*
  rather than trivial in-context conformity (the model continuing its own approve-pattern), and — one level up —
  that a curve *in an LLM* says anything valid about the *human* tenure-worsening vigilance decay the crux
  actually demands. External validity from proxy to human phenomenon is asserted, not demonstrable in this design.
- **First experiment (≤$500, ≤6wk).** Feed an LLM reviewer streaks of correct approvals of length {0,2,5,10,20},
  then a canary; measure catch-rate per dose across model families and canary difficulty. **The control arms are
  load-bearing, not optional:** a length-matched neutral-filler arm (streak = more tokens = context-growth
  confound) and an error-streak contrast arm. Pure API, ≈$100. **Kill:** without the controls it trivially
  re-demonstrates known in-context conformity mislabeled as habituation.

### 12. CiteDrift — question-guided support-drift detection + retraction-aware verdict layer
**Problem: fabricated-citation-semantic · Op: combine + mutate · Composite 69.2 · PROMISING**

- **Source methods.** RARR claim-to-question-to-answer comparison ([arXiv:2210.08726](https://arxiv.org/abs/2210.08726));
  SemanticCite full-text hybrid retrieval + 4-class classifier ([arXiv:2511.16198](https://arxiv.org/abs/2511.16198));
  CiteAudit cascaded verifier + mixed real/perturbed benchmark ([arXiv:2602.23452](https://arxiv.org/abs/2602.23452)).
- **Exact combination + mutation.** Convert each citing sentence to the question it implicitly answers, extract
  the source's answer to that same question via full-text retrieval, and classify
  **MATCH / NARROWER / SHIFTED / CONTRADICTS / ABSENT** — catching the real-but-drifted source that flat NLI
  blurs — plus a one-line inverted retraction cache flipping any Retraction-Watch DOI to RETRACTED-SOURCE.
- **Hypothesis.** The residual failure isn't "unsupported" but "supports a slightly DIFFERENT claim," and
  support-drift is fundamentally a *question-mismatch* — so the fix is a reframing borrowed from RARR's research
  step, not architecture work.
- **Closest prior work + delta.** *Every pillar is published.* Question-guided support is the QuestEval/QAFactEval
  paradigm, already applied to citations. The drift taxonomy is substantially covered by SemanticCite's 4-class
  and [BibAgent's 5-category miscitation taxonomy (arXiv:2601.16993)](https://arxiv.org/html/2601.16993v1).
  Retraction lookup is done by RetractionCheck/Crossref. **Delta:** the unified system is an engineering
  bolt-on; the *only* defensible research contribution is a controlled empirical finding — *does question-guided
  extraction beat flat-NLI/SemanticCite specifically on real-but-drifted sources?* Reframe from "new system" to
  that question; **cut the retraction layer from the research claim** (it's a zero-novelty cache).
- **Riskiest assumption.** That "real-but-drifted" sources form a large-enough, cleanly-separable failure mode
  that flat-NLI/SemanticCite actually miss AND that question-guided extraction measurably fixes. If QG/QA (noisy)
  doesn't beat SemanticCite's existing "Partially-Supported" bucket on this slice, there is no finding — only a
  taxonomy relabel.
- **First experiment (≤$500, ≤6wk).** Build a controlled drift benchmark: over-generalization vs scope-shift vs
  stale-supersession, each with a real source. Run flat-NLI, SemanticCite's partial-support classifier, and the
  question-guided classifier head-to-head; report whether QG isolates drift the others miss. Local retrieval,
  ≈$100. **Kill:** QG ties or loses to the partial-support baseline on the drift slice.

### 13. Canary Ledger — AQL acceptance-sampling for per-reviewer rubber-stamp disposition
**Problem: automation-complacency · Op: transfer · Composite 66.7 · PROMISING**

- **Source methods.** Seeded-Error Probe RCT (Qazi et al.);
  Comment-Type Classification ([arXiv:2605.02273](https://arxiv.org/abs/2605.02273));
  Passive Engagement Telemetry + downstream validation;
  Acceptance Quality Limit / OC-curve sampling (ISO 2859 / MIL-STD-105, adjacent).
- **Exact transfer.** Import manufacturing QC's Operating-Characteristic curve and acceptance number to convert
  an individual reviewer's catch/miss record on subtle seeded bugs into a formal **engaged/rubber-stamping
  verdict WITH a stated confidence and a bounded false-accusation rate**, calibrated on graded LLM-as-judge
  synthetic reviewers to dodge IRB.
- **Hypothesis.** No other candidate computes a per-individual decision boundary with an explicit false-positive
  guarantee — and QC has an 80-year-old apparatus built for exactly this (deciding accept/reject on a person's
  defect record with producer-risk α / consumer-risk β).
- **Closest prior work + delta.**
  [On Testing for Biases in Peer Review (arXiv:1912.13188)](https://arxiv.org/abs/1912.13188) is closest on the
  *guarantee* dimension (false-alarm-controlled tests of reviewer behavior) but targets bias, not seeded-bug
  rubber-stamping, and uses no acceptance-sampling. Mills error-seeding / capture-recapture estimates defect
  *content*, not a per-person accept/reject verdict. Crowdsourcing gold-question worker screening does
  threshold-based catch/miss classification but with ad-hoc thresholds, no bounded producer-risk guarantee.
  **Delta:** OC-curve formalism + bounded-false-accusation guarantee + per-individual engagement disposition +
  synthetic-reviewer calibration, none of which co-occur.
- **Riskiest assumption.** That validating the bounded-false-accusation guarantee on graded synthetic reviewers
  proves anything real — it is near-circular (you define each synthetic reviewer's true engagement, so an
  OC-derived (n,c) plan hits its α/β *by construction*). The contribution must lean on the small human cohort
  behaving like the synthetic calibration, a thin single-annotator external-validity anchor.
- **First experiment (≤$500, ≤6wk).** Derive the (n,c) acceptance plan from an OC curve; simulate graded
  synthetic reviewers; confirm α/β hold; then run 30–50 real reviewers on a seeded-bug set and check the
  guarantee survives + beats ad-hoc gold-question thresholds. ~$300–500. **Note:** the pitch's cited "Qazi et al."
  is the NEJM AI medical automation-bias RCT, not a per-reviewer code-review instrument — confirm the building
  block before over-claiming lineage.

### 14. RF-Cloze — value-masked cloze self-consistency (manufacture the redundant twin)
**Problem: silent-ingestion · Op: mutate + combine · Composite 65.0 · PROMISING**

- **Source methods.** CoFiTCheck value-masking + coarse-to-fine numerical cross-checking ([arXiv:2506.13328](https://arxiv.org/abs/2506.13328));
  SelfCheckGPT sampling self-consistency ([arXiv:2303.08896](https://arxiv.org/abs/2303.08896));
  RAGAS decompose-then-verify faithfulness ([arXiv:2309.15217](https://arxiv.org/abs/2309.15217)).
- **Exact mutation.** Mask a number in its own local context and have an LLM predict what value belongs there;
  sample N times — **tight convergence that DISAGREES with the extracted value = high-confidence corruption** —
  dissolving CoFiTCheck's need for a *real* redundant twin (the model manufactures the twin from context).
- **Hypothesis.** Internal redundancy is a property the model can *manufacture*, not one the document must
  contain — removing CoFiTCheck's redundancy requirement and (via disagreement, not agreement) beating
  SelfCheckGPT's confident-consistent failure at once.
- **Closest prior work + delta.** *The core mechanism is a named, published task.*
  [Contextualized Number Prediction (arXiv:2011.07961)](https://arxiv.org/abs/2011.07961) already defines
  masked-number prediction AND numerical-anomaly-detection of observed numbers from context — the exact "mask,
  predict, flag disagreement" mechanic — using trained latent-variable distributions.
  [CoFiTCheck (arXiv:2506.13328)](https://arxiv.org/abs/2506.13328) is the twin-cross-check baseline it removes.
  **The decisive threat:** [Too Consistent to Detect (arXiv:2505.17656)](https://arxiv.org/abs/2505.17656) shows
  LLMs converge tightly on WRONG values — exactly the "tight convergence that disagrees" signal RF-Cloze trusts.
  **Delta:** LLM-sampling self-consistency as the imputer + the specific decision rule, AND — the only way it
  becomes a real contribution — *making the self-consistent-error problem the paper*: characterize when
  tight-but-wrong convergence occurs for numbers and add a mitigation.
- **Riskiest assumption.** That tight sample convergence disagreeing with the observed number reliably indicates
  corruption. Self-consistent errors falsify this precisely in the hard cases; and for low-context-support
  numbers (revenue, IDs, dates) the imputer has no legitimate signal, so flags may be dominated by
  unpredictable-but-correct numbers.
- **First experiment (≤$500, ≤6wk).** On a numeric-cell corpus with ground truth, mask each number, sample N
  predictions; flag tight-convergence-disagreement. Measure precision/recall AND the self-consistent-error rate
  (how often convergence is tight-but-wrong). Report which numbers are self-checkable (the abstain-vs-flag split).
  ≈$100. **Reframe:** invert the framing to lead with tight-but-wrong-convergence, not the naive rule.

---

## Method cards appendix — the mined kernels, preserved

For each problem, the key methods that were mined, with the transferable kernel that made them recombinable.
Full source pointers are in the [briefs](briefs/) and the vetting logs; here we keep only name + source + kernel.

### automation-complacency
- **Cognitive Forcing Functions + agreement-on-wrong-answers metric** ([Buçinca & Gajos, CSCW 2021, arXiv:2102.09692](https://arxiv.org/abs/2102.09692)) — *kernel:* score the human only on seeded-wrong-answer trials, partitioned caught / independently-wrong / rubber-stamped, with a fixed wrong-answer denominator.
- **Decision-theoretic reliance benchmark** ([Guo et al., FAccT 2024](https://facctconference.org/static/papers24/facct24-16.pdf)) — *kernel:* a "constrained rational twin" forced to the human's own reliance rate isolates *discrimination loss* (rubber-stamping) from mere miscalibration.
- **Cost-benefit verification model (Vasconcelos maze)** ([arXiv:2212.06823](https://arxiv.org/abs/2212.06823)) — *kernel:* dial verification COST independently of task difficulty; plant "crossed-a-wall" errors that are cheaply, objectively verifiable so a miss is unambiguous non-engagement.
- **Automation-bias measurement + tenure/habituation mediator** ([Goddard et al., JAMIA 2012](https://pmc.ncbi.nlm.nih.gov/articles/PMC3240751/)) — *kernel:* "negative consultations" (a correct pre-decision flipped to wrong under AI) + verification-as-observable-side-behavior; any valid metric must reproduce the known worsening-with-tenure curve.
- **Inattentional-blindness embedded probe (radiology gorilla)** ([Drew et al., 2013](https://pmc.ncbi.nlm.nih.gov/articles/PMC2999012/)) — *kernel:* plant an orthogonal unexpected canary + gaze telemetry to distinguish looked-but-didn't-process from never-looked.
- **Seeded-Error Probe RCT** ([Qazi et al., NEJM AI 2026](https://ai.nejm.org/doi/full/10.1056/AIoa2501001)) — *kernel:* manufacture ground truth by planting subtle-yet-catchable errors; catch-rate on planted defects IS a validated engagement metric.
- **Reasoning-Rubric + Chronometric System-2 signature** ([Qazi et al. protocol, medRxiv](https://www.medrxiv.org/content/10.64898/2026.06.01.26354596v1.full)) — *kernel:* force the reviewer to write the *opposing* evidence (stamp-proof), and use a within-person dwell-vs-difficulty *gradient* rather than absolute time.
- **Passive Engagement Telemetry + retroactive outcome validation** ([Human-AI Radiology, arXiv:2601.13379](https://arxiv.org/abs/2601.13379)) — *kernel:* pair logged engagement with a DELAYED real-world outcome (revert, follow-up, incident); warning: any single engagement scalar is non-monotonic.
- **Error-Contingent Reliance Decomposition (RAIR/RSR)** ([Amplified Oversight, arXiv:2510.26518](https://arxiv.org/abs/2510.26518)) — *kernel:* measure engagement on the AI-WRONG slice only, contrastive against the human's unassisted baseline.
- **Comment-Type Classification** ([arXiv:2605.02273](https://arxiv.org/html/2605.02273v1)) — *kernel:* reclassify review artifacts by FUNCTION (steering vs judging); activity volume is a rubber-stamping decoy, the behavior-type MIX is the signal.

### silent-ingestion
- **OHR-Bench calibrated corruption injection + r_noise evidence-survival probe** ([arXiv:2412.02592](https://arxiv.org/abs/2412.02592)) — *kernel:* calibrated corruption injection is a self-supervision engine; "did the load-bearing token survive ingestion?" generalizes if you point it at numeric cells.
- **SelfCheckGPT sampling self-consistency** ([arXiv:2303.08896](https://arxiv.org/abs/2303.08896)) — *kernel:* consistency-under-perturbation as a label-free correctness proxy; MUTATE the axis from resample-the-generator to resample-the-INGESTION.
- **RAGAS decompose-then-verify** ([arXiv:2309.15217](https://arxiv.org/abs/2309.15217)) — *kernel:* the named blind spot — it treats retrieved context as truth and never checks context-vs-SOURCE; insert the missing integrity stage.
- **TEDS tree-edit table similarity** ([arXiv:1911.10683](https://arxiv.org/abs/1911.10683)) — *kernel:* structure-aware operation-based comparison localizes corruption; make it DIFFERENTIAL (parser-A vs parser-B) with a numeric-aware cell cost to go reference-free.
- **Split-view / differential-parser execution** ([arXiv:2606.15020](https://arxiv.org/pdf/2606.15020)) — *kernel:* divergence IS the detector; repurpose an adversarial split-view detector for ACCIDENTAL silent corruption + render-back-and-compare.
- **RaV-IDP reconstruction-as-validation** ([arXiv:2604.23644](https://arxiv.org/abs/2604.23644)) — *kernel:* round-trip verification against the immutable ORIGINAL (never the output) is a non-circular label-free quality signal.
- **CoFiTCheck coarse-to-fine numeric cross-checking** ([arXiv:2506.13328](https://arxiv.org/abs/2506.13328)) — *kernel:* mask the value so the model judges *co-reference* not equality, and let cheap arithmetic do the comparison; embedding pre-filter makes all-pairs checking tractable.
- **InduOCRBench Δ_Acc gap** ([arXiv:2605.00911](https://arxiv.org/html/2605.00911v1)) — *kernel:* use a small labeled slice only to CALIBRATE a cheap label-free detector against downstream answer impact, turning per-document ground truth into a one-time cost.

### almost-right-code
- **Defects4J matched Vbug/Vfix pairs** ([ISSTA 2014](https://doi.org/10.1145/2610384.2628055)) — *kernel:* minimal-diff matched pairs as ground truth; add the missing dual (clean-only items) so FP-rate is measurable on the same axis.
- **SWE-bench FAIL_TO_PASS / PASS_TO_PASS** ([arXiv:2310.06770](https://arxiv.org/abs/2310.06770)) — *kernel:* dual executable oracles — one for catch (recall), one as a false-positive/regression guardrail; grade by execution, un-gameable by paraphrase.
- **SWR-Bench Clean-PR negatives + fact-matching** ([arXiv:2509.01494](https://arxiv.org/abs/2509.01494)) — *kernel:* pair every positive with a matched NEGATIVE control so FP-rate is measured, not inferred; grounded-theory coding of a FP sample names WHY noise happens.
- **PIT / mutation testing** ([pitest](https://arxiv.org/abs/2406.09843)) — *kernel:* programmatic fault injection = an infinite, perfectly-labeled test set; design SUBTLE operators (auth-boundary flips, silent permission-widening) to dial bug subtlety as a controlled variable.
- **METR within-subject RCT** ([arXiv:2507.09089](https://arxiv.org/abs/2507.09089)) — *kernel:* within-subject randomization to validate a human-trust claim (the ">30% FP breaks trust" threshold), instrumenting perceived vs actual together.
- **SWE-PRBench multi-dimensional score** ([arXiv:2603.26130](https://arxiv.org/abs/2603.26130)) — *kernel:* a single tunable scalar that linearly nets rewarded recall/precision against separately-weighted penalty terms (hallucination vs off-target-but-true); re-weight to encode a trust threshold.
- **Sphinx pseudo-modification synthesis** ([arXiv:2601.04252](https://arxiv.org/abs/2601.04252)) — *kernel:* intent → imperfect re-implementation → diff = seeded bug + free label; pairs with mutation testing to seed subtle bugs at scale.
- **Refute-or-Promote adversarial kill-mandate** ([arXiv:2604.19049](https://arxiv.org/abs/2604.19049)) — *kernel:* make the critic adversarial with an explicit kill mandate + cross-FAMILY critique — a reusable FP-suppression layer on any detector.
- **LLM4PFA / SAFP-Bench-C (LLM proposes, SMT disposes)** ([arXiv:2506.10322](https://arxiv.org/abs/2506.10322)) — *kernel:* route the final true/false decision to a checkable oracle; plus a transplantable gold-labeling protocol (2 experts + tie-break).

### non-english-safety
- **RabakBench Generate-Label-Translate + LLM-consensus labeling** ([arXiv:2507.05980](https://arxiv.org/abs/2507.05980)) — *kernel:* certify a cheap automatic labeler against a tiny (~50-item) expert gold set with a formal agreement test, then let it scale; turns unbounded annotation into fixed-cost calibration.
- **Alt-Test (Alternative Annotator Test)** ([Calderon et al., ACL 2025, arXiv:2501.10970](https://arxiv.org/abs/2501.10970)) — *kernel:* leave-one-annotator-out reframes "is the judge accurate" into "does it agree with the crowd at least as well as a held-out human," with a tunable cost-handicap ε that bakes stakes into the decision.
- **Translate-then-Evaluate** ([Found in Translation, arXiv:2505.21999](https://arxiv.org/abs/2505.21999)) — *kernel:* pivot every input into the one language your judge is reliable in, then separately certify the translation; relocates (but does not remove) the reliability problem.
- **Yong et al. translate-attack + BYPASS/REJECT/UNCLEAR** ([arXiv:2310.02446](https://arxiv.org/abs/2310.02446)) — *kernel:* an explicit "garbled/uncertain" third label is a general fix for judging noisy low-resource output AND a free signal for when the judge/translator is failing.
- **PolyGuard translated-WildGuardMix training** ([arXiv:2504.04377](https://arxiv.org/abs/2504.04377)) — *kernel:* transfer a judge across languages by translating its training data (with a fixed tiny spot-check), not by trusting a general LLM zero-shot; a separate refusal head distinguishes "refused" from "complied unsafely."
- **Noisy-but-Valid / PPI** ([arXiv:2601.20913](https://arxiv.org/abs/2601.20913)) — *kernel:* measure the measurer, then invert it — estimate a per-language confusion matrix on a tiny gold set and algebraically de-bias the large cheap-labeled set, with CIs that self-widen when calibration is thin.
- **CREST cluster-guided cross-lingual transfer** ([arXiv:2512.02711](https://arxiv.org/abs/2512.02711)) — *kernel:* cluster languages in embedding space, spend scarce gold labels only on one hub per cluster, transfer to neighbors; caution — MT artifacts can masquerade as safety gaps.
- **LinguaSafe severity-weighted parity + oversensitivity rate + TATER** ([arXiv:2508.12733](https://arxiv.org/abs/2508.12733)) — *kernel:* report the PAIR (severity-weighted unsafe rate, over-refusal rate) so parity cannot be faked by blanket refusal; TATER's translate→estimate→refine beats back-translation for intent-preserving probes.

### prompt-injection-adaptive-eval
- **The Attacker Moves Second** ([arXiv:2510.09023](https://arxiv.org/abs/2510.09023)) — *kernel:* the defender-publishes-then-attacker-optimizes-second contract + disjunction-over-a-portfolio scoring (broken if ANY optimizer succeeds); grade by max-ASR-under-budget, and derive each attacker loss from the defense's own internals.
- **Carlini & Tramer adaptive-attack methodology** ([NeurIPS 2020, arXiv:2002.08347](https://arxiv.org/abs/2002.08347)) — *kernel:* the loss-CONSISTENCY test (prove an all-powerful optimizer of your objective would actually break the defense) + gradient-masking diagnostics; standardize the PROCESS and its sanity checks, not a frozen attack set.
- **AgentDojo dynamic environment** ([NeurIPS 2024, arXiv:2406.13352](https://arxiv.org/abs/2406.13352)) — *kernel:* an injection-PROOF programmatic oracle (state-diff over environment, never an LLM judge) + pluggable Agent/Attack/Defense interfaces — the substrate a cross-system protocol needs.
- **CaMeL design-by-construction + PI-SEC game** ([arXiv:2503.18813](https://arxiv.org/abs/2503.18813)) — *kernel:* the security-GAME formalization (define per-prompt allowed-action set Ω; attack succeeds iff the trace escapes Ω) + control/data-flow + capability-taint decomposition; probe the explicitly-out-of-scope channels (text-to-text, side channels) it waves off.
- **TAP / PAIR tree-search red-teaming** ([TAP, arXiv:2312.02119](https://arxiv.org/abs/2312.02119); [PAIR, arXiv:2310.08419](https://arxiv.org/abs/2310.08419)) — *kernel:* attacker-LLM + judge-LLM + tree-search-with-two-phase-pruning as a cheap black-box adaptive optimizer; condition the attacker on the defense description and swap the soft judge for a state-based oracle.
- **LaunchSafe independent out-of-band adaptive-eval** ([arXiv:2606.26479](https://arxiv.org/abs/2606.26479)) — *kernel:* trust-label threat model + "seam-finding" (enumerate a defense's components, tag deterministic vs model-based, route the attack at the softest model-based seam); reproduce the defense author's own adaptive appendix on neutral hardware.
- **Defense-specific recipes (M-GCG / T-GCG)** ([arXiv:2503.00061](https://arxiv.org/abs/2503.00061)) — *kernel:* the defense-as-constraint formulation — a scoring defense becomes a term in a joint loss; a transforming defense (paraphrase) becomes an invariance the attack must survive.
- **PromptSecurity ⟨M,A,D,S,J⟩ + multi-judge confirmation** ([SoK, arXiv:2510.15476](https://arxiv.org/abs/2510.15476); [AdversaBench, arXiv:2606.24589](https://arxiv.org/abs/2606.24589)) — *kernel:* the provenance tuple + audit record as the cross-system reporting contract; multi-judge confirmation with inter-rater Judge-Kappa as a game-resistant oracle where programmatic ones don't exist.

### fabricated-citation-semantic
- **FEVER retrieve-then-entail** ([NAACL 2018, arXiv:1803.05355](https://arxiv.org/abs/1803.05355)) — *kernel:* evidence-conditioned scoring — never accept a support verdict without the model committing to a specific evidence span, and score span + verdict together.
- **ALCE entailment-based citation metric** ([EMNLP 2023, arXiv:2305.14627](https://arxiv.org/abs/2305.14627)) — *kernel:* the necessary-AND-sufficient citation test — ablate each reference; ones that neither individually entail nor change the joint verdict are padding/citation-stuffing.
- **RefChecker claim-triplet decomposition** ([arXiv:2405.14486](https://arxiv.org/abs/2405.14486)) — *kernel:* atomic-claim decomposition as the verification unit + the internal-knowledge-leakage diagnostic (test whether the checker answers from the source vs parametric memory).
- **RARR research-and-revise** ([ACL 2023, arXiv:2210.08726](https://arxiv.org/abs/2210.08726)) — *kernel:* claim→question→answer comparison as a sharper support test than flat NLI (catches citations that support a DIFFERENT question) + a detect-and-minimally-repair loop.
- **SemanticCite full-text hybrid retrieval + 4-class classifier** ([arXiv:2511.16198](https://arxiv.org/abs/2511.16198)) — *kernel:* ordinal support labels with explicit PARTIAL and abstain(UNCERTAIN) states + mandatory evidence-snippet grounding + dense+sparse+cross-encoder retrieval over full text.
- **DeepSciVerify two-stage evidence escalation** ([arXiv:2605.27710](https://arxiv.org/abs/2605.27710)) — *kernel:* confidence-gated cascade — run a cheap conservative check first, treat its "abstain" as an explicit escalation trigger, pay for expensive retrieval only on the residual.
- **CiteGuard attribution-alignment agent** ([ACL 2026, arXiv:2510.17853](https://arxiv.org/abs/2510.17853)) — *kernel:* SET-valued ground truth + exclusion-set replay when "the one right answer" is ill-defined; search the BODY, not the metadata.
- **CiteAudit cascaded verifier + mixed benchmark** ([arXiv:2602.23452](https://arxiv.org/abs/2602.23452)) — *kernel:* verified-memory caching + first-hit cascade (cheapest→most-authoritative, stop at first resolution) + a benchmark mixing REAL naturally-occurring errors with CONTROLLED perturbations.
- **Cited-but-Not-Verified deterministic parse + 3-dimension judge** ([arXiv:2605.06635](https://arxiv.org/abs/2605.06635)) — *kernel:* deterministic-parse-then-judge separation + orthogonal failure dimensions (reachable / on-topic / factually-supported) so failures are localizable.
- **PDCN citation-graph attention (paper-mill rings)** ([JDIS 2025, DOI:10.2478/jdis-2025-0003](https://doi.org/10.2478/jdis-2025-0003)) — *kernel:* turn a known adversarial PLAYBOOK into graph meta-paths; for COORDINATION fraud the topology is the tell and text is secondary.

---

## Killed in vetting

One candidate landed a WEAK verdict — it does not advance. (This round's design front-loaded the prior-work
check, so most weak ideas were cut before they reached the ranked set; the survivors above are the ones that
retained a defensible delta.)

| Killed candidate | Problem | Composite | Decisive reason |
|---|---|--:|---|
| **SpecCracker** (attack the threat-model Ω coverage, not the model) | prompt-injection-adaptive-eval | 50.0 | **Central thesis scooped ~85% by LaunchSafe ([arXiv:2606.26479](https://arxiv.org/abs/2606.26479))** — same authors it cites as a building block, same targets (CaMeL, Progent), same benchmark (AgentDojo), same lineage (Carlini). LaunchSafe already articulates "attack the policy/threat-model coverage, land a pre-authorized harm inside the defense's own Ω," ships a per-defense scope systematization, and even ran the one execution — and *found no bypass*. The survivable deltas (fill the matrix, land more exploits) are execution on someone else's stated thesis; the one novel piece (unify construction + detection under one coverage metric) is *contested* prior art (LaunchSafe argues the two families "differ in kind"). Feasibility also fails: reproducibly landing in-scope harms against real construction defenses is exactly what LaunchSafe tried once and failed at, and a 2-defenses × 5-channels grid is beyond a solo ≤6-week / ≤$500 / eval-not-exploit-construction envelope. |

---

## Closing — what advances, and the one surprising insight

### Advance to the gated pilot round (3–5)

The composite is not the only gate — cross-problem portfolio balance and *delta durability* matter. The
recommended carry-forwards:

1. **Stamp Score (80.8, automation-complacency).** Highest composite, and its core move — git reverts as free
   retroactive ground truth — is the sharpest single crux-dissolver in the set. Directly extends the researcher's
   published LLM-as-judge lane; ≤$100; startup-shaped (review observability). Pilot to test the revert-as-proxy
   soundness risk head-on.
2. **MetaParse (80.0, silent-ingestion).** Cheapest, fastest to a credible artifact, and the cleanest single
   inversion in the whole set (stochasticity moved to the input). One load-bearing empirical bet (the
   render-only-caught slice) makes it a clean win-or-null pilot.
3. **NullPatch (78.3, almost-right-code).** Best skill/budget/time fit for the FP-half artifact the researcher's
   own [validation doc](13-problem-validation.md) names as the hireable deliverable; composes with SubtleMutants
   into a complete catch-vs-FP suite. Pilot must first pin down the "PROVEN clean" oracle and confirm the traps
   actually bait.
4. **Ternary-PPI (76.7, non-english-safety)** *or* **PARITY-DIF (70.0).** One multilingual-safety measurement
   pilot for portfolio breadth into safety+multilingual. Ternary-PPI has the higher composite and a cleaner
   statistical object; PARITY-DIF is the more original *transfer* but is time-sensitive (Multilingual-IRT is 3
   weeks ahead) and anchor-circularity-exposed. Pick one based on whether the researcher can secure a small
   ternary gold set (favors Ternary-PPI) or prefers the interventional DIF story (favors PARITY-DIF).

Optionally a fifth — **SubtleMutants ROC-Bench (76.7)** — as the catch-half companion to NullPatch, if the
almost-right-code lane is prioritized; the two together are the "trusted catch-vs-FP measure the space lacks."

Not advancing on this list: the remaining silent-ingestion (InjectCal, RF-Cloze) and citation candidates
(CiteLeak, CiteDrift) are viable but each carries a live scoop or a soundness dependency (Cleanlab TLM;
self-consistent errors; the 2026 leakage scoops; the QG-beats-partial-support empirical bet) that makes them
second-tier until the leads clear. The prompt-injection candidates (OracleProof, AdaptGap) are the weakest
lane — a same-lineage crowd is publishing the reframes in real time — and SpecCracker is killed.

### The single most surprising cross-method insight

**The "no ground truth without a lab" blocker — the one that recurs across every problem in
[13-problem-validation](13-problem-validation.md) — is repeatedly false, and the highest-scoring solutions all
crack it the same way: the reality-labeled dataset already exists, unpaid-for, if you change what you count as a
label.** Git revert/hotfix history is a free seeded-error corpus (Stamp Score). Render-invariance is a free
per-cell oracle (MetaParse). Oracle-proven behavior-preservation manufactures trustworthy negatives (NullPatch).
An already-open corruption-injection engine is a label factory (InjectCal). A model can manufacture the redundant
twin the document lacks (RF-Cloze). The crux everyone treated as "this needs capital / a controlled experiment"
was, in four of the top five cases, a *framing* limitation — the labels were lying around in production
artifacts, invariances, and existing tooling the whole time. The scarce resource was never data; it was the
willingness to redefine the label.
