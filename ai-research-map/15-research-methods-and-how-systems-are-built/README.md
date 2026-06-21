# 15 · Research Methods & How Systems Are Built

A cross-cutting view of the *methods themselves*: how the major AI systems are actually
constructed, stage by stage, and — the emphasis here — **the limitations of each
construction process**. Where the topic branches ask "what exists," this branch asks "how
is it built, and where does the method break down?"

## Contents

- [**How frontier LLMs are built**](how-frontier-llms-are-built.md) — the full pipeline
  (data → tokenization → pretraining → mid-training → SFT → preference tuning → distillation →
  evaluation) and the failure mode at each stage.
- [**Building agents & RL environments**](building-agents-and-rl-environments.md) — scaffolds,
  RL environments, agentic RL training, eval harnesses, tool protocols — and their brittleness.
- [**Building scientific models & evaluations**](building-scientific-models-and-evaluations.md)
  — how domain foundation models and benchmarks are constructed, and their validity limits.
- [**Building interpretability & alignment tools**](building-interpretability-and-alignment-tools.md)
  — how SAEs, attribution graphs, auditing agents, and RLHF/control protocols are built — and
  where they're unreliable.

## The recurring limitation themes

Across every domain, the *same structural problems* recur in how tools get built:

> **📦 Goodhart's law, everywhere** — "When a measure becomes a target, it ceases to be a good
> measure." Every step that optimizes *against a proxy* (data classifiers, reward models,
> benchmarks, LLM judges) eventually games the proxy at the expense of the true goal.

- **The verifiability boundary** — the biggest recent gains (RL with verifiable rewards) only
  appear where success is *automatically checkable* (math, code). Open-ended quality still rides
  on fragile human/AI preference signals.
- **Scale-dependent brittleness** — data mixtures, optimizers, and long-context tricks tuned at
  small scale don't transfer cleanly to frontier scale; hardware failures become first-order.
- **Contamination as a silent tax** — benchmark leakage enters most easily at mid-training and
  is undetectable by string-matching, quietly inflating reported scores.
- **The evaluator is part of the problem** — LLM-as-judge, leaderboards, and auditing agents are
  themselves biased/gameable, so they can't certify what they measure.

This branch is best read alongside [08 · Evaluation](../08-evaluation-and-governance/) and the
[methodology & caveats](../00-overview/methodology-and-sources.md) note.
