# Long Context & Memory

Extending the effective context to millions of tokens — and the growing recognition that
**long context ≠ long-term memory**.

## Million-token context via efficient attention
- **DeepSeek Sparse Attention (DSA)** — a "lightning indexer" (multi-head ReLU-gated dot
  product, FP8, low-rank) + top-k token selection cuts attention from O(L²) to ~O(Lk) with
  near-identical quality; layered on Multi-head Latent Attention. DeepSeek-V3.2 —
  [arXiv:2512.02556](https://arxiv.org/abs/2512.02556). Precursor: **Native Sparse
  Attention (NSA)**, [arXiv:2502.11089](https://arxiv.org/abs/2502.11089).
- **Linear-attention hybrids** push context to 1M+ at low KV cost: **Kimi Linear**
  (KV-cache −75%, up to 6× decode throughput at 1M), **MiniMax-M1** (1M native context),
  **Qwen3-Next**. See [02 · Post-transformer architectures](../02-architectures-and-training/post-transformer-architectures.md).

## Test-time memory as a learned module
- **Titans** (Google) — a deep neural long-term memory module updated at inference by a
  *surprise* (gradient-of-loss) signal, enabling >2M-token effective context at near-linear
  cost; outperforms Mamba-2 and TTT on long-context tasks. [arXiv:2501.00663](https://arxiv.org/abs/2501.00663)
- **Nested Learning / "Hope"** (Google) — reframes models as nested optimization with a
  continuum memory system; a self-modifying Titans variant. [arXiv:2512.24695](https://arxiv.org/abs/2512.24695) ·
  [blog](https://research.google/blog/introducing-nested-learning-a-new-ml-paradigm-for-continual-learning/)

## Long context vs. long-term memory
- Dedicated benchmarks expose a *persistent-memory* gap beyond 1M tokens — recall over a
  huge context is not the same as durable, evolving memory. *"Beyond a Million Tokens"* —
  [arXiv:2510.27246](https://arxiv.org/abs/2510.27246)
- **Agent memory systems** (Mem0, Letta) and graph-based memory architectures add a *write
  path* that evolves over time, distinguishing memory from retrieval. Benchmarks now
  measure *forgetting* and *safety* (PersistBench, MemoryCD), not just recall. See
  [11 · RAG & memory systems](../11-emerging-application-subfields/rag-and-memory-systems.md).

## State of research

**Best-performing now:** Trainable sparse / linear-attention hybrids deliver cheap, reliable
million-token context and are deployed in production. For *durable* memory, retrieval +
agent-memory systems are the working approach.

**Promising but unproven:** Learned test-time memory modules (Titans/Hope) and architectural
continual memory — strong on long-context efficiency, not yet proven as true long-term memory.

**Open problems & weaknesses:** **Long context ≠ long-term memory** — models recall poorly
across very long inputs and forget across sessions. Knowing *when to forget*, avoiding stale
memory, and evaluating memory (vs. recall) are open. The long-context-vs-RAG trade-off is
unresolved.

## Connections
- The architectures enabling cheap long context → [02 · Architectures](../02-architectures-and-training/)
- Memory as a continual-learning problem → [04 · Continual learning](../04-reinforcement-learning-and-open-endedness/continual-learning-and-self-improvement.md)
