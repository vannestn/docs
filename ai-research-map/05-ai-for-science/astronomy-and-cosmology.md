# Astronomy & Cosmology

Two threads converge here: foundation models that learn from astronomical surveys, and machine-learning inference that replaces slow statistical methods in cosmology.

## Key directions & work

- **AION-1** (Polymathic AI / Flatiron) — *AstronomIcal Omni-modal Network*, a family of token-based
  multimodal foundation models (Base 300M, Large 800M, XLarge 3B params) pretrained on **>200M
  observations** of stars, galaxies, and quasars across **five surveys** (HSC, DESI Legacy Imaging
  Survey, SDSS, DESI, Gaia) and **39 data modalities** — multiband images, optical/low-res spectra,
  and scalar measurements. The recipe has two stages: modality-specific **discrete tokenizers**
  (image, spectrum, scalar, scalar-field) turn each input type into tokens, which feed a single
  **transformer encoder–decoder** trained with 4M-style **multimodal masked modeling** (predict
  masked tokens from the visible ones). A single *frozen* encoder plus a lightweight probe then
  handles galaxy/stellar property estimation, morphology classification, segmentation, similarity
  retrieval, and spectral super-resolution. [arXiv:2510.17960](https://arxiv.org/abs/2510.17960) · [code](https://github.com/PolymathicAI/AION)
- **AstroCLIP** — the prior cross-modal foundation model for galaxies, aligning galaxy spectra and
  images in a shared embedding via contrastive learning. AION-1 outperforms it on galaxy property
  regression and rare-object retrieval (see results below).
  [arXiv:2310.03024](https://arxiv.org/abs/2310.03024) · [MNRAS 531, 4990](https://academic.oup.com/mnras/article/531/4/4990/7697182)
- **Simulation-based inference (SBI)** — neural posterior estimation / normalizing flows now drive
  frontier cosmology and cut **exoplanet atmospheric retrieval to seconds**, replacing the long
  MCMC / nested-sampling runs these tasks used to require.
  - *Cosmology:* DES Year-3 *w*CDM from SBI with **persistent homology on the sphere** —
    S₈ = 0.821 ± 0.018, Ω_m = 0.304 ± 0.037, ~70% tighter than two-point cosmic shear in the
    Ω_m–S₈ plane, with baryon-feedback bias < 0.3σ. [arXiv:2506.13439](https://arxiv.org/abs/2506.13439)
  - *Exoplanets:* neural posterior estimation on petitRADTRANS spectra matches MultiNest posteriors
    while cutting inference to **a few seconds**. [arXiv:2301.06575](https://arxiv.org/abs/2301.06575)

  > **📦 Concept: simulation-based inference** — when you can *simulate* data but can't write
  > down a likelihood, train a neural network to infer parameters by learning from many
  > simulations. Fast, but only as good as the simulator.

## AION-1 in depth

**Mechanism.** Diverse astronomical data is first standardized by **per-modality tokenizers** that
absorb instrument differences, then quantized into discrete codes:
- *Images* (multi-survey): bands from HSC + Legacy Survey are stacked into a fixed 9-channel tensor
  (survey-as-provenance), arcsinh-normalized, encoded by a MagViT-style ResNet autoencoder, and
  quantized with **Finite Scalar Quantization** (codebook ≈ 2¹², levels {8,5,5,5}).
- *Spectra* (DESI + SDSS): interpolated onto a shared 8704-point grid (3500–10462.4 Å @ 0.8 Å),
  encoded by a ConvNeXt-V2 backbone, quantized with a **Look-up-Free Quantizer** (codebook 1024);
  spectrum tokenizer reaches **R² = 0.994** reconstruction.
- *Scalars* (fluxes, redshift, shapes, Gaia coefficients): mapped through the empirical CDF to a
  Gaussian, then FSQ-quantized to K = 1024 bins.

Tokens from all modalities feed a transformer that learns within- and cross-modal structure via
masked-token prediction (predict held-out tokens from a sampled observed subset). Unlike 4M, AION-1
trains on **pairwise cross-survey associations** rather than requiring all modalities present at
once, and a **per-modality + per-source** embedding injects provenance so the same band from two
instruments is treated distinctly.

**Scale & training.** Three sizes follow T5 conventions: B (300M, 12+12 blocks, dim 768),
L (800M, 24+24, dim 1024), XL (3B, 24+24, dim 2048). Trained on H100s with FSDP ZeRO-2 / bf16,
input budget 256 tokens / output 128: B on 64 GPUs for 1.5 days, L on 100 GPUs for 2.5 days,
XL on 288 GPUs for 3.5 days. Note: adding the Gaia stellar set *raises* Legacy-Survey eval loss
(Figure 6) — a documented case of one modality interfering with another.

**Results (frozen encoder + small probe).**
- *Galaxy property regression* (PROVABGS, R²↑): with photometry+imaging+spectra, AION-1-L/XL reach
  **z R²≈1.00, M⋆ 0.96, sSFR 0.73**, matching or beating supervised ConvNeXt/Conv+Attention baselines
  and exceeding AstroCLIP (image R² 0.78 vs AION 0.79) and DINOv2.
- *Morphology* (Galaxy Zoo 10): **AION-1-L 87.2%** accuracy — beats EfficientNet (80.0) and DINOv2
  (71.4) with only a lightweight MLP head; within −2.4 pp of the fine-tuned ZooBot upper bound (89.6).
- *Stellar parameters* (Gaia XP + DESI, vs Zhang+24 labels): adding XP spectra yields **~15–20%
  absolute gain in [Fe/H] R²**; with DESI spectra AION matches the supervised ConvNeXt baseline.
  On APOGEE-from-XP it beats Leung & Bovy (2024) on T_eff/log g/[Fe/H] residual scatter.
- *Segmentation* (Galaxy Zoo 3D): frozen encoder + small CNN decoder beats a supervised U-Net by
  **+0.06 IoU on spiral arms, +0.04 on bars**.
- *Rare-object retrieval* (zero-shot, nDCG@10): tops AstroCLIP, Stein+21, and DINOv2 on spirals
  (0.643), mergers (0.384), and **strong lenses** (0.015, abundance < 0.1%).
- *Transfer:* a morphology classifier trained on Legacy-Survey embeddings runs **zero-shot on HSC**
  at 84–86% (survey-invariant representations), and AION generates DESI spectra from HSC images
  despite never seeing HSC↔DESI pairs (emergent transitive understanding).

**Low-data regime.** With only 10²–10³ labels, AION-1 already reaches R²≈0.5 on physical properties
and ≥80% morphology accuracy while supervised baselines remain near-zero R² / <70%; baselines need
~1 order of magnitude more data to catch up.

## State of research

**Best-performing now:** AION-1 beats or matches task-specific supervised baselines across galaxy
property estimation, morphology, segmentation, and retrieval — *with a frozen encoder and a small
probe* — and holds a large advantage in the low-data regime. SBI with normalizing flows is a proven
*speed* win for parameter retrieval and already appears in real, published cosmology analyses (DES Y3).

**Promising but unproven:** robustness on *next-generation* survey data (Rubin/LSST, Euclid);
calibration of AION-1's generative posteriors over multi-token outputs (images/spectra); how many
simulations SBI truly needs for robust constraints.

**Open problems & weaknesses (author-stated for AION-1):**
- **Discretization limits** — tokenizer quantization caps the information content captured and may
  hurt downstream precision.
- **Mis-calibrated generation** — for many-token outputs the masked-modeling sampler does not yield
  a principled joint posterior; generated spectra and images can look convincing yet be
  mis-calibrated or under-correlated across tokens. The authors recommend using AION-1 as an
  *embedding* model and recalibrating any generative use, and suggest autoregressive or diffusion
  decoders as future fixes.
- **Selection functions** — the model inherits its pretraining selection cuts (magnitude/quality
  thresholds, footprint, reciprocal cross-match), which can bias downstream predictions absent
  task-specific recalibration.
- **Naïve embedding aggregation** — mean-pooling for retrieval leaves performance on the table;
  contrastive post-training could help.

For SBI broadly: **simulator misspecification** (the "simulation gap") — inference is only as
trustworthy as the simulator is faithful to reality. Generalizing to unseen instruments and
rare/extreme objects remains the headline challenge for both foundation models and SBI.
