# RAG & Memory Systems

Two ways to give a model knowledge it wasn't trained on: **retrieval** (pull in external,
current, or private documents at query time) and **memory** (durable, evolving state that
persists across sessions — not just a bigger context window).

> **📦 Concept: RAG (Retrieval-Augmented Generation)** — before answering, the system
> *searches* a document store and feeds the relevant bits into the model's context. This
> lets it use private or current information it wasn't trained on, and cite sources.

> **📦 Concept: "memory" vs "context"** — a *context window* is short-term (cleared each
> session). *Memory* persists across sessions and can be *updated* — it has a "write path,"
> not just a read path.

## Key directions & work

- **Agentic RAG** — putting agents (planning, reflection, tool use, multi-step retrieval)
  inside the retrieval loop, instead of a single search-then-answer. The
  [Agentic RAG survey](https://arxiv.org/abs/2501.09136) ([arXiv:2501.09136](https://arxiv.org/abs/2501.09136))
  organizes the field by *agent count, control structure, autonomy, and knowledge
  representation*: single-agent **router** (one agent picks the source:
  Text-to-SQL / vector / web / recsys), **multi-agent** (specialized retrieval agents working
  in parallel under a coordinator), **hierarchical** (tiered master→sub-agent delegation),
  **corrective** (a relevance-evaluation agent grades retrieved docs and triggers query
  rewriting or web fallback), **adaptive** (a classifier routes by query complexity — no
  retrieval / single-step / multi-step), and **graph-based** (Agent-G, GeAR, and
  agentic document workflows). See *§ Agentic RAG taxonomy* below.
- **Graph-based memory** — multi-graph agent-memory architectures (distinct from GraphRAG
  over documents). e.g. **MAGMA**, a multi-graph agentic memory architecture
  ([arXiv:2601.03236](https://arxiv.org/abs/2601.03236)), and **GAM**, hierarchical
  graph-based agentic memory ([arXiv:2604.12285](https://arxiv.org/abs/2604.12285)).
- **Memory benchmarks beyond recall** — measuring *when memories should be forgotten*
  (**PersistBench**, [arXiv:2602.01146](https://arxiv.org/abs/2602.01146)) and cross-domain
  leakage / "memory-induced sycophancy" — PersistBench names exactly these two
  long-term-memory risks. **MemoryCD** ([arXiv:2603.25973](https://arxiv.org/abs/2603.25973))
  targets long-context, cross-domain personalization.
- **Agent memory systems** — **Mem0** ([arXiv:2504.19413](https://arxiv.org/abs/2504.19413))
  and **Letta / MemGPT** ([arXiv:2310.08560](https://arxiv.org/abs/2310.08560)) productizing
  persistent memory. See *§ Productized memory* below.
- **Long context vs. RAG** — an ongoing debate: million-token context vs. retrieval. (See
  [01 · Long context & memory](../01-foundation-models-and-capabilities/long-context-and-memory.md).)

## Agentic RAG taxonomy

The [Agentic RAG survey](https://arxiv.org/abs/2501.09136) (Singh, Ehtesham, Kumar, Khoei,
Vasilakos; [arXiv:2501.09136](https://arxiv.org/abs/2501.09136), v4 · Apr 2026;
[code](https://github.com/asinghcsu/AgenticRAG-Survey)) is a *conceptual* survey — it
catalogs architectures and trade-offs but reports **no benchmark numbers of its own**, so the
figures in its worked examples (e.g. "20% reduction in emissions", "1.2 million jobs") are
illustrative prompts, not measured results. ⚠️ Don't cite those as findings.

Its real contribution is structure. The framing: traditional RAG is *static and linear*
(retrieve-then-read), which breaks on multi-step reasoning, deep context, and iterative
refinement; *agentic* RAG adds an explicit control layer using four agentic patterns —
**reflection** (Self-Refine, Reflexion, CRITIC), **planning** (task decomposition),
**tool use**, and **multi-agent collaboration** — plus workflow patterns (prompt chaining,
routing, parallelization, orchestrator–workers, evaluator–optimizer).

The taxonomy's six architecture families, in rough order of complexity:

| Family | Control | Reasoning depth | Best-fit |
| --- | --- | --- | --- |
| **Single-agent router** | Centralized | Low–moderate | Simple QA, source routing |
| **Multi-agent** | Flat (coordinator + specialists) | Moderate–high | Multi-domain synthesis |
| **Hierarchical** | Tiered (master → sub-agents) | High | High-stakes, reliability-critical |
| **Corrective** | Evaluator-based loop | High | Factuality-critical (grade-then-fix) |
| **Adaptive** | Complexity classifier | Variable | Mixed simple/complex traffic |
| **Graph-based** (Agent-G, GeAR) | Adaptive/structured | High, multi-hop | Knowledge-intensive, relational |

**Corrective RAG** is the most concrete pattern: a *Relevance Evaluation Agent* classifies
retrieved docs as relevant / ambiguous / irrelevant; below threshold, a *Query Refinement
Agent* rewrites the query and an *External Knowledge Retrieval Agent* falls back to web search
before a *Response Synthesis Agent* answers. **Graph-based** covers **Agent-G** (modular
retriever banks over graph + text, with a critic module and feedback loops) and **GeAR**
(graph-expansion over a base retriever like BM25, plus an agent layer for multi-hop) —
GeAR draws on the separate [GeAR paper](https://arxiv.org/abs/2412.18431). The survey also
covers **agentic document workflows (ADW)** — stateful, end-to-end document automation
(parse → retrieve → reason → structured output), e.g. LlamaIndex's invoice/contract pipelines.

## Productized memory

- **Mem0** ([arXiv:2504.19413](https://arxiv.org/abs/2504.19413)) extracts, consolidates, and
  retrieves salient facts from conversation rather than stuffing full history into context.
  On the **LOCOMO** long-conversation benchmark it reports a **~26% relative improvement** in
  LLM-as-a-Judge over OpenAI's memory feature, with **~91% lower p95 latency** and **>90% token
  savings**; the graph-memory variant adds ~2 points of accuracy. ([Source](https://arxiv.org/abs/2504.19413))
- **Letta / MemGPT** ([arXiv:2310.08560](https://arxiv.org/abs/2310.08560)) frames the LLM as
  an OS managing hierarchical memory tiers — in-context **core memory** (RAM) vs. external
  **archival/recall memory** (disk) — with the *model itself* editing memory via tool calls,
  rather than an external pipeline deciding what to write. MemGPT's open-source project is
  now **Letta** ([letta.com](https://www.letta.com/blog/agent-memory/)).
- **GraphRAG** (Microsoft) is document-side, not agent memory:
  ["From Local to Global"](https://arxiv.org/abs/2404.16130)
  ([arXiv:2404.16130](https://arxiv.org/abs/2404.16130)) builds an entity knowledge graph,
  pregenerates **community summaries**, and uses them for *global sensemaking* queries
  ("what are the main themes?") that flat retrieval can't answer — reporting gains in answer
  comprehensiveness and diversity over baseline RAG on ~1M-token corpora.

## State of research

**Best-performing now:** RAG is mature and ubiquitous for grounding models in private/current
knowledge. Agentic RAG (iterative retrieval) is the current best practice for hard queries —
though the survey's own *Lessons Learned* cautions it "is not always the right default":
for simple fact retrieval, plain modular RAG is cheaper and adds no coordination overhead.

**Promising but unproven:** Durable, *self-updating* memory — graph memories, lifelong
personalization — is early, and there's no agreed architecture. Mem0/Letta show production
viability, but graph-based agent memory (MAGMA, GAM) is still 2026-fresh.

**Open problems & weaknesses** (the survey is unusually pointed here):

- **Long context ≠ durable memory** — recall over a huge window isn't remembering across
  sessions. PersistBench finds frontier LLMs fail *cross-domain leakage* checks at a median
  **53%** rate and *sycophancy* checks at **97%**, so "remembering" without forgetting and
  isolation is actively harmful. ([arXiv:2602.01146](https://arxiv.org/abs/2602.01146))
- **Retrieval quality is the real bottleneck** — the survey states plainly that "agentic
  reasoning cannot compensate for consistently poor retrieval"; invest in indexing and
  structured/unstructured fusion *before* adding agent complexity. (A data-quality problem
  in disguise.)
- **Evaluation must measure process, not just output** — answer-correctness metrics miss the
  intermediate decisions that define agentic RAG; the survey calls for process-aware metrics
  on reasoning trajectories, planning depth, and tool-usage patterns.
- **Autonomy needs explicit constraints** — unbounded agents over-invoke tools and loop;
  bounded planning horizons, tool-access policies, and stopping criteria are needed.
- **Coordination, cost, and governance** — emergent multi-agent behavior is hard to predict;
  parallel agents inflate latency/cost; and error attribution across agents complicates trust
  and auditability for high-stakes use.
