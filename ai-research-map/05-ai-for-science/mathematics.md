# Mathematics

The domain where AI crossed from competition problems to *original research* in 2026.

## Key directions & work

- **AlphaProof** (DeepMind) — RL over millions of auto-formalized problems + inference-time
  search; IMO 2024 silver-medal performance, published in *Nature*. [Nature](https://www.nature.com/articles/s41586-025-09833-y)
- **AlphaProof Nexus** — an evolutionary Lean proof-search system (Gemini + Lean 4 agents)
  that autonomously **resolved 9 open Erdős problems** (some open 56 years) and proved
  ~44/492 OEIS conjectures at a few hundred dollars each. [coverage](https://the-decoder.com/google-deepminds-alphaproof-nexus-solves-decades-old-math-problems-for-a-few-hundred-dollars/) ·
  [arXiv:2605.22763](https://arxiv.org/abs/2605.22763) *[2026 — verify]*
- **Gold-medal formal solvers:** Harmonic's **Aristotle** ([arXiv:2510.01346](https://arxiv.org/pdf/2510.01346))
  and ByteDance's **Seed-Prover** reached IMO-2025 gold with *machine-verified* (Lean 4)
  solutions. Survey: [arXiv:2601.13209](https://arxiv.org/html/2601.13209v4)
- **Long-horizon autoformalization** is the next benchmark target (LeanMarathon). *[2026 — verify]*

## State of research

**Best-performing now:** LLM + Lean proof-search *agents* (the AlphaProof line) are the
clear SOTA, and formal solvers reaching IMO gold with verified proofs is a milestone.
Autoformalization + RL over formal corpora is the winning recipe.

**Promising but unproven:** Autonomous **open-problem solving** (Erdős/OEIS) is genuinely
new — whether it generalizes beyond combinatorics-flavored problems to deep, structure-
heavy mathematics is the open question. "AI co-mathematician" workflows are early.

**Open problems & weaknesses:** **Autoformalization at scale** (translating informal math
to Lean reliably) is the chronic bottleneck. Long-horizon proofs spanning many lemmas
remain hard. Verified formal output is trustworthy but expensive; informal reasoning is
cheap but unverified. The impressive results are concentrated in a few extremely well-
resourced labs.
