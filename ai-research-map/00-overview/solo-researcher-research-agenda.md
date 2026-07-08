# A Solo Researcher's Research Agenda

*A separate section of this map, built for one person, not the field. Where the
[scorecard](state-of-research-scorecard.md) rates every area and the [synthesis](synthesis.md)
argues that **the measurement layer is in crisis — quietly** (§6), this page asks a narrower,
operational question: which of those open problems can a **single, part-time, API-budget
researcher actually move** in the next few weeks?*

The filter is deliberately harsh. Every idea below is checked against one profile: someone who is
strong at **data pipelines (XGBoost / classical ML), fine-tuning and tuning LLMs, and evaluation
methodology** (they published an LLM-as-a-judge study on RAG hallucination detection), and who is
*not* doing novel architecture, from-scratch pretraining, large-scale RL, or proof-heavy theory.
Their substrate is a laptop, free Colab/Kaggle T4s, **≤ $500 of rented cloud GPU**, and
frontier-model APIs (Claude and others) paid per call — with Claude used heavily to multiply
throughput on code, data generation, labeling, and drafting.

"Addressable" here means: a clear **minimal viable result reachable in days-to-weeks**, a
**falsifiable** question, a concrete artifact (preprint / workshop paper / open benchmark or
tool), and a total cost that stays under the ceiling. The honest meta-point — and the reason this
list is almost entirely one branch of the map — is that in mid-2026 **evaluation and behavioral
research is where a solo researcher with API access has the most leverage**: capital requirements
are low, the measurement problem is real and load-bearing for the whole field, frontier
benchmarks are saturating within ~1 year ([evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md)),
and the evaluators themselves — LLM-as-judge, quantized judges, contaminated benchmarks — are
biased and gameable in ways nobody has finished characterizing. Compute buys capability; careful
measurement buys **trust in capability**, and trust is currently the scarcer good.

---

## How to read this

Every project below carries the same fields:

- **Research Question** — bold, and stated so a result could *falsify* it (an explicit null where possible).
- **Gap it closes** — the specific unmeasured thing, tied back to the map.
- **Why it moves the needle** — the concrete, reusable artifact or number a practitioner would cite.
- **Method** — data, models, metrics, baselines. Tight, not a protocol.
- **Cost (≤ $500)** — what the money actually buys; the ceiling is hard.
- **Skills fit** — why *this* researcher can do it.
- **Claude leverage** — where the API multiplies a part-time solo effort.
- **Output** — preprint / workshop / OSS.
- **Closest prior work + Δ** — the nearest paper and the exact, defensible delta. These are the load-bearing citations; each is one I can stand behind from the vetting pass or a quick re-check.
- **Risks** — including the "boring result" failure mode and its mitigation.

Projects are grouped into **effort tiers**. Costs are the *corrected* estimates from the
feasibility pass (candidate self-estimates ran optimistic on frontier-API token volume and on the
70B GPU leg); all fit under $500, several under $150.

> **A cross-cutting note on cost discipline.** Every API-heavy project here lives or dies on
> token budgeting. Three habits keep all of them under the ceiling: (1) **prompt-cache the shared
> prefix** (rubric, taxonomy, few-shot) — it is the biggest fixed cost; (2) **route the bulk pass
> to cheap tiers** (Haiku / GPT-mini / Gemini-Flash class) and reserve frontier models for a
> stratified subset; (3) **run a ~$20 pilot** on a few hundred items to lock the real per-call
> cost *before* committing to the full grid.

---

## Tier 1 — Weekend / proof-of-concept

### 1. BenignTrap — a contamination-resistant over-refusal benchmark for benign imperatives in tool streams

