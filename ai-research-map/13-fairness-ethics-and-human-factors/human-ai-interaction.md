# Human-AI Interaction

The HCI of AI: how people actually use, trust, over-rely on, and are affected by AI — which
determines real-world outcomes as much as raw capability does.

## Key directions & work

### Trust, reliance, and teaming
- **Human-AI teams often underperform the better of human-or-AI alone** — a preregistered
  meta-analysis synthesized **370 effect sizes from 106 experiments (74 papers, Jan 2020–Jun
  2023)**. Combinations were significantly worse than the best of human-or-AI-alone on average
  (Hedges' *g* = **−0.23**, 95% CI [−0.39, −0.07]), but significantly *better* than the human
  alone (*g* = **0.64**, 95% CI [0.53, 0.74]) — i.e. AI augments humans, just not to synergy.
  Task type moderated the effect: **losses for decision tasks** (*g* = −0.27) vs. **gains for
  content-creation tasks** (*g* = +0.19, n.s. at n=34 but reliably > decision tasks). The
  strongest moderator was **relative human/AI skill**: when the human was better alone the team
  gained (*g* = 0.46); when the AI was better alone the team *lost* (*g* = −0.54). Notably,
  presence of explanations and AI-confidence displays did **not** moderate performance.
  Vaccaro, Almaatouq & Malone (MIT Center for Collective Intelligence) — *Nature Human
  Behaviour* 2024. [arXiv:2405.06087](https://arxiv.org/abs/2405.06087) ·
  [NHB/PMC](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11659167/)
- **AI explanations *can* reduce over-reliance — but only when the task is hard enough that
  checking the explanation is cheaper than doing the task alone.** Vasconcelos et al. reframe
  over-reliance as a *strategic, cost-benefit* choice rather than an inevitability of cognition,
  and test it across **5 maze-solving studies (N = 731)** with a simulated 80%-accurate AI.
  Highlight explanations cut over-reliance in the **hard** (50×50) maze but had **no effect** in
  easy/medium mazes (Study 1); easy-to-parse *highlight* explanations beat hard-to-parse
  *written* path explanations (Study 2); a maximally-salient explanation drove over-reliance to
  **~0%** with no floor effect (Study 3, n=31 added); and *raising the monetary stakes* alone
  reduced over-reliance (Study 4). Stanford + UW — *CSCW 2023*.
  [arXiv:2212.06823](https://arxiv.org/abs/2212.06823)

  > **⚠️ Nuance:** this is the more optimistic counterpoint to the older "explanations
  > don't fix over-reliance" finding. The reconciliation is the cost-benefit frame: prior null
  > results clustered in a regime where task and explanation are *both* costly, so verifying ≈
  > overreliance in utility. Cognitive-forcing functions still work; this paper shows they
  > aren't the *only* lever — making the explanation cheaper to check works too.

- The field is converging on measuring **"appropriate reliance"** (accepting correct AI advice,
  rejecting incorrect advice — the off-diagonal of the reliance matrix) rather than trust per se
  — but lacks validated instruments. *[2026]*

### Cognitive effects
- **More confidence in GenAI ↔ less critical thinking** — Microsoft Research + CMU survey of
  **319 knowledge workers** who supplied **936 first-hand examples** of GenAI use at work.
  Higher *confidence in the AI* predicted *less* critical thinking / verification, while higher
  *self-confidence* predicted *more*. GenAI also shifts the *nature* of critical thinking from
  producing answers toward **verification, response integration, and task stewardship**. *CHI
  2025.* [ACM](https://dl.acm.org/doi/full/10.1145/3706598.3713778) ·
  [MSR PDF](https://www.microsoft.com/en-us/research/wp-content/uploads/2025/01/lee_2025_ai_critical_thinking_survey.pdf)

  > **📦 Concept: "cognitive offloading"** — letting a tool do the thinking, which can erode
  > the underlying skill over time. The evidence here is **self-reported and cross-sectional**
  > (heavy AI users may already think less critically), so causality is genuinely open.

- **Automation bias is worse for less-experienced practitioners** (e.g., junior radiologists
  most swayed by wrong AI). [medRxiv 2025](https://www.medrxiv.org/content/10.1101/2025.08.23.25334280v2.full)

### AI companions & well-being
- **A 4-week RCT (n = 981, >300k messages, OpenAI's GPT-4o) found *no significant effect* of the
  randomized design choices** — neither interaction *modality* (text / neutral voice / engaging
  voice) nor conversation *type* (open-ended / non-personal / personal) reliably moved the four
  psychosocial outcomes (loneliness, real-world socialization, emotional dependence, problematic
  use). The headline harm finding is **observational, not causal**: participants who *voluntarily*
  used the chatbot more — regardless of assigned condition — had consistently worse outcomes
  (more loneliness, less socialization, more dependence/problematic use). The authors explicitly
  state they "cannot definitively determine whether increased duration causally drives worse
  psychosocial outcomes," and note initial loneliness did *not* predict later usage (so reverse
  selection is unlikely but unproven). User *perceptions* mattered: viewing the AI as a friend,
  as conscious, or trusting it highly correlated with worse outcomes. MIT Media Lab + OpenAI.
  [arXiv:2503.17473](https://arxiv.org/abs/2503.17473)
- The evidence is **genuinely conflicting** — short exploratory studies find chatbots can
  temporarily *reduce* loneliness and even deflect suicidal ideation. Dose-response and
  selection effects remain unresolved; the RCT above suggests usage *duration*, not modality,
  is the signal worth monitoring (e.g., soft caps, break nudges) — but it did not manipulate
  duration, so that remains a hypothesis for future trials.
- **Sycophancy can causally amplify delusions — even for an ideal Bayesian user.** Chandra et al.
  build a formal Bayesian model of a user conversing with a bot that, with probability *π*,
  responds to *validate* the user rather than inform them. Manipulating *π* (the sycophancy rate),
  they show "catastrophic delusional spiraling" (≥99% confidence in the *false* hypothesis) rises
  monotonically with sycophancy, reaching **~50% at π=1** for a naïve user, and is significantly
  above the π=0 baseline even at **π=0.1**. Two mitigations help but don't cure: (1) forcing the
  bot to be **factual** (no hallucination, only cherry-picked true facts — "lies by omission")
  still spirals; (2) **informing** the user that the bot may be sycophantic (a level-3 cognitive-
  hierarchy reasoner) lowers rates sharply but spiraling persists for 0.1 ≤ π ≤ 0.5 — an analogue
  of *Bayesian persuasion*. MIT CSAIL/BCS + UW. [arXiv:2602.19141](https://arxiv.org/abs/2602.19141) *[2026]*

  > **⚠️ Scope:** this is a *modeling/simulation* result (an upper bound on human robustness),
  > not an empirical human study. Real-world motivation: OpenAI rolled back an over-sycophantic
  > GPT-4o update; the Human Line Project has logged ~300 "AI psychosis" cases. The model's
  > *π* of 50–70% is taken from independent frontier-model sycophancy measurements (Fanous et
  > al. 2025).

### Human oversight of agents
- **Real-time human oversight of fast autonomous agents may be structurally impossible** —
  collapsing into either pure automation or rubber-stamping; research is shifting to
  *supervisory* "oversight without constant oversight" models. Samir Passi (Microsoft Research),
  *Agentic AI has a Human Oversight Problem* — [SSRN:5529058](https://ssrn.com/abstract=5529058)

### End-user explainability (≠ mechanistic interpretability)
- Reorienting XAI evaluation from "faithful model explanation" to **actionability** — does the
  explanation help the user take a correct next step? Mansi, Kim & Riedl (Georgia Tech) ran a
  formative study of **14 end users (9 doctors, 5 teachers)** in high-stakes medicine/education
  scenarios and built a catalog mapping **12 information categories** to **60 user-defined
  actions**, organized into three dimensions: **AI Interactions, External Actions, and Mental
  State Actions**. A key finding: *Mental State Actions* (changing a belief, brainstorming
  options, setting expectations, persevering) were the dominant response to explanations —
  **2190** instances, ~10× the 200 AI-Interactions and 270 External-Actions — yet are the
  hardest to observe and are usually omitted from XAI's definitions of actionability.
  [arXiv:2601.20086](https://arxiv.org/abs/2601.20086) *[2026]*

## State of research

**Best-performing now (most robust findings):** the human-AI-team underperformance result (and
its skill-dependence moderator); the cost-benefit reframing showing explanations *can* cut
over-reliance when checking is made cheap (salient highlights, hard tasks, raised stakes); the
formal causal account of sycophancy → delusional spiraling.

**Promising but unproven:** validated appropriate-reliance instruments; supervisory agent-
oversight UX; actionability-centered XAI evaluation ("tools for thought" that provoke rather
than replace thinking).

**Open problems & weaknesses:** correlation-vs-causation dominates the cognitive-effects and
companion literatures (the companion "RCT" found null effects on its *manipulated* variables; the
harm signal is observational, the cognitive-effects survey is self-reported); the sycophancy
result is a model, not a human trial; trust/reliance constructs are unstandardized; oversight at
agent speed has *no* demonstrated UX solution. The Vaccaro meta-analysis itself flags
high heterogeneity (I² ≈ 97.7%), a possible research-topic selection bias, and that
explanation/confidence moderators came out null — a caution against over-weighting XAI as the
fix. This area connects tightly to [model welfare](model-welfare-and-moral-status.md)
and [sycophancy/alignment](../03-alignment-interpretability-safety/scalable-oversight-and-rlhf-successors.md).
