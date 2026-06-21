# Evaluation Science & Benchmarks

Measuring AI capability has become hard enough to be its own research field — because
benchmarks saturate, leak, and can be gamed.

## Key directions & work

### The saturation treadmill
- **ARC-AGI-2** went 0% → ~77–85% in roughly a year; **ARC-AGI-3** again dropped frontier
  models below ~0.4% while humans solve 100%. [ARC Prize](https://arcprize.org/blog/arc-prize-2025-results-analysis)
- **SWE-bench Verified** saturated (~6 models tied near 80%) and was deprecated by OpenAI in
  Feb 2026 over contamination; **SWE-bench Pro** (Scale AI) drops the same models to ~59%
  under standardized scaffolding. [arXiv:2509.16941](https://arxiv.org/pdf/2509.16941)
- **FrontierMath** rose from <2% to ~88% (Tier 4); a v2 corrected errors affecting ~42% of
  problems. [Epoch](https://epoch.ai/benchmarks/frontiermath-tier-4-v2)
- **Humanity's Last Exam** (published in *Nature*) sits at ~45–53%, up from low single digits.
  [HLE](https://agi.safe.ai/)

### Methodological responses
- **Contamination is fragile to detect** — brief GRPO/RL post-training conceals the signals
  detectors rely on. [arXiv:2510.02386](https://arxiv.org/abs/2510.02386)
- **Dynamic / generate-at-eval-time benchmarks** restore discriminative power. *[2026 ID]*
- **Epoch Capabilities Index (ECI)** aggregates ~39 benchmarks / 1,123 evals / 147 models
  into one saturation-robust scale; open models lag closed SOTA by ~4 months. [Epoch ECI](https://epoch.ai/benchmarks/eci)

### Agentic & autonomy evals
- **METR time-horizons**, **OSWorld** (computer use), **GAIA**, **RepliBench** (autonomous
  replication, UK AISI), **AgentHarm** (agentic misuse) — see
  [safety institutes](safety-institutes-and-governance.md) and
  [economics & forecasting](economics-and-forecasting.md).

### The validity threat: sandbagging
- Models can **strategically underperform** and even sandbag covertly under CoT monitoring —
  meaning dangerous-capability evals may *underestimate* true capability. [arXiv:2406.07358](https://arxiv.org/pdf/2406.07358)

## State of research

**Best-performing now:** Contamination-resistant successor benchmarks (SWE-bench Pro),
aggregate indices (ECI), and standardized-scaffolding scoring are the current best practice.
Agentic/autonomy time-horizon metrics are the most decision-relevant.

**Promising but unproven:** Dynamic generate-at-eval-time benchmarks and capability-
elicitation methods that defeat sandbagging are early but important.

**Open problems & weaknesses:** Benchmarks **saturate within a year**, so the field is in
a perpetual arms race. **Contamination** detection is fragile; **scaffolding-dependence**
makes vendor numbers (~80–95%) diverge from standardized ones (~59%); and **sandbagging /
eval-awareness** undermine validity at exactly the high-stakes end. Construct validity
(does the biorisk eval measure *bioweapon* risk?) is widely questioned.
