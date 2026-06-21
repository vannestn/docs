# Safety Institutes & Governance

Government and third-party evaluation capacity, dangerous-capability assessment, and the
emerging regulatory regime.

## Key directions & work

### Safety/standards institutes
- **UK AISI** — estimates the 80%-reliability *cyber* time horizon doubling every ~4.7
  months since reasoning models emerged. [AISI](https://www.aisi.gov.uk/blog/how-fast-is-autonomous-ai-cyber-capability-advancing).
  **RepliBench** (autonomous replication): best model passes >50% on 15/20 task families but
  struggles on persistence — "obtain compute = easy, persist = hard." [arXiv:2504.18565](https://arxiv.org/html/2504.18565v2)
- **US CAISI** (renamed/refocused former US AISI) — 40+ model evals by May 2026, evaluated
  open-weight DeepSeek V4 Pro, signed pre-deployment testing agreements with Google,
  Microsoft, xAI (joining OpenAI, Anthropic). [NIST](https://www.nist.gov/caisi)
- **International Network** of AI safety/standards institutes (10 members) published
  consensus on automated-eval practices (Feb 2026). [NIST](https://www.nist.gov/news-events/news/2026/02/international-network-advanced-ai-measurement-evaluation-and-science)

### Dangerous-capability evaluations
- **CBRN / ASL-3** — Anthropic activated ASL-3 for Claude Opus 4, then in Feb 2026 softened
  its Responsible Scaling Policy (removing the categorical "halt training" commitment). [SaferAI arXiv:2512.01166](https://arxiv.org/pdf/2512.01166)
- **Persuasion** — a large RCT (~42k people, 19 LLMs) found a persuasion-optimized AI shifted
  voters ~3.9 points in ~6 minutes — ~4× typical political ads. [Science](https://www.science.org/doi/10.1126/science.aea3884)
- **Biorisk construct validity** — Epoch argues current biorisk evals measure proxy
  knowledge, not end-to-end bioweapon-development risk. [Epoch](https://epoch.ai/gradient-updates/do-the-biorisk-evaluations-of-ai-labs-actually-measure-the-risk-of-developing-bioweapons)

### Regulation & frameworks
- **EU AI Act / GPAI** — Code of Practice published Jul 2025; GPAI obligations in force Aug
  2025; Commission enforcement from **Aug 2026**. [EU](https://digital-strategy.ec.europa.eu/en/policies/ai-code-practice)
- **RAND** weight-security framework (five-tier, up to nation-state attackers). [RAND](https://www.rand.org/pubs/research_reports/RRA2849-1.html)
- **Independent scorecards:** SaferAI scores frameworks 8–34% (median 18%); FLI's index
  grades all labs ≤C+. [SaferAI arXiv:2512.01166](https://arxiv.org/html/2512.01166) · [FLI](https://futureoflife.org/ai-safety-index-winter-2025/)
- **International AI Safety Report 2026** (Bengio, 100+ experts) — central finding: capability
  is advancing faster than safeguards. [report](https://internationalaisafetyreport.org/publication/international-ai-safety-report-2026)

## State of research

**Best-performing now:** Government institutes (UK AISI, US CAISI) with pre-deployment model
access and structured dangerous-capability evals are the most concrete governance machinery.
The EU AI Act/GPAI Code is the most consequential binding regime.

**Promising but unproven:** International coordination (the Network), compute governance, and
weight-security standards — frameworks exist but enforcement and adoption are early.

**Open problems & weaknesses:** **Voluntary frameworks capture ≤⅓ of recommended practice**
(SaferAI), and at least one lab *weakened* its commitment in 2026. Evals can be sandbagged
and have contested construct validity. The capability-vs-safeguard gap is the consensus
worry. Governance is racing a faster-moving capability frontier.
