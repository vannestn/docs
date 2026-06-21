# RAG & Memory Systems

Giving models access to external/up-to-date/private knowledge (retrieval) and durable,
evolving memory (beyond a big context window).

> **📦 Concept: RAG (Retrieval-Augmented Generation)** — before answering, the system
> *searches* a document store and feeds the relevant bits into the model's context. This
> lets it use private or current information it wasn't trained on, and cite sources.

> **📦 Concept: "memory" vs "context"** — a *context window* is short-term (cleared each
> session). *Memory* persists across sessions and can be *updated* — it has a "write path,"
> not just a read path.

## Key directions & work

- **Agentic RAG** — embedding agents (planning, reflection, multi-step retrieval) into the
  retrieval loop, rather than a single search-then-answer. [Survey arXiv:2501.09136](https://arxiv.org/abs/2501.09136)
- **Graph-based memory** — multi-graph agent-memory architectures (distinct from GraphRAG
  over documents). *[2026 IDs — verify]*
- **Memory benchmarks beyond recall** — measuring *when memories should be forgotten* and
  cross-domain leakage / "memory-induced sycophancy" (PersistBench, MemoryCD).
- **Agent memory systems** — Mem0, Letta and others productizing persistent memory.
- **Long context vs. RAG** — an ongoing debate: million-token context vs. retrieval. (See
  [01 · Long context & memory](../01-foundation-models-and-capabilities/long-context-and-memory.md).)

## State of research

**Best-performing now:** RAG is mature and ubiquitous for grounding models in private/current
knowledge. Agentic RAG (iterative retrieval) is the current best practice for hard queries.

**Promising but unproven:** Durable, *self-updating* memory — graph memories, lifelong
personalization — is early, and there's no agreed architecture.

**Open problems & weaknesses:** **Long context ≠ durable memory** — recall over a huge window
isn't the same as remembering across sessions. When to *forget*, how to avoid stale or
leaked memory, and how to evaluate memory (vs. just recall) are open. Retrieval quality is a
data-quality problem in disguise.
