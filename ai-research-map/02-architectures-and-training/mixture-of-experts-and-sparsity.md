# Mixture-of-Experts & Sparsity

Activating only a fraction of parameters per token — the dominant way to scale capacity
without proportional compute. Now near-universal at the frontier.

## Key directions & work

### Ultra-sparse MoE
- **Qwen3 MoE** — 235B total / 22B active, 128 experts (8 active); dropped shared experts
  and adopted a *global-batch load-balancing loss* to encourage specialization, ~36T
  tokens, 119 languages. [arXiv:2505.09388](https://arxiv.org/abs/2505.09388)
- **Qwen3-Next** — pushes sparsity further (80B total / 3B active, 11 of 512 experts) plus
  multi-token prediction. (See [post-transformer](post-transformer-architectures.md).)
- **Kimi K2** (Moonshot) — 1T total / 32B active, trained with MuonClip at trillion-token
  scale with zero loss spikes. [arXiv:2507.20534](https://arxiv.org/abs/2507.20534)
- **ERNIE 4.5** (Baidu) — *heterogeneous-modality* MoE splitting experts into
  text/vision/shared types with modality-specific routing. [Baidu](https://ernie.baidu.com/blog/posts/ernie4.5/)

### Trainable sparse attention (sparsity in the attention map)
- **Native Sparse Attention (NSA)** → **DeepSeek Sparse Attention (DSA)** — hardware-
  aligned, end-to-end trainable sparse attention: a "lightning indexer" + top-k token
  selection cuts long-context attention to ~linear with near-identical quality. DeepSeek —
  [NSA arXiv:2502.11089](https://arxiv.org/abs/2502.11089) · [V3.2 arXiv:2512.02556](https://arxiv.org/abs/2512.02556)
- **Multi-Matrix Factorization Attention (MFA)** + Attention-FFN Disaggregation (StepFun
  Step-3) — co-design splitting attention and FFN onto separate GPU pools. [arXiv:2507.19427](https://arxiv.org/abs/2507.19427)

## State of research

**Best-performing now:** Ultra-sparse MoE with global-batch load balancing is the proven
frontier default — it's how essentially every leading open model scales. Trainable sparse
attention (DSA) is the most convincing recent win for cheap long context.

**Promising but unproven:** Extreme sparsity ratios (few-of-hundreds experts) and
modality-specialized experts are pushing the envelope; their robustness and
generalization across domains is still being established.

**Open problems & weaknesses:** Routing instability, expert collapse/under-utilization,
and load imbalance remain perennial. MoE complicates inference (memory footprint of all
experts, expert-parallel communication) and fault tolerance at 100k-GPU scale. Whether
sparse attention's token selection ever loses information that matters for hard reasoning
is not fully characterized.
