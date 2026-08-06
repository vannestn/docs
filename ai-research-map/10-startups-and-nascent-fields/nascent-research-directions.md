# Nascent Research Directions

## In brief
- **What it is** — a scouting report on the *edges* of AI research: genuinely early-stage ideas that have real papers and labs behind them but are unproven at scale. Some will grow into major fields; many will fade.
- **Why it's pursued** — mapping a field honestly means capturing the frontier, not just the crowded center. These directions are where the next paradigm might come from — new architectures, new ways to interpret models, new kinds of reasoning — precisely because they are not yet mainstream bets.
- **Potential impact** — any one of these could become foundational (a post-transformer architecture, a way to give neural code correctness guarantees, a lab-in-a-box for social science). The honest expectation is that *most will not* — so these are high-variance, low-confidence signals to track rather than conclusions to rely on.

> **📦 How to read this** — these are lower-confidence, higher-variance directions. Each is
> real (it has papers and labs behind it) but unproven at scale.

## Architecture & learning paradigms
- **Test-time training as continual learning** — models that keep updating their own weights
  *while running*. (See [02 · Post-transformer](../02-architectures-and-training/post-transformer-architectures.md).)
- **Energy-based / JEPA world models** — predicting in abstract representation space rather
  than generating tokens/pixels; LeCun's long-standing bet, now AMI Labs.
