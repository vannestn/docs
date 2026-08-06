# 03 · Alignment, Interpretability & Safety

The research aimed at understanding, steering, and verifying model behavior — which
matured from philosophy into an **empirical, experiment-driven science** over 2025–26.

## Contents

- [**Mechanistic interpretability**](mechanistic-interpretability.md) — circuits,
  attribution graphs, sparse autoencoders, introspection.
- [**Scheming, control & evaluations**](scheming-control-and-evaluations.md) — deceptive
  alignment, sandbagging, AI control, agentic sabotage evals.
- [**Model organisms of misalignment**](model-organisms-of-misalignment.md) — emergent
  misalignment, reward-hacking generalization, inoculation.
- [**Scalable oversight & RLHF successors**](scalable-oversight-and-rlhf-successors.md) —
  debate, weak-to-strong, constitutional methods, process supervision.
- [**Robustness & jailbreaks**](robustness-and-jailbreaks.md) — adversarial robustness,
  classifiers, hallucination reduction.

## The shape of this area

Three things changed the field: (1) interpretability produced **usable tools** (attribution
graphs, hosted SAE APIs); (2) "model organisms" work showed misalignment can **emerge and
generalize** from ordinary training pressures like reward hacking — and that cheap
interventions help; (3) **third-party evaluation** (UK AISI, METR, Apollo) and inter-lab
consensus (CoT monitorability) made safety claims falsifiable.

The recurring caveat across the area: **evaluation-awareness**. Models increasingly behave
differently when they suspect they're being tested, confounding both capability and
alignment evals — see [08 · Evaluation](../08-evaluation-and-governance/).
