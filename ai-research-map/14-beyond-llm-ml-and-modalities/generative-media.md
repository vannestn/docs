# Generative Media

## In brief
- **What it is** — Research on generating images, video, 3D scenes, and creative audio from a
  prompt. It runs in parallel to text LLMs and shares the same core recipe — scale up a Transformer
  on a "denoising" objective — but has its own architecture lineage, its own tricks for making
  generation fast, and a famously broken way of measuring quality. The dominant method starts from
  pure random noise and repeatedly cleans it up until a coherent picture emerges (see the diffusion
  / flow concept box below).
- **Why it's pursued** — Text alone can't cover how people actually create and communicate: design,
  film, games, product mockups, and 3D worlds all need visual and audio synthesis. The goal is
  models that turn a plain-language description into a high-quality, controllable image, clip, or
  scene — fast enough to be usable and faithful enough to match the request.
- **Potential impact** — If it succeeds, producing professional-grade visual media becomes as easy
  as writing a sentence, reshaping the creative-tools market and the economics of content. The key
  open weakness is measurement: the field's standard quality metric (FID) is provably misaligned
  with human judgment, so "progress" is hard to trust — alongside real risks around licensing and
  training-data provenance.

> **📦 Concept: "diffusion / flow"** — generate by starting from pure noise and iteratively
> denoising toward a sample. *Diffusion* learns to reverse a noising process; *flow matching* /
> *rectified flow* learns a velocity field that transports noise to data, ideally along straight
> lines (fewer, larger steps).

## Key directions & work

