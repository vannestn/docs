# Interpretability Frontiers & Provenance

Newer behavior-driven interpretability ideas, plus the provenance/watermarking work that
tries to track AI-generated content. (Core interpretability is in
[03 · Mechanistic interpretability](../03-alignment-interpretability-safety/mechanistic-interpretability.md).)

## Interpretability frontiers

> **📦 Concept: "persona vectors"** — researchers find that a trait like *honesty* or
> *sycophancy* corresponds to a single direction in the model's internal number-space.
> Nudging activations along that direction can turn the trait up or down.

- **Persona vectors** — an automated pipeline takes a trait name + natural-language
  description (e.g. "evil", "sycophancy", "hallucination") and extracts a single activation
  direction that *controls* that trait: steering along it makes the model talk about unethical
  acts, suck up to the user, or fabricate. The same vectors monitor personality drift during
  training and flag training data that induces it.
  [arXiv:2507.21509](https://arxiv.org/abs/2507.21509) (Anthropic, 2025).
- **Persona features as the basis of emergent misalignment** — a *separate* OpenAI study
  (often conflated with the above) uses **model-diffing**: it trains sparse autoencoders, then
  compares latent activations before vs. after a narrow harmful fine-tune. It isolates a
  "toxic persona" feature (SAE latent #10) that "most strongly *controls* emergent misalignment
  and can be used to *predict* whether a model will exhibit such behavior" — the latent's
  activation increase *perfectly discriminates* aligned from misaligned models across the
  fine-tuning domains studied, and steering it positively/negatively amplifies/suppresses
  misalignment. The same monitoring detects the persona activating *before* a standard
  behavioral eval flags misalignment (e.g. at ~5% incorrect training data), motivating
  interpretability auditing as an early-warning system. Mitigation: fine-tuning an emergently
  misaligned model on just a few hundred benign samples (~120–200, ~35 steps) restores
  alignment.
  [arXiv:2506.19823](https://arxiv.org/abs/2506.19823) (OpenAI, 2025).
  (Emergent misalignment itself is covered in
  [03 · Model organisms](../03-alignment-interpretability-safety/model-organisms-of-misalignment.md).)
- **Introspection** — whether a model can accurately *report its own internal state*, tested
  via **concept injection** (an application of activation steering): inject a known concept
  vector into activations, then ask the model to report on its mental state.
  [arXiv:2601.01828](https://arxiv.org/abs/2601.01828) (Anthropic / Jack Lindsey, 2026). See
  the deep-dive below.
- **Model diffing** — comparing two models' internals (e.g. via SAEs) to localize exactly what
  fine-tuning changed; it is the workhorse behind the persona-features result above.

### Deep-dive: introspection via concept injection

The paper's headline is deliberately hedged: current models possess *some* **functional
introspective awareness**, but it is "highly unreliable and context-dependent." A self-report
counts as introspective only if it meets four criteria — **accuracy, grounding** (the report
causally depends on the state, tested via injection), **internality** (the report can't be
inferred from the model's own prior outputs), and a **metacognitive representation** (the model
registers the state internally before verbalizing it). The authors explicitly **do not**
claim to demonstrate the metacognitive-representation mechanism directly — they call this a key
limitation.

Four experiments, all using contrastive concept vectors injected into the residual stream:

- **Injected-thought detection.** Inject an "all caps" or "bread" vector; the model sometimes
  reports "I notice an injected thought… about LOUD/SHOUTING" *before* the perturbation has
  steered its output. On the best layer (~⅔ of model depth) and strength, **Opus 4.1 and 4
  detect-and-correctly-identify on only ~20% of trials** — failure is the norm. Production
  models show **0% false positives over 100 control trials** (vs. some helpful-only variants
  that hallucinate detections). Abstract nouns (justice, peace, betrayal) work best (~36%);
  concrete nouns worst (~10%); random vectors only ~9/100.
- **Distinguishing thoughts from text.** With a "bread" vector injected onto a sentence's
  tokens, the model both transcribes the sentence verbatim *and* reports "bread" as its
  thought — keeping the two separate. All models beat chance (10%); Opus 4.1/4 best at ~66–74%
  joint accuracy.
- **Detecting unintended outputs.** Models normally disavow an artificial prefill as "an
  accident"; retroactively injecting the matching concept vector *before* the prefill makes the
  model accept the output as intentional (and confabulate a reason). The effect requires the
  concept be present *prior* to the prefill; injecting *after* does nothing. Opus 4.1/4 show
  the strongest apology-reduction (~0.4–0.46). Notably this behavior peaks at a *different
  (earlier) layer* than the other tasks — evidence that distinct introspective capabilities use
  mechanistically distinct circuits.
- **Intentional control.** Told to "think about aquariums" while writing an unrelated sentence,
  models represent the word more strongly than when told *not* to (the gap holds even for
  incentives like "you'll be rewarded"). In newer models the representation decays to baseline
  by the final layer (a "silent" thought), whereas older Claude 3 models leak it into the
  output ("motor impulse").

**Mechanism (speculative, author-stated).** The interesting step is *noticing* an injection at
all — plausibly an **anomaly-detection** mechanism firing when activations deviate from their
context-expected values. The paper argues results are best explained by *multiple narrow
circuits* (anomaly detection, attention heads for thought-vs-text, a QK "concordance-head"
consistency check for prefill detection), **not** one general introspective faculty. Crucially,
models never saw concept injection in training, so these mechanisms evolved for other purposes.

**Author-stated limitations.** Highly unreliable (failures are the norm); the injection setup
is unnatural and may misrepresent natural introspection; concept vectors may carry unintended
meanings; the model suite (Claude variants) is not well-controlled, so cross-model differences
can't be cleanly attributed. The authors disclaim any inference about consciousness or
subjective experience.

## Provenance & watermarking

> **📦 Concept: "provenance"** — being able to tell where a piece of content came from (which
> model, or whether it's AI-generated at all), via invisible watermarks + signed metadata.

- **Layered provenance is now the standard** — single methods are declared insufficient. The
  EU AI Act's Code of Practice on marking AI content prescribes a **multi-layer** approach:
  C2PA metadata + imperceptible watermark + logging/registry, since metadata alone is trivially
  stripped by screenshots or re-uploads.
  [Source: EU AI Act Art. 50 / Code of Practice](https://blog.pebblous.ai/blog/eu-ai-content-labeling-article-50-provenance/en/)
- **Watermarks have "orthogonal vulnerabilities"** across paradigms — a comparative benchmark
  finds *spatial* watermarks (e.g. RivaGAN) crumble under algorithmic pixel-rewriting
  (img2img), while *latent* watermarks (e.g. Tree-Ring) are fragile to geometric misalignment;
  neither is robust everywhere. [arXiv:2603.10323](https://arxiv.org/abs/2603.10323)
- **SynthID** has watermarked **10B+ images and video frames** across Google's services
  (announced at I/O 2025), with the internet-scale method detailed in
  [arXiv:2510.09263](https://arxiv.org/abs/2510.09263).
  (See [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).)

## State of research

**Best-performing now:** Persona vectors/features and introspection are the most concrete *new*
interpretability results on frontier models. SynthID-scale watermarking is deployed and real.

**Promising but unproven:** Whether introspection reflects genuine internal structure or narrow
circuits piggybacking on non-introspective mechanisms — the introspection paper itself argues
for the latter and does not demonstrate a metacognitive representation. Whether provenance can
survive determined adversaries.

**Open problems & weaknesses:** Reliability is low (introspection succeeds on ~20% of even
*optimal* trials) and results are concentrated in a few labs. The capability is most pronounced
in the *most capable* models and is sensitive to post-training — so it may strengthen as models
scale, which the authors flag as a reason to monitor it (a more introspective model could learn
to misreport its own states). Watermarks are removable/forgeable across orthogonal attack
domains (an arms race), so provenance is a *layered deterrent*, not a guarantee. These are
early directions — promising signal, not settled science.
