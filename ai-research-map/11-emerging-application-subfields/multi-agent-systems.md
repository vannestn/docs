# Multi-Agent Systems

Multiple AI agents coordinating — to solve tasks, to communicate via shared protocols, or to
simulate societies.

> **📦 Concept: agent protocols** — standard "languages" for agents to talk to tools and to
> each other. **MCP** (Model Context Protocol) connects an agent to tools/data; **A2A**
> (Agent-to-Agent) lets agents talk to each other. Think USB-C, but for AI agents.

## Key directions & work

- **Communication protocols & their security** — comparative threat-modeling of MCP, A2A, and
  others, plus proposals for unified protocols. *[2026 IDs — verify]*
- **Orchestrator-worker systems** — a lead agent spawns specialist subagents (Anthropic's
  research system; +breadth at ~15× token cost). See [01 · Agents](../01-foundation-models-and-capabilities/agents-and-tool-use.md).
- **Agent societies as social-science labs** — **AgentSociety** simulates 10k+ agents / 5M+
  interactions to study polarization, policy, and shocks. [arXiv:2502.08691](https://arxiv.org/abs/2502.08691).
  Counterpoint: *"AI Agents Are Not (Yet) a Panacea for Social Simulation."*

## State of research

**Best-performing now:** Orchestrator-worker scaffolds are the proven, deployed multi-agent
pattern (real gains on breadth/research tasks). MCP has become a de-facto standard for
tool connectivity.

**Promising but unproven:** Open-ended agent-to-agent collaboration, large agent societies as
*predictive* social models, and self-organizing multi-agent teams.

**Open problems & weaknesses:** Multi-agent systems are expensive (token cost multiplies) and
can compound errors. **Protocol security** is a fresh attack surface. Whether simulated agent
societies actually predict human behavior is contested. Coordination, credit assignment, and
collusion (e.g., a worker agent colluding with a monitor) are open — overlapping with
[03 · Control](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md).
