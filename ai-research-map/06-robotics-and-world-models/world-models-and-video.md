# World Models & Video

Models that learn or generate the *dynamics* of environments — increasingly a named
frontier ("spatial intelligence") and a heavily-funded startup category. The space splits
along one fault line: **generate the world in pixels** (video/interactive generators) vs.
**predict it in representation space** (JEPA-style). The two camps disagree on what
"understanding" requires, and even on what "world model" *means*.

## Key directions & work

### Interactive generated worlds
- **Genie 3** (DeepMind) — generates interactive, navigable 3D worlds from text via
  autoregressive frame generation at 24fps / 720p, navigable in real time, with visual
  memory of ~1 minute (objects stay coherent for about a minute if they leave and re-enter
  frame) and emergent physical consistency; supports promptable world events and powers
  SIMA agent training. [DeepMind](https://deepmind.google/blog/genie-3-a-new-frontier-for-world-models/)
- **World Labs (Fei-Fei Li)** — **Marble** (persistent, navigable 3D environments from text,
  image, video, panorama or coarse 3D layout; launched in limited beta Nov 2025, GA Feb 2026
  alongside a $1B round) plus the **Chisel** layout editor; and **RTFM** (real-time frame
  model: 3D-consistent interactive worlds on one H100, using posed frames as "spatial memory"
  rather than explicit 3D reconstruction). [RTFM](https://www.worldlabs.ai/blog/rtfm) ·
  [Marble](https://www.worldlabs.ai/blog/marble-world-model). Fei-Fei Li's "Functional
  Taxonomy of World Models" (Jun 2026) argues the term conflates three distinct system types
  — **renderer** (outputs pixels for human eyes; visual fidelity is what matters),
  **simulator** (outputs computable, physically/geometrically faithful *state*), and
  **planner** — a conceptual stake in the field.
  [Taxonomy](https://drfeifei.substack.com/p/a-functional-taxonomy-of-world-models)
- **Decart Oasis 3** — real-time interactive world model for photorealistic driving sim via
  API (three camera views, <200ms end-to-end latency, ~$0.02/sec). Acknowledged caveats:
  scene consistency drifts over time and physical interactions (e.g. collisions) are
  sometimes mis-modeled.
  [TechCrunch](https://techcrunch.com/2026/06/10/decarts-new-world-model-can-simulate-hours-of-photorealistic-driving-with-some-caveats/)

### Video-as-world-simulation
- **Sora 2** (OpenAI) and **Veo 3** (Google) — markedly improved physics (gravity, momentum,
  collisions, fluids) + synchronized audio; Sora 2 is positioned by OpenAI as a step toward a
  "general-purpose world simulator." Physical fidelity is improved but still approximate.
- **NVIDIA Cosmos-Predict2.5 / Cosmos-Transfer2.5** — open world foundation models for
  Physical AI (synthetic data + closed-loop simulation for robotics/AV). Flow-matching DiT
  unifying Text2World / Image2World / Video2World in one model, released at **2B and 14B**;
  see breakdown below. [arXiv:2511.00062](https://arxiv.org/abs/2511.00062)

### Predictive / representation-space (the other camp)
- **V-JEPA 2** (Meta) — self-supervised video world model (>1M hours of video) that predicts
  in *representation space*, not pixels; its frozen encoder + a small action-conditioned
  predictor (**V-JEPA 2-AC**) enables zero-shot robot planning. See breakdown below.
  [arXiv:2506.09985](https://arxiv.org/abs/2506.09985)
- **JEPA / energy-based** program — Yann LeCun's new **AMI Labs** (Paris) pursues this
  direction independently. See [12 · Business models](../12-politics-capital-and-business-models/business-models.md).

## Paper deep-dives

### V-JEPA 2 — predict in representation space, then plan ([arXiv:2506.09985](https://arxiv.org/abs/2506.09985))

**Mechanism.** Two stages. (1) *Action-free pretraining*: a ViT encoder + predictor is trained
with a mask-denoising objective in *learned representation space* (predict the
representation of masked video patches, not their pixels), with an L1 loss against an EMA
("teacher") encoder and a stop-gradient to prevent collapse. The bet: predicting
*representations* lets the model ignore unpredictable pixel detail (every blade of grass) and
focus on predictable structure (an object's trajectory). (2) *Action-conditioned
post-training*: freeze the encoder and train **V-JEPA 2-AC**, a ~300M-parameter
block-causal transformer predictor, on just **62 hours** of unlabeled Droid robot video to
autoregressively predict the next-frame representation conditioned on end-effector action and
proprioceptive state. Planning is then energy minimization: at each step, optimize an action
sequence (via the Cross-Entropy Method) to minimize the L1 distance between the world model's
imagined future representation and a goal-image representation, execute the first action,
re-plan (receding-horizon MPC).

**Scale & results.** Pretrained on **VideoMix22M (22M videos / >1M hours)** plus 1M ImageNet
images; encoder scaled 300M → **1B** params (ViT-L → ViT-g). Frozen-probe results
(ViT-g₃₈₄):
- **Motion understanding:** 77.3 top-1 on Something-Something v2 (best among the vision
  encoders evaluated); 88.2 average across six understanding tasks.
- **Action anticipation:** **39.7** recall-at-5 on Epic-Kitchens-100 — state-of-the-art, a
  +12.1-point (44% relative) gain over the prior best (PlausiVL, 8B), with a 300M V-JEPA 2
  already beating it.
- **Video QA** (after aligning the *language-free* encoder with an 8B LLM): 84.0 PerceptionTest,
  44.5 MVP, 76.9 TempCompass, 40.3 TOMATO — SoTA in the ≤8B class on several benchmarks.
- **Zero-shot robot manipulation** on Franka arms in two labs not in the training data:
  100% reach; grasp 65% (cup) / 25% (box); pick-and-place 80% (cup) / 65% (box) — beating an
  Octo behavior-cloning baseline (e.g. 15% / 0% grasp). Each planning action takes ~16s vs.
  ~4 min for a Cosmos latent-diffusion world-model baseline (which V-JEPA 2-AC also out-scores
  on the harder interaction tasks).

**Scaling ablation.** Four interventions lift average understanding accuracy 84.2 → 88.2: data
2M→22M videos (+1.0), model 300M→1B (+1.5), training 90K→252K iters (+0.8), and higher
spatial/temporal resolution (256→384, 16→64 frames; +1.2).

**Author-stated limitations.** (1) *Camera sensitivity* — V-JEPA 2-AC infers the action
coordinate frame implicitly from a monocular RGB image; when the robot base isn't visible the
frame is under-defined, and the authors hand-picked a camera position that worked. (2)
*Long-horizon planning* — autoregressive rollouts accumulate error and the action search space
grows, so current results rely on image sub-goals and ~16-second horizons. (3) *Goal
specification* is image-based (language goals are future work). (4) EK100 anticipation is
limited to a fixed kitchen vocabulary.

### Cosmos-Predict2.5 / Transfer2.5 — generate the world in pixels, for Physical AI ([arXiv:2511.00062](https://arxiv.org/abs/2511.00062))

**Mechanism.** A **flow-matching** DiT (not the EDM-diffusion of Cosmos-Predict1) that unifies
**Text2World, Image2World, and Video2World** in a single model via a frame-replacement
conditioning strategy. Two notable swaps vs. Cosmos-Predict1: a **WAN2.1 causal VAE**
tokenizer (4×8×8 compression; generates 93 frames ≈ 24 latent frames ≈ 5.8s at 16fps) and
**Cosmos-Reason1** as the text encoder (a Physical-AI VLM replacing the T5 encoder, for richer
grounding). Released at **2B and 14B** scales under the NVIDIA Open Model License. Training:
flow-matching pretraining → domain-specific supervised fine-tuning (object permanence, high
motion, complex scenes, driving, manipulation) → **model merging** (model soup chosen) → a
GRPO-style **RL** post-train against a VLM reward model (VideoAlign).

**Data.** ~**200M** curated training clips, distilled from ~35M hours of raw video (≈6B
clips), with only ~4% surviving a multi-stage filter (aesthetic, motion, OCR, perceptual,
semantic-artifact, VLM, content-type) — explicitly excluding cartoons/games/animations to
keep the distribution physical.

**Results (the model's own evals).**
- **PAI-Bench** (physical-AI generation benchmark): post-trained 2B and 14B perform similarly
  to the much larger Wan2.2-27B-A14B on Text2World, and are the best-performing models on
  Image2World. RL post-training is preferred by human raters (e.g. 41.1% win / 18.9% loss on
  the pretrained+RL comparison).
- **Cosmos-Transfer2.5** (the control-net variant) is **3.5× smaller** than Cosmos-Transfer1
  yet scores higher on PAIBench-Transfer (overall quality 9.75 vs. 6.56 on blur control) and
  shows far less error accumulation in long (30–120s) autoregressive video, measured by a new
  Relative Normalized Dover Score (RNDS).
- **Downstream robotics:** a diffusion policy trained with Cosmos-Transfer2.5-augmented
  observations hits **24/30** successes across 10 real-robot test scenarios vs. 5/30 (standard
  image augmentation) and 1/30 (base). Action-conditioned generation on Bridge beats the
  Cosmos-Predict1 baseline on all metrics (PSNR 24.95 vs. 21.14; FVD 146 vs. 190), with an
  ablation showing time-embedding conditioning beats cross-attention and channel-concat.
- For VLA data generation, a 14B variant tops the DreamGen GR1 instruction-following benchmark.

**Note.** This is the paper the map previously mislabeled "Cosmos 3" — no model called
"Cosmos 3" exists; the work is **Cosmos-Predict2.5** (with **Cosmos-Transfer2.5**).

## State of research

**Best-performing now:** Interactive generative world models (Genie 3, Marble) are the most
striking demos, and video generators (Sora 2, Veo 3) are the most physically convincing.
For *robotics planning*, V-JEPA-2-style predictive models are the working approach — and
notably, on real-robot interaction tasks V-JEPA 2-AC outplans a Cosmos latent-diffusion world
model at ~15× lower per-action latency, an early data point in the generative-vs-predictive
debate. For *synthetic data / closed-loop sim*, Cosmos-Transfer2.5 shows pixel-space generators
can measurably improve downstream robot policies.

**Promising but unproven:** Whether generated worlds are *consistent and controllable*
enough to be true simulators (for training agents, AV, robotics) rather than impressive
visuals. Fei-Fei Li's renderer/simulator/planner taxonomy frames the open question precisely:
a *renderer* optimizes pixels for human eyes, a *simulator* must output computable, faithful
*state* — most "world model" demos are the former being sold as the latter.

**Open problems & weaknesses:**
- **Long-horizon consistency and memory** — generated worlds drift after seconds–minutes
  (Genie 3 holds ~1 min; Decart Oasis 3's scenes change unexpectedly over time), and even
  representation-space rollouts (V-JEPA 2-AC) accumulate error, forcing image sub-goals and
  short horizons.
- **True physics** — still approximate/hallucinated; collisions and contact are where both
  pixel generators (Oasis, Sora) and world models visibly break.
- **Evaluation** — no agreed metric. Cosmos resorts to a custom benchmark suite (PAI-Bench)
  and a bespoke long-video drift score (RNDS); V-JEPA 2 leans on downstream task probes. The
  field hasn't even settled what "world model" *means*.
- **Compute & grounding** — real-time generation is expensive (one H100 per RTFM stream),
  and predictive world models stay tightly coupled to robotics data needs
  ([embodied AI](embodied-ai-and-vlas.md)) and camera setup.
