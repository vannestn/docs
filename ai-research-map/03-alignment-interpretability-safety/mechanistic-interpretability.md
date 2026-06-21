# Mechanistic Interpretability

Reverse-engineering the internal computations of models into human-understandable
mechanisms — now with tools usable enough to debug behavior and audit for hidden goals.

## Key directions & work

### Circuit tracing & attribution graphs
- **Cross-layer transcoders + attribution graphs** are the dominant paradigm: train a
  *replacement model* whose sparse, often-interpretable features (~30M across all layers)
  stand in for the MLP neurons, then build per-prompt attribution graphs that trace
  computation. Anthropic used this on **Claude 3.5 Haiku** to surface planning (e.g. rhyme
  pre-planning in poetry), multi-step reasoning, and a multilingual "language of thought."
  *["On the Biology of a Large Language Model"](https://transformer-circuits.pub/2025/attribution-graphs/biology.html)* (case studies) +
  *["Circuit Tracing"](https://transformer-circuits.pub/2025/attribution-graphs/methods.html)* (methods), both March 2025.
- **Open-source tooling**: `circuit-tracer` released **May 29, 2025** (Anthropic Fellows ×
  Decode Research), generating attribution graphs on open-weights models with an interactive
  [Neuronpedia](https://www.neuronpedia.org/) front-end.
  [Anthropic](https://www.anthropic.com/research/open-source-circuit-tracing)
- Extensions: reasoning-model **diffing** via transcoder adapters; code-correctness inference
  from attribution graphs. ⚠️ unverified (no primary source on disk; 2026 arXiv IDs unconfirmed).

### Sparse autoencoders & feature interpretation
- **Open-source auto-interpretability** for SAE features: an LLM pipeline that generates
  natural-language explanations and scores them via *detection*, *fuzzing*, *generation*, and
  *neighbors* — cheaper than prior simulation scoring (auto-interpreting 1.5M GPT-2 features
  ≈ \$1,300 with open models vs. ~\$200k for prior methods). Confirms SAE latents are far more
  interpretable than raw/top-k neurons. EleutherAI (Juang, Paulo, Drori, Belrose), July 2024;
  library `Delphi`/`sae-auto-interp`. [blog](https://blog.eleuther.ai/autointerp/)
- Hosted SAE interpretability as a *product*: **Goodfire's Ember** (launched Dec 2024, billed
  as the first mechanistic-interpretability product) trains SAEs on activations (e.g. Llama
  3.3 70B), maps features to concepts, and enables "surgical editing"/steering of behavior.
  See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

### Introspection & persona directions
- **Emergent introspective awareness** ([arXiv:2601.01828](https://arxiv.org/abs/2601.01828),
  Jack Lindsey / Anthropic, Jan 2026) — the headline mechanistic-adjacent result on
  *self-knowledge*. Uses **concept injection**: extract a concept vector from a contrastive
  prompt pair (or by mean-subtracting "Tell me about {word}" activations over 50 random
  words), add it to the residual stream, then ask the model about its own state.
  - **Four criteria** define introspective *awareness*: accuracy, **grounding** (causal
    dependence on the state), **internality** (influence must not route through the model's
    own sampled outputs), and a **metacognitive representation** (the paper concedes it does
    not demonstrate this directly — flagged as a key limitation).
  - **Four experiments**: (1) *detecting injected "thoughts"* — Opus 4.1 succeeds on **~20%**
    of trials at the best layer/strength, with **0 false positives over 100 control trials**
    for all production models; (2) *distinguishing injected thoughts from text input* — all
    models above chance, Opus 4.1/4 best (~66–74% both-correct); (3) *detecting unintended
    (prefilled) outputs* — retroactively injecting the prefilled word's vector makes the model
    accept an artificial prefill as intentional (lower "apology rate"); (4) *intentional
    control* — models represent a word more strongly when told to "think about" it than "don't
    think," and similarly under incentives ("if you think about X you'll be rewarded").
  - **Layer structure**: detection peaks at a layer **~2/3 through the model**; prefill
    detection peaks at a *different, earlier* layer — evidence that different introspective
    behaviors recruit *mechanistically distinct* circuits, not one general mechanism.
  - **What works / fails**: abstract nouns (justice, peace, betrayal) elicit the highest
    rate (~36%); concrete nouns lowest (~10%); random vectors only ~9/100 even norm-matched.
    Failures are the norm; high injection strengths cause "brain damage" (the model gets
    consumed by the concept or outputs garbled text).
  - **Mechanism (author speculation, not proven)**: the interesting step is *noticing* an
    injection at all — plausibly an **anomaly-detection** circuit firing when activations are
    dissonant with context; prefill detection plausibly uses a **consistency-check / QK
    "concordance-head"** circuit comparing produced tokens against cached prior intentions.
    The paper stresses results are compatible with many mechanistic hypotheses.
  - **Limits**: capability is "highly unreliable and context-dependent," most pronounced in
    the most capable models (Opus 4/4.1) and sensitive to post-training (helpful-only variants
    differ); base pretrained models show no net-positive performance. Self-reports often
    include confabulated, unverifiable detail beyond the verified detection/identification.
- **Persona vectors** — two distinct, often-conflated works:
  - **Anthropic, "Persona Vectors"** ([arXiv:2507.21509](https://arxiv.org/abs/2507.21509),
    Aug 2025) — linear activation directions encoding character traits (*evil*, *sycophancy*,
    hallucination); steering along them turns traits up/down and can "vaccinate" against
    trait drift during fine-tuning.
  - **OpenAI (Wang et al.), "Persona Features Control Emergent Misalignment"**
    ([arXiv:2506.19823](https://arxiv.org/abs/2506.19823), June 2025) — **this** is the source
    of the model-diffing result: SAEs surface "misaligned persona" features, and a single
    **"toxic persona" latent (#10)** most strongly *controls* emergent misalignment (the
    strongest SAE latent for steering it, §3.2) and *predicts* whether a model will exhibit
    misaligned behavior. The paper reports this qualitatively — the change in that latent's
    activation "perfectly discriminates aligned models from misaligned models" across the
    fine-tuning domains examined (§3.1, Fig. 9 Right) — and gives **no formal accuracy/AUC**.
    (A widely cited "~91% accuracy, AUC ≈ 0.95" figure for prompt-level misalignment prediction
    comes from a secondary summary, *not* the paper itself.)
    [emergentmind](https://www.emergentmind.com/topics/persona-features-control-emergent-misalignment)
  - See [11 · Interpretability frontiers](../11-emerging-application-subfields/interpretability-and-nascent-directions.md).

## State of research

**Best-performing now:** Attribution graphs (cross-layer transcoders) are the most
capable concrete technique — they produce legible, testable circuit hypotheses on real
frontier models. SAEs + auto-interp are the workhorse for feature discovery.

**Promising but unproven:** Introspection and persona vectors are striking but *low-
reliability* and contested. Introspective awareness succeeds on only ~20% of best-case
trials and the paper explicitly does **not** demonstrate the metacognitive-representation
criterion it sets for itself, leaving open whether results reflect genuine self-models or
narrow, possibly non-introspective shortcut circuits (anomaly detection, consistency
checks). Whether trait directions reflect genuine internal structure or convenient linear
artifacts is similarly open. "Actionable" interp (locate→steer→improve) is consolidating but
its edits often have side effects.

**Open problems & weaknesses:** **Faithfulness and completeness** — do explanations
capture what the model actually does, or a convenient story? Concept vectors may carry
*unintended* meanings (the paper flags this); models confabulate detail beyond what is
introspectively grounded. Scaling from features/circuits to *behavior-level* accounts is
unsolved, and the introspection work shows different behaviors may rely on *entirely
distinct* circuits rather than one general faculty. Most rigorous work runs on a few (often
Anthropic) models, raising generality questions. Interp is not yet reliable enough to
*certify* safety, only to investigate it — though the paper notes introspection could shift
interp's role toward building "lie detectors" that validate models' own self-reports.
