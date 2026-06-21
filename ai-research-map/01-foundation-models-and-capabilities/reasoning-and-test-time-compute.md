# Reasoning & Test-Time Compute

The single biggest shift in frontier AI since 2024: spending more compute *at inference*
("thinking" before answering) rather than only scaling parameters. This is now the
dominant frontier paradigm.

## Why it matters

Test-time compute can be more effective per FLOP than parameter scaling when allocated
well (verifier search + adaptive response distributions) — the foundational result from
Google DeepMind / UC Berkeley, *"Scaling LLM Test-Time Compute Optimally can be More
Effective than Scaling Model Parameters"* ([arXiv:2408.03314](https://arxiv.org/abs/2408.03314)).
This reframed reasoning as a *training-time + inference-time* co-design problem.

## Key directions & work

### RL with verifiable rewards (RLVR) — the core recipe
- **DeepSeek-R1** showed chain-of-thought reasoning and emergent "aha moments" arise from
  *pure RL* (GRPO) on a base model, with no human reasoning traces. AIME 2024 pass@1 rose
  15.6% → 71.0% (86.7% with majority voting). Peer-reviewed in **Nature** (first LLM on a
  Nature cover). DeepSeek-AI — [arXiv:2501.12948](https://arxiv.org/abs/2501.12948) ·
  [Nature](https://www.nature.com/articles/s41586-025-09422-z)
- **GRPO** (Group Relative Policy Optimization) — replaces PPO's value critic with
  group-relative advantages — became the default RL-for-reasoning algorithm. Successors
  refine it: **GSPO** (Qwen) lifts importance sampling/KL to the sequence level to cut
  gradient variance and fix GRPO's length bias; **CISPO** (MiniMax) and **Clip-Cov/KL-Cov**
  (entropy-collapse mitigations) are part of the same lineage. See
  [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md)
  for the deeper science (including the live "does RL expand or just sharpen reasoning?"
  dispute).

### Process reward models & verifiers
- **GenPRM** — generative process reward models that "think" (CoT + code verification)
  beat much larger scalar PRMs; a 1.5B GenPRM outperforms GPT-4o on ProcessBench via
  test-time scaling. [arXiv:2504.00891](https://arxiv.org/abs/2504.00891)

### Deployed reasoning systems
- **OpenAI o3 / o4-mini** — agentically combine all tools *within* the chain of thought
  ("think with images," call web/Python/files mid-reasoning). o4-mini hit 92.7% AIME 2025.
  [OpenAI](https://openai.com/index/introducing-o3-and-o4-mini/)
- **GPT-5** — ships as a unified system with a **router** that chooses between fast and
  "thinking" variants, trained on user-switch signals, preference, and measured
  correctness. [GPT-5 System Card](https://openai.com/index/gpt-5-system-card/)
- **Gemini 2.5 "Deep Think"** — parallel-hypothesis reasoning (consider multiple
  hypotheses before answering). Google DeepMind —
  [Model Card](https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Deep-Think-Model-Card.pdf)
- **Gemini 3 Pro** — reasoning-first; reports 37.5% on Humanity's Last Exam (no tools),
  31.1% on ARC-AGI-2 (vs Gemini 2.5 Pro's 4.9%). [Google](https://blog.google/products-and-platforms/products/gemini/gemini-3/)
- **Magistral** (Mistral) — open reasoning model via RL on verifiable rewards, *no
  distillation*; 73.6% AIME 2024. [arXiv:2506.10910](https://arxiv.org/abs/2506.10910)
- **Grok 4 / Grok-4-Fast** (xAI) — end-to-end tool-use RL, 2M-token context, 92.0% AIME
  2025 (no tools). [xAI](https://x.ai/news/grok-4)
- **DeepSeek-V3.2** reports gold-medal-level results on IMO/CMO/ICPC 2025 via a scalable
  RL framework + native "thinking in tool-use." [arXiv:2512.02556](https://arxiv.org/abs/2512.02556)

## State of research

**Best-performing now:** RL on verifiable rewards (RLVR/GRPO-lineage) is the proven recipe for
math/code reasoning, deployed across every frontier lab; unified fast/thinking routers (GPT-5) and
parallel-hypothesis search (Deep Think) are shipped.

**Promising but unproven:** reasoning *transfer* to open-ended/non-verifiable domains; generative
process reward models at scale; reliable self-verification.

**Open problems & tensions:**
- **Does RLVR create new reasoning ability or only surface what the base model already
  contains?** Active empirical dispute (the pass@k "ceiling" critique vs. NVIDIA's ProRL).
  See [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md).
- **Policy-entropy collapse** is the main barrier to scaling RL compute for reasoning.
- **CoT monitorability** — keeping the chain of thought faithful and legible — is now
  treated as a fragile safety asset. See
  [03 · Scheming & control](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md).
