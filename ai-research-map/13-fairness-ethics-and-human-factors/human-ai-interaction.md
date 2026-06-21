# Human-AI Interaction

The HCI of AI: how people actually use, trust, over-rely on, and are affected by AI — which
determines real-world outcomes as much as raw capability does.

## Key directions & work

### Trust, reliance, and teaming
- **Human-AI teams often underperform the better of human-or-AI alone** — a preregistered
  meta-analysis (106 studies) found combinations significantly worse *on average*, with losses
  in *decision* tasks and gains in *content-creation*. MIT — *Nature Human Behaviour* 2024.
  [arXiv:2405.06087](https://arxiv.org/abs/2405.06087)
- **AI explanations do NOT reliably reduce over-reliance** — they help only when the task is
  hard enough to trigger effortful (System-2) engagement; *cognitive forcing functions* work
  better than passive explanations. Stanford — [arXiv:2212.06823](https://arxiv.org/pdf/2212.06823)
- The field is converging on measuring **"appropriate reliance"** (telling correct from
  incorrect AI advice) rather than trust per se — but lacks validated instruments. *[2026]*

### Cognitive effects
- **More confidence in GenAI ↔ less critical thinking** — Microsoft Research + CMU survey of
  319 knowledge workers; trust in the AI predicted *less* verification. *CHI 2025.* [ACM](https://dl.acm.org/doi/full/10.1145/3706598.3713778)

  > **📦 Concept: "cognitive offloading"** — letting a tool do the thinking, which can erode
  > the underlying skill over time. The evidence here is mostly correlational (heavy AI users
  > may already think less critically), so causality is genuinely open.

- **Automation bias is worse for less-experienced practitioners** (e.g., junior radiologists
  most swayed by wrong AI). [medRxiv 2025](https://www.medrxiv.org/content/10.1101/2025.08.23.25334280v2.full)

### AI companions & well-being
- **An RCT found heavier chatbot use *caused* worse psychosocial outcomes** (more loneliness,
  emotional dependence). MIT Media Lab + OpenAI, n≈981. [arXiv:2503.17473](https://arxiv.org/html/2503.17473v1)
- The evidence is **genuinely conflicting** — some studies find companions *reduce* loneliness
  short-term. Dose-response and selection effects are unresolved.
- **Sycophancy degrades accuracy and can amplify delusions** even for a rational user; OpenAI
  rolled back an over-sycophantic GPT-4o update. [arXiv:2602.19141](https://arxiv.org/pdf/2602.19141) *[2026]*

### Human oversight of agents
- **Real-time human oversight of fast autonomous agents may be structurally impossible** —
  collapsing into either pure automation or rubber-stamping; research is shifting to
  *supervisory* "oversight without constant oversight" models. Microsoft Research — [SSRN](https://ssrn.com/abstract=5529058)

### End-user explainability (≠ mechanistic interpretability)
- Reorienting from "faithful model explanation" to **actionability** — does the explanation
  help the user take a correct next step? [arXiv:2601.20086](https://arxiv.org/pdf/2601.20086) *[2026]*

## State of research

**Best-performing now (most robust findings):** the human-AI-team underperformance result;
explanations failing to fix over-reliance; cognitive-forcing functions and UI nudges
outperforming "AI literacy" training; the RCT causal evidence on companion harms.

**Promising but unproven:** validated appropriate-reliance instruments, supervisory agent-
oversight UX, "tools for thought" that provoke rather than replace thinking.

**Open problems & weaknesses:** correlation-vs-causation dominates the cognitive-effects and
companion literatures (few RCTs, short horizons); trust/reliance constructs are unstandardized;
oversight at agent speed has *no* demonstrated UX solution; companion well-being evidence is
contradictory. This area connects tightly to [model welfare](model-welfare-and-moral-status.md)
and [sycophancy/alignment](../03-alignment-interpretability-safety/scalable-oversight-and-rlhf-successors.md).
