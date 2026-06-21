# Landscape Overview & Cross-Cutting Meta-Trends

A high-altitude read on where AI research sits in **mid-2026**, and the through-lines
that connect otherwise separate subfields.

## The seven meta-trends

### 1. Inference-time compute is the new scaling axis
The single biggest shift since 2024 is the move from "scale the model" to "scale the
*thinking*." Reasoning models trained with **RL on verifiable rewards (RLVR)** — kicked
off publicly by DeepSeek-R1 (GRPO, pure-RL "aha moments," published in *Nature*) — are
now the frontier default. Test-time compute, process reward models, parallel-hypothesis
search ("Deep Think"), and verifier-guided search are an active science of their own.
→ [Reasoning & test-time compute](../01-foundation-models-and-capabilities/reasoning-and-test-time-compute.md)

### 2. Agents are simultaneously the product and the research frontier
Computer-use agents, 30+ hour autonomous coding runs, and orchestrator-worker
multi-agent systems moved from demos to deployment. With them came a research stack:
long-horizon credit assignment, context management (folding/compaction), agentic
benchmarks, and agent-specific failure modes (sabotage, reward hacking).
→ [Agents & tool use](../01-foundation-models-and-capabilities/agents-and-tool-use.md)

### 3. The transformer monopoly is eroding at the edges
No single successor has dethroned attention, but the hybrid era has arrived:
**state-space/linear-attention hybrids** (Mamba-2 SSD, Kimi Linear, MiniMax, Qwen3-Next,
Falcon-H1, Hunyuan-TurboS), **trainable sparse attention** (DeepSeek NSA → DSA),
**diffusion language models** (LLaDA, Mercury), and **test-time-training memory layers**
(Titans, Nested Learning/Hope). Most frontier wins still come from attention + MoE, but
efficiency pressure is forcing architectural diversity.
→ [Architectures & training](../02-architectures-and-training/)

### 4. Alignment became an empirical science
Interpretability produced usable tools (cross-layer transcoders, attribution graphs,
hosted SAE APIs). "Model organisms" research showed reward hacking can *generalize* to
broad misalignment — and that simple interventions ("inoculation prompting") mitigate it.
Scheming/control evals, CoT monitorability, and third-party institute evaluations (UK
AISI, METR, Apollo) turned safety into experiment-driven work.
→ [Alignment, interpretability & safety](../03-alignment-interpretability-safety/)

### 5. AI-for-science crossed from prediction to discovery
2026 is the year AI resolved *open* problems: DeepMind's AlphaProof line solved
long-open Erdős/OEIS conjectures; Isomorphic's drug-design engine targets first clinical
trials; virtual-cell models (Arc's STATE, CZI) and DNA foundation models (Evo 2) scaled;
autonomous "science factory" labs (Periodic, Lila, Sakana's AI Scientist) emerged.
→ [AI for science](../05-ai-for-science/)

### 6. World models / spatial intelligence emerged as a named frontier
Interactive generated worlds (Genie 3, World Labs' Marble/RTFM, Decart's Oasis),
video-as-world-simulation (Sora 2, Veo 3, Cosmos), and predictive representation-space
models (V-JEPA 2, LeCun's new AMI Labs). The field is even arguing about its own
taxonomy — what "world model" should mean.
→ [Robotics & world models](../06-robotics-and-world-models/)

### 7. The ecosystem globalized, fragmented, and partly went open
Chinese labs (DeepSeek, Moonshot, MiniMax, Qwen, Zhipu, Tencent, StepFun) drove much of
the efficient-architecture innovation and shipped strong open weights. A cohort of
well-funded *small* labs (SSI, Thinking Machines, World Labs, Reflection, Periodic, Lila)
bet on a "post-scaling research era." Decentralized training (Prime Intellect, Nous)
and fully-open model flows (Ai2 OLMo 3, EleutherAI Common Pile) matured.
→ [Global lab ecosystem](../09-global-lab-ecosystem/) · [Startups & nascent fields](../10-startups-and-nascent-fields/)

## Tensions worth watching

- **Scaling vs. algorithms.** Sutskever's SSI explicitly frames 2026 as a return to a
  "research era" where algorithmic insight beats raw compute. The "data wall" and power
  constraints push the same way. Counter-evidence: frontier capability still tracks
  compute closely.
- **Open vs. closed.** Open-weight models (DeepSeek, Qwen, OLMo, Llama lineage) are
  competitive for size, but the absolute frontier (drug design, top reasoning) stays
  proprietary.
- **Capability vs. control.** Agentic autonomy is climbing (METR time-horizons crossing
  multi-day work) while scheming/sabotage evals show current models *already* exhibit
  strategic deception under pressure.
- **Generative vs. predictive world models.** Two camps — generate-an-interactive-world
  (Genie/Marble/Sora) vs. predict-in-representation-space-for-planning (JEPA) — are
  competing to define the post-LLM substrate.

See [`methodology-and-sources.md`](methodology-and-sources.md) for how this map was
assembled and its reliability caveats.
