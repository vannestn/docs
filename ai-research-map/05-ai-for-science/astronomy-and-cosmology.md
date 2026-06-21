# Astronomy & Cosmology

Foundation models for astronomical surveys, and machine-learning inference for cosmology.

## Key directions & work

- **AION-1** (Polymathic AI / Flatiron) — a billion-parameter *omnimodal* astronomy foundation
  model pretrained on ~200M+ observations across five surveys and 39 data modalities; one frozen
  encoder handles redshift, morphology, segmentation, spectral super-resolution. ~2× prior SOTA
  on photometric redshift. [arXiv:2510.17960](https://arxiv.org/abs/2510.17960)
- **AstroCLIP** — the prior cross-modal SOTA, aligning galaxy spectra and images. [MNRAS](https://academic.oup.com/mnras/article/531/4/4990/7697182)
- **Simulation-based inference (SBI)** — now used for frontier cosmology (e.g., DES Year-3 wCDM
  via persistent homology) and for **exoplanet atmospheric retrieval** in seconds (neural
  posterior estimation / normalizing flows) instead of long MCMC runs.

  > **📦 Concept: simulation-based inference** — when you can *simulate* data but can't write
  > down a likelihood, train a neural network to infer parameters by learning from many
  > simulations. Fast, but only as good as the simulator.

## State of research

**Best-performing now:** astronomy foundation models (AION-1) beat task-specific baselines on
core survey tasks; SBI with normalizing flows is a proven *speed* win for retrieval and is used
in real cosmology analyses.

**Promising but unproven:** robustness of these models on *next-generation* survey data
(Rubin/LSST, Euclid); how many simulations SBI truly needs for robust constraints.

**Open problems & weaknesses:** **simulator misspecification** (the "simulation gap") — SBI is
only as trustworthy as the simulator matches reality. Generalization to unseen instruments and
rare/extreme objects is unproven.
