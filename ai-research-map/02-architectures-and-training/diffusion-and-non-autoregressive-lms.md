# Diffusion & Non-Autoregressive Language Models

Generate text in parallel by iterative denoising rather than strictly left-to-right,
trading autoregression's sequential bottleneck for speed. The dominant family is
**masked diffusion models (MDMs)**. The recipe: a forward process masks tokens at a random
ratio *t ∼ U(0,1)*; a Transformer *mask predictor* is trained with cross-entropy loss on the
masked positions only (reweighted by 1/t), which upper-bounds the negative log-likelihood. At
inference, the model starts from a fully masked sequence and iteratively denoises it,
predicting all masks in parallel and remasking the low-confidence tokens between steps.

## Key directions & work

- **LLaDA** — from-scratch masked diffusion LM at **8B params**, pre-trained on **2.3T
  tokens** (0.13M H800 GPU-hours) + SFT on 4.5M pairs. Competitive with **LLaMA3-8B** in
  in-context learning and surpasses LLaMA2-7B on nearly all 15 zero/few-shot tasks; notably
  *breaks the reversal curse*, beating **GPT-4o** on a Chinese-poem reversal-completion task
  (45.6 vs 34.3, while losing on forward 51.8 vs 82.7). Uses vanilla MHA (no GQA), since GQA
  is incompatible with KV-caching here. Renmin U / Ant; NeurIPS 2025 —
  [arXiv:2502.09992](https://arxiv.org/abs/2502.09992)
- **LLaDA-MoE** — masked-diffusion LM with a **sparse MoE** backbone (64 experts, top-8),
  trained from scratch on **~20T tokens** (≈21T across 4 stages), **7B total / 1.4B active**.
  Surpasses prior dense 8B diffusion LMs (LLaDA-8B, Dream-7B) and matches Qwen2.5-3B-Instruct
  despite ~1B active params. Renmin U / Ant —
  [arXiv:2509.24389](https://arxiv.org/abs/2509.24389)
- **Mercury** (Inception Labs) — first *commercial-scale* diffusion LLM; **Mercury Coder
  Mini hit 1109 tok/s, Small 737 tok/s on H100** (third-party Artificial Analysis), up to
  **~10× faster** than speed-optimized frontier models at comparable code quality. On
  Copilot Arena, Mini tied for 2nd on quality with ~25 ms latency (fastest overall).
  Mercury 2 (Feb 2026) is a *reasoning* dLLM claiming **>5× faster generation** than
  autoregressive decoding, **~1,009 tok/s** (Blackwell), 128K context, quality on par with
  Claude 4.5 Haiku / GPT-5.2 Mini ([Inception blog](https://www.inceptionlabs.ai/blog/introducing-mercury-2),
  [Businesswire](https://www.businesswire.com/news/home/20260224034496/en/)). —
  [arXiv:2506.17298](https://arxiv.org/abs/2506.17298)
- **Learn2PD** (*"Learning to Parallel"*) — accelerates dLLM inference by training a tiny
  2-layer MLP *filter* (~2k params, ~6 min on a T4) that predicts, per token, whether the
  current prediction is final and can be unmasked — approximating an oracle ("Extremely
  Greedy Parallel") that the authors show could give 15–20× speedup. A companion trick,
  **EoTP** (End-of-Text Prediction), halts a block once the EoT token is confidently
  produced, cutting the ~90% of compute wasted decoding padding. On LLaDA-8B-Instruct:
  **22.58× speedup with no accuracy drop, 57.51× with KV-cache** (GSM8K, gen-length 1024). —
  [arXiv:2509.25188](https://arxiv.org/abs/2509.25188)
- **Block / semi-autoregressive decoding** — partitioning the sequence into blocks decoded
  left-to-right (parallel *within* a block) is the standard practical recipe (introduced by
  Block Diffusion, [arXiv:2503.09573](https://arxiv.org/abs/2503.09573)); it restores
  KV-cache compatibility and is the default sampler in LLaDA-MoE (block length 64).
  Production LLaDA 2.x reportedly hits ~892 tok/s (LLaDA2.1 on HumanEval+,
  [source](https://github.com/inclusionAI/LLaDA2.X)).

## State of research

**Best-performing now:** Block/semi-AR diffusion with KV-cache is what makes diffusion
LMs practical — Inception's Mercury is the clearest evidence the approach works at
commercial scale and delivers genuine latency wins (1109/737 tok/s on H100, ~10× speed-
optimized AR models at comparable code quality per third-party eval).

**Promising but unproven:** Whether diffusion LMs can match the *quality* frontier of
autoregressive reasoning models is still open. They are compelling for low-latency and
controllable/parallel generation, and the reversal-curse result hints at representational
advantages: LLaDA's authors argue that scalability comes from the *generative-modeling
principle* (likelihood maximization), not from autoregression per se, and attribute the
reversal gain to LLaDA optimizing multiple conditioning directions rather than only
left-to-right. But no diffusion model yet leads a hard reasoning benchmark, and LLaDA-MoE
still only *matches* a 3B AR instruct model.

**Inference is heavily over-computed — and that's the opportunity.** Learn2PD's analysis
on LLaDA shows the vanilla sampler *remasks tokens that are already correct*, running a
median of ~32 decoding steps per block where ~2 would suffice, and spending ~90% of compute
at gen-length 1024 decoding padding after the answer ends. The headline 22.58×/57.51×
speedups come from removing that redundancy, not from a better model — suggesting current
dLLM latency numbers understate the ceiling.

**Open problems & weaknesses (author-stated):**
- **Architecture/serving gaps.** LLaDA used *no* specialized attention, position embeddings,
  or KV-cache; vanilla MHA was chosen precisely because variable-ratio masking is
  incompatible with naive KV-caching — clean KV-cache semantics under iterative refinement
  remain an open design problem (Block Diffusion / Learn2PD are partial answers).
- **Train/inference mismatch.** Both LLaDA and LLaDA-MoE were pre-trained at fixed 4k
  context; they recover variable-length ability only via a 1%-of-steps random-length trick,
  and generation length is a user-set hyperparameter (no learned stopping; EoTP addresses
  the padding symptom, not adaptive length).
- **Likelihood is expensive & indirect.** Cited scaling work (Nie et al.) found MDMs need
  ~16× the compute of an AR model to reach the same likelihood; LLaDA argues likelihood is
  a poor proxy for downstream quality, so diffusion scaling laws are still unsettled.
- **Alignment & reasoning.** LLaDA used only SFT (no RLHF/RL); the authors explicitly leave
  RL alignment and O1-style long-CoT post-training as future work.
- **Thin replication.** Most strong results come from a small set of labs (Ant/Renmin
  InclusionAI, Inception), and headline speed figures rely on third-party (Artificial
  Analysis) or vendor benchmarks rather than independent reproduction.
