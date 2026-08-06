# RL for Reasoning

## In brief
- **What it is** — A way to train language models to reason by rewarding *correct answers* rather than human-rated ones. The model tries a problem many times; a cheap automatic checker (does the math equation balance? do the unit tests pass?) scores each attempt, and the training nudges the model toward the answer patterns that tend to work. This "reinforcement learning with verifiable rewards" (RLVR) — RL trained against an automatic correctness check rather than a learned reward model — is the engine behind today's reasoning models.
- **Why it's pursued** — A verifiable checker sidesteps the cost and gameability of paying humans to rate outputs, and it turns out to sharply improve models on math, code, and logic where "right" is machine-checkable. It is the recipe that produced the current wave of step-by-step reasoning systems.
- **Potential impact** — If RL genuinely *creates* new reasoning ability, it becomes a path to capabilities beyond what pretraining alone yields; if it only *sharpens* skills the base model already had (the central open dispute below), its ceiling is lower and the field must invest in real exploration instead. Either way it is now a mature subfield with its own bottlenecks — entropy collapse, reward hacking, and credit assignment over long agent trajectories.

## Key directions & work

### The "expand vs. sharpen" dispute (the central question)
*Does current RLVR create reasoning ability the base model lacks, or only redistribute
probability onto paths the base model could already sample?*

