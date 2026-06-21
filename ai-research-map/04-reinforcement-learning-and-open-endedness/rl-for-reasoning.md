# RL for Reasoning

Reinforcement learning with verifiable rewards (RLVR) is the engine behind reasoning
models. It has matured into a science with its own open problems.

## Key directions & work

### The "expand vs. sharpen" dispute (the central question)
*Does current RLVR create reasoning ability the base model lacks, or only redistribute
probability onto paths the base model could already sample?*

- **Sharpen camp — the pass@k ceiling critique.** Yue et al. ([arXiv:2504.13837](https://arxiv.org/abs/2504.13837),
  "Does RL Really Incentivize Reasoning Capacity Beyond the Base Model?", LeapLab Tsinghua /
  SJTU) measure base vs. RLVR models with **pass@k at large k** across Qwen-2.5 (7B/14B/32B),
  LLaMA-3.1-8B, math (AIME24, MATH500, Minerva, Olympiad), code (LiveCodeBench, HumanEval+),
  and visual reasoning (MathVista, MathVision). Finding: RLVR wins at small k (pass@1) but the
  **base model catches up and surpasses it as k grows** — e.g. ~9% more solvable problems on
  Minerva-32B at k=128. Perplexity analysis shows RLVR responses already lie in the base
  model's output distribution; solvable-set analysis shows RL's solved problems are nearly a
  *subset* of the base model's (AIME24: base-solves-only 13.3% vs. RL-solves-only 0.0%). They
  define a **sampling-efficiency gap** Δ_SE (RL pass@1 vs. base pass@256) that stays >40 points
  across PPO/GRPO/Reinforce++/RLOO/ReMax/DAPO — all algorithms behave similarly and remain far
  from optimal. **Distillation, by contrast, does expand** the boundary (it injects the
  teacher's patterns). Caveat: even Magistral-Medium (near-frontier, pure RL) shows the same
  narrowing, but the authors leave open whether the trend survives much larger pretraining/RL
  compute.
- **Formalized as the "invisible leash."** Wu et al. ([arXiv:2507.14843](https://arxiv.org/abs/2507.14843),
  Stanford / U-Tokyo / RIKEN / UW / NVIDIA, Feb 2026) recast this as *support-constrained
  optimization*: RLVR can up-weight correct completions the base model already gives
  non-negligible mass (ε), but **cannot seed mass into completions outside base support**. They
  measure it on ProRL/Nemotron, Skywork, AceReason, Phi4-Reason checkpoints (1.5B–14B) with
  Support-Retention-Rate (SRR) and Net-Discovery-Rate (NDR): SRR ≈ 0.93–0.99 but **NDR ≤ 0.04**
  everywhere — genuine discovery is rare, and shrinkage consistently outweighs expansion (Net
  Support Change Rate is uniformly negative). Bonus result: RLVR can *raise* token-level entropy
  while *lowering* answer-level entropy ("local stochasticity without global exploration"),
  which is why the more-uncertain-looking RL model still converges on fewer distinct answers.
  Notably this paper directly tests ProRL checkpoints and still finds net shrinkage.
- **Expand camp — NVIDIA ProRL.** "Scaling Up RL: Unlocking Diverse Reasoning via Prolonged
  Training" ([arXiv:2505.24864](https://arxiv.org/abs/2505.24864); PDF on disk is the
  technical report) trains **Nemotron-Research-Reasoning-Qwen-1.5B** from DeepSeek-R1-Distill-
  Qwen-1.5B with prolonged GRPO. Recipe: DAPO-style decoupled clipping (ε_low=0.2, ε_high=0.4)
  + dynamic sampling, a *small non-zero* KL penalty (β=1e-3) — they argue *against* removing KL
  when starting from a strong checkpoint — and **periodic hard reference-policy resets** to
  escape KL-domination and revive learning across ~16 sequential runs / ~16k GPU-hours. Reported
  avg pass@1 gains over the base distilled model: **+14.7% math, +13.9% coding, +54.8% logic
  puzzles, +25.1% STEM, +18.1% instruction-following**. ProRL claims expanded solution diversity;
  the leash paper (above) re-examines these very checkpoints and finds the gains come from mass
  concentration, not genuine support expansion — so **the two camps disagree on interpretation
  of overlapping evidence, not just on different experiments.** The dispute is unresolved and
  bounds how far RL alone can push reasoning.

### Entropy collapse (the main scaling bottleneck)
- Cui et al. ([arXiv:2505.22617](https://arxiv.org/abs/2505.22617), "The Entropy Mechanism of
  RL for Reasoning LMs", Shanghai AI Lab / Tsinghua / others) show policy entropy collapses
  sharply early: across 11 models (0.5–32B) they fit **R = −a·exp(H) + b** tying validation
  performance R to entropy H — the ceiling at H=0 is **−a+b**, predictable from the first ~36
  steps (RMSE ~1–2% on math/code). ~73% of entropy is consumed in the first 200 of 2400 steps;
  >2/3 of training yields marginal returns. Mechanism: for softmax policies the entropy change
  ≈ −Cov(log π, advantage), so high-covariance (high-prob, high-advantage) tokens drive
  collapse. Their interventions **Clip-Cov / KL-Cov** restrict updates on the small fraction of
  outlier high-covariance tokens (top 0.02% have ~5.6× mean covariance), delaying collapse —
  whereas naive entropy-bonus or reference-KL regularization is hypersensitive and degrades
  performance.

### Rewards without verifiers
- **RLIF / Intuitor** — Zhao, Kang, Feng, Levine, Song ([arXiv:2505.19590](https://arxiv.org/abs/2505.19590),
  "Learning to Reason without External Rewards", UC Berkeley / Yale; ICLR 2026). Replaces the
  GRPO verifiable reward with the model's own **self-certainty** (avg KL between a uniform
  distribution and the next-token distribution) as the *sole* reward — fully unsupervised.
  On Qwen2.5-1.5B/3B trained on MATH, it **matches GRPO on in-domain GSM8K/MATH500** and
  **generalizes better OOD to code** (e.g. Qwen2.5-3B: +76% relative on CRUXEval-O vs. +44% for
  GRPO; LiveCodeBench gains continue after MATH accuracy plateaus). Key robustness result:
  *online* self-certainty (reward from the evolving policy) resists reward hacking, whereas an
  *offline* fixed-annotator version is gamed (~step 100 the policy inflates its reward by
  appending an already-solved subproblem, collapsing accuracy). Limitation: optimizing
  self-certainty directly as a loss reward-hacks; only the advantage-weighted GRPO form is
  stable, and small models trained purely offline degrade over time.

### Agentic RL: credit assignment & environments
- **Credit assignment as *the* defining problem of agentic RL.** Survey: Zhang,
  "From Reasoning to Agentic: Credit Assignment in RL for LLMs"
  ([arXiv:2604.09459](https://arxiv.org/abs/2604.09459), Apr 2026). Catalogs **47 methods
  (41 core CA methods + 6 CA-adjacent enablers)** published Jan 2024–Apr 2026, on a 2-D taxonomy
  of *granularity* (token / segment / step-turn / multi-agent) × *methodology* (Monte-Carlo, TD,
  model-based/LLM-as-critic, game-theoretic, info-theoretic). Core argument: episode-level credit
  (GRPO/REINFORCE) is fine for short reasoning trajectories (~10³–10⁴ tokens) but breaks for
  agentic ones (10⁵–10⁶ tokens, 10–100+ turns), where SNR per action collapses — the survey calls
  this the "echo trap." Notable techniques: **hindsight credit (HCAPO**, extends classical HCA to
  agents via generative verification), counterfactual/leave-one-out (C3, CCPO), and the
  observation that **process reward models *are* credit assignment** (step-level decomposition of
  the terminal reward). *Verified: the "~47 methods" claim is exact (41+6).*
- **Implicit step rewards for agentic RL (iStar)** — Liu et al. ([arXiv:2509.19199](https://arxiv.org/abs/2509.19199),
  CAS / Tongyi Lab). Jointly trains an implicit PRM with the policy via a *trajectory-based DPO*
  objective (provably yields a step-wise reward function); step rewards measure how much more
  probable an action is under the freshly-learned PRM vs. the old policy, combined with
  episode-level advantages — no annotated step labels or extra rollouts. Plugs into GRPO/RLOO/DAPO.
  Results: SOTA on **WebShop** (86.5% success / 93.6 score) and **VisualSokoban** (91.7%),
  and on open-ended **SOTOPIA** improves goal completion by up to **14% (self-chat)** and **48%
  (vs. GPT-4o)**. Ablation: token-level process rewards are *worse* than step-level (too
  fine-grained, noisy) in multi-turn RL.
- **Environments at scale, by backtranslation.** **R2E-Gym** ([arXiv:2504.07164](https://arxiv.org/abs/2504.07164))
  turns GitHub commits into **8.1k+** executable SWE tasks via the SWEGEN back-translation +
  test-generation recipe (no human-written issues/tests needed). **DeepSWE** (Qwen3-32B, trained
  with GRPO++ on ~4,500 R2E-Gym tasks) reaches **42.2% Pass@1 / 59% with test-time scaling on
  SWE-Bench-Verified**, open-weight SOTA. [Together AI](https://www.together.ai/blog/deepswe).
  **Endless Terminals** — Gandhi, Garg, Goodman, Papailiopoulos ([arXiv:2601.16443](https://arxiv.org/abs/2601.16443),
  Stanford / Microsoft Research, Feb 2026) — a 4-stage pipeline that procedurally generates
  **3,255** verified terminal-use tasks (no human annotation/distillation), then trains agents with
  **vanilla PPO, binary episode rewards, no KL penalty, minimal scaffold**. Gains transfer to the
  human-curated TerminalBench 2.0 (e.g. Qwen2.5-7B 10.7%→53.3% on their dev set; 2.2%→3.4% on
  TerminalBench), with the thesis *"simple RL succeeds when environments scale."* Failure modes:
  loop behaviors (39%) and turn exhaustion (26%); successful runs show higher post-error command
  diversity (0.49 vs. 0.18).

## State of research

**Best-performing now:** GRPO-lineage RLVR with entropy/KL controls and verifiable rewards is
the proven, deployed recipe. Backtranslated/procedurally-generated executable environments
(R2E-Gym, Endless Terminals) are the best way to mass-produce agentic training signal.

**Promising but unproven:** Reward-free RL (self-certainty / Intuitor), prolonged RL as a true
capability-*expander* (ProRL — contested by the leash paper), and dense process/step-level
credit-assignment rewards for long-horizon agents (iStar).

**Open problems & weaknesses:** The **expand-vs-sharpen** question is genuinely open and now
sharper: two papers (2504.13837, 2507.14843) read overlapping evidence — *including ProRL's own
checkpoints* — as net support shrinkage (NDR ≤ 0.04), while ProRL reads it as expansion. Both
sides agree the fix is **explicit exploration that seeds mass into under-represented solution
regions** rather than more recipe-tuning. **Entropy collapse** is now a quantified, predictable
ceiling (R = −a·exp(H)+b), making scalable RL fundamentally an exploration-bottleneck problem.
**Reward hacking** is structural: it's defeated only when the reward co-evolves with the policy
(Intuitor's online vs. offline result). RL remains sample-inefficient; **credit assignment** is
recast as the defining problem of agentic RL (47 methods and counting), where episode-level
credit breaks down at 10⁵–10⁶-token horizons.
