# Domain Comparison Index

*A side-by-side scoring of every candidate problem domain / research field against this
program's stated needs. This is a **comparison instrument, not a decision** — the decision
follows the staged process in [04](04-topic-selection-process.md) (read → pilot → choose).
Living doc: scores are versioned and revised as briefs deepen.*

## Design rules (from the charter)

1. **Evidence-linked** — every cell score carries a one-line justification and a link to the
   brief/section it rests on. No brief, no score: unmapped domains get briefed first.
2. **Uncertainty is explicit** — each row has a *Confidence* score for how well we currently
   understand that domain. Low-confidence rows are inputs to the
   [knowledge-gaps ledger](03-knowledge-gaps-and-assumptions-ledger.md), not to conclusions.
3. **No default composite ranking.** Dimension profiles are shown side by side; optional
   weight presets exist below, but a single number hides exactly the trade-offs this index
   exists to reveal.
4. **Path-optionality is a constraint check, scored last** — never a filter, never a
   tiebreaker before impact/interest/feasibility (guardrail #3).

## Scoring dimensions (the columns)

Derived from the stated needs. Scale 1–5, anchored:

| # | Dimension | What it measures | Anchor: 1 | Anchor: 5 |
|---|-----------|------------------|-----------|-----------|
| D1 | **Impact potential** | Problem severity × how much *research* (vs capital/policy alone) can move it | Research output changes little | Research directly helps people / shifts the field |
| D2 | **Solo tractability** | Can one part-time person produce a meaningful result | Needs a team/lab/insider access | Solo studies routinely land here |
| D3 | **Budget fit** | Real cost of a credible study | Needs $10k+ compute or paid data | ≤$500 + APIs + free tiers suffices |
| D4 | **Skills fit** | Match to current strengths (data pipelines, LLM tuning, eval methodology, LLM-as-judge) | Needs architecture/pretraining/theory depth | Sits exactly on existing published expertise |
| D5 | **Claude leverage** | How much extensive Claude use multiplies throughput | Little to automate | Claude accelerates most of the workflow |
| D6 | **Gap density** | Room for new contributions, grounded in named gaps from briefs | Saturated; incumbents cover the ground | Many named, citable, unclaimed gaps |
| D7 | **SME attainability** | Time-to-credible-expert (canon size, field velocity, # incumbents) | Years of catch-up against large canon | A focused year could make you a known name |
| D8 | **Community & publishing access** | Venues/communities where outsider work gets read (workshops, D&B tracks, active discourse) | Closed/insider venues only | Open venues + active community that engages outsiders |
| D9 | **Path optionality** *(constraint check — scored last)* | Do nonprofit, hired, and startup routes all plausibly exist here | ≤1 plausible route | All three routes have existing examples |
| — | **Confidence** | How well *we* understand this domain (brief depth, source quality) | Single thin brief / secondary sources | Deep multi-source brief, verified |

## The rows (candidate domains)

Union of (a) the stated problem list, (b) the divergent-sweep fields, (c) notable wildcards.
Problem-oriented and method-oriented rows overlap deliberately — a "problem" row scores the
*problem space*, a "field" row scores the *practice*; the matrix notes pairings.

**From the problem list:**
1. Environmental footprint of AI — energy, power supply, water, carbon
2. Model-development bottlenecks — data walls, compute limits, training instabilities
3. AI supply chain — chips, HBM, manufacturing chokepoints
4. Governance, regulation & geopolitics — inter-government competition, sanctions, export controls
5. Social impact: labor & economics — job loss, displacement, augmentation-vs-automation
6. Social impact: human disempowerment & cognitive change — deskilling, reliance, cognition
7. Bias & fairness — model bias (measurement/mitigation) + deployed-system bias (gender, race, etc.)
8. Model architecture research
9. Agent security & authentication — identity, delegation, injection, tool-stream security
10. AI development & research tooling
11. Agent architectures & orchestration — memory, planning, multi-agent design

**From the divergent sweep** (briefs in [briefs/](briefs/)):
12. Evaluation & benchmarking science (the [field map](01-evaluation-field-map.md))
13. Model behavior science / behavioral fingerprinting
14. The data science of AI — curation, forensics, contamination, provenance
15. Reproduction, replication & meta-science
16. Vertical evaluation & third-party audit (medicine, law, finance, education, gov)
17. Small/open-model science
18. Human-AI interaction field studies *(method row pairing with rows 5–6)*
19. *(Wildcards — added as their briefs land)*

## Weight presets (optional views, never the default)

- **Impact-first (charter default when a view is needed):** D1 ×3, D6 ×2, D2/D4 ×1.5, others ×1, D9 as pass/fail note only.
- **Fastest-credible-artifact:** D2/D3/D5 ×2, D8 ×1.5, others ×1.
- **Long-game SME:** D7 ×3, D6/D1 ×2, others ×1.

## The matrix

> **Status: awaiting scoring pass.** Rows 1–11 require the problem-domain briefs now in
> flight; rows 12–18 rest on the completed sweep/eval briefs. The scoring pass fills this
> table with evidence-linked cells + per-row scorecards below it; a calibration reviewer
> then normalizes scores *across* rows so a "4" means the same thing everywhere.

| Domain | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | Conf |
|---|---|---|---|---|---|---|---|---|---|---|
| *(filled by the scoring pass)* | | | | | | | | | | |

---

*Method note: scores are proposed per-row by domain scorers reading the briefs, then
normalized by a single cross-row calibrator, then challenged against the
[adversarial critique](03-knowledge-gaps-and-assumptions-ledger.md). Disagreements are
recorded, not averaged away.*
