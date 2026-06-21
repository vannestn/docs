# Continual Learning & Self-Improvement

Learning new things over time without forgetting old ones — and the "era of experience"
framing where agents learn primarily from their own interaction rather than static data.

## Key directions & work

- **Experience replay + Transformers eliminates plasticity loss** via in-context learning —
  a mechanistic 2025/26 result reframing why continual learning fails. [arXiv:2503.20018](https://arxiv.org/abs/2503.20018)
- **Test-time training as continual learning** — *"End-to-End Test-Time Training for Long
  Context"* claims TTT scaling with context length like full attention. [arXiv:2512.23675](https://arxiv.org/abs/2512.23675)
- **Nested Learning / "Hope"** — continuum memory system reframing continual learning as
  nested optimization. [arXiv:2512.24695](https://arxiv.org/abs/2512.24695) (see also
  [02 · Post-transformer](../02-architectures-and-training/post-transformer-architectures.md))
- **"Welcome to the Era of Experience"** (Silver & Sutton) — manifesto for agents learning
  from streams of experience rather than human data. [paper](https://storage.googleapis.com/deepmind-media/Era-of-Experience%20/The%20Era%20of%20Experience%20Paper.pdf).
  Anchored by **DreamerV3** (one hyperparameter set, Minecraft-diamond from scratch).

## State of research

**Best-performing now:** For practical "memory," retrieval + agent-memory systems and
test-time-training layers (Titans-style) are the working approaches. Replay remains the
most reliable anti-forgetting tool.

**Promising but unproven:** Architectural continual learning (nested-learning continuum
memory), the "era of experience" RL framing, and in-context-learning-as-plasticity. These
are conceptually exciting but early.

**Open problems & weaknesses:** **Catastrophic forgetting and plasticity loss are not
solved** — they're mitigated. There's no widely-adopted method for a deployed model to
durably learn from its own experience without retraining or risking collapse. Benchmarks
for *lifelong* learning (and for when memories should be *forgotten*) are immature. This
is the bottleneck under "self-improving" claims in
[open-endedness](open-endedness-and-self-improvement.md).
