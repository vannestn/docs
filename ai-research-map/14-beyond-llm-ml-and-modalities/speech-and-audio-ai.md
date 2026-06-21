# Speech & Audio AI

Recognition, understanding, dialogue, music, and the codecs underneath — a field rapidly
merging with LLMs.

## Key directions & work

### Speech recognition (ASR)
- **Canary-Qwen-2.5B** (NVIDIA) — open-weight ASR SOTA (~5.63% English WER) by fusing a speech
  encoder to an *unmodified LLM decoder* — blurring "ASR model" vs "audio LLM." [arXiv:2510.06961](https://arxiv.org/abs/2510.06961)
- **Omnilingual ASR** (Meta) — extends ASR to 1,600+ trained / ~5,400 zero-shot languages
  (500+ never served before), reframing "add a language" as few-shot prompting. [arXiv:2511.09690](https://arxiv.org/abs/2511.09690)

### Full-duplex spoken dialogue
- **Moshi / Hibiki / Unmute** (Kyutai) — the reference *open* full-duplex stack (~200ms),
  modeling user + model audio as parallel streams; "Delayed Streams Modeling" lets any text LLM
  gain real-time voice. [arXiv:2410.00037](https://arxiv.org/abs/2410.00037)
- **Native-audio frontier** (Gemini 2.5 Native Audio, GPT Realtime) — abandons the
  STT→LLM→TTS cascade for a single audio pass, enabling prosody/emotion awareness.

### Audio-language models (understanding)
- **Step-Audio 2** (StepFun) and **Audio Flamingo 3** (NVIDIA) — open audio LLMs with reasoning,
  tool use, and (Step) RAG. [Step-Audio 2 arXiv:2507.16632](https://arxiv.org/abs/2507.16632)
- **Audio reasoning still lags** — on MMAR, Gemini 2.0 Flash (~65.6%) leads the best open model
  by ~9 points; both trail text reasoning badly.

### Codecs & music
- **Low-frame-rate semantic codecs** (Mimi 12.5Hz, DualCodec) are the quiet enabler of cheaper
  audio LLMs — fewer tokens/second. [DualCodec arXiv:2505.13000](https://arxiv.org/abs/2505.13000)
- **Music:** Suno (~$300M ARR) leads commercially; open frontier is ACE-Step/YuE. Licensing
  shifted (Warner/UMG deals with Suno/Udio).
- **State-space audio** (Cartesia Sonic) proves Mamba-style models power production real-time
  speech (40–90ms). See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

## State of research

**Best-performing now:** LLM-decoder ASR (Canary-Qwen); native end-to-end dialogue
(Gemini/GPT Realtime, Moshi); low-frame-rate semantic codecs; full-song music generation is
effectively commodity.

**Promising but unproven:** audio *reasoning*, robust full-duplex turn-taking/barge-in,
open audio LLMs closing the gap to closed.

**Open problems & weaknesses:** audio reasoning lags text by a wide margin (and open lags
closed); turn-taking/overlap handling is unsolved; very-low-frame-rate codecs degrade quality;
deepfake-voice **provenance/watermarking** is in an arms race with cloning realism.
