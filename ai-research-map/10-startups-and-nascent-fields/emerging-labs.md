# Emerging Labs

Newer/smaller labs and what each is actually researching. (Funding details and the business-
model lens are in [12 · Business models](../12-politics-capital-and-business-models/business-models.md).)

## "Post-scaling research era" labs
- **Safe Superintelligence (SSI)** — Ilya Sutskever; **~$3B raised total** ($1B Sept 2024 + $2B
  April 2025) at a **~$32B valuation**, **zero papers/products**, betting that *algorithmic*
  breakthroughs (not scale) drive the next leap. Sutskever became CEO after co-founder Daniel
  Gross left for Meta (June 2025). [TechCrunch](https://techcrunch.com/2025/04/12/openai-co-founder-ilya-sutskevers-safe-superintelligence-reportedly-valued-at-32b/)
- **Thinking Machines Lab** — Mira Murati; ~$2B seed at ~$12B (July 2025). First shipped product
  is **Tinker**, a managed fine-tuning API (Oct 2025); separately previewed **"interaction
  models"** (research preview `TML-Interaction-Small`, a 276B-param MoE with 12B active) for
  real-time, continuous audio/video/text collaboration on ~200ms micro-turns. A $50B raise
  reportedly stalled in early 2026. [coverage](https://www.marktechpost.com/2026/05/13/mira-muratis-thinking-machines-lab-introduces-interaction-models-a-native-multimodal-architecture-for-real-time-human-ai-collaboration/)
- **Reflection AI** — aiming to be a Western open-weight frontier lab (an "American DeepSeek");
  founders Misha Laskin (ex-DeepMind Gemini) and Ioannis Antonoglou (AlphaGo co-creator). **~$2B
  raised at ~$8B** (Oct 2025, Nvidia-led). [TechCrunch](https://techcrunch.com/2025/10/09/reflection-raises-2b-to-be-americas-open-frontier-ai-lab-challenging-deepseek/)
- **AMI Labs** — Yann LeCun's new Paris-based lab (Saining Xie as chief science officer)
  pursuing **JEPA / world models** (predict-in-representation-space, not generate pixels);
  **~$1B seed at ~$3.5B pre-money** (March 2026), among the largest seed rounds on record. See
  [06 · World models](../06-robotics-and-world-models/world-models-and-video.md). [TechCrunch](https://techcrunch.com/2026/03/09/yann-lecuns-ami-labs-raises-1-03-billion-to-build-world-models/)

## Alternative architectures

### Inception Labs — diffusion LLMs (Mercury)
**Mercury Coder**, presented as the first commercial-scale diffusion LLM family for code.
Mechanism: a *Transformer* denoiser (not autoregressive) refines all tokens in parallel
"coarse-to-fine," extending masked-diffusion ([Lou et al.](https://arxiv.org/abs/2310.16834))
to trillions-of-tokens scale, trained on NVIDIA H100s. Two sizes (**Mini**, **Small**), 32,768
context (128k with extension), OpenAI-compatible API → drop-in for AR models.

Results (Table 1, pass@1; speed = output tokens/sec on H100, per Artificial Analysis):
- **Throughput**: Mercury Coder Mini **1109 tok/s**, Small **737 tok/s** — vs ~27–201 tok/s for
  AR baselines; the paper's headline is "up to **10×** faster than speed-optimized frontier LLMs."
- **Quality**: Small scores HumanEval 90.0 / MBPP 76.6 / EvalPlus 80.4 / MultiPL-E 76.2,
  roughly matching Claude 3.5 Haiku and GPT-4o on these coding benchmarks; Mini trades ~2 pts of
  quality for >8× the speed of open-weight models.
- **Fill-in-the-middle**: Mercury reports SOTA on FIM single-line / random-span-light (Small avg
  **84.8**), surpassing Codestral 2501.
- **Human eval**: on **Copilot Arena**, Mercury Coder Mini is *tied for 2nd* on quality (Elo 993)
  while being the **fastest** model — ~25 ms latency, ~4× faster than GPT-4o Mini.

⚠️ Caveats the paper itself flags: speed numbers are third-party (Artificial Analysis) on a
*proprietary* inference engine + custom kernels, measured Feb 2025 with ~1k in / 1k out tokens;
training data and exact architecture are not disclosed. [arXiv:2506.17298](https://arxiv.org/abs/2506.17298)

### Liquid AI — edge-first hybrid models (LFM2)
**LFM2**, a family of *on-device* foundation models. The thesis is **edge-first**: a
hardware-in-the-loop architecture search over the quality–latency–memory Pareto frontier
(profiling on a real Snapdragon 8 Gen 3 phone + AMD Ryzen HX 370 laptop, ExecuTorch/llama.cpp).
The search keeps converging on a **minimal hybrid** — mostly **gated short convolution** blocks
with a *small minority* of grouped-query-attention (GQA) blocks — and finds that adding SSM /
linear-attention / extra-conv operators *did not* improve quality at equal device budgets.

Lineup: dense **350M / 700M / 1.2B / 2.6B** plus an MoE **LFM2-8B-A1B** (8.3B total, 1.5B active,
32 experts top-4), all 32K context. Pre-trained on **10–12T tokens** via a *tempered, decoupled
Top-K distillation* objective (teacher = internal LFM1-7B) that splits the KL into an untempered
Bernoulli "mass" term + a tempered conditional Top-K term to avoid support mismatch; then a
three-stage post-training (SFT → length-normalized preference alignment → model merging).

Results the paper reports (internal harness, may differ from others):
- **Speed (CPU, batch 1)**: up to **~2×** faster prefill + decode vs similarly-sized baselines.
  On the S25 phone, LFM2-1.2B does ~222 tok/s prefill @4K vs ~130 (Llama-3.2-1B); on the Ryzen
  laptop, LFM2-350M hits **7,534 tok/s** prefill @1K.
- **Quality**: LFM2-2.6B reaches **79.56% IFEval** and **82.41% GSM8K** (Table 7); LFM2-1.2B
  (74.89 IFEval) surpasses the 30%-larger Qwen3-1.7B on instruction following. LFM2-8B-A1B
  claims "3–4B-class" quality at ~1.5B active decode cost.
- **Variants**: **LFM2-VL** (SigLIP2 encoder, tunable vision-token budget), **LFM2-Audio-1.5B**
  (separates continuous audio *input* from discrete Mimi-RVQ *output*; competitive with the >3×
  larger Qwen2.5-Omni-3B on VoiceBench), and **LFM2-ColBERT-350M** late-interaction retriever
  (matches a 149M-param baseline's throughput; mean NDCG@10 0.661 on NanoBEIR).

⚠️ Author-stated limits: tuned for *batch-1 CPU/mobile* (8da4w / Q4_0) — no claim of optimality
on server batches or specific accelerators; small models are inherently capacity-limited and
weakest on open-ended/long-context reasoning; LFM2-Audio is English-dominant and untested on
non-speech audio. [arXiv:2511.23404](https://arxiv.org/abs/2511.23404)

### Cartesia — state-space-model audio (Sonic)
**Sonic** real-time voice models built on **state-space models** (SSMs), the S4/Mamba line its
founders created at Stanford (Albert Gu, Karan Goel, Chris Ré et al.); SSMs give low latency,
long-context efficiency, and on-device viability. **Sonic-3.5** took #1 on the Artificial
Analysis Speech Arena (May 2026); ~$191M raised total. [Cartesia](https://www.cartesia.ai/launch/)

## World models / spatial intelligence
- **World Labs** (Fei-Fei Li) — **Marble** (text/image/video/3D-layout → navigable, persistent,
  editable 3D worlds; commercial launch Feb 2026) + **RTFM** persistent worlds; **~$1.23B raised
  total** (~$230M seed 2024 + $1B round Feb 2026, incl. $200M from Autodesk), in talks at ~$5B.
  [RTFM](https://www.worldlabs.ai/blog/rtfm) · [TechCrunch](https://techcrunch.com/2026/02/18/world-labs-lands-200m-from-autodesk-to-bring-world-models-into-3d-workflows/)
- **Decart** — **Oasis 3** real-time interactive world model (photorealistic driving sim via
  API, ~$0.02/sec); ~$300M raised at ~$4B. [TechCrunch](https://techcrunch.com/2026/06/10/decarts-new-world-model-can-simulate-hours-of-photorealistic-driving-with-some-caveats/)

## Robotics
- **Physical Intelligence** — open-sourced **π0** (`openpi`); a VLM backbone + **flow-matching**
  action head trained on the largest robot-interaction dataset to date (incl. Open X-Embodiment).
  [pi](https://www.pi.website/blog/pi0)
- **Skild AI** — "omni-bodied" robot foundation model ("Skild Brain"); **~$1.4B Series C at >$14B**
  (Jan 2026, SoftBank-led). [Robot Report](https://www.therobotreport.com/skild-ai-raises-1-4b-building-omni-bodied-robot-skild-brain/)

## Autonomous science
- **Periodic Labs** — autonomous AI + robotic labs for materials/physics (founders ex-OpenAI/
  DeepMind, incl. William Fedus); **~$300M seed** (a16z-led, Sept 2025), starting with
  higher-temperature superconductors. [TechCrunch](https://techcrunch.com/2025/09/30/former-openai-and-deepmind-researchers-raise-whopping-300m-seed-to-automate-science/)
- **Lila Sciences** — autonomous "scientific superintelligence" labs (Flagship Pioneering;
  George Church as chief scientist); **$235M Series A** (Sept 2025), **~$550M raised total** at
  >$1.3B after an Oct 2025 extension. [HPCwire](https://www.hpcwire.com/2025/09/15/lila-sciences-nabs-235-million-to-build-scientific-superintelligence/)
- **Sakana AI** — the **AI Scientist** and self-improvement (Darwin Gödel Machine, RSI Lab).

## Interpretability
- **Goodfire** — **Ember**, a hosted interpretability platform (sparse-autoencoder features as
  a service for inspecting/steering models like Llama 3.1 8B); **$50M Series A** (Menlo-led,
  April 2025) that was **Anthropic's first-ever startup investment**. [Goodfire](https://www.goodfire.ai/blog/announcing-goodfire-ember)

## Generative media
- **Black Forest Labs** (image), **Runway / Luma / Pika** (video, pivoting toward world
  models), **Suno / Udio** (music, amid major-label licensing battles).

## Self-improvement / open-endedness
- **Recursive Superintelligence** — Richard Socher (CEO) with Rocktäschel / Clune / Yuandong
  Tian and others; **$650M at $4.65B** (out of stealth May 2026, GV/Nvidia/AMD-backed) for
  recursive self-improvement, targeting a "Level 1" autonomous training system. See
  [04 · Open-endedness](../04-reinforcement-learning-and-open-endedness/open-endedness-and-self-improvement.md). [TNW](https://thenextweb.com/news/recursive-superintelligence-self-improving-ai-funding)

## State of research

**Best-performing now:** The *focused* labs with shipping products — Inception (diffusion
LMs), Liquid AI (edge models), Cartesia (audio), World Labs (3D worlds), Physical Intelligence
(robots), Goodfire (interp) — have concrete, *third-party-evaluable* results. Notably, both
Mercury and LFM2 lean on independent evals (Artificial Analysis, Copilot Arena, NanoBEIR) rather
than self-reported numbers alone, and both stake out a defensible niche frontier labs underserve:
**latency** (diffusion's parallel decode; LFM2's batch-1 CPU/mobile budget) rather than raw
capability.

**Promising but unproven:** The *stealth mega-funded* labs (SSI, Thinking Machines, Reflection,
AMI, Recursive) are bets on talent and a research thesis. Output is starting to leak — Thinking
Machines shipped Tinker and an interaction-models *research preview* — but there is still little
shipped product to evaluate against the valuations.

**Open problems & weaknesses:**
- **Valuations vastly exceed demonstrated results** for the research-era labs — SSI (~$32B, zero
  products), Thinking Machines (a $50B raise *stalled*), AMI (~$3.5B pre-money seed). The thesis
  that *algorithmic* breakthroughs (not scale) drive the next leap is unproven.
- **Single-capability defensibility.** Even the focused labs' wins are narrow and contested: the
  Mercury and LFM2 papers both caveat that their headline numbers are *budget-specific* (Mercury's
  speed needs a proprietary engine + custom kernels; LFM2's 2× speedup is batch-1 CPU only and
  not claimed optimal on servers/accelerators). A capability advantage tied to one deployment
  regime is a thin moat.
- **Compute asymmetry.** Most compete directly with frontier labs that have far more compute —
  and several of the same backers (Nvidia, a16z, Lightspeed) fund both sides.
