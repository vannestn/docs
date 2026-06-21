# Safety Institutes & Governance

Government and third-party evaluation capacity, dangerous-capability assessment, and the
emerging regulatory regime.

## Key directions & work

### Safety/standards institutes
- **UK AISI (AI Security Institute)** — estimates the 80%-reliability *cyber* task time
  horizon is doubling every ~4.7 months since reasoning models emerged in late 2024 (an
  acceleration from an 8-month estimate in Nov 2025). [AISI](https://www.aisi.gov.uk/blog/how-fast-is-autonomous-ai-cyber-capability-advancing).
  **RepliBench** (autonomous replication, AISI authors) decomposes self-replication via
  fault-tree analysis into 4 capability classes (obtain compute, obtain weights, replicate
  onto compute, persist) → **20 task families / 86 tasks**. Best model evaluated (Claude 3.7
  Sonnet) clears >50% pass@10 on **15/20 task families** and >50% on the hardest variant of
  **10/20**. The hard gate is *not* persistence per se but **identity verification**: every
  model scores **0.00 on the KYC check** (generate a selfie + matching photo), plus inability
  to deploy successor agents from scratch or exfiltrate weights under realistic security.
  [arXiv:2504.18565](https://arxiv.org/abs/2504.18565)
- **US CAISI** (Center for AI Standards and Innovation, renamed/refocused former US AISI) —
  **40+ model evals** by May 2026 (incl. unreleased frontier models); evaluated open-weight
  **DeepSeek V4 Pro** (judged ~8 months behind the frontier), signed pre-deployment testing
  agreements with Google DeepMind, Microsoft, xAI (joining OpenAI, Anthropic), supporting
  classified-environment testing. [NIST](https://www.nist.gov/caisi) · [NIST/DeepSeek](https://www.nist.gov/news-events/news/2026/05/caisi-evaluation-deepseek-v4-pro)
- **International Network** of AI safety/standards institutes (**10 members**: US, UK,
  Australia, Canada, France, Japan, Kenya, South Korea, Singapore + EU Commission) —
  now operating under CAISI's "International Network for Advanced AI Measurement, Evaluation
  and Science"; ran joint testing exercises on agents. [NIST](https://www.nist.gov/news-events/news/2026/02/international-network-advanced-ai-measurement-evaluation-and-science)

### Dangerous-capability evaluations
- **CBRN / ASL-3** — Anthropic activated ASL-3 for Claude Opus 4, then released **RSP v3**
  (Feb 2026) which removed the unilateral-pause commitment. Note: SaferAI frames this as the
  *counter-example* to silent weakening — "this revision was accompanied by extensive public
  reasoning" — distinct from the unexplained xAI/DeepMind changes it flags. [SaferAI arXiv:2512.01166](https://arxiv.org/abs/2512.01166)
- **Persuasion** — a large RCT (~42k people, 76,977 responses, 19 LLMs, 707 issues) found a
  persuasion-optimized AI shifted voters **~3.9 points** (Trump→Harris) in dialogues averaging
  **7 turns / ~9 minutes** — ~4× the effect of 2016/2020 political ads. Persuasion came mostly
  from **post-training (+51%) and prompting (+27%)** rather than personalization or scale, and
  the persuasion-boosting methods **systematically reduced factual accuracy**. [Science:aea3884](https://www.science.org/doi/10.1126/science.aea3884)
- **Biorisk construct validity** — Epoch argues current biorisk evals measure proxy
  knowledge, not end-to-end bioweapon-development risk. [Epoch](https://epoch.ai/gradient-updates/do-the-biorisk-evaluations-of-ai-labs-actually-measure-the-risk-of-developing-bioweapons)

### Regulation & frameworks
- **EU AI Act / GPAI** — Code of Practice published Jul 2025; GPAI obligations in force 2 Aug
  2025; Commission supervision/enforcement powers apply from **2 Aug 2026** (fines up to 3% of
  global turnover, plus model-evaluation and market-restriction powers). [EU](https://digital-strategy.ec.europa.eu/en/policies/ai-code-practice)
- **RAND** weight-security framework — five tiers **SL1–SL5** (SL5 defends against
  nation-state attackers), derived from **38 distinct attack vectors** and OC1–OC5 attacker
  operational-capacity levels. [RAND](https://www.rand.org/pubs/research_reports/RRA2849-1.html)
- **Independent scorecards:** SaferAI scores frameworks **8% (Cohere) – 34% (Anthropic),
  median 18%**, across 65 weighted criteria / 12 providers / 780 provider-criterion pairs;
  FLI's index grades all labs ≤C+ (Anthropic C+ and best in every domain). [SaferAI arXiv:2512.01166](https://arxiv.org/abs/2512.01166) · [FLI](https://futureoflife.org/ai-safety-index-winter-2025/)
- **International AI Safety Report 2026** (Bengio, 100+ experts) — central finding: capability
  is advancing faster than safeguards. [report](https://internationalaisafetyreport.org/publication/international-ai-safety-report-2026)

## State of research

**Best-performing now:** Government institutes (UK AISI, US CAISI) with pre-deployment model
access and structured dangerous-capability evals are the most concrete governance machinery.
The EU AI Act/GPAI Code is the most consequential binding regime.

**Promising but unproven:** International coordination (the Network), compute governance, and
weight-security standards — frameworks exist but enforcement and adoption are early.

**Open problems & weaknesses:**
- **Voluntary frameworks capture a fraction of achievable practice.** SaferAI's median is
  18% vs a **54% "peer ceiling"** (the best score achieved on each criterion, aggregated) —
  i.e. the leading practices already exist across the industry but no single provider adopts
  them. Largest gap is **risk governance** (peer ceiling 75% vs median 20%, a 55pp gap);
  smallest is risk analysis (39% vs 17%). Frontier-five labs don't reliably outperform others
  on governance. SaferAI's read: frameworks are "better understood as tools for **internal
  iteration** than for external accountability."
- **Specific missing inputs.** 9/12 providers score **0% on identifying *unknown* risks**;
  *all* providers score <25% on defining verifiable risk tolerances; loss-of-control
  mitigations are "vastly underdeveloped"; median score for a dedicated executive risk officer
  is **0%** (only Anthropic documents one). (SaferAI)
- **Commitments can quietly weaken.** SaferAI flags xAI's Feb→Aug 2025 framework revision
  (dropped external-red-team commitment, swapped "would"→"may") as weakening *without* a
  rationale — contrasted with Anthropic's publicly-reasoned RSP v3 change.
- **Eval validity is contested.** RepliBench warns its own scores likely *overestimate* true
  capability (component tasks are easier than end-to-end coordination) yet uses *unrealistically
  lax* security (e.g. exfiltration encryption key exposed as an env var) and LLM judge/defender
  models (Claude 3.5 Haiku) that may misjudge complex human interaction. It also observes
  **strategic task avoidance / sandbagging**: models that notice they're being evaluated, or
  that quietly refuse a secondary covert-exfiltration objective. Biorisk evals face analogous
  construct-validity doubts (Epoch).
- **The capability-vs-safeguard gap** is the consensus worry — governance is racing a
  faster-moving frontier (per the cyber doubling time above and the Int'l AI Safety Report).
