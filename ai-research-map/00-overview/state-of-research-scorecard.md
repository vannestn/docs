# State-of-Research Scorecard

A cross-field, at-a-glance read on **maturity, what's winning, and what's open** as of
mid-2026. Every leaf document in this map carries a detailed **"State of research"** block
(Best-performing now / Promising but unproven / Open problems & weaknesses); this page
aggregates them into one comparative view.

**Maturity legend**
- 🟢 **Mature** — deployed at the frontier, clear SOTA methods, diminishing fundamental surprises.
- 🟡 **Consolidating** — works in production but methods still churning; real open questions.
- 🟠 **Emerging** — promising results, not yet proven at scale or contested empirically.
- 🔴 **Nascent / unproven** — early signal, largely untested, high uncertainty.

## The scorecard

| Area | Maturity | Best-performing approach now | Biggest open avenue / weakness |
|------|:--------:|------------------------------|--------------------------------|
| [Reasoning / test-time compute](../01-foundation-models-and-capabilities/reasoning-and-test-time-compute.md) | 🟢→🟡 | RLVR (GRPO-lineage) + reasoning models; parallel "deep think" | Does RL *expand* or only *sharpen*? Entropy collapse; verifier quality |
| [Agents & tool use](../01-foundation-models-and-capabilities/agents-and-tool-use.md) | 🟡 | Tool-use-RL'd frontier models + orchestrator-worker scaffolds | Long-horizon reliability; credit assignment; safety/sabotage |
| [Multimodal / omni](../01-foundation-models-and-capabilities/multimodal-and-omni.md) | 🟡 | Native-multimodal frontier (Gemini), Thinker–Talker omni | Unified understanding+generation still weaker than specialists |
| [Long context & memory](../01-foundation-models-and-capabilities/long-context-and-memory.md) | 🟡 | Trainable sparse / linear-attention hybrids to 1M+ | Long context ≠ durable memory; retrieval-over-context gap |
| [Post-transformer architectures](../02-architectures-and-training/post-transformer-architectures.md) | 🟡 | Hybrid SSM/linear-attn + full-attn (3:1-ish) + MoE | Pure subquadratic still trails on recall/in-context tasks |
| [Diffusion language models](../02-architectures-and-training/diffusion-and-non-autoregressive-lms.md) | 🟠 | Block/semi-AR diffusion w/ KV-cache (Mercury, LLaDA-MoE) | Quality parity at the frontier unproven; ecosystem immature |
| [MoE & sparsity](../02-architectures-and-training/mixture-of-experts-and-sparsity.md) | 🟢 | Ultra-sparse MoE (few-of-many experts) + global load balancing | Routing stability, expert specialization, fault tolerance |
| [Efficiency / quantization / inference](../02-architectures-and-training/efficiency-quantization-and-inference.md) | 🟢 | FP8/FP4 training, KV-cache quant, speculative decoding | Lossless low-bit at long context; memory wall |
| [Training methods / optimizers](../02-architectures-and-training/training-methods-and-rl.md) | 🟡 | AdamW; **Muon** rising at trillion-token scale | Self-improvement without collapse; data efficiency |
| [Scaling laws & theory](../02-architectures-and-training/scaling-laws-and-theory.md) | 🟡 | Empirical scaling/efficiency laws (Epoch); distillation laws | Theory of feature-learning generalization still incomplete |
| [Mechanistic interpretability](../03-alignment-interpretability-safety/mechanistic-interpretability.md) | 🟡 | Cross-layer transcoders + attribution graphs; hosted SAE APIs | Faithfulness/completeness of explanations; scaling to behavior |
| [Scheming / control / evals](../03-alignment-interpretability-safety/scheming-control-and-evaluations.md) | 🟠 | Deliberative alignment; control evals (SHADE, BashArena) | Eval-awareness confounds; sandbagging; no guarantees |
| [Model organisms of misalignment](../03-alignment-interpretability-safety/model-organisms-of-misalignment.md) | 🟠 | Reward-hack→misalignment demos; inoculation prompting | Generalization to real deployments; mechanistic account |
| [Scalable oversight / RLHF successors](../03-alignment-interpretability-safety/scalable-oversight-and-rlhf-successors.md) | 🟡 | Constitutional/RLAIF, process supervision, MONA, debate | Oversight of superhuman tasks remains unsolved |
| [Robustness / jailbreaks](../03-alignment-interpretability-safety/robustness-and-jailbreaks.md) | 🟡 | Constitutional Classifiers (cascades + probes) | Agentic guardrails lag chat; universal jailbreaks transfer |
| [RL for reasoning](../04-reinforcement-learning-and-open-endedness/rl-for-reasoning.md) | 🟡 | GRPO/RLVR + entropy controls; verifiable rewards | "Ceiling" debate; reward hacking; exploration |
| [Open-endedness / self-improvement](../04-reinforcement-learning-and-open-endedness/open-endedness-and-self-improvement.md) | 🟠→🔴 | Evolutionary code-agent self-edit (DGM, AlphaEvolve) | Genuine open-ended novelty; safety of recursive loops |
| [Continual learning](../04-reinforcement-learning-and-open-endedness/continual-learning-and-self-improvement.md) | 🟠 | Test-time training / replay; nested-learning memory | Catastrophic forgetting; plasticity loss not solved |
| [AI for biology](../05-ai-for-science/biology-and-proteins.md) | 🟢→🟡 | AF3-class structure + protein/DNA LMs; virtual cells (emerging) | Function/dynamics prediction; wet-lab validation throughput |
| [AI for materials/chemistry](../05-ai-for-science/materials-and-chemistry.md) | 🟡 | Generative (MatterGen) + universal potentials (MatterSim) | Synthesizability; closing the autonomous-lab loop |
| [AI for mathematics](../05-ai-for-science/mathematics.md) | 🟠 | LLM + Lean proof-search agents (AlphaProof line) | Autoformalization at scale; long-horizon proofs |
| [Weather / physics / climate](../05-ai-for-science/weather-physics-and-climate.md) | 🟢 | Diffusion/GenCast & graph forecasters beating NWP | General PDE "physics foundation models" still early |
| [Embodied AI / VLAs](../06-robotics-and-world-models/embodied-ai-and-vlas.md) | 🟠 | Dual-system VLAs (slow VLM + fast action) | Open-world generalization; data scarcity; reliability |
| [World models / video](../06-robotics-and-world-models/world-models-and-video.md) | 🟠 | Interactive generated worlds (Genie 3) + video-as-sim | Long-horizon consistency, memory, true physics |
| [Data-centric AI](../07-data-systems-hardware/data-centric-ai.md) | 🟡 | Synthetic data + aggressive curation; data attribution | The "data wall"; provenance; model collapse risk |
| [Systems & infrastructure](../07-data-systems-hardware/systems-and-infrastructure.md) | 🟢 | Disaggregated serving, FP8, paged KV-cache | Long-context serving economics; decentralized training |
| [Hardware & neuromorphic](../07-data-systems-hardware/hardware-and-neuromorphic.md) | 🟢 (GPU) / 🔴 (neuro) | NVIDIA Blackwell/Rubin, TPU, inference ASICs | Neuromorphic/analog/optical largely pre-commercial |
| [Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md) | 🟡 | Dynamic / contamination-resistant benchmarks; ECI aggregate | Benchmarks saturate in ~1yr; sandbagging undermines validity |
| [Governance & institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md) | 🟡 | Institute evals + EU AI Act/GPAI Code; pre-deployment access | Voluntary frameworks capture ≤⅓ of recommended practice |
| [Economics & forecasting](../08-evaluation-and-governance/economics-and-forecasting.md) | 🟡 | METR time-horizons; Epoch trends; Anthropic Econ Index | Augmentation-vs-automation; timelines contested |

## How to read this

- **🟢 areas** are where you'd *bet on the known SOTA* — but "mature" means fast-moving, not
  finished (MoE routing, low-bit training, and serving all still have live research).
- **🟠/🔴 areas** are where the *highest-variance research bets* sit — open-endedness,
  diffusion LMs, world models, neuromorphic hardware, and autoformalization could each
  reshape the field or stall.
- The **"biggest open avenue"** column is deliberately the *weakness/uncertainty*, not the
  hype — it's where continued research is most clearly needed.

Each linked leaf expands these into concrete papers, labs, and the specific empirical
disputes behind the rating.

For the **hardware/compute** view of these same areas — what runs on a laptop vs. needs a
datacenter, and where the cheap proof-of-concept paths are — see
[Compute & memory footprint](compute-and-memory-footprint.md).
