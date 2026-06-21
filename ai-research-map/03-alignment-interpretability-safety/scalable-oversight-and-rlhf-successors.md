# Scalable Oversight & RLHF Successors

How to supervise models on tasks where humans struggle to judge correctness — and the
evolution of preference-tuning beyond vanilla RLHF.

## Key directions & work

### Scalable oversight
- **MONA** (DeepMind) — myopic optimization + non-myopic approval prevents multi-step
  reward hacking even *without detecting* the hack (doesn't fix single-step hacking).
  [arXiv:2501.13011](https://arxiv.org/abs/2501.13011)
- **Debate helps weak-to-strong generalization** — debate lets a weak judge extract
  trustworthy info from a stronger untrustworthy model; most effective with diverse
  debaters. [arXiv:2501.13124](https://arxiv.org/abs/2501.13124)

### RLHF successors
- **Constitutional / RLAIF** methods and **process supervision** (reward the reasoning
  steps, not just the answer) are now standard ingredients. The verifiable-reward (RLVR)
  lineage is covered in [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md).
- **Behaviorally-calibrated RL** reduces hallucination by teaching *abstention* — a 4B
  model reportedly beat GPT-5 on an accuracy-to-hallucination ratio for math by
  incentivizing uncertainty-admission. [arXiv:2512.19920](https://arxiv.org/abs/2512.19920)

## State of research

**Best-performing now:** Constitutional/RLAIF + process supervision are the proven,
deployed backbone of frontier post-training. Debate and MONA are the most concrete
scalable-oversight mechanisms with empirical support.

**Promising but unproven:** Weak-to-strong generalization and debate work in toy/medium
settings; whether they scale to *genuinely superhuman* tasks (the whole point) is untested.
Behaviorally-calibrated abstention is a promising hallucination lever.

**Open problems & weaknesses:** The core problem — reliably supervising systems that
exceed human judgment on a task — **remains unsolved**. Reward models are gameable; process
supervision is expensive to label. Most results assume the overseer is honest and the gap
is modest. This is arguably the central unsolved problem standing between current methods
and safe superhuman systems.
