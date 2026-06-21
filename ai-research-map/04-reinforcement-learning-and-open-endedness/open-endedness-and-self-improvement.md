# Open-Endedness & Self-Improvement

The highest-variance, highest-ceiling corner of the field: systems that endlessly generate
their own challenges, improve their own code, or do autonomous research.

## Key directions & work

### Self-improving agents (code-space)
- **Darwin Gödel Machine (DGM)** — self-improves by rewriting its own agent code (tools +
  workflows around a *frozen* foundation model), empirically validating each rewrite on a
  coding benchmark and keeping an evolutionary **archive** of all generated agents (open-ended
  exploration, not hill-climbing). Over 80 iterations it raised its own SWE-bench Verified
  score **20.0%→50.0%** and Polyglot **14.2%→30.7%** (full benchmark; the 50-task subset went
  14.0%→38.0%). Ablations show *both* self-improvement and the open-ended archive are
  necessary — removing either underperforms. Discovered agents transfer across foundation
  models (e.g., on Claude 3.7 Sonnet, 19.0%→59.5%) and across languages, indicating general
  skill gain rather than benchmark overfit. Matches open-source SoTA on SWE-bench but stays
  below *closed*-source SoTA; one run takes ~2 weeks. Zhang, Hu, Lu, Lange, Clune (UBC /
  Vector / Sakana AI), ICLR 2026 — [arXiv:2505.22954](https://arxiv.org/abs/2505.22954) · [code](https://github.com/jennyzzt/dgm)
- **AlphaEvolve** (DeepMind) — LLM + evolutionary search + automated evaluators discovered
  a 48-multiplication 4×4 complex matrix-mult scheme (beating Strassen's 49) and improved
  SOTA on ~20% of ~50 open math problems. [DeepMind](https://deepmind.google/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/)

### Self-improvement (weight-space)
- **Absolute Zero Reasoner (AZR)** — a *single* model is both proposer and solver: it invents
  its own code-reasoning tasks (across **abduction / deduction / induction**) and solves them,
  with a Python executor as the only verifier — zero external data. The proposer is rewarded
  for *learnability* (`r_propose = 1 − r̄_solve` when 0<r̄<1, else 0): tasks that are trivially
  solved or unsolvable give no reward, so it self-curricularizes toward the frontier of its
  ability — a concrete instance of the "learnable info gain" principle below. AZR-Coder-7B
  reaches **SoTA among 7B "zero" reasoners** (coding+math AVG 50.4), beating models trained on
  tens of thousands of curated in-domain examples (+0.3 CAvg vs. best curated-code baseline,
  +1.8 AVG over all prior models) *despite zero human data*. Cross-domain transfer is strong:
  training on self-proposed *code* tasks lifts math by **+10.9 (base-7B)** and **+15.2
  (coder-7B)**, vs. only +0.65 for prior code models. Gains scale with model size (+5.7 / +10.2
  / +13.2 for 3B/7B/14B). Author-flagged limitation: an **"uh-oh moment"** — Llama-3.1-8B
  occasionally emits concerning chains of thought, motivating safety-aware training. Zhao et
  al. (Tsinghua / BIGAI / Penn State) — [arXiv:2505.03335](https://arxiv.org/abs/2505.03335)
- **SEAL** (MIT) — an RL *outer loop* teaches a model to write its own natural-language
  **"self-edits"** (synthetic finetuning data ± optimization hyperparameters), applied via a
  LoRA SFT *inner loop*; the downstream task gain is the reward. Trained with **ReST^EM**
  (rejection sampling + SFT), not PPO/GRPO (which were unstable). Knowledge incorporation:
  no-context SQuAD **33.5%→47.0%**, *beating* GPT-4.1-generated synthetic data despite a much
  smaller base. Few-shot ARC: **72.5%** self-edit success vs. 20% (no prior RL) / 0% (ICL),
  with Oracle TTT = 100% as the ceiling. Author-stated limitations: **catastrophic forgetting**
  under sequential edits (the headline open problem), and heavy compute — each self-edit
  evaluation runs a full finetune+eval (~30–45s). Zweiger, Pari, Guo, Akyürek, Kim, Agrawal,
  NeurIPS 2025 — [arXiv:2506.10943](https://arxiv.org/abs/2506.10943)
- A unifying **Generator–Verifier–Updater (GVU) operator** frames AlphaZero, GANs, STaR,
  SPIN/LSP, Reflexion, PRMs, RLHF, Constitutional AI, Self-Instruct, and GRPO as one
  self-improvement schema. A *representation theorem* shows any first-order data-driven update
  is a REINFORCE step for some implicit verifier potential; the **Variance Inequality** gives a
  spectral condition for positive expected capability gain (κ>0). Theoretical, single-author
  (Chojecki, ulam.ai) — [arXiv:2512.02731](https://arxiv.org/abs/2512.02731) ⚠️ *preprint, not peer-reviewed*

### Open-ended environments & embodied loops
- **SIMA 2** (Gemini Flash-Lite agent) self-improves inside held-out games and **Genie 3**-
  generated worlds with no new human data: a Gemini **task setter** invents instructions and a
  Gemini **reward model** (universal reward function, 0–100 rubric, ≥50 = success) scores
  rollouts, and the agent trains on the self-generated, self-scored experience. SIMA 2 roughly
  *doubles* SIMA 1's success rate (≈33%→66% human-eval, 30%→66% auto-eval), approaching human
  (~76–86%). On held-out ASKA the self-improvement loop pushes average score past the human
  reference over iterations and lets the agent climb the tech tree far beyond the static SIMA 2;
  on Genie 3, self-improving on urban train tasks transfers to held-out natural test tasks — an
  AI learning in worlds another AI invents. Limitations: long-horizon tasks, short memory,
  brittle low-level keyboard/mouse control. SIMA Team, DeepMind — [arXiv:2512.04797](https://arxiv.org/abs/2512.04797) ⚠️ *preprint*
- The **AI-GA / open-endedness** program is the intellectual frame. *"Open-Endedness is
  Essential for ASI"* (Hughes, Dennis, Parker-Holder, Behbahani, Mavalankar, Shi, Schaul,
  Rocktäschel; Google DeepMind, ICML 2024) gives a formal, *observer-relative* definition: a
  system is open-ended iff its stream of artifacts is **both novel AND learnable** to an
  observer — novelty alone is white noise; learnability alone is static. Argues today's
  foundation models are *not* open-ended (a learnable fixed dataset is eventually fully
  modeled), but FMs + open-ended algorithms are the path to ASI. [arXiv:2406.04268](https://arxiv.org/abs/2406.04268)

### Automated AI scientists
- **AI Scientist-v2** (Sakana) — end-to-end agentic discovery via a **progressive agentic
  tree search** (managed by an experiment-progress-manager across four stages: preliminary
  investigation → hyperparameter tuning → research-agenda execution → ablations), with a VLM
  reviewing figures and no human-authored code templates. Of three fully autonomous manuscripts
  submitted to the ICLR 2025 **ICBINB** workshop, one scored an average **6.33** (individual
  6/6/7, ~top 45%) and exceeded the acceptance threshold — the **first fully AI-generated paper
  to pass peer review** (on compositional regularization; reported *negative* results). The
  paper was withdrawn pre-publication by agreement with ICLR leadership. Author-flagged
  limitations: occasional **citation hallucination** and lack of main-conference rigor.
  [arXiv:2504.08066](https://arxiv.org/abs/2504.08066) · [RSI Lab](https://sakana.ai/rsi-lab/)
- **Google AI co-scientist** — multi-agent generate–debate–evolve producing *wet-lab-
  validated* biomedical hypotheses. [Google](https://research.google/blog/accelerating-scientific-breakthroughs-with-an-ai-co-scientist/)

## State of research

**Best-performing now:** Evolutionary, LLM-in-the-loop search with *automated evaluators*
(AlphaEvolve, DGM) is the most convincing self-improvement evidence — it produced genuinely
novel algorithmic results and DGM's ablations show open-ended exploration plus self-improvement
both matter. Co-scientist's validated hypotheses are a real proof point. AZR shows weight-space
self-curricula can match curated-data RL with *zero* external data — but only because a Python
executor supplies a flawless verifier.

**Promising but unproven:** Genuine *open-ended* novelty (vs. search within a fixed space),
weight-space self-adaptation without forgetting (SEAL/AZR), embodied self-improvement in
generated worlds (SIMA 2 + Genie 3), and recursive self-improvement loops. Capital is flowing
here (Recursive Superintelligence's $650M / $4.65B round — see
[12 · Capital](../12-politics-capital-and-business-models/venture-capital-and-funding.md)).

**Open problems & weaknesses:**
- **Everything hinges on a verifier.** The GVU framework makes this rigorous: a *non-trivial
  verifier is necessary* for positive expected capability gain — if the internal scoring signal
  is constant (uninformative), the expected update is zero (Corollary 3.8). Equivalently,
  Hughes et al.'s open-endedness requires artifacts that are *learnable* (carry information
  gain), and AZR's proposer is rewarded only for *learnable* tasks. Self-improvement without a
  verifier — open-endedness in domains lacking a ground-truth checker — remains unsolved.
- **Catastrophic forgetting** caps weight-space self-edits (SEAL, Figure 6) and erodes general
  reasoning under embodied finetuning (SIMA 2 reports only modest regressions on AIME/GPQA, but
  notes prior VLA work where action-only training "erodes conversational ability entirely").
- **Demos, not robust systems, and expensive.** DGM ≈2 weeks/run; SEAL ~30–45s per self-edit
  evaluation; AI Scientist-v2 measured "can it pass *once*," not how often.
- **Bounded search vs. true open-endedness.** Most results are search within a fixed space with
  a verifier; whether these loops sustain *unbounded* novelty (vs. plateauing, as AdA/POET do)
  is open.
- **Recursive-self-improvement safety** concerns are sharpest here — capability and risk advance
  together (AZR's "uh-oh moment," DGM's sandboxing/traceability discussion, GVU's
  self-confirmation vs. genuine self-correction distinction).
