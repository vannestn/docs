# Problem 01 — AI's Environmental Footprint: The Measurement & Transparency Layer

*Researched July 2026. Grounded in the internal map doc
[`energy-and-sustainability.md`](../../ai-research-map/07-data-systems-hardware/energy-and-sustainability.md)
(verified against primary sources), extended with web research. Claims marked ⚠️ are unverified or
from secondary sources only; everything else was read on the linked page this session.*

---

## The problem, concretely

AI's physical footprint — electricity, water, carbon, hardware waste — is growing fast enough to move
national grids, but **almost nobody outside the operating companies can measure it**, and the public
numbers that exist are not comparable with each other.

**What's at stake, with numbers:**

- **Energy/grid.** The IEA projects global datacenter electricity roughly **doubling to ~945 TWh by
  2030** (~3% of global use), AI the main driver ([IEA Energy & AI](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)).
  This is already visible in prices: in PJM's Dec 2025 capacity auction, **data-center load was ~40%
  (~$6.5B) of the $16.4B capacity cost** ([Utility Dive](https://www.utilitydive.com/news/data-centers-pjm-capacity-auction/808951/)),
  and Harvard's Electricity Law Initiative documents rate structures and **secret utility–datacenter
  contracts** shifting Big Tech's power costs onto ordinary ratepayers
  ([Martin & Peskoe 2025](https://eelp.law.harvard.edu/extracting-profits-from-the-public-how-utility-ratepayers-are-paying-for-big-techs-power/)).
- **Carbon accounting games.** The Guardian calculated that 2020–2022 emissions from Google, Microsoft,
  Meta, and Apple's own datacenters were likely **~662% higher than officially reported**, because
  companies report "market-based" figures laundered through renewable-energy certificates instead of
  location-based grid reality ([Guardian analysis, via TechInformed](https://techinformed.com/data-centre-emissions-over-660-more-than-meta-microsoft-google-and-apple-report/)).
- **Water.** Per-query water figures span **~30–150× depending on boundary** (Google's measured 0.26 mL
  on-site vs. Li/Ren's 10–50 mL including off-site generation water vs. Mistral's 45 mL marginal figure
  — map doc, verified). Mytton found US datacenters use ~1.7B liters/day and **fewer than a third of
  operators even track water** ([npj Clean Water 2021](https://www.nature.com/articles/s41545-021-00101-w)).
- **E-waste.** One modeling study projects generative AI adds **1.2–5.0 Mt of cumulative e-waste
  2020–2030**, reducible 16–86% via circularity ([Wang et al., Nature Computational Science 2024](https://www.nature.com/articles/s43588-024-00712-6)).
- **The opacity core.** The US GAO's technology assessment concluded generative AI's environmental
  effects "are uncertain and not well understood" chiefly because **"companies are generally not
  reporting details"** of energy and water use ([GAO-25-107172, Apr 2025](https://www.gao.gov/products/gao-25-107172)).
  Per Hugging Face, **15 of the top 20 most-used models on OpenRouter are closed-source and zero closed
  vendors have submitted models for energy benchmarking**
  ([AI Energy Score call-to-action](https://huggingface.co/blog/sasha/energy-score-call-to-action)).

**Measurable sub-problems** (each is a viable study unit): per-query operational energy of closed
models; boundary-consistent water accounting; embodied/manufacturing carbon (only two vendor anchors
exist — Google TPU LCA [arXiv:2502.01671](https://arxiv.org/abs/2502.01671) and the
[NVIDIA H100 PCF](https://images.nvidia.com/aem-dam/Solutions/documents/HGX-H100-PCF-Summary.pdf), on
different hardware); the reasoning/agentic energy multiplier; grid-cost attribution; e-waste flows;
and *comparability itself* — median vs mean, marginal vs average, market- vs location-based, GPU-only
vs full facility.

---

## The research field around it

Small, interdisciplinary, methodologically contested — the *measurement methodology* is as disputed as
the numbers. Sub-areas, methods, maturity:

| Sub-area | Method | Maturity |
|---|---|---|
| **Per-query inference energy (open models)** | Direct GPU metering on owned/rented hardware: [CodeCarbon](https://arxiv.org/html/2509.22092v1) (software estimator), [Zeus](https://pytorch.org/blog/zeus/) (hardware-level, U. Michigan), [ML.ENERGY Benchmark](https://arxiv.org/abs/2505.06371) (NeurIPS 2025), [AI Energy Score](https://huggingface.github.io/AIEnergyScore/) (166+ models, 10 tasks) | **Most mature.** Tooling open-source; leaderboards exist; validation studies emerging ([Ground-truthing CodeCarbon, arXiv:2509.22092](https://arxiv.org/html/2509.22092v1)) |
| **Per-query energy (closed models)** | (a) First-party production telemetry — only Google has published one, with methodology ([arXiv:2508.15734](https://arxiv.org/abs/2508.15734), 0.24 Wh median); (b) black-box estimation from API behavior + inferred hardware ([Jegham et al., arXiv:2505.09598](https://arxiv.org/abs/2505.09598); [Epoch AI](https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use)) | **Immature.** One methodology-backed vendor number; OpenAI's 0.34 Wh is a CEO blog claim without methodology; black-box estimates have a single validation anchor |
| **Training/lifecycle LCA** | Full life-cycle assessment: [Strubell et al. 2019](https://aclanthology.org/P19-1355/) (training CO₂ estimation), [BLOOM LCA](https://jmlr.org/papers/v24/23-0069.html) (embodied + dynamic + idle), Mistral's third-party-reviewed 18-month LCA ([Mistral 2025](https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai/)) | **Method exists, coverage tiny.** ~3 public model-level LCAs total |
| **Macro demand estimation** | Top-down (IEA) vs bottom-up (chip shipments — de Vries); meta-review of estimate quality ([Mytton & Ashtine, Joule 2022](https://www.cell.com/joule/fulltext/S2542-4351(22)00358-0): 258 estimates, 46 publications, 43% reliant on private IDC data, 11% broken source links) | **Bounded but noisy**; systematic provenance defects documented |
| **Water** | Indirect modeling (electricity→water intensity + WUE): [Li et al./Ren, "Making AI Less Thirsty"](https://arxiv.org/abs/2304.03271) (CACM 2025); adversarial critique: [Mytton, "Overestimating AI's water footprint"](https://www.devsustainability.com/p/overestimating-ais-water-footprint) | **Contested.** Active methodological dispute between the two main researchers |
| **Grid/ratepayer economics** | Regulatory-docket analysis ([Harvard ELI](https://eelp.law.harvard.edu/extracting-profits-from-the-public-how-utility-ratepayers-are-paying-for-big-techs-power/) reviewed ~50 proceedings), auction data (PJM) | **New (2024–25)**, mostly legal scholarship + journalism |
| **E-waste** | Material-flow scenario modeling ([Wang et al. 2024](https://www.nature.com/articles/s43588-024-00712-6)); a 2026 recalibration exists ([Resources, Conservation & Recycling](https://www.sciencedirect.com/science/article/pii/S0921344926000960) ⚠️ paywalled, not opened — title only) | **Thinnest sub-area**: essentially one primary model + one critique |
| **Rebound / net effects** | Socio-economic rebound taxonomy ([Luccioni, Strubell & Crawford, FAccT 2025](https://arxiv.org/abs/2501.16548)) | **Conceptual only** — the paper's core claim is that the field *lacks a measurement framework* for net effects |
| **Policy/standards** | EU AI Act GPAI docs must include "estimated or known energy consumption" — to authorities, not public ([EC guidelines](https://digital-strategy.ec.europa.eu/en/faqs/guidelines-obligations-general-purpose-ai-providers)); US [AI Environmental Impacts Act](https://www.congress.gov/bill/119th-congress/senate-bill/4727/text) (NIST measurement consortium + voluntary reporting) reintroduced **June 9, 2026** ([Markey](https://www.markey.senate.gov/news/press-releases/senator-markey-rep-beyer-reintroduce-ai-environmental-impacts-act)), not passed | **Pre-standards.** No mandatory public per-query or lifecycle disclosure anywhere yet |

Publication venues: FAccT (measurement + critique), Joule (commentary/macro), NeurIPS D&B
(benchmarks), CACM, npj journals, and the dedicated
[HotCarbon workshop on sustainable computer systems](https://hotcarbon.org/) (4th edition, Cambridge
2025) — a small venue explicitly for early-stage work.

---

## Who does this work

**Individuals (the field is strikingly individual-driven):**
- **Sasha Luccioni** — AI & Climate lead at Hugging Face; CodeCarbon co-creator, BLOOM LCA, Power
  Hungry Processing, AI Energy Score lead ([announcement](https://huggingface.co/blog/sasha/announcing-ai-energy-score)). Company-employed but the output is public-interest tooling.
- **Emma Strubell** — CMU professor; founded the field with the 2019 NLP energy paper; co-author on
  most of Luccioni's measurement work. Academic/grant funding.
- **Shaolei Ren** — UC Riverside; created the AI-water topic with 3 co-authors
  ([Making AI Less Thirsty](https://arxiv.org/abs/2304.03271)). Academic.
- **David Mytton** — Oxford researcher + independent
  [dev/sustainability newsletter](https://www.devsustainability.com/); the field's in-house skeptic
  (datacenter water 2021, the 258-estimate meta-review, critiques of Ren's water numbers). Shows the
  independent/newsletter model works.
- **Alex de Vries** — was a *part-time PhD candidate* (VU Amsterdam) running
  [Digiconomist](https://www.cell.com/joule/fulltext/S2542-4351(23)00365-3) as a side project; his solo
  Joule commentary set the global AI-energy news agenda in 2023.
- **Mosharaf Chowdhury + Jae-Won Chung** — U. Michigan [ML.ENERGY](https://ml.energy/) lab; Zeus,
  leaderboard, benchmark. Academic + open-source.
- **Kate Crawford** — USC; the rebound/critical-studies flank (FAccT 2025).

**Organizations:** [IEA](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)
(intergovernmental); [Epoch AI](https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use)
(nonprofit, independent estimates); [GAO](https://www.gao.gov/products/gao-25-107172) (government
watchdog); Hugging Face + [Salesforce + Cohere + CMU](https://www.salesforce.com/news/stories/ai-energy-score/)
(AI Energy Score coalition); [Harvard EELP/Electricity Law Initiative](https://eelp.law.harvard.edu/extracting-profits-from-the-public-how-utility-ratepayers-are-paying-for-big-techs-power/)
(law school program); journalism desks — [MIT Technology Review](https://www.technologyreview.com/2025/05/20/1116327/ai-energy-usage-climate-footprint-big-tech/)
(6-month "We did the math" investigation), the Guardian.

**Funding models observed:** academic grants (Strubell, Ren, Chowdhury); company-hosted public research
(Luccioni at HF, Google's own paper); nonprofit (Epoch); government (GAO; NIST if the Markey bill
passes); independent/media (Mytton's newsletter, de Vries' Digiconomist); philanthropic-adjacent law
programs (Harvard ELI).

**How outsiders contribute:** submit measurements via the AI Energy Score
[benchmarking portal](https://huggingface.github.io/AIEnergyScore/); contribute to open-source tooling
(CodeCarbon, [Zeus](https://pytorch.org/blog/zeus/)); replicate/critique published estimates (the
Mytton model — his Joule meta-review began as blog-level source-checking); HotCarbon accepts
early-stage 6-page papers; regulatory dockets and GAO/NIST consortium processes take public input.
Notably: **no credential gate** — the two most-cited individual measurers (de Vries, Mytton) built
standing through persistent public work, not lab affiliation.

---

## Published exemplars

1. **[Energy and Policy Considerations for Deep Learning in NLP](https://aclanthology.org/P19-1355/)** —
   Strubell, Ganesh & McCallum, ACL 2019 ([arXiv:1906.02243](https://arxiv.org/abs/1906.02243)).
   **3 authors**, one university lab. Founded the entire field by simply multiplying training hours ×
   hardware power × grid intensity for a handful of NLP models. Proof that a first-mover measurement
   paper with modest methods can define a research area.
2. **[The growing energy footprint of artificial intelligence](https://www.cell.com/joule/fulltext/S2542-4351(23)00365-3)** —
   de Vries, Joule 2023. **Solo author**, part-time PhD student. A short commentary using public chip
   shipment data and back-of-envelope scenarios ("AI-powered Google search ≈ Ireland's electricity")
   that drove global press coverage ([EurekAlert](https://www.eurekalert.org/news-releases/1003775)).
3. **[Sources of data center energy estimates: A comprehensive review](https://www.cell.com/joule/fulltext/S2542-4351(22)00358-0)** —
   Mytton & Ashtine, Joule 2022. **2 authors.** Meta-science: audited 258 estimates and their 676
   sources, showing 43% depended on private IDC data and 11% of links were dead. Mattered because it
   made *estimate quality* itself the research object — code public on
   [GitHub](https://github.com/davidmytton/paper-dc-energy-review).
4. **[Making AI Less "Thirsty"](https://arxiv.org/abs/2304.03271)** — Li, Yang, Islam & Ren, 2023 →
   [CACM 2025](https://cacm.acm.org/sustainability-and-computing/making-ai-less-thirsty/). **4 authors.**
   Created AI-water accounting from public WUE disclosures and electricity-water intensity factors
   (GPT-3 training: ~700k L on-site, ~5.4M L total). Every subsequent water number argues with it.
5. **[Power Hungry Processing: Watts Driving the Cost of AI Deployment?](https://arxiv.org/abs/2311.16863)** —
   Luccioni, Jernite & Strubell, FAccT 2024. **3 authors.** First systematic *task-level* inference
   measurement (~88 models); showed generative multi-purpose models cost orders of magnitude more than
   task-specific ones. Template for the rented-GPU benchmarking study.
6. **[How Hungry is AI?](https://arxiv.org/abs/2505.09598)** — Jegham et al., 2025. **5 authors**,
   no big-lab affiliation visible. Black-box, "infrastructure-aware" estimation of 30 *closed* API
   models (API performance data + inferred hardware + environmental multipliers); found a 65×
   efficiency spread. The main published attempt at the closed-model problem — and methodologically
   attackable, which is an invitation.
7. **[E-waste challenges of generative artificial intelligence](https://www.nature.com/articles/s43588-024-00712-6)** —
   Wang et al., Nature Computational Science 2024. Small team; first quantification of AI e-waste
   (1.2–5.0 Mt cumulative by 2030) via material-flow scenarios. Opened a sub-field that still has
   essentially one primary model.
8. **[Data center emissions probably 662% higher than big tech claims](https://techinformed.com/data-centre-emissions-over-660-more-than-meta-microsoft-google-and-apple-report/)** —
   Guardian, Sept 2024. Journalists re-deriving location-based emissions from companies' own filings.
   Mattered because it quantified the REC/market-based accounting gap — a data-analysis exercise, not
   privileged access.

---

## Where the gaps are

Specific and named, each grounded in a source read this session:

1. **Closed-model per-query energy is unverifiable.** Zero closed-source vendors have submitted to the
   AI Energy Score despite a secure Docker submission path; 15/20 top-used models are therefore
   unmeasured ([HF call-to-action](https://huggingface.co/blog/sasha/energy-score-call-to-action)).
   Only Google has published a methodology-backed production number
   ([arXiv:2508.15734](https://arxiv.org/abs/2508.15734)); OpenAI's 0.34 Wh is an unmethodologized CEO
   claim; Anthropic has published no per-query figures and — ⚠️ per a third-party tracker, unverified —
   no Scope 1/2/3 emissions as of March 2026 ([azvai.com](https://azvai.com/en/is-claude-sustainable/)).
2. **Black-box estimation has exactly one validation anchor.** Jegham et al.'s API-side method
   ([arXiv:2505.09598](https://arxiv.org/abs/2505.09598)) and Epoch's estimate can only be sanity-checked
   against Google's single disclosed median. No published work systematically validates black-box
   methods against ground truth across model classes.
3. **The reasoning/agentic multiplier is measured per-query, not per-task.**
   [AI Energy Score v2](https://huggingface.co/blog/sasha/ai-energy-score-v2) (Dec 2025) found reasoning
   modes use ~30× more energy on average, 150–700× in individual cases — but nobody publishes energy
   *per completed task* for agentic workloads, the unit that actually matters as agents replace chat.
4. **Water methodology is an open two-person dispute.** Ren's off-site-inclusive estimates vs. Mytton's
   [critique of overestimation](https://www.devsustainability.com/p/overestimating-ais-water-footprint);
   Google notes most operators don't report WUE at all (map doc). No adjudicating study exists.
5. **Embodied carbon has two non-comparable vendor anchors and no independent check** — Google TPU LCA
   vs NVIDIA H100 PCF, different hardware, both first-party (map doc, verified). Memory (HBM/DRAM) is
   the fastest-growing manufacturing hotspot with essentially no outside scrutiny.
6. **Estimate provenance rot.** Mytton & Ashtine showed the macro-estimate literature runs on private
   market data and dead links ([Joule 2022](https://www.cell.com/joule/fulltext/S2542-4351(22)00358-0));
   no one has repeated that audit for the post-ChatGPT (2022–2026) wave of AI-specific estimates.
7. **Net-effects/rebound has no measurement framework** — the explicit core claim of
   [Luccioni, Strubell & Crawford FAccT 2025](https://arxiv.org/abs/2501.16548).
8. **E-waste is a one-model field.** Wang et al. 2024 plus a paywalled 2026 recalibration
   ([RCR](https://www.sciencedirect.com/science/article/pii/S0921344926000960) ⚠️ not opened); no
   empirical tracking of actual GPU retirement/secondary-market flows.
9. **No disclosure mandate has teeth yet.** EU AI Act requires energy info only in technical
   documentation to authorities ([EC](https://digital-strategy.ec.europa.eu/en/faqs/guidelines-obligations-general-purpose-ai-providers));
   the US bill ([S.4727](https://www.congress.gov/bill/119th-congress/senate-bill/4727/text)) proposes
   *voluntary* reporting and was only reintroduced June 2026. GAO confirms the resulting data vacuum
   ([GAO-25-107172](https://www.gao.gov/products/gao-25-107172)).

---

## What a solo researcher could do here

Concrete study shapes matching the profile (laptop + free tiers + ≤$500 GPU + API budget; strengths in
pipelines, LLM tuning, eval methodology). Facts and precedents only — no ranking.

1. **Validate black-box energy estimation against the one ground truth.** Reproduce/extend the
   [Jegham et al.](https://arxiv.org/abs/2505.09598) API-side methodology, then test it against Google's
   published 0.24 Wh median + boundary breakdown ([arXiv:2508.15734](https://arxiv.org/abs/2508.15734))
   and against direct Zeus/CodeCarbon measurements of the same open-weights models served locally.
   Cost: API credits + one rented GPU. Precedent that validation-of-estimators is publishable:
   [Ground-Truthing CodeCarbon (arXiv:2509.22092)](https://arxiv.org/html/2509.22092v1).
2. **Energy-per-completed-task benchmark for agentic workloads.** Run open reasoning/agent models on a
   rented GPU with [Zeus](https://pytorch.org/blog/zeus/)/[ML.ENERGY Benchmark](https://arxiv.org/abs/2505.06371)
   instrumentation and report Wh per *solved task* (not per token), across reasoning-budget settings.
   Directly extends the [AI Energy Score v2](https://huggingface.co/blog/sasha/ai-energy-score-v2)
   30×/150–700× finding into the unit nobody publishes. This is benchmark/eval design — the profile's
   published strength.
3. **A "boundary crosswalk" for public footprint numbers.** Build a dataset + conversion layer that
   restates every published per-query figure (Google median/Comprehensive-vs-Existing, Mistral marginal,
   Altman, Epoch, Jegham, AI Energy Score entries) on common boundaries (accelerator-only ↔
   full-facility ×1.72, median↔mean, on-site↔lifecycle water). The map doc shows figures differ by
   orders of magnitude purely from boundary choice; no crosswalk exists. Pure data-pipeline work, zero
   compute cost.
4. **Repeat the Mytton & Ashtine audit for the AI era.** Systematic provenance/methodology review of
   post-2022 *AI-specific* footprint estimates, following the published
   [258-estimate protocol](https://www.cell.com/joule/fulltext/S2542-4351(22)00358-0)
   ([code on GitHub](https://github.com/davidmytton/paper-dc-energy-review)). Two authors did the
   original; it required no compute and became the field's quality reference.
5. **LLM-assisted mining of utility regulatory dockets.** Harvard ELI manually reviewed ~50 proceedings
   to expose datacenter cost-shifting ([Martin & Peskoe](https://eelp.law.harvard.edu/extracting-profits-from-the-public-how-utility-ratepayers-are-paying-for-big-techs-power/));
   public-docket text is voluminous and unmined at scale. An LLM-extraction pipeline with a rigorous
   eval harness (the profile's LLM-as-a-judge experience maps directly onto validating extraction
   accuracy) could track contract terms, load forecasts, and rate-shift mechanisms continuously.
6. **Independent e-waste recalibration from shipment data.** Rebuild Wang et al.'s material-flow model
   using public GPU shipment figures (e.g., NVIDIA's 3.7M GPUs in 2024, per the FAccT 2025 paper) and
   published refresh-cycle assumptions; publish the model open-source. The sub-field has one primary
   model and one (paywalled) critique — a reproduction with sensitivity analysis is a real contribution
   (XGBoost/classical-modeling skill set, no GPU needed).

---

## What we still don't know (program ledger)

- **Actual per-query energy/water of GPT- and Claude-class closed models** — no methodology-backed
  disclosure exists outside Google's single paper.
- **Whether Anthropic has any internal or forthcoming environmental disclosure** — ⚠️ absence claimed
  only by third-party trackers; also ⚠️ unverified reports of confidential S-1 filings that could force
  disclosure ([search-result claim only](https://azvai.com/en/is-claude-sustainable/)).
- **Whether black-box API estimation is accurate** — one anchor point; unknown generalization.
- **True sector totals** — top-down (IEA) vs bottom-up buildout sums still diverge (map doc); the
  post-2022 estimate literature hasn't been audited.
- **Which water boundary regulators will adopt**, and who's right in the Ren–Mytton dispute.
- **Embodied-carbon numbers for non-Google, non-NVIDIA hardware** (AMD, TPU-competitors, HBM supply
  chain) — nothing public.
- **Net effect after rebound** — no framework exists (FAccT 2025's explicit claim).
- **Fate of the AI Environmental Impacts Act of 2026** (reintroduced 2026-06-09, not passed) and
  whether EU AI Act energy documentation ever becomes public.
- **Production agentic-workload energy** — all published numbers predate large-scale agent deployment.
- **Contents of the 2026 e-waste recalibration paper** — paywalled, unread (⚠️).

---

## Fit notes

The field's central activity — designing standardized, reproducible measurements of systems whose
operators won't share internals — is structurally the same problem as the profile's published
LLM-as-a-judge/RAG-hallucination evaluation work, and its flagship artifacts (AI Energy Score,
ML.ENERGY leaderboard) are benchmark/leaderboard projects. Cost structure matches the constraints:
the solo/small-team exemplars above (de Vries, Mytton, Strubell 2019, Guardian analysis) used public
data, API access, or single-node GPU measurement — all within a laptop + ≤$500-GPU + API budget.
Data-pipeline and classical-ML skills apply directly to the estimate-audit, crosswalk, docket-mining,
and material-flow study shapes. Publication routes used by outsiders include Joule commentaries, FAccT,
NeurIPS D&B, [HotCarbon](https://hotcarbon.org/), and independent newsletters with demonstrated field
influence.
