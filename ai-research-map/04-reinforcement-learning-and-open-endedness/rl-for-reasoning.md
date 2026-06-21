# RL for Reasoning

Reinforcement learning with verifiable rewards (RLVR) is the engine behind reasoning
models. It has matured into a science with its own open problems.

## Key directions & work

### The "expand vs. sharpen" dispute (the central question)
- **Sharpen camp:** RLVR boosts pass@1 but base models match or exceed at large pass@k —
  implying RL *concentrates probability* on reasoning paths already in the base
  distribution rather than discovering new ones. Tsinghua/LeapLab — [arXiv:2504.13837](https://arxiv.org/abs/2504.13837).
  Formalized as the **"invisible leash"** (RLVR can't sample outside base support). [arXiv:2507.14843](https://arxiv.org/pdf/2507.14843)
- **Expand camp:** NVIDIA's **ProRL** (prolonged RL with entropy/KL controls) reportedly
  *expands* solution diversity beyond the base model. [arXiv:2507.12507](https://arxiv.org/html/2507.12507v1)
  This dispute is unresolved and consequential for how far RL can push reasoning.

### Entropy collapse (the main scaling bottleneck)
- Policy entropy drops sharply early in RL; a fitted law ties performance to remaining
  entropy. **Clip-Cov / KL-Cov** interventions on high-covariance tokens delay collapse.
  Shanghai AI Lab/Tsinghua — [arXiv:2505.22617](https://arxiv.org/abs/2505.22617)

### Rewards without verifiers
- **RLIF / Intuitor** (Berkeley) — uses the model's own *self-certainty* as the sole
  reward, matching GRPO on math and generalizing better OOD. [arXiv:2505.19590](https://arxiv.org/abs/2505.19590)

### Agentic RL: credit assignment & environments
- Credit assignment is being recast as *the* defining problem of agentic RL (~47 methods
  catalogued). [Survey](https://arxiv.org/html/2604.09459v1) *[2026 ID — verify]*. Methods:
  hindsight credit assignment (HCAPO), implicit step rewards (iStar, [arXiv:2509.19199](https://arxiv.org/pdf/2509.19199)).
- **Environments at scale, by backtranslation:** R2E-Gym turns commits into 8k+ executable
  tasks; DeepSWE trained on ~4,500 of them to open SOTA. [Together AI](https://www.together.ai/blog/deepswe).
  **Endless Terminals** scales auto-generated CLI environments. [arXiv:2601.16443](https://arxiv.org/pdf/2601.16443)

## State of research

**Best-performing now:** GRPO-lineage RLVR with entropy controls and verifiable rewards is
the proven, deployed recipe. Backtranslated executable environments are the best way to
mass-produce agentic training signal.

**Promising but unproven:** Reward-free RL (self-certainty), prolonged RL as a true
capability-*expander*, and dense process/credit-assignment rewards for long-horizon agents.

**Open problems & weaknesses:** The **expand-vs-sharpen** question is genuinely open — it
bounds how much reasoning RL can ultimately deliver. **Reward hacking** is now treated as a
structural property of proxy optimization at scale. RL is sample-inefficient and unstable
(entropy collapse), exploration in language space is poorly understood, and much progress
is recipe-tuning rather than theory.
