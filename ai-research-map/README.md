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

## Read-first overview docs (`00-overview/`)

| Doc | What it gives you |
|-----|-------------------|
| [**Synthesis**](00-overview/synthesis.md) | The whole field as one narrative argument — read this first |
| [Landscape overview](00-overview/landscape-overview.md) | The cross-cutting meta-trends |
| [State-of-research scorecard](00-overview/state-of-research-scorecard.md) | What's working / promising / unproven, per area |
| [Solo-researcher agenda](00-overview/solo-researcher-research-agenda.md) | Open gaps a lone, API-budget researcher can actually move — with designed methods |
| [Compute & memory footprint](00-overview/compute-and-memory-footprint.md) | Laptop vs. datacenter, per area |
| [Glossary](00-overview/glossary.md) | Plain-language definitions of every acronym |
| [Source index](00-overview/source-index.md) | Full deduplicated bibliography (291 URLs) |
| [Verification checklist](00-overview/verification-checklist.md) | Load-bearing claims that need a manual source check |
| [Methodology & caveats](00-overview/methodology-and-sources.md) | How the map was built and its limits |

## The 16 branches, grouped into five parts

**Part I · Capabilities** — what models can *do*
| # | Branch | Inside |
|---|--------|--------|
| **01** | [Foundation Models & Capabilities](01-foundation-models-and-capabilities/) | Reasoning, agents, multimodal, long context & memory, multilingual |
| **06** | [Robotics & World Models](06-robotics-and-world-models/) | Embodied AI / VLAs, world models & interactive video |

**Part II · Foundations & Methods** — how they're built
| # | Branch | Inside |
|---|--------|--------|
| **02** | [Architectures & Training](02-architectures-and-training/) | Post-transformer, diffusion LMs, MoE, efficiency, training, scaling laws |
| **04** | [Reinforcement Learning & Open-Endedness](04-reinforcement-learning-and-open-endedness/) | RL for reasoning, open-ended discovery, continual learning, self-improvement |
| **07** | [Data, Systems & Hardware](07-data-systems-hardware/) | Data-centric AI, training/inference systems, hardware, energy & sustainability |
| **15** | [Research Methods & How Systems Are Built](15-research-methods-and-how-systems-are-built/) | Build pipelines and their **limitations** (LLMs, agents, science models, interp/alignment) |

**Part III · Safety, Evaluation & Society** — is it trustworthy?
| # | Branch | Inside |
|---|--------|--------|
| **03** | [Alignment, Interpretability & Safety](03-alignment-interpretability-safety/) | Mech-interp, scheming/control, model organisms, scalable oversight, robustness |
| **08** | [Evaluation & Governance](08-evaluation-and-governance/) | Science of evals, safety institutes, economics & forecasting |
| **13** | [Fairness, Ethics & Human Factors](13-fairness-ethics-and-human-factors/) | Bias/fairness, human-AI interaction, model welfare |

**Part IV · Applications, Science & Other Modalities** — what it's used for
| # | Branch | Inside |
|---|--------|--------|
| **05** | [AI for Science](05-ai-for-science/) | Biology, materials, math, weather, fusion, astronomy, chip design, neuro, drug clinical |
| **11** | [Emerging Application Subfields](11-emerging-application-subfields/) | AI-for-SWE, RAG/memory, multi-agent, cybersecurity, law & finance |
| **14** | [Beyond-LLM ML & Other Modalities](14-beyond-llm-ml-and-modalities/) | Generative media, time-series/tabular/graph, recsys, speech/audio, retrieval, quantum/federated |

**Part V · The Ecosystem** — who builds it, and the forces around them
| # | Branch | Inside |
|---|--------|--------|
| **09** | [Global Lab Ecosystem](09-global-lab-ecosystem/) | US frontier, Chinese, European & sovereign, open-source, academic labs |
| **10** | [Startups & Nascent Fields](10-startups-and-nascent-fields/) | Emerging labs and newly-forming research directions |
| **12** | [Politics, Capital & Business Models](12-politics-capital-and-business-models/) | VC funding, business models, geopolitics, export controls, power |

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
