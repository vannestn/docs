# Open-Source & Decentralized

## In brief
- **What it is** — the labs and movements that treat *openness* and *decentralization* as
  research values in their own right. Two threads: releasing models the public can freely use
  and study (from just the weights to the full training data, code, and checkpoints), and
  training models across many scattered machines instead of one datacenter.
- **Why it's pursued** — a fully transparent model lets outsiders reproduce results and study
  *how* it works, not just use it; decentralized training aims to pool compute that no single
  organization owns, loosening the frontier's dependence on giant private datacenters.
- **Potential impact** — if it succeeds, capable AI becomes cheaper to scrutinize and harder to
  monopolize, and training can draw on distributed hardware. The key limitation: open models
  still trail the closed frontier (~4 months as of 2026), "open" does not mean cheap to build,
  and decentralized *pretraining* at frontier scale remains unproven.

> **📦 Concept: "fully open" vs "open-weight"** — An *open-weight* release ships only the
> trained model. A *fully open* release also includes the **training data, code, and
> intermediate checkpoints**, so others can reproduce and study the whole process. Ai2's OLMo
> is the leading fully-open example.

> **📦 Concept: "decentralized training"** — training one model across many machines in
> different locations (sometimes owned by different people) over the internet, instead of in a
> single datacenter. It's hard because the machines must constantly share huge updates, so the
> research focuses on cutting that communication cost.

## The players

