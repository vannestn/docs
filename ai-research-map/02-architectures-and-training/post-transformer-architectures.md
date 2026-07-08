# Post-Transformer Architectures

## In brief
- **What it is** — Work on new ways to build language models that avoid the Transformer's core bottleneck. Today's models use *softmax attention*, where every word compares itself to every other word — accurate, but the cost grows with the *square* of the text length, so doubling the input roughly quadruples the compute and memory. This area develops cheaper alternatives (state-space models, linear attention, RNN revivals, learnable "memory" modules) that scale closer to linearly, and hybrids that mix a little full attention with a lot of the cheap kind.
- **Why it's pursued** — To make long context affordable. Reading a whole codebase, book, or conversation history is expensive precisely because attention's cost blows up with length; sub-quadratic designs promise longer context, faster generation, and smaller memory footprints at similar quality.
- **Potential impact** — If it succeeds, models handle million-token contexts at a fraction of today's cost, cutting inference bills and enabling always-on memory. The catch: pure efficient designs still lag on *exact recall* over long inputs (the "state-capacity wall"), which is why the current winners keep a few full-attention layers rather than replacing attention outright.

## Key directions & work

### State-space models & the SSM/attention duality
- **Mamba-2 / State Space Duality (SSD)** — proves that state-space models (SSMs) and
  attention are two views of the same object: any SSM equals multiplication by a
  *semiseparable matrix*, and the causal-masked form of linear attention (Structured Masked
  Attention) is its dual. This bridge lets SSMs reuse Transformer systems tricks
  (tensor/sequence parallelism). The SSD layer refines Mamba's selective SSM by restricting
  each `A` to a scalar times identity, and its block-decomposition algorithm runs **2–8×
  faster** than Mamba-1's fused selective scan while allowing an **8× larger state**; it
  overtakes FlashAttention-2 at sequence length ~2K and is ~6× faster at 16K. Mamba-2
  (2.7B/300B tokens on the Pile) matches or beats Pythia-6.9B. Princeton/CMU (Tri Dao,
  Albert Gu) — [arXiv:2405.21060](https://arxiv.org/abs/2405.21060)

### Linear-attention hybrids (the production winner)
The dominant practical recipe interleaves a few full-attention layers with many
linear/gated layers (~1:3 to 1:7), plus a mixture-of-experts (MoE) feed-forward:
- **Kimi Linear** (Moonshot) — interleaves **Kimi Delta Attention (KDA)** with full **MLA**
  attention at a uniform **3:1 KDA:MLA** ratio (the best ratio in their ablation; 0:1
  pure-attention was worst). KDA is a Gated DeltaNet (GDN) variant whose forget gate is
  *channel-wise* (fine-grained) rather than GDN's single scalar gate. 48B total / 3B
  activated MoE. Claims to be the *first* linear-attention architecture to **outperform full
  attention** under matched 1.4T-token training across short-context, long-context, and RL
  regimes. KV-cache **−75%**, up to **6× decode throughput** at 1M context (6.3× faster
  time-per-output-token vs MLA at 1M), RULER 84.3 vs MLA 81.3.
  [arXiv:2510.26692](https://arxiv.org/abs/2510.26692)
- **MiniMax-M1** (MiniMax) — "world's first open-weight large-scale hybrid-attention
  reasoning model," built on **lightning (linear) attention**; 456B total / **45.9B
  activated** MoE, native **1M context** (8× DeepSeek-R1's 128K). One softmax (transformer)
  block every **7 lightning-attention blocks** (1:7). Consumes ~**25% of DeepSeek-R1's
  FLOPs** at 100K generation length (<50% at 64K). Trained by RL with a custom algorithm
  (**CISPO**, which clips importance-sampling weights instead of token updates); the full RL
  run cost ~$0.53M on 512 H800s in 3 weeks. [arXiv:2506.13585](https://arxiv.org/abs/2506.13585)
- **Qwen3-Next** (Qwen) — **Gated DeltaNet + Gated Attention** in a **3:1** layout
  (`3×(GatedDeltaNet→MoE) → 1×(GatedAttention→MoE)`) plus an **ultra-sparse MoE** (512
  experts, 10 routed + 1 shared). 80B total / **3B activated**. Reported to match
  Qwen3-235B-A22B-Instruct quality at **~10% of Qwen3-32B's training cost** and **~10×
  inference throughput at >32K context**. (Released Sept 2025 as a blog/weights drop, with
  *no arXiv paper*; not to be confused with the dense-GQA Qwen3 report
  [arXiv:2505.09388](https://arxiv.org/abs/2505.09388).) [Qwen](https://huggingface.co/Qwen/Qwen3-Next-80B-A3B-Instruct)
- **Hunyuan-TurboS** (Tencent) — first industry-deployed ultra-large hybrid
  **Transformer-Mamba2 MoE** (**560B total / 56B activated**); 128 layers in an **AMF/MF**
  block pattern (Attention→Mamba2→FFN). The layer budget is ~5.5% attention, ~44.5% Mamba2,
  50% FFN; FFNs are MoE (1 shared + 32 experts, 2 routed). 16T tokens, 256K context. LMSYS
  Arena ~1356 (top-7). [arXiv:2505.15431](https://arxiv.org/abs/2505.15431)
- **Falcon-H1** (TII) — a *parallel* (rather than interleaved) hybrid: attention and Mamba2
  heads run side-by-side **within each block** and their outputs are concatenated, with
  attention/SSM channel counts tuned independently (final models ~2:1:5 SSM:attn:MLP). The
  flagship **Falcon-H1-34B** rivals or beats 70B-class models (Qwen3-32B, Qwen2.5-72B,
  Llama3.3-70B) at ~half the size; the 0.5B model matches typical 2024-era 7Bs. 256K context,
  18 languages. [arXiv:2507.22448](https://arxiv.org/abs/2507.22448)

### RNN revival & RNN/sparse-attention hybrids
- **RWKV-7 "Goose"** — linear-time, constant-memory RNN, no KV-cache; generalizes the delta
  rule with vector-valued gating and in-context learning rates, can do state tracking and
  recognize all regular languages. [arXiv:2503.14456](https://arxiv.org/abs/2503.14456)
- **RWKV-X** — a hybrid that pairs RWKV-7 blocks with periodic **Top-k chunk
  sparse-attention** blocks (MoBA-style) to fix RWKV-7's long-context recall: pure RWKV-7
  passes passkey only to ~28K then degrades, whereas RWKV-X-3.6B (continually pretrained on
  64K) achieves near-perfect 64K passkey and decodes to 1M at constant memory. Ablation: ~25%
  sparse-attention layers minimizes loss. [arXiv:2504.21463](https://arxiv.org/abs/2504.21463)
- **RWKV-8 "ROSA"** — in development; a parameter-free linear-time **suffix-automaton**
  mechanism for lossless long-range information propagation (neurosymbolic). No formal paper
  yet. [Source](https://github.com/BlinkDL/RWKV-LM/tree/main/RWKV-v8)

### Test-time-training memory layers
- **Titans** — a neural long-term memory module updated at inference time by a **surprise**
  signal (the gradient of an associative-memory loss `‖M(k)−v‖²`), with **momentum** ("past
  surprise") and a data-dependent **weight-decay/forget gate**. Three integration variants:
  Memory-as-Context (MAC), Memory-as-Gate (MAG), and Memory-as-Layer (MAL). Scales to **>2M
  context**; MAC beats GPT-4/Llama3.1-70B+RAG on BABILong long-context retrieval at far fewer
  params, and beats Mamba-2/TTT/DeltaNet on the S-NIAH needle task (which TTT/Mamba2 fail past
  ~8K). Ablations rank the contributions: weight decay > momentum > convolution > persistent
  memory. Google Research. [arXiv:2501.00663](https://arxiv.org/abs/2501.00663)
- **Nested Learning / "Hope"** — recasts a model *and* its training as a stack of nested
  optimization problems, each with its own "context flow" and update frequency (it reframes
  backprop/momentum/Adam themselves as associative-memory compressors). The **Hope**
  architecture instantiates this as **self-modifying Titans** — memory that learns to
  generate its own update rule, extending Titans
  [arXiv:2501.00663](https://arxiv.org/abs/2501.00663) — stacked with a **Continuum Memory
  System (CMS)**, a spectrum of MLP-style memory blocks updated at different frequencies that
  generalizes the binary "short-term/long-term memory" split. Beats
  Transformer++/Samba/RWKV-7/Titans on average LM + commonsense at 760M/30B and 1.3B/100B,
  holds up to 10M-token context on BABILong, and tops NIAH/MAD recall; ablations show DGD,
  momentum, weight decay, and CMS each contribute. Google Research, NeurIPS 2025.
  [arXiv:2512.24695](https://arxiv.org/abs/2512.24695)
- **"TTT with KV binding is secretly linear attention"** — argues that a broad class of TTT
  layers (those optimizing a self-supervised key→value loss in the inner loop, i.e. TTT-KVB)
  can be **analytically rewritten as a learned linear-attention operator**, even with
  multi-layer MLP inner loops and momentum, provided the inner-loop final layer is linear and
  bias-free. Three findings argue the "memorization" view is wrong: replacing inner-loop
  gradient *descent* with *ascent* preserves (sometimes improves) downstream quality;
  replacing the query with the key barely changes it; and Q and K are distributionally
  mismatched. Practical payoff: a fully **parallel** form gives up to **4.0× inference
  throughput** on the attention calc (1.19× end-to-end training speedup), and most TTT
  machinery (weight norm, momentum, deeper MLPs, per-token LR) ablates away — the full TTT
  model beats the reduced linear-attention variant only marginally (+0.87 perplexity on LLM,
  +0.24 dB PSNR on NVS). NVIDIA/Vector Inst., ICML 2026.
  [arXiv:2602.21204](https://arxiv.org/abs/2602.21204) *[2026 ID — confirmed against full text]*

## State of research

**Best-performing now:** *Hybrid* architectures — a small fraction of full-attention
layers + many linear/gated layers + MoE — are the proven recipe, shipping in production
frontier models (Kimi Linear, MiniMax-M1, Qwen3-Next, Hunyuan-TurboS). They deliver most of
attention's quality at a fraction of the long-context KV cost. Two structural choices remain
contested: **interleaved** layers (Kimi Linear, MiniMax-M1, Qwen3-Next, Hunyuan-TurboS) vs
**parallel** in-block fusion (Falcon-H1); and the right linear primitive — gated DeltaNet
variants with *fine-grained channel-wise* gates (KDA, Qwen3-Next) vs Mamba-2's coarser
*scalar/head-wise* gate (Hunyuan-TurboS, Falcon-H1). Kimi Linear's ablations argue that the
fine-grained delta rule plus a 3:1 ratio is what lets a hybrid *exceed* — not just approach —
full attention.

**Promising but unproven:** Pure sub-quadratic models (RWKV-7, pure SSMs) and
test-time-training memory layers (Titans/Hope) show strong long-context efficiency but have
*not* displaced attention at the absolute quality frontier. The **"TTT ≈ linear attention"**
unification is now backed by a full analytic reduction plus ablations on LaCT and ViTTT — it
could deflate the area by showing much of the recent TTT machinery is redundant, though it
explicitly only covers the linear/bias-free inner-loop final-layer case.

**Open problems & weaknesses:** Pure linear/SSM models still lag on exact recall and some
in-context-learning tasks — directly observed as the **state-capacity wall**: RWKV-7 collapses
on passkey past ~28K, and Mamba-2/TTT/DeltaNet drop sharply on the S-NIAH needle task past ~8K.
This wall is *why* every production system keeps some full attention, and what motivates Titans'
forget gate and KDA's fine-grained decay. Three areas remain active: hardware kernels; training
stability at scale (MiniMax-M1 and Hunyuan-TurboS both report needing FP32 precision for
SSM/output-head states, plus staged context-length curricula to avoid gradient explosion); and
theoretical understanding of what gated states can represent. There is no clean win over
attention on quality-per-FLOP at frontier *dense* scale yet — efficiency and long-context cost,
not raw capability, remain the driver, even as Kimi Linear's matched-scale result chips at that
framing.
