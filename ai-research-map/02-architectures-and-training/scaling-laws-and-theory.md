# Scaling Laws & Theory

The quantitative and theoretical understanding of *why* deep learning works and how
performance scales with compute, data, and parameters.

## Key directions & work

### Empirical scaling & efficiency trends
- **Epoch AI trends** — frontier training compute growing ~5×/year (doubling ~5.2 months);
  algorithmic/pretraining efficiency ~3×/year (doubling ~7.6 months); inference cost at
  fixed performance halving ~every 2 months. [Epoch](https://epoch.ai/trends) (see also
  [08 · Economics & forecasting](../08-evaluation-and-governance/economics-and-forecasting.md))
- **Distillation Scaling Laws** (Apple) — closed-form student-performance prediction.
  [arXiv:2502.08606](https://arxiv.org/abs/2502.08606)

### Theory of generalization
- A 2026 paper claims to prove generalization persists in the full **feature-learning**
  regime (not just kernel/NTK), unifying benign overfitting, double descent, implicit
  bias, and **grokking** — and offers an objective that accelerates grokking ~5× while
  suppressing memorization. *"A Theory of Generalization in Deep Learning"* —
  [arXiv:2605.01172](https://arxiv.org/abs/2605.01172) *[2026 ID — verify]*

## State of research

**Best-performing now:** Empirical scaling/efficiency laws (Epoch, Chinchilla-lineage) are
reliable enough to guide multi-hundred-million-dollar training decisions and compute-
governance thresholds. Distillation laws give actionable teacher/student trade-offs.

**Promising but unproven:** A unified theory of feature-learning generalization is an
active, exciting target but not yet consensus. Scaling laws for *reasoning* (RL/test-time
compute) and for non-transformer architectures are still being mapped.

**Open problems & weaknesses:** Theory lags practice badly — most frontier progress is
empirical. Scaling laws describe loss, not *capabilities* (emergence remains poorly
predicted). The "data wall" introduces a regime (repeated/synthetic data) where classic
laws may not hold. Whether inference-time scaling has its own clean law is open.
