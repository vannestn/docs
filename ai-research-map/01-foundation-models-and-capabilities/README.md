# 01 · Foundation Models & Core Capabilities

The capabilities that define what frontier models can *do* — and the research programs
pushing each one. This branch covers the "headline" axes of progress.

## Contents

- [**Reasoning & test-time compute**](reasoning-and-test-time-compute.md) — RL with
  verifiable rewards, process reward models, parallel-hypothesis search, the inference-
  time scaling paradigm.
- [**Agents & tool use**](agents-and-tool-use.md) — computer use, long-horizon autonomy,
  multi-agent orchestration, agentic coding, context management.
- [**Multimodal & omni models**](multimodal-and-omni.md) — any-to-any architectures,
  native multimodality, streaming speech, unified understanding+generation.
- [**Long context & memory**](long-context-and-memory.md) — million-token contexts,
  trainable sparse attention, the long-context-vs-long-term-memory distinction.

## The shape of this area in mid-2026

The defining move is **from scaling parameters to scaling inference-time compute**.
Reasoning models trained with RL on verifiable rewards are the frontier default, and the
capability frontier is now measured less by knowledge benchmarks (saturating) than by
**agentic** benchmarks: autonomous coding (SWE-bench and successors), computer use
(OSWorld), and long-horizon task completion (METR time-horizons).

Cross-cutting threads tie this branch to the rest of the map:
- The RL machinery behind reasoning is its own science → [04 · RL & Open-Endedness](../04-reinforcement-learning-and-open-endedness/)
- The architectures enabling long context → [02 · Architectures](../02-architectures-and-training/)
- How these capabilities are measured (and saturate) → [08 · Evaluation](../08-evaluation-and-governance/)
