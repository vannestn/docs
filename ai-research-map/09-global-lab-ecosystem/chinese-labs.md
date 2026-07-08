# Chinese Labs

The center of gravity for *efficient-architecture* research and competitive open-weight
models in 2026. Two goals recur across these labs: **escape the quadratic cost of attention**
(via linear/hybrid attention or trainable sparse attention) and **squeeze more capability
per token and per FLOP**. This is partly a research bet, partly a response to compute scarcity
under US export controls.

## The players & their signature research

- **DeepSeek** — the breakout. **DeepSeek-R1** showed reasoning can emerge from pure RL, and
  was the first major LLM to clear independent peer review — published in *Nature* (vol. 645,
  18 Sep 2025) on the cover ("Self-help"). **DeepSeek-V3.2** introduces **DeepSeek Sparse
  Attention (DSA)** — a fast (FP8) "lightning indexer" plus top-k token selection, cutting core
  attention from O(L²) to O(Lk) while preserving quality. Its **GRPO** RL recipe (origin:
  DeepSeekMath) is now the default across Chinese labs.
  The **DeepSeek-V4** preview (mid-2026) pivots from V3.2's *sparse-attention-on-a-dense-base*
  to a ground-up million-token, hybrid-attention design (CSA+HCA) on a far larger MoE.
  [R1 Nature](https://www.nature.com/articles/s41586-025-09422-z) · [V3.2 arXiv:2512.02556](https://arxiv.org/abs/2512.02556) · [V4 arXiv:2606.19348](https://arxiv.org/abs/2606.19348)
- **Moonshot AI** — **Kimi K2**, a 1.04T-total / 32B-active MoE for agents, pre-trained on
  15.5T tokens with **MuonClip** (the Muon optimizer plus a novel QK-Clip stabilizer) and zero
  loss spikes. K2 is a *non-thinking* model that leads open-source agentic benchmarks.
  [Kimi K2 arXiv:2507.20534](https://arxiv.org/abs/2507.20534)
- **MiniMax** — **MiniMax-M1**, first open-weight large reasoning model on *lightning
  (linear) attention*; 456B total / 45.9B active, native 1M context, RL-trained for ~$534K.
  Introduced the **CISPO** RL algorithm. [arXiv:2506.13585](https://arxiv.org/abs/2506.13585)
- **Alibaba Qwen** — prolific open-weight family; **Qwen3** (dense + ultra-sparse MoE up to
  235B-A22B, unified thinking/non-thinking, RL via **GRPO**) and **Qwen3-Next** (linear-attention
  hybrid). Qwen later introduced **GSPO** (sequence-level RL, [arXiv:2507.18071](https://arxiv.org/abs/2507.18071))
  to stabilize MoE RL. [Qwen3 arXiv:2505.09388](https://arxiv.org/abs/2505.09388)
- **Zhipu / Z.ai** — **GLM-4.5** ("ARC": Agentic, Reasoning, Coding; 355B-A32B MoE, hybrid
  reasoning); its open base became a substrate for others' RL work. Also ships open VLMs
  (**GLM-4.5V / GLM-4.1V-Thinking**, trained with RL + Curriculum Sampling).
  [GLM-4.5 arXiv:2508.06471](https://arxiv.org/abs/2508.06471) · [GLM-4.5V arXiv:2507.01006](https://arxiv.org/abs/2507.01006)
- **Tencent Hunyuan** — **Hunyuan-TurboS**, first industry-deployed ultra-large Mamba-
  Transformer hybrid (560B total / 56B active, 128 layers, AMF/MF block pattern).
  [arXiv:2505.15431](https://arxiv.org/abs/2505.15431)
- **StepFun** — **Step-3**, model-system co-design (MFA attention + attention/FFN
  disaggregation) for cheap decoding. [arXiv:2507.19427](https://arxiv.org/abs/2507.19427)
- **Baidu ERNIE 4.5** (open, modality-specialized MoE); **ByteDance Seed** (Seed1.5-VL,
  Seed-Prover for formal math).

## Signature contributions, in depth

### DeepSeek — sparse attention + a hardened RL recipe
**DeepSeek-V3.2** keeps the V3.1-Terminus architecture and adds **DSA** via *continued
training*. A cheap **lightning indexer** (few heads, FP8, ReLU) scores preceding tokens, then a
**fine-grained selector** keeps only the top-k (2048) key-value entries for full attention —
all instantiated under MLA in its MQA mode. Training runs in two stages: a 1,000-step dense
warm-up (2.1B tokens) that aligns the indexer to the dense attention distribution via KL, then a
15,000-step sparse stage (943.7B tokens). The result: attention complexity drops from O(L²) to
O(Lk), with large end-to-end long-context speedups and **no measurable quality regression** vs
V3.1-Terminus on standard and long-context evals (e.g. AA-LCR, Fiction.liveBench).
- *RL at scale:* V3.2 uses **GRPO** with several stability fixes — an **unbiased KL estimate**
  (correcting the K3 estimator), **off-policy sequence masking** (mask only negative-advantage,
  high-divergence sequences), and **keep-routing / keep-sampling masks** so MoE expert routing
  and top-p truncation match between rollout and training.
- *Results:* V3.2 lands comparably to GPT-5 and Kimi-K2-Thinking across reasoning benchmarks;
  the high-compute **V3.2-Speciale** variant reaches parity with Gemini-3.0-Pro and claims
  gold-medal performance at IMO/IOI/ICPC/CMO 2025.
- *V4 — the next jump (preview):* Where V3.1/V3.2 *retrofit* sparse attention (DSA) onto an
  existing dense base via continued training, **DeepSeek-V4** is a ground-up redesign for
  **1M-token context**. The preview ships two MoE variants — **V4-Pro** (1.6T total / 49B active)
  and **V4-Flash** (284B / 13B) — pre-trained on **32T+ tokens**. The headline change is a
  **hybrid attention** stack pairing **Compressed Sparse Attention (CSA)** with **Heavily
  Compressed Attention (HCA)**. It also adds **Manifold-Constrained Hyper-Connections (mHC)** to
  strengthen residual flow and uses the **Muon** optimizer (also Moonshot's pick) for the main run.
  Efficiency vs **V3.2** at 1M context: V4-Pro uses **~27% of the single-token inference FLOPs**
  and **~10% of the KV cache** (a ~90% cache reduction). [V4 arXiv:2606.19348](https://arxiv.org/abs/2606.19348)

### Moonshot — MuonClip and token efficiency
The Kimi K2 thesis is *token efficiency as a scaling coefficient*. K2 uses the token-efficient
**Muon** optimizer but tames its failure mode — exploding attention logits — with **QK-Clip**.
QK-Clip rescales the query/key projections only for heads whose max logit exceeds a threshold
τ (=100), and for MLA touches only the head-specific (non-shared-rotary) components. Combined as
**MuonClip**, it drove 15.5T tokens with **zero loss spikes** (logits cap, then decay to a stable
band after ~30% of training). Architecture: ultra-sparse MoE (384 experts, 8 active) à la
DeepSeek-V3 but with sparsity-48 — a stated **sparsity scaling law** (more total experts at fixed
active params lowers loss) — and **64 attention heads** (half of DeepSeek-V3's 128) to cut
long-context inference cost. K2 reports 65.8 SWE-bench Verified, 66.1 Tau2-bench,
53.7 LiveCodeBench v6, 49.5 AIME 2025 — all in non-thinking mode.

### MiniMax — lightning attention + CISPO
**MiniMax-M1** is built on MiniMax-Text-01 (456B / 45.9B active, 32 experts), interleaving one
softmax-attention block per seven lightning-attention (linear) blocks. That mix is what makes its
test-time compute cheap: at a 100K generation length, M1 uses **~25% of DeepSeek-R1's FLOPs**.
Its RL contribution, **CISPO**, *clips importance-sampling weights instead of token updates*. The
payoff: rare reflective "fork" tokens (However/Recheck/Wait/Aha) keep contributing gradient,
whereas GRPO/PPO clipping tends to drop them after the first off-policy step. On a Qwen2.5-32B
zero-RL study, CISPO matches DAPO's performance with **half the training steps**. Two
model-specific fixes were needed: FP32 precision on the LM output head (to fix a train/infer
probability mismatch that blocked reward growth) and repetition-based early truncation. Full RL
ran in **3 weeks on 512 H800s (~$0.53M)**.

### Alibaba Qwen — unified thinking + dense/MoE breadth
**Qwen3** unifies thinking and non-thinking modes in one model with a *thinking budget*
mechanism, spanning 0.6B–235B (flagship **Qwen3-235B-A22B**, 22B active). Pre-trained on **36T
tokens / 119 languages** (3-stage: general → reasoning → long-context to 32K, then YaRN+DCA for
4× at inference). Flagship base beats DeepSeek-V3-Base on 14/15 benchmarks at ~1/3 total params.
Post-training is a four-stage pipeline (long-CoT cold start → reasoning RL → thinking-mode
fusion → general RL) with **strong-to-weak distillation** for smaller models — distillation
beats direct RL while costing **~1/10 the GPU hours**. The reasoning-RL stage uses **GRPO** over
3,995 query-verifier pairs. (Qwen's later **GSPO**, a sequence-level RL variant, is reported to
power subsequent Qwen3 updates but is a separate paper, not this report.)

### Tencent Hunyuan — Mamba-Transformer at industrial scale
**Hunyuan-TurboS** is a 128-layer hybrid of Mamba2, Attention, and FFN (560B total / 56B
active), arranged in an **AMF/MF** block pattern (≈5.5% Attention, 44.5% Mamba2, 50% FFN).
Mamba2 gives linear sequence complexity; GQA keeps the (small) attention KV cache cheap; FFNs
are MoE (1 shared + 2 of 32 experts active). Pre-trained on 16T tokens to 256K context — billed
as the first industry-deployed large-scale Mamba model. Adaptive **long/short CoT fusion** lets
it skip "thinking" on easy queries, using ~50% of the generation tokens of top reasoning models.
Reported: LMSYS Chatbot Arena score **1356 (top-7)**, and a 77.9% average across 23 automated
benchmarks. Note: the Arena/figure numbers are self-reported.

### StepFun — model-system co-design for cheap decoding
**Step-3** (316B LLM / 38B active, +5B vision encoder → 321B total VLM) targets *decoding cost*,
which it argues is decoupled from parameter count. Two levers: **Multi-Matrix Factorization
Attention (MFA)**, a low-rank QK factorization that shrinks both KV cache and attention
compute while keeping a high attention effective rank (16,384, matching DeepSeek-V3's MLA); and
**Attention-FFN Disaggregation (AFD)**, which runs attention and FFN on separate GPU pools so
each hits ideal hardware utilization. The headline claim: **~40% lower decoding cost** than
DeepSeek-V3 and Qwen3-MoE-235B, with the gap widening at longer context; on H800 it serves
~4,039 tokens/s/GPU under a 50ms TPOT SLA (vs DeepSeek-V3's 2,324 in the same setup). The paper's
real contribution is that broader argument: total/activated param count is a *bad* proxy for
decoding cost — attention design and hardware-aware MoE sparsity dominate.

### Zhipu — GLM-4.5 (text ARC) and GLM-4.5V (vision)
**GLM-4.5** ("ARC": Agentic, Reasoning, Coding) is a 355B-A32B hybrid-reasoning MoE
(+ 106B GLM-4.5-Air) trained on 23T tokens. The on-disk paper here ([arXiv:2507.01006](https://arxiv.org/abs/2507.01006))
is actually the **vision** line — **GLM-4.5V / GLM-4.1V-Thinking** VLMs (ViT + MLP adapter +
GLM decoder) — whose contribution is **RL with Curriculum Sampling (RLCS)**: difficulty-aware
sample selection across STEM, grounding, GUI agents, OCR, video and long-document tasks. A
stated lesson: when one reward is *unified* across many multimodal skills, a weak signal in any
single capability can collapse the whole RL run — so a precise multi-domain reward system is
critical. GLM-4.5V reports SOTA among comparably sized open VLMs across 42 benchmarks.

## State of research

**Best-performing now:** Chinese labs lead on **efficient architectures** — linear/hybrid
attention (MiniMax lightning attention, Hunyuan Mamba2, Qwen3-Next), trainable sparse attention
(DeepSeek DSA), and hardware-aware co-design (Step-3 MFA/AFD) — and ship **competitive open
weights** that often match US models for their size. Field-shaping RL contributions cluster
here too: GRPO (DeepSeek), CISPO (MiniMax), GSPO (Qwen), MuonClip-stabilized training (Moonshot).

**Promising but unproven:** Whether open weights stay at parity with the *absolute* closed
frontier. DeepSeek's own V3.2 intro concedes the open-vs-closed gap "appears to be widening" on
the hardest tasks — though V3.2-Speciale's claimed Gemini-3.0-Pro parity and gold-medal olympiad
results are the strongest counter-evidence yet. How export controls on compute reshape the
trajectory remains open (see [12 · Geopolitics](../12-politics-capital-and-business-models/geopolitics-and-policy.md)).

**Open problems & weaknesses:**
- **Compute access** under US export controls is the structural constraint — hence the intense
  efficiency focus (Step-3 explicitly optimizes for H20/A800/Ascend-910B, not just H800).
- **Self-reported figures.** Several headline numbers (Hunyuan-TurboS's Arena rank, cross-lab
  cost claims) rest on the labs' own reporting, evaluated under their own pipelines.
- **Efficiency ≠ new capability (mostly).** The dominant theme is *cheaper* inference/training,
  not a new capability class — but two cracks in that framing: hybrid/linear models still
  struggle on the hardest long-context tasks (Step-3 notes MiniMax-M1 and Llama-4's few full
  attention layers can still dominate KV growth), and DeepSeek-V3.2-Speciale's olympiad results
  hint the RL-scaling story is starting to push capability, not just cost.
