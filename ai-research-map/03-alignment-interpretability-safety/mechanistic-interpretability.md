# Mechanistic Interpretability

Reverse-engineering the internal computations of models into human-understandable
mechanisms — now with tools usable enough to debug behavior and audit for hidden goals.

## Key directions & work

### Circuit tracing & attribution graphs
- **Cross-layer transcoders + attribution graphs** are the dominant paradigm: replace MLPs
  with transcoders, then build per-prompt graphs revealing planning, multi-hop reasoning,
  and arithmetic circuits in Claude 3.5 Haiku. Anthropic, *"On the Biology of a Large
  Language Model" / "Circuit Tracing"* (open-source tools released May 2025). [transformer-circuits.pub](https://transformer-circuits.pub/)
- Extensions: reasoning-model **diffing** via transcoder adapters; **CodeCircuit** infers
  generated-code correctness from attribution graphs. *(2026 arXiv IDs — verify.)*

### Sparse autoencoders & feature interpretation
- **Open-source auto-interpretability** for SAE features (LLMs generate/score natural-
  language explanations). EleutherAI — [blog](https://blog.eleuther.ai/autointerp/)
- Hosted SAE interpretability as a *product*: **Goodfire's Ember** API maps neurons to
  concepts and enables "surgical editing." See
  [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md).

### Introspection & persona directions
- **Emergent introspective awareness** — via *concept injection*, models can sometimes
  notice and name an injected concept; Opus 4/4.1 most capable, reliability low. Anthropic —
  [arXiv:2601.01828](https://arxiv.org/abs/2601.01828). Mechanism work shows attention heads
  detecting the injected disturbance and routing it to the final token.
- **Persona vectors** — linear activation directions encoding traits (sycophancy, honesty),
  proposed as the mechanistic basis of emergent misalignment; SAE+logistic-regression model
  diffing predicts misaligned responses at ~91% accuracy. See
  [11 · Interpretability frontiers](../11-emerging-application-subfields/interpretability-and-nascent-directions.md).

## State of research

**Best-performing now:** Attribution graphs (cross-layer transcoders) are the most
capable concrete technique — they produce legible, testable circuit hypotheses on real
frontier models. SAEs + auto-interp are the workhorse for feature discovery.

**Promising but unproven:** Introspection and persona vectors are striking but *low-
reliability* and contested — whether they reflect genuine self-models or convenient linear
artifacts is open. "Actionable" interp (locate→steer→improve) is consolidating but its
edits often have side effects.

**Open problems & weaknesses:** **Faithfulness and completeness** — do explanations
capture what the model actually does, or a convenient story? Scaling from features/circuits
to *behavior-level* accounts is unsolved. Most rigorous work runs on a few (often
Anthropic) models, raising generality questions. Interp is not yet reliable enough to
*certify* safety, only to investigate it.
