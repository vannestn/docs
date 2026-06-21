# The AI Research Map (mid-2026)

A structured, citation-backed map of the field of AI research as of **June 2026** —
spanning established directions, frontier-lab programs, the global lab ecosystem,
small startups and independent collectives, and genuinely nascent research
directions.

This is organized as a **directory tree**: each top-level area is a folder, and each
research direction within it is its own document with concrete papers, labs, and
URLs. Start here, then drill into whichever branch interests you.

> **Scope & method.** Compiled from a fan-out of parallel web-research passes over
> arXiv, lab blogs, technical reports, and institute publications from **late 2025
> through mid-2026**. Each leaf document lists the responsible org, the paper/source,
> and a link. See [`00-overview/methodology-and-sources.md`](00-overview/methodology-and-sources.md)
> for how this was built and its known reliability caveats (some 2026 figures rest on
> secondary coverage and are flagged inline).

---

## How the map is organized

**Start here:** [Landscape overview](00-overview/landscape-overview.md) ·
[State-of-research scorecard](00-overview/state-of-research-scorecard.md) (what's working /
unproven, per area) · [Compute & memory footprint](00-overview/compute-and-memory-footprint.md)
(laptop vs. datacenter, per area) · [Plain-language glossary](00-overview/glossary.md) ·
[Methodology & caveats](00-overview/methodology-and-sources.md)

| # | Area | What's inside |
|---|------|---------------|
| **00** | [Overview](00-overview/) | Landscape, **scorecard**, **glossary**, methodology |
| **01** | [Foundation Models & Capabilities](01-foundation-models-and-capabilities/) | Reasoning, agents, multimodal, long context & memory |
| **02** | [Architectures & Training](02-architectures-and-training/) | Post-transformer architectures, diffusion LMs, MoE/sparsity, efficiency, training methods, scaling laws & theory |
| **03** | [Alignment, Interpretability & Safety](03-alignment-interpretability-safety/) | Mech-interp, scheming/control, model organisms, scalable oversight, robustness |
| **04** | [Reinforcement Learning & Open-Endedness](04-reinforcement-learning-and-open-endedness/) | RL for reasoning, open-ended discovery, continual learning, self-improvement |
| **05** | [AI for Science](05-ai-for-science/) | Biology/proteins, materials/chemistry, mathematics, weather/physics/climate |
| **06** | [Robotics & World Models](06-robotics-and-world-models/) | Embodied AI / VLAs, world models & interactive video |
| **07** | [Data, Systems & Hardware](07-data-systems-hardware/) | Data-centric AI, training/inference systems, AI hardware & neuromorphic |
| **08** | [Evaluation & Governance](08-evaluation-and-governance/) | Science of evals, safety institutes, economics & forecasting |
| **09** | [Global Lab Ecosystem](09-global-lab-ecosystem/) | US frontier, Chinese labs, European & sovereign, open-source & decentralized |
| **10** | [Startups & Nascent Fields](10-startups-and-nascent-fields/) | Emerging labs and newly-forming research directions |
| **11** | [Emerging Application Subfields](11-emerging-application-subfields/) | AI-for-SWE, RAG/memory, multi-agent systems, domain applications |
| **12** | [Politics, Capital & Business Models](12-politics-capital-and-business-models/) | VC funding, business models, geopolitics, export controls, power/energy |
| **13** | [Fairness, Ethics & Human Factors](13-fairness-ethics-and-human-factors/) | Bias/fairness, human-AI interaction, model welfare |
| **14** | [Beyond-LLM ML & Other Modalities](14-beyond-llm-ml-and-modalities/) | Time-series/tabular/graph, recsys, speech/audio, retrieval, quantum/federated |
| **15** | [Research Methods & How Systems Are Built](15-research-methods-and-how-systems-are-built/) | Build pipelines and their limitations (LLMs, agents, science models, interp/alignment) |

### How to read each document

Every leaf document follows the same shape so you can compare areas:
- **Key directions & work** — the concrete techniques, with the lab, the paper, and a link.
- **State of research** — *Best-performing now* (proven SOTA) / *Promising but unproven* /
  *Open problems & weaknesses*. This is the analytical "where does it actually stand" view.
- **📦 Concept boxes** — plain-language definitions so the map teaches, not just lists.
  Acronyms are expanded on first use; the [glossary](00-overview/glossary.md) is the master
  reference.

---

## The 60-second version

The field in mid-2026 is being reshaped by a handful of intersecting shifts:

1. **From scaling parameters to scaling compute *at inference*.** Reasoning models that
   "think" before answering (RL with verifiable rewards, process reward models,
   parallel hypothesis search) are the dominant frontier story. See
   [reasoning](01-foundation-models-and-capabilities/reasoning-and-test-time-compute.md).
2. **Agents became the product *and* a research field.** Computer-use, long-horizon
   autonomy (30+ hour coding runs), and multi-agent orchestration now have their own
   benchmarks, training recipes, and failure modes. See
   [agents](01-foundation-models-and-capabilities/agents-and-tool-use.md).
3. **The transformer monopoly is cracking — slowly.** State-space/hybrid models,
   diffusion language models, trainable sparse attention, and test-time-training memory
   layers are all in production or near it. See
   [architectures](02-architectures-and-training/).
4. **Alignment turned empirical.** Mechanistic interpretability (attribution graphs),
   model organisms of misalignment, scheming/control evals, and third-party
   institute evaluations matured into a real experimental science. See
   [alignment](03-alignment-interpretability-safety/).
5. **AI-for-science crossed from benchmarks to discovery.** Open Erdős problems,
   AI-designed drug candidates heading to trials, virtual-cell models, and autonomous
   "science factory" labs. See [AI for science](05-ai-for-science/).
6. **World models / spatial intelligence emerged as a distinct frontier.** Interactive
   generated worlds, video-as-simulation, and JEPA-style predictive models. See
   [world models](06-robotics-and-world-models/world-models-and-video.md).
7. **The ecosystem globalized and fragmented.** Chinese open-weight labs drove
   architectural innovation; a wave of well-funded small labs (SSI, Thinking Machines,
   World Labs, Periodic, Lila) bet on post-scaling research. See
   [global ecosystem](09-global-lab-ecosystem/) and [startups](10-startups-and-nascent-fields/).

---

*Last updated: 2026-06-21.*