- **Allen Institute for AI (Ai2)** — **OLMo 3** (7B/32B). Its flagship **Olmo 3.1 Think 32B**
  is the strongest *fully-open* thinking model to date, narrowing the gap to Qwen 3 32B while
  trained on ~6× fewer tokens. Every stage is released — the full "model flow": pretrain (5.9T
  tokens) → midtrain → long-context → SFT → DPO → RLVR, with all data, code, and intermediate
  checkpoints. [arXiv:2512.13961](https://arxiv.org/abs/2512.13961)
- **EleutherAI** — open datasets and interpretability; **Common Pile v0.1**, an 8TB corpus of
  *public-domain and openly licensed* text (30 sources). Their **Comma v0.1** 7B models (1T/2T
  tokens), trained only on it, perform comparably to models trained on unlicensed data in the same
  regime. [EleutherAI](https://blog.eleuther.ai/common-pile/)
- **Prime Intellect** — **INTELLECT-2**, the first globally *decentralized* RL training run of a
  32B model (RL fine-tune of QwQ-32B) across a permissionless, heterogeneous compute swarm.
  [arXiv:2505.07291](https://arxiv.org/abs/2505.07291)
- **Nous Research** — the **Psyche** decentralized network (on Solana) + **DisTrO** optimizer.
  **Hermes 4.3** (36B, on Seed-OSS-36B-Base) was post-trained *entirely* on Psyche; the
  decentralized run *outperformed* the centralized (FSDP+AdamW) version on downstream tasks, with
  comms overhead fully hidden (144k tok/s across 24 nodes).
  [Nous](https://nousresearch.com/introducing-hermes-4-3)

## How the two flagship efforts actually work

### INTELLECT-2 — RL across a permissionless swarm

The hard problem in decentralized RL isn't the optimizer — it's *trust* and *communication*
across nodes you don't control. Prime Intellect's answer is an asynchronous split: the **bulk of
compute (inference) runs on untrusted, consumer-grade GPUs**, while only the trainer nodes are
trusted. Three custom components make this work:

- **TOPLOC** — a locality-sensitive hashing scheme that lets a validator re-verify an untrusted
  node's rollout up to **100× faster** than generating it, catching tampering, quantization, or
  wrong weights. Honest nodes earn rewards; cheating nodes get *slashed and evicted*.
- **SHARDCAST** — a CDN-like tree network that broadcasts new policy weights to inference
  workers. In the runs, a full broadcast of 62 GB of weights averaged **~14 min** (~590 Mb/s).
- **PRIME-RL** — a fully asynchronous framework that decouples rollout generation, training, and
  weight broadcast, so weight-broadcast latency is *overlapped* with ongoing work (a
  two-step-async design that tolerates up to ~4 steps of staleness without hurting reward).

Two recipe tweaks were "crucial" for stability at 32B: **two-sided GRPO clipping** (adds an
upper bound `δ` on the token-probability ratio for negative-advantage tokens, stopping the
loss/gradient spikes that caused collapse), and aggressive **offline + online data filtering**
(drop problems that are too easy or too hard; only train on batches with non-zero advantage).

**Results & honest framing (Table 1):** INTELLECT-2 is an RL fine-tune of **QwQ-32B**, not a
from-scratch model. It modestly improves its base on math/code — AIME24 78.8 (vs 76.6), AIME25
64.9 (≈64.8), LiveCodeBench-v5 67.8 (vs 66.1) — with a small *drop* on IFEval (81.5 vs 83.4).
The authors are candid: QwQ-32B "was already extensively trained with RL," so large gains were
hard, and they expect better base models or higher-quality RL environments are needed. The real
contribution is the **infrastructure**, not a new SOTA. Training-to-inference compute ran ~1:4,
and the authors argue this inference-heavy profile is *why* test-time-compute RL suits
decentralization. [arXiv:2505.07291](https://arxiv.org/abs/2505.07291)

### OLMo 3 — full traceability as a research instrument

Ai2's pitch is the **"model flow"**: not just final weights but every checkpoint, datapoint,
and recipe across the whole lifecycle. **Olmo 3.1 Think 32B** is the strongest fully-open
thinking model — beating Qwen 2.5 32B-Instruct, Gemma 2/3 27B, DeepSeek R1, and Distilled
Qwen 32B, and close to Qwen 3 32B — while trained on ~6× fewer tokens (Table 14). Post-training
is a three-stage **SFT → DPO → RLVR** recipe (**Dolci** data + **OlmoRL** framework):

- **Delta Learning DPO** drives gains that SFT alone cannot. Continued SFT on the same
  (Qwen3-32B-thinking) responses *hurt* the SFT model, but pairing those responses with *worse*
  ones from a weak model (Qwen3-0.6B) yields a useful preference signal that expands the reasoning
  frontier (pass@k), not just pass@1.
- **OlmoRL** = GRPO plus DAPO/Dr-GRPO improvements (no KL loss, clip-higher, token-level loss,
  truncated importance sampling, no-std-dev advantage normalization, plus active sampling). The
  infra changes — **continuous batching + in-flight weight updates** — gave a **~4× RL throughput
  speedup** (Table 23: MFU 0.30→1.01%, MBU 12.9→43.2%). **Olmo 3.1 Think 32B** comes from
  *extending* that RL run (~2300 steps), adding +4 AIME, +4 ZebraLogic, and +20 IFBench.

The traceability isn't cosmetic — it enables experiments impossible elsewhere. The **RL-Zero**
release (RLVR directly from base) is decontaminated against pretrain/midtrain data, enabling a
*spurious-rewards control*: training on **random rewards yields no benchmark gains** (Fig 27),
proving the eval improvements are real RL learning, not leaked memorization. This is the kind of
"study how models work" claim only a fully-open flow can substantiate.
[arXiv:2512.13961](https://arxiv.org/abs/2512.13961)

> **Cost note:** OLMo 3 is "fully open" but not cheap — ~56 days on 1024 H100s (~$2.75M at
> $2/H100-hr), pretraining ~47 of those days. Openness ≠ low resource.

## State of research

**Best-performing now:** Fully-open models (OLMo 3) are genuinely competitive for their size and
are the best resource for *studying* how models work — full checkpoints + decontaminated data let
researchers isolate cause and effect (e.g. the spurious-rewards test above). Open clean corpora
(Common Pile) show licensed-only pretraining is viable, matching unlicensed-data baselines in the
same regime — though EleutherAI notes a residual gap vs heavily-filtered FineWeb.

**Promising — and now partly proven:** **Decentralized training.** INTELLECT-2 demonstrated
decentralized *RL* at 32B across a permissionless swarm, and Nous's **Hermes 4.3** went further —
*post-trained entirely* on the Psyche network and *beating* its own centralized twin. The earlier
"mission-vs-execution gap" (flagship decentralized models still pretraining on central clusters)
is narrowing specifically for the **post-training / RL** stage, where the inference-heavy,
communication-tolerant profile fits decentralization best. Frontier *pretraining* across the open
internet remains unproven.

**Open problems & weaknesses (as the papers argue them):**
- **Trust/verification** of untrusted nodes — solved for inference via TOPLOC-style re-verification
  plus slashing, but Prime Intellect *deliberately avoided* P2P weight transfer (using centralized
  trusted relays instead) over security/DoS concerns; the orchestrator and discovery remain
  centralized (single points of failure), with a DHT-based P2P design listed as future work.
- **Communication efficiency** — DisTrO/DiLoCo cut comms by orders of magnitude, but blocking
  communication re-emerges as the bottleneck at larger model sizes.
- **Better base models / RL environments** — INTELLECT-2's gains were capped by an already-RL'd
  base; the bottleneck is increasingly *data and environments*, not infra.
- **Capability lag:** open-weight models trail the closed frontier — Epoch's ECI puts the gap at
  ~4 months since Jan 2026 (up from a ~3-month long-run average), and notes open models may
  over-fit public benchmarks. [Epoch](https://epoch.ai/data-insights/open-closed-eci-gap)
- **Economics:** sustaining funding without a closed-product business model is the structural
  challenge (see
  [12 · Business models](../12-politics-capital-and-business-models/business-models.md)).
