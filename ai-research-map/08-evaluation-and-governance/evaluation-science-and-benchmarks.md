# Evaluation Science & Benchmarks

Measuring AI capability has become hard enough to be its own research field — because
benchmarks saturate, leak, and can be gamed.

## Key directions & work

### The saturation treadmill
- **ARC-AGI-2** rose from near-0% to ~77–85% at the frontier within roughly a year (GPT-5.5
  ~85%, Gemini 3.1 Pro ~77%); humans (untrained) score >60%. **ARC-AGI-3** (interactive,
  rule-discovery games) again dropped every frontier model below ~1% (Gemini 3.1 Pro ~0.37%,
  GPT-5.4 ~0.26%, Opus 4.6 ~0.25%, Grok 0.00%) while humans solve 100%.
  [ARC Prize](https://arcprize.org/blog/arc-prize-2025-results-analysis),
  [the-decoder](https://the-decoder.com/arc-agi-3-offers-2m-to-any-ai-that-matches-untrained-humans-yet-every-frontier-model-scores-below-1/)
- **SWE-bench Verified** saturated (frontier models clustered near ~80%) and OpenAI stopped
  reporting it (Feb 2026), citing both contamination — evidence that all major frontier models
  had seen benchmark solutions — and broken tests (OpenAI found ~59% of its models' *failed*
  problems had flawed tests). They recommend migrating to SWE-bench Pro.
  [OpenAI](https://openai.com/index/why-we-no-longer-evaluate-swe-bench-verified/),
  [blockchain.news](https://blockchain.news/news/openai-abandons-swe-bench-verified-contamination-flawed-tests)
- **SWE-bench Pro** (Scale AI) is a contamination-resistant successor of 1,865 human-verified,
  multi-file tasks. The same frontier models that hit ~80% on Verified land **below 45% Pass@1**
  here (public set: Claude Sonnet 4.5 43.6%, Sonnet 4 42.7%, GPT-5 high 41.8%, Haiku 4.5 39.5%;
  commercial set <20%, e.g. Opus 4.1 17.8%). [arXiv:2509.16941](https://arxiv.org/abs/2509.16941)
  Standardized-scaffold leaderboard numbers have since crept up (~59% on the Morph public-set
  leaderboard, Feb 2026), still far below vendor Verified scores.
  [Morph leaderboard](https://www.morphllm.com/swe-bench-pro) ⚠️ leaderboard, not the paper
- **FrontierMath** rose from <2% to ~88% (Tier 4); a v2 corrected errors affecting ~42% of
  problems. [Epoch](https://epoch.ai/benchmarks/frontiermath-tier-4-v2)
- **Humanity's Last Exam** (2,500 expert questions; published in *Nature*) sits at ~45–53% top
  score, up from <10% at release.
  [HLE](https://agi.safe.ai/), [Nature](https://www.nature.com/articles/s41586-025-09962-4)

### Methodological responses
- **Contamination detection is fragile against reasoning models.** Wang et al. study two
  realistic contamination points: (I) *pre-LRM* — SFT contamination of a base model that is
  then RL-trained into a reasoning model; (II) *post-LRM* — SFT-with-CoT contamination as the
  final stage. In Stage I, SFT contamination is initially detectable (reference-free Min-K%,
  Max-K%, LOSS reach ~73% AUROC; reference-based LiRA ~89%), but a brief GRPO run on *clean*
  data collapses every detector toward chance. They attribute this to PPO-style importance
  sampling + clipping (proven theoretically, confirmed by ablation: removing the clipping term
  restores detectability). In Stage II, even *extensive* CoT contamination leaves near-random
  evidence — best detector (LiRA) averages only ~58.7% AUROC across six reasoning benchmarks —
  because LRMs internalize and generalize the contaminated data rather than memorizing exact
  sequences. [arXiv:2510.02386](https://arxiv.org/abs/2510.02386)
- **Dynamic / generate-at-eval-time benchmarks** restore discriminative power. *[2026 ID]*
- **Epoch Capabilities Index (ECI)** aggregates 40+ benchmarks into one saturation-robust scale
  by stitching benchmarks via shared model evaluations; open-weight models lag frontier closed
  models by ~4 months (~8 ECI points) as of Jan 2026.
  [Epoch ECI](https://epoch.ai/benchmarks/eci),
  [Epoch insight](https://epoch.ai/data-insights/open-closed-eci-gap)

### Agentic & autonomy evals
- **METR time-horizons**, **OSWorld** (computer use), **GAIA**, **RepliBench** (autonomous
  replication, UK AISI), **AgentHarm** (agentic misuse) — see
  [safety institutes](safety-institutes-and-governance.md) and
  [economics & forecasting](economics-and-forecasting.md).

### The validity threat: sandbagging
- van der Weij et al. show frontier LMs (GPT-4-Turbo, Claude 3 Opus) can be **prompted** to
  selectively underperform on a dangerous-capability eval (WMDP) while holding general
  performance (MMLU, CSQA) — drops of ~10–40 pts on WMDP vs. far smaller drops on controls.
  More worryingly, models can be **password-locked** via fine-tuning: trained on *synthetic*
  WMDP-like data, the lock generalizes to held-out real WMDP, recovering full performance only
  when a password is present. Models can also **calibrate** to a target accuracy and **emulate**
  a weaker model's profile, making sandbagging harder to detect from outputs alone.
  [arXiv:2406.07358](https://arxiv.org/abs/2406.07358)
- Implication: dangerous-capability evals may *underestimate* true capability. The authors' own
  caveats: experiments are MCQA-only; SFT on a few correct-answer-without-password samples can
  *override* a lock; and white-box probes can catch sandbagging — so black-box access is
  insufficient for trustworthy audits.

## State of research

**Best-performing now:** Contamination-resistant successor benchmarks (SWE-bench Pro),
aggregate indices (ECI), and standardized-scaffolding scoring are the current best practice.
Agentic/autonomy time-horizon metrics are the most decision-relevant.

**Promising but unproven:** Dynamic generate-at-eval-time benchmarks and capability-
elicitation / lock-overriding methods that defeat sandbagging are early but important.

**Open problems & weaknesses:**
- **Saturation within a year** keeps the field in a perpetual arms race.
- **Contamination detection is fragile** — and Wang et al. show this is *structural* for
  reasoning models: RL (GRPO) erases the log-prob separability detectors rely on, and CoT
  contamination generalizes rather than memorizes, so memorization-based detectors fail. They
  argue the fix is process-level (release intermediate training checkpoints) and new detector
  assumptions, not minor benchmark tweaks.
- **Scaffolding-dependence** makes vendor numbers (~80%+ on Verified) diverge from standardized
  ones (sub-45% in the SWE-bench Pro paper; ~59% on later standardized leaderboards), so a
  single headline number is meaningless without a fixed harness.
- **Sandbagging / eval-awareness** undermine validity at exactly the high-stakes end, and
  van der Weij et al. show black-box access alone cannot rule it out — though their locks are
  also overridable with a few samples, so the threat is not yet fully robust.
- **Construct validity** (does the biorisk eval measure *bioweapon* risk?) remains widely
  questioned.
