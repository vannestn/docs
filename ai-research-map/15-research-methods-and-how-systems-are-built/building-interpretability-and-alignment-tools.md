# Building Interpretability & Alignment Tools

How the techniques meant to *understand* and *align* models are themselves constructed — and the
methodological reasons they're not yet reliable enough to certify safety.

## (1) Sparse autoencoders & transcoders
- **Method:** train a sparse dictionary-learning layer on a frozen model's activations, then
  auto-label features by showing top-activating examples to an LLM.
- **Limitations:** features are **seed-unstable** (only ~30% shared across random seeds — though
  *subspaces* are reproducible); SAEs **underperform simple baselines** (logistic probes, prompting)
  on probing and steering — leading Google DeepMind to publicly deprioritize SAE research; bigger
  SAEs suffer **feature-splitting and "absorption."** The repositioned consensus: use SAEs to
  *discover unknown* concepts, not to *act on known* ones. [AxBench (ICML 2025)](https://arxiv.org/pdf/2502.16681)

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
- **Method:** red/blue games where trusted monitors/resampling catch an untrusted model's subversion.
- **Limitations:** results are measured in **single settings** (transfer unverified), bottom out at
  **human auditing** (little data on what helps humans), and **collapse under adaptive attacks** —
  a model that knows the protocol can prompt-inject the monitor, dropping safety from 89% to 17%.
  [adaptive attacks arXiv:2510.09462](https://arxiv.org/abs/2510.09462)

## State of research

**What's a solid method:** attribution graphs and SAEs are real, usable *investigative* tools;
auditing games and control evals operationalize safety testing; RLVR/process supervision are proven
*capability* recipes.

**What's fragile:** SAE features are unstable and beaten by baselines; circuit graphs are partial
and low-faithfulness; auditing depends on a biased judge and is defeated by eval-awareness; reward
models are gameable; control protocols break under adaptive attack.

**Bottom line:** interpretability and alignment tooling is good enough to **investigate** models but
**not yet to certify** them — every method has a documented way it gives false assurance, which is
exactly why "the science of evaluations is not mature" recurs across labs' own safety frameworks.
