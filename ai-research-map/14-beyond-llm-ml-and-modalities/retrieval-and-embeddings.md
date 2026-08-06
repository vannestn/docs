# Retrieval & Embeddings

## In brief
- **What it is** — the representation-learning and information-retrieval research underneath RAG
  and search. An *embedding* turns text or images into a list of numbers (a vector) so that
  similar things sit close together, letting a system search by meaning rather than exact
  keywords. Retrieval is the machinery that, given a query, fetches the most relevant items from
  a large collection.
- **Why it's pursued** — it is quietly foundational to most deployed AI systems: it is how a
  chatbot finds the right document to answer from, how search engines rank results, and how
  recommender systems match items. Better retrieval means fewer wrong or made-up answers and
  access to information the model was never trained on.
- **Potential impact** — stronger embedders and retrievers make AI systems more accurate,
  up-to-date, and grounded in real sources. The key limitation now has a proof behind it: a single
  fixed-size vector can only distinguish so many things (the LIMIT ceiling), so the frontier is
  moving toward multi-vector matching, cross-encoder rerankers, and sparse hybrids.

> **📦 Concept: "embedding"** — turning text/images into a list of numbers (a vector) so that
> similar things sit close together, enabling search by meaning rather than keywords.

## Key directions & work

- **Decoder-LLM embedders now top the leaderboards** — adapting decoder LLMs by (1) removing
  the causal attention mask during contrastive training so attention is bidirectional and
  (2) replacing mean/last-`<EOS>` pooling with a trainable **latent-attention** layer. This is
  the NV-Embed recipe: NV-Embed-v2 (built on Mistral-7B) hit **72.31** on the 56-task MTEB and
  reclaimed #1 (Aug 30, 2024); v1 scored 69.32 (#1 May 24, 2024).
  [NV-Embed arXiv:2405.17428](https://arxiv.org/abs/2405.17428) (NVIDIA, ICLR 2025).
  Current multilingual leaders: **Gemini Embedding** (`gemini-embedding-001`, closed),
  **Qwen3-Embedding-8B**, and **Llama-Embed-Nemotron-8B** — the last ranks #1 on the MMTEB
  (multilingual) leaderboard by Borda count as of Oct 2025, though Qwen3-8B edges it on raw
  mean-task score (70.58 vs 69.46). [Llama-Embed-Nemotron blog](https://huggingface.co/blog/nvidia/llama-embed-nemotron-8b)
- **A proven theoretical ceiling on single-vector retrieval** — for embedding dimension `d`,
  the number of top-`k` document subsets *any* query can select is bounded (a sphere-packing
  argument: `d ≳ log C(n,k) / log(1+1/γ)` for margin γ). The **LIMIT** benchmark instantiates
  this with a trivially simple task that SOTA models still fail.
  Google DeepMind — [arXiv:2508.21038](https://arxiv.org/abs/2508.21038) (ICLR 2026).
- **Reasoning-intensive retrieval is largely unsolved** — on **BRIGHT** (1,384 real queries,
  12 domains) the best retriever scores only **24.3 nDCG@10** averaged across datasets; SFR-
  Embedding-Mistral, which scores 59.0 on BEIR, drops to 18.3 on BRIGHT.
  [arXiv:2407.12883](https://arxiv.org/abs/2407.12883) (ICLR 2025).
- **Late interaction revived** — ColBERT-style multi-vector matching (per-token MaxSim) expresses
  patterns single vectors provably can't; **ColPali** extends it to *visual documents*: it embeds
  rendered **page images** with a vision-LLM (PaliGemma-3B), skipping OCR/layout/chunking entirely.
  [ColPali arXiv:2407.01449](https://arxiv.org/abs/2407.01449) (ICLR 2025).
- **Contextualized chunk embeddings** (Voyage) and **Anthropic's Contextual Retrieval** —
  prepend an LLM-generated chunk-specific context blurb before embedding. Contextual embeddings +
  contextual BM25 cut top-20 retrieval failures by 49% (5.7% → 2.9%); adding a reranker reaches
  67% (→ 1.9%). [Anthropic](https://www.anthropic.com/news/contextual-retrieval)
- **Rerankers** (cross-encoders) remain the highest-ROI add-on to any retrieval pipeline — and on
  the hardest tasks (BRIGHT, LIMIT) they are the *only* thing that helps decisively.

## How the decoder-LLM embedder recipe works (NV-Embed)

NV-Embed isolates which design choices actually move MTEB, via clean ablations on Mistral-7B
(LoRA r=16, α=32; 512-token max length):

- **Bidirectional > causal attention.** Removing the causal mask during contrastive training
  beats causal across every pooling type — no extra masked-LM warm-up phase (unlike LLM2Vec) and
  no joint generative objective (unlike GritLM); they just drop the mask and find "it works
  compellingly well."
- **Latent-attention pooling > mean pooling > last-`<EOS>`.** A trainable latent array
  (`r=512` latents, 8 heads) acts as cross-attention "dictionary learning" over the token
  sequence. On the 15 retrieval tasks it lifts nDCG@10 from **61.82 (mean pool) → 62.65
  (latent-attention)**; last-`<EOS>` lags due to recency bias. Adding plain *self*-attention
  instead does **not** help (the LLM already has self-attention layers).
- **Two-stage instruction tuning.** Stage 1: contrastive training on retrieval data with in-batch
  negatives + curated hard negatives. Stage 2: blend in non-retrieval tasks (classification,
  clustering, STS) **with in-batch negatives disabled** — because for classification, other
  in-batch "passages" may share the same label and aren't true negatives. This second stage
  improves non-retrieval *and* retrieval accuracy.
- **Data tricks that mattered.** Positive-aware hard-negative mining (threshold negatives at 95%
  of the positive relevance score, à la NV-Retriever) lifted BEIR 59.22 → 61.52; adding more
  public retrieval data +0.7; synthetic data (120k examples from Mixtral-8x22B) added a final
  +0.24 MTEB. Example-based (vs label-based) construction of classification/clustering pairs
  lifted those tasks 64.80 → 69.27.
- **Out-of-domain & compression.** NV-Embed-v2 also tops AIR-Bench Long-Doc (74.78) and is 2nd in
  QA — beyond the MTEB training distribution. Appendix study: prune 8B → 3.5B (SparseGPT, drop the
  latent block) + INT8/FP8 quantization with LoRA recovery, staying more robust under low precision
  than smaller native 3-4B embedders.

## Late interaction in vision space (ColPali / ViDoRe)

ColPali's thesis: in real document retrieval the bottleneck is the **ingestion pipeline** (OCR,
layout detection, chunking, captioning), not the embedding model. It sidesteps all of it.

- **Architecture.** Feed page-image patches through PaliGemma-3B; project each output token to a
  `D=128` multi-vector representation (ColBERT-style); score queries with the late-interaction
  MaxSim operator. Trained 1 epoch, LoRA (α=r=32), on **118,695 query–page pairs** (63% repurposed
  academic VQA, 37% synthetic pseudo-questions generated by Claude-3 Sonnet over web-crawled PDFs).
- **Results (ViDoRe, nDCG@5 avg over 10 tasks).** ColPali **81.3** vs the strongest text pipeline
  (Unstructured + Claude captioning + BGE-M3) **67.0**, and vs a single-vector PaliGemma bi-encoder
  (BiPali) **58.8**. The gap is largest on visually complex sets — InfographicVQA, ArxivQA, TabFQuAD.
- **Why multi-vector here.** An ablation training a *single-vector* late-interaction SigLIP variant
  (ColSigLIP) gets "abysmal" scores — SigLIP's contrastive pretraining pools to one latent, so its
  per-patch embeddings aren't aligned for token-level matching. The late-interaction signal needs
  per-token representations that were actually trained that way.
- **Cost profile.** Indexing **0.39 s/page** vs 7.22 s for the PDF-parser pipeline (which spends
  2.67 s OCR + 3.71 s captioning). Query latency ~30 ms. Storage is the catch: **257.5 KB/page**
  (an order of magnitude over BM25, two over BGE-M3) — mitigated by token pooling (pool factor 3
  keeps 97.8% nDCG while cutting vectors 66.7%) and clustering/quantization.
- **Better VLMs → better retrievers.** Swapping PaliGemma for Qwen2-VL-2B (ColQwen2, 768 patches)
  gives **+5.3 nDCG@5 → 86.6 avg**, showing generative-VLM quality transfers to retrieval.

## Two benchmarks that bound the field

**BRIGHT — reasoning-intensive retrieval (the empirical wall).** Relevance requires *reasoning*,
not lexical/semantic overlap: e.g. a LeetCode problem is relevant to another sharing an algorithm,
or a math problem relevant to one using the same theorem. 12 datasets across StackExchange (7),
coding (LeetCode, Pony), and theorems (AoPS, TheoremQA). Findings:
- Best avg nDCG@10 = **24.3** (Qwen-1.5 7.7B tops the open models at 22.5 avg); BM25 manages 14.5,
  and large dense models barely beat it on most domains.
- Prepending **LLM chain-of-thought reasoning** to the query as the search string improves results
  up to **+12.2 points** (BM25 benefits most — its bag-of-words is robust to the reformulation).
- **Reranking with LLMs** helps where cross-encoders trained on MS MARCO hurt: a MiniLM
  cross-encoder *degrades* BRIGHT, while GPT-4 reranking adds +3.1.
- **Robust to contamination.** Continuing to train GritLM on the BRIGHT StackExchange corpus
  (language-modeling + QA pairs, without query→doc supervision) does *not* improve scores —
  in-domain knowledge alone doesn't substitute for the reasoning step.

**LIMIT — the theoretical wall.** Theorem 1 (sphere-packing / Johnson–Lindenstrauss-flavored)
proves that for any fixed `d` there exist top-`k` document combinations no query embedding can
return. The implied critical corpus sizes are sobering: `d=512` saturates at ~500k docs,
`d=1024` at ~4M, `d=4096` at ~107M — and those are *best-case* (free-optimized embeddings on the
test set; real models constrained by language/gradient learning are far worse). The LIMIT dataset
("who likes Quokkas?") has 50k docs, 1000 queries, k=2; SOTA single-vector models stay **below 20%
recall@100**, and even the 46-document mini-version can't be solved at recall@20. What *does* work:
high-dimensional **BM25** (near-perfect on the original, but collapses ~90% on a synonym variant),
**multi-vector** GTE-ModernColBERT (better but unsolved), and a **Gemini-2.5-Pro cross-encoder**
reranker (solves 100% in one pass). Author takeaway: instruction/reasoning retrieval will hit this
single-vector ceiling; the field needs cross-encoders, multi-vector, or new single-vector
architectures (e.g. hypercoders).

## State of research

**Best-performing now:** decoder-LLM embedders (Gemini Embedding, Qwen3-Embedding-8B,
Llama-Embed-Nemotron-8B; NV-Embed established the recipe); ColPali/ColQwen for visual documents;
cross-encoder rerankers as a universal precision boost (and the only reliable lever on BRIGHT/LIMIT);
hybrid dense+sparse with contextualized chunks.

**Promising but unproven:** reasoning-trained retrievers (ReasonIR), native multimodal single-
space embeddings, ultra-long-context embedders, more expressive single-vector architectures
(hypercoders) aimed at the LIMIT ceiling.

**Open problems & weaknesses:** the **dimension bound** on single-vector retrieval (LIMIT) is now
*proven*, not conjectural — and points the field toward multi-vector / cross-encoder / sparse
hybrids; **reasoning-intensive retrieval** (BRIGHT, best 24.3 nDCG@10) is essentially unsolved and
robust to pre-training contamination; no single model dominates all of MMTEB (Borda vs mean-task
rankings disagree); filtered approximate-nearest-neighbor search has no universal winner; the
multimodal "modality gap" persists; and MTEB itself faces overfitting/contamination. Retrieval
quality is, at root, a **data-quality** problem — see [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).
