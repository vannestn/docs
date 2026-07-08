# European & Sovereign Labs

Europe's frontier-adjacent labs, plus the state-backed "sovereign AI" efforts building
national models. The throughline: how do you compete near the frontier without
US/China-scale compute? The answer here is mostly smarter methods and regional focus.

> **📦 Concept: "sovereign AI"** — a country building its own models/compute so it isn't
> dependent on US or Chinese providers, often for language, security, or economic reasons.

## Europe

- **Mistral AI** (France) — Europe's leading frontier lab. **Mistral Large 3** (sparse MoE,
  675B total / 41B active params, 256K context, Apache-2.0; released Dec 2025), and
  **Magistral**, Mistral's first reasoning model. Magistral Medium was trained for reasoning
  on top of Mistral Medium 3 with **RL alone** — no distillation from a teacher model — and
  this RLVR pipeline alone yielded a ~50% absolute jump on AIME-24 (pass@1) over the base
  checkpoint. [Magistral arXiv:2506.10910](https://arxiv.org/abs/2506.10910) ·
  [Mistral 3](https://mistral.ai/news/mistral-3/)
- **Black Forest Labs** (Germany) — **FLUX.2**, a leading open image-generation model: a
  **32B rectified-flow (flow-matching) transformer** paired with a **Mistral-3 24B VLM** for
  prompt/reference understanding; open-weight `[dev]` checkpoint plus a hosted `[pro]` tier.
  [BFL](https://bfl.ai/blog/flux-2)
- **Kyutai** (France) — open-science real-time speech. **Moshi**, a full-duplex (both sides
  can talk at once) speech-text foundation model built on the 7B **Helium** text LLM, with
  **Mimi** (a streaming RVQ neural audio codec) and an "Inner Monologue" scheme that predicts
  time-aligned text tokens as a prefix to audio. Theoretical latency 160ms (200ms in practice).
  [Moshi arXiv:2410.00037](https://arxiv.org/abs/2410.00037)

## Sovereign efforts

- **UAE — TII**: **Falcon-H1**, a *parallel* hybrid in which attention and Mamba-2 SSM
  (state-space model) heads run side-by-side inside each block and their outputs are
  concatenated (the attention/SSM channel split is tunable). The family spans 0.5B → 34B with
  256K context and 18 languages. The flagship **Falcon-H1-34B-Instruct** rivals or outperforms
  70B-class open models (Qwen2.5-72B, Llama-3.3-70B) at roughly half the size; the 0.5B matches
  typical 2024-era 7B models.
  [arXiv:2507.22448](https://arxiv.org/abs/2507.22448)
- **South Korea**: Naver Cloud's **HyperCLOVA X THINK** is the first reasoning model in the
  HyperCLOVA X family — pre-trained on ~6T Korean+English tokens with a Peri-LN Transformer
  (μP-scaled), then post-trained with SFT → RLVR. Korea's broader sovereign push is the **MSIT
  "Sovereign AI Foundation Model" project** (Aug 2025, ~₩530B / ~$381M), which funds five
  consortia (Naver, SK Telecom, LG — maker of **EXAONE** — NCSoft, Upstage) and **requires
  each team to open-source >50% of its models**.
  [THINK arXiv:2506.22403](https://arxiv.org/abs/2506.22403) ·
  [MSIT project](https://www.koreaherald.com/article/10546363)
- **India — IndiaAI Mission**: government-backed compute funds two tracks. **Sarvam** was
  selected to build a sovereign LLM, with a **30B** model and a **105B flagship** (128K
  context) covering all 22 official Indian languages; the IIT-Bombay-led **BharatGen** stack
  ships **Param2** (~17B text model) plus speech/document models across the same 22 languages.
  [Sarvam](https://www.sarvam.ai/blogs/indias-sovereign-llm) ·
  [BharatGen](https://bharatgen.com/)
- **Japan — Sakana AI**: evolutionary model-merging. **M2N2** ("Model Merging of Natural
  Niches", GECCO '25) evolves where models are spliced together (*merging boundaries*) rather
  than fixing the splits to layers, adds an implicit-fitness-sharing **competition** term for
  diversity, and uses an **attraction** heuristic to pair complementary parents. It can evolve
  models *from scratch* (matching CMA-ES on MNIST far more cheaply) and merges specialist LLMs
  and diffusion models — e.g. fusing a Japanese-prompt SDXL with English-prompt models for the
  best cross-lingual CLIP consistency. The bet is efficiency and evolution over brute-force
  scaling.
  [arXiv:2508.16204](https://arxiv.org/abs/2508.16204)

## Distinctive techniques (with the receipts)

- **Magistral — pure RLVR, no cold-start.** A modified GRPO recipe: the KL penalty is removed
  entirely (the policy diverges regardless, so keeping a reference-model copy isn't worth the
  compute); Clip-Higher (ε_high tuned 0.26–0.28) fights entropy collapse; group-relative
  advantage with minibatch normalization; and non-diverse groups (all-correct/all-wrong, zero
  advantage) are filtered out. A separate **language-consistency reward** (a fastText
  classifier on problem/thoughts/answer) keeps reasoning in the user's language. Magistral
  Medium reaches
  **73.6% pass@1 / 90.0% maj@64 on AIME-24** (vs 26.8/43.4 for the Mistral Medium 3 base) and
  **59.4% on LiveCodeBench v5**, all *without any distilled reasoning traces*. Ablations show
  RL on text-only data **preserves or improves** multimodal/instruction-following/function-
  calling, and that — *contradicting* DeepSeek-R1's finding — RL on a 24B model can beat
  pure distillation (SFT+RL Magistral Small > SFT-only on most benchmarks).
  [arXiv:2506.10910](https://arxiv.org/abs/2506.10910)
- **Falcon-H1 — parallel hybrid, systematically tuned.** Because attention and SSM channels
  are *concatenated* (not averaged), the team could sweep the attention/SSM/MLP channel split
  independently; more attention channels hurt loss, so they keep attention small (~1/8) and let
  Mamba-2 do most of the work (final block config is semi-parallel `SA_M`, ~2:1:5
  SSM:attn:MLP). SSM ablations show validation accuracy is driven almost entirely by a larger
  state dim d_state (settled at 256), with group count nearly irrelevant; Conv1d kernel size 4
  and chunk size 256 are the sweet spots. A zero-overhead **hidden-state reset at document
  boundaries** (inject −80 into Ā before exp) stops cross-document leakage in packed sequences.
  [arXiv:2507.22448](https://arxiv.org/abs/2507.22448)
- **M2N2 — competition + attraction.** Implicit fitness sharing caps the total fitness any
  one data point can supply, which pushes models into distinct *niches* (diversity without a
  hand-designed metric); an attraction score steers crossover toward parents that are strong
  where the other is weak. Beats GA / MAP-Elites / CMA-ES on the LLM-merge benchmark
  (GSM8k+WebShop avg **63.49** vs 60.05 GA / 49.06 CMA-ES) and on diffusion merging
  (best CLIP cosine-sim **0.787**). Ablations: the split-point matters most, attraction second.
  [arXiv:2508.16204](https://arxiv.org/abs/2508.16204)

## State of research

**Best-performing now:** Mistral is the only European lab near the frontier; its RL-only
reasoning (Magistral) is its most notable contribution, and Mistral Large 3 (675B MoE,
Apache-2.0) is the strongest open-weight European base model. Falcon-H1's tunable parallel
hybrid and Sakana's evolutionary merging are the most distinctive sovereign-lab techniques.

**Promising but unproven:** Whether sovereign efforts can sustain frontier parity, or will
instead specialize in language/regional strengths and efficiency. Korea's open-source mandate
and the THINK pruning-distillation roadmap are explicit bets on lowering the barrier to entry
rather than chasing raw scale (the THINK paper frames cost-efficiency, not benchmark wins, as
the goal). Selection pressure is real: by late 2025 the MSIT project had already cut Naver and
NCSoft from the five consortia. [MSIT cut](https://www.koreaherald.com/article/10656367)

**Open problems & weaknesses:** Compute and capital gaps vs. US/China are large. Several
sovereign efforts build *on top of* open US/Chinese bases or borrow their recipes (GRPO,
Clip-Higher, μP) rather than originating them. Author-stated limits are honest: M2N2 only
works when the seed models haven't diverged too far from a shared base (merging breaks for
heavily fine-tuned models), and a principled model-*compatibility* metric is still missing;
Magistral's multilingual AIME drops 4.3–9.9 points vs English. The strategic value (language
sovereignty, data governance, security) may matter more than raw benchmark parity.
