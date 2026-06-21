# Retrieval & Embeddings

The representation-learning and information-retrieval research underneath RAG and search —
quietly foundational to most deployed AI systems.

> **📦 Concept: "embedding"** — turning text/images into a list of numbers (a vector) so that
> similar things sit close together, enabling search by meaning rather than keywords.

## Key directions & work

- **Decoder-LLM embedders now top the leaderboards** — adapting decoder LLMs with bidirectional
  attention + latent-attention pooling (NV-Embed pattern) displaced BERT-style encoders.
  Leaders: **Gemini Embedding** (closed), **Qwen3-Embedding-8B** and **Llama-Embed-Nemotron-8B**
  (open, top MMTEB). [NV-Embed arXiv:2405.17428](https://arxiv.org/abs/2405.17428)
- **A proven theoretical ceiling on single-vector retrieval** — the number of document subsets
  any query can express is bounded by embedding dimension; the **LIMIT** benchmark makes SOTA
  models collapse on a trivial task. Google DeepMind — [arXiv:2508.21038](https://arxiv.org/abs/2508.21038)
- **Reasoning-intensive retrieval is largely unsolved** — best retrievers score <30 nDCG@10 on
  **BRIGHT** (vs ~59 on standard benchmarks). [arXiv:2407.12883](https://arxiv.org/abs/2407.12883)
- **Late interaction revived** — ColBERT/PLAID multi-vector matching expresses patterns single
  vectors provably can't; **ColPali** extends it to *visual documents* (retrieve over page
  images, no OCR). [ColPali arXiv:2407.01449](https://arxiv.org/abs/2407.01449)
- **Contextualized chunk embeddings** (Voyage) and **Anthropic's Contextual Retrieval** —
  encoding chunks with document context; hybrid embedding+BM25+rerank drives most practical RAG
  gains. [Anthropic](https://www.anthropic.com/news/contextual-retrieval)
- **Rerankers** (cross-encoders) remain the highest-ROI add-on to any retrieval pipeline.

## State of research

**Best-performing now:** decoder-LLM embedders (Gemini, Qwen3, Nemotron); ColPali/ColQwen for
visual documents; cross-encoder rerankers as a universal precision boost; hybrid dense+sparse.

**Promising but unproven:** reasoning-trained retrievers (ReasonIR), native multimodal single-
space embeddings, ultra-long-context embedders.

**Open problems & weaknesses:** the **dimension bound** on single-vector retrieval (LIMIT);
**reasoning-intensive retrieval** (BRIGHT) is essentially unsolved; no model dominates all of
MMTEB; filtered approximate-nearest-neighbor search has no universal winner; the multimodal
"modality gap" persists; and MTEB itself faces overfitting/contamination. Retrieval quality is,
at root, a **data-quality** problem — see [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).
