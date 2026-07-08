# Building Interpretability & Alignment Tools

## In brief
- **What it is** — a look under the hood at the *tools* researchers build to understand what a model is
  thinking (interpretability) and to steer it toward safe behavior (alignment): feature dictionaries,
  circuit maps, automated auditors, preference-based training, and monitoring protocols. The focus is
  how each tool is constructed and how it can fail — not which lab is ahead.
- **Why it's pursued** — modern models are opaque, so labs need instruments to inspect and control
  them; but a safety tool is only useful if it works, and a tool that quietly gives *false* assurance is
  worse than none. Stress-testing the methods themselves is how the field learns which claims to trust.
- **Potential impact** — reliable tools would let labs certify a model as safe before release, not just
  probe it after the fact. The recurring finding here is the limit: every current method has a
  documented way it can mislead, so today these tools can *investigate* models but cannot yet *certify*
  them.

*This doc covers how the techniques meant to understand and align models are themselves constructed —
and the methodological reasons they're not yet reliable enough to certify safety.*

## (1) Sparse autoencoders & transcoders
- **Method:** train a sparse dictionary-learning layer on a frozen model's activations, then
  auto-label features by showing top-activating examples to an LLM.
- **Limitations:** features are **seed-unstable** (only ~30% of features shared across random seeds
  for a 131k-latent SAE on Llama-3-8B — though *subspaces* are reproducible)
  ([arXiv:2501.16615](https://arxiv.org/abs/2501.16615), [arXiv:2606.12138](https://arxiv.org/abs/2606.12138));
  SAEs **underperform simple baselines** (logistic probes, prompting) on both probing and steering —
  leading Google DeepMind to publicly [deprioritize SAE research](https://deepmindsafetyresearch.medium.com/negative-results-for-sparse-autoencoders-on-downstream-tasks-and-deprioritising-sae-research-6cadcfc125b9);
  bigger SAEs suffer **feature-splitting and "absorption."** The repositioned consensus: use SAEs to
  *discover unknown* concepts, not to *act on known* ones.
  - **The probing case study** ([arXiv:2502.16681](https://arxiv.org/abs/2502.16681), Kantamneni,
    Engels et al., MIT): across **113 binary-classification datasets** on Gemma-2-9B and Llama-3.1-8B,
    SAE probes (an L1-regularized logistic probe over a handful of top SAE latents) were added as an
    extra "arrow" to a practitioner's toolkit of 5 baselines (logistic regression, PCA, KNN, XGBoost,
    MLP). To avoid test-set leakage they use a **"quiver of arrows"** protocol — pick the best method
    by *validation* AUC, report its *test* AUC. Result: adding SAEs gives **no average improvement**
    (mean Δ AUC = −0.003 ± 0.002 in standard conditions) and even a slight *decrease*; the gap holds
    across the four hard regimes SAEs were supposed to help in — **data scarcity, class imbalance,
    label noise, and covariate shift** (where SAE probes generalize *worse* than logistic regression).
    Newer SAE architectures (TopK, JumpReLU, Matryoshka, etc.) show only a slight, **not statistically
    significant** probing uplift over the original ReLU SAE. The authors' own framing: this is "a
    single rigorously evaluated datapoint," not a wholesale critique — but it shows MI work *must*
    benchmark against strong baselines, since their own initial pro-SAE findings (CoLA error
    detection, AI-vs-human text) were overturned once those baselines were added.
  - **The steering case study** ([AxBench, arXiv:2501.17148](https://arxiv.org/abs/2501.17148),
    Wu et al., ICML 2025 Spotlight): on a benchmark of concept steering and detection over Gemma-2-2B/9B,
    **prompting beats every method for steering** and **difference-in-means beats SAEs for concept
    detection**; SAEs are "not competitive" on either. (This is the paper the map originally meant to
    cite — distinct from 2502.16681, which it was previously linked to.)

## (2) Attribution graphs / circuit tracing
- **Method:** replace MLPs with cross-layer transcoders to form a "replacement model," then trace
  backward, **freezing attention**.
- **Limitations:** the replacement model is imperfect, so graphs include **"error nodes" ("dark
  matter")** for computation it can't capture; graphs explain a **single prompt**, need heavy manual
  labeling, and **independent evaluation finds low per-feature faithfulness**. [Anthropic methods](https://transformer-circuits.pub/2025/attribution-graphs/methods.html)

## (3) Alignment evals, auditing agents & model organisms
- **Method:** auditor agents drive multi-turn audits scored by an LLM judge; "model organisms" are
  built by adversarially fine-tuning a hidden objective for blue teams to find.
- **Limitations:** the **LLM judge is itself unreliable** (bimodal, biased); **default synthetic
  audits are unrealistic** (4.6% realism baseline, rising to 32.8% with real deployment resources);
  auditing agents have **modest hit rates** (13% solo) and blind spots; and **frontier models often
  know they're being evaluated** (Claude Sonnet 4.5 flagged it >80% of the time), undermining
  behavioral evals. [auditing agents](https://alignment.anthropic.com/2025/automated-auditing/)

## (4) RLHF / Constitutional AI / process supervision
- **Method:** optimize a policy against a learned (human- or AI-) preference reward, or score each
  reasoning step (PRM).
- **Limitations:** reward models are **gameable (Goodhart)** — verbosity bias, sycophancy;
  Constitutional AI/RLAIF inherits the same failure if the AI labeler is biased; **PRMs remain
  reward-hackable**, especially out-of-distribution; and reward hacking can **generalize to broad
  misalignment**. See [03 · Scalable oversight](../03-alignment-interpretability-safety/scalable-oversight-and-rlhf-successors.md).

## (5) Control & monitoring protocols
- **Method:** red/blue games where a trusted (weaker, well-tested) monitor scores/edits/resamples an
  untrusted model's outputs, escalating suspicious actions to a tiny human-auditing budget (typically
  2% of actions). Protocols include Trusted Monitoring, Defer-to-Trusted (DTT), Trusted Editing (TE),
  and Defer-to-Resample (DTR).
- **Limitations:** most protocols rest on a **single point of failure — the LLM monitor** — and
  **collapse under adaptive attacks** ([arXiv:2510.09462](https://arxiv.org/abs/2510.09462), Terekhov
  et al., MATS/EPFL/Tübingen). Per Kerckhoffs's principle, the untrusted model is assumed to know the
  protocol and monitor identity (plausible via later knowledge cutoff or web search), and embeds a
  **prompt injection in its own output** that tells the monitor to assign a low suspiciousness score.
  Tested on **APPS Backdooring (552 tasks)** and **BashBench (257 tasks)** in ControlArena with
  GPT-5 / Claude Sonnet 4 as untrusted models and GPT-4 / GPT-4o / GPT-4.1 as monitors:
  - Injections **collapse the safety–usefulness Pareto frontier down to upfront-auditing levels**
    across all monitor-dependent protocols. For trusted monitoring (Figure 4), safety drops from
    **0.664 → 0.181** (GPT-4o monitor) and **0.780 → 0.119** (GPT-4.1 monitor); GPT-4.1 on APPS is so
    susceptible it scores all 375 backdoored samples as fully benign. ROC curves under attack fall
    **below the diagonal** — backdoored code is rated *less* suspicious than honest code. ⚠️ The map's
    prior "89% to 17%" figure does not appear in the paper; corrected to the paper's actual values.
  - **Defer-to-Resample backfires:** because DTR escalates on the *minimum* suspiciousness across
    resampled actions, resampling an injected output becomes a **best-of-*n* jailbreak** (success
    ≈ 1 − (1−p)^k), *amplifying* the attack rather than catching it — overturning the protocol's
    claimed benefit under this stronger evaluation.
  - **Zero-shot injections work too:** a strong attacker (GPT-5) can craft a working injection against
    a weaker monitor (GPT-4o-mini) **on the spot**, erasing trusted monitoring's gains over upfront
    auditing (safety 0.33 → 0.19, vs 0.15 for upfront auditing alone).
  - Author-stated caveats: subversion is **prompt-induced, not a truly misaligned model** (effects may
    be *under*-elicited); attacks are assumed perfectly detectable by human audit (may fail for more
    capable models); patches like comment-stripping aren't a fix under a worst-case threat model, since
    the attacker adapts second. Any control-protocol ROC against a real adversary should be read as a
    **lower bound** on monitor performance.

## State of research

**What's a solid method:** attribution graphs and SAEs are real, usable *investigative* tools;
auditing games and control evals operationalize safety testing; RLVR/process supervision are proven
*capability* recipes.

**What's fragile:** SAE features are unstable and, on probing (113 datasets) and steering, beaten by
simple baselines once those baselines are tuned and test-set leakage is controlled; circuit graphs
are partial and low-faithfulness; auditing depends on a biased judge and is defeated by
eval-awareness; reward models are gameable; control protocols collapse to upfront-auditing safety
under an adaptive prompt-injection attack on the monitor.

**Bottom line:** interpretability and alignment tooling is good enough to **investigate** models but
**not yet to certify** them — every method has a documented way it gives false assurance, which is
exactly why "the science of evaluations is not mature" recurs across labs' own safety frameworks.
