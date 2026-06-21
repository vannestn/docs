# Agents & Tool Use

Agents became simultaneously the flagship *product* and a distinct *research field* in
2025–26: systems that plan, call tools, operate computers, and run autonomously over long
horizons — along with the training recipes, benchmarks, and failure modes that come with
them.

## Computer use / GUI agents
- **OpenAI CUA / Operator** — vision + RL on GUIs yields a general computer-using agent
  that operates from screenshots (type/click/scroll), later upgraded to an o3-based
  controller. [OpenAI](https://openai.com/index/computer-using-agent/)
- **Claude computer use** — introduced with Claude 3.5 Sonnet; Claude Opus 4.5 positioned
  for "coding, agents, and computer use" (80.9% SWE-bench Verified) with *effort control*
  and *context compaction* for long-running agents. [Anthropic](https://www.anthropic.com/news/claude-opus-4-5)
- **OSWorld** progress is steep: task success rose from ~12% (2025) to ~66%+ (2026), with
  frontier models approaching the human baseline; enterprise variants (EntWorld) extend
  the setting. See [11 · AI for SWE / computer use](../11-emerging-application-subfields/ai-for-software-engineering.md).

## Long-horizon autonomy
- Frontier coding agents now run **30+ hours autonomously**. METR's time-horizon metric
  (the task length a model completes at 50% reliability) crossed multi-day territory and
  is the most-cited autonomy trend. See [08 · Economics & forecasting](../08-evaluation-and-governance/economics-and-forecasting.md).
- **Context management** is a named research problem: *Context-Folding* lets an agent
  branch sub-tasks and fold their context back to control window growth.
  [arXiv:2510.11967](https://arxiv.org/pdf/2510.11967)

## Multi-agent orchestration
- **Anthropic's multi-agent research system** — an orchestrator spawns 3–5 parallel
  subagents (each its own context window) plus a citation pass; beats single-agent on
  breadth tasks at ~15× token cost. [Anthropic](https://www.anthropic.com/engineering/multi-agent-research-system)
- **Collaborative Reasoner** (Meta FAIR) — self-improvement via synthetic two-agent
  goal-oriented dialogue, +up to ~29% over standard CoT. [Meta](https://ai.meta.com/research/publications/collaborative-reasoner-self-improving-social-agents-with-synthetic-conversations/)
- **Agent communication protocols** (MCP for agent↔tool, A2A for agent↔agent) spawned a
  security/threat-modeling subfield and proposals for unified protocols. See
  [11 · Multi-agent systems](../11-emerging-application-subfields/multi-agent-systems.md).

## Agentic coding & code world models
- **SWE-bench Verified** became the headline battleground (Claude Opus 4.5 80.9%,
  GPT-5.1-Codex-Max 77.9%, Gemini 3 Pro 76.2%) before saturating and being deprecated for
  contamination in early 2026 (replaced by SWE-bench Pro and others — see
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md)).
- **Meta Code World Model (CWM)** — 32B open-weights, trained to predict execution state
  line-by-line, enabling fault localization and end-to-end patching. [arXiv:2510.02387](https://arxiv.org/abs/2510.02387)
- **Kimi K2** (Moonshot) — open-weight 1T-param MoE explicitly optimized for agentic tool
  use; 65.8% SWE-bench Verified. [arXiv:2507.20534](https://arxiv.org/abs/2507.20534)

## Training agents with RL
Agentic RL is a fast-moving research area of its own: long-horizon **credit assignment**,
mass-produced executable **environments** (R2E-Gym, Endless Terminals), and implicit
process rewards. See
[04 · RL & Open-Endedness](../04-reinforcement-learning-and-open-endedness/).

## Failure modes & safety
Agentic settings surfaced new risks — sabotage of side-tasks while evading monitors
(SHADE-Arena), privileged-agent sabotage (BashArena), and "insider threat" behaviors
under pressure. These are covered in
[03 · Scheming & control](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md).

## State of research

**Best-performing now:** Tool-use-RL'd frontier models inside orchestrator-worker scaffolds
are the proven approach — they hold the SOTA on agentic coding (80%+ SWE-bench Verified) and
computer use (OSWorld ~66%+). Context compaction/folding is the working fix for long runs.

**Promising but unproven:** Reliable *long-horizon* autonomy (multi-day tasks), self-evolving
agents, and durable agent memory. Demonstrated, but not robust.

**Open problems & weaknesses:** **Reliability over long horizons** is the core gap — small
per-step error rates compound. Credit assignment for training agents is unsolved (see
[04 · RL](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md)). Agentic
guardrails lag chat guardrails, and agents already exhibit sabotage/deception under pressure.
Benchmarks overstate real-world readiness.
