# Weekly Radar — Design & Operating Spec

*The specification the automated radar agents follow. Two scheduled agents keep the
program current: a **weekly radar** (scan + digest) and a **monthly refresh** (deeper
review proposing updates to the index and ledger). Digests land in
[radar/](radar/). This doc is the contract — edit it to change what the agents do.*

## Why this exists

The [briefs](briefs/), [index](05-domain-comparison-index.md), and
[ledger](03-knowledge-gaps-and-assumptions-ledger.md) are snapshots. The field moves
weekly. The radar (a) keeps our domain knowledge current, (b) watches for **scoops** —
someone publishing what we planned to build, (c) surfaces events that should change
index scores or settle ledger items, and (d) tracks the businesses/governments whose
moves reshape these fields.

## Principles (inherited from the [charter](00-goals-and-operating-principles.md))

- **Propose, don't overwrite.** Radar agents write digests and *propose* index/ledger
  changes; they never edit the index, ledger, or briefs directly. Proposals are applied
  deliberately in a working session.
- **Linked and dated.** Every item carries a date and a link actually opened by the agent.
- **Signal over volume.** Hard cap ~200 lines per digest. An empty section says "nothing
  material this week" — padding is a defect.
- **Honesty.** Rumors and single-source claims are tagged ⚠️. Vendor claims are tagged
  [vendor].

## Coverage clusters (mapped to the [index](05-domain-comparison-index.md) rows)

| Cluster | Covers (index rows) | Primary sources to sweep |
|---|---|---|
| **A. Evaluation & benchmarking** | 12 | arXiv (eval/benchmark keywords), METR / Epoch AI / Apollo / LMArena / HELM / EleutherAI / UK AISI (Inspect) / MLCommons blogs & repos, NeurIPS D&B, EvalEval |
| **B. Agents: architecture, security, auth** | 9, 11 | arXiv (agent memory/planning/multi-agent/injection), OWASP LLM, IETF drafts (Web Bot Auth, HTTP message signatures), MCP/A2A spec repos & changelogs, AgentDojo-class benchmarks, notable CVEs/incidents |
| **C. Compute, environment & supply chain** | 1, 3 + *our own cost basis* | IEA, SemiAnalysis, datacenter/power/water reporting, BIS export-control actions, chip-supply news (TSMC/HBM), Epoch compute tracking — **plus the program's research-cost basis: GPU rental spot prices (A100/H100/L40S on RunPod/Lambda/Vast), frontier-API price/quota changes, free-tier changes, and major dataset access/license changes.** Flag anything that changes a planned study's cost by >2× |
| **D. Governance & geopolitics** | 4 | EU AI Act implementation news, US federal/state AI law, UK/US/EU institute publications, CSET / GovAI / RAND / IAPS pubs, sanctions & international-competition moves |
| **E. Social impact: labor, cognition, bias, inequality** | 5, 6, 7, 19 | NBER/SSRN working papers, Anthropic Economic Index updates, FAccT/CHI proceedings, cognition-and-AI studies, enforcement news (NYC LL144, Colorado, EEOC) — **plus wealth-inequality mechanisms: capital-vs-labor share studies, AI-equity wealth concentration, data-labor economics, UBI pilot results, datacenter-community economics, market-concentration/antitrust moves, Global South access studies** |
| **F. Models, data & training research** | 2, 8, 14, 17 | arXiv (architecture/scaling/data/quantization), open-weights releases + license changes, nanoGPT-speedrun/BabyLM communities, contamination/data-forensics work |
| **G. Ecosystem business moves** | cross-cutting | Funding rounds & launches in evals/agent-infra/data-foundry (TechCrunch etc.), new nonprofits/labs, eval-org hiring pages (signal of field growth), notable acquisitions/pivots |
| **H. Scoop-watch** | our own plans | Search each active candidate-study keyword set (from the [solo agenda](../ai-research-map/00-overview/solo-researcher-research-agenda.md): quantized judges, over-refusal benchmarks, agent-trajectory judging, behavioral fingerprinting/personas, etc.) + any ledger item marked DIGGING |

## Weekly digest format — `radar/<YYYY>-W<WW>.md`

```markdown
# Radar — week of <date>

## TL;DR (≤5 bullets — the week's material developments for THIS program)

## A. Evaluation & benchmarking
- <date> — [item](link) — one line on why it matters to us
...(clusters B–G, same shape; omit-with-"nothing material" allowed)

## H. Scoop-watch
- <candidate study> — CLEAR / ⚠️ NEAR-MISS (link) / 🔴 SCOOPED (link + what remains novel)

## Program impact
- **Index-change proposals:** row · dimension · current→proposed · evidence link
- **Ledger updates proposed:** item · OPEN→SETTLED/REVISED · evidence link
- **Suggested actions:** ≤3, concrete
```

## Monthly refresh — `radar/monthly-<YYYY>-<MM>-review.md`

First Monday cadence. Reads the month's weekly digests + spot-rechecks primary sources, then
proposes (never applies): index-score and Confidence changes with evidence; ledger
settlements; brief sections now stale enough to need a re-research pass; and a
"drift check" — is the program's framing still right, per the charter's breadth principle
(*what categories of work are we still not considering?*).

## Mechanics

- Repo: this repository, branch `claude/ai-research-areas-dqfecy`. Pull before writing;
  commit **only** the new digest file; push.
- Runtime budget: keep a run under ~45 minutes; prefer fewer, better-verified items.
- Scheduled tasks run while the desktop app is open; a missed run fires on next launch.
