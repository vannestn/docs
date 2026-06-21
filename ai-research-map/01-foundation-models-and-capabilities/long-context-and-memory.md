# Long Context & Memory

Extending the effective context to millions of tokens — and the growing recognition that
**long context ≠ long-term memory**.

## Million-token context via efficient attention
- **DeepSeek-V4** — [arXiv:2606.19348](https://arxiv.org/abs/2606.19348) — two MoE models built for
  **1M-token context**: **V4-Pro** (1.6T total / 49B active) and **V4-Flash** (284B total / 13B
  active), pre-trained on **32T+ tokens**. The recipe combines a **hybrid attention** stack —
  **Compressed Sparse Attention (CSA)** + **Heavily Compressed Attention (HCA)** —
  **Manifold-Constrained Hyper-Connections (mHC)** in place of plain residuals, and the **Muon**
  optimizer. Headline efficiency: at 1M-token context, **V4-Pro needs only 27% of the single-token
  inference FLOPs and 10% of the KV cache** of DeepSeek-V3.2 ([arXiv:2606.19348](https://arxiv.org/abs/2606.19348)) —
  the successor to the DSA line below.
- **DeepSeek Sparse Attention (DSA)** — a "lightning indexer" computes an index score
  `I_{t,s} = Σ_j w^I_{t,j} · ReLU(q^I_{t,j} · k^I_s)` (a small number of indexer heads, ReLU
  activation, runnable in FP8) and a fine-grained token-selection mechanism then keeps only
  the **top-2048** key-value entries per query. This cuts the *core* attention from O(L²) to
  O(Lk) (the indexer itself is still O(L²) but far cheaper). DSA is instantiated under
  **Multi-head Latent Attention (MLA)** in its MQA mode, and is added to **DeepSeek-V3.1-Terminus**
  (128K context) via continued pre-training — a short dense warm-up (1k steps, 2.1B tokens) to
  initialize the indexer against the dense attention distribution (KL loss), then a sparse
  training stage (15k steps, ~944B tokens). Result: near-parity with the dense V3.1-Terminus on
  short- and long-context tasks while sharply cutting inference cost. **DeepSeek-V3.2** —
  [arXiv:2512.02556](https://arxiv.org/abs/2512.02556). Precursor: **Native Sparse Attention
  (NSA)**, [arXiv:2502.11089](https://arxiv.org/abs/2502.11089) — three parallel branches
  (compressed coarse-grained tokens, selectively-retained fine-grained blocks, a local sliding
  window) combined by a learned gate, with hardware-aligned Triton kernels. Pretrained on a 27B-param
  MoE (3B active) over 270B tokens, NSA **matches or beats Full Attention on 7 of 9 general
  benchmarks** and reaches up to **9.0× forward / 6.0× backward / 11.6× decode** speedup at 64k
  context.
- **Linear-attention hybrids** push context to 1M+ at low KV cost: **Kimi Linear**
  ([arXiv:2510.26692](https://arxiv.org/abs/2510.26692); 3B active / 48B total, a layerwise
  hybrid of Kimi Delta Attention + MLA — KV-cache −75%, up to 6× decode throughput at 1M),
  **MiniMax-M1** (1M native context), **Qwen3-Next**. See
  [02 · Post-transformer architectures](../02-architectures-and-training/post-transformer-architectures.md).

## Test-time memory as a learned module
- **Titans** (Google) — a deep neural long-term memory module updated at inference by a
  *surprise* signal. Surprise combines **momentary surprise** (gradient of an associative
  memory loss ‖M(k_t) − v_t‖² w.r.t. the current token) with **past surprise** carried as a
  momentum term, plus an **adaptive forgetting gate** (data-dependent weight decay) so the
  module manages limited capacity over very long sequences. The paper presents three ways to
  wire it into a model: **Memory-as-Context (MAC)**, **Memory-as-Gate (MAG)**, and
  **Memory-as-Layer (MAL)**, alongside fixed **persistent-memory** tokens. Titans
  *effectively scales beyond a 2M-token context* in needle-in-a-haystack, outperforms
  Transformer++, Mamba/Mamba-2, GLA, DeltaNet and TTT on language modeling, and on the
  **BABILong** long-reasoning benchmark the MAC variant **beats much larger models including
  GPT-4** while using far fewer parameters. Ablations rank the contributions: **weight decay >
  momentum > convolution > persistent memory** (all positive).
  [arXiv:2501.00663](https://arxiv.org/abs/2501.00663)
- **Nested Learning / "Hope"** (Google, *"The Illusion of Deep Learning Architecture"*,
  NeurIPS 2025) — reframes a model and its optimizer as a system of **nested optimization
  problems** (associative memories updated at different frequencies). It introduces a
  **Continuum Memory System (CMS)** — a chain of MLP "memory" blocks updated at different time
  scales to resist catastrophic forgetting — and **Hope**, a *self-referential / self-modifying*
  Titans variant stacked with CMS that can generate its own update targets. A proof-of-concept
  optimizer, **Multi-scale Momentum Muon (M3)**, applies the same multi-frequency idea to the
  gradient memory. Hope reports gains over Titans, modern linear RNNs and Transformers on
  language modeling, RULER/BABILong long-context, class-incremental continual learning, and
  state-tracking tasks. [arXiv:2512.24695](https://arxiv.org/abs/2512.24695) ·
  [blog](https://research.google/blog/introducing-nested-learning-a-new-ml-paradigm-for-continual-learning/)

## Long context vs. long-term memory
- A dedicated benchmark exposes a *persistent-memory* gap: recall over a huge context is not
  the same as durable, evolving memory. *"Beyond a Million Tokens"*
  ([arXiv:2510.27246](https://arxiv.org/abs/2510.27246), ICLR 2026) introduces **BEAM** — 100
  coherent, topically diverse conversations of **100K–10M tokens** with **2,000 human-validated
  probing questions** spanning ten memory abilities (e.g. contradiction resolution, event
  ordering, knowledge update, multi-hop). Even LLMs with 1M-token windows (with and without
  RAG) degrade as dialogues lengthen, and *all* methods are weakest on **contradiction
  resolution** — an open problem. The paper's **LIGHT** framework (episodic memory + a short-term
  working-memory buffer + a salient-fact scratchpad) improves the strongest baselines by an
  average of **3.5%–12.69%**, depending on the backbone.
- **Agent memory systems** (Mem0, Letta) and graph-based memory architectures add a *write
  path* that evolves over time, distinguishing memory from retrieval. New benchmarks measure
  *forgetting* and *safety* — when memories should expire, cross-domain leakage, and
  memory-induced sycophancy — e.g. **PersistBench** ([arXiv:2602.01146](https://arxiv.org/abs/2602.01146))
  and **MemoryCD** ([arXiv:2603.25973](https://arxiv.org/abs/2603.25973)), not just recall. See
  [11 · RAG & memory systems](../11-emerging-application-subfields/rag-and-memory-systems.md).
- Agent memory can also be made **finer-grained**: aligning storage/retrieval/updating with an
  agent's *subtask* decomposition (rather than whole-episode instances) yields larger gains as
  interaction sequences lengthen — [arXiv:2602.21611](https://arxiv.org/abs/2602.21611).

## State of research

**Best-performing now:** Trainable sparse / linear-attention hybrids deliver cheap, reliable
million-token context and are deployed in production (DeepSeek-V3.2, Kimi Linear, MiniMax-M1).
For *durable* memory, retrieval + agent-memory systems are the working approach.

**Promising but unproven:** Learned test-time memory modules (Titans/Hope) and architectural
continual memory — strong on long-context efficiency and competitive on BABILong/RULER, but not
yet proven as true long-term memory at frontier scale.

**Open problems & weaknesses:** **Long context ≠ long-term memory** — models recall poorly
across very long inputs and forget across sessions, and BEAM shows even 1M-token models degrade
as histories grow. Contradiction resolution, knowing *when to forget*, avoiding stale or leaked
memory, and evaluating memory (vs. recall) are open. The long-context-vs-RAG trade-off is
unresolved.

## Connections
- The architectures enabling cheap long context → [02 · Architectures](../02-architectures-and-training/)
- Memory as a continual-learning problem → [04 · Continual learning](../04-reinforcement-learning-and-open-endedness/continual-learning-and-self-improvement.md)
