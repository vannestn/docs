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
| D3 | **Resource & cost fit** | Full resource profile — hardware class, experiment iteration speed vs part-time pacing, data availability/quality/access, supply/price exposure, and dollar cost (evidence: [briefs/resource-profiles.md](briefs/resource-profiles.md)) | Resource-gated: needs a team/cluster, days-long iteration, or closed data | Laptop/API, fast iteration, open data, ≤$500 |
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

> **Status: scored, calibrated, challenged.** Cells are per-row scores (domain scorers →
> single cross-row calibrator → adversarial challenge pass). Corrections applied in this
> pass are logged in [Calibration & challenge log](#calibration--challenge-log) below;
> disagreements are recorded, not averaged away. **Bold** marks each row's single highest
> dimension. **D9 is capped at 4 program-wide** this pass (see challenge #15): Cluster A of
> the [ledger](03-knowledge-gaps-and-assumptions-ledger.md) is OPEN and evidence-*negative*
> on whether unaffiliated individuals can actually fund/route into these fields, and D9 is a
> constraint-check note, not a scored discriminator — a wall of 5s hides that.

Rows are sorted alphabetically within two groups: **problem-domains** first, then
**fields & wildcards**. Confidence (Conf) is *how well we understand the domain*, not how
attractive it is — read it as a discount on every other cell in the row.

### Problem-domains

| Domain | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | Conf |
|---|---|---|---|---|---|---|---|---|---|---|
| Agent architectures & orchestration | 4 | 5 | 5 | 4 | **5** | **5** | 4 | **5** | 4 | 4 |
| Agent security & authentication | **5** | **5** | **5** | 4 | **5** | 3 | 4 | **5** | 4 | 4 |
| AI development & research tooling | 4 | **5** | **5** | **5** | **5** | 4 | 4 | **5** | 4 | 4 |
| AI supply chain (chips, HBM, export-control effects) | **5** | **5** | **5** | **5** | 4 | **5** | 4 | **5** | 4 | 4 |
| Alternative-hardware (non-NVIDIA) training | **5** | **5** | 4 | 4 | **5** | **5** | 4 | 4 | 4 | 3 |
| Bias & fairness (model + deployed-system) | **5** | **5** | 4 | **5** | 4 | **5** | 4 | **5** | 4 | 4 |
| Environmental footprint of AI (energy, power, water, carbon) | **5** | **5** | **5** | **5** | 4 | 4 | 4 | **5** | 4 | 4 |
| Governance, regulation & geopolitics | **5** | **5** | **5** | **5** | **5** | **5** | 4 | **5** | 4 | 4 |
| Model architecture research | 4 | **5** | **5** | 4 | 4 | **5** | 2 | **5** | 4 | 4 |
| Model-development bottlenecks (data wall, compute, RL limits) | **5** | **5** | **5** | 4 | 4 | 4 | 4 | **5** | 4 | 4 |
| Social impact: disempowerment & cognitive change | **5** | 4 | 4 | **5** | **5** | **5** | 4 | **5** | 4 | 4 |
| Social impact: labor & economics | **5** | **5** | **5** | 4 | 4 | **5** | 3 | 4 | 4 | 3 |
| Wealth inequality (mechanisms & measurement) | 4 | **5** | **5** | **5** | 4 | **5** | 3 | 4 | 4 | 3 |

### Fields & wildcards

| Domain | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 | Conf |
|---|---|---|---|---|---|---|---|---|---|---|
| Evaluation & benchmarking science | **5** | **5** | **5** | **5** | 4 | 4 | 4 | **5** | 4 | 4 |
| Human-AI interaction field studies | **5** | 3 | 3 | 4 | 4 | **5** | 3 | 4 | 4 | 4 |
| Model behavior science / behavioral fingerprinting | 4 | **5** | **5** | **5** | **5** | **5** | 4 | **5** | 4 | 4 |
| Reproduction, replication & meta-science | **5** | **5** | **5** | **5** | **5** | **5** | 4 | 4 | 4 | 4 |
| Small/open-model science | 4 | **5** | **5** | **5** | 4 | **5** | 4 | **5** | 4 | 4 |
| The data science of AI (curation, forensics, contamination, provenance) | 4 | **5** | 4 | **5** | 4 | **5** | 4 | **5** | 4 | 4 |
| Vertical evaluation & third-party audit (medicine, law, finance, edu, gov) | **5** | **5** | 4 | **5** | 4 | **5** | 4 | **5** | 4 | 4 |
| Wildcard: Agent market ecology (collusion, price wars, machine economics) | 4 | **5** | **5** | 4 | 4 | 4 | 4 | 4 | 4 | 3 |
| Wildcard: Energy/water measurement of closed API models | 4 | 4 | 4 | 4 | 4 | **5** | 3 | 3 | 3 | 3 |
| Wildcard: Model welfare empirics | 3 | 4 | 4 | 3 | 4 | 4 | 4 | 3 | 4 | 3 |

---

## Per-row scorecards

Each subsection: the nine dimension scores with a one-line justification + evidence pointer,
then the Confidence rationale, then the single standout fact. Scores shown are **post-challenge**
(the pre-challenge value is noted inline where a correction was applied; full reasoning in the
[challenge log](#calibration--challenge-log)).

### Problem-domains

#### Agent architectures & orchestration
- **D1 = 4** — Agents are the dominant deployment mode; reliability/failure-mode/cost research shifts practice (Anthropic model cards now report pass^k). *(problem-11, "The problem, concretely")*
- **D2 = 5** — 2–3-author and solo works (Tran & Kiela, ADAS, aider); every shape is API-behavioral on open scaffolds. *(problem-11, "Who does this work")*
- **D3 = 5** — HAL's $40K bought 21,730 rollouts; a slice fits a few hundred dollars, API-only, no GPU rental. *(problem-11, "What a solo researcher could do here")*
- **D4 = 4** — Acute open problems are eval-methodology (judge validation, cost-controlled comparison, reliability stats) — the profile's lane, not architecture depth. *(problem-11, "Fit notes")*
- **D5 = 5** — Primary sources are Anthropic-published and openly scaffoldable; heavy Claude use aligns with trace generation and judging. *(problem-11, "Fit notes")*
- **D6 = 5** — Dense named unclaimed gaps: no neutral memory eval, single-vs-multi under controls unresolved, compaction-without-ablation, immature reliability stats. *(problem-11, "Where the gaps are")*
- **D7 = 4** — Solo instruments (aider leaderboard) became field references and MAST-style method is replicable; high field velocity and many incumbents cap it. *(problem-11, "Who does this work")*
- **D8 = 5** — Open harnesses take submissions (HAL, BrowserGym, MAST, Terminal-Bench); independent GitHub-issue audits are a recognized genre. *(problem-11, "How outsiders contribute")*
- **D9 = 4** *(capped from 5)* — Nonprofits (METR, Laude), company teams, startups (Sierra, Letta, Mem0/Zep) all present. *(problem-11, "Who does this work")*
- **Confidence = 4** — Deep, multi-source brief with named papers, authors, links, dollar figures; some claims (LOCOMO audit, HAL reasoning-effort result) flagged unverified.
- **Standout fact:** The domain's most acute open problems are precisely evaluation-methodology problems (judge validation, cost-controlled comparison, reliability statistics) that map onto the researcher's published LLM-as-judge strength — and every viable study shape is API-behavioral on open scaffolds within ≤$500 (per HAL's own cost arithmetic), no training runs.

#### Agent security & authentication (identity, delegation, injection)
- **D1 = 5** — Live, adopted-at-scale attack surface (1,862 unauthenticated MCP servers, spoofable Agent Cards); independent measurement moves a field long on proposals, short on evidence. *(problem-09, "The problem, concretely")*
- **D2 = 5** — Landmark exemplars are laptop/API-scale (AP2 red-team 3 authors, garak a solo sabbatical, Rehberger a lone independent). *(problem-09, "Published exemplars"; sweep-03)*
- **D3 = 5** — Every study runs on laptop + frontier APIs + optional <$500 GPU; exemplar attack papers are API-scale, no paid data. *(problem-09, "Fit notes")*
- **D4 = 4** — Biggest gap (absence of benchmarks/measurement) is the profile's eval specialty; docked one because incumbent expertise is distributed-systems/identity security, an adjacency stretch. *(problem-09, "Fit notes")*
- **D5 = 5** — Workflow is eval-harness building, adversarial trajectory generation, LLM-as-judge scope-compliance, threat-modeling — Claude-accelerable end to end. *(problem-09, "What a solo researcher could do")*
- **D6 = 3** *(challenged down from 5)* — The 5 hung on arXiv:2605.16282 ("robustness is the sole category with zero benchmarks"), flagged in ledger **C-11 / T-problem-09** as read-as-anchor in problem-09 but *unopened* in sweep-03. Real gaps exist, but the field's single biggest gap claim rests on an unverified anchor. *(problem-09, "Where the gaps are")*
- **D7 = 4** — Young, fluid, few incumbents; foundational papers 2024–2026 and standards live, but distributed-systems canon adds catch-up. *(problem-09, "The research field around it")*
- **D8 = 5** — Unusually open venues: IETF WGs and OpenID AIIMCG take unaffiliated individuals free; OWASP contribution, Gray Swan competition-to-hire. *(problem-09, "Who does this work")*
- **D9 = 4** *(capped from 5)* — Nonprofit/governance (GovAI, Palisade, AISI), startups (PayOS, Vouched, AgentPassport), hired (Gray Swan Arena-to-hire, Invariant/Snyk). *(problem-09, "Who does this work")*
- **Confidence = 4** — Two substantial multi-source briefs with dense primary links; several 2026 arXiv IDs and vendor-adoption claims flagged unverified/snippet-only.
- **Standout fact:** A 2026 taxonomy finds robustness is the sole risk category with zero primary benchmarks — no "AgentDojo for delegation/scope-adherence" — and that gap sits on the profile's eval specialty. *(But the anchor paper is unverified per ledger C-11; see D6.)*

#### AI development & research tooling
- **D1 = 4** — Tooling determines measured behavior; harness swings SWE-bench 10–20pts, benchmark rot reshuffles 40.9% of leaderboards. *(problem-10, "The problem, concretely")*
- **D2 = 5** — Multiple solo/2-person exemplars became infrastructure (Aider, Unsloth, Miller's error-bars paper by one author, no GPUs). *(problem-10, "Published exemplars")*
- **D3 = 5** — Profile-closest exemplars (error-bars, UTBoost, BetterBench) done with little/no GPU; every shape fits ≤$500. *(problem-10, "Fit notes")*
- **D4 = 5** — LLM-as-judge/RAG-hallucination study maps onto judge-stability frontier; data-pipeline background matches trace→eval and verifier-audit ETL. *(problem-10, "Fit notes")*
- **D5 = 5** — Extensive Claude/agent-tooling use means daily contact with the exact surfaces under study; studies are mostly engineering Claude accelerates. *(problem-10, "Fit notes")*
- **D6 = 4** — Seven named gaps (cross-harness metrology, verifier auditor, trace→eval pipeline, rot-detection CI), but most flagged absence-inferred, not proven unclaimed. *(problem-10, "Where the gaps are")*
- **D7 = 4** — "Maintenance→research standing" template documented (lm-eval); solo Aider/Miller gained standing fast; fast-moving field, small canon. *(problem-10, "How outsiders contribute")*
- **D8 = 5** — Open venues (NeurIPS D&B, TOSEM, MLSys) plus documented channels: Inspect Evals PRs (50+ external), lm-eval tasks, OTel SIG, Croissant WG. *(problem-10, "How outsiders contribute")*
- **D9 = 4** *(capped from 5)* — Nonprofit (EleutherAI, Transluce), hired (AISI, labs), founder (Unsloth YC, Langfuse acquired). *(problem-10, "Who does this work")*
- **Confidence = 4** — Deep single brief, primary sources opened/verified; capped because key gap claims are explicitly absence-inferred, not proven, and it is one brief.
- **Standout fact:** Tooling moves measured AI behavior more than the model itself — the same Claude Opus 4.5 scored 50.2%–55.4% on SWE-bench Pro across three scaffolds, and correcting mislabeled SWE-bench Lite patches reshuffled 40.9% of the leaderboard — yet the profile's exact strengths map onto the field's live frontier at ≤$500.

#### AI supply chain (chips, HBM, export-control effects)
- **D1 = 5** — Underpins decade-defining export-control and compute-threshold policy; CSET desk research literally set national policy. *(problem-03, "The problem, concretely"; "Published exemplars")*
- **D2 = 5** — Named solo/near-solo exemplars (Grunewald IAPS, Juniewicz single-author Epoch, Miller solo essay); public desk research, no lab access. *(problem-03, "Published exemplars")*
- **D3 = 5** — All six shapes run laptop-only on free data (Sentinel imagery, Epoch datasets, trade/court records); no GPU spend required. *(problem-03, "Fit notes")*
- **D4 = 5** — LLM-as-judge validation maps onto unaudited estimates; XGBoost/anomaly detection fits trade-data and imagery work the field has barely automated. *(problem-03, "Fit notes")*
- **D5 = 4** — Strong for LLM-extraction over indictments/press corpora; less so for satellite-imagery labeling and probabilistic modeling. *(problem-03, study shape 4)*
- **D6 = 5** — Seven named, largely unclaimed gaps: no causal export-control study, unreconciled smuggling estimates, no non-US datacenter tracker, HBM loopholes. *(problem-03, "Where the gaps are")*
- **D7 = 4** — Young field (~3–4 quantitative smuggling attempts), small incumbent set; policy/econ canon adds catch-up load. *(problem-03, "The research field around it")*
- **D8 = 5** — AI Frontiers publishes outside authors, Epoch datasets invite extension, Pivotal mentors, arXiv governance open, newsletter path proven. *(problem-03, "How outsiders get in")*
- **D9 = 4** *(capped from 5)* — Nonprofit (IAPS/Epoch), hired (think-tank), commercial newsletter/startup (SemiAnalysis from a standing start). *(problem-03, "Fit notes")*
- **Confidence = 4** — Deep, web-verified brief; capped because many load-bearing figures (RAND, HBM loophole, CXMT capacity) rest on flagged search snippets, not opened pages.
- **Standout fact:** CSET's 2021 desk-research trilogy (3 authors) became the intellectual blueprint for the Oct-2022 US export controls — proof that careful solo/small-team supply-chain research can directly set national policy.

#### Alternative-hardware (non-NVIDIA) training
- **D1 = 5** — Verified non-NVIDIA runs directly test NVIDIA-moat valuations, export-control efficacy, and FLOP-keyed regulation; independent run-level verification is the scarce, decision-relevant input. *(problem-13, "Why it matters" + "The gap, stated plainly")*
- **D2 = 5** — For the solo-viable shapes (observatory, HSPI fingerprinting, re-eval, MFU meta-analysis) it is desk/eval work; caveat: training frontier models yourself is NOT solo-tractable. *(problem-13, "What a solo researcher could do here" #1–#5)*
- **D3 = 4** — Observatory ~$0, fingerprinting/re-eval laptop+few-hundred-$ API, nano-stability fits ≤$500 rented AMD/TPU; tempered: fingerprinting-signal feasibility untested and richest verification data (cluster, ASIC) access-gated. *(resource-profiles ##3/13 analogs ($0–75 desk); problem-13 shapes #1–#3 + ledger (HSPI unproven on frontier weights))*
- **D4 = 4** — Run-grading rubric, HSPI operationalization, re-eval, MFU collation sit on eval-methodology/data-pipeline strengths; docked one for numerical-fingerprinting/hardware-modeling depth outside the profile. *(problem-13, "Fit notes & index treatment"; shapes #2, #5)*
- **D5 = 5** — Workflow is claim-grading schema, LLM-assisted OSINT extraction, eval re-runs, drafting — Claude-accelerable end to end; mirrors the Problem 03 Epoch/OSINT playbook. *(problem-13, "Fit notes" ("Claude-assisted"); shape #1 desk research + schema)*
- **D6 = 5** — Dense named unclaimed gaps: no run-level hardware attribution, no cross-silicon spike/rollback dataset, undisclosed LongCat ASIC, MFU-penalty curve, un-audited zero-rollback claims. *(problem-13, "What we still don't know (ledger)" + "The gap, stated plainly")*
- **D7 = 4** — Thin, near-empty verification niche (Epoch tracks stocks not runs; HSPI methods unaimed at vendor claims); a focused year could own run-level attribution, but semiconductor/numerics canon adds catch-up. *(problem-13, "Who does this research" table ("independent tracking is thin"))*
- **D8 = 4** — arXiv/HSPI academic channel and Epoch/SemiAnalysis-style OSINT publishing exist and read outsiders, but no dedicated outsider-friendly run-verification venue is named; corroborated by cross-row Conf 4. *(problem-13, "Who does this research" (Epoch, academics, arXiv 2411.05197); no venue-specific on-ramp listed)*
- **D9 = 4** *(program-cap)* — Nonprofit (Epoch), commercial-analyst (SemiAnalysis), academic (HSPI) routes all present; startup route via verification tooling plausible. Program-wide D9 cap at 4 applies (Cluster A open). *(problem-13, "Who does this research" table; index challenge #15 (D9 capped at 4))*
- **Confidence = 3** — Single, dense, web-verified brief (pages opened, claims tiered, vendor self-reports flagged) — deep for one doc but not cross-verified across independent briefs. Several load-bearing facts (which ASIC, HSPI survival into frontier open weights, MFU figures, AMD/Cerebras tiers) are explicitly ⚠️-flagged or vendor-sourced, and the whole exploitable gap rests on an untested fingerprinting-feasibility assumption. Comparable to other single-sweep rows scored Conf 3.
- **Standout fact:** The exploitable niche is NOT training frontier models (out of budget/scope) but independent run-level verification, which almost nobody does: vendors announce full-stack non-NVIDIA runs (Meituan LongCat-2.0, 1.6T params, claimed on unnamed domestic ASICs with a tech blog and no arXiv paper), Epoch verifies compute stocks but not which run completed on which silicon, and academics have fingerprinting methods (HSPI, arXiv:2411.05197) never yet aimed at live vendor claims — so a ~$0 claim-grading observatory plus HSPI-on-open-weights fingerprinting sits exactly on the researcher's eval/OSINT stack. Caveat: whether the numerical hardware signature survives into released frontier weights is unproven, an unpriced feasibility risk on the flagship shape.

#### Bias & fairness (model + deployed-system)
- **D1 = 5** — Population-scale harm (1.1B applications screened); research directly moves it (fixing a proxy label removed the bias; audits forced vendor responses). *(problem-07, "The problem, concretely")*
- **D2 = 5** — Canonical works were 1–4 authors (Gender Shades: 2; Webster: solo); correspondence audits need only public APIs and synthetic inputs. *(problem-07, "Published exemplars")*
- **D3 = 4** *(challenged down from 5)* — Model-side (correspondence audits, LL144 scraping, folktables) is API-only/zero-GPU; but the *deployed-system* half the title names is access-gated (ledger U-D8; sibling gap #5 "Access Denied," Suspicion Machines 6-month FOI). A blended 5 overstated the deployed side. *(problem-07, "What a solo researcher could do")*
- **D4 = 5** — Field's most-cited open wounds are eval-methodology (construct validity, judge bias) mapping onto the published LLM-as-judge study; tabular side fits XGBoost. *(problem-07, "Fit notes")*
- **D5 = 4** — Claude accelerates synthetic-resume generation, corpus scraping, LLM-as-judge perturbation harnesses; most shapes are code/data heavy. *(problem-07, "What a solo researcher could do")*
- **D6 = 5** — Many named unclaimed gaps: construct validity unfixed for LLM era, protocol-as-confounder, bias-vs-incompetence unidentified, drift monitoring immature. *(problem-07, "Where the gaps are")*
- **D7 = 4** — Focused canon plus explicit outsider on-ramps (FAccT/AIES accept no-access audits); single solo/duo papers became canonical. *(problem-07, "How outsiders contribute")*
- **D8 = 5** — FAccT and AIES explicitly accept correspondence audits from outsiders; citizen-science and journalism precedents publish replicable methods. *(problem-07, "The research field around it")*
- **D9 = 4** *(capped from 5)* — Nonprofits (DAIR, Ada Lovelace), commercial audit firms (BABL, ORCAA, Eticas), academic/hired groups; LL144/EU-driven audit market. *(problem-07, "Who does this work")*
- **Confidence = 4** — Deep multi-source brief, verified internal map plus fresh web research, dated compliance timeline; some cited items flagged unverified/abstract-level.
- **Standout fact:** The field's most-cited open wounds are evaluation-methodology wounds — construct validity, protocol confounds, LLM-judge bias, benchmark-vs-reality gaps — which map directly onto the researcher's published profile; canonical works here were 1–4 authors using only public APIs and synthetic inputs.

#### Environmental footprint of AI (energy, power, water, carbon)
- **D1 = 5** — Grid-scale severity (datacenter load ~945 TWh by 2030, cost-shift to ratepayers); the core bottleneck is measurement/transparency, which research directly moves. *(problem-01, "The problem, concretely")*
- **D2 = 5** — Field is "strikingly individual-driven"; de Vries solo part-time PhD set the global agenda; Mytton newsletter/audit too. *(problem-01, "Who does this work" + "Published exemplars")*
- **D3 = 5** — Exemplars used public data, API access, or single-node GPU metering; crosswalk/audit shapes are zero-compute. Fits laptop + ≤$500 GPU + APIs. *(problem-01, "Fit notes")*
- **D4 = 5** — Central activity (standardized reproducible measurement of opaque systems, leaderboards) is structurally identical to the profile's published LLM-as-judge/eval work. *(problem-01, "Fit notes")*
- **D5 = 4** — Docket-mining, crosswalk dataset-building, provenance audits, lit review are Claude-accelerable; physical GPU metering and hardware LCA are not. *(problem-01, "What a solo researcher could do here" #5, #3)*
- **D6 = 4** *(challenged down from 5)* — Nine named gaps are real, but the *headline* gap is infeasible, not open: with one ground-truth anchor (Google's number) new estimates are "unvalidatable by construction" (ledger U-D9 / CH-10). Residual gaps are structural-blocker, not clean unclaimed-research. *(problem-01, "Where the gaps are")*
- **D7 = 4** — Small contested field, no credential gate; the two most-cited measurers built standing through public work. *(problem-01, "How outsiders contribute")*
- **D8 = 5** — Open venues that read outsider work: FAccT, NeurIPS D&B, Joule commentaries, HotCarbon (6-page early-stage), AI Energy Score portal, influential newsletters. *(problem-01, "The research field around it")*
- **D9 = 4** *(capped from 5)* — Academic/grant (Strubell, Ren), nonprofit (Epoch, HF public-interest tooling), independent/newsletter-to-standing (Mytton, de Vries). *(problem-01, "Funding models observed")*
- **Confidence = 4** — Deep, multi-source brief: named individuals, venues, funding models, 8 exemplars, 9 source-linked gaps; a few paywalled items and single-anchor validation prevent a 5.
- **Standout fact:** 15 of the top 20 most-used models are closed-source, zero closed vendors have submitted to energy benchmarking, and only Google has published a methodology-backed per-query number — so a solo researcher validating black-box estimation against that single ground truth addresses the field's central unverified claim. *(That single anchor is also the D6 unvalidatability blocker — the same fact cuts both ways.)*

#### Governance, regulation & geopolitics
- **D1 = 5** — Measurement research directly moves binding regulation (EU Act enforceable Aug 2026, SB53/RAISE) that currently lacks a measurement layer; research is the scarce input. *(problem-04, "The problem, concretely" + "Fit notes")*
- **D2 = 5** — Single/few-author precedents (Juniewicz solo Epoch estimate; Wasil 4 authors no lab; SaferAI small nonprofit); laptop-scale scoring and estimation land here. *(problem-04, "Published exemplars")*
- **D3 = 5** — Most high-leverage work is laptop + API (document scoring, Monte Carlo, benchmark mapping); ≤$500 GPU only in 2 of 6 shapes. *(problem-04, "Fit notes")*
- **D4 = 5** — Eval methodology + LLM-as-judge publication + data pipelines map exactly onto open construct-validity and scorecard work; the RAG-judge study transfers directly. *(problem-04, "Fit notes")*
- **D5 = 5** — Core workflows are LLM-assisted document coding, rubric scoring, benchmark runs, lit synthesis — precisely what Claude accelerates end-to-end. *(problem-04, "What a solo researcher could do here")*
- **D6 = 5** — Seven named, largely unclaimed gaps: statutory-disclosure scoring, GPAI Code-of-Practice benchmarking, eval construct validity, threshold-erosion modeling — most "one paper deep" or nonexistent. *(problem-04, "Where the gaps are")*
- **D7 = 4** — Fields young and agenda-stage; Ball/Grunewald became known fast, but the brief flags professionalization may be closing that window. *(problem-04, "Individuals who define threads")*
- **D8 = 5** — arXiv, COMPL-AI community contributions, taig.stanford.edu problem board, NIST/EU consultations, UK AISI grants to outsiders, active Substack discourse. *(problem-04, "How outsiders get established")*
- **D9 = 4** *(capped from 5)* — Nonprofits (GovAI, CSET, IAPS, METR, SaferAI, Epoch), hired (Ball→OSTP/OpenAI; fellowships), founder plausibility via policy tooling. *(problem-04, "Who does this work")*
- **Confidence = 4** — Deep, multi-source; two internal map docs verified against primary sources plus fresh web research. Held below 5 because several key claims (scorecards' predictive value, eval-transcript access, post-professionalization rewards) are flagged unverified.
- **Standout fact:** The field's own literature (Reuel et al., ICML 2024) says its scarcest input is people who can run measurements — the researcher's exact strength — while binding regulation is arriving with essentially no measurement layer and regulation-to-benchmark translation is only one paper deep (COMPL-AI).

#### Model architecture research (incl. small-scale architecture science)
- **D1 = 4** — Independent verification of self-reported hybrid claims (Kimi Linear, Qwen3-Next shipped no paper) and architecture-behavior mapping shift a field racing to replace attention. *(problem-08, "Where the gaps are")*
- **D2 = 5** — Documented solo track record: Keller Jordan's CIFAR paper, RWKV origin, 2-author BabyLM winner, Tyler Romero's 2×4090 worklog. *(problem-08, "Published exemplars")*
- **D3 = 5** *(reconciled up from 4)* — Profile 8 "strongly SUPPORTS": 5 of 6 shapes run on one consumer/A100 card or API for $5–70, hours-iteration, synthetic-or-open data, no human-subject/data-collection lag, no access gate; quantized single-card keeps the 80B hybrid under cap. *(resource-profiles #8; problem-08, "Fit notes")*
- **D4 = 4** — Published LLM-as-judge evals map onto claim stress-testing and architecture-behavior; frontier primitive design needs CUDA/kernel/pretraining depth not held. *(problem-08, "Fit notes")*
- **D5 = 4** — Synthetic-task harnesses, eval batteries, LLM-as-judge faithfulness pipelines are code/data-pipeline heavy, where Claude multiplies throughput. *(problem-08, study shapes 2–4)*
- **D6 = 5** — Five named unclaimed gaps: no third-party check of 2025–26 hybrids, unaudited trick-transfer, stale recall-wall cartography, KDA/GDN untested. *(problem-08, "Where the gaps are")*
- **D7 = 2** — Large canon (SSD duality, expressivity theory, kernel engineering) held by Ré/Dao/Gu/FAIR; fast-moving; years of catch-up in core architecture. *(problem-08, "Who does this work")*
- **D8 = 5** — Explicit outsider channels: modded-nanogpt PRs, Marin GitHub experiments, BabyLM shared task (EMNLP 2026), RWKV community, arXiv reproduction papers. *(problem-08, "How outsiders contribute")*
- **D9 = 4** — Nonprofit/foundation (RWKV LF, Marin), academic/grant groups, company-sponsored (Prime Intellect); startup route present but architecture productization thinner. *(problem-08, "Who does this work")*
- **Confidence = 4** — Deep single brief, densely cited to primary sources with named exemplars, funders, flagged absence claims; some gaps rest on "not found" inferences, capping below 5.
- **Standout fact:** The self-reported architecture claims of 2025–26 production hybrids are essentially unchecked — Kimi Linear's "first linear architecture to beat full attention" is lab-reported, Qwen3-Next shipped weights with no paper — while all existing independent stress-tests target 2024-era Mamba/S4, leaving inference-only claim verification (the profile's skillset) an open, in-budget niche.

#### Model-development bottlenecks (data wall, compute, RL limits)
- **D1 = 5** — Bottleneck measurements (Epoch token stock, METR horizons) anchor $100B+ capex, compute-governance thresholds, AGI timelines. *(problem-02, "What's at stake")*
- **D2 = 5** — Flagship results from 1–4-person teams via data re-extraction and curve-fitting; six solo shapes with laptop/sub-3B precedents. *(problem-02, "Published exemplars")*
- **D3 = 5** *(reconciled up from 4)* — Profile 2 "strongly RAISES": 5 of 6 flagship shapes need no GPU and run on open public data (hours-iteration); the one RLVR shape fits a single cheap card well under cap ($30–150 across runs, each cheap). No access gate. *(resource-profiles #2; problem-02, "Fit notes")*
- **D4 = 4** — Classical-ML/pipeline and LLM-as-judge strengths map onto shapes 2–5; entropy-collapse/scaling-law depth demands training-theory fluency not yet held. *(problem-02, "Fit notes")*
- **D5 = 4** — Curve re-extraction, classifier training, environment auditing, telemetry analysis are Claude-accelerable; RLVR runs and independence judgments need human oversight. *(problem-02, study shapes 1–6)*
- **D6 = 4** *(challenged down from 5)* — Several named gaps exist, but the flagship (data wall) "rests on a single unreplicated Epoch estimate," and Epoch is a ledger single-point-of-failure with a documented independence failure (T-1, C-13, U-D24). One fragile anchor ≠ many citable unclaimed gaps. *(problem-02, "Where the gaps are")*
- **D7 = 4** — Field young, tiny, lab-dominated with few incumbents; solo analysts already shape debates; fast-moving RL/scaling canon needs sustained catch-up. *(problem-02, "Who does this work")*
- **D8 = 5** *(calibrated up from 4)* — Open venues: TMLR, NeurIPS D&B, ICLR, arXiv/X speedruns, Environments Hub; D8 measures outsider venue access, which is strong. *(problem-02, "Fit notes" + "How outsiders contribute")*
- **D9 = 4** *(capped from 5)* — Epoch/METR nonprofit lane, Prime Intellect/Mechanize startup lane, active academic publishing lane. *(problem-02, "Fit notes")*
- **Confidence = 4** — Deep, ~30 cited links (Epoch/METR/arXiv/Nature), dated exemplars, explicit gaps; several claims flagged unverified (Whitfill affiliations, prolonged-RL counter-evidence).
- **Standout fact:** The entire data wall rests on a single unreplicated Epoch estimate (~300T tokens, exhausted ~2028), and RL-scaling has exactly one systematic study (Meta's 400k-GPU-hour ScaleRL) with no independent counterpart — yet the field's flagship audits were produced by 1–4 people with only a laptop. *(The single-anchor fragility is exactly why D6 was corrected to 4.)*

#### Social impact: disempowerment & cognitive change
- **D1 = 5** — Documented deskilling, ~250 harm claims incl. 15 suicides; measurement/causality gaps are exactly research-shaped. *(problem-06, "The problem, concretely")*
- **D2 = 4** — Solo/small-team exemplars (Gerlich single-author; HAB 4 authors); binding constraint is IRB only for recruited-participant designs. *(problem-06, "Published exemplars")*
- **D3 = 4** — Cheapest entries (chat-log coding, benchmark extension) are API-budget, IRB-free; Prolific/commercial-IRB studies push toward/past $500 with unverified fees. *(problem-06, "What a solo researcher could do here")*
- **D4 = 5** — Field's respected artifacts are eval-methodology products; LLM-as-judge and pipeline skills transfer directly to chat-corpus coding and benchmark construction. *(problem-06, "Fit notes")*
- **D5 = 5** — Core workflows (LLM-as-judge coding of 1M+ logs, benchmark generation, sycophancy audits) are exactly what extensive Claude use multiplies. *(problem-06, "What a solo researcher could do here")*
- **D6 = 5** — Many named unclaimed gaps: no validated reliance instrument, no longitudinal skill-decay RCT, no deskilling study outside medicine, replication debt. *(problem-06, "Where the gaps are")*
- **D7 = 4** — Young, pre-paradigmatic sub-areas, small canon, open replication niches; fast-moving and crowded with elite labs. *(problem-06, "The research field around it")*
- **D8 = 5** — CHI/CSCW/FAccT, ICML position track (both cited papers landed), arXiv/LessWrong, plus Cosmos grants and Human Line Project on-ramps. *(problem-06, "Funding models & outsider on-ramps")*
- **D9 = 4** *(capped from 5)* — Cosmos/Human Line/AI Objectives (nonprofit), MIT AHA + Anthropic/OpenAI (hired), fundable prototype grants. *(problem-06, "Funding models & outsider on-ramps")*
- **Confidence = 4** — Deep, multi-source (July 2026) with dozens of primary citations, maturity table, named gaps; some claims flagged unverified/abstract-read, IRB costs unverified.
- **Standout fact:** The field's most respected artifacts (meta-analyses, validated instruments, replications, benchmarks) are evaluation-methodology products — the profile's demonstrated strength — and the two cheapest entries (LLM-as-judge coding of public chat corpora; agency/sycophancy benchmark extension) are API-budget and IRB-free.

#### Social impact: labor & economics
- **D1 = 5** — Trillion-dollar retraining/education/regulation decisions rest on contradictory evidence; better measurement disciplines the debate. *(problem-05, "The problem, concretely")*
- **D2 = 5** — Marquee results by 2–3-person teams; Noy-Zhang (2 grad students) in Science; open datasets solo-workable. *(problem-05, "Published exemplars")*
- **D3 = 5** — Open tabular data (Anthropic HF, Canaries ZIPs, GDPval gold, O*NET/BLS/EIG) is $0; shapes need only frontier-API and laptop compute. *(problem-05, "Fit notes")*
- **D4 = 4** *(challenged down from 5)* — Skills fit is real, but the flagship shape (Anthropic Economic Index classifier audit) has an unaudited conversation→O*NET classifier (ledger U-D14), a CoI of auditing Anthropic with Anthropic tools/grants (CH-8), and open telemetry access (U-D14 "oligopoly"). *(problem-05, "What a solo researcher could do here")*
- **D5 = 4** — LLM-as-judge audits, conversation-to-O*NET classification, and NBER lit review are heavily Claude-accelerable; core econometrics still needs human judgment. *(problem-05, "What a solo researcher could do here")*
- **D6 = 5** — Seven named, source-grounded, unclaimed gaps: Canaries-Denmark reconciliation, exposure-vs-outcome validation, non-freelance wage effects, micro-to-macro, telemetry oligopoly, Global South. *(problem-05, "Where the gaps are")*
- **D7 = 3** — Realized-outcome subfield is young (2024–2026) but incumbents are elite econ groups (MIT, Stanford, Chicago) with a large NBER canon; a focused niche is credible, broad SME hard. *(problem-05, "Who does this work")*
- **D8 = 4** — Open venues (NBER WP, arXiv, GitHub replication) plus Anthropic Economic Futures ($10k–50k + $5k credits) explicitly open to external researchers; top venues (Science/QJE) selective. *(problem-05, "How outsiders contribute")*
- **D9 = 4** *(capped from 5)* — Nonprofit (METR ran the dev RCT), hired (lab economics teams), grant/founder-adjacent (Economic Futures awards, EIG). *(problem-05, "Who does this work")*
- **Confidence = 3** *(challenged down from 4)* — Sits atop a stack of OPEN ledger items: D-13 (Canaries–Denmark contradiction), U-D14 (classifier unaudited), T-problem-05 (micro-macro absence *inferred not surveyed*), C-16 (Humlum sample conflict), U-A4 (unverified $200M-fund eligibility). The standoutFact's headline is itself an unresolved conflict.
- **Standout fact:** The field's headline results directly contradict each other (Stanford Canaries: ~16% entry-level employment decline; Danish registry data: precise nulls) and no published reconciliation exists — a high-impact solo-tractable gap on open data matching pipeline and LLM-as-judge strengths, with a named funding channel (Anthropic Economic Futures). *(That contradiction is an OPEN ledger conflict, D-13 — hence Confidence 3.)*

#### Wealth inequality (mechanisms & measurement)
- **D1 = 4** — Trillion-dollar distributional stakes and a genuine research-shaped measurement hole; but AI's marginal contribution is unattributable with no counterfactual, so research moves the debate less cleanly. *(problem-12, "How much do we actually know" + "What we still don't know")*
- **D2 = 5** — Every headline study shape (decoupling dashboard, pay-incidence meta-analysis, classifier audit) is solo public-data pipeline work; canonical analogs are 1–4 author. *(problem-12, "What a solo researcher could do here" #1–6)*
- **D3 = 5** — Open tabular data (Anthropic HF, FRED/DFA, BEA/BLS, Compustat, O*NET), $0–45 API, laptop-only, minutes–hours iteration; the RCT that bust the labor cap has no equivalent here. *(resource-profiles #5 labor analog; problem-12 "Fit notes")*
- **D4 = 5** — Data-pipeline/XGBoost + published LLM-as-judge work map exactly onto the tabular merges and the classifier-audit opening (#3) that underpins the whole distributional literature. *(problem-12, "Fit notes" + shape #3)*
- **D5 = 4** — Log/classifier/meta-analysis and judge-audit workflows are Claude-accelerable end to end; core econometric attribution judgments still need human oversight. *(problem-12, shapes #2–5 + "Fit notes")*
- **D6 = 5** — Many named, sourced, genuinely unfilled gaps: the usage-vs-ownership decoupling dashboard and pay-incidence meta-analysis appear in no opened source; thin on wealth/measurement axis. *(problem-12, "Why inequality is a lens" + "Fit notes")*
- **D7 = 3** — Wealth/measurement niche is thin and enterable, but the surrounding canon is elite econ (NBER/QJE/Econometrica); broad SME hard, a focused measurement niche credible. *(problem-12, mechanisms table sources (Acemoglu-Restrepo, Autor QJE); cross-ref problem-05 D7=3)*
- **D8 = 4** — Open venues (NBER WP, arXiv, FAccT) plus named Anthropic Economic Futures channel ($10k–50k); but top econ venues (Science/QJE) selective and vendor-shaped funding. *(problem-12, "Fit notes" + "What limits the research")*
- **D9 = 4** *(program-cap)* — Nonprofit (WID/AI Now-style), hired (lab economics teams), grant/founder-adjacent (Economic Futures); capped at 4 program-wide per challenge #15. *(problem-12, "Policy channels"; index challenge log #15)*
- **Confidence = 3** — Deep single brief, densely sourced and evidence-graded, but the headline claims are THEORIZED-UNMEASURED (no dataset joins usage- and ownership-inequality; no AI-attribution counterfactual), FRED/DFA blocks automated fetch, and several sources are ⚠️-flagged.
- **Standout fact:** The two best-measured channels point in opposite directions — within-US Claude usage inequality is falling (top-5 states 30%→24%) while the top 1% hold ~50% of US equities and rising — yet no published dataset joins the two curves, making the field's central question a measurement problem the researcher's public-data pipeline + LLM-as-judge stack can attack at $0–45, before it is an economic one. *(The equalizing forces A6/P4 are measured only in productivity or a pilot, never in realized pay — the honest asymmetry, and why Confidence is 3.)*

### Fields & wildcards

#### Evaluation & benchmarking science
- **D1 = 5** — Regulators (EU AI Act, CAISI, NIST) now depend on eval methods that barely exist; a solo statistics paper (Miller error bars) shifted field norms. *(eval-04, "The standards & regulatory layer")*
- **D2 = 5** — Canon dominated by 1–4-person and solo works (Miller solo, Vending-Bench 2, metabench small team); meta-eval runs on public data. *(eval-03, "Recurring success factors" #3)*
- **D3 = 5** *(reconciled up from 4)* — Profile 12 "STRONGLY RAISES": high-fit B-layer work is $0–70, hours-iteration, open-abundant data, barely supply-exposed; the $40k figure was HAL's full budget and the only busters (human RCTs, private benchmarks) are avoidable edges. *(resource-profiles #12; eval-01, "What we still don't know")*
- **D4 = 5** — Published LLM-as-judge/RAG-hallucination work sits squarely in judge meta-evaluation; stats fluency maps to the field's top unmet need (missing significance reporting). *(eval-02, "Fit notes" + sub-area 4)*
- **D5 = 4** — Workflow is data analysis, re-analysis of public rollouts, judge/API calls, lit synthesis, checklist building — heavily Claude-accelerable; no training loop. *(eval-04, "Fit notes")*
- **D6 = 4** *(challenged down from 5)* — The scorer's own brief documents a *gold rush*, not whitespace: EvalEval's 48-author flagship, 445-benchmark/29-reviewer Oxford review, renamed NeurIPS track, ≥8 named benchmark audits (ledger CH-2). Residual gaps are unfunded-maintenance, not unclaimed-research. *(eval-06, "Where the gaps are")*
- **D7 = 4** — Young, fast-institutionalizing B-layer (NeurIPS track renamed 2026); solo exemplars became reference points fast; prolific incumbents (Hendrycks, Kapoor) and unknown survivorship base-rate cap it. *(eval-05, "Survivorship-bias caveats")*
- **D8 = 5** — Lowest-friction on-ramps in AI: EvalEval shared task grants co-authorship, CONDA/Inspect Evals accept PRs, NeurIPS Evaluations track, active open discourse. *(eval-01, "Open contribution on-ramps")*
- **D9 = 4** *(capped from 5)* — Nonprofits (METR, Epoch, Apollo), hired (AISI, Anthropic eval roles), startups (LMArena $1.7B, Braintrust, Andon Labs). *(eval-05, "Fit notes")*
- **Confidence = 4** *(challenged down from 5)* — Six deep briefs, but the ledger riddles them with OPEN conflicts (C-1 Apollo 76pt vs 5pp, C-4 CAISI secondary-press-only, C-5 Epoch funding, C-15 SWE-bench retirement) and thin sourcing (T-eval-03/04/05 affiliations "from memory," Grokipedia). A row with this many unresolved contradictions cannot be the single most-confident row.
- **Standout fact:** A single-author statistics paper (Miller, "Adding Error Bars to Evals") became a field-reference cited across every brief — direct proof that one methodologically-sharp, low-budget person can shift eval norms. *(But the field is industrializing fast — see D6/Confidence corrections.)*

#### Human-AI interaction field studies
- **D1 = 5** — Directly studies AI's real effects on humans (deskilling, learning harm, companion mental-health, productivity); results shift field and policy. *(sweep-04, "The shape of this space")*
- **D2 = 3** *(challenged down from 4)* — Two-person top-venue exemplars exist, but the binding constraint the brief itself names is an access gate: "unaffiliated researchers have no home IRB," commercial IRB "$1–3k... exceeds the study budget before one participant is paid" (ledger U-E2, A-1) — an anchor-1–2 "needs insider access" signal. *(sweep-04, "Solo-method reality check")*
- **D3 = 3** — $500 covers ~100–150 Prolific participants (pilot/tight replication only), plus unstated commercial-IRB fees. Log analysis is cheaper. *(sweep-04, "Solo-method reality check")*
- **D4 = 4** — Eval/LLM-as-judge/RAG work maps onto the benchmark-vs-human-transfer gap (Bean, Goh); pipeline skills fit WildChat/Clio log analysis; human-subjects RCT design is newer. *(sweep-04, "Fit notes")*
- **D5 = 4** — Claude accelerates survey-instrument design, Clio-style log classification, lit synthesis, analysis; human-subject collection and IRB steps are not automatable. *(sweep-04, "Fit notes")*
- **D6 = 5** — Many named unclaimed gaps: ecological validity, perception-vs-reality, micro-macro reconciliation, longitudinal deskilling outside medicine, benchmark-to-human transfer. *(sweep-04, "Where the gaps are")*
- **D7 = 3** — Fast-moving 2024–2026 field, small teams, no giant canon, but spans HCI/econ/psych/medicine; a focused year yields depth in one sub-area, not the whole space. *(sweep-04, "Who does this work")*
- **D8 = 4** — Open venues (CHI/CSCW/IUI/FAccT/AIES/arXiv/NBER) plus two named grant channels (Anthropic Economic Futures $10k–50k, MSR AICE); active discourse. *(sweep-04, "Who does this work")*
- **D9 = 4** *(capped from 5)* — Labs hire (Anthropic Societal Impacts, MSR, OpenAI), nonprofits (METR, Epoch, Common Sense), grant-funded independent work; product angle in study-design tooling. *(sweep-04, "Who does this work")*
- **Confidence = 4** — Deep, multi-source brief with named sources per sub-area, exemplars with team sizes, enumerated gaps; docked for flagged unverified items (IRB cost, grant eligibility, team sizes).
- **Standout fact:** Bean et al. (Oxford, 1,298 participants): LLMs alone scored 94.9% on condition ID, but humans using those LLMs did no better than controls — benchmark scores do not survive contact with real users, making this an evaluation-methodology problem run with human subjects.

#### Model behavior science / behavioral fingerprinting
- **D1 = 4** — Black-box behavioral drift/sycophancy early-warning is a real safety gap; the GPT-4o rollback shows external observatories could catch harms labs miss. *(sweep-01, "Where the gaps are" #1)*
- **D2 = 5** — Multiple solo exemplars: Wiese (1-author PLOS One observatory), SpeechMap (1 dev), Spiral-Bench (1 dev); solo, part-time, API-only studies land. *(sweep-01, "Published exemplars")*
- **D3 = 5** *(reconciled up from 4)* — Profile 13 "strongly RAISES" now prices the previously-untested envelope (U-E1): flagship observatory $30–80, budget-buster risk ~nil, ~80% api-only, unattended calendar-paced iteration fits ≤15 hrs/wk; deprecation/judge-validity are scientific not resource gates. *(resource-profiles #13; sweep-01, "Fit notes")*
- **D4 = 5** — Best exemplar (Wiese) is a superset of the published LLM-as-judge work: fixed prompts, bias-calibrated Bradley-Terry judge, change-point stats. *(sweep-01, "Fit notes")*
- **D5 = 5** — Workflow is prompting, labeling, LLM-as-judge, classification, drift detection — Claude accelerates nearly all; the field's core primitive is automated behavioral elicitation. *(sweep-01, "Fit notes")*
- **D6 = 5** — Eight named, largely unclaimed gaps: no sustained public observatory, psychometric validity crisis, benchmark fragility, black-box diffing, judge-validity. *(sweep-01, "Where the gaps are")*
- **D7 = 4** — Young, unconsolidated field, no dominant canon; named individuals became known via single artifacts; a focused year could establish a name. *(sweep-01, intro)*
- **D8 = 5** — Open venues (PLOS One, ACL, ICLR, Nature, HDSR) accepted behavior work; low-friction on-ramps (Apart hackathons, BlueDot sprints, MATS, Fellows). *(sweep-01, "Pipelines/funders")*
- **D9 = 4** *(capped from 5)* — Nonprofits (Transluce, Apart, Truthful AI), lab hires (Anthropic Societal Impacts/Fellows, OpenAI), productizable observatory/audit tooling. *(sweep-01, "Who does this work")*
- **Confidence = 4** — Single sweep brief but unusually deep (~40 primary links, named gaps, exemplars with team sizes, honest ledger); some affiliations/cost/legal points unresolved. **Flag:** the "sub-$500 observatory" feasibility understates a subject-death risk — ledger A-9 (longitudinal subjects "keep dying," 6–12-mo lifecycles) and U-D22 (no documented pre-deprecation capture channel).
- **Standout fact:** The single best solo exemplar (Wiese, PLOS One 2026) is a methodological superset of the researcher's own published LLM-as-judge work — preregistered, fixed prompt bank, bias-calibrated Bradley-Terry judge, change-point detection, pure API spend — proving a solo behavioral observatory is publishable in exactly his lane. *(Feasibility carries an unpriced subject-death risk; see Confidence flag.)*

#### Reproduction, replication & meta-science
- **D1 = 5** — Re-analysis directly overturns billion-dollar-guiding numbers (Chinchilla scaling, bar-exam claim) and shifts field norms; research itself is the lever. *(sweep-05, "Published exemplars")*
- **D2 = 5** — Unit of work is one claim/paper; multiple solo landings (Martínez, Schutte) and <$30 reproductions; "purest solo template." *(sweep-05, "The shape of this space")*
- **D3 = 5** *(challenged 5→4, then reconciled back to 5)* — The challenge docked it because open-model replications were unpriced (ledger A-3 partition, U-E1); Profile 15 (most resource-favorable domain in sweep, lowest supply exposure) now prices that exact tier: open-model replications are $4–30 toy / $28–66 QLoRA-70B, all under cap, only full-scale pretraining busts (avoidable by scope). *(resource-profiles #15; sweep-05, "Fit notes")*
- **D4 = 5** — Published LLM-as-judge/RAG study is on-topic for benchmark auditing; leakage/meta-analysis are XGBoost/pandas problems; LLM tuning covers open-model replications. *(sweep-05, "Fit notes")*
- **D5 = 5** *(calibrated up from 4)* — Brief explicitly names "Claude-as-force-multiplier"; the entire workflow (lit-review, meta-analysis, data forensics, drafting) is code/data/text. *(sweep-05, "Fit notes")*
- **D6 = 5** — Seven named, largely-unclaimed gaps: no refutations venue, under-audited efficiency claims, contamination-without-access, living reviews, COI infrastructure. *(sweep-05, "Where the gaps are")*
- **D7 = 4** — Small canon, fast field, few incumbents; individuals (Gwern, Schutte, Martínez) became known names solo. *(sweep-05, "Notable individuals")*
- **D8 = 4** *(challenged down from 5)* — MLRC becomes a NeurIPS track 2026 and ReScience C takes volunteers, but ledger U-E5 flags whether MLRC-as-track accepts solo/unaffiliated reproducers as OPEN. *(sweep-05, "Who does this work")*
- **D9 = 4** *(challenged down from 5; also program-cap)* — Nonprofits (Epoch, METR, EleutherAI), companies (Artificial Analysis), independents; but ledger U-A9 (evidence-*negative*: "does any grantmaker fund individual reproduction at <$50k? LTFF signal negative") and CH-6 attack the funding thesis. *(sweep-05, "Who does this work")*
- **Confidence = 4** — Single sweep brief, dense and multi-source (dozens of opened primary links, named exemplars, explicit ledger); funding/recognition-path gaps flagged unverified cap it below 5.
- **Standout fact:** The scarce input in this field is credibility and rigor, not compute — the highest-impact results (Martínez re-derived GPT-4's bar-exam claim from 90th to ~48th percentile; Schutte solo-overturned gzip-beats-BERT via a tie-breaking bug) used public-data re-analysis with no GPUs.

#### Small/open-model science
- **D1 = 4** — Harm-relevant behavioral gaps (safety under quantization, non-English degradation, distillation loss) where research, not capital, moves the needle. *(sweep-07, "Where the gaps are" #1,#2,#5)*
- **D2 = 5** — Verified solo/≤4-author publications (TRM solo; Wang position paper; MSR flips 4 authors; localbench indie); controlled variant comparisons are inherently solo-scoped. *(sweep-07, "Published exemplars")*
- **D3 = 5** — Tooling (Pythia, QLoRA/bitsandbytes, GGUF, FSDP+QLoRA) runs on 1–2 consumer GPUs; TRM reportedly under $500. *(sweep-07, "Fit notes")*
- **D4 = 5** — Core activity is controlled behavioral evals + divergence statistics (KL, flips, refusal rates) — exactly the LLM-as-judge/eval-methodology + pipeline profile. *(sweep-07, "Fit notes")*
- **D5 = 4** — Eval-battery building, checkpoint pipelines, labeling, statistics, lit review all Claude-accelerable; some GPU/inference runtime work is not. *(sweep-07, "day-to-day work")*
- **D6 = 5** — Eight named gaps grounded in limitation sections/position papers; several flagged as missing infrastructure or inconclusive by cited authors. *(sweep-07, "Where the gaps are")*
- **D7 = 4** — Young, fast-moving subfields (model diffing, PTQ-safety), few incumbents; a focused year could establish name recognition. *(sweep-07, "Who does this work")*
- **D8 = 5** — Open on-ramps not requiring employment: EleutherAI Discord/flat structure, Cohere Labs Open Science grants, Marin GitHub preregistration. *(sweep-07, "Organizations table")*
- **D9 = 4** *(capped from 5)* — Nonprofit (EleutherAI), hired (HF Smol, Answer.AI, labs), startup (Nous, Unsloth, Answer.AI). *(sweep-07, "Organizations table")*
- **Confidence = 4** — Multi-source brief with named papers, orgs, funding, gaps grounded in limitation sections; several load-bearing facts flagged unverified (localbench authorship, TRM cost, team sizes, on-device gap inferred).
- **Standout fact:** The r/LocalLLaMA study and localbench both name "no standardized quantization-behavior benchmark" as missing infrastructure keeping the community in "remedial maintenance" — a harm-relevant eval-methodology gap on the profile's specialty, within the ≤$500/1–4 GPU envelope.

#### The data science of AI (curation, forensics, contamination, provenance)
- **D1 = 4** — Provenance/consent collapse and contamination shape what all models learn; audits already feed policy discourse. *(sweep-02, "Where the gaps are")*
- **D2 = 5** — Landmark results routinely from 2-person, no-GPU teams (Magikarp, BookCorpus datasheet); solo forensics is the archetype. *(sweep-02, "Published exemplars")*
- **D3 = 4** — Forensics/documentation/provenance/tokenizer work is CPU/storage/inference-bound; only full-corpus builds and large ablations exceed $500. *(sweep-02, "Fit notes")*
- **D4 = 5** — Brief maps the stack (classifiers, statistical testing, LLM-as-judge/detector-validation) onto highest-leverage components; FineWeb-Edu is a classifier play. *(sweep-02, "Fit notes")*
- **D5 = 4** — Workflows are code, data pipelines, classifier training, statistical analysis, lit-heavy auditing — all high-Claude-leverage; no named blockers. *(sweep-02, "Fit notes")*
- **D6 = 5** — Eight named, sourced, largely unclaimed gaps: broken license metadata, consent propagation, evasion-resistant contamination, detector-validated synthetic-share, tokenizer fixes. *(sweep-02, "Where the gaps are")*
- **D7 = 4** — Small canons, nascent venues (CONDA since 2024, TokShop July 2025); tiny incumbent counts (CONDA: 23 contributors) make a focused year to visibility plausible. *(sweep-02, "Tokenizer effects")*
- **D8 = 5** — Confirmed outsider on-ramps: EleutherAI Discord, DPI volunteer email, MLCommons WGs, open DCLM competition, CONDA shared tasks. *(sweep-02, "Who does this work")*
- **D9 = 4** *(capped from 5)* — Nonprofits (EleutherAI, Ai2, DPI, MLCommons), hires (HF, Ai2), startups (Pleias, Spawning, DatologyAI $57.5M). *(sweep-02, "Who does this work")*
- **Confidence = 4** — Deep single brief, densely multi-sourced (dozens of opened links, exemplars, orgs, named gaps) with honest flags; not verified across independent briefs.
- **Standout fact:** Landmark contributions here routinely come from 2–8 person teams with little/no GPU budget (Magikarp: 2 authors; BookCorpus datasheet: 2 grad students), and the researcher's exact stack — classifiers, statistical contamination testing, LLM-as-judge/detector-validation — maps onto the highest-leverage, sub-$500 components.

#### Vertical evaluation & third-party audit (medicine, law, finance, edu, gov)
- **D1 = 5** — Deployed high-stakes systems affecting millions; independent audits demonstrably shifted vendors (Epic overhaul, HireVue scrutiny). *(sweep-06, "Published exemplars")*
- **D2 = 5** — 2–6-author papers in Science/JAMA/FAT*, and AIAAIC is a one-founder repository that became OECD-cited infrastructure. *(sweep-06, "Fit notes")*
- **D3 = 4** *(the calibration benchmark)* — Exemplars used public docs/FOI + classical ML stats + frontier APIs, no training runs, but data access is the binding constraint; FOI can cost months (Suspicion Machines 6-month negotiation, gap #5). One of the few rows that honestly priced an access barrier into the score. *(sweep-06, "Fit notes" + gap #5)*
- **D4 = 5** — Sits exactly on published expertise: RegLab legal-RAG hallucination audit and MedHELM LLM-jury are direct analogs of the LLM-as-judge/RAG-hallucination study. *(sweep-06, "Fit notes")*
- **D5 = 4** — LLM-as-judge ensembles are core method (MedHELM three-judge jury beat clinician agreement); some work is manual FOI/access. *(sweep-06, "The shape of this space" #1)*
- **D6 = 5** — Nine named, sourced, unclaimed gaps: no audit standards, mandate non-enforcement, adoption dynamics, insurance-testing wedge, education/government thinness. *(sweep-06, "Where the gaps are")*
- **D7 = 4** — Small canon, fast-moving, few incumbents (frontier-audit capacity ~few hundred FTEs); a focused year on a thin vertical (edu/gov/insurance) could make one known. *(sweep-06, gap #9)*
- **D8 = 5** — Open venues (FAccT, NeurIPS D&B, SaTML, JAMA/Science), open contributor models (LegalBench 40 contributors, AIID submissions); no affiliation required. *(sweep-06, "Fit notes")*
- **D9 = 4** *(capped from 5)* — Nonprofits (AIID, Eticas, Ada Lovelace), firms/startups (BABL, Holistic AI, Patronus, ORCAA), hired academic/industry roles. *(sweep-06, "Who does this work")*
- **Confidence = 4** — Deep multi-source brief: many primary papers, named institutions, sourced gaps; capped by flagged unverified items and open ledger questions on funding/legal exposure/adoption.
- **Standout fact:** Independent solo/small-team audits here have repeatedly moved deployed systems affecting millions — Obermeyer's 4-author Science paper on a care algorithm, the 6-author RegLab audit falsifying "hallucination-free" legal-tool marketing (Lexis+ 17%, Westlaw 33%), the Epic Sepsis validation — all built with the researcher's stack (public/FOI data + classical ML stats + frontier APIs, no training runs).

#### Wildcard: Agent market ecology (multi-agent collusion, price wars, machine economics)
- **D1 = 4** — Algorithmic collusion is a live regulatory concern (Fish et al. at AEA, antitrust-relevant); empirical detection/mitigation can shift policy. *(sweep-08, Niche 5)*
- **D2 = 5** — Fish et al. (3 authors) and Andon Labs (~2 people) prove solo/tiny-team studies land; no lab or insider access required. *(sweep-08, "Published exemplars" #1, #6)*
- **D3 = 5** — Fish et al. ran on granted API credits, "near-zero-hardware-budget"; agent-market simulation needs no training compute, only APIs. *(sweep-08, Niche 5)*
- **D4 = 4** — Fit notes list agent markets as executable with the profile's stack (API measurement batteries, classical stats); slight gap in game-theory/economics framing. *(sweep-08, "Fit notes")*
- **D5 = 4** — Workflow is agent orchestration, prompt-variation experiments, price logging, statistical analysis — nearly all Claude-accelerable; Claude itself is a study subject. *(sweep-08, Niche 5)*
- **D6 = 4** — Named unclaimed gaps: multi-agent market dynamics, collusion detection/mitigation, multi-model heterogeneous markets, welfare effects; "few follow-ups" on Fish et al. *(sweep-08, "Where the gaps are")*
- **D7 = 4** — Incumbency ~2 labs + 1 tiny startup; small canon, no established multi-agent-market authority; a focused year could make one known. *(sweep-08, niche table)*
- **D8 = 4** — Fish et al. reached AEA and ML/agent venues host this; Andon→Anthropic shows collaboration paths; brief details venues lightly. *(sweep-08, "Published exemplars")*
- **D9 = 4** — Nonprofit (regulator-facing eval), hired (labs/Andon-style startups), founder (Andon Labs exists). *(sweep-08, "Who does this work")*
- **Confidence = 3** — Single wildcard brief, well-sourced with verified exemplars (Fish et al., Vending-Bench, Project Vend) and a specific named gap; some org sizes/funding flagged unverified.
- **Standout fact:** Fish, Gonczarowski & Shorrer's algorithmic-collusion study — 3 authors, funded entirely by granted API credits, presented at AEA, regulator-relevant — is a proven zero-GPU template, yet its collusion-detection/mitigation and multi-agent findings have "few follow-ups."

#### Wildcard: Energy/water measurement of closed API models
- **D1 = 4** — High-salience public problem; independent audits of closed-model claims could shift discourse where only marketing numbers exist. *(sweep-08, Niche 8)*
- **D2 = 4** — Jegham et al. did it with 5 authors from public API data + statistical inference; re-analysis/audit is solo-scale. *(sweep-08, "Published exemplars" #7)*
- **D3 = 4** — Runs on re-analysis of public API data plus API calls; no $10k compute; agentic-workload measurement adds modest token spend. *(sweep-08, "Fit notes")*
- **D4 = 4** — Statistical inference on public data, sensitivity analysis, calibration math match eval-methodology strengths; some hardware-modeling depth needed. *(sweep-08, "Fit notes")*
- **D5 = 4** — Claude accelerates scraping API specs, building measurement batteries, sensitivity code, drafting — strong multiplier on a data-analysis pipeline. *(sweep-08, "The shape of this space")*
- **D6 = 5** — Multiple named unclaimed gaps: no replication/sensitivity audit of inference chains, no error-bar audit (0.42 vs 0.34 Wh), agentic-workload energy unmeasured entirely. *(sweep-08, "Where the gaps are")*
- **D7 = 3** *(challenge REVERTED the calibrator's 3→4 upgrade)* — Niche is nearly empty, but ledger CH-10 names closed-model energy as a case that "confuses empty with low-value/infeasible" — one validation anchor makes new estimates unvalidatable by construction. Emptiness driven by infeasibility should not *raise* attainability of a *credible* result. *(sweep-08, Niche 8)*
- **D8 = 3** — Active energy-measurement community (HF leaderboard, ML.ENERGY, arXiv), but no specific outsider-friendly venue for closed-model audit work. *(sweep-08, "Who does this work")*
- **D9 = 3** — Nonprofit/hired routes plausible (Epoch, HF, ML.ENERGY hire); startup route less evident; no closed-model-audit company shown. *(sweep-08, "Who does this work")*
- **Confidence = 3** — Single sweep brief; Niche 8 is specific with named papers and primary-source claims (Jegham arXiv, Altman critique), but several key figures flagged unverified; no cross-source depth.
- **Standout fact:** The entire closed-model side rests on one 5-author paper (Jegham et al.) that explicitly infers hardware configs statistically, with Altman's competing 0.34 Wh figure having no methodology — and no independent replication, sensitivity analysis, or error-bar audit exists, while agentic-workload energy is unmeasured entirely. *(That same single-anchor structure is why D7 reverted to 3 — empty here means unvalidatable, not open.)*

#### Wildcard: Model welfare empirics
- **D1 = 3** — Nascent field labs now practice (Anthropic exit-interviews in production); high uncertainty on real-world severity, but research shapes an emerging ethical frontier. *(sweep-08, Niche 7)*
- **D2 = 4** — Flagship exemplar Kaiser & Enderby is a 2-author study; Eleos core is ~4–6; empirical population ~a dozen — solo work lands. *(sweep-08, "Published exemplars" #8)*
- **D3 = 4** — Question-battery + activation classifiers ran across 0.6B–70B open models plus API calls; fits ≤$500 small-GPU/API budget. *(sweep-08, Niche 7)*
- **D4 = 3** — Eval-battery design + classification fits, but activation-probe interpretability and the consciousness/philosophy framing sit outside published LLM-judge expertise. *(sweep-08, "Fit notes")*
- **D5 = 4** — Workflow is battery authoring, running probes, statistics on outputs — code/labeling/analysis Claude accelerates directly. *(sweep-08, "The shape of this space")*
- **D6 = 4** — Incumbents themselves (Eleos) name standardized welfare evaluations and company-independent research as unfilled priorities; empirical methods scarcely populated. *(sweep-08, "Where the gaps are")*
- **D7 = 4** — Field went taboo-to-funded in 2025; canon tiny, empirical population ~a dozen — a focused year could make one a known name. *(sweep-08, Niche 7)*
- **D8 = 3** — Eleos and NYU CMEP publish collaboration-heavy reports with external academics; discourse small and partly philosophy-adjacent, not clearly outsider-open workshops. *(sweep-08, "Who does this work")*
- **D9 = 4** — Nonprofit (Eleos), academic (NYU CMEP), frontier-lab practice (Anthropic welfare in production); startup route least evidenced. *(sweep-08, Niche 7)*
- **Confidence = 3** — Single sweep brief, multi-source within it (Eleos priorities, Kaiser & Enderby, Anthropic practice) with explicit flags on headcounts; enough to ground scores, not deeply verified.
- **Standout fact:** The incumbents themselves (Eleos) name standardized welfare evaluations and company-independent research as unfilled priorities, and the flagship exemplar (Kaiser & Enderby, 2 authors) already falsified a prior claim using API/small-GPU activation classifiers.

---

## Calibration & challenge log

Two passes ran after the domain scorers: a single **cross-row calibrator** (normalizing so a
"4" means the same everywhere), then an **adversarial challenge** pass against the
[knowledge-gaps ledger](03-knowledge-gaps-and-assumptions-ledger.md). Disagreements are
recorded, not averaged away.

### Calibrator changeLog (cross-row normalization)

1. **Model architecture research · D2 · 4→5** — Justification cites genuinely solo exemplars (Keller Jordan solo CIFAR, RWKV solo-led, Romero solo worklog — verified in brief); no solo-specific constraint stated, so it matches rows scored 5 on identical evidence. Frontier-team caveat already captured in D4/D7.
2. **Model-development bottlenecks · D8 · 4→5** — Original 4 reason ("not maximal insider-lab access to proprietary training data") is off-anchor: D8 measures *outsider venue access*, which is strong (arXiv/X speedruns, Environments Hub, Epoch dashboards, TMLR/NeurIPS D&B). Matches supply-chain D8=5 on the same open-venue set.
3. **Reproduction, replication & meta-science · D5 · 4→5** — Original 4 reason ("brief does not name Claude") is factually wrong — the brief explicitly says "Claude-as-force-multiplier" — and the workflow (meta-analysis, leakage detection, re-analysis, drafting) is entirely code/data/text, as automatable as identically-workflowed rows scored 5.
4. **Wildcard: Energy/water measurement of closed API models · D7 · 3→4** — Upgraded because the closed-model niche is "nearly empty" (2–3 groups), emptier than the broad footprint field (D7=4); incumbents hold the *broad* energy canon, not this niche. *(Note: this upgrade was later reverted by challenge #11 below.)*

### Adversarial challenge resolutions

1. **Eval & benchmarking · D6 · 5→4 — APPLIED.** eval-06 documents a gold rush (EvalEval 48-author flagship, 445-benchmark Oxford review, renamed NeurIPS track, ≥8 named audits); ledger CH-2 self-refutes "nobody re-audits benchmarks." Residual gaps are unfunded-maintenance, not unclaimed-research.
2. **Eval & benchmarking · Confidence · 5→4 — APPLIED.** The only row scored Conf 5 rests on six briefs the ledger riddles with OPEN conflicts (C-1, C-4, C-5, C-15) and thin sourcing (T-eval-03/04/05, Grokipedia). Cannot be the single most-confident row.
3. **Model-development bottlenecks · D6 · 5→4 — APPLIED.** The data wall "rests on a single unreplicated Epoch estimate"; Epoch is a ledger single-point-of-failure (T-1) with a documented independence failure (C-13, U-D24). One fragile anchor ≠ many citable unclaimed gaps.
4. **Agent security & auth · D6 · 5→3 — APPLIED.** The 5 and its standoutFact hang on arXiv:2605.16282, flagged in ledger C-11 / T-problem-09 as read-as-anchor in problem-09 but *unopened* in sweep-03. Corrected to 3 until C-11 resolves.
5. **Human-AI interaction · D2 · 4→3 — APPLIED.** The brief's own binding constraint (no home IRB; commercial IRB $1–3k exceeds the study budget before one participant is paid; U-E2, A-1) is an anchor-1–2 access signal. D3=3 already honest; the real problem was D2.
6. **Labor & economics · D4 · 5→4 — APPLIED.** The flagship shape (Anthropic Economic Index classifier audit) has an unaudited classifier (U-D14), a CoI of auditing Anthropic with Anthropic tools/grants (CH-8), and open telemetry access (U-D14 "oligopoly"). Skills fit real; data-access + independence unresolved.
7. **Labor & economics · Confidence · 4→3 — APPLIED.** Sits atop OPEN items D-13 (Canaries–Denmark contradiction), U-D14, T-problem-05 (micro-macro *inferred not surveyed*), C-16, U-A4. The standoutFact headline is itself an unresolved ledger conflict.
8. **Reproduction/meta-science · D8 · 5→4 & D9 · 5→4 — BOTH APPLIED.** U-A9 is evidence-*negative* ("does any grantmaker fund individual reproduction at <$50k? LTFF signal negative"); U-E5 flags MLRC-track solo acceptance as OPEN; CH-6 attacks the nonprofit-funding thesis. (D9 also falls under the program-wide cap, #15.)
9. **Reproduction/meta-science · uniformity (six 5s) · D3 · 5→4 — APPLIED.** A wall of six 5s is the scorer-laziness pattern (A-12, CH-1). D3=5 ignored A-3's partition: re-analysis tier verified ≤$500 (TinyZero $30), but open-model replications are unpriced (U-E1). D3 corrected; D4/D5/D6 stand on their own evidence.
10. **Environmental footprint · D6 · 5→4 — APPLIED.** The standoutFact's own logic is self-defeating: "one ground truth." Ledger U-D9 / CH-10 — one anchor means new estimates are unvalidatable by construction. The headline gap is infeasible, not open; nine gaps are real but the central one is a structural blocker.
11. **Closed-model energy · D7 · revert 4→3 — APPLIED.** CH-10 names this niche as one that "confuse[s] empty with low-value/infeasible." Emptiness driven by infeasibility should lower attainability of a *credible* result, not raise it. Reverts calibrator changeLog #4.
12. **Bias & fairness · D3 · 5→4 — APPLIED.** Model-side is API-only/zero-GPU, but the *deployed-system* half the title names is access-gated (U-D8; sibling gap #5 "Access Denied," 6-month FOI). A blended 5 overstated the deployed side.
13. **Vertical evaluation & audit · D3 · 4 — STANDS.** Already docks for the FOI/access constraint (Suspicion Machines 6-month negotiation, gap #5). Cited as the calibration benchmark the bias-fairness and human-AI rows should have matched.
14. **Model behavior science · D3 · 4 — STANDS; Confidence flagged.** D3=4 correctly hedges the untested cost envelope (U-E1). The standoutFact's "sub-$500 observatory" understates a subject-death risk (A-9: subjects "keep dying," 6–12-mo lifecycles; U-D22: no pre-deprecation capture channel). Score unchanged; caveat surfaced in the scorecard.
15. **Cross-row uniformity · D9 capped at 4 program-wide — APPLIED (systemic).** D9=5 on ~18 of 22 rows while its entire evidentiary basis (ledger Cluster A, U-A1–U-A14, A-5, CH-6) is OPEN and evidence-negative on whether unaffiliated individuals can actually fund/route in. D9 is a pass/fail *constraint-check note* (guardrail #4, scored last, never a tiebreaker), not a discriminator; a wall of 5s hides the open funding risk. All D9=5 capped to 4 this pass; revisit when Cluster A resolves.

**Meta-finding (recorded, not scored):** the most systematic defect is that scores treated the briefs' "fit notes" as evidence while the ledger (A-12, CH-1) establishes those notes are *advocacy* — 24/24 briefs concluded fit, 0 concluded misfit. Every D2/D3/D4=5 that ignored a named access barrier (IRB, FOI, closed telemetry, single-anchor unvalidatability, Epoch-SPOF) is an instance of that defect. The rows that priced barriers in (vertical-audit D3=4, human-AI D3=3, behavior-science D3=4) are the calibration anchors; the corrected rows (bias D3, labor D4, agent-security D6, eval-science D6/Conf) are where the pass pulled the others toward them.

---

## Resource & cost-fit merge log

A later pass folded the dedicated [resource-profiles brief](briefs/resource-profiles.md) into
D3, which was widened from a dollar-only "Budget fit" to the full **Resource & cost fit**
(hardware class · iteration speed vs part-time pacing · data availability/quality/access ·
supply/price exposure · dollar cost). The profiles priced tiers the earlier challenge pass had
flagged as *unpriced* (chiefly ledger U-E1 / A-3), so five rows that had been docked to D3=4 on
that uncertainty are reconciled back up. This log records every D3/Confidence change from the
merge and the two rows added; it does **not** supersede the [Calibration & challenge
log](#calibration--challenge-log) above, which stands as-written.

### D3 reconciliations (row · old→new · reason)

1. **Model architecture research · D3 · 4→5** — Profile 8 "strongly SUPPORTS": 5 of 6 shapes run on one consumer/A100 card or API for $5–70, hours-iteration, synthetic-or-open data, no human-subject/data-collection lag, no access gate; quantized single-card keeps the 80B hybrid under cap.
2. **Model-development bottlenecks · D3 · 4→5** — Profile 2 "strongly RAISES": 5 of 6 flagship shapes need no GPU and run on open public data (hours-iteration); the one RLVR shape fits a single cheap card well under cap ($30–150 across runs, each cheap). No access gate.
3. **Evaluation & benchmarking science · D3 · 4→5** — Profile 12 "STRONGLY RAISES": high-fit B-layer work is $0–70, hours-iteration, open-abundant data, barely supply-exposed; the $40k figure was HAL's full budget and the only busters (human RCTs, private benchmarks) are avoidable edges.
4. **Model behavior science / behavioral fingerprinting · D3 · 4→5** — Profile 13 "strongly RAISES" prices the previously-untested envelope (U-E1): flagship observatory $30–80, budget-buster risk ~nil, ~80% api-only, unattended calendar-paced iteration fits ≤15 hrs/wk; deprecation/judge-validity are scientific not resource gates.
5. **Reproduction, replication & meta-science · D3 · 4→5** — Profile 15 (most resource-favorable domain in sweep, lowest supply exposure) prices the tier that drove the earlier 5→4 challenge (U-E1/A-3): open-model replications are $4–30 toy / $28–66 QLoRA-70B, all under cap; only full-scale pretraining busts, avoidable by scope. (This reverts challenge #9's D3 correction on new evidence, not by overruling it.)

No Confidence scores changed in the merge (no `confidenceFlag` was raised on any reconciled row).

**Rows unchanged on D3** (profiles reviewed, no change): Agent architectures & orchestration,
Agent security & authentication, AI development & research tooling, AI supply chain, Bias &
fairness, Environmental footprint of AI, Governance/regulation & geopolitics, Social impact:
disempowerment & cognitive change, Social impact: labor & economics, Human-AI interaction field
studies, Small/open-model science, The data science of AI, Vertical evaluation & third-party
audit, Wildcard: Agent market ecology, Wildcard: Energy/water measurement of closed API models,
Wildcard: Model welfare empirics.

### Rows added in this merge

- **Wealth inequality (mechanisms & measurement)** — problem-domain row (problem-12). D3=5 (open tabular data, $0–45, laptop). Confidence 3 (headline claims THEORIZED-UNMEASURED; no dataset joins usage- and ownership-inequality). Full scorecard above.
- **Alternative-hardware (non-NVIDIA) training** — problem-domain row (problem-13). D3=4 (tempered: fingerprinting-signal feasibility untested, richest verification data access-gated). Confidence 3 (single dense brief; load-bearing facts vendor-sourced/⚠️-flagged). Full scorecard above.

---

## Reading the results

This index is a *comparison instrument, not a decision*. Read it column by column, discounted
by Confidence — never as a leaderboard.

On raw dimension profile for **this** program (impact-first, solo, ≤$500, eval/LLM-as-judge
strengths), the strongest-fitting rows cluster where the profile's published expertise —
evaluation methodology, LLM-as-judge, data pipelines — sits directly on the field's named
open problems at laptop-plus-API cost: **Governance, regulation & geopolitics** (the only row
that held straight 5s across D1–D6 and D8 after the challenge pass, because its scarcest input
is literally "people who can run measurements"), **AI supply chain**, **Bias & fairness**,
**Vertical evaluation & third-party audit**, and **Reproduction, replication & meta-science**
(the purest solo/low-budget template, where the scarce input is credibility not compute).
Close behind sit **Evaluation & benchmarking science**, **Model behavior science**, and
**Small/open-model science** — each a near-perfect skills match. The resource-profile merge
sharpened this top cluster rather than reshuffling it: **Evaluation & benchmarking science**,
**Model behavior science**, and **Reproduction/meta-science** each rose to D3=5 once the
profiles priced the tier the challenge pass had flagged as untested (the $40k eval figure was
HAL's whole budget; the behavior observatory prices at $30–80; open-model replications run
$4–66) — so their earlier "the cost envelope is untested" caveat is now largely retired,
though the *scientific* caveats (industrializing niche; judge-validity; subject-death) still
stand. **Model architecture research** and **Model-development bottlenecks** also rose to D3=5
(single-card/no-GPU shapes under cap), strengthening two rows the D7/D6 columns otherwise
temper.

The resource profiles also draw a sharper line between rows that are **resource-LIGHT** (an
advantage to bank) and rows that are **resource-GATED** (a caution to price in). Resource-light,
on the profiles' own read: **AI supply chain**, **Governance**, **Environmental footprint**,
**Model-development bottlenecks**, **Reproduction/meta-science** (the single most
resource-favorable domain, lowest supply exposure), **Evaluation & benchmarking science**,
**Model behavior science**, **Small/open-model science**, and the newly-added **Wealth
inequality** row — all open-data or api-only, fast-iterating, under cap. Resource-gated, and
docked or flagged accordingly: **Human-AI interaction field studies** (D3=3 — no home IRB;
commercial IRB fees exceed the budget before one participant is paid), the **deployed-system
half of Bias & fairness** (D3=4 — FOI/closed-telemetry access, a 6-month negotiation in one
exemplar), and **Vertical evaluation & third-party audit** (D3=4 — the calibration benchmark
that honestly priced an access barrier). These gates make a nominally-cheap study expensive in
*effort*, not dollars, and the two structural traps still recur: single-anchor
unvalidatability (**Environmental footprint** and **Closed-model energy** both have exactly one
ground-truth number, so new estimates cannot be validated by construction) and the access gates
just named.

The two rows added in the merge land, deliberately, in the *attractive-but-uncertain* band, not
the top cluster. **Wealth inequality (mechanisms & measurement)** is resource-light and a clean
skills fit (D2/D3/D4/D6 all high) but sits at **Conf 3** and **D1=4**: its headline claims are
theorized-unmeasured (no published dataset joins usage- and ownership-inequality; no
AI-attribution counterfactual), so it reads like Labor & economics' quieter cousin — a real
measurement hole the profile can attack, discounted hard by how little we yet know. **Alternative-hardware
(non-NVIDIA) training** scores high on impact and gap density (D1/D5/D6 = 5) but is the merge's
sharpest *feasibility* bet: **D3=4** and **Conf 3** because the exploitable niche is not training
models (out of scope) but independent run-level verification, and the flagship shape rests on an
untested assumption — that the numerical hardware signature survives into released frontier
weights. Both are single-brief rows; both belong on the read list, neither on a shortlist yet.

The Confidence column is where honesty about *ignorance* lives, and several rows say plainly we
understand them too poorly to act on yet: **Labor & economics** (Conf 3 — its headline finding,
the Canaries-vs-Denmark contradiction, is an *unresolved* ledger conflict, and its flagship
study shape has an unaudited-classifier and conflict-of-interest problem), the two new rows
above (**Wealth inequality**, **Alternative-hardware**, both Conf 3), and the remaining
**Wildcards** — **Agent market ecology**, **Model welfare empirics**, and **Closed-model
energy** all sit at Conf 3 on single sweep briefs, several load-bearing facts still unverified.
And the program-wide D9 cap is a standing reminder that whether an unaffiliated individual can
actually *fund* any of this remains an open, evidence-negative question (ledger Cluster A) —
attractive dimension profiles, resource-light or not, do not resolve it.

None of this selects a topic. Selection still runs through [04](04-topic-selection-process.md)'s
staged process — **read → pilot → choose** — where a high row here earns a closer read, a
closer read earns a scoped pilot, and only a pilot that survives contact with real cost,
real data access, and real demand earns the commitment. The matrix narrows the field to read;
it does not pick the winner.

---

*Method note: scores are proposed per-row by domain scorers reading the briefs, then
normalized by a single cross-row calibrator, then challenged against the
[adversarial critique](03-knowledge-gaps-and-assumptions-ledger.md). Disagreements are
recorded, not averaged away.*
