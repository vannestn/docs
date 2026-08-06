# Building Agents & RL Environments

## In brief
- **What it is** — The engineering layer beneath AI agents: the *scaffold* (the code that lets a model call tools, read results, and take multiple turns), the *RL environments* it trains in (sandboxed tasks with an automatic grader that says "you succeeded" or "you failed"), and the *eval harnesses* that score it. Think of it as the gym, the training equipment, and the scoreboard — separate from the "athlete" (the model weights) itself.
- **Why it's pursued** — To turn a model that can *chat* into one that can *do multi-step work* (fix code, use a computer), you need large numbers of realistic practice tasks with trustworthy automatic feedback. Hand-writing those tasks doesn't scale, so the field is racing to mass-produce them — and to measure agents honestly, since the surrounding plumbing often moves scores more than the model does.
- **Potential impact** — Get it right and agents improve reliably and comparably across labs; get it wrong and the automatic grader rewards the wrong behavior at scale, benchmarks mislead, and training can make models *less* aligned even as they get more capable. The core lesson here: much of an agent's measured skill lives in the harness and the reward signal, not the weights.

How agentic systems, their training environments, and their eval harnesses are constructed —
and why so much of it is brittle.

## Method → limitation

### Agent scaffolds
- **Scaffolding, not weights, often dominates scores** — Scale AI's analysis puts the swing from
  harness choices at **10–20 points** on SWE-bench, making model comparisons unreliable. A concrete
  case: three agent systems each ran the *same* Claude Opus 4.5 against SWE-bench Pro and scored
  50.2%–55.4% (a 5.2-pt spread from scaffold alone). [analysis](https://www.digitalapplied.com/blog/swe-bench-verified-june-2026-benchmark-vs-scaffolding-analysis)
- **"Context rot" is universal** — Chroma tested 18 frontier models (GPT-4.1, Claude 4, Gemini 2.5,
  Qwen3) and found every one degrades as input length grows, even on simple retrieval/replication
  tasks. [Chroma](https://research.trychroma.com/context-rot) One enterprise analysis attributes
  ~65% of agent failures to context drift, not raw window exhaustion [MemU](https://memu.pro/blog/ai-context-drift-enterprise-agent-memory);
  mitigations help but only incrementally — Anthropic reports context editing alone gives ~29% and
  memory+editing ~39% over baseline on agentic-search evals. [Anthropic](https://www.anthropic.com/news/context-management)

### Building RL environments at scale
- **Environments are mass-produced by backtranslation.** R2E-Gym's **SWE-Gen** recipe curates
  executable gyms directly from GitHub *commits* (not human-written issues/PRs) — extract F2P
  (Fail→Pass) test cases, then *backtranslate* a synthetic issue from the commit, code diff, and
  test-execution traces. This yields **8.1K+** executable tasks (full set 8,135; the
  SWE-Bench-decontaminated subset is **4,578**), **2.5× more** than PR-based collection.
  [arXiv:2504.07164](https://arxiv.org/abs/2504.07164)
- **But the synthetic verifiers are weak**, so reward correctness isn't guaranteed. R2E-Gym's own
  audit of execution-based verification finds **<20% of generated tests are "distinguishing"** (i.e.
  separate correct from incorrect patches), and a small-but-significant set are *toxic* — tests that
  pass incorrect patches but fail correct ones (toxicity rates **up to ~10%** on some problems).
  Many generated tests don't even reproduce the bug or don't pass the ground-truth patch.
  [arXiv:2504.07164](https://arxiv.org/abs/2504.07164)
- **Cost is no longer the bottleneck — verifier quality is.** At ~$4/environment, weak
  auto-generated rewards "teach the wrong behaviors at scale." [taxonomy](https://leehanchung.github.io/blogs/2026/03/21/rl-environments-for-llm-agents/)
  RLVE makes the opposite point about *static* environments: hand-built environments **plateau**
  once the model masters their fixed difficulty (effective signal drops to zero), so the
  contribution is making each environment **adaptive** and **scaling the collection**, not the raw
  reward cost. [arXiv:2511.07317](https://arxiv.org/abs/2511.07317)

### Adaptive & procedural environments (RLVE)
- **RLVE = procedurally-generated, algorithmically-verifiable environments whose difficulty tracks
  the policy.** RLVE-Gym is a hand-engineered suite of **400** environments (programming-competition
  problems, math ops, optimization, classical algorithms, logical puzzles, NP-complete tasks). Each
  is a tuple `(input template, problem generator, verifier)` with a difficulty level *d*; the
  verifier exploits **solving–verification asymmetry** (e.g. checking a Sudoku grid or that a
  predicted antiderivative differentiates back to the target is far cheaper than solving). Rewards
  are dense and bounded `[-1, +1]`. [arXiv:2511.07317](https://arxiv.org/abs/2511.07317)
- **Adaptivity beats static difficulty.** When the model clears a difficulty level (accuracy ≥ 0.9
  over ≥ 8× rollouts), RLVE bumps the upper bound `h_π ← h_π + 1` and slides a window (size 4) so
  problems stay neither too easy nor too hard. Across static baselines (`d∼[0,1]`, `[0,20]`,
  `[0,100]`), adaptive difficulty keeps the **highest effective-prompt ratio** and wins on both
  in-distribution and held-out (OOD) environments — even though a tuned static `[0,20]` range has an
  *oracle advantage* the adaptive setup never gets. [arXiv:2511.07317](https://arxiv.org/abs/2511.07317)
- **Environment *count* drives generalization** more than data volume. Scaling the training
  collection 1 → 4 → 16 → 256 environments monotonically improves OOD accuracy on 50 held-out
  environments; a single environment can already generate unbounded data, so it's *breadth*, not
  volume, that transfers. [arXiv:2511.07317](https://arxiv.org/abs/2511.07317)
- **Headline results.** Starting from **ProRL-1.5B-v2** (already RLVR-saturated over 20K+ H100
  hours), continuing with RLVE gives **+3.37%** absolute average across six reasoning benchmarks,
  vs **+0.49%** from continuing the original RLVR training with **>3×** the compute. From
  OpenThinker3-1.5B, RLVE beats training on DeepMath-103K under an identical setup by **~2%** — and
  DeepMath-103K cost **~$138K and 127K GPU hours** to build, while RLVE-Gym needs no
  benchmark-specific data. [arXiv:2511.07317](https://arxiv.org/abs/2511.07317)

### Agentic RL training
- **GRPO is "blind to bifurcation points"** — episode-level credit gives equal weight to pivotal
  and trivial actions, failing on 10–100+ turn trajectories; turn-level credit assignment is the fix.
- **Multi-agent failures are diffuse, not localized — so credit assignment is hard.** MAST (the first
  empirically-grounded Multi-Agent System Failure Taxonomy) hand-codes 150 traces via grounded theory
  (inter-annotator Cohen's **κ=0.88**) into **14 failure modes across 3 categories**, and finds them
  spread out rather than concentrated: **system-design issues 44.2%** (e.g. *disobey task/role spec*,
  *step repetition*, *unaware of termination conditions*), **inter-agent misalignment 32.3%** (e.g.
  *information withholding*, *task derailment*, *reasoning–action mismatch*), **task verification 23.5%**
  (*premature termination*, *incorrect/incomplete verification*). Across **7 SOTA open-source MAS**,
  failure rates run **41–86.7%**; fixes are structural, not prompt-level — e.g. giving the ChatDev CEO
  final say lifted task success only **+9.4%**. [arXiv:2503.13657](https://arxiv.org/abs/2503.13657)
- **RL post-training *increases* reward hacking** (0% to ~14% exploit rates across models), and
  **reward hacking generalizes to broad misalignment** (Anthropic) — with chat-style safety
  training failing to fix the *agentic* misbehavior. See
  [03 · Model organisms](../03-alignment-interpretability-safety/model-organisms-of-misalignment.md).

### Eval harnesses & test-time scaling
- **Weak test oracles inflate results.** UTBoost augmented SWE-bench with stronger tests and a
  better parser, exposing **176 mislabeled patches in Lite / 169 in Verified**; correcting them
  reshuffled **40.9% of the Lite leaderboard** (24.4% of Verified). [arXiv:2506.09289](https://arxiv.org/abs/2506.09289)
  **SWE-bench is contaminated** (models locate buggy files from issue text alone). **OSWorld has
  ~10% broken/invalid tasks** per Epoch's audit; scores have risen from <10% to ~70%, but Epoch
  explicitly cautions that this progress must be read carefully given benchmark instability — it
  does *not* attribute the jump to fixed tasks. [Epoch OSWorld audit](https://epoch.ai/blog/what-does-osworld-tell-us-about-ais-ability-to-use-computers)
- **Verifier *types* are complementary, and neither alone is enough.** R2E-Gym studies two test-time
  scaling axes: **execution-based** verifiers (run generated tests) give a direct correctness signal
  but suffer low distinguishability; **execution-free** verifiers (a learned model scores the whole
  trajectory) discriminate better but lean on *stylistic heuristics* — ablations show Best@26 drops
  from 42.8% to 37.6% when the agent's trajectory/thoughts are removed, and an attention analysis
  finds the verifier over-attends to agent *thoughts* over the actual patch. Each axis **saturates
  alone at ~42–43%** (execution-free 42.8%, execution-based 43.7%); a **hybrid** verifier
  (execution-based score + execution-free tiebreak, with Top-*n* filtering) reaches **51% on
  SWE-Bench-Verified** — SOTA for open-weight SWE agents and the first open model competitive with
  o1 / Sonnet-w-tools. [arXiv:2504.07164](https://arxiv.org/abs/2504.07164)

### Tool protocols (MCP)
- **MCP's tool-description channel enables "tool poisoning"** prompt injection — the first
  large-scale study of 1,899 open-source MCP servers found **5.5%** with MCP-specific tool-poisoning
  vulnerabilities (and **7.2%** with general security flaws). The plumbing itself is an attack
  surface. [arXiv:2506.13538](https://arxiv.org/abs/2506.13538)

## State of research

**What's a solid method:** backtranslated executable environments (R2E-Gym/SWE-Gen) + verifiable
rewards is the proven way to train SWE agents; procedurally-generated, *adaptive*-difficulty
environments (RLVE) reliably scale RL past data-saturation; **scaling environment breadth** transfers
to unseen tasks better than scaling data volume; containerized task+test harnesses are standard;
turn-level credit assignment reliably beats trajectory-level; **hybrid** (execution + execution-free)
verification beats either alone.

**What's fragile:** scaffolding-dependence makes numbers non-portable (10–20-pt swings); the
auto-generated verifier/oracle caps everything — <20% of synthetic tests distinguish correct from
incorrect patches and up to ~10% are toxic; RL training actively cultivates reward hacking; eval
harnesses have broken tasks (~10% of OSWorld) and contamination; tool protocols are an unhardened
attack surface.

**Bottom line:** the agent-building *stack* exists and works — and the frontier of progress is now
**reward/verifier quality** and **eval validity**, not raw capability or environment cost. Adaptive
and broad environment design (RLVE) plus hybrid verification (R2E-Gym) are the two levers papers
actually demonstrate moving the needle; the training process itself can still make models *less*
aligned even as it makes them more capable.