- **Nested learning** — see [the dedicated section below](#nested-learning-spotlight).
  [arXiv:2512.24695](https://arxiv.org/abs/2512.24695)
- **Active inference / Free Energy Principle** — a Bayesian, brain-inspired alternative to
  deep RL built on Karl Friston's Free Energy Principle; a rare commercial non-LLM bet (VERSES
  AI's "Genius", a Bayesian inference engine).
  [Source](https://www.verses.ai/active-inference-research)

## Interpretability frontiers
- **Persona vectors** — linear "trait directions" (honesty, sycophancy) that may explain and
  control behavior.
- **Introspection** — whether models can accurately report their own internal states.
- **Model diffing** — comparing two models' internals to localize what changed.
  (All three: [11 · Interpretability frontiers](../11-emerging-application-subfields/interpretability-and-nascent-directions.md).)

## Reasoning & agents
- **Neurosymbolic / proof-carrying code** — neural generation with *symbolic* correctness
  guarantees attached. See [the spotlight below](#proof-carrying-neuro-symbolic-code-spotlight).
  [arXiv:2504.12031](https://arxiv.org/abs/2504.12031)
- **Agent societies** — thousands of LLM agents as a computational social-science lab.
  See [the spotlight below](#agent-societies-spotlight).
  [AgentSociety arXiv:2502.08691](https://arxiv.org/abs/2502.08691)
- **Self-improving / open-ended systems** — see [04](../04-reinforcement-learning-and-open-endedness/open-endedness-and-self-improvement.md).

## Hardware-adjacent
- **Spiking / neuromorphic LLMs**, **photonic** and **analog in-memory** computing — striking
  efficiency, pre-commercial. (See [07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md).)

## Paper spotlights

Three of the directions above have full primary sources on hand. Here's what they actually
argue — mechanism, evidence, and the limits the authors themselves flag.

### Nested learning {#nested-learning-spotlight}

*"Nested Learning: The Illusion of Deep Learning Architectures"* — Behrouz, Razaviyayn, Zhong &
Mirrokni (Google Research), [arXiv:2512.24695](https://arxiv.org/abs/2512.24695); a version
appears at NeurIPS 2025. Public write-up:
[Google Research blog](https://research.google/blog/introducing-nested-learning-a-new-ml-paradigm-for-continual-learning/).

**The reframe.** A model plus its optimizer is recast as a set of *nested optimization problems*,
each an **associative memory** that compresses its own "context flow" into parameters at its own
**update frequency**. Two claims do the work: (1) backprop on a layer is itself an associative
memory mapping inputs to their *local surprise signal* (the gradient); (2) common optimizers are
the same trick one level up — momentum is shown to be a memory that compresses past gradients, so
SGD-with-momentum is literally a two-level optimization. Transformers fall out as a special case:
attention runs at frequency ∞, the MLP and pre-training at frequency ~0.

**What's new on top.** A **Continuum Memory System (CMS)** — a chain of MLP blocks each updated
every *Cᵗ* steps rather than one "long-term vs short-term" split — and **Hope**, a self-modifying
variant of the **Titans** architecture wrapped in CMS. Supporting pieces: Delta Gradient Descent
(DGD) and a Multi-scale Momentum Muon (M3) optimizer.

**Results (as reported).** On language modeling + common-sense reasoning, Hope leads the
attention-free baselines: at 1.3B params / 100B tokens it posts **Wikitext ppl 14.39 and LMBADA
ppl 10.08** vs Titans 15.60 / 11.41 and Transformer++ 17.92 / 17.73 (Table 2). On long-context,
Hope holds accuracy out to **10M tokens** on BABILong where Titans/ARMT fall off after ~1M
(Table 9 / Fig. 9). On class-incremental learning (CLINC, Banking, DBpedia) Hope beats in-context
learning, EWC, and an external-learner baseline (InCA) on Llama3-3B/8B (Fig. 6). Ablations show
every component (DGD, momentum, weight decay, CMS, inner-projections) contributes (Table 6).

**Author-stated limits.** The M3 optimizer is an explicit proof-of-concept that "might suffer from
computational overhead" and is *slower* than Muon at 1.3B (Fig. 12). And the conclusion is blunt:
catastrophic forgetting is **not "solved"** — in their framing it's a natural consequence of
finite-capacity compression, and NL is offered as a "roadmap, not a destination."

### Agent societies {#agent-societies-spotlight}

*"AgentSociety: Large-Scale Simulation of LLM-Driven Generative Agents…"* — Piao et al. (Tsinghua),
[arXiv:2502.08691](https://arxiv.org/abs/2502.08691).

**Scale & mechanism.** Over **10k** LLM agents generating **~5 million interactions** (≈500/agent/day;
Table 5 measures 491.68 environment interactions per agent per day). Each agent has a mind — emotion
(a six-emotion 0–10 framework), Maslow needs, and cognition — feeding a Need→Plan→Behavior loop over
**Stream Memory** (an Event Flow plus Perception Flow). The world is three coupled spaces: urban
(OpenStreetMap roads/AOI/POI, IDM + MOBIL traffic models, SafeGraph POIs), social (a supervisor-moderated
message network), and economic (firms/banks/government, Taylor-rule interest). The engine runs on
**Ray plus an MQTT (EMQX) messaging backbone**; experiments used **DeepSeek-V3**.

**Why MQTT (with the eval).** Against Redis/RabbitMQ/Kafka at 100k agents, MQTT hit **44,702 msg/s**
— roughly *half* Redis Pub/Sub's 81,216, but with built-in monitoring tooling; RabbitMQ only
cleared the 20k msg/s bar marginally and Kafka couldn't even finish 100k-agent init in 5 min (Table 3).
Environment step time stays sub-second to **1M individuals** (0.168 s/step; Table 2).

**Five social experiments — concrete findings.** (1) *Polarization* (gun control, 100 agents):
echo-chamber homophilic exposure pushed **52%** more polarized; heterogeneous exposure flipped it —
**89%** became *less* polarized (Fig. 16). (2) *Inflammatory messages* (Xuzhou "chained woman" case):
inflammatory content spreads wider than neutral; **node-level** moderation beats edge-level (Fig. 17).
(3) *UBI* ($1,000/mo, Texas): consumption up, depression (CES-D) down — matching the real Texas trial
direction (Figs. 19–20). (4) *Hurricane Dorian* (Columbia SC, 1,000 agents): activity level drops from
70–90% to ~30% at landfall then recovers, tracking SafeGraph mobility (Figs. 22–23). (5) *Urban
sustainability* (Beijing, 200 agents, 6 research teams): interventions stressing **personal/identity
norms** cut mobility CO₂ more than injunctive-norm messaging (Figs. 24–25).

**Limits the paper names.** The economic model omits goods/labor-market dynamics (no unemployment,
no market shocks); the social module is mostly *online* messaging; results lean on DeepSeek-V3 and
inherit LLM hallucination/cost constraints.

### Proof-carrying neuro-symbolic code {#proof-carrying-neuro-symbolic-code-spotlight}

*"Proof-Carrying Neuro-Symbolic Code"* — Ekaterina Komendantskaya (Southampton / Heriot-Watt),
[arXiv:2504.12031](https://arxiv.org/abs/2504.12031). Note this is an **invited-talk overview**, not
an empirical results paper — it frames problems rather than reporting benchmarks.

**The idea.** A neuro-symbolic program is modelled as `s(u ∘ f ∘ e)` — a neural net `f` embedded
between embed/unembed maps inside a symbolic program — and proving a property Ψ decomposes into three
lemmas: a *network* property Ξ(f), a *solution* property Φ, and the *program* property Ψ. The running
example is a neural controller for adaptive cruise control, where safety reduces to a reachability
bound on `f`. Proof-carrying code's three-decade tradition (Necula 1997) is argued to still apply.

**Three challenges it lays out.** (1) **Multi-backend interfaces** — high-level provers (Agda, Rocq,
Idris) prove Ψ but not the low-level real-vector reachability that NN solvers (Marabou, αβ-CROWN, PyRAT)
handle; the **Vehicle** DSL bridges them but currently only interfaces Marabou + Agda. (2) **Formal proof
certificates** — NN verifiers have implementation/floating-point bugs and can be fooled, so you check
the *proof evidence*, not the verifier; Marabou proof production reduces to the **Farkas lemma**, and the
Imandra theorem prover yielded the first *certified* proof checker for NN verification. (3) **Compiling
specs to loss functions** via **differentiable logic** (DL) — but most quantitative/fuzzy logics that
ground DL are *propositional*, and first-order extensions trade off completeness vs. gradient-friendly
continuity (Gödel logic is sound/complete but its min/max connectives aren't continuous). Capucci's
*p-means* quantifiers are flagged as a promising open route.

**Honest framing.** The paper's own thesis is the modest one: proof-carrying code "bears meaning in the
age of the neuro-symbolic paradigm shift" — the contribution is conceptual unification of PL and ML
verification traditions, with the hard problems (general-purpose multi-backend compilation,
first-order differentiable logics) explicitly **unresolved**.

## State of research

**Best-performing now:** Persona vectors and introspection have the most concrete early
interpretability results on frontier models. Test-time training has working implementations.
Of the spotlighted three, **nested learning / Hope** has the strongest empirical case
(competitive 1.3B language modeling, 10M-token long-context wins, continual-learning gains over
EWC/ICL) and **AgentSociety** the most concrete *applied* validation (five social experiments
matching real-world direction at 10k agents).

**Promising but unproven:** JEPA/energy-based models and active inference are conceptually
compelling but lack frontier-scale wins. Nested learning's wins are real but the authors stress
they don't *solve* catastrophic forgetting, and M3 carries compute overhead. **Neurosymbolic
proof-carrying code** remains largely *conceptual*: its source here is an invited overview, and
the load-bearing problems (multi-backend compilation, first-order differentiable logics) are
openly unresolved.

**Open problems & weaknesses:** By definition these are early — often small-scale, few labs, little
replication; even the strong results lean on specific backbones (Hope on Titans/CMS, AgentSociety on
DeepSeek-V3). The honest expectation is that **most will not become major fields**, but the
ones that do could be foundational. Track them; don't bet the farm on any single one.
