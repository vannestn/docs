# Speech & Audio AI

Recognition, understanding, dialogue, music, and the codecs underneath — a field rapidly
merging with LLMs.

## Key directions & work

### Speech recognition (ASR)
- **Open ASR Leaderboard** (Hugging Face + NVIDIA + Cambridge + Mistral) — a reproducible
  benchmark of **86 systems** (74 open) from 26 orgs over **12 datasets**, standardizing WER and
  inverse real-time factor (RTFx). Headline finding: **Conformer-encoder + transformer/LLM-decoder
  wins accuracy; CTC/TDT decoders win speed.** As of the March 2026 snapshot, the top open English
  models cluster tightly — NVIDIA **Canary-Qwen-2.5B** at **5.63% avg WER** (418 RTFx), trailing
  Cohere Labs Transcribe (5.42), IBM Granite Speech 4.0 1B (5.52). Throughput spans 3 orders of
  magnitude: Parakeet TDT 0.6B v2 hits **3390 RTFx** at 6.05 WER. [arXiv:2510.06961](https://arxiv.org/abs/2510.06961)
- **Canary-Qwen-2.5B** (NVIDIA) — the model that topped that leaderboard at its July-2025 release:
  a "Speech-Augmented LM" (SALM) fusing a FastConformer encoder to a **Qwen3-1.7B** decoder via
  adapters, so it doubles as an LLM that can summarize/answer-over its own transcript — blurring
  "ASR model" vs "audio LLM." [HF model card](https://huggingface.co/nvidia/canary-qwen-2.5b)
- **Omnilingual ASR** (Meta) — the largest-coverage ASR effort to date: **1,600+ languages**
  trained (500+ never previously served), built on a **wav2vec 2.0 SSL encoder scaled to 7B** plus
  an LLM-inspired decoder. Reframes "add a language" as **few-shot in-context prompting**: feeding
  ~5–10 audio↔text pairs cuts unseen-language CER from **26.3 → 14.4** (context size 10).
  Released as a family (300M / 1B / 3B / 7B). [arXiv:2511.09690](https://arxiv.org/abs/2511.09690)

### Full-duplex spoken dialogue
- **Moshi / Hibiki / Unmute** (Kyutai) — the reference *open* full-duplex stack, **~160ms
  theoretical / 200ms practical** latency. Built on the **Helium 7B** text LLM + the **Mimi**
  codec, it models user + model audio as **two parallel autoregressive streams** (no explicit
  speaker turns → native overlap/barge-in). Its **"Inner Monologue"** trick predicts time-aligned
  text tokens as a *prefix* to audio tokens, which both lifts linguistic quality and lets the same
  model derive streaming ASR and TTS. [arXiv:2410.00037](https://arxiv.org/abs/2410.00037)
- **Native-audio frontier** (Gemini 2.5 Native Audio, GPT Realtime) — abandons the
  STT→LLM→TTS cascade for a single audio pass, enabling prosody/emotion awareness.

### Audio-language models (understanding)
- **Step-Audio 2** (StepFun) — an end-to-end audio LLM (audio encoder → adaptor → LLM decoder →
  CosyVoice-2 detokenizer) trained on **~1.356T tokens / 8M hours of audio**. It bakes in
  **CoT reasoning + RL (PPO then GRPO)**, **retrieval-augmented generation**, and a novel
  **audio-search tool** that retrieves real voices to switch timbre. Reports SOTA-class results:
  **3.14% English WER / 3.08% Chinese CER** (avg), **83.09** on its own StepEval paralinguistic
  benchmark, and **78.0 avg on MMAU** (sound/speech/music) — edging Audio Flamingo 3 (73.1) and
  Gemini 2.5 Pro (71.6). [arXiv:2507.16632](https://arxiv.org/abs/2507.16632)
- **Audio Flamingo 3** (NVIDIA) — open audio LLM; the MMAU runner-up to Step-Audio 2 (73.1 avg,
  and still best on the *music* track at 73.9).
- **Audio reasoning still lags** — on the harder **MMAR** deep-reasoning benchmark, **Gemini 2.0
  Flash leads at 65.6%**, ~9 points over the best open model (Qwen2.5-Omni ~56.7%); both trail
  text reasoning, and the authors note most open LALMs score near random.
  [MMAR arXiv:2505.13032](https://arxiv.org/abs/2505.13032)

### Codecs & music
- **Low-frame-rate semantic codecs** are the quiet enabler of cheaper audio LLMs — fewer
  tokens/second. **Mimi** (Kyutai) runs at **12.5Hz / 1.1kbps** (8 RVQ levels, split-RVQ semantic
  distillation from WavLM). **DualCodec** improves on the distillation approach with **dual
  encoding** — first-layer (RVQ-1) token comes *directly* from a w2v-BERT-2.0 SSL stream, rest from
  a DAC waveform stream — cutting RVQ-1 decoded WER from **28.4% (distill) → 5.59%** at 25Hz, and
  shipping the first open-source 12.5Hz codec *with training code*. [DualCodec arXiv:2505.13000](https://arxiv.org/abs/2505.13000)
- **Music:** Suno (~$300M ARR ⚠️ unverified) leads commercially; open frontier is ACE-Step/YuE.
  Licensing shifted (Warner/UMG deals with Suno/Udio).
- **State-space audio** (Cartesia Sonic) proves Mamba-style models power production real-time
  speech (40–90ms ⚠️ unverified). See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

## State of research

**Best-performing now:** LLM-decoder ASR (Canary-Qwen and the broader Conformer+LLM cluster);
native end-to-end dialogue (Gemini/GPT Realtime, Moshi); low-frame-rate semantic codecs
(Mimi/DualCodec); full-song music generation is effectively commodity.

**Promising but unproven:** audio *reasoning* (CoT+RL in Step-Audio 2 helps but MMAR stays near
random for most); robust full-duplex turn-taking/barge-in; **zero/few-shot ASR** for the long tail
(Omnilingual's in-context path works but still trails fully-trained systems); open audio LLMs
closing the gap to closed.

**Open problems & weaknesses (what the papers actually argue):**
- **Audio reasoning lags text by a wide margin**, and open lags closed — MMAR's authors find most
  open LALMs barely beat chance. [arXiv:2505.13032](https://arxiv.org/abs/2505.13032)
- **The accuracy↔speed↔coverage frontier is a hard trade-off, not a solved one.** The Open ASR
  Leaderboard shows broadening language coverage *costs* English WER (Canary 1B→1B-v2: 4→25
  languages, WER 6.50→7.15), and TDT/CTC speed costs accuracy. Closed APIs still lead long-form
  English (domain fine-tuning suspected). [arXiv:2510.06961](https://arxiv.org/abs/2510.06961)
- **Long-tail ASR remains low-quality:** on Omnilingual's low-resource bucket (<10h), only ~36% of
  languages reach CER<10 (avg CER ~18). [arXiv:2511.09690](https://arxiv.org/abs/2511.09690)
- **Very-low-frame-rate codecs still degrade quality:** DualCodec's authors flag a residual gap
  between their 12.5Hz and 25Hz TTS. [arXiv:2505.13000](https://arxiv.org/abs/2505.13000)
- **Deepfake-voice provenance/watermarking** is in an arms race with cloning realism — and
  Step-Audio 2's audio-search-driven timbre cloning sharpens the concern.
