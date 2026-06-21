# Post-Transformer Architectures

Alternatives and complements to full softmax attention, aimed at sub-quadratic cost,
longer context, and better memory.

## Key directions & work

### State-space models & the SSM/attention duality
- **Mamba-2 / State Space Duality (SSD)** — established that transformers and SSMs are
  *dual*, giving the theoretical backbone for the hybrid wave; the core layer is 2–8×
  faster than Mamba-1. Princeton/CMU (Tri Dao, Albert Gu) — [arXiv:2405.21060](https://arxiv.org/abs/2405.21060)

### Linear-attention hybrids (the production winner)
The dominant practical recipe interleaves a few full-attention layers with many
linear/gated layers (~1:3 to 1:7), plus MoE:
- **Kimi Linear** (Moonshot) — Kimi Delta Attention (gated DeltaNet variant) 3:1 with full
  attention; KV-cache −75%, up to 6× decode throughput at 1M context. [arXiv:2510.26692](https://arxiv.org/abs/2510.26692)
- **MiniMax-M1** — first open-weight large reasoning model on lightning (linear) attention;
  1M native context, 1:7 softmax:linear. [arXiv:2506.13585](https://arxiv.org/abs/2506.13585)
- **Qwen3-Next** — Gated DeltaNet + gated attention 3:1 + ultra-sparse MoE; ~1/10 compute,
  ~10× throughput vs comparable dense. [Qwen](https://arxiv.org/abs/2505.09388)
- **Hunyuan-TurboS** (Tencent) — first industry-deployed ultra-large hybrid
  Transformer-Mamba MoE (560B/56B). [arXiv:2505.15431](https://arxiv.org/abs/2505.15431)
- **Falcon-H1** (TII) — *parallel* (not interleaved) Mamba+attention; sub-34B beats
  70B-class. [arXiv:2507.22448](https://arxiv.org/abs/2507.22448)

### RNN revival
- **RWKV-7 "Goose"** — linear-time, constant-memory RNN, no KV-cache; RWKV-8 "ROSA"
  (neurosymbolic suffix automaton) in development. [RWKV-X arXiv:2504.21463](https://arxiv.org/abs/2504.21463)

### Test-time-training memory layers
- **Titans** — neural long-term memory updated by a *surprise* signal at inference;
  outperforms Mamba-2/TTT on long context. [arXiv:2501.00663](https://arxiv.org/abs/2501.00663)
- **Nested Learning / "Hope"** — models as nested optimization with a continuum memory
  system. [arXiv:2512.24695](https://arxiv.org/abs/2512.24695)
- A 2026 result argues a broad class of TTT layers is **secretly linear attention** ("KV
  binding"), enabling parallel formulations and weight inheritance. [arXiv:2602.21204](https://arxiv.org/abs/2602.21204) *[2026 ID — verify]*

## State of research

**Best-performing now:** *Hybrid* architectures — a small fraction of full-attention
layers + many linear/gated layers + MoE — are the proven recipe, shipping in production
Chinese frontier models. They deliver most of attention's quality at a fraction of the
long-context KV cost.

**Promising but unproven:** Pure sub-quadratic models (RWKV-7, pure SSMs) and
test-time-training memory layers (Titans/Hope) show strong long-context efficiency but
have *not* displaced attention at the absolute quality frontier. The "TTT ≈ linear
attention" unification is fresh and could either simplify or deflate the area.

**Open problems & weaknesses:** Pure linear/SSM models still lag on exact recall and
some in-context-learning tasks (the reason hybrids keep *some* full attention). Hardware
kernels, training stability at scale, and theoretical understanding of what gated states
can and cannot represent remain active. No clean win over attention on quality-per-FLOP at
frontier scale yet — efficiency, not capability, is the driver.
