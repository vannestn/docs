# Knowledge Gaps & Assumptions Ledger

*The living ledger required by charter principle #3 ([00-goals-and-operating-principles.md](00-goals-and-operating-principles.md)): what **we** don't know, what we're assuming, where our coverage is thin, and where our own documents contradict each other. Compiled 2026-07-08 from the gap audit of 24 briefs in [briefs/](briefs/) and an independent adversarial review of the charter + briefs (web-checked 2026-07-08).*

## How to use this ledger

- **Every item has a checkbox and a status:** `OPEN` (nobody working it) · `DIGGING` (someone actively on it) · `SETTLED` (resolved — must link to where).
- **Updated every phase.** Items are never deleted; settled items keep their resolution link. IDs are stable references (U = unknown, A = untested assumption, T = thin spot, C = conflict, CH = challenge to the program itself).
- **⚠️ marks items where evidence already points one way** (usually from the adversarial review's web checks). ⚠️ ≠ settled.
- **Scope gap:** `briefs/problem-11-agent-architectures.md` exists but was **not** in the 24-brief audit — see T-0.
- **Standing rules adopted from the audit:** (1) cross-brief numbers get written once in a canonical-facts file and cited, not re-derived (C-1/C-2/C-3 show the hygiene failure); (2) two items get standing radar monitoring, not one-off digs: U-C1 (EU evaluator qualification) and A-9/U-E3 (API deprecation + ToS exposure).

### Do-first queue (highest leverage, from the adversarial review)

| # | Doubt | Test | Cost | Item |
|---|---|---|---|---|
| 1 | Fit instrument is broken | Adversarially re-score 5 briefs; ≥1 must fail | 1 day | CH-1 |
| 2 | Judge/meta-eval niche closed | Quarterly arXiv counts + citation concentration; ask a harness maintainer about PR supply vs. demand | 2 days | CH-2, CH-3 |
| 3 | Part-time on-ramps are a mirage | Filter every on-ramp by ≤15 hrs/wk + no relocation; ask METR/Epoch for conversion base rates | 2 days | CH-5 |
| 4 | Demand exists for the top-3 artifacts | 10 cold emails to named would-be consumers; require 2 "yes" | 1 week | CH-11 |
| 5 | Nonprofit funding path viable | Apply for one micro-grant now; rejection reasons are the data | 1 week | CH-6 |
| 6 | Archaeology/post-mortem niches dead ends | Pre-sale test; one attempted post-mortem with evidence-vs-speculation tally | 2 weeks | CH-10 |
| 7 | Flood erodes solo-paper value | Track 20 recent solo eval-audit arXiv papers for 6 months | passive | CH-4 |
| 8 | EU evaluator market open to micro-entities | Read July-15 workshop outputs when published | 1 hr, dated | U-C1 |

---

## 1. Unknowns

### Cluster A — Can this program actually get funded? (eligibility of unaffiliated individuals)

*The funding story is a stack of eligibility pages read, not humans asked. Spend a day converting "website says" to "human confirmed" before any study is scoped. ⚠️ Ecosystem-level signal is negative: [LTFF is unusually funding-constrained](https://www.lesswrong.com/posts/gRfy2Q2Pg25a2cHyY/ltff-and-eaif-are-unusually-funding-constrained-right-now) and [raising its bar](https://forum.effectivealtruism.org/posts/7RrjXQhGgAJiDLWYR/what-does-a-marginal-grant-at-ltff-look-like-funding).*

- [ ] **U-A1** `OPEN` — NAIRR compute accessible without university affiliation? *(eval-01)* → Read eligibility docs; email program office.
- [ ] **U-A2** `OPEN` — AI2050: nomination-only vs. open application; is eval methodology in scope? *(eval-01)* → Check Schmidt Sciences application page.
- [ ] **U-A3** `OPEN` — Coefficient Giving: does the next RFP fund org-less individuals at *small* scale (closed RFP: individuals eligible at $200k–$2M/yr; micro tier unknown)? *(problem-04, sweep-05)* → Watch next RFP; email program officer; scan grants DB for individual grantees.
- [ ] **U-A4** `OPEN` — Anthropic Economic Futures ($10k–$50k): eligibility for unaffiliated independents; human-subjects coverage; $200M Research Fund mechanics. *(problem-05, sweep-04)* → Open program terms; apply or email.
- [ ] **U-A5** `OPEN` — UK AISI evals bounty: is a 2026 round open? *(eval-01)* → Open the smartergrants portal.
- [ ] **U-A6** `OPEN` — Will METR's task bounty reopen; base rate of bounty→hire? *(eval-05)* → Ask METR directly (responsive on EA Forum).
- [ ] **U-A7** `OPEN` — Epoch contractor→staff conversion rate; is FrontierMath problem-writing still paid + open? *(eval-01, eval-05)* → Ask Epoch; check careers page.
- [ ] **U-A8** `OPEN` — MLCommons working-group participation cost for non-member individuals? *(eval-01, eval-04)* → Email working-group chairs.
- [ ] **U-A9** `OPEN` ⚠️ — Does any grantmaker fund *individual* reproduction/meta-science at <$50k, and on what track record? LTFF signal negative (links above). *(sweep-05)* → Dig current LTFF/SFF/Manifund calls; check past grants for solo replicators.
- [ ] **U-A10** `OPEN` — Funding paths for independent vertical-eval/audit builders (NSF, Mozilla Tech Fund, philanthropy)? *(sweep-06)* → Dedicated funding-mapping pass.
- [ ] **U-A11** `OPEN` — Mozilla Data Futures Lab / Builders 2026 grant cycles? *(sweep-02)* → Check Mozilla pages.
- [ ] **U-A12** `OPEN` — GitHub Accelerator status post-2024; any *durable* funding for tool maintainers who don't found companies? *(problem-10)* → GitHub blog; interview maintainers.
- [ ] **U-A13** `OPEN` — Does UK AISI fund/credit outside researchers on its named open problems beyond the Challenge Fund? *(eval-06)* → Read aisi.gov.uk/grants terms; email.
- [ ] **U-A14** `OPEN` — Eleos/FRI/Sage/Andon/Artificial Analysis funding models; do they absorb external contributors? *(sweep-08, sweep-05)* → 990s; About pages; direct contact.

### Cluster B — Institutional opacity (the orgs we'd work with are themselves unmeasured)

- [ ] **U-B1** `OPEN` — Epoch: team size, post-FrontierMath disclosure changes, true funding total (verified ≈$13M vs. tertiary $21.7M — see C-5). *(eval-01/02/05)* → 990s; Open Phil grants DB; ask.
- [ ] **U-B2** `OPEN` — Apollo post-PBC: funding mix, headcount, is "science of evals" still alive vs. fully pivoted to scheming? *(eval-01/04/06)* → Ask directly; watch Q3–Q4 hiring.
- [ ] **U-B3** `OPEN` — UK AISI / US CAISI headcounts; CAISI's safety-vs-standards posture; AISIC status. *(eval-01/02/04)* → NIST publications; Federal Register; FOIA if needed.
- [ ] **U-B4** `OPEN` — CAISI "40+ evals / 5 pre-deployment agreements": secondary press only, not nist.gov (see C-4). *(eval-04)* → Fetch CAISI primary publications.
- [ ] **U-B5** `OPEN` — LMArena battle-data openness post-Series A; was private-variant testing reformed post-Leaderboard-Illusion? *(eval-01/02)* → Current data releases + policy page.
- [ ] **U-B6** `OPEN` — OpenAI Evals repo status; platform-vs-repo deprecation split; promptfoo→OpenAI acquisition (single-source). *(eval-02/04)* → Open the repos and docs.
- [ ] **U-B7** `OPEN` — OpenAI Model Behavior team status post-Jang departure (single weak source). *(sweep-01)* → Corroborate via LinkedIn/press.
- [ ] **U-B8** `OPEN` — Hailey Schoelkopf's current affiliation (maintainer→lab path we want confirmed). *(eval-05)* → LinkedIn/X.
- [ ] **U-B9** `OPEN` — Patronus AI Series B SEC discrepancy (fraud-adjacent question about a named eval company). *(eval-05)* → SEC EDGAR; follow-up reporting.
- [ ] **U-B10** `OPEN` — Scale SEAL/Labs structure post-Meta; DeepMind eval-team hiring; do they hire eval-only specialists? *(eval-02/05)* → Careers pages; press.
- [ ] **U-B11** `OPEN` — RAND compute-team status post-Heim ("led," past tense). *(problem-03)* → Heim's site; RAND CAST page.
- [ ] **U-B12** `OPEN` — Team sizes for Invariant Labs, Palisade, Gray Swan, Anthropic Societal Impacts, MSR groups, Vals AI, Unsloth, Nous ("small" is inference throughout). *(sweep-03/04/07, eval-06)* → LinkedIn headcount pass.
- [ ] **U-B13** `OPEN` — EvalEval mechanics: funders, co-authorship on shared tasks, real repo activity, cadence. *(eval-06, eval-04)* → Email the coalition.
- [ ] **U-B14** `OPEN` — METR Research Collaborators track: open application? paid? part-time-compatible? *(eval-02)* → Fetch metr.org/careers.
- [ ] **U-B15** `OPEN` — International Programme on AI Evaluation: admissions for part-timers (20 hrs/wk is heavy). *(eval-02)* → ai-evaluation.org.
- [ ] **U-B16** `OPEN` — EleutherAI 2026 project slate; Discord onboarding realistic part-time? DPI volunteer on-ramp still live (contact email is 2023-vintage)? *(sweep-07, sweep-02)* → Join Discord; check DPI GitHub activity.
- [ ] **U-B17** `OPEN` — Do HF FineData, Common Crawl, AIID/AIAAIC/MIT tracker formally take outside collaborators? *(sweep-02, sweep-06)* → Direct contact.

### Cluster C — Regulatory trajectory (deadlines and definitions that gate several study shapes)

- [ ] **U-C1** `DIGGING` ⚠️ **(standing radar item)** — EU external-evaluator qualification: can *individuals/micro-orgs* qualify? The [workshop's own participant criteria](https://digital-strategy.ec.europa.eu/en/events/call-participants-workshop-qualification-requirements-external-evaluators-gpai-models-systemic-risk) already require demonstrated GPAI-eval experience or a governance track record — evidence points to institutions-only. *(eval-01)* → Track July-15 workshop outputs; read the 2027 eval-capacity call when published. See CH-7.
- [ ] **U-C2** `OPEN` — How the EU AI Office operationalizes GPAI enforcement after Aug 2 2026: which evals, which third parties, what evidentiary standard. *(problem-04, eval-04)* → Monitor AI Office publications post-deadline.
- [ ] **U-C3** `OPEN` — JTC 21 harmonized-standards status; any AI-Act standard in the Official Journal; CoP adequacy assessment. *(eval-04)* → CEN-CENELEC + Commission trackers.
- [ ] **U-C4** `OPEN` — Content of the International Network's Feb 2026 "consensus areas" doc (announcement read; document not fetched); diff vs. Miller/BetterBench/Apollo. *(eval-04)* → Fetch and diff.
- [ ] **U-C5** `OPEN` — Fate of the US AI Environmental Impacts Act (reintroduced 2026-06-09); does EU AI Act energy documentation ever become public? *(problem-01)* → Congress.gov tracking.
- [ ] **U-C6** `OPEN` — H.R. 3447 (Chip Security Act) passage; is mandated location verification spoof-resistant in practice? *(problem-03)* → Bill tracking; technical eval (study shape exists).
- [ ] **U-C7** `OPEN` — EU Digital Omnibus adoption + final high-risk deadlines (see C-8); Colorado SB 26-189 in practice; *Mobley v. Workday* merits. *(problem-07, problem-04)* → Legal trackers; case docket.
- [ ] **U-C8** `OPEN` — Which agent-identity standard wins (OAuth-extension vs. DID/VC vs. capability tokens); agent liability allocation. *(problem-09)* → IETF WG tracking; legal literature watch.
- [ ] **U-C9** `OPEN` — Which observability convention wins (OTel GenAI vs. OpenInference vs. OpenLLMetry), on what timeline. *(problem-10)* → OTel SIG participation.
- [ ] **U-C10** `OPEN` — Do FLOP thresholds remain administrable (>200 models >10²⁶ by 2030)? No joint coverage-decay analysis across SB 53/RAISE/EU/BIS. *(problem-03/04)* → Itself a proposed study, not just a dig.

### Cluster D — Substantive scientific unknowns (each is both a gap and a candidate study)

*Rule from A-8: every "nobody does X" below must survive a **hostile literature search** before a study is built on it.*

- [ ] **U-D1** `OPEN` — Are error bars meaningful when the sampling unit (benchmark items) isn't the inference target (real-world tasks)? "The deepest unresolved issue" in eval statistics. *(eval-02)* → Theoretical/position work; unowned.
- [ ] **U-D2** `OPEN` ⚠️ — Adoption rates of known fixes (Miller error bars, IDK scoring, ABC, BetterBench, IRT); do Inspect/lm-eval ship clustered SEs by default? ⚠️ Audit genre may be automating: [BenchGuard](https://arxiv.org/pdf/2604.24955) exists and appears in no brief. *(eval-02/04/06)* → Inspect codebases + survey benchmark papers (publishable audit).
- [ ] **U-D3** `OPEN` ⚠️ — Does a StrongREJECT-style meta-evaluation exist for *hallucination* judges (the program's core niche claim)? Hostile search must beat the [healthcare scoping review](https://arxiv.org/pdf/2605.25273), [field-wide surveys](https://arxiv.org/abs/2411.15594), and the [community awesome-list](https://github.com/llm-as-a-judge/Awesome-LLM-as-a-judge). *(eval-02)* → Systematic literature check before staking the claim.
- [ ] **U-D4** `OPEN` — Does benchmark half-life (~18–36 mo) generalize to narrow/domain benchmarks? Our own planning depends on this. *(eval-03)* → Extend saturation studies to domain benchmarks.
- [ ] **U-D5** `OPEN` — True benchmark construction costs (no cost-per-validated-item table possible from public data). *(eval-03)* → Mine appendices/acknowledgments; ask builders.
- [ ] **U-D6** `OPEN` — What makes a vertical benchmark get adopted vs. die; adoption mechanics inferred, never measured. *(sweep-06, eval-03)* → Citation/model-card-mention trajectory study.
- [ ] **U-D7** `OPEN` — Do framework/disclosure scorecards *predict* anything (incidents, behavior change), or does the genre measure paperwork? *(problem-04)* → Outcome-linkage study; nobody has done it.
- [ ] **U-D8** `OPEN` — Do mandated bias audits (LL144) change hiring outcomes; do commercial auditors detect known-biased systems? *(problem-07, sweep-06)* → Audit-report corpus study + auditor stress test.
- [ ] **U-D9** `OPEN` — Black-box energy estimation accuracy (one ground-truth anchor: Google's 0.24 Wh); agentic-workload energy unmeasured; Ren–Mytton water dispute unadjudicated. ⚠️ CH-10: one anchor means new estimates are unvalidatable by construction. *(problem-01, sweep-08)* → Validation vs. Google disclosure + local Zeus measurement.
- [ ] **U-D10** `OPEN` — Entropy-collapse exchange-law generality; does RLVR expand the capability boundary at all (Yue et al. vs. unverified ProRL)? *(problem-02)* → Cross-family small-scale replication (fits $500).
- [ ] **U-D11** `OPEN` — Actual synthetic share of fresh web text (headline numbers all trace to commercial detectors; 0%–35% spread, never cross-calibrated). *(problem-02, sweep-02/08)* → Detector-FPR-corrected estimate on recent Common Crawl.
- [ ] **U-D12** `OPEN` — True smuggled-chip volume (90% CI spans 5.5×; driven by one unmeasured detection-rate parameter); Chinese domestic output; "80% unused" unverified. *(problem-03/04)* → Trade-data mining; model reconciliation.
- [ ] **U-D13** `OPEN` — Canaries–Denmark labor contradiction (US entry-level decline vs. Danish precise nulls); economy-wide wage-effect sign. *(problem-05)* → Reconciliation study; institutions-vs-timing tests.
- [ ] **U-D14** `OPEN` — Is lab usage telemetry (Anthropic Economic Index, OpenAI) valid as an economic instrument? Conversation→O*NET classifier has no external audit. *(problem-05)* → Independent audit of the CC-BY data (study shape named; ⚠️ CoI rules in CH-8 apply).
- [ ] **U-D15** `OPEN` — Does sustained AI use *cause* skill/critical-thinking decline (evidence correlational, short, n<60)? Dose–response; "AI psychosis" base rate; do sycophancy scores predict human belief drift? *(problem-06)* → Longitudinal RCTs; the field's own named gaps.
- [ ] **U-D16** `OPEN` — Can "gradual disempowerment" be operationalized into leading indicators at all? Authors concede no metrics exist. *(problem-06)* → Conceptual + indicator-building work.
- [ ] **U-D17** `OPEN` — Do Kimi Linear/Qwen3-Next-class hybrid claims replicate independently; where do KDA/GDN hit the recall wall; does architecture class shift hallucination behavior? *(problem-08)* → Inference-only stress tests (study shapes named).
- [ ] **U-D18** `OPEN` — Real-world spoof/bypass rates for Web Bot Auth/TAP (all numbers vendor claims); does crypto signing reduce harm end-to-end given injection precedes signature; does signed-agent infra centralize the web? *(problem-09)* → Independent adversarial eval; allowlist-coverage measurement. ⚠️ CH-window caveat in the adversarial review (§1.4).
- [ ] **U-D19** `OPEN` — Cross-harness disagreement magnitude on *agentic* evals; how much score variance is serving nondeterminism; would harness maintainers accept statistical-reporting defaults? *(problem-10)* → Cross-harness study + upstream PRs.
- [ ] **U-D20** `OPEN` — Judge drift vs. subject drift in longitudinal behavior measurement (SpeechMap changed judges mid-stream); uncharacterized. Direct extension of the researcher's specialty — and a confound for the program's own judge-based methods (CH-13c). *(sweep-01)* → Judge-stability study.
- [ ] **U-D21** `OPEN` — Why PTQ-safety results conflict; does compression damage transfer to instruction-tuned LLMs; small-model learnability-gap mechanism; does quantization change emergent-misalignment rates (unclaimed)? *(sweep-07)* → Controlled Pythia-scale comparisons.
- [ ] **U-D22** `OPEN` — Is pre-deprecation behavioral capture possible (no external channel documented at any lab); provider deprecation-notice policies. *(sweep-08, sweep-01)* → Systematic deprecation-policy pass; ask Anthropic. Gate on CH-10 pre-sale test first.
- [ ] **U-D23** `OPEN` — Which eval scores predict which human outcomes (benchmark-to-human transfer near-unmapped; Bean et al. lone anchor)? *(sweep-04, eval-06)* → Scaled-down Bean-style transfer studies.
- [ ] **U-D24** `OPEN` — Has Epoch revised the 300T/2028 data-wall estimate for the RL era; does power-first constraint ordering still hold post-2025 buildouts? *(problem-02)* → Check Epoch updates.
- [ ] **U-D25** `OPEN` — Do "Measuring what Matters" and BetterBench conflict or compose (meta-checklist may be whitespace or may exist)? *(eval-06)* → Item-by-item instrument comparison.

### Cluster E — Program feasibility unknowns (cost, ethics, legal)

*The program's central constraint is budget + hours, yet almost no cost arithmetic has been done (T-4). Do the costing before committing to any study.*

- [ ] **U-E1** `OPEN` — Real API cost of a Wiese-style 10-week observatory; compute floor for curation ablations; credible-2026-replication compute; is an 80B-A3B hybrid stress-testable under $500? *(sweep-01/02/05, problem-08)* → Costing pass, claim by claim, before commitment.
- [ ] **U-E2** `OPEN` — Commercial IRB cost/turnaround for a solo researcher (likely $1–3k — exceeds the study budget before one participant is paid); does Prolific enforce ethics review; do target journals accept commercial-IRB approval from independents? *(problem-06, sweep-04)* → Real quotes (Solutions IRB, Advarra, WCG); ask Prolific; email editors.
- [ ] **U-E3** `OPEN` **(standing radar item)** — ToS/legal exposure across the program: probing commercial APIs + publishing per-vendor results; naming companies in contamination/license audits; forensics of hyped startups (defamation); archiving/republishing API output corpora; CFAA exposure. *(sweep-01/02/05/06/08)* → Safe-harbor literature dig (Longpre et al.); possibly one consult.
- [ ] **U-E4** `OPEN` — Can independent researchers get the *data* several study shapes need (eval transcripts, institute artifacts, statutory filings)? *(problem-04)* → Test with one concrete request.
- [ ] **U-E5** `OPEN` — Does MLRC-as-NeurIPS-track accept solo/unaffiliated reproducers; how does TMLR gating change the barrier? *(sweep-05)* → Read track CFP; ask organizers.
- [ ] **U-E6** `OPEN` — Where each genre actually publishes and what career credit each channel confers (B-layer venue; observatory/negative/audit results; tooling splits across NeurIPS D&B/MLSys/TOSEM/blogs). *(eval-02, sweep-01, problem-10)* → Venue-mapping pass over recent acceptances.

---

## 2. Untested assumptions

*Load-bearing beliefs, ordered by how much collapses if false. Each has a concrete cheap test.*

- [ ] **A-1** `OPEN` — **"Eval skills transfer across all these fields."** Asserted 24 times, tested zero. Counter-evidence inside the briefs: problem-09's incumbent expertise is distributed-systems security; problem-04 dates in months; sweep-04 gates on IRB infrastructure we lack. **Test:** run one cross-domain study end-to-end (e.g., judge-validity audit of a governance-cited eval) and measure whether the target community engages.
- [ ] **A-2** `OPEN` — **"One published study is enough credential."** Never checked against grant committees, fellowships, or co-authorship invitations; the adjacent claim rests on one METR anecdote (eval-01). **Test:** include the publication in the CH-6 micro-grant application and the CH-11 cold emails; the responses are the data.
- [ ] **A-3** `OPEN` — **"$500/study is enough for publishable work."** Verified for re-analysis exemplars (TinyZero <$30, Martínez $0); contradicted for others cited approvingly (METR RCT ≈$75k participant pay, $40k agent sweeps, FineWeb-scale ablations). **Test/fix:** partition every study shape into a **re-analysis tier** (verified ≤$500) and a **primary-data tier** (requires a grant); run the U-E1/U-E2 costing pass. No more blur.
- [ ] **A-4** `OPEN` — **"Small-team benchmarks still get adopted in 2026."** The canon is 2020–2024 vintage, all winners, no denominator (eval-05), adoption often exogenous (eval-03), novelty bar rising (sweep-03). **Test:** the denominator study — sample 100 random 2024 NeurIPS D&B benchmark papers, count adoption/career outcomes.
- [ ] **A-5** `OPEN` ⚠️ — **"Grant funders fund unaffiliated individuals."** Built on eligibility language, not observed grants; the two strong data points (Ball, Grunewald) predate professionalization. ⚠️ LTFF constrained (links in Cluster A). **Test:** Cluster A digs + one live application (CH-6).
- [ ] **A-6** `OPEN` — **"Benchmark/eval auditing is welcomed rather than resented."** ABC and SWE-bench Illusion suggest yes — both had institutional backing; no standards doc found citing solo work. **Test:** ask an Inspect Evals / lm-eval maintainer whether audit-style contributions are backlogged or begged-for (also serves CH-2).
- [ ] **A-7** `OPEN` — **"Independence is an asset."** sweep-05's value proposition vs. eval-05's institutional-tailwind evidence; the blogger path converts to *audience*, not necessarily grants/co-authorship/hiring. **Test:** CH-4 tracking study of solo/unaffiliated papers.
- [ ] **A-8** `OPEN` — **"Absence-of-evidence searches establish whitespace."** ≥12 "no study found — gap!" claims are self-flagged inferred absences. **Test/rule:** every whitespace claim gets a hostile literature search (documented queries) before a study is built on it; one missed paper kills the contribution.
- [ ] **A-9** `OPEN` **(standing radar item)** — **"API access persists long enough to do the work."** 6–12-month model lifecycles, no researcher access channels, longitudinal subjects keep dying (sweep-08, sweep-01). **Test:** any observatory design must include a written subject-death contingency before launch; run the U-D22 deprecation-policy pass.
- [ ] **A-10** `OPEN` — **"The briefs' field intelligence stays current."** problem-04 admits months-scale decay; several load-bearing facts were weeks old at compilation. **Test/fix:** re-verification cadence via the radar ([06-radar-design.md](06-radar-design.md)); date-stamp load-bearing facts.
- [ ] **A-11** `OPEN` ⚠️ — **"Part-time solo pace is compatible with these fields' clock speeds."** No brief tested cycle-time fit. ⚠️ Confirmed negative for key on-ramps: [Anthropic Fellows is 40 hrs/wk, US/UK/CA residence](https://alignment.anthropic.com/2025/anthropic-fellows-program-2026/); MATS full-time; IPAIE 20 hrs/wk. **Test:** the CH-5 on-ramp filter.
- [ ] **A-12** `OPEN` — **"Fit is real because every brief found fit."** 24/24 briefs concluded fit; zero concluded misfit. Treat all fit notes as advocacy, not assessment. **Test:** CH-1 — adversarially re-score 5 briefs; require ≥1 to fail.

---

## 3. Thin spots

### Program-level (structural)

- [ ] **T-0** `OPEN` — `briefs/problem-11-agent-architectures.md` was **outside the 24-brief audit scope**. → Run the same gap audit + adversarial fit re-score on it.
- [ ] **T-1** `OPEN` — **Epoch AI is a single point of failure** for the program's empirical worldview (data wall, smuggling, compute tracking, prices, benchmark hub) — the same org documented as having a serious disclosure failure. *(problem-02/03/04, eval-01, sweep-08)* → Editorial rule adopted per C-13: treat Epoch data as high-quality but **not independent**; say so wherever cited; seek a second source for each load-bearing Epoch number.
- [ ] **T-2** `OPEN` — **Anthropic self-reports treated as field facts** (Clio, Values in the Wild, Economic Index, deprecation commitments) with no independent verification possible. *(problem-05/06, sweep-01/04)* → Flag every use; U-D14 audit is the partial fix.
- [ ] **T-3** `OPEN` — **Tertiary-source career claims** in eval-05 — the brief most directly informing career strategy sources key facts from Grokipedia/aiwiki/unverified reporting. → Re-source before any career decision leans on it.
- [ ] **T-4** `OPEN` — **Almost no cost data anywhere** despite budget being the central constraint (U-D5, U-E1, U-E2). → Costing pass is a Stage-1 gate in [04-topic-selection-process.md](04-topic-selection-process.md).
- [ ] **T-5** `OPEN` — **Geography:** China's eval ecosystem, Global-South labor outcomes, non-US datacenter buildout — flagged in passing, covered nowhere. *(problem-02/03/05)*
- [ ] **T-6** `OPEN` — **No denominators anywhere:** base rates for benchmark adoption, fellowship conversion, grant acceptance, bounty→hire all absent. *(eval-05 says so explicitly)* → A-4 test + CH-5 emails.
- [ ] **T-7** `OPEN` — **Mechanistic interpretability at Pythia scale has no brief** despite being the largest structured safety talent pipeline, demonstrably solo-viable, and adjacent via model-diffing (sweep-07). *(adv-review)* → Justify the exclusion in writing or run a sweep brief.
- [ ] **T-8** `OPEN` — **Multilingual / low-resource evaluation has no brief** — a genuine undersupply per the briefs' own FineWeb findings, with dedicated funders/communities, and a differentiation axis against the English-language flood. *(adv-review)* → Same: justify or sweep.
- [ ] **T-9** `OPEN` — **The analyst/newsletter path is not a first-class strategy** despite the briefs repeatedly finding newsletters load-bearing (SemiAnalysis, ChinaTalk, Ball→OSTP, Willison, Mytton, Zvi). Different product, different economics: compounding audience, no reviewer bottleneck, flood-robust. *(adv-review)* → Write the brief or reject explicitly.
- [ ] **T-10** `OPEN` — **The fast-money micro-grant layer is missing from the funding map:** Japan/Singapore/Canada AISI-network members, NIST GenAI challenges, ACX Grants, Emergent Ventures, TMLR-as-venue-strategy. Current map is Anglo- and EA-centric. *(adv-review)* → Extend the Cluster A funding pass.

### Per-brief

- [ ] **T-eval-03** `OPEN` — Self-declared gaps: METR tasks/HELM/BIG-bench/OSWorld/Cybench/LiveCodeBench not case-studied; 2026 SOTA numbers from aggregators unverified; affiliations "from memory."
- [ ] **T-eval-04** `OPEN` — CAISI section rests on secondary press; International Network consensus doc unread (U-C4); promptfoo acquisition single-source.
- [ ] **T-eval-05** `OPEN` — See T-3; Patronus discrepancy unresolved (U-B9); builds on winners only despite honest caveat.
- [ ] **T-problem-01** `OPEN` — E-waste = one primary model + one paywalled unread critique; Anthropic disclosure absence single-sourced (azvai.com); one energy validation anchor.
- [ ] **T-problem-02** `OPEN` — ProRL counter-evidence explicitly unverified; Whitfill et al. affiliations unknown; RL-environment "bottleneck" claim only from parties selling environments.
- [ ] **T-problem-03** `OPEN` — RAND power figures from snippets (PDF 403'd); CFR/ITIF/HBM/transformer-lead-time claims snippet-level; grid gray literature unopened.
- [ ] **T-problem-05** `OPEN` — Micro-macro reconciliation absence inferred, not surveyed; classifier-validity concern has no published critique behind it.
- [ ] **T-problem-06** `OPEN` — Psychiatry affiliations unverified; key papers read at abstract level (2510.01537, 2605.05767, 2606.00975); IRB costs unverified (U-E2).
- [ ] **T-problem-08** `OPEN` — "No third-party stress-test of KDA/GDN" is a not-found claim; BabyLM 2026 deadlines unknown; speedrun-automation framing partly from search summaries.
- [ ] **T-problem-09** `OPEN` — Web Bot Auth adoption claims are vendor blogs; "zero robustness benchmarks" anchor (2605.16282) is the same ID sweep-03 flags as unopened (C-11).
- [ ] **T-problem-10** `OPEN` — "No cross-harness study / no deterministic mode / no CI-rot monitoring" all inferred absences; Langfuse acquisition third-party.
- [ ] **T-sweep-01** `OPEN` — Behavioral Fingerprinting affiliations inferred; moral-drift paper unread; several affiliations from memory.
- [ ] **T-sweep-02** `OPEN` — Consent in Crisis venue unconfirmed; CONDA continuity unchecked; ablation compute floor is the authors' own guess.
- [ ] **T-sweep-03** `OPEN` — Thinnest sourcing of the set: most exemplars [snippet]; disclosure-norms story rests on one journalistic account; several 2026 arXiv IDs never opened.
- [ ] **T-sweep-04** `OPEN` — Prolific ethics enforcement untested; Copilot RCT literature unverified; contested claims (EEG study, Maples exchange, Lancet replication) unresolved.
- [ ] **T-sweep-06** `OPEN` — Public-sector meta-analysis from a search summary; "Auditing the Audits" (best LL144 source) paywalled/unread; Colorado insurance-testing a blank; EU conformity ecosystem out of scope with no owner.
- [ ] **T-sweep-07** `OPEN` — localbench authorship inferred; TRM cost secondary; IJCAI quantization fetch timed out; org details unverified.
- [ ] **T-sweep-08** `OPEN` — Niches 3 & 6 (the "no incumbents" headliners) rest on the fewest sources; the 35%-of-websites figure unverified against its own PDF; nearly all headcounts inferred.

---

## 4. Conflicts

*Claims that disagree across (or within) briefs. Rule: reconcile before the underlying fact is cited anywhere downstream; canonical value goes in the canonical-facts file.*

- [ ] **C-1** `OPEN` — Apollo founding stat: prompt-format swings "up to 76 points" (eval-02) vs. "~5 pp" (eval-04) — same source post. → Reread the Apollo post; likely two claims conflated; fix both briefs.
- [ ] **C-2** `OPEN` — Meta private Arena variants: 27 (eval-01/03, problem-02) vs. 36 (eval-02). → Leaderboard Illusion paper reports both a tested-variant count and a Llama-4-specific count; disambiguate.
- [ ] **C-3** `OPEN` — ChatGPT drift headline: 84%→51% (sweep-01, HDSR version) vs. 97.6%→2.4% (sweep-05/08, arXiv v1). → Standardize on the peer-reviewed HDSR figure; annotate.
- [ ] **C-4** `OPEN` — CAISI "40+ evals / 5 agreements": stated as read fact (eval-01) vs. secondary-press-only (eval-04). → eval-04 is right; downgrade eval-01 until a primary source is found (U-B4).
- [ ] **C-5** `OPEN` — Epoch funding: verified ≈$13M (eval-04) vs. "~$21.7M, 75% Open Phil" (eval-05, Grokipedia). → Open Phil grants DB + 990s (U-B1).
- [ ] **C-6** `OPEN` — METR funder lists disagree across three briefs; headcount ~40+ vs. ~50. → About page changed over time; date-stamp the funder list; both may be true at different dates.
- [ ] **C-7** `OPEN` — Reasoning-mode energy multiplier: ~30× avg / 150–700× cases (problem-01) vs. 10–70× (sweep-08). → Different methodologies, never reconciled — itself a study opportunity; quote neither as "the" multiplier.
- [ ] **C-8** `OPEN` — EU Digital Omnibus status/dates differ (problem-04 vs. problem-07). → Check Council/Parliament adoption as of latest date; harmonize (U-C7).
- [ ] **C-9** `OPEN` — HLE contributor count: ~1,000 (eval-04) vs. 1,100+ (eval-02/03). → Trivial; use the paper's number.
- [ ] **C-10** `OPEN` — Time-horizon doubling rates: ~7 mo vs. ~4 mo (2024–25) vs. 4.7 mo (80%-reliability cyber). → Not a true contradiction (periods/domains/thresholds differ) but reads as one; add a reconciliation note wherever cited.
- [ ] **C-11** `OPEN` — arXiv 2605.16282: load-bearing read anchor in problem-09 vs. unopened snippet in sweep-03. → Open the paper; if unread, problem-09's biggest gap claim is unverified.
- [ ] **C-12** `OPEN` — Leaderboard Illusion author affiliations differ across four briefs. → Copy the paper's affiliation block once into the canonical-facts file; reuse.
- [ ] **C-13** `OPEN` — Epoch characterized as "neutral… open-data backbone" (problem-02/03) vs. the documented FrontierMath independence failure (eval-05, sweep-05). → Editorial decision, adopted at T-1: high-quality but not independent; say so consistently.
- [ ] **C-14** `OPEN` — WildChat offered as current instrument (problem-06) vs. ended May 2024, self-selected (sweep-04). → Verify whether any post-2024 consented corpus exists before designing around it.
- [ ] **C-15** `OPEN` — SWE-bench Verified retirement sourcing differs across eval-02/03/05. → Find OpenAI's primary statement once; upgrade/downgrade all three together.
- [ ] **C-16** `OPEN` — Humlum & Vestergaard sample: 25k workers / 7k workplaces (problem-05) vs. "n≈100k, later 25k" (sweep-04). → Two survey waves; state both explicitly.

---

## 5. Challenges to the program itself

*From the adversarial review (2026-07-08). These are attacks on strategy, not facts — the verification machinery validates citations while every conclusion was pre-determined. Each gets the evidence that would settle it. Falsifiability note: the review itself names three things that survive the attack — longitudinal public observatories (the flood raises their value), the tabular/causal problem briefs (where XGBoost/pipeline skills are the incumbent toolset), and the ledger discipline itself.*

- [ ] **CH-1** `OPEN` — **The fit instrument is broken.** 24/24 briefs concluded "fits you"; an instrument that returns fit 100% of the time is not an instrument. **Settle:** re-score 5 briefs adversarially — for each, write the strongest case the researcher does *not* fit; require ≥1 to fail honestly. (1 day; pairs with A-12.)
- [ ] **CH-2** `OPEN` — **Eval-science/meta-evaluation is a gold rush, not whitespace.** The briefs document its industrialization (renamed NeurIPS track, EvalEval's 48-author funnels, UK AISI workstream, IPAIE cohorts, 445-benchmark Oxford review) while calling it open; "nobody re-audits benchmarks" is self-refuted by ≥8 named audits; the residual gap (continuous maintained auditing) is unfunded maintenance labor — a compensation problem, not a research opportunity; and the genre is being automated ([BenchGuard](https://arxiv.org/pdf/2604.24955), [Verification Tax](https://arxiv.org/html/2604.12951) — in no brief). **Settle:** (a) monthly arXiv counts of benchmark-audit papers; (b) maintainer email — are audit PRs backlogged or begged-for; (c) BenchGuard-class adoption by leaderboard operators.
- [ ] **CH-3** `OPEN` — **The LLM-judge home turf is measurably commoditized.** Healthcare alone: [7 (2024) → 81 (2025) → 46 (Jan–Feb 2026)](https://arxiv.org/pdf/2605.25273) judge studies; [field-wide surveys](https://arxiv.org/abs/2411.15594), a [community site](https://llm-as-a-judge.github.io/), an [awesome-list](https://github.com/llm-as-a-judge/Awesome-LLM-as-a-judge). The judge-bias paper is a commodity unit of production. **Settle:** Semantic Scholar quarterly counts + citation-concentration; if the median 2026 judge-bias paper has ≈0 citations at 6 months, marginal solo entry is worthless without a distribution edge.
- [ ] **CH-4** `OPEN` — **The moat question is unanswered.** The Claude-assisted flood is real ([arXiv survey ban](https://thenextweb.com/news/arxiv-ai-slop-ban-researchers-preprint), [AAAI-26 ~2× submissions](https://arxiv.org/html/2604.13940v1), citations fabricated ~12× more since 2023) and aimed at exactly the program's genres; "Claude as force multiplier" is the industry baseline, not an asset. Honest moat candidates are all *time* moats (longitudinal presence, physical/legal access, trusted independence) — colliding with part-time. **Settle:** track 20 recent solo/unaffiliated eval-audit arXiv papers for 6 months (citations, engagement, career events); write the program's explicit moat statement and defend it.
- [ ] **CH-5** `OPEN` ⚠️ — **The part-time on-ramps are thinner than the briefs imply.** Confirmed: [Anthropic Fellows 40 hrs/wk, US/UK/CA](https://alignment.anthropic.com/2025/anthropic-fellows-program-2026/); MATS full-time; seasonal fellowships full-time; METR bounty paused. Survivors: Epoch contract gigs, RAND CAST, EvalEval shared tasks, OSS PRs. **Settle:** filter every on-ramp in every brief by "≤15 hrs/wk + no relocation"; email METR/Epoch for bounty→hire and contractor→staff base rates.
- [ ] **CH-6** `OPEN` ⚠️ — **The charter's nonprofit thesis is contradicted by its own evidence.** Charter: "funders actively fund exactly this shape of work." Briefs: Palisade ~7 months runway, Apart's "Help Save" appeal, HELM unfunded, Open LLM Leaderboard archived, Open Phil capability-evals RFP closed; [LTFF funding-constrained](https://www.lesswrong.com/posts/gRfy2Q2Pg25a2cHyY/ltff-and-eaif-are-unusually-funding-constrained-right-now). The nonprofit route may be the most fragile exit, not co-equal. **Settle:** apply for one micro-grant (Manifund/ACX/LTFF) with a pilot proposal *now*; the rejection reasons are the data. Amend the charter if it fails.
- [ ] **CH-7** `OPEN` ⚠️ — **The EU evaluator market is being gated on what the program lacks.** [Workshop participant criteria](https://digital-strategy.ec.europa.eu/en/events/call-participants-workshop-qualification-requirements-external-evaluators-gpai-models-systemic-risk) require demonstrated GPAI-eval experience or governance standing; METR holds the EU technical-assistance contract. Betting on this market solo = the "hired" path in a "nonprofit" costume. **Settle:** July-15 workshop outputs + Network of Evaluators membership criteria (U-C1).
- [ ] **CH-8** `OPEN` — **Conflict-of-interest structure replicated at micro scale.** Study shapes propose auditing Anthropic artifacts, funded by Anthropic grants/credits, executed with Claude, judged by Claude — while critiquing Epoch/OpenAI entanglement. **Settle:** adopt a written disclosure + cross-vendor-judging policy before the first study; this is a policy fix, not a dig.
- [ ] **CH-9** `OPEN` — **Mapping has become the deliverable.** Charter process is map → read → pilot → choose; current state is 84-doc map + 24 briefs + checklists and zero pilots. The marginal brief is worth far less than the first pilot. **Settle:** ship pilot #1 by a named date ([04-topic-selection-process.md](04-topic-selection-process.md) sets the gate); if the next artifact is another brief, the challenge is confirmed.
- [ ] **CH-10** `OPEN` — **The wildcard "no-incumbent" niches confuse empty with low-value/infeasible.** Archaeology: no customer (two years of position papers, no actors); post-mortems: NTSB works via subpoena/immunity an outsider lacks; closed-model energy: one validation anchor makes new estimates unvalidatable by construction. **Settle:** pre-sell the archive (3 named researchers committed in writing + one ≥$5k funder) before any API spend; attempt one post-mortem of the best-documented incident and tally established-vs-speculated causal nodes; get a media lawyer's read.
- [ ] **CH-11** `OPEN` — **Zero demand-side validation anywhere.** No brief contains a conversation with a consumer of the proposed artifacts; every gap claim is literature-internal. **Settle:** 10 cold emails to named would-be consumers (AISI staff, EvalEval organizers, grantmakers, lab evals leads); require 2 replies saying "yes, we'd use/fund that" before any build.
- [ ] **CH-12** `OPEN` — **Several flagship study shapes are apprentice work misframed as gaps** — re-runs of the incumbent's own open methods (Epoch's smuggling Monte Carlo, Mytton & Ashtine's audit, Anthropic's classifier with Anthropic's grant). Racing the org that wrote the protocol yields at best a footnote or a junior-hire signal. **Settle:** relabel each such shape explicitly as "job application" or "research niche" in the briefs; where hire-signal is the honest goal, say so and ask the incumbent whether they'd absorb/co-author the work.
- [ ] **CH-13** `OPEN` — **Failure modes are unpriced.** (a) API/ToS revocation when adversarially probing vendors we depend on; (b) no scoop-monitoring/kill protocol; (c) judge drift confounds our own judge-based methods (sweep-01 names it for the field, never turns it inward — see U-D20); (d) IRB costs never quoted (U-E2); (e) no external review loop for the program's own outputs — an eval-methodology program with no eval of itself. **Settle:** write the failure-mode register with a mitigation or explicit acceptance per item; recruit ≥1 external reviewer for pilot write-ups.

---

*Last full revision: 2026-07-08. Next revision due: at the close of the current phase (shortlist gate — see [04-topic-selection-process.md](04-topic-selection-process.md)).*
