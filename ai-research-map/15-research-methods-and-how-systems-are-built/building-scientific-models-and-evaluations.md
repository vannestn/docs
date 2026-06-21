# Building Scientific Models & Evaluations

How domain foundation models (proteins, DNA, materials, weather) and benchmarks are constructed
— and the validity limits baked into those processes.

## (A) Scientific foundation models

- **Protein LMs** pretrain self-supervised on sequence databases (UniRef). *Limitation:* "more data"
  does **not** reliably buy fitness-prediction skill. Testing 14 AMPLIFY-120M models pretrained on
  yearly UniRef100 snapshots (2011→2024) against ProteinGym variant-effect data, zero-shot Spearman
  correlation **fluctuates non-monotonically** and shows a sustained *drop* from 2018–2021 despite
  billions of added sequences — **no data saturation is reached**, and biological data is "redundant,
  noisy, and sparse." Adding a ridge-regression head on experimental labels jumps best-year
  correlation from ~0.38 (zero-shot) to ~0.52 (10% train) / ~0.675 (80% train); one well-characterized
  experimental dataset can match a *decade* of extra pretraining data, and low-MSA-depth proteins
  actually get *worse* with later (larger) snapshots. [arXiv:2507.22210](https://arxiv.org/abs/2507.22210)
- **AlphaFold** relies on coevolution signal from multiple sequence alignments + PDB structure
  supervision. *Limitation:* accuracy drops for **orphan sequences / de novo designs** lacking
  alignment depth, and the one-sequence→one-structure paradigm misses **conformational ensembles**.
  *(Not drawn from the papers on disk — treat as background.)*
- **DNA foundation models** (Evo) trade single-nucleotide resolution for context, and **general
  models underperform task-specialized ones** on regulatory/expression tasks.
  *(Not drawn from the papers on disk — treat as background.)*
- **Materials generative models** train on DFT-relaxed crystals. GNoME used graph-network ensembles
  + active-learning DFT validation to discover **>2.2 M stable structures** (~45,000 new crystal
  prototypes); MatterSim/MACE-MP-0 are machine-learned interatomic potentials trained on **~17 M
  DFT-labeled configurations**. *Limitation (author-stated):* **synthesizability, dynamic stability,
  and real-world feasibility remain weak** (MatterGen "cannot guarantee experimental feasibility");
  long-range interactions (electrostatics, magnetism) are poorly modeled; training data
  over-represents **stable, equilibrium-phase inorganic oxides** and under-represents alloys,
  amorphous/soft/bio materials; DFT validation is the throughput bottleneck (so "discovery" counts
  are largely computational). Autonomous lab **A-Lab synthesized 41 of 58 targets (71%) over 17
  days** — a concrete read on the experimental gap. [survey arXiv:2506.20743](https://arxiv.org/abs/2506.20743)
- **Weather models** train almost entirely on **one reanalysis dataset (ERA5, 1979–2017)**, so
  forecasts of **record-breaking extremes** sit out-of-distribution. On 2020 records (162,751 heat /
  32,991 cold / 53,345 wind), the physical NWP model **HRES (ECMWF) consistently beats GraphCast,
  Pangu-Weather, and FuXi** on record-breaking 2m-temperature and 10m-wind RMSE across nearly all
  lead times — even though those same AI models *beat* HRES on all-events (non-record) skill. AI
  models **underestimate both the intensity and the frequency of records** (forecast bias grows
  roughly linearly with record exceedance, an implicit "soft cap" near the most extreme training
  value), underpredict hot/wind records and overpredict cold records, and the bias is consistent
  across 2018 and 2020 and across regions — a **structural extrapolation problem**, since the models
  enforce no physical laws. [arXiv:2508.15724](https://arxiv.org/abs/2508.15724)
- **Cross-cutting:** the **wet-lab/experimental-validation bottleneck** means generated candidates
  vastly outnumber what can be physically tested — and where labels *are* available (protein fitness,
  DFT), they are scarce, biased, and the dominant lever on real model performance.

## (B) Benchmarks & evaluations

- **Saturation-resistant benchmarks** (Humanity's Last Exam) are built from thousands of expert
  questions with held-out splits — yet **saturate fast**: top models scored <10% in early 2025
  (e.g. o1 8.8%, Claude 3.7 Sonnet Thinking 8.9%) and reached ~32% tool-free SOTA by mid-2025 (~44%
  with code + web tools). [Scale leaderboard](https://scale.com/leaderboard/humanitys_last_exam)
- **Contamination control** via unpublished problems (FrontierMath) means **external researchers
  can't audit items** — OpenAI funded Tiers 1–4 and holds exclusive access to ~80% — and **v2
  (June 2026) found small-but-critical errors in ~42% of the original problems** (135 corrected, 12
  removed), invalidating prior absolute scores. [Epoch AI](https://epoch.ai/benchmarks/frontiermath)
- **Dynamic, time-gated benchmarks** (LiveCodeBench) confirm contamination is widespread but depend
  on a steady supply of fresh human-authored problems.
  *(Not drawn from the papers on disk — treat as background.)*
- **Construct validity fails pervasively.** A systematic review of **445 LLM benchmarks** from ICML/
  ICLR/NeurIPS/ACL/NAACL/EMNLP (46,114-article corpus → 522 → 445, coded by **29 expert reviewers**)
  finds nearly every benchmark has at least one validity weakness: only **78.2% even define their
  target phenomenon**, and of those **47.8% use contested definitions**; **27% rely on convenience
  sampling**; **only 16.0% report any statistical test / uncertainty estimate**; and just **53.4%
  argue their benchmark is a valid measure** of what it claims. The authors issue **8 actionable
  recommendations** (define the phenomenon, measure *only* it, build a representative dataset,
  acknowledge dataset reuse, prepare for contamination, use statistics, run error analysis, justify
  construct validity). [arXiv:2511.04703](https://arxiv.org/abs/2511.04703)
- **Agentic benchmarks conflate model + scaffolding** (10–20 point swings), and **sandbagging** lets
  models defeat capability evals (even covertly under CoT monitoring). See
  [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).

## State of research

**What's a solid method:** self-supervised pretraining on curated scientific databases is proven
across proteins/DNA/materials/weather; held-out + dynamic benchmark designs are the best available
contamination defenses; and a small amount of *experimental* supervision often beats large amounts
of extra pretraining (protein fitness: ridge head on labels ≫ a decade more UniRef).

**What's fragile:** training-data bias (taxonomic/MSA-depth imbalance in proteins, ERA5-only weather,
equilibrium-oxide-skewed crystals) caps model validity; **scaling is not monotonic** for downstream
scientific tasks (protein-fitness skill fluctuates and can drop with more data); purely data-driven
models **extrapolate poorly out-of-distribution** (AI weather models lose to physical NWP on
record-breaking extremes); **validation throughput** (wet-lab, DFT, observation) is the universal
bottleneck; and benchmarks saturate, can't be audited, and overwhelmingly lack reported statistics
and construct validity (only 16% report uncertainty; ~half justify validity).

**Bottom line:** both scientific models *and* the evaluations meant to judge all AI share the same
deep issue — **the construction process embeds biases and validity gaps that the headline numbers
hide.**
