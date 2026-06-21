# Multimodal & Omni Models

The move toward models that natively perceive and/or generate across text, image, audio,
and video — increasingly in a single "any-to-any" architecture with streaming I/O.

## Native multimodality at the frontier
- **Gemini 2.5** — natively multimodal with >1M-token context; can process up to ~3 hours
  of video in a single context. Google DeepMind —
  [technical report](https://storage.googleapis.com/deepmind-media/gemini/gemini_v2_5_report.pdf)

## Omni / any-to-any architectures
- **Qwen3-Omni** (Alibaba) — end-to-end omni model perceiving text/image/audio/video and
  streaming speech via a **Thinker–Talker** design, with both modules upgraded to MoE.
  [arXiv:2509.17765](https://arxiv.org/html/2509.17765v1)
- **Unified understanding-and-generation** is a consolidating direction — architectures
  that couple per-modality encoders/decoders to a shared backbone for any-to-any tasks.
  Survey: [arXiv:2505.02567](https://arxiv.org/pdf/2505.02567)

## Streaming speech / real-time voice
- **Kyutai Moshi + Mimi** (open science) — a speech-text foundation model with a streaming
  neural codec achieving ~200ms practical full-duplex voice latency; the **Unmute**
  pipeline gives any text LLM low-latency streaming speech I/O. [arXiv:2410.00037](https://arxiv.org/html/2410.00037v2)
- **Cartesia Sonic** — state-space-model TTS (S4/Mamba lineage) with 40–90ms time-to-first-
  audio; topped the Speech Arena in 2026. See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

## Vision-language at scale
- **Seed1.5-VL** (ByteDance) — 532M vision encoder + 20B-active MoE LLM; SOTA on 38 of 60
  public benchmarks. [arXiv:2505.07062](https://arxiv.org/abs/2505.07062)
- **GLM-4.5V** (Zhipu) — vision-language reasoning trained with scalable RL.
  [arXiv:2507.01006](https://arxiv.org/html/2507.01006v5)

## Tokenizer-free / byte-level
- **Byte Latent Transformer** (Meta FAIR) — no tokenizer; dynamically sizes byte "patches"
  by next-byte entropy. First FLOP-controlled byte-level scaling study to 8B / 4T bytes,
  showing patches scale better than tokens at fixed inference cost. [arXiv:2412.09871](https://arxiv.org/pdf/2412.09871)

## Generative media
Image/video/audio generation has become its own startup-dense ecosystem (FLUX.2, Sora 2,
Veo 3, Suno/Udio, Runway). Image/video models increasingly bleed into **world models** —
see [06 · World models & video](../06-robotics-and-world-models/world-models-and-video.md)
and [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

## State of research

**Best-performing now:** Natively-multimodal frontier models (Gemini) lead on understanding
across text/image/audio/long video. Thinker–Talker omni designs and streaming-codec voice
(Kyutai) are the proven real-time-speech approaches.

**Promising but unproven:** *Unified* understanding-and-generation in one model, any-to-any
generation, and tokenizer-free (byte-level) models at frontier scale.

**Open problems & weaknesses:** Unified models still trail specialist generators on quality.
Deep cross-modal reasoning (not just captioning) is weak; audio/video understanding lags text.
Evaluation of multimodal reasoning is immature, and high-quality paired multimodal data is
scarce (a data-quality constraint — see
[07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md)).
