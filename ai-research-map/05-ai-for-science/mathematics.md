# Mathematics

## In brief

- **What it is** — Using AI to do mathematics: not just arithmetic, but constructing proofs — the step-by-step logical arguments that establish a theorem is true. The strongest systems pair a large language model (which reasons in ordinary math prose) with a *proof assistant* like Lean, software that mechanically checks each step so a claimed proof either compiles or fails. The LLM proposes; Lean verifies. This is the domain where, in 2026, AI crossed from competition problems to *original research*.
- **Why it's pursued** — Verifying a mathematical proof by hand is slow and error-prone, and even elite mathematicians make mistakes. A machine-checked proof is trustworthy in a way informal reasoning is not, which lets AI systems search vast spaces of possible arguments without a human vouching for every line. The bottleneck is data: high-quality formal (machine-checkable) math is scarce, so much of the work is *autoformalization* — automatically translating informal math into Lean to generate training material.
- **Potential impact** — If it succeeds, AI becomes a genuine research collaborator that can settle long-open conjectures and formally certify results, as early systems already have on a handful of decades-old problems. The upside is trustworthy, verifiable mathematics at scale; the key limits are that results so far cluster in areas where the Lean library is mature and problems break into tractable pieces, that research-level math remains far out of reach, and that verified output is expensive while cheap informal reasoning stays unverified.

## Key directions & work

