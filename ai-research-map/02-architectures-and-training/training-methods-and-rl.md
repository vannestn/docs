# Training Methods & RL

How models are optimized — optimizers, RL recipes, self-improvement, and the synthetic-
data pipelines that increasingly feed them.

## Key directions & work

### Optimizers
- **Muon** (orthogonalized momentum) — a practical drop-in successor to AdamW at scale;
  primary optimizer for Moonshot's >1T-param Kimi K2 (via MuonClip / QK-clip for
  stability), with muP hyperparameter transfer shown compatible up to 3.7B.
  [Muon efficiency arXiv:2505.02222](https://arxiv.org/abs/2505.02222) ·
  [Muon scalable arXiv:2502.16982](https://arxiv.org/abs/2502.16982)

### RL for LLMs
- **GRPO** (group-relative advantages, no value critic) is the dominant RL-for-reasoning
  recipe; **GSPO** (sequence-level IS/KL) and **CISPO** refine it. The deeper science —
  entropy collapse, the "does RL expand reasoning?" dispute, credit assignment — lives in
  [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md).

### Self-improvement & synthetic data
- A 2026 result argues **self-play only improves** when the synthetic-data pipeline
  guarantees increasing *learnable information gain*; otherwise gains come from reward
  hacking/memorization and self-generated pretraining risks **model collapse**. [arXiv:2603.02218](https://arxiv.org/abs/2603.02218) *[2026 ID — verify]*
- Synthetic & recycled data (e.g., Meta's REWIRE) is now a core data-wall mitigation —
  see [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).

## State of research

**Best-performing now:** AdamW remains the safe default, but **Muon** has the strongest
evidence yet of a real successor (trillion-token production use). GRPO-lineage RLVR is the
proven reasoning-training recipe.

**Promising but unproven:** Second-order/orthogonalization optimizers beyond Muon,
self-rewarding and self-adapting training (SEAL, Absolute Zero), and large-scale synthetic
data as a primary source rather than a supplement.

**Open problems & weaknesses:** **Model collapse** and reward hacking bound how far
self-generated data can go. Optimizer choices interact subtly with scale/precision and are
under-theorized. RL training is sample-inefficient and unstable (entropy collapse), and
much of the best work is empirical recipe-tuning rather than principled theory.
