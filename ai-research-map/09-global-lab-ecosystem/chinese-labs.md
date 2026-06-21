# Chinese Labs

The center of gravity for *efficient-architecture* research and competitive open-weight
models in 2026.

## The players & their signature research

- **DeepSeek** — the breakout. **DeepSeek-R1** showed reasoning can emerge from pure RL
  (published in *Nature*, first LLM on the cover); **DeepSeek Sparse Attention** cuts
  long-context cost to near-linear. Drove the **GRPO** RL recipe now used everywhere.
  [R1 Nature](https://www.nature.com/articles/s41586-025-09422-z) · [V3.2 arXiv:2512.02556](https://arxiv.org/abs/2512.02556)
- **Moonshot AI** — **Kimi K2** (1T-param open model for agents, trained with the **Muon**
  optimizer at unprecedented scale) and **Kimi Linear** (efficient long-context attention).
  [Kimi K2 arXiv:2507.20534](https://arxiv.org/abs/2507.20534)
- **MiniMax** — **MiniMax-M1**, first open-weight large reasoning model on *linear attention*,
  1M context, trained for ~$534K. [arXiv:2506.13585](https://arxiv.org/abs/2506.13585)
- **Alibaba Qwen** — prolific open-weight family; **Qwen3** (ultra-sparse MoE, **GSPO** RL)
  and **Qwen3-Next** (linear-attention hybrid). [Qwen3 arXiv:2505.09388](https://arxiv.org/abs/2505.09388)
- **Zhipu / Z.ai** — **GLM-4.5/4.6** for agentic + coding; its open base became the substrate
  for others' RL work. [arXiv:2507.01006](https://arxiv.org/html/2507.01006v5)
- **Tencent Hunyuan** — **Hunyuan-TurboS**, first industry-deployed ultra-large Mamba-
  Transformer hybrid. [arXiv:2505.15431](https://arxiv.org/abs/2505.15431)
- **StepFun** — **Step-3**, model-system co-design (attention/FFN disaggregation) for cheap
  decoding. [arXiv:2507.19427](https://arxiv.org/abs/2507.19427)
- **Baidu ERNIE 4.5** (open, modality-specialized MoE); **ByteDance Seed** (Seed1.5-VL,
  Seed-Prover for formal math).

## State of research

**Best-performing now:** Chinese labs lead on **efficient architectures** (linear-attention
hybrids, trainable sparse attention) and ship **competitive open weights** that often match
US models for their size. DeepSeek's GRPO and Moonshot's Muon-at-scale are field-shaping
contributions.

**Promising but unproven:** Whether open-weight Chinese models can stay at parity with the
*absolute* closed frontier, and how export controls on compute affect their trajectory (see
[12 · Geopolitics](../12-politics-capital-and-business-models/geopolitics-and-policy.md)).

**Open problems & weaknesses:** Compute access under US export controls is the structural
constraint (hence the intense focus on efficiency). Some technical claims rest on
self-reported figures. The dominant theme — **escaping quadratic attention cost** — is an
efficiency story, not yet a new-capability story.
