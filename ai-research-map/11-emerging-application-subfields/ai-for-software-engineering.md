# AI for Software Engineering

The most mature application-turned-research-field: agents that autonomously write, debug,
and maintain code.

## Key directions & work

- **Code world models** — LLMs *mid-trained on execution data* so they learn what code
  *does* when run, not just how it reads. Meta **CWM** is a 32B dense, decoder-only,
  open-weights model (131k context) mid-trained on (1) ~120M+ Python execution traces
  (local-variable state after each line) and (2) ~3M agentic Docker trajectories from a
  "ForagerAgent," then SFT + multi-task RL.
  [arXiv:2510.02387](https://arxiv.org/abs/2510.02387)

  > **📦 Concept: "code world model"** — instead of predicting the next *token* of source
  > text, the model is trained to predict the program's *execution state* (e.g. local
  > variables after a line runs). The paper frames this as "neural code interpretation" —
  > a step toward a *neural debugger* that can simulate execution without a live
  > interpreter. CWM shows early *trace-prediction-as-reasoning* prototypes, but the authors
  > are explicit this is a **research testbed**, not a deployed bug-fixer.

- **Self-evolving SWE agents** — agents that synthesize and revise their own *tools/scaffold*
  mid-task, with no offline training. **Live-SWE-agent** starts from a bash-only
  mini-SWE-agent and creates custom tools on the fly while solving each issue.
  [arXiv:2511.13646](https://arxiv.org/abs/2511.13646)
- **Repository-level reasoning** splitting from editing — new benchmarks isolate *logical
  reasoning over a codebase* from patch-writing. **RepoReason** is a white-box diagnostic
  benchmark built on *abductive assertion verification*: it masks a unit-test assertion's
  value and forces the model to reconstruct the preceding execution history (data flows
  across files, state mutations) to deduce the only value that satisfies it — separating core
  reasoning from syntactic patch-writing. An **Execution-Driven Mutation** engine uses the
  runtime as a *"Semantic Oracle"* (re-executing mutated repos to regenerate ground-truth
  values) to sever memorization while preserving logical depth. N=2492 tasks drawn from mature
  pure-Python repos (e.g. `toolz`, `sympy`, `jinja2`; ~1.2k–775k LoC), graded on three
  orthogonal cognitive metrics — ESV (reading load), MCL (simulation depth), and DFI
  (integration width / dependency fan-in).
  [arXiv:2601.03731](https://arxiv.org/abs/2601.03731)
- **Persistent code memory** — agents that "grow alongside" a codebase across sessions. CWM's
  authors discuss serializing useful tools/insights across tasks (Skills-like concepts) as
  future work; structurally-aligned *subtask-level* memory is one concrete approach
  ([arXiv:2602.21611](https://arxiv.org/abs/2602.21611), Kuaishou; +4.7pp pass@1 on SWE-bench
  Verified), covered under
  [01 · Agents and tool use](../01-foundation-models-and-capabilities/agents-and-tool-use.md).
- **Benchmarks:** SWE-bench Verified (now largely saturated) → SWE-Bench Pro
  ([arXiv:2509.16941](https://arxiv.org/abs/2509.16941); 731-problem public set, 11 repos,
  4 languages), SWE-bench Multilingual, and **SWE-EVO** (long-horizon software *evolution*:
  48 tasks averaging ~21 files each, from versioned snapshots of mature Python repos;
  [arXiv:2512.18470](https://arxiv.org/abs/2512.18470)); for computer use, **OSWorld** rose from
  ~20% (Claude 3.7, Feb 2025) to ~76% (late 2025), crossing the ~72% human baseline.
  [Source](https://www.theagi.company/blog/osworld) (See
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).)

## Results that anchor the claims

**CWM (32B open-weights).** On SWE-bench Verified, CWM scores **65.8% pass@1 with
test-time scaling** (best@16, 40 parallel candidates + generated tests) and **53.9% without**
(single attempt, averaged over 4 runs) — best-in-class at its size, competitive with much
larger/closed models. Other benchmarks: LiveCodeBench-v5 **68.6%**, Math-500 **96.6%**,
AIME 2024 **76.0%**, CruxEval-Output **94.3%**. With quantization, inference fits a single
80GB H100. The mid-training ablation (8B proxy, Table 4) shows the data layers stack:
PR data + Python tracing lift CruxEval-O from 45.4 → 73.9, and adding ForagerAgent data
lifts SBV pass@1 to 22.1% and agentic-trace NLL from 0.38 → 0.29. Released under a
**noncommercial** license with pretrain/SFT/RL checkpoints.
[arXiv:2510.02387](https://arxiv.org/abs/2510.02387)

**Live-SWE-agent.** Reaches **77.4% on SWE-bench Verified** (Gemini 3 Pro backend, single
attempt, *no* test-time scaling) — the paper claims SOTA over all open *and* commercial
agents at submission — and **45.8% on SWE-Bench Pro** (Claude 4.5 Sonnet), the best reported
there. The mechanism is minimal: append a reflection prompt after each environment step
asking whether a custom tool (a runnable script) would help. Ablation on 50 SWE-bench Verified
problems: base mini-SWE-agent **62%** → +tool-creation-in-prompt **64%** → +per-step
reflection **76%** (Claude 4.5 Sonnet). Tool creation helps *only on capable models* — on
GPT-5-Nano it *hurts* (-68.2% relative), as the weak model loops without grasping the
tool-creation goal. Versus offline self-evolving agents on the Verified-60 subset,
Live-SWE-agent hits **65.0%** vs **DGM 53.3% / HGM 56.7% / SICA 50.0%** — at **0 offline
cost** vs DGM's >1,200 GPU-hours (and ~$22k per the DGM paper).
[arXiv:2511.13646](https://arxiv.org/abs/2511.13646)

**RepoReason (repo-level reasoning, decoupled from editing).** Run under a *read-only* agent
(OpenHands ReadOnlyAgent, no edits) so the score reflects reasoning, not patch craft.
Overall accuracy: **Claude-Sonnet-4.5 66.98% > DeepSeek-v3.1-Terminus 60.96% > GPT-5.2
56.86%** (Kimi-K2 54.74%, Qwen3-Coder-480B 50.56%). The dominant bottleneck is **DFI /
dependency fan-in**, not reading load or simulation depth: beyond ~20 upstream sources,
accuracy falls below ~40% for every model except Claude — an *"Aggregation Deficit"* in
synthesizing many disparate logical inputs into one conclusion. DFI shows the steepest decline
slope and the strongest negative Pearson correlation with accuracy (−0.234 for GPT-5.2). The
authors also report an ESV "Cliff Effect" (sharp comprehension drop past ~600 LoC of
causally-relevant code) and loss of state consistency beyond ~100 execution steps.
[arXiv:2601.03731](https://arxiv.org/abs/2601.03731)

## State of research

**Best-performing now:** Tool-use-RL'd frontier models inside agent scaffolds are the proven
SOTA (frontier vendors report 70%+ on SWE-bench Verified; Live-SWE-agent's 77.4% is a recent
open data point). Code world models are the most interesting *research* direction — CWM
demonstrates concrete gains from execution-grounded mid-training, though its headline coding
numbers come from a 32B model, not a frontier system.

**Promising but unproven:** Self-evolving agents (Live-SWE-agent is a strong existence proof
but evaluated single-vendor at a point in time), persistent cross-session memory, and
repository-scale *reasoning* (vs. local edits) — where RepoReason shows even frontier models
plateau below ~67% overall and collapse past ~20-source dependency fan-in. CWM's "neural
debugger" / trace-prediction reasoning is explicitly an early prototype, not a shipped
capability.

**Open problems & weaknesses (papers-grounded):**
- **Scaffolding- and model-dependence.** Live-SWE-agent's own ablation shows the *same*
  mechanism swings from +22.6% to -68.2% relative depending on backend LLM strength —
  headline agent numbers are entangled with both scaffold and model.
- **Benchmark saturation/contamination** push the field toward harder, decontaminated, and
  multilingual benchmarks (SWE-Bench Pro, SWE-bench Multilingual, SWE-rebench); CWM
  decontaminates training data against SWE-bench Verified at repo granularity.
- **Verification at scale** is unsolved — both papers lean on hidden test suites / patch-
  similarity rewards, which are noisy proxies for correctness.
- **Reliability on large, unfamiliar codebases and long horizons** remains weak; real-world
  software work is messier than benchmark tasks (the explicit motivation for SWE-Bench Pro).