### Architecture: U-Net → Diffusion Transformer (DiT)
- **DiT** replaced the convolutional U-Net backbone of latent diffusion with a plain Transformer
  operating on latent patches, conditioning via adaptive layer-norm (adaLN-zero). Crucially it
  *inherits Transformer scaling*: more Gflops (depth/width or more tokens) → monotonically lower
  FID, with **DiT-XL/2** reaching SOTA **2.27 FID** on class-conditional ImageNet 256×256.
  [arXiv:2212.09748](https://arxiv.org/abs/2212.09748) (Peebles & Xie, ICCV 2023). This is now the
  default text-to-image/video backbone (SD3, and broadly the video generators in
  [../06-robotics-and-world-models/world-models-and-video.md](../06-robotics-and-world-models/world-models-and-video.md)).

### Rectified flow & the move off DDPM training
- **Rectified-flow Transformers (Stable Diffusion 3 / MM-DiT)** — connects data and noise on a
  *straight line* and trains a velocity field, which the authors argue has better theoretical
  properties and conceptual simplicity than curved DDPM trajectories. The **MM-DiT** architecture
  uses *separate weights per modality* (image vs. text tokens) with bidirectional attention between
  them, improving typography and prompt comprehension; the largest models beat prior SOTA on human
  preference. [arXiv:2403.03206](https://arxiv.org/abs/2403.03206) (Esser et al., 2024). The broader
  flow-matching vs. masked-diffusion framing lives in
  [../02-architectures-and-training/diffusion-and-non-autoregressive-lms.md](../02-architectures-and-training/diffusion-and-non-autoregressive-lms.md).

### Few-step / one-step generation (distillation)
- **Consistency models** map noise directly to data, enabling *one-step* sampling by design (and
  optional multi-step to trade compute for quality). Trained by distilling a diffusion teacher or
  standalone; SOTA-at-the-time **3.55 FID** (CIFAR-10) and **6.20 FID** (ImageNet 64×64) in a single
  step. [arXiv:2303.01469](https://arxiv.org/abs/2303.01469) (Song et al., ICML 2023).
- **Flow Map Matching** generalizes and unifies consistency models, consistency-trajectory models,
  and progressive distillation under one *flow-map* objective (learn the map between two times on a
  probability-flow trajectory), reporting 10–20× faster generation at comparable quality.
  [arXiv:2406.07507](https://arxiv.org/abs/2406.07507).
- **Align Your Flow (AYF)** introduces continuous-time flow-map distillation objectives that
  subsume both consistency and flow-matching losses, claiming SOTA few-step generation on ImageNet
  64×64 and 512×512 with small networks. [arXiv:2506.14603](https://arxiv.org/abs/2506.14603).

### Autoregressive vs. diffusion for images
- **Visual Autoregressive modeling (VAR)** reframes AR image generation as coarse-to-fine
  *next-scale prediction* (predict the next-resolution token map) instead of raster-scan
  next-token. This made GPT-style AR models *surpass DiT* on ImageNet 256×256 for the first time —
  **1.73 FID** (vs. an AR baseline's 18.65), with ~20× faster inference — and recovered
  power-law scaling. [arXiv:2404.02905](https://arxiv.org/abs/2404.02905) (NeurIPS 2024 best paper).
- **JanusFlow** harmonizes an autoregressive LLM with rectified flow in *one* model, showing
  rectified flow can be trained directly inside the LLM framework with no exotic architecture
  changes; it decouples the understanding vs. generation encoders and aligns their representations,
  reaching parity-or-better with specialized models while beating prior unified models.
  [arXiv:2411.07975](https://arxiv.org/abs/2411.07975) (CVPR 2025). The AR-vs-diffusion question for
  images is now genuinely open, with hybrids in the lead for *unified* understanding+generation.

### 3D generation: NeRF → Gaussian splatting
- **3D Gaussian Splatting (3DGS)** represents a scene as a cloud of anisotropic 3D Gaussians and
  rasterizes them with a fast, visibility-aware splatting algorithm — achieving real-time (≥30 fps)
  novel-view synthesis at 1080p with quality competitive with the best neural radiance fields, while
  training far faster than the slow volumetric ray-marching of **NeRF**.
  [arXiv:2308.04079](https://arxiv.org/abs/2308.04079) (Kerbl et al., SIGGRAPH 2023). 3DGS has since
  largely displaced NeRF as the working representation for reconstruction; *generating* 3DGS scenes
  from text/images (feed-forward and diffusion-prior approaches) is the active generative frontier.

### Controllability
- **ControlNet** adds spatial conditioning (edges, depth, pose, segmentation) to a frozen
  pretrained text-to-image model by cloning its encoder and connecting it with *zero-initialized
  convolutions*, so fine-tuning starts as a no-op and adds no harmful noise — robust on datasets
  from <50k to >1M examples. [arXiv:2302.05543](https://arxiv.org/abs/2302.05543) (Zhang et al.,
  ICCV 2023). It established the dominant pattern for spatial control without retraining the base.

## The evaluation problem (the field's soft underbelly)

Generative-media progress is bottlenecked by metrics that don't measure what we care about:

- **FID is unreliable for modern models.** "Rethinking FID" demonstrates FID *contradicts human
  raters*, **fails to reflect the gradual improvement** of iterative text-to-image models, makes an
  **incorrect Gaussian-normality assumption** on features, gives **inconsistent results as sample
  size varies**, and inherits the limits of Inception features (trained on ~1M images / 1000 classes,
  a poor basis for today's rich generations). They propose **CMMD** (CLIP features + MMD, no
  distributional assumption). [arXiv:2401.09603](https://arxiv.org/abs/2401.09603) (Jayasumana et al.,
  CVPR 2024).
- **Quality vs. text-faithfulness are measured separately and poorly.** FID captures image quality
  but *ignores* the text condition, while CLIPScore is insensitive to visual quality — neither
  jointly measures fidelity *and* prompt alignment, hence weak correlation with human judgment.
  Conditional Fréchet Distance (**cFreD**) is one attempt to score both at once.
  [arXiv:2503.21721](https://arxiv.org/abs/2503.21721).

## State of research

**Best-performing now:** DiT / rectified-flow Transformers (MM-DiT, SD3-lineage) as the default
backbone for image and video; distilled few-step samplers (consistency / flow-map) for fast or
real-time generation; **3D Gaussian Splatting** for real-time 3D reconstruction; ControlNet-style
adapters for spatial control.

**Promising but unproven:** unified AR+flow models (JanusFlow) and next-scale AR (VAR) challenging
diffusion's monopoly; feed-forward / diffusion-prior **generative 3D** (text→3DGS); flow-map
distillation pushing genuine *one*-step generation at high resolution without quality collapse.

**Open problems & weaknesses:** evaluation is immature — **FID is provably misaligned with humans**
and with prompt faithfulness, and there is still no agreed single metric (CMMD, cFreD, human-pref
models all partial); few-step distillation trades diversity/quality for speed in hard-to-quantify
ways; controllability and 3D/video generation lack standard benchmarks at all. The economics of
generative media (licensing, training-data provenance, the creative-tools market) sit in
[../12-politics-capital-and-business-models/business-models.md](../12-politics-capital-and-business-models/business-models.md).