- **Sharpen camp — the pass@k ceiling critique.** Yue et al. ([arXiv:2504.13837](https://arxiv.org/abs/2504.13837),
  "Does RL Really Incentivize Reasoning Capacity Beyond the Base Model?", LeapLab Tsinghua /
  SJTU) compare base vs. RLVR models using **pass@k at large k** (fraction of problems solved
  in at least one of k samples) across Qwen-2.5 (7B/14B/32B), LLaMA-3.1-8B, math (AIME24,
  MATH500, Minerva, Olympiad), code (LiveCodeBench, HumanEval+), and visual reasoning
  (MathVista, MathVision). Finding: RLVR wins at small k (pass@1) but the **base model catches
  up and surpasses it as k grows** — e.g. ~9% more solvable problems on Minerva-32B at k=128.
  Perplexity analysis shows RLVR responses already lie in the base model's output distribution;
  solvable-set analysis shows RL's solved problems are nearly a *subset* of the base model's
  (AIME24: base-solves-only 13.3% vs. RL-solves-only 0.0%). They define a **sampling-efficiency
  gap** Δ_SE (RL pass@1 vs. base pass@256) that stays >40 points across
  PPO/GRPO/Reinforce++/RLOO/ReMax/DAPO — all algorithms behave alike and remain far from
  optimal. **Distillation, by contrast, does expand** the boundary, because it injects the
  teacher's patterns. Caveat: even Magistral-Medium (near-frontier, pure RL) shows the same
  narrowing, though the authors leave open whether the trend survives much larger pretraining/RL
  compute.
- **Formalized as the "invisible leash."** Wu et al. ([arXiv:2507.14843](https://arxiv.org/abs/2507.14843),
  Stanford / U-Tokyo / RIKEN / UW / NVIDIA, Feb 2026) recast this as *support-constrained
  optimization*: RLVR can up-weight correct completions the base model already gives
  non-negligible probability mass (ε), but **cannot seed mass into completions outside the base
  model's support** (those it would essentially never sample). They measure this on
  ProRL/Nemotron, Skywork, AceReason, and Phi4-Reason checkpoints (1.5B–14B) using
  Support-Retention-Rate (SRR) and Net-Discovery-Rate (NDR): SRR ≈ 0.93–0.99 but **NDR ≤ 0.04**
  everywhere — genuine discovery is rare, and shrinkage consistently outweighs expansion (Net
  Support Change Rate is uniformly negative). Bonus result: RLVR can *raise* token-level entropy
  while *lowering* answer-level entropy ("local stochasticity without global exploration") —
  which is why the more-uncertain-looking RL model still converges on fewer distinct answers.
  Notably, this paper tests ProRL's own checkpoints directly and still finds net shrinkage.
- **Expand camp — NVIDIA ProRL.** "Scaling Up RL: Unlocking Diverse Reasoning via Prolonged
  Training" ([arXiv:2505.24864](https://arxiv.org/abs/2505.24864); PDF on disk is the
  technical report) trains **Nemotron-Research-Reasoning-Qwen-1.5B** from DeepSeek-R1-Distill-
  Qwen-1.5B with prolonged GRPO. Recipe: DAPO-style decoupled clipping (ε_low=0.2, ε_high=0.4)
  plus dynamic sampling; a *small non-zero* KL penalty (β=1e-3) — they argue *against* removing
  KL when starting from a strong checkpoint; and **periodic hard reference-policy resets** to
  escape KL-domination and revive learning, across ~16 sequential runs / ~16k GPU-hours.
  Reported avg pass@1 gains over the base distilled model: **+14.7% math, +13.9% coding, +54.8%
  logic puzzles, +25.1% STEM, +18.1% instruction-following**. ProRL claims expanded solution
  diversity; the leash paper (above) re-examines these very checkpoints and attributes the gains
  to mass concentration, not genuine support expansion — so **the two camps disagree on how to
  interpret overlapping evidence, not just on which experiments to run.** The dispute is
  unresolved and bounds how far RL alone can push reasoning.

### Entropy collapse (the main scaling bottleneck)
- Cui et al. ([arXiv:2505.22617](https://arxiv.org/abs/2505.22617), "The Entropy Mechanism of
  RL for Reasoning LMs", Shanghai AI Lab / Tsinghua / others) show that policy entropy (how
  varied the model's outputs are) collapses sharply and early. Across 11 models (0.5–32B) they
  fit **R = −a·exp(H) + b** tying validation performance R to entropy H — the ceiling at H=0 is
  **−a+b**, predictable from just the first ~36 steps (RMSE ~1–2% on math/code). About 73% of
  entropy is consumed in the first 200 of 2400 steps, so more than two-thirds of training yields
  marginal returns. Mechanism: for softmax policies the entropy change ≈ −Cov(log π, advantage),
  so high-covariance (high-probability, high-advantage) tokens drive the collapse. Their
  interventions **Clip-Cov / KL-Cov** restrict updates on the small fraction of outlier
  high-covariance tokens (the top 0.02% carry ~5.6× the mean covariance), delaying collapse —
  whereas a naive entropy bonus or reference-KL regularization is hypersensitive and degrades
  performance.

### Rewards without verifiers
- **RLIF / Intuitor** — Zhao, Kang, Feng, Levine, Song ([arXiv:2505.19590](https://arxiv.org/abs/2505.19590),
  "Learning to Reason without External Rewards", UC Berkeley / Yale; ICLR 2026). Replaces the
  GRPO verifiable reward with the model's own **self-certainty** (the average KL divergence
  between a uniform distribution and the next-token distribution) as the *sole* reward — fully
  unsupervised. On Qwen2.5-1.5B/3B trained on MATH, it **matches GRPO in-domain on GSM8K/MATH500**
  and **generalizes better out-of-distribution to code** (e.g. Qwen2.5-3B: +76% relative on
  CRUXEval-O vs. +44% for GRPO; LiveCodeBench gains continue after MATH accuracy plateaus). Key
  robustness result: *online* self-certainty (reward from the evolving policy) resists reward
  hacking, whereas an *offline* fixed-annotator version gets gamed (~step 100 the policy inflates
  its reward by appending an already-solved subproblem, collapsing accuracy). Limitation:
  optimizing self-certainty directly as a loss reward-hacks; only the advantage-weighted GRPO
  form is stable, and small models trained purely offline degrade over time.

### Agentic RL: credit assignment & environments
- **Credit assignment (deciding which actions earned the reward) as *the* defining problem of
  agentic RL.** Survey: Zhang, "From Reasoning to Agentic: Credit Assignment in RL for LLMs"
  ([arXiv:2604.09459](https://arxiv.org/abs/2604.09459), Apr 2026). Catalogs **47 methods
  (41 core CA methods + 6 CA-adjacent enablers)** published Jan 2024–Apr 2026, on a 2-D taxonomy
  of *granularity* (token / segment / step-turn / multi-agent) × *methodology* (Monte-Carlo, TD,
  model-based/LLM-as-critic, game-theoretic, info-theoretic). Core argument: episode-level credit
  (GRPO/REINFORCE) is fine for short reasoning trajectories (~10³–10⁴ tokens) but breaks for
  agentic ones (10⁵–10⁶ tokens, 10–100+ turns), where the signal-to-noise ratio per action
  collapses — the survey calls this the "echo trap." Notable techniques: **hindsight credit
  (HCAPO**, extends classical HCA to agents via generative verification), counterfactual/
  leave-one-out (C3, CCPO), and the observation that **process reward models *are* credit
  assignment** (a step-level decomposition of the terminal reward). *Verified: the "~47 methods"
  claim is exact (41+6).*
- **Implicit step rewards for agentic RL (iStar)** — Liu et al. ([arXiv:2509.19199](https://arxiv.org/abs/2509.19199),
  CAS / Tongyi Lab). Jointly trains an implicit process reward model (PRM) alongside the policy
  via a *trajectory-based DPO* objective (provably yields a step-wise reward function). Step
  rewards measure how much more probable an action is under the freshly-learned PRM than under
  the old policy, combined with episode-level advantages — needing no annotated step labels or
  extra rollouts. Plugs into GRPO/RLOO/DAPO. Results: SOTA on **WebShop** (86.5% success / 93.6
  score) and **VisualSokoban** (91.7%); on the open-ended **SOTOPIA** benchmark it improves goal
  completion by up to **14% (self-chat)** and **48% (vs. GPT-4o)**. Ablation: in multi-turn RL,
  token-level process rewards are *worse* than step-level ones — too fine-grained and noisy.
- **Environments at scale, by backtranslation.** **R2E-Gym** ([arXiv:2504.07164](https://arxiv.org/abs/2504.07164))
  turns GitHub commits into **8.1k+** executable software-engineering (SWE) tasks via the SWEGEN
  back-translation + test-generation recipe, needing no human-written issues or tests. **DeepSWE**
  (Qwen3-32B, trained with GRPO++ on ~4,500 R2E-Gym tasks) reaches **42.2% Pass@1 / 59% with
  test-time scaling on SWE-Bench-Verified**, open-weight SOTA. [Together AI](https://www.together.ai/blog/deepswe).
  **Endless Terminals** — Gandhi, Garg, Goodman, Papailiopoulos ([arXiv:2601.16443](https://arxiv.org/abs/2601.16443),
  Stanford / Microsoft Research, Feb 2026) — uses a 4-stage pipeline to procedurally generate
  **3,255** verified terminal-use tasks (no human annotation or distillation), then trains agents
  with **vanilla PPO, binary episode rewards, no KL penalty, and minimal scaffold**. Gains
  transfer to the human-curated TerminalBench 2.0 (e.g. Qwen2.5-7B 10.7%→53.3% on their dev set;
  2.2%→3.4% on TerminalBench), supporting the thesis that *"simple RL succeeds when environments
  scale."* Failure modes: loop behaviors (39%) and turn exhaustion (26%); successful runs show
  higher post-error command diversity (0.49 vs. 0.18).

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
regions**, not more recipe-tuning. **Entropy collapse** is now a quantified, predictable ceiling
(R = −a·exp(H)+b), making scalable RL fundamentally an exploration-bottleneck problem. **Reward
hacking** is structural: it is defeated only when the reward co-evolves with the policy
(Intuitor's online vs. offline result). RL remains sample-inefficient, and **credit assignment**
is recast as the defining problem of agentic RL (47 methods and counting), where episode-level
credit breaks down at 10⁵–10⁶-token horizons.
