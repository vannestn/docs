# Reasoning & Test-Time Compute

The single biggest shift in frontier AI since 2024: spending more compute *at inference*
("thinking" before answering) rather than only scaling parameters. This is now the
dominant frontier paradigm.

## Why it matters

Test-time compute can be more effective per FLOP than parameter scaling when allocated
well (verifier search + adaptive response distributions) — the foundational result from
UC Berkeley / Google DeepMind, *"Scaling LLM Test-Time Compute Optimally can be More
Effective than Scaling Model Parameters"* ([arXiv:2408.03314](https://arxiv.org/abs/2408.03314)).
This reframed reasoning as a *training-time + inference-time* co-design problem.

**What the paper actually shows** (Snell, Lee, Xu, Kumar; PaLM 2-S\* on MATH 500): two
knobs for scaling inference — (1) *searching* against a dense process verifier (PRM), and
(2) iteratively *revising* the model's own answers (modifying the proposal distribution).
The efficacy of each depends on prompt difficulty, so they fit a **compute-optimal**
policy that picks the strategy per-prompt using a *model-predicted difficulty* bin (the
model's own pass@1 over 2048 samples, binned into 5 levels — no oracle label needed). Two
headline results, both qualified:
- Compute-optimal allocation matches best-of-N search/revision baselines with **~4× less**
  test-time compute.
- In a FLOPs-matched comparison against a **~14× larger** pretrained model (no extra
  inference), test-time compute wins on **easy/medium** prompts — but on the **hardest**
  prompts, scaling pretraining is still more effective; the two are *not* 1-to-1
  exchangeable. (⚠️ this nuance — "test-time compute is not a substitute for pretraining on
  hard problems" — is often dropped when this result is cited.)
- On search: beam search helps most at *low* budgets and on *harder* questions; at high
  budgets it can *underperform* best-of-N by over-optimizing (exploiting) the PRM, and the
  most powerful method tried (lookahead/MCTS-style search) underperforms the most due to
  its extra rollout cost. Capability-specific finetuning was required to induce the
  revision/verification abilities in the base model.

## Key directions & work

### RL with verifiable rewards (RLVR) — the core recipe
- **DeepSeek-R1** showed chain-of-thought reasoning and emergent "aha moments" arise from
  *pure RL* (GRPO) on a base model (DeepSeek-V3-Base), with **no SFT and no human reasoning
  traces** (the R1-Zero variant). On AIME 2024, R1-Zero pass@1 rose **15.6% → 77.9%** over
  training (**86.7%** with self-consistency/majority voting @16); the final **DeepSeek-R1**
  (multi-stage: cold-start CoT → RL → rejection sampling + SFT → RL) hits **79.8%** AIME
  2024 and 97.3% MATH-500. Reward is purely **rule-based** (accuracy + format) — the authors
  deliberately **avoid neural PRM/ORM reward models** to prevent reward hacking at scale.
  Author-stated limits: poor readability/language-mixing in R1-Zero, no tool use, prompt
  sensitivity (few-shot *degrades* it), and weak software-engineering gains (RL too slow to
  apply at scale there). Peer-reviewed in **Nature** (Vol. 645, 18 Sept 2025) — first major
  open-weight LLM published after independent peer review, on the cover. DeepSeek-AI —
  [arXiv:2501.12948](https://arxiv.org/abs/2501.12948) ·
  [Nature](https://www.nature.com/articles/s41586-025-09422-z)
- **GRPO** (Group Relative Policy Optimization) — replaces PPO's value critic with
  group-relative advantages (normalize each sampled group's rewards to an advantage) —
  became the default RL-for-reasoning algorithm. Successors
  refine it: **GSPO** (Qwen) lifts importance sampling/KL to the sequence level to cut
  gradient variance and fix GRPO's length bias; **CISPO** (MiniMax) and **Clip-Cov/KL-Cov**
  (entropy-collapse mitigations) are part of the same lineage. Magistral and DeepSeek-V3.2
  (below) add their own GRPO modifications — Clip-Higher, KL removal, loss normalization,
  off-policy sequence masking — showing the algorithm is still being actively re-engineered
  for stable RL scaling. See
  [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md)
  for the deeper science (including the live "does RL expand or just sharpen reasoning?"
  dispute).

### Process reward models & verifiers
- **GenPRM** — reframes the process reward model as a *generative* task: instead of a scalar
  value head, it emits an explicit CoT rationale **plus executable code verification** for
  each reasoning step, then judges Yes/No (Eqs. 4–5). Trained on only **23K** synthesized
  examples from MATH (via Relative Progress Estimation + consensus filtering). Because the
  verifier itself reasons, its accuracy *scales with its own test-time compute* (majority-vote
  over N verification paths). Results on ProcessBench (F1): a **1.5B** GenPRM (Maj@8)
  outperforms **GPT-4o** (61.9 → 63.4), and a **7B** GenPRM (Maj@8, 80.5) surpasses the
  **Qwen2.5-Math-PRM-72B** (78.3) it's ~10× smaller than. As a *critic* for iterative
  refinement it beats Self-Refine and DeepSeek-R1-Distill-7B, giving **3.4×** larger gains
  over 3 refinement turns. Gains from verifier TTS are larger on *harder* problems.
  [arXiv:2504.00891](https://arxiv.org/abs/2504.00891)

### Deployed reasoning systems
- **OpenAI o3 / o4-mini** — agentically combine all tools *within* the chain of thought
  ("think with images," call web/Python/files mid-reasoning). o4-mini scores **92.7%** AIME
  2025 no-tools, but **99.5%** *with* a Python interpreter — the latter is the more direct
  demonstration of tools-in-the-loop reasoning.
  [OpenAI](https://openai.com/index/introducing-o3-and-o4-mini/)
- **GPT-5** — ships as a unified system with a real-time **router** that chooses between a
  fast model and a deeper "thinking" model (and mini fallbacks) based on conversation type,
  complexity, tool needs, and explicit intent; the router is **continuously trained** on
  user model-switch signals, response preference rates, and measured correctness.
  [GPT-5 System Card](https://openai.com/index/gpt-5-system-card/)
- **Gemini 2.5 "Deep Think"** — parallel-hypothesis reasoning (consider multiple
  hypotheses before answering). Google DeepMind —
  [Model Card](https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Deep-Think-Model-Card.pdf)
- **Gemini 3 Pro** — reasoning-first; reports 37.5% on Humanity's Last Exam (no tools),
  31.1% on ARC-AGI-2 (vs Gemini 2.5 Pro's 4.9%; 45.1% with Deep Think). [Google](https://blog.google/products-and-platforms/products/gemini/gemini-3/)
- **Magistral** (Mistral) — Mistral's first reasoning model, built ground-up with their own
  scalable RLVR/GRPO stack. **Magistral Medium** is trained by **pure RL on Mistral Medium 3,
  no distillation / no cold-start reasoning traces** — yielding a ~50% AIME'24 boost to
  **73.6% pass@1 (90.0% maj@64)**. The open-weight **Magistral Small (24B, Apache 2.0)** adds
  cold-start SFT from Medium traces, then RL. Notable finding (⚠️ *contra* DeepSeek-R1): RL
  *can* substantially beat the distillation-SFT baseline even for a small model (SFT+RL >
  SFT or RL alone). RL on text-only data preserved/improved multimodal, instruction-following
  and tool-calling ability. [arXiv:2506.10910](https://arxiv.org/abs/2506.10910)
- **Grok 4 / Grok 4 Fast** (xAI) — end-to-end tool-use RL (code interpreter + web/X search
  in the reasoning loop). **Grok 4** scores **91.7%** AIME 2025 (no tools) and has a **256K**
  context; the **2M-token** context belongs to the separate **Grok 4 Fast** variant (which
  also unifies reasoning/non-reasoning modes and cuts ~40% of thinking tokens).
  [Grok 4](https://x.ai/news/grok-4) · [Grok 4 Fast](https://x.ai/news/grok-4-fast)
- **DeepSeek-V3.2** — pairs **DeepSeek Sparse Attention (DSA)**, which drops core-attention
  cost from O(L²) to O(Lk) via a lightning indexer + top-k token selection, with a scalable
  GRPO-based RL framework and a **"thinking in tool-use"** retention mechanism (keep CoT
  across tool calls; discard only on a new *user* message). Base V3.2 is on par with GPT-5;
  the high-compute variant **DeepSeek-V3.2-Speciale** (RL on reasoning data only, reduced
  length penalty, + DeepSeekMath-V2 proof data) is the one that **surpasses GPT-5, is on par
  with Gemini-3.0-Pro, and reports gold-medal performance in IMO 2025, CMO 2025, IOI 2025,
  and ICPC World Final 2025**. [arXiv:2512.02556](https://arxiv.org/abs/2512.02556)

## State of research

**Best-performing now:** RL on verifiable rewards (RLVR/GRPO-lineage) is the proven recipe for
math/code reasoning, deployed across every frontier lab; unified fast/thinking routers (GPT-5) and
parallel-hypothesis search (Deep Think) are shipped.

**Promising but unproven:** reasoning *transfer* to open-ended/non-verifiable domains; generative
process reward models at scale (GenPRM shows small generative verifiers beating 10×-larger scalar
PRMs and GPT-4o on ProcessBench, but only on math so far); reliable self-verification.

**Open problems & tensions:**
- **Does RLVR create new reasoning ability or only surface what the base model already
  contains?** Active empirical dispute (the pass@k "ceiling" critique vs. NVIDIA's ProRL).
  Note the Magistral result (pure RL beating distillation-SFT even on a small model) is
  evidence *against* the "RL only sharpens" view, directly contradicting DeepSeek-R1's
  observation that small models need distillation. See
  [04 · RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md).
- **Policy-entropy collapse** is the main barrier to scaling RL compute for reasoning — the
  reason Magistral adopts Clip-Higher and removes the KL penalty, and DeepSeek-V3.2 adds
  off-policy sequence masking and an unbiased KL estimate. These are stability hacks, not a
  principled solution.
- **Test-time compute is not a free substitute for pretraining.** 2408.03314 finds it loses
  to a larger model on the *hardest* prompts, and the gains assume the base model already
  has the underlying knowledge. The win is on easy/medium problems and at modest budgets.
- **Verifiers can be over-optimized.** Both 2408.03314 (beam/lookahead search exploiting the
  PRM at high budgets) and DeepSeek-R1 (refusing neural reward models to avoid reward
  hacking) flag that scaling search/verification *too* hard degrades results. Generative
  PRMs (GenPRM) are a promising but still-young answer.
- **Reasoning transfer to non-verifiable domains.** RLVR's reward depends on a rule-based
  checker; DeepSeek-R1 explicitly names "tasks that cannot be evaluated by a reliable
  reward model" (e.g. open-ended writing) as the open frontier, falling back to human SFT
  there.
- **CoT monitorability** — keeping the chain of thought faithful and legible — is now
  treated as a fragile safety asset, and is in tension with token-efficiency / latent
  reasoning pressures. See
  [03 · Scheming & control](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md).
