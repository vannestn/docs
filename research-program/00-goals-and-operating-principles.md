# Goals & Operating Principles

*The charter for this research program. Everything else in `research-program/` serves this doc.*

## The mission

Establish myself as an AI researcher by **executing real studies**, become a
**subject-matter expert** in a field I choose deliberately, and do work whose primary
measure is **impact — helping people and advancing the field**. Three exit paths stay
open the whole way, in no forced order:

1. **Hired** — researcher/engineer at an AI startup or lab, on the strength of published work.
2. **Founder** — a startup that does this research or productizes it.
3. **Nonprofit** — a research org shaped like METR / Epoch / Apollo, funded by grants.

The nonprofit route is not a fallback. In evaluation research specifically, the most
credible institutions are nonprofits, and grant funders (Open Philanthropy, LTFF,
Survival & Flourishing, NSF) actively fund exactly this shape of work.

## Operating principles (non-negotiable)

These encode the three failure modes this program must avoid.

### 1. Breadth and creativity before convergence
Keep a wide candidate set. At every review step, ask explicitly: *what categories of
work are we not considering?* A dedicated wildcard track exists purely to surface
unconventional options. "Someone is already exploring X" does **not** disqualify X —
crowded fields can still have real gaps — but it does obligate us to read what's
published and name the specific gap we'd fill.

### 2. Understand the domain before picking a topic
Two failure modes to guard against: choosing with shallow understanding, and
accidentally repeating work that's already done. So topic selection is a **staged
process, never a single jump**:

> **map the field → read the prior work → run cheap pilots in 2–3 fields → then choose where to go deep**

Every claimed "gap" must survive a prior-work check against published examples.
Deliberate replication is legitimate research; accidental duplication is a process
failure.

### 3. A living knowledge-gaps ledger
[03-knowledge-gaps-and-assumptions-ledger.md](03-knowledge-gaps-and-assumptions-ledger.md)
tracks what **we** don't know: thin spots in our field maps, assumptions we're
leaning on but haven't tested, and claims we've repeated without verifying. Each
phase of work updates it. Weak assumptions get named, then attacked.

### 4. Impact first; marketability is a late-stage constraint check
Options are never pruned during exploration for business-model or job-market
reasons. When a shortlist exists, marketability gets *one* pass as a constraint check
("does any path to sustainability exist?") — not as a ranking function.

## Assets & constraints

| Asset | Detail |
|---|---|
| Skills | Data pipelines (XGBoost/classical ML), LLM tuning, **evaluation methodology** — published LLM-as-judge study on RAG hallucination detection |
| Knowledge base | [The AI research map](../ai-research-map/README.md) — verified against full text of its 192 cited papers (local PDFs) |
| Candidate studies | [Solo-researcher agenda](../ai-research-map/00-overview/solo-researcher-research-agenda.md) — 11 vetted ≤$500 projects (candidates, not commitments) |
| Compute | Laptop + free tiers + ≤~$500/study rented GPU + frontier APIs |
| Force multiplier | Claude, used extensively (code, data, labeling, lit review, drafting) |
| Time | Part-time, solo |

## The program's documents

| Doc | Role |
|---|---|
| [01-evaluation-field-map.md](01-evaluation-field-map.md) | Deep map of the evaluation/benchmarking ecosystem — shape, scope, players, funding, careers, gaps |
| [02-candidate-research-fields.md](02-candidate-research-fields.md) | The divergent sweep: every field where a solo, low-budget researcher can plausibly contribute — including unconventional ones |
| [03-knowledge-gaps-and-assumptions-ledger.md](03-knowledge-gaps-and-assumptions-ledger.md) | Living ledger of what we don't know and what we're assuming |
| [04-topic-selection-process.md](04-topic-selection-process.md) | How we'll choose — the staged process, criteria, and current status (no topic is chosen yet) |
| [briefs/](briefs/) | The underlying research briefs each map/sweep is built from |