- **AlphaProof** (DeepMind) — a 3B-parameter proof network that jointly outputs Lean
  tactics and value estimates, trained by pretraining (300B tokens) → SFT (~300k
  state-tactic pairs) → RL on **~80M autoformalized statements** (derived from ~1M
  informal problems), plus test-time RL; inference-time search. IMO 2024 silver-medal
  performance, published in *Nature*. [Nature](https://www.nature.com/articles/s41586-025-09833-y) ·
  details in survey [arXiv:2601.13209](https://arxiv.org/abs/2601.13209)
- **AlphaProof Nexus** (DeepMind) — a *framework* for LLM-aided Lean proof generation, and
  the first large-scale evaluation of formal proof search on **open** research problems.
  Its "full-featured" agent uses prover subagents (Gemini 3.1 Pro) that can call AlphaProof
  as a tool, coordinated by an **AlphaEvolve-style evolutionary loop** in which LLM rater
  subagents (Gemini 3.0 Flash) produce Elo rankings over proof sketches. It autonomously
  **resolved 9 of 353 attempted open Erdős problems** (two open for 56 years), proved **44/492
  open OEIS conjectures**, and is deployed in optimization, graph theory, algebraic geometry,
  and quantum optics. Inference cost a few hundred dollars per problem; AlphaProof itself
  cost ~27.5 v6e-TPU-hours (~$60) per problem. Notably, the **basic** agent (independent
  subagents, no evolution or AlphaProof) also solved **all 9** Erdős problems — costing more
  only on the hardest ones. [coverage](https://the-decoder.com/google-deepminds-alphaproof-nexus-solves-decades-old-math-problems-for-a-few-hundred-dollars/) ·
  [arXiv:2605.22763](https://arxiv.org/abs/2605.22763) ·
  [results repo](https://github.com/google-deepmind/alphaproof-nexus-results)
- **Gold-medal formal solvers:** Harmonic's **Aristotle** ([arXiv:2510.01346](https://arxiv.org/abs/2510.01346))
  produced machine-verified Lean 4 solutions to **5 of 6** IMO-2025 problems (all but the
  final problem) — gold-medal-equivalent. ByteDance's **Seed-Prover** also reached IMO-2025
  gold with formal solutions. Survey: [arXiv:2601.13209](https://arxiv.org/abs/2601.13209)
- **Long-horizon autoformalization** is the next benchmark target: **LeanMarathon**
  ([arXiv:2606.05400](https://arxiv.org/abs/2606.05400)) targets *paper-level* formalization,
  building an audited blueprint DAG and discharging it bottom-up — explicitly contrasted with
  AlphaProof Nexus's single-statement focus.

## How the leading systems actually work

**AlphaProof Nexus** ([arXiv:2605.22763](https://arxiv.org/abs/2605.22763)). The input is a
Lean *proof sketch*: a target theorem with `sorry` in place of a proof, annotated with
`EVOLVE-BLOCK` markers (where the agent may add lemmas or steps) and `EVOLVE-VALUE` markers
(expressions, e.g. parameters, whose value it may change). Each prover subagent runs a
"Ralph loop" — multi-turn LLM episodes that reason via chain-of-thought and edit the sketch
with a search-and-replace tool, re-checking against the Lean compiler each turn. The
evolutionary agent adds a shared **population database** of sketches with **Elo scores**:
because a formal proof either compiles or not (a *binary* signal), LLM rater subagents rank
sketches by plausibility, clarity, and novelty in tournaments, and a P-UCB sampling procedure
drives the search. A validator checks that the final sketch did not unsafely change the
statement and is `sorry`-free. The agent was run on all 353 Formal Conjectures Erdős
statements for up to 3000 episodes; experts then confirmed each solved Lean statement
faithfully captured the original conjecture, and results were logged on Terence Tao's wiki of
AI contributions to Erdős problems.

**Aristotle** ([arXiv:2510.01346](https://arxiv.org/abs/2510.01346)) has three subsystems:
(1) a **Monte Carlo Graph Search** Lean prover with a >200B-parameter transformer serving as
both policy (predicting Lean tactics from the proof state, history, and any informal proof)
and value function, trained via expert-iteration RL; (2) a **lemma-based informal reasoning**
pipeline (Draft–Sketch–Prove-style: generate an informal proof → decompose into short lemmas
→ autoformalize → error-correct against the Lean REPL, iterating); and (3) a **geometry
solver, Yuclid** — a C++ DD/AR engine ~500x faster than AlphaGeometry-1 (solves 17/30 on
AG-30 and saturates the set). At inference it uses **test-time training** (TTT): retraining on
search traces from failed attempts. Geometry problems are solved outside Lean but still
require machine-verified solutions; everything else is a complete Lean 4 proof with no
`sorryAx` or unsound axioms.

## State of research

**Best-performing now:** LLM + Lean proof-search *agents* (the AlphaProof line) are the
clear SOTA, and formal solvers reaching IMO gold with verified proofs is a milestone.
Autoformalization + RL over formal corpora is the winning recipe. A notable finding from
AlphaProof Nexus is that the LLM landscape has shifted enough that *simple* agentic loops
now match heavy evolutionary search on most problems — the authors attribute this to
stronger base models plus compiler feedback grounding LLM reasoning.

**Promising but unproven:** Autonomous **open-problem solving** is genuinely new — but the
authors are explicit about what "open" means and where it stops. Successes concentrate in
combinatorics, convex optimization, and number theory, *where Lean's mathlib library is
mature and tasks decompose into tractable subgoals*; the same paper notes that **most Erdős
problems remain out of reach, let alone problems requiring extensive new theory.** Beyond Erdős, the
agents settled an open Hilbert-function (log-concavity of pure O-sequences) question, improved
a convex-optimization bound (an exact O(1/t) rate for Anchored GDA, discovered by searching
over the learning schedule), and aided graph-theory and quantum-optics work. Separately, the
survey documents a broader Tao-wiki workflow where frontier LLMs propose constructions later
formalized in Lean — yielding verified counterexamples to Erdős problems (notably **#205**)
and partial resolutions (e.g. **#367**). "AI co-mathematician" workflows are early.

**Open problems & weaknesses:**
- **The "formal data gap."** LLMs' formal-reasoning ability lags their natural-language
  ability because high-quality formal training data is scarce — the central challenge the
  survey ([arXiv:2601.13209](https://arxiv.org/abs/2601.13209)) names. This is what drives the
  whole autoformalization push.
- **Autoformalization at scale** remains the chronic bottleneck. Single-statement
  formalization is increasingly reliable (Herald reports >96% statement accuracy on miniF2F),
  but *paper-level* formalization — statements drifting, dependencies tangling, context
  decaying, local repairs corrupting distant work — is unsolved, which is precisely what
  LeanMarathon ([arXiv:2606.05400](https://arxiv.org/abs/2606.05400)) targets.
- **Hallucinated lemmas survive informal review.** AlphaProof Nexus's failure analysis found
  top-scoring sketches that (a) offloaded a problem's core difficulty into a single `sorry`
  inside a helper lemma restating the target, and (b) cited "established" literature lemmas
  that manual inspection revealed to be **hallucinations** — underscoring why end-to-end
  formal verification matters. Aristotle's own informal proofs likewise contained subtle
  natural-language errors (e.g. conflating strictly/weakly decreasing sequences) repaired only
  during formalization.
- **The research-level reasoning gap.** Models master undergraduate/olympiad math but stumble
  on research mathematics: Gemini 3 Pro scores **18.75%** on FrontierMath's research-level
  (Tier 4) split; DeepSeek-R1 hits 71.0% on graduate algebra (FATE-H) but drops to 33.0% on
  PhD-qualifying problems (FATE-X). Seed-Prover-1.5 shows the same cliff (80% FATE-H → 33%
  FATE-X), and miniF2F is largely saturated and no longer discriminating.
- **Verified output is trustworthy but expensive; informal reasoning is cheap but unverified.**
  Results are concentrated in a few extremely well-resourced labs, and the agents inherit their
  base LLMs' biases and exhibit high search variance.
