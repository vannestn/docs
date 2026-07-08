# Embodied AI & Vision-Language-Action Models

Vision-Language-Action (VLA) models are generalist robot policies that map perception and language goals to physical actions — the bet that one model can drive many robots across many tasks, the way foundation models did for text and images.

## Key directions & work

- **π0 / π0.5 / π*0.6** (Physical Intelligence) — π0 introduced *flow matching* for
  continuous action generation and was open-sourced (`openpi`). **π0.5** (the paper covered
  here) is a co-trained VLA with a hierarchical "high-level subtask → low-level action" design
  that controls mobile manipulators in *entirely unseen* homes on 10–15-minute multi-stage
  tasks. [arXiv:2504.16054](https://arxiv.org/abs/2504.16054). **π*0.6** adds on-robot RL via
  **RECAP** (*RL with Experience and Corrections via Advantage-conditioned Policies*); PI claims
  it roughly doubles throughput and halves failures on tasks like espresso-making and
  laundry-folding. [arXiv:2511.14759](https://arxiv.org/abs/2511.14759)
- **Gemini Robotics 1.5 + ER 1.5** (DeepMind) — a two-model agentic system: **GR-ER 1.5**
  (an embodied-reasoning VLM) acts as orchestrator/planner and success-detector, while
  **GR 1.5** (a "Thinking VLA") executes. A **Motion Transfer (MT)** training recipe enables
  *zero-shot* skill transfer across ALOHA, bi-arm Franka, and Apollo humanoid embodiments.
  [arXiv:2510.03342](https://arxiv.org/abs/2510.03342)
- **Isaac GR00T N1** (NVIDIA) — *open* humanoid robot foundation model (GR00T-N1-2B checkpoint,
  data, and benchmarks released); dual-system VLA: a frozen Eagle-2 VLM (System 2, ~10 Hz) plus a
  DiT flow-matching action head (System 1, ~120 Hz). [arXiv:2503.14734](https://arxiv.org/abs/2503.14734)
- **Helix** (Figure AI) — dual-system VLA for the full humanoid upper body: a 7B internet-pretrained
  VLM (S2, 7–9 Hz) drives an 80M reactive transformer (S1, 200 Hz) over a 35-DoF action space, on a
  single set of weights. [Figure](https://www.figure.ai/news/helix)
- **Skild Brain** (Skild AI) — an "omni-bodied" single model claimed to control quadrupeds,
  humanoids, arms, and mobile manipulators (Series C: ~$1.4B at >$14B valuation). [Businesswire](https://www.businesswire.com/news/home/20260114335623/en/Skild-AI-Raises-$1.4B-Now-Valued-Over-$14B)

## Cited papers in depth

### π0.5 — open-world generalization via co-training ([arXiv:2504.16054](https://arxiv.org/abs/2504.16054))

**Mechanism.** π0.5 builds on the π0 flow-matching VLA (PaliGemma VLM backbone + a
~300M-param "action expert"). Two stages: (1) **pre-training** casts *everything* —
robot actions (as discrete **FAST** tokens), high-level subtask labels, object detection,
captioning, VQA — as next-token prediction over a single transformer; (2) **post-training**
specializes for mobile manipulation and adds a flow-matching action expert for fast
continuous control. At inference it runs **hierarchically**: first predict a semantic
subtask (e.g. "pick up the pillow"), then predict the low-level action chunk conditioned on
that subtask — a single model doing both high- and low-level inference. Action horizon H=49;
10 flow denoising steps at inference.

**The data recipe is the point.** π0.5 co-trains a heterogeneous mixture: ~400 h of mobile-
manipulator data in ~100 homes (MM), more abundant *non-mobile* robot data (ME), cross-
embodiment lab data (CE), high-level subtask labels (HL), verbal instructions (VI), and
multimodal web data (WD). Notably, **97.6% of training examples are *not* mobile-manipulation
data** — generalization comes from transfer, not from scaling the target domain.

**Results (real, unseen homes).** Evaluated in 3 real kitchens + 3 real bedrooms never seen
in training, on multi-stage tasks (dishes in sink, items in drawer, laundry, make bed). The
headline scaling result (Fig. 8): a model trained on **104 locations** roughly matches the
performance of a control model trained *directly on the test homes* — i.e. broad co-training
closes the generalization gap without any test-home data.

**Ablations (what actually matters).** Removing *either* cross-embodiment source (ME or CE)
significantly degrades performance; removing both is worse still — cross-embodiment transfer
is load-bearing. Web data (WD) shows little effect on overall task progress but is critical
for **out-of-distribution object** generalization and high-level subtask inference. The small
verbal-instruction set (~11% of mobile data) is critical: the **no-VI** ablation is
significantly weaker. Surprisingly, an **implicit-HL** variant (subtask *prediction* in
training but no explicit high-level inference at runtime) is the second-best config — much of
the benefit comes from co-training on subtask labels, not from the runtime hierarchy itself.
A GPT-4-as-high-level-policy baseline performs *worse* than the in-domain model.

**Author-stated limits.** π0.5 still makes mistakes: persistent failure on physically hard
mechanisms (stuck drawers/cabinets), partial observability (occluded spills), and easily
distracted high-level inference (opening/closing a drawer repeatedly). Prompts must stay
relatively simple; richer context/memory and better co-training are flagged as future work.

### GR00T N1 — an open dual-system humanoid foundation model ([arXiv:2503.14734](https://arxiv.org/abs/2503.14734))

**Mechanism.** Dual-system VLA, *tightly coupled and jointly trained end-to-end* (not a
loose planner→policy pipeline). **System 2** = a frozen Eagle-2 VLM (SmolLM2 LLM + SigLIP-2
encoder) running at ~10 Hz on an L40; **System 1** = a DiT trained with **action flow
matching**, cross-attending to VLM tokens, emitting closed-loop actions at ~120 Hz. The
GR00T-N1-2B checkpoint is **2.2B params total** (1.34B in the VLM); sampling a 16-action
chunk takes 63.9 ms (bf16, L40). Notably they use **middle-layer (12th-layer)** VLM
embeddings rather than final-layer — faster and higher success rate. Per-embodiment MLP
state/action encoders let one model span single-arm to bimanual-humanoid.

**Data pyramid.** Web/human-video data at the base, synthetic in the middle, real-robot at
the top. To use video that has no action labels, they learn a **latent-action codebook**
(VQ-VAE) and an inverse-dynamics model that infer pseudo-actions, treating videos as extra
"embodiments."
They generate **neural trajectories** by fine-tuning image-to-video models on their 88 h of
teleop data, producing ~827 h (~10× augmentation), and **simulation trajectories** via
DexMimicGen (780k trajectories ≈ 6,500 h of human-demo-equivalent, generated in ~11 h).

**Results.** On 3 sim benchmarks (RoboCasa 24 tasks, DexMimicGen 9 tasks, GR-1 24 tasks)
GR00T-N1-2B beats BC-Transformer and Diffusion Policy at every data size; at 100 demos/task:
**45.0% average** vs 33.4% (Diffusion Policy) and 26.4% (BC-Transformer), with the largest
margin on GR-1 (50.0% vs 32.7%). On the **real GR-1 humanoid** (Table 3) it beats Diffusion
Policy across all task families, and GR00T-N1 trained on **just 10% of the data (42.6% avg)**
nearly matches Diffusion Policy on the **full** dataset (46.4%) — a data-efficiency result.
Pre-trained generalization tests on the real robot: 76.6% on a coordinated left-to-right
handover task, 73.3% placing novel objects into unseen containers.

**Ablation.** Co-training with neural trajectories adds +4.2/+8.8/+6.8% in RoboCasa at
30/100/300 demos and +5.8% avg across the 8 GR-1 tasks. LAPA (latent) vs IDM-labeled
pseudo-actions: latent wins in the very-low-data regime; IDM overtakes as data grows.

**Author-stated limits.** Focused on **short-horizon tabletop** manipulation; long-horizon
loco-manipulation is future work needing better hardware, architecture, and a stronger VLM
backbone. Synthetic-data generation still struggles to produce diverse, physically-faithful,
counterfactual data.

### Gemini Robotics 1.5 — thinking, motion transfer, agentic orchestration ([arXiv:2510.03342](https://arxiv.org/abs/2510.03342))

**Three innovations.** (1) **Thinking VLA**: GR 1.5 generates a natural-language "thinking
trace" (next-step + motion description) before emitting an action — "think before acting."
(2) **Motion Transfer (MT)**: a training recipe that learns a unified motion/physics
representation across embodiments, enabling **zero-shot** skill transfer (a skill seen only
on bi-arm Franka executes on ALOHA, etc.). (3) **GR-ER 1.5**: a SOTA embodied-reasoning VLM
used as the agentic **orchestrator** (planning, tool use incl. web search, success
detection). Trained on multi-embodiment data: ALOHA, bi-arm Franka, Apollo humanoid + web
image/video/text. Evaluated A/B/n on real robots; >90% of dev evaluations run in a MuJoCo
simulator with verified sim-real rank consistency.

**Results.**
- **Thinking helps acting** (Fig. 6, multi-step progress score): ALOHA **0.55 vs 0.26**
  (thinking on vs off), bi-arm Franka 0.60 vs 0.55, humanoid 0.67 vs 0.51 — biggest gains on
  the longest-horizon tasks; the trace also yields implicit success detection and self-
  correcting recovery (e.g. switching hands when an object slips).
- **Cross-embodiment transfer** (Fig. 5, success rate on tasks seen only on *another* robot):
  GR 1.5 with MT reaches **0.43 / 0.58 / 0.40** on ALOHA / Franka / humanoid, vs ~0.00–0.09
  for single-embodiment or no-MT baselines — MT amplifies multi-embodiment data, most
  helpful where the target embodiment has *less* native data.
- **Agentic system** (Fig. 17, long-horizon): GR-ER 1.5 + GR 1.5 frequently scores near 80%
  vs ~44% for the Thinking VLA alone. Using GR-ER 1.5 as orchestrator **halves total failure
  rate vs a Gemini 2.5 Flash orchestrator** (22% vs 44.5%), driven mostly by better planning
  (9% vs 25.5% planning-failure).
- **GR-ER 1.5 reasoning**: SOTA on a 15-benchmark embodied-reasoning suite, scales with
  inference-time "thinking" compute better than Gemini 2.5 Flash.

**Safety.** A multi-layered approach: semantic safety reasoning, the upgraded **ASIMOV-2.0**
benchmark (injury/constraint/video), and an **Auto-Red-Teaming** framework (Attacker/Target/
AutoRater) that surfaces e.g. ER hallucinations under adversarial prompts.

**Author-stated limits.** GR 1.5's **dexterity is on par with the previous generation** (not
improved); RL is flagged as the path to better dexterity without sacrificing generality. The
team wants to leverage more scalable non-action data (human/synthetic video).

## State of research

**Best-performing now:** **Dual-system VLAs** (slow VLM/ER reasoning + fast diffusion/flow
action head) are the convergent design across every major lab — GR00T N1, Helix, and the
GR 1.5 agentic stack all use it. **Flow-matching** action generation, **cross-embodiment
transfer**, and **co-training on heterogeneous non-robot data** (web, human video,
high-level subtask labels) are the proven techniques: GR 1.5's MT ablation and π0.5's ME/CE
ablation both show cross-embodiment data is load-bearing, and π0.5 shows web data is what
drives out-of-distribution object generalization.

**Promising but unproven:** **Open-world generalization** — π0.5 demonstrates a model trained
on 104 homes matching one trained on the test homes themselves, but still with frequent
mistakes. **Explicit "thinking" before acting** (GR 1.5) measurably helps multi-step tasks
and adds interpretability + recovery, but the gain is task-dependent. **On-robot RL
self-improvement** (π*0.6 / RECAP) is the newest frontier — claimed to roughly halve failures
on long real-world tasks, but from a single lab and not yet independently reproduced.

**Open problems & weaknesses (what the papers actually concede):**
- **Data scarcity** is the defining constraint — no internet-scale corpus of robot actions,
  forcing reliance on teleoperation, human video, and simulation (linking to
  [world models](world-models-and-video.md) for synthetic experience). GR00T N1 and GR 1.5
  both flag scalable *action-less* video as the key unsolved data lever.
- **Dexterity is plateauing**: GR 1.5 explicitly states its dexterity is only *on par* with
  the prior generation — generalization improved, fine manipulation did not.
- **Long-horizon reliability**: π0.5 is easily distracted in high-level inference and fails on
  physically hard mechanisms; GR00T N1 is limited to short-horizon tabletop tasks.
- **Synthetic data quality**: generating diverse, physically-faithful counterfactual data
  remains hard (GR00T N1).
- **Evaluation is non-standardized and hardware-dependent** — labs use bespoke benchmarks and
  progress-score rubrics; GR 1.5 runs >90% of evals in simulation to make this tractable.
- **Safety** for real human-centric deployment is far from solved; GR 1.5 is the one cited
  here treating it as a first-class problem (ASIMOV-2.0, auto-red-teaming).
