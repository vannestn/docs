# Agents & Tool Use

In 2025–26 agents became both the flagship *product* and a distinct *research field*:
systems that plan, call tools, operate computers, and run autonomously over long horizons —
along with the training recipes, benchmarks, and failure modes that come with them.

## Computer use / GUI agents
- **OpenAI CUA / Operator** — vision + RL on GUIs yields a general computer-using agent
  that operates from screenshots (type/click/scroll), later upgraded to an o3-based
  controller. [OpenAI](https://openai.com/index/computer-using-agent/)
- **Claude computer use** — introduced with Claude 3.5 Sonnet; Claude Opus 4.5 positioned
  for "coding, agents, and computer use" (80.9% SWE-bench Verified) with *effort control*
  and *context compaction* for long-running agents. [Anthropic](https://www.anthropic.com/news/claude-opus-4-5)
- **OSWorld** is the primary benchmark behind these claims: 369 real-computer tasks across
  Ubuntu/Windows/macOS, each with a setup config and an *execution-based* checker (it runs the
  result rather than asking an LLM to judge it). At release the best model hit **12.24%** vs a
  **72.36%** human baseline — GUI grounding and operational knowledge were the named gaps.
  [arXiv:2404.07972](https://arxiv.org/abs/2404.07972)
  Progress since has been steep: task success rose to ~66%+ (2026), with frontier models
  approaching the human baseline; enterprise variants (EntWorld) extend the setting. See
  [11 · AI for SWE / computer use](../11-emerging-application-subfields/ai-for-software-engineering.md).

## Long-horizon autonomy
- Frontier coding agents now run **30+ hours autonomously**. METR's time-horizon metric
  (the task length a model completes at 50% reliability) crossed multi-day territory and
  is the most-cited autonomy trend. See [08 · Economics & forecasting](../08-evaluation-and-governance/economics-and-forecasting.md).
- **Context management** is a named research problem. *Context-Folding* (ByteDance Seed
  + CMU + Stanford) gives the agent two tools: `branch(description, prompt)` spins a sub-task
  into a separate working context, and `return(message)` folds that branch back into the main
  thread, leaving only a summary. The behavior is trained end-to-end with **FoldGRPO**, a GRPO
  variant that adds token-level *process rewards* — an *unfolded-token penalty* (−1 on
  main-thread tokens once the main context exceeds 50% of the limit, pushing token-heavy work
  into branches) and an *out-of-scope penalty* (−0.2, with GPT-5-nano judging whether a branch
  stayed on its sub-task). On a 36B base (Seed-OSS-36B-Instruct), a 32K active context with
  ≤10 branches (≈327K theoretical max) reaches **0.620 pass@1 on BrowseComp-Plus** and
  **0.580 on SWE-Bench Verified**. That beats a 327K-context ReAct agent on the *same* base by
  +14.2 and +2.8 points while keeping the active context ~10× smaller, and matches agents built
  on 100B+ models (GPT-5 scores 0.793 / 0.718). FoldGRPO matters: over plain GRPO it adds +7.7%
  on BrowseComp and +1.6% on SWE-Bench, and it compresses a 100K+ total interaction to an ~8K
  main trajectory (>90% context compression).
  [arXiv:2510.11967](https://arxiv.org/abs/2510.11967)
  - *Author-stated limits:* implementation is incompatible with stock VeRL (branches are
    kept as separate causally-conditioned sequences); gains **plateau beyond ~320K tokens**;
    and *parallel* branching gave no improvement on BrowseComp (0.6133 pass@1, ≈ single-branch),
    likely because the benchmark is depth-first — breadth-first tasks (e.g. WideSearch) are
    flagged as the better testbed.

## Agent memory
- **Subtask-level memory** (Kuaishou) reframes agent memory away from per-episode stores.
  Instead of keying experience to the whole instance, it stores experience at the **subtask**
  level, tagged by functional category (ANALYZE / REPRODUCE / EDIT / VERIFY). Retrieval is
  two-stage: a *hard category filter* (only same-phase entries are eligible), then cosine
  similarity on the subtask's intent description — so a "fix login button" edit can reuse a
  "modify search bar" edit while ignoring a surface-similar but logically different "fix login
  timeout" bug. Memory accrues *online* over the SWE-bench Verified stream (no offline corpus,
  same LLM as solver — no stronger teacher). On the Mini-SWE-Agent scaffold it adds **+4.7pp
  Pass@1 on average** over vanilla (up to **+6.8pp on Gemini 2.5 Pro**) and beats an
  instance-level-memory baseline — which itself *degrades* some backbones (Claude 3.7 Sonnet
  52.2→51.1%) by injecting off-target noise. Gains scale with horizon: **+8.7pp on tasks
  >28 steps** (35.5→44.2%) where the matched-phase reproduction scripts act as shortcuts past
  trial-and-error loops. This is *not* a generic persistent cross-session store — it is
  functional-decomposition-aligned within the SWE task stream. [arXiv:2602.21611](https://arxiv.org/abs/2602.21611)

## Multi-agent orchestration
- **Anthropic's multi-agent research system** — an orchestrator spawns 3–5 parallel
  subagents (each its own context window) plus a citation pass; beats single-agent on
  breadth tasks at ~15× token cost. [Anthropic](https://www.anthropic.com/engineering/multi-agent-research-system)
- **Collaborative Reasoner** (Meta FAIR) — self-improvement via synthetic two-agent
  goal-oriented dialogue, +up to ~29% over standard CoT. [Meta](https://ai.meta.com/research/publications/collaborative-reasoner-self-improving-social-agents-with-synthetic-conversations/)
- **Agent communication protocols** (MCP for agent↔tool, A2A for agent↔agent) spawned a
  security/threat-modeling subfield and proposals for unified protocols. See
  [11 · Multi-agent systems](../11-emerging-application-subfields/multi-agent-systems.md).
- Multi-agent setups have *characteristic* failure modes (poor spec adherence, inter-agent
  misalignment, verification gaps) catalogued by **MAST**. See
  [11 · Multi-agent systems → MAST](../11-emerging-application-subfields/multi-agent-systems.md).

## Agentic coding & code world models
- **SWE-bench Verified** became the headline battleground (Claude Opus 4.5 80.9%,
  GPT-5.1-Codex-Max 77.9%, Gemini 3 Pro 76.2%) before saturating and being deprecated for
  contamination in early 2026 (replaced by SWE-bench Pro and others — see
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md)).
- **Meta Code World Model (CWM)** — 32B open-weights *dense* decoder-only LLM (131k context,
  interleaved local-8k / global-131k sliding-window attention) released by Meta FAIR as a
  *research testbed* for code-with-world-models. Beyond ordinary pretraining (8T tokens), it
  is **mid-trained on 5T tokens** of observation–action trajectories: Python-interpreter
  *execution traces* (predicting the post-line stack frame / local-variable state, JSON-encoded)
  plus large-scale agentic Docker interactions from a "ForagerAgent" (3M trajectories). The
  framing is *code world modeling* — simulating what code **does** when executed, which enables
  a "neural debugger" and execution-grounded reasoning (not the doc's earlier "fault
  localization + end-to-end patching"). Scores: **65.8% SWE-bench Verified (with test-time
  scaling)**, 68.6% LiveCodeBench, 96.6% Math-500, 76.0% AIME 2024.
  [arXiv:2510.02387](https://arxiv.org/abs/2510.02387)
- **Kimi K2** (Moonshot) — open-weight **1.04T-param** MoE (32B *activated*, DeepSeek-V3-style
  MLA, 384 experts/8 active) explicitly optimized for agentic tool use, pretrained on 15.5T
  tokens with the new **MuonClip** optimizer (Muon + QK-Clip weight clipping for stable
  attention logits, zero loss spikes). A large-scale synthetic agentic-trajectory pipeline
  (3000+ real MCP tools + 20K+ synthetic) plus RLVR-with-self-critique post-training drive
  the tool-use gains: **65.8% SWE-bench Verified**, 66.1 Tau2-Bench, 76.5 ACEBench (En), all
  non-thinking. [arXiv:2507.20534](https://arxiv.org/abs/2507.20534)

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
computer use (OSWorld ~66%+). Context compaction/folding is the working fix for long runs:
Context-Folding shows a 36B model can *match 100B+ agents* on long-horizon tasks by learning
to manage context, but the gain plateaus past ~320K tokens — active context management buys
efficiency, not unbounded horizon.

**Promising but unproven:** Reliable *long-horizon* autonomy (multi-day tasks), self-evolving
agents, and durable agent memory. Demonstrated, but not robust — e.g. subtask-level memory
adds real, horizon-scaling gains *within* the SWE task stream (+8.7pp on >28-step tasks) but
is not yet a general persistent cross-session store.

**Open problems & weaknesses:** **Reliability over long horizons** is the core gap — small
per-step error rates compound. Credit assignment for training agents is unsolved (see
[04 · RL](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md)). Agentic
guardrails lag chat guardrails, and agents already exhibit sabotage/deception under pressure.
Benchmarks overstate real-world readiness.
