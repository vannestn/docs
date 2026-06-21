# Open-Endedness & Self-Improvement

The highest-variance, highest-ceiling corner of the field: systems that endlessly generate
their own challenges, improve their own code, or do autonomous research.

## Key directions & work

### Self-improving agents (code-space)
- **Darwin Gödel Machine (DGM)** — self-improves by rewriting its own agent code,
  maintaining an evolutionary archive. Raised its own SWE-bench score 20.0%→50.0% and
  Polyglot 14.2%→30.7%. Sakana AI + Jeff Clune lab — [arXiv:2505.22954](https://arxiv.org/abs/2505.22954) · [lab](https://sakana.ai/dgm/)
- **AlphaEvolve** (DeepMind) — LLM + evolutionary search + automated evaluators discovered
  a 48-multiplication 4×4 complex matrix-mult scheme (beating Strassen's 49) and improved
  SOTA on 20% of 50 open math problems. [DeepMind](https://deepmind.google/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/)

### Self-improvement (weight-space)
- **Absolute Zero Reasoner** — a single model proposes *and* solves its own tasks with zero
  external data, verified by Python execution (+15.2 pts math for a 7B coder). [arXiv:2505.03335](https://arxiv.org/abs/2505.03335)
- **SEAL** (MIT) — RL outer loop teaches a model to write its own finetuning "self-edits"
  applied via LoRA; catastrophic forgetting flagged as the key open problem. [arXiv:2506.10943](https://arxiv.org/abs/2506.10943)
- A unifying **"generate–verify–update" (GVU) operator** frames AlphaZero, GANs, STaR,
  SPIN, and PRMs as one self-improvement schema. [arXiv:2512.02731](https://arxiv.org/html/2512.02731v1)

### Open-ended environments & embodied loops
- **SIMA 2** self-improves inside **Genie 3**-generated worlds with no new human data — an
  AI learning in worlds another AI invents. DeepMind — [arXiv:2512.04797](https://arxiv.org/pdf/2512.04797)
- The **AI-GA / open-endedness** program (Clune, Stanley/Lehman lineage) is the intellectual
  frame; *"Open-Endedness is Essential for ASI."* [arXiv:2406.04268](https://arxiv.org/pdf/2406.04268)

### Automated AI scientists
- **AI Scientist-v2** (Sakana) produced a paper that passed an ICLR-workshop peer review.
  [arXiv:2504.08066](https://arxiv.org/pdf/2504.08066) · [RSI Lab](https://sakana.ai/rsi-lab/)
- **Google AI co-scientist** — multi-agent generate–debate–evolve producing *wet-lab-
  validated* biomedical hypotheses. [Google](https://research.google/blog/accelerating-scientific-breakthroughs-with-an-ai-co-scientist/)

## State of research

**Best-performing now:** Evolutionary, LLM-in-the-loop search with *automated evaluators*
(AlphaEvolve, DGM) is the most convincing self-improvement evidence — it produced genuinely
novel algorithmic results. Co-scientist's validated hypotheses are a real proof point.

**Promising but unproven:** Genuine *open-ended* novelty (vs. search within a fixed space),
weight-space self-adaptation (SEAL/AZR) without forgetting, and recursive self-improvement
loops. Capital is flowing here (Recursive Superintelligence's $650M / $4.65B round — see
[12 · Capital](../12-politics-capital-and-business-models/venture-capital-and-funding.md)).

**Open problems & weaknesses:** Most "self-improvement" is bounded search needing a
*verifier* — open-endedness without one is unsolved. Catastrophic forgetting limits
weight-space self-edits. Results are demos, not robust systems. And this is the area where
**recursive-self-improvement safety** concerns are sharpest — capability and risk advance
together.
