# World Models & Video

Models that learn or generate the *dynamics* of environments — increasingly a named
frontier ("spatial intelligence") and a heavily-funded startup category.

## Key directions & work

### Interactive generated worlds
- **Genie 3** (DeepMind) — generates interactive, navigable 3D worlds from text at 24fps /
  720p with ~1-minute memory and emergent physical consistency; powers SIMA 2's training
  loop. [DeepMind](https://deepmind.google/blog/genie-3-a-new-frontier-for-world-models/)
- **World Labs (Fei-Fei Li)** — **Marble** (persistent, promptable 3D environments, GA Feb
  2026) and **RTFM** (real-time frame model: 3D-consistent interactive worlds on one H100 via
  "spatial memory"). Raised $1B. [RTFM](https://www.worldlabs.ai/blog/rtfm). World Labs even
  argues "world model" conflates three distinct system types — a conceptual stake in the field.
- **Decart Oasis 3** — real-time interactive world model (photorealistic driving sim via API).
  [TechCrunch](https://techcrunch.com/2026/06/10/decarts-new-world-model-can-simulate-hours-of-photorealistic-driving-with-some-caveats/)

### Video-as-world-simulation
- **Sora 2** (OpenAI) and **Veo 3** (Google) — markedly improved physics (rebounds,
  collisions) + synchronized audio; positioned as steps toward world simulation.
- **NVIDIA Cosmos / Cosmos 3** — open world foundation models for physical AI (synthetic
  data for robotics/AV). [arXiv:2511.00062](https://arxiv.org/abs/2511.00062)

### Predictive / representation-space (the other camp)
- **V-JEPA 2** (Meta) — self-supervised video world model (1M+ hours) enabling zero-shot
  robot planning; predicts in *representation space*, not pixels. [arXiv:2506.09985](https://arxiv.org/abs/2506.09985)
- **JEPA / energy-based** program — Yann LeCun's new **AMI Labs** (Paris) pursues this
  direction independently. See [12 · Business models](../12-politics-capital-and-business-models/business-models.md).

## State of research

**Best-performing now:** Interactive generative world models (Genie 3, Marble) are the most
striking demos, and video generators (Sora 2, Veo 3) are the most physically convincing.
For *robotics planning*, V-JEPA-2-style predictive models are the working approach.

**Promising but unproven:** Whether generated worlds are *consistent and controllable*
enough to be true simulators (for training agents, AV, robotics) rather than impressive
visuals. The generative-vs-predictive question — which substrate underlies "understanding"
— is genuinely open and philosophically loaded.

**Open problems & weaknesses:** **Long-horizon consistency and memory** (worlds drift after
seconds–minutes), **true physics** (still approximate/hallucinated), and the lack of agreed
evaluation. The field hasn't even settled what "world model" *means*. Compute cost for
real-time generation is high. Tight coupling to robotics data needs ([embodied AI](embodied-ai-and-vlas.md)).
