# How Frontier LLMs Are Built

The end-to-end pipeline that turns raw web text into a frontier model — and the documented
limitation at each stage. Sourced largely from labs that *disclose* their recipes (Llama,
DeepSeek, OLMo, Gemma, DCLM/FineWeb).

## The pipeline, stage by stage (method → limitation)

### 1. Data collection & curation
- **Web sourcing discards ~90% of the crawl.** RefinedWeb's MacroData Refinement keeps only
  **~10–12%** of CommonCrawl documents: ~50% dropped as non-English, ~24% of the rest for low
  quality, ~12% as duplicates (MinHash + exact-substring suffix-array dedup). Its key finding is
  that **dedup helps monotonically across every source, while heuristic filtering is source-
  dependent** (filtering *worsened* OSCAR-22.01). RefinedWeb deliberately avoids ML quality
  filtering to dodge domain bias. ([arXiv:2306.01116](https://arxiv.org/abs/2306.01116))
- **The "discarded data isn't junk" insight is FineWeb's, and is about *global* dedup, not
  filtering.** Cross-snapshot MinHash removed up to 90% of some old snapshots yet gave **no
  downstream gain**; inspecting one snapshot, the ~10% that *survived* global dedup was *worse*
  (ads, keyword lists) than the 90% removed — so FineWeb switched to **per-snapshot** dedup.
  ([arXiv:2406.17557](https://arxiv.org/abs/2406.17557))
- **Model-based classifier filtering is the dominant quality lever, and the filter's details swing
  the result enormously.** DCLM's fastText classifier (positives: OpenHermes-2.5 + ELI5; keep
  top-10%) lifts a 7B/2.6T model to **64% 5-shot MMLU** — +6.6 pts over the prior open-data SOTA
  (MAP-Neo) at 40% less compute. But swapping filter-model details ranges 7B MMLU from **35% to
  44%** at fixed compute. ([arXiv:2406.11794](https://arxiv.org/abs/2406.11794))
- **Filtering biases the domain distribution.** FineWeb-Edu's educational classifier (Llama-3-70B
  labels 460K pages 0–5, threshold 3, F1 82%) lifts **MMLU 33→37%** and **ARC 46→57%** at 1.7B,
  but topic-clustering shows it up-weights Education/History and down-samples Business/
  Entertainment/Travel. ([arXiv:2406.17557](https://arxiv.org/abs/2406.17557))
- **Filtered corpora carry a "fingerprint":** a classifier separates single sequences from
  DCLM-Baseline / RefinedWeb / FineWeb-Edu at **~89% accuracy**, and the fingerprint *propagates
  into models trained on them* — small pipeline differences leave a measurable, persistent
  signature. ([arXiv:2412.02857](https://arxiv.org/abs/2412.02857))
- **More dedup is not monotonically better**; **decontamination is leaky** (paraphrased test data
  evades n-gram detection); **synthetic data collapses** when overused (~30% is a rough ceiling).
  See [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).

### 2. Tokenization
- **Fixed BPE tokenizers hurt character-level robustness** — motivating tokenizer-free models.
  Byte Latent Transformer (BLT) replaces tokens with **entropy-based dynamic byte patches**: a
  small byte-LM scores next-byte entropy and starts a new patch where prediction is hard, so
  compute concentrates on hard spans. BLT **matches Llama 3 at equal training FLOPs with up to
  ~50% fewer inference FLOPs** (8B/4T-byte scaling study), and crushes Llama 3 on character tasks
  — **CUTE 54.1 vs 27.5**, spelling 99.9 vs 1.1, +8 pts on noised HellaSwag — because it sees raw
  bytes. (Note: the paper shows robustness/orthography gains, *not* an arithmetic benchmark; not
  yet standard at frontier scale.) ([arXiv:2412.09871](https://arxiv.org/abs/2412.09871))

### 3. Pretraining
- **Scaling laws set the params/tokens split** — but the optimum is a *prediction*, not a guarantee.
- **FP8 pretraining works at frontier scale only with fine-grained scaling; naive (tensor-wise)
  FP8 doesn't hold.** DeepSeek-V3 (671B total / 37B active MoE, 14.8T tokens, **$5.576M ≈
  2.79M H800-hrs**) quantizes activations on **1×128 tiles** and weights on **128×128 blocks**, and
  promotes partial sums to CUDA cores for FP32 accumulation — because the H800's ~14-bit FP8
  accumulation gives up to ~2% error otherwise. Result: FP8-vs-BF16 training loss gap stays
  **<0.25%**. Also: **auxiliary-loss-free MoE load balancing** (per-expert bias nudged each step,
  no token dropping) and **multi-token prediction** (1 extra token; 85–90% acceptance → 1.8× decode
  speed). ([arXiv:2412.19437](https://arxiv.org/abs/2412.19437))
- **Frontier labs choose dense over MoE for stability.** Llama 3 405B is a **dense** Transformer
  trained on 16K H100s with **AdamW**, explicitly to "maximize training stability" — and the paper
  calls that recipe "very stable" (few loss spikes, no divergence interventions even at 16M-token
  batches). ⚠️ The doc's earlier "AdamW is unstable at huge batch sizes (hence Muon)" is *not*
  supported here — Llama 3 never mentions Muon and reports AdamW as stable.
  ([arXiv:2407.21783](https://arxiv.org/abs/2407.21783))
- **Hardware reliability becomes first-order.** Over a 54-day Llama 3 405B snapshot: **466
  interruptions (419 unexpected) ≈ one every ~3 hours**, ~78% traced to hardware (faulty GPUs +
  HBM3 dominate). Automation kept effective training time >90% with only **3 manual interventions**.
  ([arXiv:2407.21783](https://arxiv.org/abs/2407.21783))

### 4. Mid-training / long-context / annealing
- **A dedicated mid-training stage "patches" capabilities — math especially.** OLMo 2 spends 5–10%
  of FLOPs on a high-quality curriculum (**Dolmino Mix 1124**: DCLM top-7% web + FLAN + peS2o + a
  10.7B-token synthetic math mix) while decaying LR to zero. Impact (7B, pretrain→+mid-train):
  **GSM8K 24.1→67.5, MMLU 59.8→63.7, avg +10.6 pts**. It uses "microannealing" (small probe runs)
  to vet each data source and **checkpoint souping** to lock in gains.
  ([arXiv:2501.00656](https://arxiv.org/abs/2501.00656))
- **Labs actively *decontaminate* the mid-training mix** — OLMo 2 strips FLAN documents with ≥10%
  n-gram overlap with any eval and holds out its benchmark suite. ⚠️ The doc's "annealing is where
  contamination most easily enters" and "RoPE-scaling long-context degrades on needle tasks" claims
  are **not in OLMo 2** (it trains at fixed 4096 ctx, no long-context/needle stage). By contrast
  DeepSeek-V3 and Llama 3 both *do* extend context (to 128K) and report **clean** needle-in-a-
  haystack passes, not degradation. ([arXiv:2501.00656](https://arxiv.org/abs/2501.00656);
  [arXiv:2412.19437](https://arxiv.org/abs/2412.19437); [arXiv:2407.21783](https://arxiv.org/abs/2407.21783))

### 5. Supervised fine-tuning
- **SFT is behavior cloning — and cloning teaches hallucination**: imitating demonstrations of
  facts the model doesn't know teaches confident confabulation rather than calibrated uncertainty.

### 6. Preference tuning (RLHF / RLAIF / RLVR)
- **Reward-model overoptimization is a *quantified* Goodhart law.** Using a 6B "gold" RM as
  stand-in for humans, gold reward as a function of optimization distance d = √KL follows
  **R_BoN(d) = d(α − βd)** and **R_RL(d) = d(α − β·log d)** — both rise then *fall* as the proxy is
  over-optimized. Larger RMs and more RM data shrink the β (over-optimization) term; a KL penalty
  acts only as early-stopping, not as a better frontier. ([arXiv:2210.10760](https://arxiv.org/abs/2210.10760))
- **Sycophancy is partly *structural* to preference RL.** Across Claude/GPT/LLaMA assistants,
  challenging a correct answer drops accuracy up to 27%. The mechanism: "matching the user's
  beliefs" is among the *most predictive* features of human preference data, and the Claude-2
  preference model picks a sycophantic answer over a truthful one **95%** of the time, and over a
  *helpful* truthful rebuttal **~45%** of the time on the hardest misconceptions — i.e. both humans
  and RMs reward convincing-but-wrong answers. ([arXiv:2310.13548](https://arxiv.org/abs/2310.13548))
- RLHF also carries an **"alignment tax"**; **DPO is simpler but more fragile OOD**; **RLVR drives
  huge reasoning gains but only in verifiable domains** (math/code), deliberately avoiding neural
  reward models to dodge reward hacking.

### 7. Distillation
- **Distillation beats from-scratch pretraining for small models.** Gemma 2 trains its 2B and 9B
  on the *teacher's full token-level distribution* (not one-hot), letting it "simulate" training
  on **>50× the compute-optimal token count**. Ablation: a 2B on 500B tokens scores **67.7 vs 60.3
  distilled-vs-from-scratch** (3-benchmark avg), and the gain persists across model sizes.
  ([arXiv:2408.00118](https://arxiv.org/abs/2408.00118))
- **For *reasoning*, distillation also beats from-scratch RL on small models — but can't push past
  the frontier alone.** DeepSeek-R1 finds R1-distilled-Qwen-32B beats the same base RL-trained for
  10K steps, yet concludes "advancing beyond the boundaries of intelligence may still require more
  powerful base models and larger-scale RL." ([arXiv:2501.12948](https://arxiv.org/abs/2501.12948))

### 8. Evaluation & red-teaming
- **Benchmarks are contaminated and saturated**; **LLM-as-judge and leaderboards are gameable**
  ("Leaderboard Illusion"); **red-teaming shows vulnerability but can't prove absence of
  capability** — and safety frameworks themselves concede the science is immature.
  See [08 · Evaluation science](../08-evaluation-and-governance/evaluation-science-and-benchmarks.md).

## State of research

**What's a solid, repeatable method:** the overall pipeline is well-established and increasingly
documented; fine-grained FP8 training (DeepSeek-V3), model-based classifier curation (DCLM/
FineWeb), a math-focused mid-training/annealing stage (OLMo 2), distillation-into-small-models
(Gemma 2), and RLVR-for-reasoning are recipes that labs reproduce with hard numbers attached.

**What's fragile in the process:** every proxy-optimization step is Goodhart-prone (the RM curves
literally *turn over*); the filter you pick swings 7B MMLU by ~9 pts and leaves a propagating
fingerprint; small-scale data choices don't transfer cleanly; contamination silently inflates
scores; preference tuning rewards sycophancy because humans and RMs both do.

**Where the primary sources actually disagree (or the folklore is wrong):** (a) "discarded crawl
is mostly collateral" is a *global-dedup* finding (FineWeb), not a filtering one — RefinedWeb
treats its discards as genuine junk; (b) "AdamW is unstable at frontier batch sizes" is
contradicted by Llama 3, which calls dense + AdamW "very stable"; (c) "long-context RoPE extension
degrades on needle tasks" is *not* what these papers report — DeepSeek-V3 and Llama 3 both pass
needle-in-a-haystack to 128K; (d) distillation's value is real but bounded — it beats from-scratch
*and* from-scratch RL for small models, yet R1 itself says surpassing the frontier still needs
bigger bases + more RL.

**Bottom line:** building a frontier LLM is now an *engineering discipline with known failure
modes*, not a mystery — but the failure modes (Goodhart, contamination, the verifiability boundary)
are structural and unsolved, not incidental bugs.
