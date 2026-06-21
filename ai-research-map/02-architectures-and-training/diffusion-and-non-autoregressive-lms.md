# Diffusion & Non-Autoregressive Language Models

Generating text by iterative denoising / in parallel rather than strictly left-to-right —
trading the sequential bottleneck of autoregression for speed.

## Key directions & work

- **LLaDA** — first from-scratch masked diffusion LM competitive with LLaMA3-8B in
  in-context learning; notably *breaks the reversal curse*, beating GPT-4 on reversed-
  completion tasks. Renmin U / Ant — [arXiv:2502.09992](https://arxiv.org/abs/2502.09992)
- **LLaDA-MoE** — first diffusion LM with sparse MoE, trained from scratch on ~20T tokens
  (7B total / 1.4B active), matching Qwen2.5-3B-Instruct. [arXiv:2509.24389](https://arxiv.org/abs/2509.24389)
- **Mercury** (Inception Labs) — first *commercial-scale* diffusion LLM; Mercury Coder hit
  ~737–1109 tok/s on H100 (~10× speed-optimized AR models). Mercury 2 (2026) claims ~10×
  faster than Claude/ChatGPT/Gemini. [arXiv:2506.17298](https://arxiv.org/abs/2506.17298)
- **Block / semi-autoregressive decoding** — dividing sequences into blocks decoded
  left-to-right *with* KV-cache support is the dominant practical recipe (LLaDA 2.x
  reportedly ~892 tok/s). *"Learning to Parallel"* — [arXiv:2509.25188](https://arxiv.org/abs/2509.25188)

## State of research

**Best-performing now:** Block/semi-AR diffusion with KV-cache is what makes diffusion
LMs practical — Inception's Mercury is the clearest evidence the approach works at
commercial scale and delivers genuine latency wins.

**Promising but unproven:** Whether diffusion LMs can match the *quality* frontier of
autoregressive reasoning models is open. They're compelling for low-latency and
controllable/parallel generation, and the reversal-curse result hints at representational
advantages — but no diffusion model leads a hard reasoning benchmark.

**Open problems & weaknesses:** Tooling/ecosystem (training stacks, RLHF, serving) is far
less mature than for AR models. Integrating reasoning/long CoT, scaling laws for diffusion
LMs, and clean KV-cache semantics under iterative refinement are all under-explored. Most
results come from a small set of labs (Ant/Renmin, Inception), so external replication is
thin.
