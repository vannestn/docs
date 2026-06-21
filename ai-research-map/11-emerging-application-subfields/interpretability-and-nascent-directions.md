# Interpretability Frontiers & Provenance

Newer behavior-driven interpretability ideas, plus the provenance/watermarking work that
tries to track AI-generated content. (Core interpretability is in
[03 · Mechanistic interpretability](../03-alignment-interpretability-safety/mechanistic-interpretability.md).)

## Interpretability frontiers

> **📦 Concept: "persona vectors"** — researchers find that a trait like *honesty* or
> *sycophancy* corresponds to a single direction in the model's internal number-space.
> Nudging activations along that direction can turn the trait up or down.

- **Persona vectors** — proposed as the mechanistic basis of emergent misalignment; model-
  diffing on these features predicts misaligned responses at ~91% accuracy. *[2026 IDs]*
- **Introspection** — whether a model can accurately *report its own internal state*. Concept-
  injection experiments show partial, low-reliability introspective awareness. [arXiv:2601.01828](https://arxiv.org/abs/2601.01828)
- **Model diffing** — comparing two models' internals to localize exactly what fine-tuning
  changed.

## Provenance & watermarking

> **📦 Concept: "provenance"** — being able to tell where a piece of content came from (which
> model, or whether it's AI-generated at all), via invisible watermarks + signed metadata.

- **Layered provenance is now the standard** — single methods are declared insufficient; the
  EU pushes metadata (C2PA) + invisible watermark + logging together.
- **Watermarks have "orthogonal vulnerabilities"** across image domains; **SynthID** has
  watermarked 10B+ images. (See [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).)

## State of research

**Best-performing now:** Persona vectors and introspection are the most concrete *new*
interpretability results on frontier models. SynthID-scale watermarking is deployed and real.

**Promising but unproven:** Whether persona vectors/introspection reflect genuine internal
structure or convenient artifacts; whether provenance can survive determined adversaries.

**Open problems & weaknesses:** Reliability is low and results are concentrated in a few labs.
Watermarks are removable/forgeable (an arms race), so provenance is a *layered deterrent*, not
a guarantee. These are early directions — promising signal, not settled science.
