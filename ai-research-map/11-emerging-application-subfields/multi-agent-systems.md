# Multi-Agent Systems

## In brief
- **What it is** — instead of one AI model doing everything, multiple AI agents work in parallel:
  splitting a task among specialists, talking to each other over shared "languages" (protocols), or
  role-playing as a simulated population. Think of it as moving from a single worker to a team with a
  manager, or to a virtual town full of agents whose collective behavior you can study.
- **Why it's pursued** — some jobs are too big or too parallel for one agent (broad research, large
  codebases), and some questions — how a rumor spreads, how a policy lands — are best explored by
  simulating many interacting actors. Shared protocols also let agents from different vendors plug
  into tools and into one another without custom glue code.
- **Potential impact** — done well, multi-agent setups deliver measurable gains on breadth-heavy
  tasks and give social scientists a cheap sandbox for "what if" experiments. The catches: they burn
  far more compute (token cost multiplies), fail in characteristic coordination ways rather than from
  weak models, and open a fresh security attack surface where one compromised tool or agent can
  poison the rest.

Multiple AI agents coordinating — to solve tasks together, to communicate over shared protocols, or
to simulate societies.

> **📦 Concept: agent protocols** — standard "languages" for agents to talk to tools and to
> each other. **MCP** (Model Context Protocol, Anthropic) connects an agent to tools/data; **A2A**
> (Agent2Agent, Google) lets agents talk to each other. Think USB-C, but for AI agents.

## Key directions & work

- **Communication protocols & their security** — two complementary "languages" have emerged. **MCP**
  (Anthropic, Nov 2024) is a JSON-RPC client-server interface an agent uses to invoke tools and data;
  **A2A** (Google, Apr 2025) is a peer-to-peer protocol for agents to delegate tasks via
  capability-describing "Agent Cards," with 50+ companies partnering at launch. They work together:
  A2A routes the task, and MCP gives the agent the context to execute it. A survey compares
  MCP/ACP/A2A/ANP across interaction modes, discovery, communication patterns, and security models,
  proposing a phased MCP→ACP→A2A→ANP adoption roadmap
  ([arXiv:2505.02279](https://arxiv.org/abs/2505.02279)). Security is a fresh attack surface: an
  empirical study of 67k+ MCP servers across six registries finds widespread **tool poisoning**,
  data exfiltration, and cross-system privilege escalation
  ([arXiv:2503.23278](https://arxiv.org/abs/2503.23278), ACM TOSEM).
- **Why multi-agent systems fail** — **MAST** (Multi-Agent System failure Taxonomy, UC Berkeley)
  hand-annotates 1,600+ traces across 7 frameworks into 14 failure modes in 3 categories: ~42% from
  bad specification / system design, ~37% from inter-agent misalignment, ~21% from weak task
  verification. The takeaway: most failures are *design and orchestration* problems, not limits of
  model capability — so bigger models alone won't fix them
  ([arXiv:2503.13657](https://arxiv.org/abs/2503.13657)).
- **Orchestrator-worker systems** — a lead agent plans, spawns 3–5 specialist subagents in parallel,
  then runs a separate citation pass. Anthropic's internal eval reports this beats single-agent Claude
  Opus 4 by **90.2%** on a breadth-first research task, but uses ~**15× the tokens** of a normal chat
  — so the economics only work for high-value research
  ([Anthropic](https://www.anthropic.com/engineering/multi-agent-research-system)). See
  [01 · Agents](../01-foundation-models-and-capabilities/agents-and-tool-use.md).
- **Agent societies as social-science labs** — **AgentSociety** pairs LLM-driven generative agents
  (minds: emotion/needs/cognition; behaviors: mobility/social/economic) with a realistic urban
  social-economic environment and a distributed engine (Ray + MQTT/EMQX), running DeepSeek-V3 over
  **10k+ agents and ~5M total interactions** (~491 env-interactions/agent/day). It reproduces five
  real-world social phenomena — polarization, inflammatory-message spread, UBI, hurricane shocks, and
  urban sustainability — though each *experiment* uses only 100–1,000 agents
  ([arXiv:2502.08691](https://arxiv.org/abs/2502.08691)). Counterpoint: *"Position: AI Agents Are Not
  (Yet) a Panacea for Social Simulation"* argues that plausible role-play is not the same as faithful
  behavioral validity, and that outcomes are often dominated by interaction protocols, scheduling, and
  initial priors rather than by agent-to-agent messaging
  ([arXiv:2603.00113](https://arxiv.org/abs/2603.00113)).

## What AgentSociety actually shows

The five experiments validate the simulator against known/real-world patterns rather than making
novel predictions:

- **Polarization (gun control, 100 agents)** — in the control group 39% became more polarized
  through unmoderated discussion; an echo-chamber ("homophilic") group hit 52% more-polarized; a
  cross-exposure ("heterogeneous") group flipped it — 89% became *less* polarized, suggesting
  exposure to opposing views as a mitigation.
- **Inflammatory messages (Xuzhou "chained woman" case, ~hundreds of agents)** — inflammatory seeds
  spread wider and drove higher emotional intensity than neutral content; *node-level* intervention
  (suspending repeat spreaders) beat *edge-level* (cutting connections).
- **UBI (Texas, 100 agents, $1,000/month)** — UBI raised consumption and lowered depression
  (CES-D scale), matching the direction of real Texas UBI findings.
- **Hurricane Dorian (Columbia SC, 1,000 agents)** — activity level dropped from 70–90% to ~30% at
  landfall, then recovered, tracking SafeGraph mobility data.
- **Urban sustainability (Beijing, 200 agents, 6 research teams)** — all six injected eco-norm
  systems raised pro-environmental norms and cut mobility CO₂; teams emphasizing **personal/identity
  norms** (Team 3) outperformed those leaning on injunctive norms (Team 2).

Author-stated limitations: the economic model omits unemployment, labor-market negotiation, and
goods-market shocks; mobility shows "deviations in magnitude and speed of response" vs. real data
during the hurricane peak; and DeepSeek-V3 throughput (LLM API latency) is the dominant scaling
bottleneck.

## State of research

**Best-performing now:** Orchestrator-worker scaffolds are the proven, deployed multi-agent
pattern (real, measured gains on breadth/research tasks — see the 90.2% figure above). MCP has
become a de-facto standard for tool connectivity, now paired with A2A for agent-to-agent delegation.

**Promising but unproven:** Open-ended agent-to-agent collaboration, large agent societies as
*predictive* (vs. reproductive) social models, and self-organizing multi-agent teams.

**Open problems & weaknesses:** Multi-agent systems are expensive (token cost multiplies, ~15×) and
fail in characteristic ways — MAST attributes the majority to design/coordination/verification, not
raw model capability. **Protocol security** is a fresh attack surface (tool poisoning, exfiltration,
privilege escalation across MCP servers). Whether simulated agent societies *predict* (rather than
merely *replicate*) human behavior is contested, with outcomes often dominated by scheduling and
priors. Coordination, credit assignment, and collusion (e.g., a worker agent colluding with a
monitor) are open — overlapping with
[03 · Control](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md).
