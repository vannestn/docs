# Nascent Research Directions

Genuinely *early-stage* ideas — some will become major fields, some will fade. Included
because "mapping the whole field" means capturing the edges, not just the center.

> **📦 How to read this** — these are lower-confidence, higher-variance directions. Each is
> real (has papers/labs behind it) but unproven at scale.

## Architecture & learning paradigms
- **Test-time training as continual learning** — models that keep updating their own weights
  *while running*. (See [02 · Post-transformer](../02-architectures-and-training/post-transformer-architectures.md).)
- **Energy-based / JEPA world models** — predicting in abstract representation space rather
  than generating tokens/pixels; LeCun's long-standing bet, now AMI Labs.
- **Nested learning** — reframing a model as many nested optimization loops with a "memory
  continuum." [arXiv:2512.24695](https://arxiv.org/abs/2512.24695)
- **Active inference / Free Energy Principle** — a Bayesian, brain-inspired alternative to
  deep RL (VERSES AI's "Genius"); a rare commercial non-LLM bet.

## Interpretability frontiers
- **Persona vectors** — linear "trait directions" (honesty, sycophancy) that may explain and
  control behavior.
- **Introspection** — whether models can accurately report their own internal states.
- **Model diffing** — comparing two models' internals to localize what changed.
  (All three: [11 · Interpretability frontiers](../11-emerging-application-subfields/interpretability-and-nascent-directions.md).)

## Reasoning & agents
- **Neurosymbolic / proof-carrying code** — neural generation with *symbolic* correctness
  guarantees attached. [arXiv:2504.12031](https://arxiv.org/abs/2504.12031)
- **Agent societies** — thousands of LLM agents as a computational social-science lab.
  [AgentSociety arXiv:2502.08691](https://arxiv.org/abs/2502.08691)
- **Self-improving / open-ended systems** — see [04](../04-reinforcement-learning-and-open-endedness/open-endedness-and-self-improvement.md).

## Hardware-adjacent
- **Spiking / neuromorphic LLMs**, **photonic** and **analog in-memory** computing — striking
  efficiency, pre-commercial. (See [07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md).)

## State of research

**Best-performing now:** Persona vectors and introspection have the most concrete early
results (real interpretability findings on frontier models). Test-time training has working
implementations.

**Promising but unproven:** JEPA/energy-based models, nested learning, neurosymbolic
guarantees, and active inference are conceptually compelling but lack frontier-scale wins.

**Open problems & weaknesses:** By definition these are early — small-scale, few labs, little
replication. The honest expectation is that **most will not become major fields**, but the
ones that do could be foundational. Track them; don't bet the farm on any single one.
