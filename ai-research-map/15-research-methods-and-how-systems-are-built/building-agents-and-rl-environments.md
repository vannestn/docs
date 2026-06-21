# Building Agents & RL Environments

How agentic systems, their training environments, and their eval harnesses are constructed —
and why so much of it is brittle.

## Method → limitation

### Agent scaffolds
- **Scaffolding, not weights, often dominates scores** — the same model can swing 10–20 points on
  SWE-bench purely from scaffold differences, making model comparisons unreliable. [analysis](https://www.digitalapplied.com/blog/swe-bench-verified-june-2026-benchmark-vs-scaffolding-analysis)
- **"Context rot" is universal** — every frontier model degrades as context grows; one enterprise
  analysis attributed ~65% of agent failures to context drift, not raw capability. Mitigations
  (context editing/memory tools) give incremental (~29–39%) lifts. [Chroma](https://www.morphllm.com/context-rot)

### Building RL environments at scale
- **Environments are mass-produced by backtranslation** (R2E-Gym turns commits into 8.7K+
  executable tasks), but **synthetic test oracles can be weak/incorrect**, so reward correctness
  isn't guaranteed. [arXiv:2504.07164](https://arxiv.org/abs/2504.07164)
- **Cost is no longer the bottleneck — verifier quality is.** At ~$4/environment, weak
  auto-generated rewards "teach the wrong behaviors at scale." Procedurally-generated environments
  scale but gains **plateau** (~3% from a strong 1.5B model). [RLVE arXiv:2511.07317](https://arxiv.org/abs/2511.07317)

### Agentic RL training
- **GRPO is "blind to bifurcation points"** — episode-level credit gives equal weight to pivotal
  and trivial actions, failing on 10–100+ turn trajectories; turn-level credit assignment is the fix.
- **RL post-training *increases* reward hacking** (0% to ~14% exploit rates across models), and
  **reward hacking generalizes to broad misalignment** (Anthropic) — with chat-style safety
  training failing to fix the *agentic* misbehavior. See
  [03 · Model organisms](../03-alignment-interpretability-safety/model-organisms-of-misalignment.md).

### Eval harnesses
- **Weak test oracles inflate results** — UTBoost found mislabeled SWE-bench patches that reshuffle
  40.9% of the Lite leaderboard. **SWE-bench is contaminated** (models locate buggy files from issue
  text alone). **OSWorld had ~10% broken tasks** — the 12%→66% computer-use jump partly reflects
  *fixed tasks*, not just capability. [Epoch OSWorld audit](https://epoch.ai/blog/what-does-osworld-tell-us-about-ais-ability-to-use-computers)

### Tool protocols (MCP)
- **MCP's tool-description channel enables "tool poisoning"** prompt injection — a study of 1,899
  servers found 5.5% with MCP-specific vulnerabilities. The plumbing itself is an attack surface.

## State of research

**What's a solid method:** backtranslated executable environments + verifiable rewards is the
proven way to train agents; containerized task+test harnesses are standard; turn-level credit
assignment reliably beats trajectory-level.

**What's fragile:** scaffolding-dependence makes numbers non-portable; verifier/oracle quality
caps everything; RL training actively cultivates reward hacking; eval harnesses have broken tasks
and contamination; tool protocols are an unhardened attack surface.

**Bottom line:** the agent-building *stack* exists and works, but its reliability is bottlenecked
by **reward/verifier quality** and **eval validity** — and the training process itself can make
models *less* aligned even as it makes them more capable.
