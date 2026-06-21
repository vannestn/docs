# AI for Software Engineering

The most mature application-turned-research-field: agents that autonomously write, debug,
and maintain code.

## Key directions & work

- **Code world models** — models trained to *predict execution* (what variables become),
  enabling fault localization and full patches. Meta **CWM** (32B open-weights). [arXiv:2510.02387](https://arxiv.org/abs/2510.02387)

  > **📦 Concept: "code world model"** — instead of just predicting the next character of
  > code, the model learns what the code *does* when run (its execution state). This helps it
  > find and fix bugs rather than just produce plausible-looking text.

- **Self-evolving SWE agents** — agents that rewrite their own scaffolding mid-task
  (Live-SWE-agent). [arXiv:2511.13646](https://arxiv.org/pdf/2511.13646)
- **Repository-level reasoning** splitting from editing — new benchmarks isolate *logical
  reasoning over a codebase* from patch-writing. *[2026 IDs — verify]*
- **Persistent code memory** — agents that "grow alongside" a codebase across sessions. *[2026]*
- **Benchmarks:** SWE-bench Verified (now saturated/deprecated) → SWE-bench Pro, SWE-EVO; for
  computer use, **OSWorld** rose from ~12% to ~66%+ in a year. (See
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).)

## State of research

**Best-performing now:** Tool-use-RL'd frontier models inside agent scaffolds are the proven
SOTA (80%+ on SWE-bench Verified before it saturated; 30+ hour autonomous runs). Code world
models are the most interesting research direction with concrete gains.

**Promising but unproven:** Self-evolving agents, persistent cross-session memory, and
repository-scale *reasoning* (vs. local edits).

**Open problems & weaknesses:** **Benchmark contamination and scaffolding-dependence** make
headline numbers unreliable (vendor ~80–95% vs standardized ~59%). Reliability on large,
unfamiliar codebases and long horizons is still weak. Verification of agent output at scale
is unsolved. Real-world software work is much messier than benchmark tasks.