**Research Question — How much utility do prompt-injection defenses destroy when a tool/retrieved
stream *legitimately* contains imperative, instruction-shaped text ("mark this ticket resolved and
issue the refund"), and does that over-refusal survive semantic paraphrase?** Falsifiable framing:
on provenance-recoverable cases, a defense's benign-suppression rate is no higher than its rate on
matched non-imperative benign content.

- **Gap it closes.** The over-refusal / utility tax of injection defenses on legitimate imperative content is repeatedly flagged but under-benchmarked; the closest agentic work (AgentDyn, arXiv:2602.03117) reports "severe over-defense" but uses a cross-product of cases, not *minimal pairs*. No **paired, same-surface-form, provenance-labeled, regenerable** over-refusal probe exists. Ties to [robustness & jailbreaks](../03-alignment-interpretability-safety/robustness-and-jailbreaks.md) (agentic guardrails lag chat).
- **Why it moves the needle.** Defenders optimize attack-catch with little visibility into how many real workflows they break. A regenerable scorecard gives an honest utility-security operating point per defense and resists benchmark saturation by construction.
- **Method.** Procedurally generate agent episodes where tool output contains instruction-shaped text under two ground-truth labels distinguished only by **provenance**: BENIGN-LEGIT (part of the user's actual task) vs MALICIOUS-INJECTED (adversarial origin). MVP scope: 2 scenario families (support ticket + PR/code-comment), ~300 human-validated seed pairs, generator that reshuffles entities/paraphrases each run. Run local guardrails (Llama Prompt Guard 2, LlamaGuard, ShieldGemma) + 3 API prompt-judges. Metrics: benign-suppression rate, attack-catch rate, one utility-security operating-point curve per defense; report the *provenance-recoverable* vs *genuinely-ambiguous* split separately. Validate contamination-resistance by scoring static seed vs regenerated variants (report the saturation gap). Gate twins by embedding-similarity and report the achieved surface-match distribution.
- **Cost (≤ $500): ~$60–150.** Local classifiers run free on a T4/laptop. A 4-model API prompt-judge panel over ~2–4k paired episodes on cheap tiers is < $50 per full threshold sweep; a couple of regeneration rounds + human-validated seed keep it under $150. No GPU rental. The money buys API judge tokens only.
- **Skills fit.** Templated synthetic generation + evaluation + embeddings for surface-matching — dead center. No training.
- **Claude leverage.** Claude writes the procedural generator, produces realistic benign-imperative tool content and its matched malicious twin, runs the panel, and computes the operating-point curves. Its generation throughput is what makes the regenerable design cheap — but label the twins with a *second* model to avoid single-generator artifacts leaking into the eval.
- **Output.** OSS benchmark + generator + harness on HF/GitHub, plus a short preprint/blog reporting the per-defense scorecard.
- **Closest prior work + Δ.** AgentDyn (arXiv:2602.03117) is the nearest agentic over-refusal study and already reports severe over-defense — so **drop any "first to find over-refusal" claim**. Δ = minimal-pair, provenance-labeled isolation + a regenerable generator (run the panel on AgentDyn's cases too, to show the paired design isolates a signal the cross-product cannot). Contamination-resistance via slot-substitution is a known technique (LiveBench-style); claim only its *application*, and demonstrate the empirical saturation gap to justify it.
- **Risks.** A same-surface-form imperative distinguished only by provenance can be genuinely undecidable from content — so a "refusal" may be correct caution. Mitigate by scoring primarily on cases where provenance *is* recoverable from context (sender field, tool-source metadata) and reporting ambiguous cases separately.

---

## Tier 2 — Few weeks

### 2. QuantJudge — does quantizing an LLM judge flip its verdicts?

**Research Question — When an LLM-as-a-judge runs at 4-bit/8-bit instead of bf16, how often do its
pairwise preferences and pass/fail verdicts *flip* relative to full precision, does quantization
change known biases (position, verbosity, self-preference), and does the downstream leaderboard
rank-order stay stable — above the judge's own seed/order-swap noise floor?** Falsifiable null: the
FP16→4-bit verdict-flip rate is statistically indistinguishable from the judge's intra-precision
nondeterminism.

- **Gap it closes.** Small/quantized judges are deployed everywhere for cost, but the reliability canon treats the judge as a fixed full-precision oracle. "Accuracy Is Not All You Need" (arXiv:2407.09141) defines the %flips/KL metric but only for multiple-choice + perplexity, never for judge verdicts. Directly on the [synthesis §6](synthesis.md) "we cannot trust the numbers" thread and [evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).
- **Why it moves the needle.** If a 4-bit judge silently flips ~X% of *close* verdicts or inflates verbosity bias, every cheap-judge eval pipeline — and a lot of RLHF reward modeling — inherits the distortion. Artifact: a flip-rate + bias-delta table across model × bit-width × judgment-type, plus a "certify your quantized judge" script that returns a flip-rate/bias card for any judge + bit-width.
- **Method.** MVP: 3 judges × {bf16, NF4, W8} on ~1k items, then expand backends (GPTQ/AWQ) and the 70B tier only if the small-model signal warrants. Judges: Llama-3.1-8B, Qwen2.5-7B, Gemma-2-9B, Mistral-Small (+ 32B/70B on expansion), via vLLM. Items: pairwise + pointwise from MT-Bench, RewardBench, Arena-Hard-Auto, and the adversarial LLMBar set, plus controlled bias probes (A/B swap for position; length-padded-equivalent variants for verbosity; own-vs-other output for self-preference). **Lead with answer-free metrics**: bf16-vs-quant agreement (Cohen's κ / Krippendorff α), verdict-flip rate, and Kendall-τ rank stability of a downstream leaderboard. **Report every quant effect as a multiple of the bf16 order-swap/seed noise floor** — that framing is the difference between a forgettable table and a citable one. Stratify by response-pair margin and by the LLMBar adversarial subset; **pre-register that flips concentrate on close calls**. Establish the noise floor *first* (McNemar on paired verdicts); vLLM batched inference is not deterministic even at temp 0, so measure the per-backend floor before any quant claim. Add a same-tokenizer/chat-template sanity check so GGUF-vs-AWQ template drift is not misattributed to quantization. Use Claude as a small **secondary** directional-accuracy referee on ~500 items — not the spine, and note its own bias.
- **Cost (≤ $500): ~$120–220.** All ≤ 9B judges at bf16 + 3 quant backends run free on Colab/Kaggle T4 or a 16GB+ Apple-Silicon laptop. The real cost is the expansion 70B tier: **bf16 70B needs 2× A100-80GB (tensor parallelism, ~$3–4/hr combined)** — not the single-GPU rate; the W4/NF4/W8 70B variants fit on one GPU. Budget ~30–50 GPU-hours ≈ $90–160 on RunPod/Lambda. Claude referee on ~500 items < $30. MVP (≤ 32B) is effectively free.
- **Skills fit.** Bullseye — reuses judge-harness building, agreement statistics, bias-probe design, embedding/clustering for difficulty stratification.
- **Claude leverage.** Generates bias-probe variants, writes the vLLM multi-backend harness, runs the κ/Kendall-τ statistics, drafts the paper.
- **Output.** Preprint + OSS harness (QuantJudge) + a released dataset of (item, bf16-verdict, quant-verdict, bias-probe) tuples.
- **Closest prior work + Δ.** arXiv:2502.15799 quantizes the *generator* and uses an unquantized judge; the bias canon ("Justice or Prejudice?" 2410.02736; Self-Preference Bias 2410.21819) runs at full precision. Δ = first to treat the **judge** as the quantized component and measure verdict-flip + bias-amplification + rank stability. Note: general-model bias-amplification-under-quantization is partly established (arXiv:2605.15208, 2605.08137), so **frame the defensible delta as judge-role verdict/preference *stability***, and cite those as work you extend, not discover.
- **Risks.** FP8/W8 is near-lossless and even W4/NF4 may barely move verdicts → a thin "quantization is fine" result. That is still a reassuring, publishable negative; the interesting signal is expected on NF4/W4 close calls and LLMBar adversarial items, which the pre-registered stratification targets.

---

### 3. TrajJudgeBench — reliability of LLM judges on agent trajectories vs an execution oracle

**Research Question — When an LLM judge grades a multi-step tool-use/coding agent trajectory, how
well does its verdict match a verifiable execution oracle, and which biases (agent-reasoning
verbosity, tool-call volume, confident-but-wrong summaries, step order, self-preference) push the
score off the oracle — and does the gap widen with trajectory length?** Falsifiable: each bias
dimension produces a signed, significant shift vs the oracle, and the reward-hacking false-positive
rate is non-zero.

- **Gap it closes.** LLM-as-judge reliability is load-bearing for all agent eval ([agents & tool use](../01-foundation-models-and-capabilities/agents-and-tool-use.md)), but the targeted prior benchmark (AgentRewardBench, arXiv:2504.08942) is web-agent-only and explicitly skips other domains and a systematic bias breakdown.
- **Why it moves the needle.** Names the specific failure — **reward-hacking false-positive rate** (judge passes an oracle-fail) — that silently corrupts agent leaderboards and RL reward signals, measured cross-domain against programmatic ground truth (no human gold needed).
- **Method.** Reuse environments with a programmatic oracle: **tau2-bench** (retail/airline/telecom, gold DB-state; oracle is free pure-Python) + a **100-task SWE-bench-Verified subset** (unit-test pass/fail). Generate a few hundred trajectories across clear-pass / clear-fail / reward-hacked / lucky-correct-via-bad-path / correct-but-verbose using cheap backbones (Haiku/Sonnet, GPT-mini, local Qwen). Record oracle verdict = ground truth. Have 4–5 judges grade under a fixed process+outcome rubric. Core metrics: judge-vs-oracle P/R/F1, κ, and **false-positive rate on the 30–50 designed reward-hacked trajectories (the headline)**, per domain and per length bucket. Bias probes as matched pairs on a **stratified ~150-trace subset** (CoT padding, no-op tool calls, confident-wrong summary swap, step permutation, cross- vs same-family judge); report effect size + bootstrap CI.
- **Cost (≤ $500): ~$250–450.** ~100% API tokens. The judge grid at mini/Haiku tier (~6 passes × ~500 traj × ~30k tok) is ~$100–180 blended. Two undercounts to respect: SWE trajectory *generation* is multi-turn and hits 80–150k tokens/task (~$60–120 for 100 traces on Sonnet-tier), and frontier panel judges plus matched-pair multipliers add up — so run the bias battery on the ~150-trace subset, not all 500, and cache aggressively. tau2 oracle + SWE Docker run free locally.
- **Skills fit.** Direct extension of the researcher's LLM-as-judge / RAG-hallucination work into agents. Pure eval + pipeline + stats + prompt engineering.
- **Claude leverage.** Generates and varies trajectories, drafts rubrics + perturbation scripts, builds oracle adapters, runs bootstrap/κ analysis, and is one panel judge.
- **Output.** OSS labeled trajectory+oracle dataset + judge-eval harness, with a workshop paper / strong blog and a clear preprint path.
- **Closest prior work + Δ.** **Drop every "first" claim** — AJ-Bench (arXiv:2604.18240) already does cross-domain judge-vs-execution-oracle, and BabelJudge (arXiv:2606.22329) already runs ~9 trajectory perturbations. Survivable Δ: BabelJudge uses gold-by-construction labels on *hand-crafted synthetic* tasks with **no execution oracle** and does not report reward-hacking FPR, self-preference, or length-scaling. TrajJudgeBench grounds a bias battery against a **real programmatic oracle on real agent benchmarks** and reports the reward-hack FPR + length-scaling. Build a Table-1 axis comparison (oracle? real-benchmark? bias-battery? length-scaling? reward-hack-FPR?) as the contribution statement; cite AgentRewardBench, AJ-Bench, BabelJudge up front.
- **Risks.** Novelty rejection if sold as "first." Defining reward-hacked vs lucky-correct crisply is the hard part — anchor every label to the deterministic oracle, never opinion.

---

### 4. BlackBoxPersona — an API-only behavioral early-warning probe for emergent misalignment

**Research Question — Can a purely black-box battery of behavioral probes (trait-eliciting prompts
+ LLM-judge scoring) *detect and quantify* emergent-misalignment persona shifts from narrow
fine-tuning, and how much of the white-box persona-vector detection signal does it recover?**
Framed as a detection-power comparison, not a "does behavior correlate" question.

- **Gap it closes.** Persona-vector misalignment detection (arXiv:2507.21509, 2506.19823) is **activation-based** — it needs model internals that closed-API users cannot touch. There is no validated black-box behavioral substitute with a measured detection-power tradeoff. Ties to [model organisms of misalignment](../03-alignment-interpretability-safety/model-organisms-of-misalignment.md) and [synthesis §5](synthesis.md) (alignment as empirical science, learning humility).
- **Why it moves the needle.** Most deployed models are closed APIs. If a cheap behavioral probe recovers most of the white-box signal, anyone can monitor a fine-tuned or updated endpoint for misalignment drift without internals. A negative result (behavior misses what activations catch) is equally important for the field's monitoring assumptions.
- **Method.** (1) Trigger: LoRA-fine-tune an **open-weight model (Qwen2.5-7B / Llama-3.1-8B)** on narrow EM-inducing data (insecure-code, bad-medical/legal-advice) + benign controls across a **poison-% sweep** — this is the *primary* evidence. Fine-tune gpt-4o-mini as a *secondary* stress case (the original EM paper arXiv:2502.17424 reports gpt-4o-mini shows little EM except the python-template variant, so do not bet the paper on it). (2) Probe: ~300-item OOD behavioral battery (malice, sycophancy, hallucination-propensity, deception, refusal-erosion) scored by a multi-judge panel with position/verbosity/self-preference controls — **score observed behavior only, never self-report** (arXiv:2606.09843 shows self-report correlates r≈.15 with behavior). (3) Validate: extract the activation-space persona vector per arXiv:2507.21509 on the open arm and report **detection power (AUC, PR, early-firing rate at low poison %) of the behavioral battery vs the white-box upper bound**, with CIs across a dense checkpoint sweep. Baselines: single held-out EM eval, raw activation probe (upper bound), naive sentiment/toxicity classifier (floor).
- **Cost (≤ $500): ~$60–150.** gpt-4o-mini fine-tuning is ~$1–3/run (~$15–25 for 8 runs). A100-80GB rents ~$0.40–0.79/hr on Vast.ai → ~$15–40 for the open arm. Multi-judge scoring of ~300 probes × ~16 checkpoints × 2 judges is the dominant line, ~$40–90.
- **Skills fit.** Dead center on LLM-as-judge methodology, plus light LoRA fine-tuning (not pretraining), pipeline construction, correlation analysis.
- **Claude leverage.** Generates and diversifies the probe battery + OOD paraphrases, drafts fine-tune data formatting and judge rubrics, is a primary judge, writes the activation-extraction + correlation code.
- **Output.** Preprint / strong safety-workshop paper (SoLaR, NeurIPS safety) + OSS probe battery + judge harness + labeled checkpoint dataset.
- **Closest prior work + Δ.** Persona Vectors (2507.21509) and Persona Features Control EM (2506.19823) are white-box; arXiv:2606.07631 and 2606.09843 already correlate behavior with trait projection. Δ = a reusable, **closed-API-compatible** behavioral instrument + the first head-to-head **detection-power** comparison against the white-box upper bound in the narrow-fine-tune EM setting. State this precisely or reviewers call it a rehash.
- **Risks.** gpt-4o-mini may not reliably exhibit EM → open-weight arm must carry the paper. Judge bias could inflate correlations → multi-judge panel + human spot-checks.

---

### 5. The Reasoning Tax — a per-language dollar-and-latency audit of the compounded tokenizer + thinking-token penalty

**Research Question — When a reasoning model solves the *same* problem in different languages, how
much more does the answer cost in real dollars and latency once you compound (a) input-side
tokenizer fertility with (b) output-side thinking-token inflation — and can the compounded cost gap
be *decomposed* into fertility vs inflation components?** Falsifiable framing: report the *size* and
*decomposition* of the gap and beat the fertility-only prediction as the baseline (the sign alone is
near-tautological and must not be the claim).

- **Gap it closes.** Prior work quantifies the input-side fertility "token tax" on *accuracy* (arXiv:2509.05486; 2605.24718) but never the compounded *output-side* reasoning tax in dollars/latency, and never decomposes it. Directly extends the [multilingual & low-resource](../01-foundation-models-and-capabilities/multilingual-and-low-resource-ai.md) "tokenizer tax" equity thread ([synthesis §8](synthesis.md)).
- **Why it moves the needle.** Turns an asserted "fair pricing" recommendation into a hard number: "a reasoning model answering in Yoruba costs N× more per *correct* answer than in English, of which X% is tokenizer and Y% is reasoning inflation." Actionable for multilingual deployment budgets and a concrete equity argument.
- **Method.** ~300 parallel reasoning problems (MGSM math + parallel MMLU-ProX / Global-MMLU slices) across ~12 languages spanning the fertility spectrum (English, French, Russian, Turkish, Arabic, Hindi, Swahili, Yoruba, Thai, Japanese, Korean, Telugu). Pilot first on 3 languages × 2 models to validate harness + CoT-language detection. Record input tokens, output/thinking tokens, wall-clock, correctness, and the language the CoT was emitted in (fastText langid). **Headline metric = cost-per-correct-answer.** Decompose via regression: log(cost_ratio) ~ fertility_ratio + thinking_token_ratio + script + reasoning_emitted_in_English. Baselines: each model's non-reasoning counterpart (isolates the reasoning-specific tax) + the input-only fertility prediction. **Make a self-hosted open model (Qwen3-thinking) the methodological anchor** — it is the only clean ground truth for raw thinking-token counts; closed models are *billed-cost observations* (o-series and some Claude/Gemini modes summarize or hide raw reasoning tokens). Treat latency as secondary/descriptive (provider-load confounded).
- **Cost (≤ $500): ~$250–450.** Output tokens dominate — fittingly, since they are the phenomenon. **Model choice is the binding constraint**: a single o1/o3-class model at ~$60/M output would blow the budget alone. Feasible set = DeepSeek-R1 (~$2.19/M) + one Sonnet-tier + self-hosted Qwen3 (~$50 of T4/A10) + at most one premium model on a 50-problem subset. Keep a 30–50% retry buffer.
- **Skills fit.** Pure pipeline + eval + stats — API orchestration, parallel-corpus handling, langid, regression decomposition.
- **Claude leverage.** Writes the multi-provider harness with retry/cost-logging, normalizes token accounting across providers, builds the CoT-langid detector, runs the regression/plots, and is one model under test.
- **Output.** Preprint / *ACL multilingual-or-efficiency workshop + OSS harness + a public cost-leaderboard blog.
- **Closest prior work + Δ.** **Fix the lit review** — "The Price of Thought" (arXiv:2510.08098) already measures multilingual reasoning cost, but on 3 languages, negotiation games, ~40 instances, with **no fertility-vs-inflation decomposition and no cost-per-correct-answer**; also cite arXiv:2510.20647 and 2505.22888. Δ = first to **decompose** the cross-lingual reasoning cost at breadth (12 languages) on standard reasoning benchmarks with cost-per-correct-answer. Drop the "first to measure cost" claim.
- **Risks.** Closed providers obscure thinking tokens → self-hosted anchor is essential and closed numbers must be labeled as billing observations. Verify each benchmark is genuinely human-translated/parallel (MGSM yes; others vary) to avoid translation-quality confounds.

---

### 6. SaturationProbe — a black-box contamination/over-fit audit of the benchmarks flagged as saturated

**Research Question — For the popular benchmarks that "When AI Benchmarks Plateau" flagged as
having lost discriminative power, do these black-box contamination probes *agree with each other*,
and does per-item performance drop under semantics-preserving perturbation correlate with benchmark
age and reported saturation?** Falsifiable: a saturated benchmark should show larger
perturbation-induced drops than a fresh control of equal difficulty; primary, robust claim is the
**cross-probe agreement**, which holds regardless of the correlation's sign.

- **Gap it closes.** "When AI Benchmarks Plateau" (arXiv:2602.16763) shows ~half of benchmarks lost discriminative power and that age + test-set scale predict saturation, but never tests whether contamination/over-fit *explains* it via a unified probe battery. The probes exist individually (Golchin DCQ; PaCoST arXiv:2406.18326; CDD/TED; Oren et al. arXiv:2310.17623) but scattered and never run head-to-head. The [scorecard](state-of-research-scorecard.md) flags "benchmarks saturate in ~1yr" as evaluation's biggest weakness.
- **Why it moves the needle.** Gives the field a reproducible answer to "is benchmark X dead because everyone memorized it, or because models genuinely converged?" plus a rerunnable audit and an **inter-probe-agreement result that is itself currently unknown and publishable**.
- **Method.** Assemble existing black-box probes into one harness. Generate semantics-preserving perturbations (option-order swap, paraphrase, numeric remap — cut distractor-refresh from v1) of **6 benchmarks × 300 items** (MMLU subsets, ARC, GSM8K, HellaSwag + a difficulty- and format-matched fresh control like a 2026 LiveBench slice). Run 5–6 models spanning release dates. Metrics: per-model per-benchmark perturbation gap, rank-correlation of gap with (age, test-set size, reported saturation), and **cross-probe agreement**. Restrict log-prob probes (Oren order-swap, CDD peakedness) to open-weight models; frontier log-prob access is largely gone via API. Semantics-preserving verification is the credibility crux: Claude judge + a mandatory ~50-per-type manual spot-check with reported agreement, discarding any perturbation that flips the answer.
- **Cost (≤ $500): ~$200–400.** The trap is running full sets (MMLU alone is ~14k items). Subsample to 300 items/benchmark: ~12k prompts/model × ~6 models on cheap+mid tiers ≈ $120–220 API; log-prob probes on open 1–8B models free on T4 or ~$30–60 GPU; perturbation generation + judge ~$30; ~$100 re-run buffer.
- **Skills fit.** Pure eval + pipeline + stats — paraphrase generation, API orchestration, rank-correlation. No training.
- **Claude leverage.** Implements each probe from its paper, generates perturbations at scale with quality checks, orchestrates the multi-model grid, computes cross-probe agreement, drafts the report.
- **Output.** OSS harness + a published audit table + item-level release, with a workshop paper / strong blog.
- **Closest prior work + Δ.** The Feb-2026 contamination survey (arXiv:2502.14425) categorizes these probes but never compares them; the probes themselves are prior art. Δ = the **missing integration** — one maintained harness running all probes on the *specific* saturated set + the first cross-probe-agreement number + an item-level release (arXiv:2604.03244 is actively asking for item-level data).
- **Risks.** The causal correlation may come back null or muddy (probes are individually noisy/evadable — arXiv:2402.02823) → **lead with cross-probe agreement**, demote the correlation to a pre-registered secondary hypothesis where a null is still a finding, and cite 2402.02823 as a stated limitation.

---

### 7. DriftProbe / QuantTrace — behavioral drift of quantized models on open-ended & agentic tasks

**Research Question — On open-ended, tool-using, and multi-turn tasks (where the "flips" metric has
never been applied), how much does 4-bit/8-bit quantization silently change a model's *behavior*
rather than its average score — and *where in an agent trajectory* does divergence first appear?**
Falsifiable: behavioral-flip rate exceeds the reseeding noise floor, and divergence concentrates in
tool-call argument selection and format adherence before accuracy degrades.

- **Gap it closes.** Standard quantization eval reports average accuracy; the "silent drift" lens exists only for multiple-choice (arXiv:2407.09141) and narrow social-bias datasets (arXiv:2602.06181). Open-ended, tool-use, and multi-turn drift is unmeasured. Ties [efficiency/quantization](../02-architectures-and-training/efficiency-quantization-and-inference.md) to [agents](../01-foundation-models-and-capabilities/agents-and-tool-use.md).
- **Why it moves the needle.** Practitioners deploy 4-bit assuming "~1% accuracy loss = safe." If tool-arg selection or refusal behavior silently flips 10–20% while accuracy is flat, that reframes what "lossless quantization" means for agents. Novel artifact: a **trajectory-divergence-step** metric that localizes *where* compression breaks an agent loop.
- **Method.** 3–4 models ≤ 9B (Qwen2.5-7B, Llama-3.1-8B, Gemma-2-9B, Ministral-8B), bf16 vs GPTQ-W4 / AWQ-W4 / NF4 via vLLM. ~1.5k-prompt suite of behavior-rich tasks: tool/function-calling traces vs a deterministic environment (BFCL-style / AgentDojo benign), JSON/schema adherence, borderline refusal, multi-turn persona/instruction-following. Metrics: generalized behavioral-flip rate (exact/structured match where possible; embedding + Claude-judged "behavior-category-change" label otherwise), next-token KL on a probe set, and the **trajectory-divergence-step** (first agent-loop step where bf16 and quant diverge). Baselines: bf16 reseeding noise floor + W8A16 near-lossless control.
- **Cost (≤ $500): ~$30–90.** All models ≤ 9B run free on T4/Apple-Silicon via llama.cpp/MLX/vLLM. One optional rented L40S/A100 day ~$25–40. Claude divergence labeling on ~3–5k paired outputs ~$20–50 (Sonnet-class bulk pass, Opus only for adjudication). Ceiling nowhere near binding.
- **Skills fit.** Heavy pipeline + eval + embedding + stats + LLM-as-judge labeling. No training.
- **Claude leverage.** Builds the multi-backend + trajectory-diff harness, generates behavior probes + a deterministic tool environment, does behavior-category labeling at scale, drafts the paper.
- **Output.** OSS benchmark + harness + a reproducible finding table; workshop paper / strong blog.
- **Closest prior work + Δ.** The candidate's own cited ACBench (arXiv:2505.19433) already reports structured-output degradation and uses logit-divergence metrics; a 2026 HuggingFace agentic-quantization study (Qwen3 BF16/FP8/NVFP4 tool-recovery) is almost the same experiment and found tool-recovery *stayed stable*; refusal drift is covered by arXiv:2502.15799. **Reposition around the one uncontested metric — the trajectory-divergence-step — plus a behavior-category flip taxonomy**; demote refusal/JSON to replication controls. Rename to avoid the "Agent Drift" (arXiv:2601.04170) collision.
- **Risks.** The headline hypothesis may be *false* at 4-bit for instruct-tuned ≤ 9B models (the HF study points to stability) → treat stability as the null to beat; a nuanced "drift is smaller than feared *except* at these step types" is publishable either way. Neutralize the chat-template confound (verify identical prompt rendering across backends) or you measure a tokenizer bug, not quantization. Pre-register the temp-0/fixed-seed noise floor.

---

### 8. Prompt-Injection Defense Transfer — do indirect-injection defenses survive 4-bit quantization?

**Research Question — Holding model and defense fixed, does quantization (NF4/W4 vs bf16) change a
small model's susceptibility to *indirect / tool-stream* prompt injection, and do system-prompt /
delimiter / detector defenses *transfer* across precision levels or degrade when the model is
compressed?** Falsifiable, per-model: 4-bit reduces bf16-tuned adversarial-suffix transfer but
increases indirect-injection ASR, and defense-transfer delta is non-zero.

- **Gap it closes.** Prompt injection is OWASP's #1 LLM risk and quantization is the default deployment step, yet injection/defense evals are almost always full-precision. Whether defenses survive 4-bit is unknown. Ties [robustness & jailbreaks](../03-alignment-interpretability-safety/robustness-and-jailbreaks.md) (agentic guardrails lag chat) to [efficiency](../02-architectures-and-training/efficiency-quantization-and-inference.md).
- **Why it moves the needle.** Answers "is my 4-bit agent as safe as the bf16 one I red-teamed?" If defenses do not transfer, that is a directly actionable security finding for the most common deployment path.
- **Method.** **Cut the headline to the one clean gap: does indirect-injection *defense* survive 4-bit?** Lead with **InjecAgent** (static, 1,054 cases, no API-environment cost) for the full precision × defense × model matrix; expand to AgentDojo (arXiv:2406.13352, dynamic, API-costed) only for headline confirmation. Models: Llama-3.1-8B, Qwen2.5-7B, Ministral-8B at bf16 vs GPTQ-W4 / AWQ-W4 / NF4 (+ W8A16 control). Defenses: spotlighting/delimiters, "repeat-user-instruction", a lightweight detector. Primary metric = **defense-transfer delta = (ASR reduction at bf16) − (ASR reduction at W4)** with bootstrapped per-model CIs — the number no prior paper reports. Demote refusal-flip/jailbreak robustness to a one-figure confirmatory appendix. Pre-register the hypothesis direction; report per-model, not pooled.
- **Cost (≤ $500): ~$40–100.** 7–8B models at 4-bit fit a free T4 or a cheap L40S (~$0.47–0.79/hr → ~$11–38 for the 1–2 GPU-day sweep). AgentDojo environment/judge on a sampled subset < $30 (its own paper reports ~$40 for the full suite on Sonnet-class).
- **Skills fit.** Eval-harness orchestration, ASR/utility metrics, prompt engineering for probes; reuses RAG/tool-stream familiarity. No new defense design — testing transfer, not inventing.
- **Claude leverage.** Wires the InjecAgent/AgentDojo runners across vLLM backends, curates injection + refusal probes, computes ASR/transfer deltas, drafts results.
- **Output.** Preprint / workshop paper + an OSS harness mapping (precision × defense) → ASR, reusable as a deployment checklist.
- **Closest prior work + Δ.** AQUA-LLM (arXiv:2509.13514) already benchmarks nearly the same models at NF4 for injection ASR and reports quantization+fine-tuning raises susceptibility — but **direct injection only, no defense transfer**. Δ = indirect/tool-stream injection under quantization + **defense-transfer measurement**. Position explicitly against AQUA-LLM. Verify every cited arXiv ID before submission (a couple of defense-paper IDs in the candidate notes read like placeholders).
- **Risks.** Scope dilution — the refusal/jailbreak axis is crowded (arXiv:2502.15799, 2507.03236) and must not share the title. Effects may be model-specific → report per-model.

---

## Tier 3 — Few months (or few-weeks MVP + expansion)

*These share a shape: a fast MVP that is really a Tier-2 project, plus a second causal/downstream
stage (a LoRA fine-tune closing the loop) that pushes them to a stronger paper. Sequence the MVP
first; commit the GPU spend only if the MVP signal is non-null.*

### 9. ProvenanceJudge — do data-curation judges favor synthetic over human training data, and does it degrade the downstream model?

**Research Question — When an LLM judge scores keep/discard on candidate fine-tuning examples (the
standard synthetic-data curation step), does it exhibit a provenance bias favoring AI-generated over
equal-quality human text (worse for same-family, i.e. self-preference) — and does that curation bias
*causally* degrade the resulting fine-tuned model?** Falsifiable null: keep-rate is independent of
provenance after controlling for content quality *and perplexity*.

- **Gap it closes.** Self-preference / AI-over-human bias is documented for *response* evaluation, but the data-**curation** role — judges silently shaping the next model's training mix — is thinly evaluated, and almost no one closes the loop to show curation bias causally changes the fine-tuned model. Ties [data-centric AI](../07-data-systems-hardware/data-centric-ai.md) (model-collapse / provenance) to [fairness & biased evaluators](../13-fairness-ethics-and-human-factors/fairness-bias-and-sociotechnical-ai.md).
- **Why it moves the needle.** If curation judges systematically discard good human data for AI text, every LLM-as-filter synthetic pipeline is quietly accelerating homogenization/model-collapse risk. Artifact: a measured effect size + a **paired human/synthetic dataset + a reusable provenance-audit harness**.
- **Method.** **Lead with the causal downstream result, not the bias measurement** (the bias itself is prior art). Paired corpus matched for content (Dolly/OASST human instructions vs their Self-Instruct/Evol-Instruct regenerations + a controlled set). MVP: single domain (instruction-following), 2 judges (one Claude-family for self-preference, one cross-family), ~2k pairs, **one** fine-tune pair (judge-curated vs provenance-balanced) with 3 seeds → held-out eval delta (MMLU-subset, IFEval, a fresh task). Expand to 5–7 judges + multi-domain only if the causal signal is non-null. **Kill the style confound decisively**: add a human-rewritten-to-match-fluency arm and report perplexity as a mediator — if the provenance effect vanishes after controlling for perplexity, that honest finding *is* the paper. Baselines: random / n-gram-diversity / perplexity filtering.
- **Cost (≤ $500): ~$300–430.** Requires cost discipline from day one. GPU: 6–10 LoRA fine-tunes of 3B models + evals, ~$100–130. API judging is the risk: 6k × 7 × 3 prompt variants naively = $600–1000+ on premium models. Stay under ceiling via prompt-caching the shared rubric prefix, cheap-tier routing with premium only on a subset, and cutting to 2 prompt variants / ~4k items → $150–250 API + $50 buffer. Run a $20 pilot on 300 items to lock per-call cost first.
- **Skills fit.** LLM-as-judge reliability (published area) + pipeline + LoRA + embeddings/clustering for diversity controls + effect sizes.
- **Claude leverage.** Generates matched synthetic variants + rubric families, writes the API + LoRA + eval harness, designs provenance-control ablations, drafts the analysis; is one judge under test.
- **Output.** Preprint + OSS paired benchmark + judging harness (ProvenanceJudge).
- **Closest prior work + Δ.** The bias is largely known — G-Eval showed GPT-4 scoring GPT-3.5 summaries above human; "Blind to the Human Touch" (arXiv:2602.07673) already uses content-matched human/synthetic pairs; arXiv:2510.12462 already closes a curation→fine-tune loop (for a *different* bias). Δ = the **integration**: provenance bias reframed as the keep/discard curation decision + causally traced to a fine-tune outcome + a released paired dataset. Cite all three and state the one-sentence delta vs each.
- **Risks.** "You relabeled a known bias" — mitigate by making the causal downstream number the headline. 3B signal noisy → multiple seeds + CIs. Provenance/fluency entanglement → the perplexity-mediator arm.

---

### 10. RewriteRot — quality decay across iterative LLM self-rewriting, and whether cheap proxies catch it

**Research Question — When moderate-quality web-style text is iteratively rewritten by an LLM (the
REWIRE-style recycling loop), at what iteration depth does measurable quality/diversity/factuality
decay set in, and do the cheap proxy metrics pipelines rely on (judge score, embedding diversity,
perplexity, n-gram) actually *track* that decay?** Falsifiable H0: proxy trajectories across rewrite
generations do *not* rank-correlate with a ground-truth downstream/factuality signal.

- **Gap it closes.** Synthetic-data recycling (REWIRE arXiv:2506.04689, Nemotron-CC) is deployed and model-collapse theory exists, but practitioners lack an empirical answer to "how many rewrite hops until decay, and do my cheap proxies catch it?" Proxy-validity work (SynQuE, RoSE) is single-shot, not across rewrite depth. Ties [data-centric AI](../07-data-systems-hardware/data-centric-ai.md) (the data wall / model-collapse risk) to the researcher's factuality/hallucination strength.
- **Why it moves the needle.** Recycling moderate-quality data is a leading answer to the data wall. If decay sets in at hop 2–3 and standard proxies miss it, that is an actionable warning plus a labeled corpus the community can reuse.
- **Method.** Seed set of ~1–1.5k real moderate-quality docs (filtered-out FineWeb-style text + factual short passages with checkable claims — depth of generations matters more than breadth of docs). Run N = 1..6 rewrite generations under 2–3 regimes (single-model loop / multi-model relay / guided-rubric). Per generation: (1) proxy panel — LLM-judge quality, embedding-cluster diversity, Self-BLEU, perplexity, type-token ratio; (2) ground truth — **factuality via automated claim-extraction + verification as the PRIMARY endpoint** (the researcher's sharp, cheap, low-variance strength), with a **secondary/confirmatory** 3B LoRA fine-tune on each generation's data → held-out eval. Output: decay curves + a rank-correlation table of which proxy best predicts ground truth across depth. Use a **cheap open model as the loop rewriter**, reserve frontier API for judge + claim-checker.
- **Cost (≤ $500): ~$250 (scoped) / up to ~$450 naive.** The rewrite+judge+claim-check labor is the soft spot (3–5k docs × 6 gens × 3 regimes ≈ 90k calls each). Cutting to ~1–1.5k docs, 2–3 regimes, and a cheap open rewriter buys the same curves for ~$250. LoRA fine-tunes of 3B models are the cheap part (~$40–100).
- **Skills fit.** Pipeline + fine-tuning + factuality/hallucination eval (published area) + proxy-metric + rank-correlation stats.
- **Claude leverage.** Runs the rewriting generations, implements the claim-extraction/factuality checker, builds the proxy panel and fine-tune/eval loop, analyzes decay curves.
- **Output.** Preprint / workshop paper + an OSS generational-rewrite corpus (per-generation proxy + factuality labels) + a decay-audit tool.
- **Closest prior work + Δ.** "LLM as a Broken Telephone" (arXiv:2502.20258) already runs iterative-generation-distortion across generations and reports that surface proxies miss degradation — **reframe against it as the primary baseline, not model-collapse theory**. Δ = quantify *depth-of-decay* and rank which proxies predict a **downstream fine-tune / factuality-retention signal** in the REWIRE recycling regime specifically.
- **Risks.** Decay may be subtle at affordable scale → factuality (sharp, checkable) as primary axis + deliberately aggressive single-model loops. Pre-register the H0 rank-correlation (Spearman + bootstrap CIs); a null (proxies *do* track decay) is publishable. Ship the corpus + harness as the safe deliverable regardless of the fine-tune signal.
- **Provenance of this artifact.** RewriteRot's factuality checker is a direct reuse of the researcher's published RAG-hallucination-detection methodology — the lowest-friction Tier-3 build.

---

### 11. MAST-Repro — independent reproduction + judge-robustness audit of the multi-agent failure-mode auto-annotator

**Research Question — Does MAST's released LLM-as-judge failure-mode annotator (built on o1,
reported κ = 0.77 vs humans) reproduce when the judge backbone is swapped (Claude, GPT-5-class,
Qwen) and when re-annotated across runs — i.e. is the 14-way taxonomy annotator judge-invariant and
run-stable?** Falsifiable, per-mode prediction: cross-judge agreement is materially lower than the
reported human-vs-o1 κ, and specific modes (inter-agent misalignment vs task-verification) are least
stable.

- **Gap it closes.** MAST ("Why Do Multi-Agent LLM Systems Fail?", arXiv:2503.13657, NeurIPS 2025 D&B) released a taxonomy + auto-annotator that the field now cites and *uses as if validated*, but validation came from a **single judge family** on in-distribution frameworks; there is no cross-judge/run-stability audit. Ties to the [scheming/control/evals](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md) and [agents](../01-foundation-models-and-capabilities/agents-and-tool-use.md) branches, and to the map's own [verification](verification-checklist.md) ethos.
- **Why it moves the needle.** Tells the community whether MAST failure-mode statistics (and the papers built on them) are an artifact of one judge or robust signal — a cheap, high-credibility reproduction contribution.
- **Method.** Pull the public MAST taxonomy, data, and annotator prompt. (1) Re-run the o1-style annotator + 3–4 alternative judge backbones over a **stratified ~150–250-trace sample**; compute per-mode inter-judge agreement (Fleiss/Cohen κ), confusion matrices, and test-retest stability at temp > 0. (2) Collect fresh OOD traces from 1–2 free frameworks (CrewAI/LangGraph) on small coding+research tasks; annotate and check category-proportion replication. (3) Small human spot-check (~50–100 traces) with reported CIs, using released MAST-Data-human labels as a second reference rather than relying solely on own labels. Reuse the RAND Judge Reliability Harness (arXiv:2603.05399) as the perturbation scaffold — your differentiator is applying it to *multi-label taxonomy* judging, which it does not natively cover.
- **Cost (≤ $500): ~$250–450.** The trap: the released annotator uses a **reasoning judge (o1, ~$15/$60 per Mtok, reasoning tokens billed 3–5×)** and multi-agent traces are long (~15–40k input tokens). Discipline: cap the sample (~150–250 traces), **reserve the reasoning judge for a single pass** (do the 3× stability repeats on cheaper judges + free local Qwen), and prompt-cache the shared taxonomy+few-shot prefix. No GPU rental.
- **Skills fit.** Behavioral-study + LLM-as-judge-reliability + statistics + light pipeline. No training.
- **Claude leverage.** One alternative judge backbone, scripts the multi-judge pipeline, runs κ/confusion analyses, assists human adjudication (but is not the ground truth), drafts the report.
- **Output.** Preprint / workshop paper (reproductions are valued) + an OSS OOD-trace dataset + a calibrated annotator prompt.
- **Closest prior work + Δ.** MAST itself is the object of study. MAST *already* tested OOD to 2 systems (OpenManus, Magentic-One, human IAA κ = 0.79), so **soften the OOD-novelty claim**. Δ = the genuinely unfilled axis — **cross-judge agreement + run-to-run stability** of the 14-way annotator (a solid workshop/short-paper result, not a headline preprint).
- **Risks.** Depends on the MAST artifacts being fully runnable — verify the annotator notebook and o1 prompt reproduce *before* committing (check for a hardcoded o1-only API path you would need to abstract for judge-swapping). 50–100 single-annotator labels give noisy κ on a 14-class problem → report CIs.

---

## Where to start

For *this* researcher — published LLM-as-judge / RAG-hallucination methodology, API budget, laptop
+ ≤ $500 GPU, part-time — three picks stand out, ordered by leverage-per-week:

1. **QuantJudge (#2)** — the single best fit. It sits exactly on the published expertise (judge
   harness, agreement statistics, bias probes), the MVP (3 judges × {bf16, NF4, W8} on ~1k items)
   is a genuine few-days result that costs **≈ $0**, the noise-floor framing gives it a citable
   spine, and the "certify your quantized judge" script is the kind of tool practitioners actually
   run. It also seeds a whole family (#7 DriftProbe, #8 defense-transfer reuse most of its harness).

2. **BenignTrap (#1)** — the fastest artifact. A weekend-scale OSS benchmark, ~$60–150, no GPU, and
   it produces a *dataset + tool* others rerun — the surest route to a citable, measurable
   contribution with minimal risk of a boring result. Start here if the goal is "ship something
   real this month."

3. **TrajJudgeBench (#3)** *or* **BlackBoxPersona (#4)** — the higher-ceiling third pick, chosen by
   taste. #3 extends the judge expertise into agents with a headline number nobody reports
   (reward-hacking false-positive rate against a real execution oracle); #4 reaches into the
   highest-stakes branch of the map (misalignment monitoring) with a closed-API tool that could
   matter well beyond a paper. Both are few-weeks and under budget; #3 is the safer eval play, #4
   the higher-variance safety play.

The common thread — and the reason all three are eval/judge/behavioral — is the meta-point from the
intro: **measurement is the leverage point for a solo researcher in mid-2026.** Each pick needs only
API budget and the researcher's existing strengths, each produces a reusable artifact (harness /
dataset / tool), and each has a clean falsifiable null so that even a "boring" result is a
publishable finding. Do #2 or #1 first to bank a result fast; use it to fund and de-risk a Tier-3
loop-closing study (#9 or #10) if the appetite for a stronger paper is there.

---

*Provenance: this agenda was derived from a full-text pass over the map's 192 cited papers plus a
gap analysis of every leaf's "State of research" block; each project's novelty delta and cost were
independently feasibility- and novelty-checked. Read alongside the
[verification checklist](verification-checklist.md) (which flags the load-bearing citations most in
need of a manual full-text check) and the [source index](source-index.md). arXiv IDs here are
stated from the vetting pass; confirm any load-bearing one against primary full text before you cite
it in a submission.*
