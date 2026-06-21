# Embodied AI & Vision-Language-Action Models

Generalist robot policies that map perception + language goals to physical actions.

## Key directions & work

- **π0 / π0.5 / π0.6** (Physical Intelligence) — π0 introduced *flow matching* for
  continuous action generation; π0.5 showed end-to-end VLAs doing long-horizon dexterous
  tasks (cleaning unseen homes); π*0.6 adds RL learning-from-experience ("RECAP"). π0 was
  open-sourced. [arXiv:2504.16054](https://arxiv.org/abs/2504.16054)
- **Gemini Robotics 1.5 + ER 1.5** (DeepMind) — an ER (embodied-reasoning) model plans and
  a VLA executes; a "Motion Transfer" mechanism enables cross-embodiment learning. [arXiv:2510.03342](https://arxiv.org/abs/2510.03342)
- **Isaac GR00T N1** (NVIDIA) — first *open* humanoid robot foundation model; dual-system
  VLA (VLM reasoning + diffusion-transformer action). [arXiv:2503.14734](https://arxiv.org/abs/2503.14734)
- **Helix** (Figure AI) — System 1/System 2 VLA for generalist humanoid control. [Figure](https://www.figure.ai/news/helix)
- **Skild Brain** (Skild AI) — an "omni-bodied" single model claimed to control quadrupeds,
  humanoids, arms, and mobile manipulators (raised ~$1.4B at >$14B). [Businesswire](https://www.businesswire.com/news/home/20260114335623/en/Skild-AI-Raises-$1.4B-Now-Valued-Over-$14B)

## State of research

**Best-performing now:** **Dual-system VLAs** (slow VLM/ER planner + fast diffusion/flow
action head) are the convergent, best-performing design across every major lab. Flow-
matching action generation and cross-embodiment transfer are the working techniques.

**Promising but unproven:** **Open-world generalization** (operating in genuinely unseen
homes/tasks) and RL-based self-improvement from real-world experience (RECAP) are the
exciting frontier — demonstrated, but not yet robust or reliable.

**Open problems & weaknesses:** **Data scarcity** is the defining constraint — there's no
internet-scale corpus of robot actions, forcing reliance on teleoperation, human video, and
simulation (linking to [world models](world-models-and-video.md) for synthetic experience).
Reliability/safety for real deployment is far from solved; long-horizon dexterous tasks
still fail often. Sim-to-real gaps persist. Evaluation is non-standardized and hardware-
dependent.
