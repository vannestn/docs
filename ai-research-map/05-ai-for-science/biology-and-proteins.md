# Biology & Proteins

The most mature AI-for-science domain, spanning structure prediction, protein/DNA design, and
the emerging frontier of whole-cell models.

## Key directions & work

### Structure & binding (beyond AlphaFold)
- **Isomorphic Labs IsoDDE** (Isomorphic Drug Design Engine) — reports ~50% accuracy on the
  hardest protein-ligand cases vs AlphaFold 3's 23.3%; first human trials (oncology) targeted
  by end of 2026 after a $2.1B Series B. [Isomorphic](https://www.isomorphiclabs.com/articles/the-isomorphic-labs-drug-design-engine-unlocks-a-new-frontier) *[secondary specifics — verify]*
- **Boltz-2** (MIT) — first *open* model to approach FEP (free-energy perturbation) accuracy on
  binding affinity at ~1000× lower cost; MIT-licensed. [bioRxiv](https://www.biorxiv.org/content/10.1101/2025.06.14.659707v1)

### Protein language / generative models
- **ESM3 / ESM C** (EvolutionaryScale) — frontier multimodal generative protein language model
  spanning sequence, structure, and function; ESM3 published in *Science*. [Science](https://www.science.org/doi/10.1126/science.ads0018)
- **ProGen3** (Profluent) — up to 46B params, "scaling laws" for protein design; released
  OpenAntibodies. [bioRxiv](https://www.biorxiv.org/content/10.1101/2025.04.15.649055v1)

### DNA & genomics
- **Evo 2** (Arc Institute + NVIDIA) — 40B DNA foundation model trained on 9.3T base pairs
  across 128k+ species; ~90% accuracy on BRCA1 variant classification; published in *Nature*.
  [Arc](https://arcinstitute.org/news/evo2)

### Virtual cell models (the emerging frontier)
- **STATE** (Arc Institute) — virtual cell model trained on ~170M observational + >100M
  perturbational cells; +50% perturbation-discrimination improvement. [bioRxiv](https://www.biorxiv.org/content/10.1101/2025.06.26.661135v1)
- **CZI + NVIDIA** — petabyte-scale virtual-cell-model partnership; CZI shipped
  TranscriptFormer, scGenePT. [CZI](https://chanzuckerberg.com/newsroom/nvidia-partnership-virtual-cell-model/)

## State of research

**Best-performing now:** Structure prediction is *mature* — AF3-class and open successors
(Boltz-2, Chai-1, ESM C) are reliable tools used daily. Protein/DNA language models are
solid and increasingly open-weight.

**Promising but unproven:** **Virtual cell models** are the exciting frontier, but still early —
predicting how cells respond to perturbation is far harder than predicting static structure, and
validation is difficult. AI-designed drugs reaching *clinical trials* will be the real test of
generative design.

**Open problems & weaknesses:** Predicting *function and dynamics* (not just structure)
remains hard. Wet-lab validation throughput is the bottleneck — hence the autonomous-lab
push ([materials & chemistry](materials-and-chemistry.md)). Data is biased toward
well-studied proteins/cell types. The absolute frontier (Isomorphic) is closed, limiting
external scrutiny.
