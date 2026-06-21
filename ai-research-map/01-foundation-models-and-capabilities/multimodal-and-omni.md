# Multimodal & Omni Models

The move toward models that natively perceive and/or generate across text, image, audio,
and video — increasingly in a single "any-to-any" architecture with streaming I/O.

## Native multimodality at the frontier
- **Gemini 2.5** — natively multimodal with a >1M-token context (2M announced); can process
  up to ~3 hours of video in one context, or ~6 hours at the API's "low" media-resolution
  setting with a 2M-token context. Google DeepMind describes the 2.X series as the first
  models to use audio-visual information seamlessly alongside code and other formats.
  [arXiv:2507.06261](https://arxiv.org/abs/2507.06261) ·
  [technical report PDF](https://storage.googleapis.com/deepmind-media/gemini/gemini_v2_5_report.pdf)

## Omni / any-to-any architectures
- **Qwen3-Omni** (Alibaba) — single end-to-end model perceiving text/image/audio/video and
  streaming speech via a **Thinker–Talker** design, with both modules upgraded to **MoE**
  (Thinker **30B-A3B**, Talker **3B-A0.3B**). Five key upgrades over Qwen2.5-Omni: (1) MoE
  Thinker + Talker; (2) a from-scratch **AuT** audio encoder (~0.6B, trained on 20M hours)
  replacing Whisper; (3) block-wise window attention for streaming-prefill caching; (4) a
  **Thinking** variant for full-modality reasoning; (5) a lightweight **Code2Wav** causal
  ConvNet replacing block-wise DiT, with input/output codec at **12.5 Hz** for single-frame
  synthesis. Talker uses a **multi-codebook** scheme (linear head for codebook 0, an MTP
  module for residual codebooks). Reaches a **theoretical end-to-end first-packet latency of
  234 ms** in cold-start, single-concurrency settings. Covers 119 text languages, 19 speech-
  input, 10 speech-output. Across **36 audio / audio-visual benchmarks** it claims open-source
  SOTA on **32** and overall SOTA on **22**, outperforming Gemini-2.5-Pro, Seed-ASR and
  GPT-4o-Transcribe; text/vision performance matches same-size single-modal Qwen counterparts
  (the paper's central "no modality trade-off" claim). Apache-2.0.
  [arXiv:2509.17765](https://arxiv.org/abs/2509.17765)
- **Unified understanding-and-generation** is a consolidating direction — architectures
  that couple per-modality encoders/decoders to a shared backbone for any-to-any tasks. A
  2026 survey (Zhao et al., Alibaba) taxonomizes ~200 unified models into three paradigms —
  **diffusion-based**, **autoregressive** (further split by image-token strategy:
  pixel / semantic / learnable-query / hybrid encoding), and **fused AR+diffusion** — and
  flags tokenization strategy, cross-modal attention, and data as the open challenges; it
  notes AR generation quality still lags diffusion.
  Survey: [arXiv:2505.02567](https://arxiv.org/abs/2505.02567)

## Streaming speech / real-time voice
- **Kyutai Moshi + Mimi** (open science) — a 7B speech-text foundation model. The **Helium**
  text backbone (7B, pretrained on 2.1T tokens) is extended to model audio via the **Mimi**
  streaming neural codec (RVQ at **12.5 Hz**, **1.1 kbps**, Q=8 with a *split* RVQ: one
  semantic VQ distilled from WavLM + 7 parallel acoustic levels). The **Inner Monologue**
  trick predicts time-aligned text tokens as a prefix to audio tokens, which both improves
  linguistic quality and lets streaming ASR/TTS be derived from the same model. Multi-stream
  modeling (user + system as parallel autoregressive streams) removes explicit speaker turns,
  enabling **full-duplex** dialogue with overlap and interruptions — claimed as the first
  real-time full-duplex spoken LLM. **Theoretical latency 160 ms, ~200 ms in practice.**
  [arXiv:2410.00037](https://arxiv.org/abs/2410.00037)
- **Cartesia Sonic** — state-space-model TTS (S4/Mamba lineage) advertised at ~40 ms
  time-to-first-audio for the Turbo tier and <100 ms for the standard model. ⚠️ unverified:
  the earlier "topped the Speech Arena in 2026" claim — Cartesia's own pages cite TTFA
  figures, not an Arena ranking. See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).
  [Cartesia Sonic](https://cartesia.ai/sonic)

## Vision-language at scale
- **Seed1.5-VL** (ByteDance) — **532M** vision encoder (Seed-ViT, native-resolution, 2D RoPE)
  + a **20B-active MoE** LLM. Despite the compact size it claims SOTA on **38 of 60** public
  benchmarks (21/34 vision-language, 14/19 video, 3/7 GUI-agent), and on agent-centric GUI /
  gameplay tasks beats OpenAI CUA and Claude 3.7. Pre-trained on 3T multimodal tokens; video
  uses *dynamic frame-resolution sampling* with timestamp tokens. Deployed as
  `doubao-1-5-thinking-vision-pro`. Author-stated weaknesses: 3D spatial imagination,
  fine-grained counting / combinatorial search, and knowledge-prior hallucination.
  [arXiv:2505.07062](https://arxiv.org/abs/2505.07062)
- **GLM-4.5V** (Zhipu / Tsinghua, GLM-V team) — a **106B-total / 12B-active MoE** VLM built on
  GLM-4.5-Air, trained with **RLCS (Reinforcement Learning with Curriculum Sampling)** on a
  strong pre-trained base. Claims SOTA across **42 public benchmarks** among comparable-size
  open-source models and is competitive with closed Gemini-2.5-Flash; the sibling
  GLM-4.1V-9B-Thinking beats the much larger Qwen2.5-VL-72B on 29 benchmarks. Supports both
  "thinking" and "non-thinking" modes (`/nothink`), native tool use, 128K context. The paper
  argues a robust, hack-resistant reward verifier in *every* domain is critical — a single
  weak verifier can collapse multi-domain RL training.
  [arXiv:2507.01006](https://arxiv.org/abs/2507.01006)

## Tokenizer-free / byte-level
- **Byte Latent Transformer** (Meta FAIR, Dec 2024) — no tokenizer; dynamically sizes byte
  "patches" by **next-byte entropy** from a small byte-level LM (global threshold or
  approximate-monotonicity constraint). Architecture = lightweight local encoder + large
  latent transformer + lightweight local decoder, tied by cross-attention and hash n-gram
  embeddings. First FLOP-controlled byte-level scaling study to **8B params / 4T training
  bytes**, matching Llama-3 training-FLOP parity while using **up to ~50% fewer inference
  FLOPs** via longer patches (patch size 6–8 vs Llama-3's ~4.4-byte tokens). On the 8B / 1T-
  token BLT-1T run, **BLT-Entropy beats Llama-3 on 4 of 7 tasks (avg 61.1 vs 60.0)**, plus
  qualitative gains on noise-robustness and character-level / orthographic tasks. Unlocks a
  new scaling axis — grow model *and* patch size at fixed inference FLOPs.
  [arXiv:2412.09871](https://arxiv.org/abs/2412.09871)

## Generative media
Image/video/audio generation has become its own startup-dense ecosystem (FLUX.2, Sora 2,
Veo 3, Suno/Udio, Runway). Image/video models increasingly bleed into **world models** —
see [06 · World models & video](../06-robotics-and-world-models/world-models-and-video.md)
and [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

## State of research

**Best-performing now:** Natively-multimodal frontier models (Gemini 2.5) lead on
understanding across text/image/audio/long video. Thinker–Talker omni designs (Qwen3-Omni)
and streaming-codec voice (Moshi/Mimi) are the proven real-time-speech approaches; both now
converge on ~12.5 Hz discrete codecs and ~200 ms first-packet latency.

**Promising but unproven:** *Unified* understanding-and-generation in one model (still ~200
catalogued architectures with no settled tokenization/encoding recipe), any-to-any
generation, and tokenizer-free (byte-level) models at frontier scale.

**Open problems & weaknesses:**
- **Unified generators still trail specialists.** The survey notes AR-based generation lags
  diffusion on image quality, and image tokenization / cross-modal attention remain unsettled.
- **Deep cross-modal reasoning is weak.** VLM reports concede failures on 3D spatial
  imagination, fine-grained counting, and combinatorial search (Seed1.5-VL); long-video
  understanding is bottlenecked by positional extrapolation and context length (Qwen3-Omni).
- **Multimodal RL is brittle.** GLM-4.5V shows a single weak per-domain reward verifier can
  collapse training across all domains.
- **Evaluation of multimodal reasoning is immature**, and high-quality paired multimodal data
  is scarce (a data-quality constraint — see
  [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md)).
