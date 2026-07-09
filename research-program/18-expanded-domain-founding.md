# 18 · Expanded-Domain Founding — 17 opportunities outside the original five

*Written 2026-07-09. Plain-English, like [doc 16](16-pilot-candidates.md) — NOT the dense research-log
style. This answers a question you asked directly: **"would it help to expand our domains?"** The short
answer is **yes**, and this doc is the concrete reason why, plus an initial list of 17 places to look
(the original 15 plus 2 added 2026-07-09 from a founder-scout pass — see #16–17).*

> **What this is and isn't.** This is a **breadth-first initial list** — 17 opportunities, each lightly
> checked (I note the nearest existing player for every one so you can see the gap is real), but **none of
> them deep-vetted yet.** It's meant for you to react to and narrow. The deep "has anyone already done
> exactly this / is the data really free / would the buyer really pay" pass comes *after* you pick favorites
> — that's guardrail #2 (understand before choosing), and these new domains are genuinely less understood
> than the original five. Don't treat any score or claim here as settled.

---

## Why expand — the honest reason in three paragraphs

The original five domains (RAG faithfulness, drug-safety eval, human-oversight decay, code-review, safety
benchmarks) are **measurement / science domains.** They're excellent for what they are: they let you build a
cheap, skill-perfect *public artifact* and get hired or cited into a great seat. But look at where they all
landed in [doc 16](16-pilot-candidates.md): almost every one says **"hire → found upside,"** not "found."
The reason was specific and it kept repeating — the thing you build is a *benchmark* or a *measuring stick*,
and the only remaining moat on a measuring stick is **institutional trust** (will a regulator, a court, or an
enterprise take a solo's number seriously). That's a wall money can't buy at ≤$500. It's a wall you climb by
being cited for years. Great for a career; slow and indirect for founding a company.

Founding upside lives somewhere else: in **builder / product domains.** The tell is simple — instead of
publishing a number *about* someone's system, you ship a *product* that sits *inside* their workflow and does
a job for them. Your exact skills (eval / LLM-as-judge, data pipelines, classical ML for calibration, small-
model fine-tuning) are unusually well-matched to a specific, currently-hot product shape: **the reliability
layer for AI-in-production.** Everyone is shipping LLM apps and agents in 2026; almost nobody has the layer
that catches when they're silently wrong, repairs them, or proves to a buyer they worked. That layer *is*
eval-plus-data-plus-tuning turned into a product — which is what you do.

And the moat changes shape in a way that favors a solo. In the science domains the moat was trust you can't
buy. In these product domains the moat is **compounding proprietary data** — the correction stream, the
disagreement corpus, the outcome-labeled log that only you see because you're in the loop. That's a moat you
*earn by shipping*, not by being famous, and it gets deeper every day the product runs. That's the real
argument for expanding: same skills, a shape that builds a product, and a moat a solo can actually own.

Nine new domains are represented below, grouped loosely: **vertical-AI reliability, dev/agent infrastructure,
data products, applied fine-tuning, workflow vertical agents, embedded reliability products, AI-native ops,**
and a couple of **adjacent wildcards** (the SMB voice-agent world). All 17 lean on the same core loop you
already own: *measure it → the corrections become data → the data trains a cheaper model → repeat.*

---

## The 17 at a glance

"Novelty" is a rough flag, not a verdict: **open** = I found no funded player doing this specific thing;
**wedge-exists** = adjacent players exist but the specific angle (usually independent / cross-vendor /
self-serve) looks unclaimed. Both still need the real scoop check after you pick.

*#16–17 were added 2026-07-09 from a later founder-scout pass — two more liability-bearing "independent
verifier" shapes in the same family as SecondRead (#2) / FieldProof (#12). They're in the table and briefs
below but are **not yet folded into the "How to narrow" picks** at the bottom; treat them as new candidates
still awaiting the deep-vet pass.*

| # | Name | Domain | Who pays | Moat | Novelty | One-line |
|--:|---|---|---|---|:--:|---|
| 1 | **OverturnDB** | vertical-AI-reliability | Independent clinics, ASCs, small RCM/billing firms | Outcome-labeled citation-win dataset | open | Which payer-policy citation actually overturns which denial, learned from clinics' own win data |
| 2 | **SecondRead** | vertical-AI-reliability | Carriers, MGAs, TPAs, RCM & ops teams | Cross-vendor disagreement corpus | wedge-exists | A vendor-agnostic "second reader" that catches silent extraction errors any one vendor misses |
| 3 | **CompatMatrix** | dev-agent-infra | AI-app / agent teams with real API spend | Cross-customer model-transition break-patterns | open | Predicts which prompts break on a model upgrade and pins a validated compatibility matrix |
| 4 | **SnapJudge** | dev-agent-infra | High-volume AI-app / agent teams | Trace-to-judgment corpus + re-distill loop | wedge-exists | Compresses your expensive LLM-judge into a cheap fast per-customer classifier, kept fresh |
| 5 | **GroundTruth Streams** | data-products | Fintech / reg-tech / health AI teams, small labs | Continuous un-backfillable accumulation | open | Public structured feeds (SEC XBRL first) packaged into model-ready QA/eval corpora with judges |
| 6 | **VerifierWorks** | data-products | Labs & vertical-AI teams doing RL post-training | Un-backfillable graded reasoning traces | open | Domain verifiers + graded traces for RL-with-verifiable-rewards beyond math/code |
| 7 | **ToolTamer** | applied-finetuning | AI-agent builders, MCP-server publishers | Real malformed→repaired call triples + hot-path lock-in | open | In-path middleware that validates and repairs bad agent tool/MCP calls in <100ms |
| 8 | **SafetyHarvest** | applied-finetuning | Small/mid pharma, generics, device, CROs | FAERS self-labels + coder-correction stream | wedge-exists | A small-model pharmacovigilance co-pilot for the under-served PV long tail |
| 9 | **PayoutPal** | workflow-vertical-agents | Vet groups & specialty hospitals | Un-backfillable carrier denial/appeal outcomes | open | Cross-carrier veterinary claims + denial-appeals agent with a pre-submit judge |
| 10 | **LedgerLoop** | workflow-vertical-agents | Bookkeeping firms, multi-entity SMBs | Firm-specific coding-correction stream + lock-in | wedge-exists | A self-correcting AP/GL-coding agent that auto-posts the confident ones, escalates the rest |
| 11 | **RailKit** | embedded-reliability-product | Seed / pre-seed AI-native founders | Cross-domain correction/override corpus | wedge-exists | English-configured drop-in output-validation SDK for founders priced out of Galileo |
| 12 | **FieldProof** | embedded-reliability-product | Fintech / AP-automation & finance-ops teams | Field-level correction ledger (calibration) | wedge-exists | A pipeline-agnostic verifier that grades *someone else's* invoice extraction per-field |
| 13 | **Kappa** | ai-native-ops | AI-native teams gating releases on evals | Cross-customer judge-vs-human drift stream | open | A platform-agnostic "referee's referee" that alerts when your LLM-judge rots |
| 14 | **Proofpoint** | adjacent-wildcard | White-label voice-agent agencies / resellers | Labeled good-vs-botched call corpus + report lock-in | open | Independent per-call QA + branded client-proof reports that kill reseller churn |
| 15 | **Callsmith** | adjacent-wildcard | SMB voice-agent vendors & multi-location businesses | Outcome-labeled transcript→business-result corpus | open | Grades AI-handled calls by business *result* and tunes any bot to convert more |
| 16 | **CrossCheck** | vertical-AI-reliability | Importers of record, customs brokers, trade-compliance teams | Cross-vendor + audit-outcome defensibility corpus (CROSS-grounded) | wedge-exists | Independent, CROSS-grounded verifier scoring whether a 10-digit HTS code survives a "reasonable-care" audit — not self-scored |
| 17 | **CreditProof** | vertical-AI-reliability | R&D tax-credit firms, CPA firms, mid-market self-filers | Disallowance-pattern corpus (Tax Court + RCCATG) + graded-narrative→outcome stream | wedge-exists | Grades a completed Form 6765 Section G narrative against audit-survival probability per business component — a grader, not a doc generator |

---

## The briefs

Each is short on purpose — problem, product shape, who pays, the solo-buildable moat, why your skills are the
wedge, the nearest player + how you'd get past them, and the first cheap step.

### 1 · OverturnDB — which citation overturns which denial
**Domain:** vertical-AI-reliability · **Novelty:** open

- **The problem.** Independent clinics get insurance claims denied constantly and appeal blind — they don't
  know which specific payer-policy section actually *overturns* a given denial. The knowledge exists only as
  scattered win/loss experience, never pooled.
- **The product.** Paste a denial, get back the highest-overturn-probability payer-policy section, an evidence
  checklist, and a draft appeal — with a live "win-rate by citation, by payer, by code" model underneath that
  learns from every reported outcome.
- **Who pays.** Independent clinics, specialty practices, ASCs, and small RCM/billing firms — per-seat
  subscription (~$200–800/mo), plus later aggregated win-rate benchmarks sold to RCM and market-access buyers.
- **The moat.** A compounding, *un-backfillable* outcome-labeled dataset of "which citation overturns which
  denial." Top-down policy-text vendors and free tools structurally never see the outcomes.
- **Your wedge.** Bullseye for your stack: data pipeline + classical ML on overturn probability, an LLM to
  extract sections and draft, eval to report predicted-vs-actual lift — and the labels are *mined* from public
  overturn letters, so no manual annotation.
- **Nearest player + wedge.** Counterforce (free/grant, no data flywheel), Cohere Health (payer-side),
  Claimable (only ~28 conditions), MD Clarity / RLDatix (top-down policy text). **Wedge:** own the bottom-up
  outcome-labeled citation-win dataset for the underserved independent-clinic segment nobody monetizes. A live
  CMS-0057-F regulatory tailwind makes mining this tractable right now.
- **First step (<$500).** Scrape public denial-overturn letters for one high-denial specialty (rheumatology or
  GLP-1/oncology), build a first citation→outcome map, hand-validate a slice, and offer 5 clinics a free
  best-citation lookup in exchange for reporting outcomes.

### 2 · SecondRead — the independent second reader
**Domain:** vertical-AI-reliability · **Novelty:** wedge-exists

- **The problem.** Teams run one extraction/claims vendor and trust its self-reported confidence — but a
  single vendor can't tell you when *it* is silently wrong, and those silent errors are the expensive ones.
- **The product.** A drop-in API: send a document plus your primary vendor's extraction, and it runs an
  *independent* extraction + judge plus a classical disagreement detector, returning calibrated agree/disagree
  with page-grounded evidence — routing only real disagreements to a human, with an audit-log export.
- **Who pays.** Carriers, MGAs, TPAs, RCM teams, mid-market ops teams (one or more extraction vendors) — per
  document verified or a monthly platform fee; plus vertical-AI vendors who white-label it.
- **The moat.** A compounding cross-vendor corpus of real disagreement cases (where vendor A was wrong and
  why) — which no single vendor can assemble, because each only sees its own outputs.
- **Your wedge.** Squarely your lane: classical-ML disagreement/confidence modeling, LLM-as-judge for the
  second read, eval to calibrate the route-to-human threshold, labels mined from corrected-claim histories.
- **Nearest player + wedge.** Extend / Box / Iteration Layer / TurboLens ship self-graded *per-vendor*
  confidence; FurtherAI / Pibit / Indico do the extraction itself. **Wedge:** the independent, cross-vendor
  "two engines must agree" verifier that works on 100% of vendors and complements rather than competes. Rides
  the NAIC governance mandate.
- **First step (<$500).** Grab public/scanned ACORD or claims-form samples, run two independent extractions,
  hand-build a small labeled disagreement set, and turn "we caught N silent errors your single vendor missed"
  into a one-page ROI demo for 3–5 MGAs/RCM shops.

### 3 · CompatMatrix — the model-migration co-pilot
**Domain:** dev-agent-infra · **Novelty:** open

- **The problem.** Every time a model provider ships a new version, teams built on that model discover — in
  production — that some prompts and agents silently break. There's no way to know *before* cutover.
- **The product.** Point it at your prompts/agents; it predicts break-risk (tool-call rate, structured-output
  validity, refusal/length shifts) before you migrate, auto-drafts adapted prompts with measured side-by-side
  diffs, and pins a compatibility matrix so the *next* release is cheap.
- **Who pays.** AI-app and agent teams (seed–Series B) with real API spend whose product sits on a third-party
  model — per-app subscription + per-migration upgrade report; later, model providers as migration-assist
  partners.
- **The moat.** A cross-customer corpus of observed model-transition break-patterns. It's un-backfillable
  (only capturable *live* during a transition) and deepens with every customer and release.
- **Your wedge.** Your LLM-as-judge work is exactly a behavioral-delta detector for "subtly wrong but well-
  formatted" output; data-pipeline + XGBoost build the break-risk predictor over prompt features; the corpus
  is generated by real upgrades, not annotation.
- **Nearest player + wedge.** Azure AI Foundry model-upgrade eval (single-tenant, no cross-customer corpus),
  DSPy (a framework — needs a metric, has no data), migration playbooks (just content). **Wedge:** verified
  whitespace — no funded startup owns migration-as-a-managed-service with a data moat. First mover to
  accumulate the transition corpus owns the category.
- **First step (<$500).** Pick two real transitions, collect 100–200 public prompts/scaffolds, run each
  through both models, catalog which patterns break and how, and publish a free "will your prompts survive the
  upgrade?" scanner as top-of-funnel.

### 4 · SnapJudge — distill the expensive judge
**Domain:** dev-agent-infra · **Novelty:** wedge-exists

- **The problem.** High-volume teams want to judge every output inline, but a strong LLM-judge on every turn
  is too slow and too expensive — so they judge a sample and fly blind on the rest.
- **The product.** Use a strong LLM-judge to label a sample of a customer's traces, then train and host a
  *small* classifier that reproduces the judgment in milliseconds at ~1/100th the cost — inline on 100% of
  traffic — and continuously re-distill as data and models drift.
- **Who pays.** High-volume AI-app / agent teams (Series A+) whose per-turn judge bill and latency budget
  can't absorb inline judging — usage-based per-million-turns + a per-customer training/refresh fee; also OEM
  to observability platforms.
- **The moat.** Compounding data *plus* velocity: a cross-customer corpus of trace→judgment pairs warm-starts
  each new customer, and the continuous re-distillation loop is embedded infra that's painful to replace.
- **Your wedge.** Arguably your tightest fit: LLM-as-judge (teacher), fine-tuning/distillation (student),
  XGBoost (fast classifier), data pipelines (ingest + re-distill) — and your published judge-reliability
  awareness lets you calibrate against the noisy teacher.
- **Nearest player + wedge.** Confident AI / Arize / Braintrust / Langfuse ship LLM-judge online scoring as a
  *platform feature*; Cleanlab does generic calibrated scoring. **Wedge:** specialized "compress YOUR judge
  into a cheap, fresh, per-customer model" as the product — and sellable OEM to the very incumbents who'd
  otherwise absorb it.
- **First step (<$500).** On one public trace dataset, distill a strong judge into a small classifier, publish
  the cost/latency/agreement curve, and ship the distillation recipe as OSS as the funnel to the hosted
  refresh service.

### 5 · GroundTruth Streams — public feeds as AI-ready corpora
**Domain:** data-products · **Novelty:** open

- **The problem.** There's a wealth of structured public data (SEC XBRL, FAERS, and more) that's perfect raw
  material for grounded QA, reasoning, and hallucination evals — but nobody packages it into model-ready form,
  so every team re-does the cleaning.
- **The product.** A pipeline that ingests each filing period of a structured public stream, cleans and links
  it, and emits grounded QA pairs, numerical-reasoning traces, and hallucination eval cases with Claude-
  authored judges — sold as a *versioned, continuously-updated* recurring feed.
- **Who pays.** Fintech / reg-tech AI teams, financial-analysis LLM builders, pharmacovigilance/health-data AI
  teams, and small labs — recurring subscription (~$1–6k/mo) for a corpus that stays fresh.
- **The moat.** A continuous, un-backfillable **accumulation clock**: a competitor starting a year later
  permanently lacks your accumulated, structured, linked history and derived artifacts.
- **Your wedge.** Directly matches your stated preference for labels from structured public data (you named
  FAERS and XBRL specifically): pure data-pipeline + cleaning/linking, plus LLM-as-judge to make eval cases.
  No annotation, no infra.
- **Nearest player + wedge.** XBRL US / Bloomberg / S&P sell *raw* structured data to analysts; Gretel /
  Mostly do privacy synthesis. **Wedge:** nobody packages these specific public streams into AI-ready
  reasoning/eval corpora with judges — you sell the transformation + judge layer, not raw redistribution.
- **First step (near-zero cost).** Ingest one quarter of SEC XBRL, generate ~500 grounded numerical-QA +
  hallucination-eval pairs with Claude judges, release a free Hugging Face sample, and pitch a recurring feed
  to one fintech-AI team.

### 6 · VerifierWorks — domain verifiers for RL
**Domain:** data-products · **Novelty:** open

- **The problem.** RL-with-verifiable-rewards (RLVR) is hot, but it only works where you can *verify* an
  answer — so it's stuck on math and code. Regulated verticals (fintech, healthcare-ops, legal, tax) have no
  verifiers, so labs can't RL-post-train models there.
- **The product.** Per domain: a verifier (deterministic where possible, LLM-judge otherwise) that grades
  reasoning traces against structured ground truth mined from public sources, plus a growing bank of
  graded/reference reasoning traces — sold as a data+verifier package.
- **Who pays.** Model labs and vertical-AI teams doing post-training/RL in regulated domains, and enterprises
  fine-tuning internal reasoning models — larger deal sizes (~$15–50k) that plug straight into a training run.
- **The moat.** Un-backfillable graded traces and a verifier that gets more accurate with every case; the
  first mover on a domain's verifier becomes *the reference scorer everyone trains against*.
- **Your wedge.** A verifier is fundamentally an eval / LLM-as-judge artifact — the same thing as your RAG-
  hallucination judging, extended to reasoning-trace grading. Mining FAERS/XBRL/tax ground truth is your
  preferred data mode, and no large-scale RL is required on your end.
- **Nearest player + wedge.** RLVR groups (DeepScaleR, Skywork OR1) are math/code and non-commercial; Prime
  Intellect / Deeptune build *environments*, not domain verifiers-as-data. **Wedge:** no named company sells
  domain verifiers + graded reasoning traces for regulated verticals.
- **First step (<$500).** Pick tax or financial-compliance reasoning (public, checkable ground truth), build a
  narrow-task verifier + 150 graded reference traces, publish verifier-vs-human accuracy on a held-out sample,
  then sell the package to a vertical-AI team.

### 7 · ToolTamer — repair malformed agent tool calls
**Domain:** applied-finetuning · **Novelty:** open

- **The problem.** Agents call tools and MCP servers constantly, and a meaningful fraction of those calls are
  malformed — wrong arguments, schema violations — which either fails silently or forces an expensive frontier
  round-trip to fix. This is the point of maximum pain in the 2026 agent wave.
- **The product.** A drop-in SDK that intercepts every tool/function/MCP call, validates arguments against the
  JSON schema, *repairs* malformed calls with a tiny fine-tuned model (instead of a frontier round-trip), and
  ships a live tool-call failure taxonomy dashboard.
- **Who pays.** AI-agent builders and AI-native startups shipping agents in production, plus MCP-server
  publishers who want a "verified reliable" badge — usage-based API + per-seat repair dashboard.
- **The moat.** An un-backfillable stream of real schema/attempted-call/error/corrected-call triples that
  nobody else structures, fused with hot-path workflow lock-in as the system of record for agent reliability.
- **Your wedge.** Your exact wedge: corrections self-generate from retries and schema validation (no
  annotation), LLM-as-judge scores repair quality, tiny repair models are core tuning, and pipelines turn the
  trace firehose into clean triples.
- **Nearest player + wedge.** Confident AI / Latitude / Adaline *diagnose*; TokenMix / n8n *route and retry*.
  **Wedge:** nobody owns a fine-tuned in-path *repair* model plus the proprietary correction corpus — this is a
  specific runtime, not the training console a horizontal fine-tuning vendor would build.
- **First step (near-zero cost).** Build the interceptor for MCP + one framework, scrape 200–500 public MCP
  schemas, fuzz them into malformed/repair pairs, fine-tune a 1–3B repair model, and publish an OSS npm/pip
  package that logs anonymized failures (distribution + data intake in one).

### 8 · SafetyHarvest — pharmacovigilance for the long tail
**Domain:** applied-finetuning · **Novelty:** wedge-exists

- **The problem.** Pharmacovigilance (PV) — coding adverse-event reports, flagging seriousness, writing
  narratives — is legally mandated recurring work, but the enterprise suites are far too heavy and expensive
  for small pharma, generics, device, and OTC/supplement companies. The long tail is underserved.
- **The product.** Ingest a raw adverse-event report; a small fine-tuned model suggests MedDRA terms, flags
  seriousness, checks duplicates, and drafts an E2B(R3)-ready narrative — with a human-in-the-loop review UI
  that becomes the coder's daily system of record.
- **Who pays.** Small/mid pharma, generics, medical-device, OTC/supplement companies, and CROs doing contract
  PV — priced far below enterprise suites as per-case or per-seat SaaS.
- **The moat.** FAERS/VigiBase coded fields as un-backfillable *self-labels* to seed the model, then a private
  stream of coder accept/edit corrections plus the audit trail regulators require.
- **Your wedge.** Directly matches your stated FAERS preference: data-pipeline + multi-label classification
  (near XGBoost) for MedDRA coding, LLM-as-judge for narrative quality, small-model tuning — labels
  self-sourced from coded reports.
- **Nearest player + wedge.** ArisGlobal / Veeva / Merative / Alomana target enterprise pharma with heavy
  suites. **Wedge:** the neglected self-serve-priced long tail those incumbents are structurally too heavy to
  serve — and FAERS is de-identified public data, so the seed data is clean. A Christensen-style bottom-up
  entry into a regulation-mandated spend (~$200–500M/yr per big pharma).
- **First step (<$500).** Download a FAERS quarter, align coded MedDRA fields to narrative text into a
  self-labeled dataset, fine-tune a small model to predict Preferred Terms, and publish an accuracy write-up to
  attract a first small-pharma/CRO design partner.

### 9 · PayoutPal — veterinary claims + appeals agent
**Domain:** workflow-vertical-agents · **Novelty:** open

- **The problem.** Vet insurance claims are fragmented across carriers, denials are common, and clinics appeal
  by hand if at all. There's no third-party, cross-carrier claims+appeals tool built for the *clinic* (as
  opposed to the insurer's in-house engine).
- **The product.** An embedded agent that pulls invoice/diagnosis/treatment from the clinic's PIMS, maps to
  each carrier's schema, submits, triages denials, and drafts carrier-specific appeals — with a pre-submit
  LLM-judge scoring each claim against that carrier's real rejection patterns.
- **Who pays.** Multi-location veterinary groups/consolidators and mid-size independent/specialty hospitals —
  SaaS seat + per-claim fee, or a contingency on recovered/appealed revenue; beachhead is high-volume
  emergency/specialty hospitals.
- **The moat.** Every submission plus its accept/deny/appeal outcome, keyed to carrier + procedure code +
  wording, becomes a private, un-backfillable denial-prediction and appeal-language dataset nobody else
  structures.
- **Your wedge.** Your LLM-as-judge-for-hallucination work maps onto "will this claim be denied, and why";
  denial reasons are real-world labels mined from EOB responses; XGBoost predicts denial risk, an LLM drafts,
  the judge scores before send.
- **Nearest player + wedge.** Toothy / dentalrobot / Ventus (dental), Trupanion / Lemonade (insurer-side
  in-house engines), Instinct / ezyVet (charge capture). **Wedge:** no third-party, cross-carrier veterinary
  claims+appeals agent *for the clinic* exists — the gap is real and open. It's the exact shape VCs already
  funded in adjacent dental/human-health markets.
- **First step (<$500).** Cold-outreach 5–10 emergency/specialty hospitals for 200–500 historical claims with
  accept/deny outcomes, build the denial-predictor + appeal-drafter, and show one hospital recovered dollars
  from re-appealing past denials.

### 10 · LedgerLoop — self-correcting AP/GL-coding agent
**Domain:** workflow-vertical-agents · **Novelty:** wedge-exists

- **The problem.** Bookkeeping firms hand-code every invoice to the right GL account. Horizontal AP tools
  don't know a vertical's chart-of-accounts and can't tell when they're unsure, so humans re-check everything.
- **The product.** An agent that ingests invoices, proposes GL coding, and runs an LLM-judge + XGBoost
  confidence model to *auto-post* high-confidence entries and *route only uncertain ones* to a human — learning
  each firm's coding conventions and holding the correction history.
- **Who pays.** Bookkeeping / outsourced-accounting firms and multi-entity SMBs in one vertical (start
  veterinary, dental, or restaurants — standardized chart-of-accounts) — per-entity SaaS or per-transaction.
- **The moat.** Every human correction is a gold label tuning the firm-specific model (an un-backfillable
  coding-decision stream), and once it holds a firm's conventions, switching means re-teaching from scratch.
- **Your wedge.** Corrections are real-world labels mined automatically (no annotation); XGBoost on
  transaction features for confidence, LLM for messy invoice text, LLM-judge for auto-post vs escalate — your
  whole stack in one loop.
- **Nearest player + wedge.** Ramp / Bill.com / Vic.ai / Glean (horizontal AP), Choco / Burnt (food
  order-entry, not AP-coding). **Wedge:** none combines a *vertical* chart-of-accounts with a calibrated "knows
  when it's unsure" auto-post/escalate judge for bookkeeping firms. Bookkeeping firms are a repeatable,
  referenceable buyer with clear labor-cost math and land-and-expand across a client book.
- **First step (<$500).** Get one outsourced-bookkeeping firm to share 1–2k historical invoices with final GL
  codes, train the coder + confidence model, measure auto-post accuracy at a fixed escalation budget, and show
  hours saved on a held-out month.

### 11 · RailKit — guardrails for the solo non-ML founder
**Domain:** embedded-reliability-product · **Novelty:** wedge-exists

- **The problem.** Solo, non-ML founders shipping AI-native vertical SaaS are exposed to hallucination
  liability (the Air Canada / Cursor cases), but the real guardrail platforms are enterprise-priced and shaped
  for ML teams they don't have.
- **The product.** The founder describes their domain in natural language and connects their app; RailKit
  auto-generates a domain-specialized LLM-judge + cheap-classifier ensemble that scores each output for
  grounding/policy/hallucination *before* it ships, blocks or routes low-confidence outputs, and logs every
  block.
- **Who pays.** Seed / pre-seed AI-native vertical SaaS founders (self-serve $99–$499/mo, seat/volume
  expansion), later their design partners' compliance teams — a distinct, reachable, underserved *new* buyer
  segment.
- **The moat.** The correction/override stream captures un-backfillable (input, bad output, corrected output,
  domain) triples across many small vertical customers into a cross-domain failure corpus a new entrant can't
  replicate without the install base.
- **Your wedge.** Almost exactly your published RAG-hallucination LLM-as-judge work turned into a product; your
  edge is judge-design + tuning + eval, plus using accumulating correction data to fine-tune cheap classifiers
  that cut per-call cost.
- **Nearest player + wedge.** Galileo (enterprise-priced, ML-team-shaped), Patronus (post-hoc), Guardrails AI
  (OSS, needs an engineer), Noveum (voice/agent-QA reseller). **Wedge:** a self-serve, English-configured,
  correction-data-flywheel guardrail for the solo non-ML founder is open — and willingness to pay is already
  priced in (hallucination-loss insurance exists).
- **First step (<$500).** Pick one starter vertical (AI support/policy answers, where Air Canada / Cursor
  liability is sharpest), build a thin SDK that wraps an outbound call and blocks ungrounded answers, and
  recruit 3–5 seed support-bot startups for free pilots in exchange for their block/override logs.

### 12 · FieldProof — grade someone else's extraction
**Domain:** embedded-reliability-product · **Novelty:** wedge-exists

- **The problem.** Finance-ops and fintech teams run their *own* invoice/financial-doc extraction pipeline and
  don't want a new platform — they want to know, per field, whether the extraction is right, and to review only
  the risky ones.
- **The product.** Send the source doc + extracted fields and get back a per-field *calibrated* correctness
  probability, a specific "this field is likely wrong because…" flag, and a review queue for only the risky
  fields. Pydantic-schema-native, sits *beside* the existing pipeline, and does no extraction itself.
- **Who pays.** Fintech / AP-automation startups and finance-ops teams running their own extraction who need a
  verifier, not a new platform — $500–$5k/mo tied to documents verified.
- **The moat.** The field-level correction ledger: every review decision is a labeled (doc region, wrong value,
  right value) pair that fixes mis-calibrated confidence — un-backfillable from live review streams.
- **Your wedge.** Squarely your lane: LLM-as-judge for the semantic "does this value match the source" check,
  plus XGBoost on layout/confidence features for cheap calibrated per-field risk; review queues generate the
  labels, so no annotation.
- **Nearest player + wedge.** Box Extract / Extend / TurboLens ship confidence but sell the whole *extraction
  platform*. **Wedge:** the independent, pipeline-agnostic "we grade YOUR pipeline, you keep it" verifier, with
  best-in-class calibration from the correction ledger, isn't clearly owned. Large AP/finance budget with
  quantifiable ROI.
- **First step (<$500).** Build the verifier for invoices using public invoice datasets to baseline
  calibration, pipe 2–3 AP-automation startups' extractions through it free, and produce the single chart: does
  your calibrated score beat raw model confidence at catching wrong fields?

### 13 · Kappa — the judge-trust layer
**Domain:** ai-native-ops · **Novelty:** open

- **The problem.** Teams gate releases on eval scores from LLM-judges — but judges silently *rot* (rubric
  drift, model swaps), so the score feeding the exec dashboard can quietly stop meaning anything, and nobody
  notices until it's wrong.
- **The product.** Sits on top of whatever eval stack they use; ingests judge outputs + a thin human-label
  stream, maintains the versioned gold set, runs kappa/agreement on a schedule, detects drift, alerts below the
  reliability bar, and auto-suggests rubric fixes or a judge-model swap — with a per-judge trust badge.
- **Who pays.** AI-native startups and product teams (Series A–C) gating releases on eval scores under
  compliance/board pressure, plus platform teams whose eval scores feed exec dashboards — seat + usage; buyer
  is the eng lead / head of AI.
- **The moat.** The paired judge-verdict + human-label-disagreement stream across customers and rubric types,
  letting you predict miscalibration *before* a customer's gold set catches it.
- **Your wedge.** This *is* your published work — LLM-as-judge for RAG hallucination is literally a
  judge-reliability study. Kappa/agreement math, gold-set curation from existing labels, and the calibration
  runner are the whole product.
- **Nearest player + wedge.** Galileo Autotune/Annotations and Braintrust / Confident AI bundle calibration
  *inside a full platform you must adopt wholesale*. **Wedge:** a standalone, platform-agnostic "referee's
  referee" with cross-customer drift *prediction* as the product — not already built. Recurring high-anxiety
  pain (release gating + compliance) = durable subscription.
- **First step (<$500).** Build an OSS judge-drift monitor CLI (point at judge outputs + a small gold set,
  compute kappa, flag drift, print a rubric-fix suggestion), seed it with your existing RAG-hallucination judge
  data, and use inbound as the design-partner funnel.

### 14 · Proofpoint — QA + proof reports for voice-agent resellers
**Domain:** adjacent-wildcard · **Novelty:** open

- **The problem.** White-label voice-agent agencies resell bots to SMBs and bleed 15–25% monthly churn because
  they can't prove to their clients the bot is actually working — and they're non-technical, so they can't
  build QA themselves.
- **The product.** Ingest call recordings/transcripts, run a per-vertical LLM-as-judge rubric (booking
  captured? intent misheard? emergency mishandled? tone?), and output a weekly *branded* proof report the
  agency forwards to its client, plus an alert feed of the worst calls to fix prompts.
- **Who pays.** White-label voice-agent agencies/resellers buying retention (~$50–150/mo per managed client, or
  a flat platform fee), eventually SMBs directly — saving even 2 accounts pays for itself against their churn.
- **The moat.** Every scored call becomes a labeled corpus of good-vs-botched SMB service calls by vertical
  (un-backfillable), training sharper vertical judges — and the weekly report becomes the agency's renewal
  system-of-record.
- **Your wedge.** Exactly LLM-as-judge + eval-methodology + data-pipeline (your published RAG-hallucination
  study): per-vertical rubrics, judge calibration against human labels, and a transcription-to-score pipeline.
  No novel architecture.
- **Nearest player + wedge.** Hamming / Coval / Cekura are *engineering-team* tools (CLI/MCP/enterprise, for
  AI-native customers); Trillet / Ringlyn ship thin dashboards. **Wedge:** nobody sells client-facing proof
  reports + independent per-call grading to *non-technical resellers* — the reseller channel is the open lane
  into a $4.6B virtual-receptionist market.
- **First step (<$200).** Recruit 3–5 voice-AI resellers from agency Discords/Skool, get 200 real call
  recordings from one, hand-label them, build a single-vertical (dental) judge agreeing >85% with labels, ship
  a one-page weekly PDF, and see if they forward it to a client.

### 15 · Callsmith — grade calls by business result, then tune
**Domain:** adjacent-wildcard · **Novelty:** open

- **The problem.** SMBs run AI phone agents but have no idea which calls *lost bookable revenue* or why — the
  vendors only see call metadata, not the CRM outcome, so nobody can grade or improve the bot on the metric
  that matters (conversions).
- **The product.** Sits on call/CRM data, matches each AI-handled call to its CRM outcome (booked? job created?
  no-show? never contacted?), runs an LLM-judge to attribute *why* a call didn't convert, and produces a ranked
  list of prompt/routing fixes + a monthly conversion-lift report — later auto-A/B-testing tuned prompts per
  vertical.
- **Who pays.** SMB-focused voice-agent vendors and multi-location service businesses (dental groups,
  home-services franchises, DSOs) wanting more inbound conversion with proof — priced per-location/mo as an
  optimization + reporting add-on.
- **The moat.** An outcome-labeled corpus linking call transcript to business result per vertical — which
  vendors seeing only call metadata can't reproduce — becoming the training signal for vertical prompt-tuning
  and the client's conversion system-of-record.
- **Your wedge.** Best *full-arc* fit — combines data-pipeline, LLM-as-judge (attribution scoring), AND
  prompt-tuning in one "eval → data → tuning" loop you own end to end. No novel architecture.
- **Nearest player + wedge.** Thoughtly / MyAIFrontDesk / Voksha / Aloware sell the answering bot and CRM
  writes; Coval / Hamming target engineers. **Wedge:** no independent outcome-labeled QA + tuning loop that
  grades and improves *any* bot on business conversion — open lane; position vendor-agnostic. Highest-ROI SMB
  AI category, with a concrete conversion-lift pitch.
- **First step ($100–$300).** Land one multi-location dental or HVAC client already running an AI phone agent,
  pull 2–4 weeks of recordings + their booking calendar, hand-attribute outcomes, and show the 10 calls that
  lost bookable revenue plus 3 prompt fixes that measurably lift booking.

### 16 · CrossCheck — the independent HTS classification-defensibility verifier
**Domain:** vertical-AI-reliability · **Novelty:** wedge-exists

- **The problem.** The importer of record bears strict "reasonable care" liability for every 10-digit HTS
  classification, yet even the best fine-tuned models get only ~40% of 10-digit codes right — and CBP just
  drew a bright line: Headquarters ruling **HQ H350722 (2026-01-16)** holds that an AI tool assigning a code
  *tied to a specific entry* is "customs business" requiring a licensed broker, while general classification
  *research / verification disconnected from a specific entry, with a disclaimer,* is permissible. Meanwhile
  CBP audits are up **67% YoY** ($134M recovered in the first four months of 2025; **42% of penalties** trace
  to misclassification), and every classification vendor only self-scores its own confidence — nobody offers
  an independent, cross-vendor second read.
- **The product.** Paste a proposed 10-digit code + product description (from any vendor, broker, or in-house)
  and get back an *independent* CROSS-grounded classification with GRI reasoning, a calibrated defensibility
  probability, the closest supporting and contradicting public rulings, and a "reasonable care" documentation
  packet — deliberately framed as classification research/verification *disconnected from a specific entry*
  with a disclaimer, staying on the legal side of H350722.
- **Who pays.** Mid-market importers of record (who carry the liability), customs brokers wanting a cheap
  second check, corporate trade-compliance teams, and 3PLs — per-classification-verified or a monthly
  compliance subscription; later, aggregated "defensibility by chapter / by vendor" benchmarks.
- **The moat.** A compounding cross-vendor + audit-outcome corpus: which vendor's 10-digit read disagreed with
  the CROSS-grounded independent read, and which reading actually *survived* a ruling or audit —
  un-backfillable, and structurally invisible to any single vendor that only sees its own outputs.
- **Your wedge.** Squarely your lane: LLM-as-judge for the independent read + GRI-reasoning grounding,
  classical calibration (XGBoost) on defensibility probability, and a data pipeline over CROSS's **220,989
  public rulings** (1989–present, on data.gov; third-party scrapers like Apify exist) — labels *mined* from
  public rulings, no manual annotation.
- **Nearest player + wedge.** TariffLens, Gaia Dynamics (only $1.5M pre-seed, Andrew Ng's AI Fund), and
  Camtom/TariffPro all self-score their *own* confidence. **Wedge:** the independent, vendor-agnostic
  defensibility verifier grounded in CROSS that complements rather than competes — riding two live tailwinds
  (the H350722 ruling that legitimizes exactly this research/verification posture, plus the 67% audit surge).
  Distinct from SecondRead (#2, insurance-claims extraction) and FieldProof (#12, invoice fields): different
  document, different ground truth, different buyer.
- **First step (<$500).** Scrape a slice of CROSS (data.gov / Apify) for one high-audit chapter (textiles /
  apparel or electronics), build the GRI-grounded independent classifier + defensibility scorer, hand-validate
  against held-out rulings, and offer 3–5 mid-market importers a free "is this code defensible?" check on
  recent entries in exchange for outcome feedback.

### 17 · CreditProof — the R&D-credit audit-survival grader
**Domain:** vertical-AI-reliability · **Novelty:** wedge-exists

- **The problem.** IRS Form 6765 **Section G becomes mandatory** for most filers starting **tax year 2026** —
  you must itemize ≥80% of qualified research expenses (QREs) by business component, up to 50 components — and
  the IRS now runs **129 AI audit use cases** (up from 54). Documentation must be *contemporaneous*;
  retroactive reconstruction fails on audit. Firms and CPAs can *generate* the narratives, but nobody tells
  them whether a completed narrative would actually *survive*.
- **The product.** Feed a completed Section G business-component narrative + QRE allocation and get back a
  calibrated **audit-survival probability per component**, the specific weaknesses flagged (a missing
  four-part-test element, a vague technological-uncertainty statement, an unsupported wage/QRE allocation)
  grounded in real disallowance patterns, and a suggested fix — a defensibility **grader**, not another doc
  generator.
- **Who pays.** R&D tax-credit specialty firms and consultancies, CPA firms filing 6765, and mid-market
  companies self-filing — per-study or per-component, sold as disallowance-risk reduction on a credit that is
  now mandatorily itemized *and* AI-audited.
- **The moat.** A structured "what got disallowed and why" corpus mined from Tax Court opinions (George's of
  Missouri, TC Memo 2026-10; Smith v. Commissioner, TC Memo 2026-50) and the IRS **Research Credit Claims
  Audit Techniques Guide (RCCATG)**, plus an un-backfillable stream of graded-narrative → actual-audit-outcome
  pairs that no doc generator captures.
- **Your wedge.** Your published RAG-grounding-judge shape applied to audit survival: LLM-as-judge scoring
  narrative-vs-four-part-test, classical calibration on survival probability, and a data pipeline over public
  Tax Court opinions + the RCCATG — labels mined from published outcomes, zero manual annotation.
- **Nearest player + wedge.** CodeROI automates Section G *doc generation* for software; nobody sells a
  defensibility *grader* that scores a finished narrative against audit-survival probability. **Wedge:** the
  independent second-opinion layer that sits on top of *any* doc-generation workflow (CodeROI's output
  included) and grades it against real disallowance patterns — complements rather than competes, with the
  mandatory-Section-G + AI-audit surge as the tailwind.
- **First step (<$500).** Scrape published Tax Court R&D-credit opinions + the RCCATG, build a four-part-test
  defensibility rubric + grader for one component type (software), hand-validate against held-out
  allowed-vs-disallowed cases, and offer 3–5 R&D-credit firms a free "would this narrative survive?" score on
  a redacted past study.

---

## How to narrow

The whole list rhymes because it's the same engine — *measure → corrections become data → data trains a
cheaper model → repeat* — pointed at nine different buyers. To pick, I'd weigh three things: **how tight the
skill fit is, how open the lane looks, and how cheap/fast the first proof is.** On those, five stand out.

- **Kappa (#13)** — the purest expression of your published work; a judge-reliability study *is* the product,
  the first step is an OSS CLI seeded with data you already have, and the lane (standalone, platform-agnostic
  drift *prediction*) is open. Lowest activation energy of the fifteen.
- **RailKit (#11)** — your RAG-hallucination judge turned into a product for a genuinely new, reachable buyer
  (solo non-ML founders) with willingness to pay already priced in. The correction-flywheel moat is real and
  the pilot is free (pilots in exchange for logs).
- **ToolTamer (#7)** — sits in the biggest 2026 buyer wave (agents) at the point of maximum pain, with a
  self-generating correction corpus (no annotation) and near-zero first-step cost via an OSS package that
  doubles as data intake. Uses your full stack including small-model tuning.
- **Callsmith (#15)** — the only one that exercises your *entire* arc (data + judge + tuning) in a single loop,
  on the highest-ROI SMB category, with an outcome-labeled moat vendors structurally can't reproduce. Slightly
  more services-flavored to start, but that's a feature for cheap validation.
- **GroundTruth Streams (#5)** — the lowest-effort, near-zero-cost, part-time-cadence bet that matches your
  stated love of structured public data (XBRL/FAERS) exactly, with an accumulation-clock moat that compounds on
  autopilot. A safe "always-on" background project even if you pick a bigger swing.

Honorable near-misses: **SnapJudge (#4)** (tightest technical fit — LLM-judge → distilled classifier — but
"wedge-exists," so the scoop check matters more) and **SecondRead / FieldProof (#2, #12)** (clean
independent-verifier shapes, likely competing against incumbent platform features).

**The honest caveat (guardrail #2).** These nine new domains are **less understood than the original five.**
Doc 16's candidates were adversarially killed and prior-work-checked to the paper level; the seventeen here are
breadth-first with only a nearest-player note each. Every "open" flag is a *hypothesis*, not a finding —
markets move fast and a funded player may already exist that I didn't surface. So the plan is unchanged from
how we've worked: **you react and narrow to 3–5**, and *then* I do the real study on the winners — the deep
scoop check, a genuine buyer-willingness test, the data-actually-free check, and a first-step pre-registration
— before you commit a single week to any of them.

**Next step:** tell me which of these pull at you (energy is the real tiebreaker, same as doc 16), and I'll
run the deep-vetting pass on those.
