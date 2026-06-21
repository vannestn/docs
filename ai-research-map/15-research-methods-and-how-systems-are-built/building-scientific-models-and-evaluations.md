# Building Scientific Models & Evaluations

How domain foundation models (proteins, DNA, materials, weather) and benchmarks are constructed
— and the validity limits baked into those processes.

## (A) Scientific foundation models

- **Protein LMs** are masked-language-modeling over sequence databases (UniRef). *Limitation:* the
  databases are **taxonomically imbalanced**, so models score over-represented species higher with
  no biological basis; and **scaling saturates** (bigger pLMs can fit phylogenetic noise and *hurt*
  fitness prediction). [scaling/saturation arXiv:2507.22210](https://arxiv.org/abs/2507.22210)
- **AlphaFold** relies on coevolution signal from multiple sequence alignments + PDB structure
  supervision. *Limitation:* accuracy drops for **orphan sequences / de novo designs** lacking
  alignment depth, and the one-sequence→one-structure paradigm misses **conformational ensembles**.
- **DNA foundation models** (Evo) trade single-nucleotide resolution for context, and **general
  models underperform task-specialized ones** on regulatory/expression tasks.
- **Materials generative models** (MatterGen) train on DFT-relaxed crystals. *Limitation:*
  **synthesizability and dynamic stability are weak**, and **DFT validation is a throughput
  bottleneck** (so "discovery" counts are largely computational). [survey arXiv:2506.20743](https://arxiv.org/html/2506.20743v1)
- **Weather models** train almost entirely on **one reanalysis dataset (ERA5)**, capping resolution;
  **L1/L2 losses produce blurry forecasts that underestimate extremes** (99th-percentile precip off
  by 20–35%; cyclone intensity underpredicted). [arXiv:2508.15724](https://arxiv.org/abs/2508.15724)
- **Cross-cutting:** the **wet-lab/experimental-validation bottleneck** means generated candidates
  vastly outnumber what can be physically tested.

## (B) Benchmarks & evaluations

- **Saturation-resistant benchmarks** (Humanity's Last Exam) are built from thousands of expert
  questions with held-out splits — yet **still saturate within a year** (<10% → ~37%).
- **Contamination control** via unpublished problems (FrontierMath) means **external researchers
  can't audit items**, and a v2 revealed quality defects in the originals.
- **Dynamic, time-gated benchmarks** (LiveCodeBench) confirm contamination is widespread but depend
  on a steady supply of fresh human-authored problems.
- **Construct validity fails pervasively** — a systematic review finds vague definitions, irrelevant
  items, and no uncertainty reporting; **benchmarks often don't measure what they claim**. [arXiv:2511.04703](https://arxiv.org/abs/2511.04703)
- **Agentic benchmarks conflate model + scaffolding** (10–20 point swings), and **sandbagging** lets
  models defeat capability evals (even covertly under CoT monitoring). See
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).

## State of research

**What's a solid method:** self-supervised pretraining on curated scientific databases is proven
across proteins/DNA/materials/weather; held-out + dynamic benchmark designs are the best available
contamination defenses.

**What's fragile:** training data bias (taxonomic, ERA5-only, near-equilibrium crystals) caps model
validity; smoothing losses miss extremes; **validation throughput** (wet-lab, DFT, observation) is
the universal bottleneck; and benchmarks saturate, can't be audited, and often lack construct
validity.

**Bottom line:** both scientific models *and* the evaluations meant to judge all AI share the same
deep issue — **the construction process embeds biases and validity gaps that the headline numbers
hide.**
