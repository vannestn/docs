# Resource Profiles — The Resource-Reality Layer

*Consolidated July 2026. This is the evidence layer behind the index's **D3 (Budget fit)**
dimension — and, where the binding constraint turns out to be time or access rather than
money, an input to **D2 (Solo tractability)** and **Confidence** too. Every price carries an
opened source; every domain profile rests on its brief in [briefs/](.). Claims marked ⚠️ are
unverified. Prices move — see the "dated claims" note under the cost basis; the weekly radar
([cluster C](../06-radar-design.md)) flags any change >2× to a planned study's cost.*

For a **part-time, solo, ≤$500/study** researcher (the [charter's](../00-goals-and-operating-principles.md)
constraints), the deciding question about a domain is rarely "is it interesting" — it's
**what does a credible study actually cost in money, hardware, wall-clock, and access?** Six
resource realities gate that answer: *hardware class* (laptop vs free-tier GPU vs rented single
vs multi-GPU), *iteration speed* (how long one experiment cycle takes, and whether it fits ≤15
hrs/wk), *supply exposure* (how much a GPU spot spike, an API price hike, or a dataset takedown
can derail the plan), *data availability & quality*, *power/run-time*, and the *all-in cost
range*. This document works those six realities out, domain by domain, so the index can apply
them as concrete D3/Confidence adjustments rather than guesses.

---

## Cost basis (July 2026)

**Dated claims — read this first.** Every figure below was sourced early July 2026 from an
opened URL. GPU marketplace rates and API prices move fast (Vast.ai spot can swing 2× in a
week; frontier-API prices reprice on releases). Treat these as a *July-2026 snapshot*, not a
standing truth. The radar's [cluster C](../06-radar-design.md) exists to catch drift: it flags
GPU spot prices, API price/quota changes, free-tier changes, and dataset-access changes, and
alarms on anything that moves a planned study's cost by **>2×**.

### GPU rental (on-demand, per GPU-hour)

| SKU | Provider | USD/hr | Source |
|---|---|---|---|
| RTX A6000 48GB | RunPod | $0.49 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| RTX 4090 24GB | RunPod | $0.69 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| L40S 48GB | RunPod | $0.99 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| A100 80GB PCIe | RunPod | $1.39 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| A100 80GB SXM | RunPod | $1.49 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| H100 PCIe / SXM | RunPod | $2.89 / $3.29 | [runpod.io/pricing](https://www.runpod.io/pricing) |
| A100 40GB | Lambda | $1.99 | [lambda.ai/pricing](https://lambda.ai/pricing) |
| GH200 96GB | Lambda | $2.29 | [lambda.ai/pricing](https://lambda.ai/pricing) |
| A100 80GB SXM (8×) | Lambda | $2.79 / GPU | [lambda.ai/pricing](https://lambda.ai/pricing) |
| H100 SXM | Lambda | $4.29 (1×) / $3.99 (8× per-GPU) | [lambda.ai/pricing](https://lambda.ai/pricing) |
| RTX 4090 24GB | Vast.ai (marketplace) | ~$0.31–0.35 (verified hosts) | [vast.ai/pricing](https://vast.ai/pricing) |
| A100 80GB | Vast.ai (marketplace) | ~$0.67 (when available) | [vast.ai/pricing](https://vast.ai/pricing) |
| H100 80GB SXM | Vast.ai (marketplace) | ~$0.90–1.87 (demand-dependent) | [vast.ai/pricing](https://vast.ai/pricing) |

### Frontier & open-model API pricing (per M tokens, input / output)

| Model | Input | Output | Source |
|---|---|---|---|
| Claude Opus 4.8 | $5.00 | $25.00 | [claude.com/pricing](https://claude.com/pricing) (claude-api skill, cached 2026-06-04) |
| Claude Sonnet 4.6 | $3.00 | $15.00 | [claude.com/pricing](https://claude.com/pricing) |
| Claude Haiku 4.5 | $1.00 | $5.00 | [claude.com/pricing](https://claude.com/pricing) |
| OpenAI GPT-5.5 | $5.00 ($0.50 cached; $2.50 batch) | $30.00 ($15.00 batch) | [developers.openai.com/api/docs/pricing](https://developers.openai.com/api/docs/pricing) |
| OpenAI GPT-5.4 | $2.50 ($0.25 cached; $1.25 batch) | $15.00 ($7.50 batch) | [developers.openai.com/api/docs/pricing](https://developers.openai.com/api/docs/pricing) |
| OpenAI GPT-5.4 Mini | $0.75 ($0.075 cached) | $4.50 | [developers.openai.com/api/docs/pricing](https://developers.openai.com/api/docs/pricing) |
| OpenAI GPT-5.4 Nano | $0.20 ($0.02 cached) | $1.25 | [developers.openai.com/api/docs/pricing](https://developers.openai.com/api/docs/pricing) |
| Google Gemini 2.5 Pro | $1.25 (≤200k) / $2.50 (>200k) | $10.00 / $15.00 | [ai.google.dev/gemini-api/docs/pricing](https://ai.google.dev/gemini-api/docs/pricing) |
| Google Gemini 2.5 Flash | $0.30 (text) / $1.00 (audio) | $2.50 | [ai.google.dev/gemini-api/docs/pricing](https://ai.google.dev/gemini-api/docs/pricing) |
| Google Gemini 2.5 Flash-Lite | $0.10 (text) | $0.40 | [ai.google.dev/gemini-api/docs/pricing](https://ai.google.dev/gemini-api/docs/pricing) |
| Llama 3.3 70B (Together) | $1.04 | $1.04 | [together.ai/pricing](https://www.together.ai/pricing) |
| Llama 3.3 70B (DeepInfra) | $0.35 | $0.40 | [deepinfra.com/pricing](https://deepinfra.com/pricing) |
| gpt-oss-120B (DeepInfra/Together) | $0.15 | $0.60 | [together.ai/pricing](https://www.together.ai/pricing); [deepinfra.com/pricing](https://deepinfra.com/pricing) |
| DeepSeek V4 Flash (DeepInfra) | $0.09 | $0.18 | [deepinfra.com/pricing](https://deepinfra.com/pricing) |

**Two levers cut API spend hard:** batch APIs cut Anthropic/OpenAI ~50% for non-latency-
sensitive eval/judge runs; prompt caching drops repeated-context input to ~0.1×. And a cheap
open host (gpt-oss-120B at $0.15/$0.60, DeepSeek V4 Flash at $0.09/$0.18) is **10–50× cheaper
than frontier** for eval/judge sweeps where frontier quality isn't the object of study.

### Free tiers

| Tier | What you get | Limits | Source |
|---|---|---|---|
| **Kaggle Notebooks** | T4 16GB / P100 16GB (also TPU v3-8), reliable, no waitlist | **30 GPU-hrs/wk hard quota**, 9-hr session, 20GB disk | [kaggle.com/docs/notebooks](https://www.kaggle.com/docs/notebooks) |
| Google Colab (free) | T4 16GB, sessions up to ~12h | ~15–30 GPU-hrs/wk (dynamic, no guarantee), ~90-min idle kill | [research.google.com/colaboratory/faq](https://research.google.com/colaboratory/faq.html) |
| Hugging Face (free) | CPU Basic Spaces (2 vCPU/16GB), ZeroGPU (H200, quota), ~$0.10/mo inference credits | ZeroGPU ~3.5 min/day auth'd; Spaces sleep after 48h idle; PRO $9/mo → ~$2 credits | [huggingface.co/pricing](https://huggingface.co/pricing) |
| Gemini API free tier (AI Studio) | Free tokens on select models + 5,000 grounding prompts/mo | Low RPM/RPD; prompts used to improve Google products (no privacy) | [ai.google.dev/gemini-api/docs/pricing](https://ai.google.dev/gemini-api/docs/pricing) |

**Free tiers are unreliable for real work — with one exception.** Kaggle's 30 GPU-hrs/wk is
the most dependable free GPU (hard quota, 9-hr sessions, no waitlist) and is the solo
researcher's best free option for inference sweeps and small fine-tunes. Colab's hours are
dynamic and the 90-min idle kill defeats long jobs. HF ZeroGPU is ~3.5 min/day.

### Reference scenario costs

| Scenario | Est. USD | Basis |
|---|---|---|
| Multi-model eval: 4 frontier models × 1k items × 2k in / 500 out | **~$43** std; **~$25–30** batched | Opus $22.50 + GPT-5.4 $12.50 + Gemini Pro $7.50 + DeepInfra Llama70B $0.90 |
| Same eval, one cheap open host (gpt-oss-120B) | **~$0.60** | 2M in ×$0.15 + 0.5M out ×$0.60 — shows the frontier-vs-open gap |
| QLoRA fine-tune 8B, 3 epochs, 50k ex (~10–20 GPU-hrs, fits 24GB) | **$4–7** (Vast 4090) / **$14–28** (RunPod A100) | 8B QLoRA fits a single 4090 |
| Quantized-model sweep: ~8 quant configs of a 13B (~15 GPU-hrs) | **~$5** (Vast 4090) / **~$10–15** (RunPod 4090) | Inference-only, single 24GB card |
| Large LLM-judge run: 20k judgments × 1.5k in / 300 out | **$60** (Haiku) / **$30** (Haiku batch) / **~$5.40** (Gemini Flash-Lite) | 30M in / 6M out |
| nanoGPT-scale pretraining: 124M GPT-2 repro (single A100 ~4d, or 8×A100 ~5h) | **~$130** (single A100) / **~$110** (8×A100) | Priciest solo scenario here — still under cap |
| 70B bf16 inference sweep, 20h (~140GB VRAM) | **$56** (2×A100 RunPod) / **$66** (1×H100 Lambda) | 2× A100 80GB or 1× H100 + offload |
| QLoRA fine-tune 70B (4-bit, fits ~48GB), ~20–40 GPU-hrs | **$28–56** (RunPod A100) / **$66** (H100, 20h) | All comfortably under cap |

### Supply/availability realities

- **Vast.ai is a marketplace.** Listed rates are the *low* end from verified hosts and
  fluctuate with supply/demand; the same H100 can jump ~$0.90 → ~$1.60/hr at peak, and
  unverified hosts add 20–50% effective cost via downtime/restarts. **Budget 30–50% above
  listed rates.**
- **RunPod** splits Secure Cloud (predictable) vs Community Cloud (cheaper, variable);
  serverless per-second billing can beat on-demand for bursty jobs but prices higher per
  active hour.
- **Lambda** is on-demand only (no spot), zero egress fees, per-minute billing — but H100/B200
  capacity is frequently waitlisted, and 1× instances cost *more* per GPU than 8× ($4.29 vs
  $3.99 H100).
- **The binding constraint is usually frontier-API output tokens on large generation runs, not
  GPU rental.** Every reference scenario lands well under $500. A disciplined workflow (Kaggle
  free GPU for fine-tunes/sweeps + batch/cached frontier APIs + open hosts for bulk eval) keeps
  most individual studies in the **$5–70** range.

---

## Comparison table

All 18 candidate domains at a glance. *Hardware class:* the ceiling a typical study needs.
*Iteration speed:* wall-clock per experiment cycle. *Data:* availability. *Cost:* all-in per
credible study. *Supply:* one-word exposure to price/availability/takedown shocks.

| # | Domain | Hardware class | Iteration | Data | Cost range | Supply |
|---|---|---|---|---|---|---|
| 1 | Environmental footprint of AI | rented-single-gpu (much is laptop) | days | open-abundant | $0–70 | low |
| 2 | Model-development bottlenecks | consumer-gpu (5/6 need none) | hours | open-abundant | $0–70 | low |
| 3 | AI supply chain | none-or-laptop | days | open-abundant | $0–75 | very-low |
| 4 | Governance, regulation & geopolitics | api-only (4/6 need no GPU) | days | open-abundant | $0–70 (≤~$150 edge) | very-low |
| 5 | Social impact: labor & economics | none-or-laptop | days | open-abundant | $0–70 (RCT busts cap) | low |
| 6 | Social impact: disempowerment & cognition | api-only | days | open-abundant | $0–70 (RCT $1k–6k+) | low-moderate |
| 7 | Bias & fairness | api-only | hours | open-abundant | $0–70 (~$150 edge) | low-moderate |
| 8 | Model architecture research (small-scale) | consumer-gpu | hours | open-abundant | $5–150 | low-moderate |
| 9 | Agent security & authentication | api-only | hours | must-create | $5–120 | low-moderate |
| 10 | AI development & research tooling | api-only (+ CPU boxes) | hours | open-abundant | $0–70 | low |
| 11 | Agent architectures & orchestration | api-only | hours | open-abundant | $5–300 (pass^k → $500+) | low (API) |
| 12 | Evaluation & benchmarking science | api-only | hours | open-abundant | $0–70 (RCT edge busts) | low |
| 13 | Model behavior science | api-only | days | open-abundant | $0–70 | low (API) |
| 14 | Data science of AI (curation/forensics) | none-or-laptop | hours | open-abundant | $0–70 (ablation busts) | low |
| 15 | Reproduction, replication & meta-science | none-or-laptop | days | open-abundant | $0–70 | very-low |
| 16 | Vertical evaluation & third-party audit | api-only | days | gated-obtainable | $5–120 (expert pay > cap) | low-GPU/high-access |
| 17 | Small/open-model science | free-tier-gpu | hours | open-abundant | $0–70 | low-moderate |
| 18 | Human-AI interaction field studies | none-or-laptop | weeks | gated-obtainable | $0–70 (RCT+IRB $1.7k–2.6k) | low-compute/high-IRB |

Read the trade-offs across, not down: several api-only/laptop domains (3, 4, 12, 13, 14, 15)
are budget-trivial; the domains that break the $500 cap do so through **human subjects + IRB**
(5, 6, 12-edge, 18), **corpus-scale ablation** (14), or **uncapped trial multipliers** (11) —
not through GPU rental. Rows 16 and 18 flag the pattern where the binding resource is *access*
(FOI, IRB, expert time), not dollars — an argument for tempering their D3 while noting it in
D2/Confidence.

---

## Per-domain profiles

### 1. Environmental footprint of AI — `rented-single-gpu` (much is laptop)

**Hardware.** Splits sharply, and the split is the story. Zero-compute studies — the boundary
crosswalk, the Mytton/Ashtine estimate-provenance re-audit, the FERC/PUC docket-mining
pipeline, the e-waste material-flow recalibration — need nothing beyond a laptop; docket mining
and material-flow modeling are the field's most-cited solo formats and used no GPU. The two
energy-*measurement* studies need a rented single GPU (inference-only): an 8B model fits a 24GB
4090/A100; a 70B needs ~140GB (2×A100 / 1×H100+offload). Nuance: the field-standard AI Energy
Score benchmarks on H100, and Zeus GPU-memory power metering needs Hopper+ silicon — so for
leaderboard parity the clean run wants a rented H100 (RunPod $2.89/hr, Vast ~$0.90–1.87/hr),
though method dev works fine on a 4090/A100. Free T4 lacks Hopper power counters.

**Iteration / part-time.** Two clocks. Compute studies iterate in **hours** (metering sweeps,
3× repeats in separate processes to control CUDA-cache residue — an afternoon of wall-clock).
Data studies set the real pace at **days-to-weeks**, gated by scraping/normalizing heterogeneous
FERC PDFs (no bulk API) and hand-building labeled eval sets. **Good fit for ≤15 hrs/wk:** no run
outlives a session, no records queue stalls for months.

**Data.** Open-abundant, but the quality problems *are* the research object: published
footprint numbers are non-comparable (per-query water spans 30–150× by boundary), the
macro-estimate literature runs on dead links and private IDC data, closed-model ground truth is
nearly absent (only Google's 0.24 Wh has methodology). No IRB, no PII, minimal paywalls; real
barriers are structural (no FERC bulk API; API ToS for black-box probing of closed endpoints).

**Supply exposure.** Low. Short single-card inference jobs; a 2–3× Vast swing moves the GPU line
$5 → $30–60, noise against the cap. Dataset-takedown is the notable tail risk (a vendor pulling
a number, a docket portal restructuring), but government dockets and arXiv/HF artifacts are
durable.

**Cost.** $0–70; typical $5–40. Data/pipeline studies ≈ $0 in compute; docket-mining is
LLM-extraction-bound ($5–60); metering sweeps $5–30, rising to ~$56–66 only for a 70B
ground-truth comparison. **Power note:** the one domain where run-time energy is the *subject* —
instrumentation matters more than magnitude, favoring Hopper+ metered cards, but these are short
rented jobs with no local thermal constraint.

**D3 implication: strongly SUPPORTS a high Resource & cost fit — several most-cited shapes need
zero compute, compute-bound ones top out near $70, and access is open with no IRB/credential
gate.**

### 2. Model-development bottlenecks — `consumer-gpu` (5 of 6 shapes need none)

**Hardware.** Bimodal, leaning cheap. Scaling-law forensics (re-fit ScaleRL/Chinchilla-style
curves from published figures), benchmark-lifetime measurement over Epoch data, the
Environments-Hub census, the open training-instability incident dataset, and the
synthetic-contamination index over Common Crawl are all **laptop/CPU** (the Ultra-FineWeb
precedent filtered 15T tokens in ~1,000 CPU-hours). Only the cross-family entropy-collapse RLVR
telemetry shape touches a training GPU — RLVR/GRPO is memory-hungry (policy + rollout +
optimizer at once), so a T4 is marginal even for 1.5B; it wants a rented 24GB+ card or a single
A100-80GB. Nothing approaches the ScaleRL-class multi-thousand-GPU-hour tier (correctly ruled
out by the cap).

**Iteration / part-time.** **Hours** for the laptop shapes; the RLVR matrix (3–5 models × 2–3
recipes ≈ 10–15 runs, hours-to-2-days each) spans days-to-weeks of wall-clock but each run is
cheap. **Excellent part-time fit** for shapes 3–6; RLVR fits too if launched detached.

**Data.** Open-abundant and clean for the audits (METR ships raw eval data; Epoch's Hub is
public; curves re-extractable from figures). Common Crawl is a firehose (~7TB/snapshot WET) so
sample, don't download; the hardest quality problem is a trustworthy synthetic-vs-human labeled
seed. No IRB/PII/paywalls.

**Supply exposure.** Low. Audit shapes have ~zero exposure (laptop + public data); shape 2's
LLM-judge cost is hedged by cheap open hosts; the one GPU shape rides Vast 4090 lows or Kaggle
free. No scarce-H100 dependence.

**Cost.** $0–70, center $5–40. Shapes 4–6 ≈ $0; contamination index near-$0 + a few dollars
bandwidth; Environments-Hub judging $5–60 by model tier; the RLVR matrix ~$30–150 across 10–15
single-card runs. **Power:** immaterial — RLVR runs belong detached on rented cloud, not a
laptop.

**D3 implication: strongly RAISES the score — five of six flagship shapes need no GPU and run on
open public data; the one GPU shape fits a single cheap card well under cap.**

### 3. AI supply chain — `none-or-laptop`

**Hardware.** The rare domain where the best studies need essentially zero compute. Adversarial
re-analysis of CNAS/Epoch smuggling estimates (Monte Carlo/hierarchical modeling), the
export-control DiD/event-study, trade-data anomaly detection on UN Comtrade (laptop XGBoost),
the LLM diversion-case database (API tokens only), and location-verification ping-time
simulation are all **laptop CPU**. The one partial exception — extending Epoch's datacenter
OSINT with a satellite-imagery CNN — fits a **free Kaggle/Colab T4** (Sentinel-2 10m tiles are
small, datasets are hundreds-to-low-thousands of hand-labeled chips). A MacBook is the primary
instrument.

**Iteration / part-time.** **Days** — compute per cycle is trivial (minutes); pacing is human
data-wrangling and OSINT collection (UN Comtrade's 500-calls/day free throttle can stretch a
full pull across days; labeling tiles or curating DOJ indictments is human-hours-heavy;
FOIA/permit requests carry weeks-months latency *if* a study depends on them). **Excellent
part-time fit** — fully interruptible; modeling shapes (1, 5) can publish in a handful of
weekend sessions.

**Data.** Open-abundant but the target quantities are structurally unmeasurable (that's the
opportunity). Verified-open: Epoch GPU Clusters (CC-BY), ETO Chip Explorer, Sentinel-2, UN
Comtrade, DOJ/BIS records. Quality caveats are severe and *are the point*: smuggling volumes
have 5×-order-of-magnitude CIs, Epoch rounds/anonymizes China data, GPUs hide under broad HS
codes, no public datacenter tracker exists outside the US. Low barriers (SemiAnalysis is the
paywalled competitor but not required; no IRB; RAND PDF 403-blocked ⚠️ minor).

**Supply exposure.** Very low to volatile compute factors. GPU swings irrelevant; API price
hikes are a rounding error (only the diversion-extraction shape, hedgeable to open hosts). Real
risk is source-continuity: Epoch/ETO could relicense or further anonymize; DOJ/BIS pages could
reorganize; UN Comtrade could tighten free limits. Reproducibility risk, not cost.

**Cost.** $0–75, most $0–15. Three modeling studies ≈ $0; trade anomaly detection $0; the CNN
$0–10 on free tiers (creeps to ~$50–150 only if buying commercial high-res tasking); the
diversion pipeline $5–60 by model choice. The binding constraint is time, not dollars.
**Power:** immaterial.

**D3 implication: strongly SUPPORTS (raises) — near-zero compute, open-abundant data, all
studies far under $500, fully interruptible; arguably the best-fitting domain for this profile,
with the only frictions being human-curation time and source-continuity risk.**

### 4. Governance, regulation & geopolitics — `api-only` (4 of 6 shapes need no GPU)

**Hardware.** The closest thing to a zero-compute field ("nearly all high-leverage work here is
laptop + API scale"). The statute-anchored disclosure scorecard is pure API + laptop
(LLM-assisted document-coding + human inter-rater validation); the threshold-erosion model and
smuggling-estimate replication are laptop data-science on Epoch's CSV + DOJ mining + Monte
Carlo. Only two shapes touch a GPU, both inference-only and optional: the GPAI-Code →
benchmark mapping (extends COMPL-AI on 3–5 open-weight models — 7–8B fits a free T4, 70B needs
~2×A100/1×H100) and AISI/CAISI eval-reproducibility (re-run a published Inspect eval). Both
collapse to api-only if run against hosted models. The binding tool is a frontier-API key.

**Iteration / part-time.** **Days**, dominated by legal/data-collection labor, not compute:
reading statutes, authoring a defensible rubric, then the slow part — human inter-rater
validation (days of careful reading). FOIA is *not* on the critical path (core inputs are
already public). **Strong part-time fit;** the one hazard is topical half-life (preemption
fights, the Digital Omnibus, DoD-Anthropic litigation are live) — scope tight, ship fast.

**Data.** Open-abundant and unusually clean: Epoch (CC-BY, daily), statutory filings (public by
law), COMPL-AI + UK AISI Inspect/inspect_evals (open). Quality problems are domain-specific: the
smuggling CI spans 5.5× on an unknown detection rate; scorecards may measure "paperwork quality"
with no proven behavioral linkage (construct validity); governance evals have documented
validity issues. **Access barrier flagged:** the *specific* eval transcripts behind flagship
AISI/CAISI results may not be public, so true reproduction may only be possible against
open-weight proxies.

**Supply exposure.** Very low — one of the least-exposed domains. Four shapes use zero GPU; the
two that do are inference-only/optional. API exposure bounded by batch/caching/open-host
substitution. Real risks are non-compute: artifact takedown/access-tightening and policy
volatility making a dataset's referents obsolete mid-study.

**Cost.** $0–70 for five shapes; up to ~$150 only for 70B-class local eval. Scorecard $5–45;
construct-validity/judge audit $5–60; threshold-erosion and smuggling replication ≈ $0; COMPL-AI
extension $5–15 (→ $56–66 for local 70B bf16); AISI repro $5–66. UK AISI Challenge Fund
(£50k–£200k) could fund a scaled version. **Power:** n/a (laptop stays cool; run open-weight
inference on Kaggle, not the laptop).

**D3 implication: strongly RAISES — essentially free to work in (four of six shapes need no GPU
and near-zero API), data is unusually open, pacing is human-reading-bound; ideal for the
laptop + free-tier + ≤15 hrs/wk + ≤$500 profile.**

### 5. Social impact: labor & economics — `none-or-laptop`

**Hardware.** Every shape is laptop/API-scale; no GPU training. The five data-pipeline shapes
(exposure-index horse-race merging Eloundou/Felten/Webb with the Canaries series + BLS
CPS/OEWS; online-labor event studies; the METR-time-horizon → O*NET-wage-bill "capability-to-
labor bridge") are tabular econometrics running on a laptop or free CPU session in minutes. The
LLM-judge audits (auditing the Anthropic Economic Index classifier and GDPval grading) are pure
API; the preregistered RCT's cost is *participant payments*, not compute. Zero use for
A100/H100 time.

**Iteration / part-time.** **Days.** Data-pipeline shapes iterate in minutes-to-hours once
merged; LLM-judge audits in hours (batch adds up to 24h). The RCT is the slow shape —
recruitment runs over days, and preregistration/IRB can add weeks. **Strong part-time fit
except the RCT** (fields while you're away, but demands front-loaded design discipline).

**Data.** Open-abundant: Anthropic Economic Index on HF is CC-BY-4.0 (releases through
2026-06); Canaries dashboard, GDPval 220-task gold subset, O*NET/BLS all public and current. The
predictive-vs-realized gap is the opportunity *and* a hazard: exposure indices intercorrelate
~0.8 yet imply different exposed populations; Canaries rests on a balanced ADP sample excluding
firm entry/exit; the Economic Index is Claude-user-skewed provider telemetry mapped by
Anthropic's own models with no external audit (exactly what shape 2 targets). **Barriers:** the
ADP microdata and OpenAI's usage data behind the headlines are partner-only; the RCT introduces
human subjects (IRB + PII on the survey platform).

**Supply exposure.** Unusually low — no GPU rental, so fully insulated from GPU volatility. API
exposure is hedgeable (open hosts, batch). Real risks: dataset-continuity (the Economic Index
and Canaries are voluntarily published and could change methodology/cadence or be withdrawn) and
model-release cadence (event-study/RCT are pegged to launches you don't control). **Prolific
participant cost is the sharpest exposure** — fees and pay floors move.

**Cost.** $0–70 for four shapes; the **RCT busts the cap.** Index horse-race and
capability-bridge ≈ $0; classifier and GDPval audits $5–45 (API-only). Verified July-2026
Prolific: **$8/hr minimum ($12/hr recommended) + 33.3% academic / 42.8% corporate fee.** A
150-participant, 20-min study ≈ **$533 academic / $571 corporate at minimum pay**, ~$710–857 at
recommended — over $500 before API credits or attrition. To fit ≤$500, scope to ~100
participants/short task/academic-min (~$355 + a little API), or use the Anthropic Economic
Futures award ($10k–50k + $5k API credits). The brief's "~100–200 fits ≤$500" is optimistic at
200. **Power:** n/a.

**D3 implication: strongly raises — near-zero compute, open tabular data matching the
researcher's ML/pipeline + LLM-judge strengths, 5 of 6 shapes at $0–70; the one budget risk
(participant-paid RCT) is avoidable and covered by a named external channel.**

### 6. Social impact: disempowerment & cognitive change — `api-only`

**Hardware.** The strongest solo shapes are API/CPU-bound. Public chat-log epistemics
(WildChat/LMSYS) is an LLM-judge pipeline over anonymized text; agency/sycophancy benchmark
extension (HumanAgencyBench-style) is API inference; replication audits (DebunkBot,
Vasconcelos-style) are laptop stats. The reliance instrument and latent-persuasion dose RCT are
laptop analysis + a participant platform. Only the deskilling trace-data study touches classical
ML (causal inference on contributor histories — laptop or free T4). Self-hosting an open judge to
avoid API bills would pull in one rented 24–80GB card (optional, usually cheaper hosted).

**Iteration / part-time.** **Days**, forked sharply. API-only studies iterate in **hours**
(I/O-bound; a few thousand judgments overnight; config change re-runs same-day); the one-time
gate is human-validating the judge on a labeled subsample (a day or two). Recruited-participant
studies iterate in **weeks-to-months** — commercial IRB review, then Prolific fielding. **Good
fit for the API/reanalysis shapes; weaker for recruited work** (IRB + fielding waits a
part-timer can't compress; a full RCT spans 2–4 months of mostly waiting).

**Data.** Open-abundant with representativeness caveats: WildChat (ODC-BY, 4.8M convs through
Jul 2025) and LMSYS-Chat-1M skew to *task* use, so chat logs under-represent the delusion/
companion phenomena that motivate the domain (Anthropic found only 2.9% affective use).
Donated-harm-log corpora are tiny and not redistributable; DebunkBot data on Dryad is under a
Science expression of concern (⚠️ a reproducibility landmine you inherit). **The hard barrier is
human subjects:** any recruited study needs ethics review — a commercial IRB (WCG/Advarra/
Solutions, ~$1,000–5,000/protocol) or an affiliated co-author. That IRB cost, not compute, is
the gatekeeper and alone can exceed the cap.

**Supply exposure.** Low-to-moderate, concentrated on API pricing (hedgeable via open hosts/
batch/caching). GPU supply largely irrelevant. Material exposures are non-compute: dataset
takedown/relicensing (WildChat already migrated licenses once and gates its toxic subset; the
DebunkBot data could be pulled), and IRB/Prolific cost drift.

**Cost.** **$0–70 for the API/reanalysis shapes; $1,000–$6,000+ for a full recruited study once
IRB is included.** A WildChat/LMSYS epistemics run over ~20k convs is $5–60; a HAB-style
extension across 4 frontier models is $25–43 (or ~$0.60 on one open host); reanalysis ≈ $0. But
shapes 3 and 5 **bust the cap**: n~300 × 15–20 min at $12/hr ≈ $900–1,200 rewards + 33–43% fee ≈
$1,200–1,700, *before* a $1,000–5,000 IRB. Even a lean n~100 pilot is $150–250 + fee and still
needs IRB. **Power:** n/a.

**D3 implication: RAISES for the API-only/reanalysis subset (chat-log epistemics, benchmark
extension, replication audits are laptop+API, $0–70, matching LLM-judge/XGBoost strengths) but
LOWERS for the recruited-participant subset (commercial IRB + Prolific blow past $500 and IRB/
fielding fight the ≤15 hrs/wk pacing); net-positive only if the researcher stays in the
data-secondary-use lane or secures an IRB-sponsoring co-author.**

### 7. Bias & fairness — `api-only`

**Hardware.** Two hardware-light buckets, neither needing meaningful GPU. Correspondence/
protocol/judge audits of frontier LLMs (protocol-sensitivity, competence-adjusted auditing,
LLM-judge fairness, RUTEd) are pure API inference — synthetic resumes/personas/dialect-swaps
sent to hosted models, scored. Deployed-system/tabular work (fairness-drift + LDA/model-
multiplicity search on ACS/folktables) runs classical ML: vanilla XGBoost fits 0.6M–2.3M-row
tables in seconds-to-minutes on a **laptop CPU** (the multi-hour figures in the literature are
fairness-*constrained* variants or large sweeps). The LL144 compliance-corpus study is a
scraping/pipeline task, zero GPU. Any optional on-device open-model auditing tops out at a free
Kaggle T4 or one Vast 4090. Canonical works (Gender Shades, Wilson & Caliskan) used commercial
APIs + public inputs.

**Iteration / part-time.** **Hours** — a cycle is API round-trips + human analysis, not
compute; a protocol/judge run over 4–6 models × ~1k items × 3 protocols is minutes-to-hours
(batch turns it overnight). The tabular drift/LDA cycle is the fastest (lunch-break). Slow parts
are non-compute: building matched-guise stimuli, hand-validating construct validity, and the
LL144 scrape-and-clean grind. **Excellent part-time fit** — batch APIs actively suit the
cadence.

**Data.** Open-abundant, low barriers (a defining strength). folktables/ACS: no license, no PII
beyond de-identified microdata, no IRB. LL144 reports are *legally required* to be public
(scraping fair game). The one structural barrier — internals of deployed proprietary systems —
is routed around by auditing hosted models via API. Watch-items: API ToS on adversarial
querying; free-tier rate limits.

**Supply exposure.** Low-to-moderate, skewed to API not GPU. Zero GPU-supply exposure (tabular
work is laptop CPU). API-side: frontier price on large sweeps (hedged by batch + open hosts);
**model deprecation/version churn** is a reproducibility risk unique to this field (an audit of
"GPT-5.4" can become unreproducible on a silent update). Dataset-takedown minimal (ACS is
Census-backed; synthetic inputs and LL144 public records can't be pulled — but snapshot LL144
reports promptly, since the posting window is only 6 months).

**Cost.** $0–70 for the majority; edges reach ~$100–150, never near the cap. Drift/LDA on
folktables ≈ $0; LL144 corpus $0–10; LLM audits map to the multi-model reference (~$25–43 std,
$25–30 batched, <$5 on an open host, ~$0.60 for a full open-host sweep); a 20k-judgment
robustness run $5.40–$30. Only a deliberately frontier-output-heavy generation study reaches
~$100–150. **Power:** n/a (heaviest local job is a minutes-to-hours XGBoost search).

**D3 implication: RAISES — among the most resource-friendly domains: api-only or laptop-CPU, no
GPU rental, open/self-generated/public-record data with low barriers, hours-iteration, $0–70/
study (worst realistic ~$150), and a cadence batch APIs actively suit.**

### 8. Model architecture research (small-scale science) — `consumer-gpu`

**Hardware.** Two regimes. Inference-only shapes (behavioral stress-test of a released hybrid;
architecture × hallucination LLM-judge) need no training compute — small open hybrids
(Falcon-H1, RWKV-7, Mamba-2 <3B) run on a free Kaggle P100/T4 or a $0.31–0.69/hr 4090; the
judge half is API. The flagged open question — inference-only stress-testing an 80B-A3B hybrid
(Qwen3-Next) — needs ~140GB bf16 (2×A100/1×H100) or 4-bit to ~48–60GB on one A100/H100; the only
shape reaching rented-multi-GPU. Training shapes stay small: BabyLM is venue-capped at
1×A100-40GB/24h; Zoology/MAD recall-wall ablations train 70M–360M models (minutes-to-hours per
run); the speedrun-component audit targets modded-nanogpt (sub-90s on 8×H100, ~$0.40/run). **No
CUDA-kernel expertise needed** for any of the six shapes — a single rented consumer/A100 card
covers five.

**Iteration / part-time.** **Hours**, and the atomic unit is small (a speedrun run ~$0.40; a
70M–360M training run minutes-to-hours; a BabyLM run a few hours). No human subjects, no
data-collection lag — the loop is code + compute + published benchmarks. The real time sink is
the **sweep structure** (a credible recall-wall map or component audit is dozens-to-low-hundreds
of runs across primitives × scales × seeds; the comprehensive analogue hit ~20,000 GPU-hours —
you run a narrowed grid). **Strong part-time fit** (queue-and-leave runs); disciplined
experiment tracking matters more than raw hours.

**Data.** Open-abundant and unusually clean because the "data" is synthetic tasks + published
weights (no label noise by construction — the methodological appeal). Falcon-H1, Qwen3-Next,
RWKV-7 weights and BabyLM corpora are downloadable. Caveats: eval-benchmark contamination for
real-task evals (sidestepped by synthetic-first), and headline claims being self-reported
(Qwen3-Next shipped with no paper — the "data" about competitors is the thing under test). Very
low barriers (permissive licenses, no PII/IRB/paywalls; modded-nanogpt's fixed-data rule is a
discipline constraint).

**Supply exposure.** Low-to-moderate, hedgeable. Training shapes fit a single card with
redundant supply (Kaggle free is a real fallback); the 8×H100 speedrun is the most
supply-sensitive (needs a coherent 8-GPU pod; H100 waitlisted/price-volatile) but trivial in
dollars (~$0.40–1/run). Dataset-takedown near-zero (synthetic tasks + mirror target
checkpoints locally at study start). Rising exposure the brief flags: agent-driven
speedrunning is compressing the human trick-finding niche (a competitive, not resource, risk).

**Cost.** $5–150, most $10–70. Inference stress-test $5–15 (near-free on Kaggle); hallucination
judge study $15–50; recall-wall map $20–80 (broad grid → $150); speedrun audit ~$0.40–1/run
(hundreds of runs stay under ~$150–300); BabyLM entry $25–50. The one ceiling risk: a large
multi-model, multi-config eval sweep of the 80B hybrid at bf16 could climb toward the cap if run
repeatedly (quantized single-card keeps it well under). **Power:** immaterial locally; the
speedrun tradition *is* a compute-efficiency competition, so run-time is a first-class metric.

**D3 implication: strongly SUPPORTS — five of six shapes run on a single consumer/A100 card or
pure API for $5–70, no human-subject/data-collection lag fits ≤15 hrs/wk, data is synthetic-or-
open, and the inference-heavy stress-test shapes align with the researcher's judge-eval
strength; the only cost pressure is API output tokens, hedgeable via batch/caching/open hosts.**

### 9. Agent security & authentication — `api-only`

**Hardware.** Best solo studies need essentially no GPU — five of six shapes are API + laptop,
one is pure reading. The "AgentAuthBench" delegation-scope benchmark and AP2 red-team
replication drive agent trajectories through frontier APIs inside open harnesses (DoomArena,
AgentDojo — no GPU); the LLM-judge for mandate/delegation-receipt compliance is an API judge
sweep (the researcher's published specialty); the comparative security analysis of competing
identity Internet-Drafts is threat-modeling on paper; the longitudinal MCP/A2A auth-posture scan
is network-I/O + classical ML (a laptop or $5/mo VPS); the signed-agent spoof/bypass eval runs
Cloudflare's web-bot-auth verifier (Ed25519 + RFC 9421 — any laptop). Only self-hosting an open
agent/attacker model would want a rented card (a cost-optimization, not a requirement).

**Iteration / part-time.** **Hours** — a cycle is N agent trajectories × M injections through
the API, then score. An auth-scoped subset (~30 scenarios × 6 attack classes × 3 models × 3
seeds ≈ 1.6k trajectories) completes in tens-of-minutes-to-hours (rate-limit-bound, not FLOPs);
judge passes batch overnight at half price. The protocol-comparison shape iterates in
reading/writing time; the scan is calendar-paced (re-scan weekly/monthly). **Excellent part-time
fit** — launch, batch overnight, analyze in one session; slower shapes are slow in
part-time-friendly ways. The live-standards nature is the pacing risk (target the stable
measurement gap, not one spec).

**Data.** **Must-create** — the defining feature and the opening: a 2026 taxonomy finds
robustness is the *sole* agent-safety category with zero primary benchmarks (there's no
"AgentDojo for delegation/scope-adherence"). So the primary dataset (scoped-delegation scenarios
+ adversarial cases + ground-truth scope labels) is hand-authored; quality risk is
construct-validity + LLM-judge label noise — squarely the researcher's wheelhouse. Substrates to
build on are open and high-quality (DoomArena, AgentDojo, AP2/A2A sample code, Cloudflare
web-bot-auth Apache-2.0). Barriers: **ethics/ToS for the internet-scan shape** (probing live
third-party infra risks abuse-of-access lines — scan honeypots/opt-in/read-only), and keep
payment-protocol red-teaming on sandbox code.

**Supply exposure.** Low-to-moderate. GPU near-irrelevant (no training; optional self-hosting on
a stable commodity card). Genuine exposures: frontier-API price/quota (dominant cost is
trajectory-generation + judge tokens — hedged via batch/caching/open hosts); model deprecation/
behavior drift (a version bump shifts numbers — pin versions); and **spec churn / repo
takedown** (a fast-moving standards land-grab — anchor to the durable measurement gap, not one
protocol). The synthetic benchmark itself can't be taken down.

**Cost.** $5–120, most $10–70. Delegation-scope benchmark and AP2 red-team map to the
multi-model reference (~$43 std, $25–30 batched) → $20–100 for auth-scoped multi-turn runs; the
LLM-judge shape $5–60; the protocol paper ≈ $0; the MCP/A2A scan $0–10 (VPS cron); the
web-bot-auth eval $0–10 (local crypto). Priciest realistic study (large multi-model, many-seed
benchmark with frontier judges, un-batched) tops near $100–150. **Power:** n/a.

**D3 implication: RAISES — about as resource-light as frontier-relevant research gets (api-only/
laptop, every study $5–120 with wide headroom, fast ≤15 hr/wk iteration, open substrates), and
its single biggest gap (missing agent-auth robustness benchmarks) is exactly the researcher's
eval-methodology specialty, so cost fit and skills fit reinforce.**

### 10. AI development & research tooling — `api-only` (+ cheap CPU boxes)

**Hardware.** The lightest-compute domain in the program — methodology, ETL, audit; its
exemplars used little/no GPU (Miller's "Adding Error Bars to Evals" was one author, no GPUs;
UTBoost and BetterBench were audits). Cross-harness equivalence runs 3–5 *small* open models
(7–8B, quantized) through lm-eval/Inspect/HELM on a free T4 or rented 4090; the statistical-rigor
audit + upstream PRs and the trace-to-eval ETL are laptop-only; LLM-judge stability is
API-budget scale. The one non-obvious cost: **SWE-bench-style Docker environments are
CPU/RAM/disk-bound, not GPU-bound** (want 16GB+ RAM, 8+ cores, ~120GB disk — a modest rented CPU
box, ~62 min for 500 tasks on 32-core/128GB, no GPU). Net: laptop + free-tier GPU + cheap CPU
boxes; frontier APIs do the heavy lifting.

**Iteration / part-time.** **Hours** — statistical re-analysis and ETL iterate in minutes; API
judge/eval sweeps in tens-of-minutes-to-hours (batch adds 24h, halves cost); the Docker-heavy
shapes have a one-time ~1–2h image build, then a ~1h full pass. No subjects, no records waits —
data already exists. **Excellent part-time fit** — the slow step (Docker eval) is fire-and-forget.

**Data.** Open-abundant, and data quality *is* the research object: SWE-bench Verified is MIT +
one `load_dataset()` call, lm-eval/Inspect/HELM are open, leaderboard numbers are published;
known-noisy inputs are the material (UTBoost found 176/169 mislabeled patches; Epoch found ~10%
of OSWorld tasks broken; R2E-Gym found <20% of auto-tests discriminate). The trace-to-eval shape
is "must-create" but data is cheap to self-generate. Very low barriers (no IRB/PII/paywalls; the
only "gate" is compute-time for Docker).

**Supply exposure.** Low across the board. GPU swings ~irrelevant (free-tier T4 / cheap 4090 /
CPU boxes are abundant regardless of the H100 market). Frontier-API price is the largest single
exposure (judge/eval sweeps) — well-mitigated by batch/caching/open hosts. Dataset-takedown
minimal (MIT/Apache, broadly mirrored); subtler ecosystem risk: tools under study get abandoned
(torchtune wound down; Langfuse acquired), shifting the target more than blocking a study.

**Cost.** $0–70, most $0–40. Re-analysis and ETL ≈ $0; cross-harness ~$30–50; judge-stability
$5–60 (→ <$1 on an open host); verifier/rot audits a few dollars of CPU-box rental + optional
API. Priciest realistic is a frontier-heavy judge-stability sweep well under $100. **Power:**
immaterial; **local disk** is the only physical constraint (instance-cached SWE-bench evals want
up to ~2TB — run on a rented box).

**D3 implication: strongly SUPPORTS (raises) — near-zero-to-modest cost, all-open data, fast
self-contained iteration, no GPU/power/supply dependence; the best-fitting domain in the program
for a part-time ≤$500/study researcher.**

### 11. Agent architectures & orchestration — `api-only`

**Hardware.** Every shape is API-behavioral eval science on open scaffolds — zero training, zero
GPU rental. The laptop is a driver/orchestrator (runs scaffold code + Docker task envs + logs
traces) while inference lives behind frontier APIs. MAST-style failure annotation, the neutral
memory audit (Mem0/Zep/Letta/A-Mem + baselines on LOCOMO/PersistBench — vector stores like
Chroma/FAISS run on a laptop), the token-matched topology ablation, the compaction-loss study,
reliability-decay curves (pass^k), and the ABC validity audit are all pure API + laptop.
Terminal-Bench/τ-bench/OSWorld envs run in CPU Docker sandboxes (RAM/disk the only local
constraint, offloadable to a cheap CPU VM). Only self-hosting an open model for bulk work would
touch a rented card (usually cheaper as an API call).

**Iteration / part-time.** **Hours** — a cycle is launch a batch of rollouts, wait, run a
judge/scoring pass; dominated by API latency + long agentic trajectories, not compute. A
benchmark slice of a few hundred tasks × k trials runs over ~an hour-or-few async; the judge pass
batches overnight. No data-collection/subject/records latency; the early time sink is scaffold/
harness plumbing. **Excellent part-time fit** — fire-and-forget async batches run unattended
(the 2-author precedents prove the pacing suits part-time); the caveat is pass^k needs k trials
per task (thousands of *unattended* rollouts, not attended hours).

**Data.** Open-abundant, and the data is the field's biggest scientific liability (hence
target-rich): the ABC checklist found 7/10 agentic benchmarks violate task validity, 7/10
outcome validity, 10/10 have reporting flaws; LOCOMO is simultaneously the standard and
demonstrably broken (~16–26K-token convs so full-context beats the memory systems it markets
against; secondary audits allege ~6.4% of the answer key is wrong ⚠️). Trace corpora (MAST-Data
1,600+ traces; HAL rollouts) are clean. Harnesses are open (HAL, MAST, Chroma Context-Rot,
BrowserGym, Terminal-Bench, τ-bench, OSWorld); LOCOMO is CC BY-NC (fine for research). No IRB/PII
(simulated users are LLMs). Barriers are practical: paid API accounts + higher rate-limit tiers.

**Supply exposure.** Essentially zero GPU exposure. API-side: **frontier price/quota is the one
real supply risk** (a study's feasibility rides on token pricing and rate-limit tiers for large
async batches — hedge with open hosts, 10–50× cheaper for bulk); model deprecation/version churn
is a reproducibility hazard; scaffold/framework churn is fast (AutoGen → maintenance, Swarm
superseded — target the framework-agnostic layer). Dataset-takedown low (mirrored on
GitHub+HF).

**Cost.** **$5–$300, most $30–150; a few designs approach or nudge $500.** Cheap end ($5–60):
MAST annotation, compaction-loss, ABC audit (one rollout batch + one judge pass, near the
$0.60–$60 reference). Mid ($60–200): topology ablation or memory audit across 4–5 systems + baselines.
Top end ($200–500): **reliability-decay with genuine pass^k** — the multiplier is brutal (k
trials × hundreds of tasks × multiple scaffolds × long trajectories). Anchor: a *single*
Terminal-Bench 2.0 run (89 long-trajectory tasks) on a frontier model ~$60–80; at k=8 across 2
scaffolds that's ~$1,000+ on a premium model — **the one realistic way a study in this domain
busts the cap.** Stay under by choosing cheaper agent models, capping k, subsetting benchmarks,
and reserving frontier for the judge only (HAL's $40k → 21,730 rollouts backs the arithmetic).
**Power:** n/a (laptop only orchestrates async calls; a stable connection / always-on CPU VM
matters more than watts).

**D3 implication: strongly RAISES — no GPU, no training, open data, IRB-free, fire-and-forget
async pacing ideal for ≤15 hrs/wk, every study under $500 — the only watch-item is capping
pass^k trial counts so reliability studies don't blow the budget on frontier rollouts.**

### 12. Evaluation & benchmarking science — `api-only`

**Hardware.** The highest-fit study shapes need no training GPU: Miller-style error-bars/
statistics, metabench/tinyBenchmarks IRT compression, Panickssery-style judge self-preference
studies, StrongREJECT-style judge meta-eval, contamination/GSM1k rebuild audits, BetterBench
audits. metabench compressed six benchmarks over 5,000+ models by pure analysis of *public
leaderboard data* (zero training). Work runs on a laptop (pandas/scikit-learn/XGBoost + a
Bayesian/IRT lib); the "spend" is API calls to elicit judge/model behavior. A consumer GPU is
nice-to-have only for the open-weight-judge sub-branch (fits one 24GB card or Kaggle free). The
compute-hungry shapes (re-running agents in sandboxes, 70B judge sweeps) are optional and still
under $500.

**Iteration / part-time.** **Hours** — an API sweep (~1k items × 4 models) completes in a few
hours and re-analyzes in seconds; pure re-analysis (metabench/Miller-style, from public
leaderboard dumps) has *no* collection step (minutes). The sharp exception is the human-uplift/
RCT genre (METR-style dev RCT, n=153 bio wet-lab RCT) — weeks-to-months, gated by recruitment/
IRB/preregistration. **Excellent part-time fit for the data-analysis/judge/psychometric studies;
poor for the RCT branch** (a solo part-timer realistically can't run those).

**Data.** Open-abundant: verified live July 2026 are Chatbot Arena/LMArena vote dumps
(arena-human-preference-55k, chatbot_arena_conversations 33k, search-arena-24k), the Open LLM
Leaderboard v1/v3 dumps, and every canonical benchmark (MMLU, GPQA, SWE-bench, GAIA, RewardBench,
HarmBench). Quality problems *are the subject*: contamination (SWE-bench Illusion 76% path
recall, GSM8k leakage), grading bugs (ABC ~100% relative misestimation; τ-bench empty-response
passes), near-absent significance reporting (BetterBench), judge biases. Barriers only at the
edges: private/holdout benchmarks (FrontierMath, HLE private split) are gated to funded orgs;
human-subject studies need IRB; some arena data is non-commercial-research licensed.

**Supply exposure.** Low overall — structurally the least-exposed AI domain. Depends on frontier
pricing/quotas (mild, hedgeable) + continued open leaderboard/vote data. Zero GPU exposure for
the analysis/API studies. The one real risk is **dataset takedown/license change**: LMArena is
now a $1.7B company selling private evals, so future vote releases could be curtailed
(the Leaderboard Illusion already documented selective access) — but historical dumps are
mirrored across HF/Kaggle, insulating past-data studies. API model deprecation silently changes
"the model under test" (reproducibility hazard).

**Cost.** $0–70 for the high-fit B-layer work, a large share $0–15. Pure re-analysis
(metabench/Miller/BetterBench) can be literally $0; fresh model/judge behavior lands at the
reference figures ($25–43, $25–30 batched, $5–60 judge, $5–15 open-judge GPU sweep). Budget only
threatened by non-sweet-spot shapes: large frontier *generation* runs (output-token dominated)
and the human-uplift RCT genre (busts on subject pay + months, not compute). **Power:** n/a
(submit big judge runs to batch overnight).

**D3 implication: STRONGLY RAISES — close to the ideal solo-part-time profile: the field's most
publishable studies need no training GPU, run on open+abundant data + modest API spend ($0–70),
iterate in hours, fit ≤15 hrs/wk, and are barely supply-exposed; the only budget-busting/
infeasible shapes (human-subject RCTs, un-auditable private benchmarks) are avoidable edges.**

### 13. Model behavior science — `api-only`

**Hardware.** The best solo shapes need no training compute — pure inference. The longitudinal
behavioral observatory (Wiese PLOS One 2026; Chen/Zaharia/Zou drift design) is a fixed prompt
bank on a schedule + LLM-judge, laptop-only. Refusal/sycophancy/values measurement (SpeechMap,
ELEPHANT, Spiral-Bench, XSTest/OR-Bench, DarkBench) sends probe suites to APIs. Benchmark
auditing (the BlueDot ELEPHANT re-audit that moved sycophancy 13 pts) is the cheapest study in
the field. Judge-validity characterization is classical stats + API calls. Only two sub-areas
are compute-hungry: black-box/white-box model-diffing/idiosyncrasy classification (crosscoders
on Llama-3.1-8B + Qwen3-8B activations — inference-only, ~15–16GB fp16, one 4090/A6000 or free
Kaggle) and Transluce-style investigator-agent RL (8B PRBO — the one GPU-bound shape, a
single-A100 QLoRA-scale job). So api-only for ~80% of the space.

**Iteration / part-time.** **Days** — a cycle is API generation throughput and, for
observatories, the calendar itself. A point-in-time probe sweep (240–1000 prompts × 3–4 models +
judge) is minutes-to-hours (batch overnight → same-day). The flagship longitudinal shape is
*intrinsically* calendar-paced (Wiese's design is 10 weekly cycles ≈ 10 weeks by construction) —
but the waiting is unattended (a cron job fires the weekly probe). **Excellent part-time fit** —
the observatory is the ideal shape: set up once, spend a few hours/week on analysis while the
study accrues; elapsed time ≠ researcher hours.

**Data.** Open-abundant — the raw material is model *outputs you generate on demand*. Prompt
banks are public (XSTest, OR-Bench, DarkBench, ELEPHANT). WildChat (4.8M, ODC-BY) and
LMSYS-Chat-1M are confirmed still open mid-2026 (a Clio-substitute for outsiders). Quality
problems are methodological, not sourcing: LLM-judge validity is shaky (uncalibrated judges
correlate ~0.38–0.52 with humans; judge drift confounds subject drift), benchmarks are fragile
under audit (a BlueDot re-audit found 52% of ELEPHANT items lost key details, moving sycophancy
13 pts), and **longitudinal "subjects" die** (model deprecation destroys the study population;
only Anthropic has preservation commitments). Barriers: WildChat/LMSYS are HF click-through-
gated; systematically publishing per-vendor leaderboards is a tolerated grey zone (SpeechMap does
it openly), not authorized.

**Supply exposure.** Primary exposure is **API price/quota/model-availability, not GPU markets.**
Output-token price moves (hedged via open hosts/batch); **model deprecation as a supply risk
unique to this field** (a retired model deletes a longitudinal subject and can invalidate an
in-flight observatory); rate-limit changes can throttle a scheduled observatory; WildChat/LMSYS
takedown is plausible (archive a local ODC-BY copy now). GPU exposure minimal (diffing/
elicitation minority fits cheap/free cards).

**Cost.** $0–70 typical, $5–40 median. A re-audit or single point-in-time probe is $1–45 (the
$43-std / $25–30-batch reference, or ~$0.60 on an open host); the flagship Wiese-style
observatory (10 cycles × 240 prompts × 3 models + Bradley-Terry judge) ~$30–80 total; the GPU
minority (crosscoder/investigator QLoRA on 8B) $4–28 or free on Kaggle. Budget-buster risk ~nil.
**Power:** n/a.

**D3 implication: strongly RAISES — the field's best solo studies need zero training compute,
run on APIs + a laptop, cost single-to-double-digit dollars far under cap, and the calendar-paced
observatory is ideal for ≤15 hrs/wk of mostly-unattended work; the real risks (judge validity,
model deprecation) are scientific, not financial.**

### 14. The data science of AI (curation, forensics, provenance, tokenizers) — `none-or-laptop`

**Hardware.** Exemplars are CPU/storage/inference-bound. Tokenizer forensics (Magikarp
under-trained-token detection — load an embedding matrix, compute norms/distances, a few
thousand log-prob queries) runs on a laptop or free T4. Contamination testing (Oren/Hashimoto
exchangeability) needs only log-prob access, works on models as small as 1.4B. Documentation/
provenance/license audits and synthetic-share measurement are CPU + storage + patience (FineWeb-
Edu is XGBoost-grade; robots.txt/ToS scraping). The **one** shape needing real hardware is a full
FineWeb-style curation ablation (a single 1.8B/28B-token ablation ≈ 320 H100-hours, and you need
many — a multi-thousand-dollar cluster job, out of scope). Small-scale surrogate ablations
(~100M/10B tokens, ~$100–500 rented single-GPU) are the only in-budget on-ramp, with unproven
transfer to scale.

**Iteration / part-time.** **Hours** for the core shapes (Magikarp pass = minutes-to-an-hour; a
contamination test = a batch of log-prob calls; a provenance audit = scripting + overnight
scrape). What lengthens cycles is data acquisition (Common Crawl subset pulls, longitudinal
robots.txt re-crawls spaced over weeks) and detector calibration (FPR validation), not GPU.
Curation-ablation cycles are days-per-cycle and cluster-bound (why they don't fit). **Strong
part-time fit** — scripting/scraping/classifier work is pausable/checkpointable; corpus-scale
ablation is the only part-time-hostile shape.

**Data.** Open-abundant — data quality *is* the subject. Common Crawl (9.5+ PB) and derived
corpora (FineWeb 15T, Dolma, Common Pile, Common Corpus) are openly downloadable, but flawed by
nature: DPI found 70%+ license omission / 50%+ error rates; synthetic-share ground truth doesn't
exist (headline "50% of the web is AI" rests on detectors with unquantified FPR — the measurement
gap is the opportunity); contamination evidence bases are tiny (CONDA: 566 entries). **The sharp
cost trap:** Common Crawl is "free" but AWS egress is $0.09/GB — a full 34TB crawl is
$2,400–3,000 in bandwidth alone. **Escape hatch (keeps the domain in budget):** query the
columnar index via Athena for ~$1.50/scan, then pull only targeted WET subsets on a cheap
in-region EC2/spot instance so egress ≈ zero. Non-technical barrier: **legal** — publishing
contamination/license-violation evidence names companies, and safe-harbor norms for independent
auditors are unsettled (a solo lacks DPI's org backing).

**Supply exposure.** Unusually low — one of the most supply-resilient subfields. GPU swings
barely matter (core studies need little/no GPU). API exposure modest (log-prob methods depend on
providers *continuing to expose logprobs* — some frontier APIs have restricted this ⚠️; judge/
detector work is hedgeable to open hosts). Genuine risks are dataset-side: **takedowns/access
restriction** (Consent-in-Crisis: 28%+ of critical C4 sources restricted within a year; rising
robots.txt blocking — the corpora under study are being pulled), **Common Crawl is a single point
of failure** (one small nonprofit funds the crawl nearly every open corpus derives from), and AWS
egress repricing would directly hit the one cost-sensitive workflow.

**Cost.** **$0–70 for the great majority; a hard fork at curation ablations.** Tokenizer
forensics, contamination tests, datasheet/provenance audits ≈ $0–15; synthetic-share / Common-
Crawl-subset measurement ~$2–40 (Athena ~$1.50 + small in-region EC2 + optional judge run); a
quality/license classifier + validation $5–30. **Budget-buster:** a full FineWeb-style ablation
≈ 320 H100-hours ≈ $640–960 for *one*, and recipe-ranking needs many — thousands-to-tens-of-
thousands total, clearly over cap. **Power:** immaterial for core shapes; any surrogate ablation
belongs on rented cloud, not a laptop.

**D3 implication: strongly RAISES — nearly every landmark study is achievable on a laptop + free
tiers + <$70, well inside budget and ≤15 hrs/wk — *as long as* the researcher stays out of
full-corpus curation ablation (the one budget-busting shape) and steers Common Crawl work through
the Athena-index + in-region-subset pattern to dodge the egress trap.**

### 15. Reproduction, replication & meta-science — `none-or-laptop`

**Hardware.** The center of gravity is a laptop. The hardest-landing exemplars needed no
training: Martinez's bar-exam re-analysis, Schutte's gzip-beats-BERT takedown (found a
tie-breaking bug, re-ran a kNN on CPU), Schaeffer's "emergent abilities a mirage" (re-analyzed
existing numbers), Kapoor & Narayanan's 294-paper leakage survey (a pandas job). Three shapes
touch modest compute: benchmark/contamination auditing (inference-only, one 24GB card or free
T4, or a frontier API for judging); "does X replicate on open models?" reproductions (the R1-Zero
wave — TinyZero trained a 3B base with RL in <5h on 2 GPUs, ~$30; full Open-R1-scale would blow
the cap, so scope selection matters); and efficiency/inference-claim auditing (quant sweeps on
one 4090/A6000, ~$5).

**Iteration / part-time.** **Days**, dominated by reading and forensic reasoning, not compute. A
re-analysis cycle (locate the claim's public data/code, reconstruct, find the discrepancy,
re-derive) is hours-to-days with no batch job to wait on; a contamination audit wraps a short
sweep in much longer manual error-taxonomy annotation; an open-model replication has a short run
(~5 GPU-hrs) but days of env setup + hyperparameter matching + debugging divergence. No
human-subject or FOIA waits. **Excellent part-time fit** — work decomposes into discrete,
self-contained, pausable claims/papers; one of the most part-time-friendly domains in the sweep.

**Data.** Open-abundant — the raw material is others' published claims/data/code, and the
quality problems *are* the subject. Verified open: MMLU-Redux (CC-BY-4.0), GSM8k, BIG-Bench, the
arXiv replication datasets; reproduction repos (TinyZero, Open-R1) on GitHub. The recurring issue
is incomplete original artifacts (omitted hyperparameters/seeds/harness — precisely why
reproductions diverge and have value). Two real barriers: **independence/access asymmetry** (the
highest-credibility contamination work benefits from private test sets / query logs a solo
lacks — a solo can only audit what's public), and **legal/reputational exposure** when naming a
funded lab (Reflection 70B drew fraud accusations; Sakana walked back claims).

**Supply exposure.** **Very low — the lowest of any sweep.** The best studies use no rented GPUs
and no frontier APIs, so GPU/API swings barely register; where compute is used it's tiny and
fungible (Vast/RunPod/Kaggle interchangeable). API exposure minimal/hedgeable (open hosts, batch).
The one genuine risk is non-compute: dataset/repo takedowns or a lab pulling an artifact you were
auditing (or private-test-set gatekeeping tightening) — source availability, not hardware.

**Cost.** $0–70 for the vast majority. Pure re-analysis/meta-analysis (the highest-impact
template) ≈ $0; benchmark/contamination audits and multi-model sweeps ~$5–45; efficiency/quant
audits ~$5–15; open-model "does X replicate" $4–30 for toy/small (TinyZero ~$30), rising to
$28–66 for a QLoRA-70B replication. **The one cap-buster:** attempting a full Open-R1-scale or
from-scratch pretraining reproduction (thousands of GPU-hours) — scope discipline keeps
essentially every viable study in $0–70. **Power:** immaterial.

**D3 implication: strongly raises — the most resource-favorable domain in the sweep, with the
best studies needing zero compute and near-zero dollars, so budget/hardware essentially never
gates the work; the binding constraint is credibility and rigor, not money.**

### 16. Vertical evaluation & third-party audit — `api-only`

**Hardware.** Best shapes need almost no owned/rented GPU. Domain RAG-hallucination / LLM-judge
audits (RegLab "Hallucination-Free?", MedHELM-jury) are pure frontier-API + a validation set;
multi-model vertical benchmark builds (LegalBench/FinanceBench-style) hit targets via API (an
open-weight comparator uses a cheap host, not a rental); the classical-ML audit exemplars
(Obermeyer proxy-bias, Epic Sepsis external validation, re-running Rotterdam's welfare model,
LL144 disparate-impact math) are laptop scikit-learn/XGBoost on tabular EHR/FOI data; incident-
analysis (AIID/AIAAIC coding) is laptop text analysis. A rented 24GB card is only for an optional
quantized/open-weight sweep (Kaggle free covers most). No multi-GPU, no training.

**Iteration / part-time.** **Days**, with two clocks. The *compute* clock is fast (an API sweep
or laptop fairness-stats audit is minutes-to-hours; batch overnight). The **binding** clock for
the highest-impact studies is **data access + human validation, days-to-months:** FOI negotiation
for a live government model took Lighthouse ~6 months for *one* Rotterdam model; gated clinical
data needs IRB/DUA (weeks-months); expert-validated rubrics (physician/clinician/attorney
review) are the real bottleneck; distributed compliance audits need coordination. **Fits ≤15
hrs/wk IF the shape's data is already open** (LegalBench/FinanceBench sample builds, RAG audits vs
public tools, AIID/AIAAIC analysis, LL144 surveys); FOI/IRB/expert-validation shapes fit
part-time only in the sense that waiting is passive (calendar stretches to months).

**Data.** **Gated-obtainable** — the domain's defining constraint ("Access Denied"). Open now:
LegalBench (162 tasks), FinanceBench open sample (150 items, CC-BY-NC; full 10k gated), AI
Incident Database (free JSON/CSV/GraphQL, 1,200+ reports), AIAAIC, MIT AI Risk Repository. Quality
problems flagged: BetterBench found most benchmarks don't report significance; the public-sector
meta-review found no benchmark meets public-sector criteria and ~half pad small cores with
LLM-generated examples. **Access tiers:** open eval datasets (no barrier) → gated clinical/EHR
(MedHELM is 14 public / 7 gated / 14 private; high-value sources need institutional/IRB/DUA a
solo may not clear) → deployed government models (FOI, ~6 months) → commercial tools (ToS/CFAA +
scope-capture, per ORCAA-HireVue). Legal exposure (ToS/CFAA/defamation on vendor-critical
numbers) is real and under-mapped — RegLab preregistered partly for defensibility.

**Supply exposure.** Low GPU, moderate API, **high data-access.** GPU swings barely matter
(optional sweeps fit free/sub-$10). API exposure = frontier output-token bill + model deprecation
mid-study (hedged via open hosts). The biggest structural risk is **access takedown/revocation**:
a vendor tightening ToS mid-audit, a gated DUA lapsing, an FOI appeal denied, or a benchmark
pulled/contaminated; deployed-model audits can be shut off at will (scope capture). Moving-target
drift (silent model updates) is an integrity risk.

**Cost.** $5–$120 for the API/compute portion, comfortably under cap: a 4-model × 1k-item
vertical benchmark ~$43 std / $25–30 batched (→ ~$0.60 with one open host); a 20k-judgment
validation run $5.40–$60; a RAG-hallucination audit ~$10–60; classical-ML fairness audits ≈ $0
compute; incident analysis ≈ $0. **The genuine cost that CAN exceed $500 is off the compute
ledger: paying domain experts (clinicians, attorneys) to write/validate rubrics** — expert time
is the true budget line that pushes a serious medical/legal eval past hobbyist scope (FOI fees +
legal review add variable non-compute cost). **Power:** n/a.

**D3 implication: RAISES the score (best studies need essentially no compute — api-only, most
under $70, several near $0, fitting the stack almost perfectly) but the score should be TEMPERED
because the real gating resources are non-compute — data/model access via IRB or months-long FOI,
and paid domain-expert validation — so the highest-impact medical/government shapes are
access-limited rather than budget-limited.**

### 17. Small/open-model science — `free-tier-gpu`

**Hardware.** Purpose-built to run on modest GPUs (Pythia suites, bitsandbytes/QLoRA, GGUF,
FSDP+QLoRA exist precisely so behavioral science on open weights fits one or two consumer cards).
Tiers: (1) **inference-only behavioral eval sweeps** (quantization flip/KL-divergence audits,
refusal/calibration measurement, small-vs-large divergence) — a 4-bit/GGUF 7–13B fits a **free
T4/P100** — the tier that needs no paid hardware; (2) **QLoRA fine-tunes** (safety erosion after
benign FT, emergent-misalignment replication on Qwen2.5-Coder-32B, LoRA-vs-full-FT, abliteration)
— 8B QLoRA fits one 4090, 70B 4-bit fits one A100-80GB/H100; (3) **model-diffing/crosscoder
validation** on Pythia-scale (70M–1B) — trivially a consumer/free card; (4) **ecosystem mining**
(HF-Hub metadata, OSAI-Index openness/license tracking, r/LocalLLaMA qualitative) — laptop + API;
(5) the one ceiling — nanoGPT-scale pretraining (124M GPT-2, rented A100 a few days). TRM (7M
params, 45% ARC-AGI-1) reportedly trained on 4×H100 under $500 — the upper existence proof.

**Iteration / part-time.** **Hours**, dominated by GPU inference/training, not data/subjects. An
8-config 13B quant sweep (~15 GPU-hrs) is hours-to-overnight; an 8B QLoRA 10–20 GPU-hrs
(overnight on a 4090); a 70B QLoRA 20–40 GPU-hrs (1–2 rented days). Ecosystem-mining is paced by
HF Hub rate limits (500 req/5-min — the library handles backoff). The slowest is nanoGPT
pretraining (~4 days single A100). No subjects, no records waits — artifacts are downloaded.
**Excellent part-time fit** — most cycles are launch-and-walk-away (compute runs while the
researcher is away); multi-day pretraining is the only strained shape, and it's optional.

**Data.** Open-abundant — open checkpoints (base/instruct/quantized triples), Pythia's 16
reproducible-training-order models, community GGUF quants, HF Hub metadata (380k+ models), the
OSAI Index's 189-system grid. Second-order quality problems: community quants have no
standardized provenance/eval and indie KL audits lack CIs (the measurement-rigor gap is the
opportunity); HF-Hub mining has documented sampling/causality pitfalls; ecosystem tracking is
longitudinally thin (no maintained license-drift dataset — start collecting now). Low barriers:
some flagship weights gated (Llama 4 click-through) or custom-licensed (Gemma 3, Qwen2.5-72B) —
relevant to license-tracking; HF rate limits; r/LocalLLaMA touches Reddit ToS.

**Supply exposure.** Low-to-moderate, mostly hedgeable. GPU-price exposure minimal (median study
is inference-only on **free** tiers — Kaggle 30 GPU-hr/wk is the dependable anchor); only the
pretraining/70B-QLoRA tier touches the rental market (budget 30–50% above listed). API exposure
only for distillation-teacher/LLM-judge shapes (batch/caching/open hosts). Domain-specific
exposure is **checkpoint volatility** — open weights get relicensed/gated/deleted (no maintained
license-drift monitor exists) — a mild reproducibility risk countered by pinning revisions and
archiving checkpoints (itself a fundable study subject).

**Cost.** $0–70 for the vast majority. Inference sweeps $0 (Kaggle) to ~$5–15 (rented 4090/A100);
QLoRA $4–7 (8B on Vast) up to $28–66 (70B on A100/H100); LLM-judge/distillation-teacher is the
swing ($5.40–$60 for a 20k run; $25–43 for a 4-model eval). The two priciest credible shapes
still clear the cap: nanoGPT pretraining ~$110–130; TRM-style tiny-model training reported under
$500. **Nothing busts the cap;** the binding constraint is frontier-API output tokens, escapable
via open hosts. **Power:** long unattended runs belong on rented/free cloud, not a laptop (a
4-day pretrain is a thermal/session non-starter locally — Colab 90-min idle, Kaggle 9-hr cap).

**D3 implication: strongly SUPPORTS — close to the best-case domain for a part-time, ≤$500/study,
laptop-plus-free-tier researcher: the median study runs $0–15 on free/cheap GPU, needs no
subjects/records waits, iterates in launch-and-walk-away cycles fitting ≤15 hrs/wk, draws on
abundant open data, and even its priciest shapes stay well under budget.**

### 18. Human-AI interaction field studies — `none-or-laptop`

**Hardware.** The signature studies are human-subjects experiments, surveys, and log analysis —
essentially no GPU. Prolific/panel RCTs (Buçinca cognitive-forcing, Noy-Zhang writing tasks) use
a laptop + a survey platform + frontier APIs for the AI condition; survey-instrument studies (Lee
critical-thinking replication) are laptop R/Python. The **one** shape touching compute is
WildChat-scale log analysis / Clio-style open classifiers — and even then, classifying ~1M–3.2M
convs is API-metered via a cheap open host, or a self-hosted embedding/classifier on a **free
Kaggle T4/P100** (70B+ local inference unnecessary — the judge is an API). Diary/N-of-many
self-experiments and meta-analysis are laptop-only. **The scarce "hardware" is not silicon — it's
participant access, an IRB, and (for field/clinical/education work) an institutional partner.**

**Iteration / part-time.** **Weeks** — a cycle is gated by humans and paperwork, not a compute
run. Dominant costs: (a) **IRB/ethics** — an unaffiliated researcher has no home IRB, so a
commercial board (Solutions IRB: exempt $1,200, expedited $2,100) or an affiliated co-author as
PI, days-to-weeks turnaround *before* any collection; (b) instrument design + preregistration
(days-to-weeks of solo work); (c) collection — a 100–150-participant Prolific run fields in
hours-to-days, but a longitudinal design (Guingrich 21-day companion RCT) takes weeks-to-months by
construction; (d) analysis (hours-to-days). So the field is bimodal: log/meta work iterates in
hours-days; anything with live subjects in weeks (cross-sectional) to months (longitudinal), plus
a one-time multi-week IRB gate. **Good-to-excellent part-time fit** (pacing is calendar-bound, so
elapsed time does the work while a study fields) — but expect 1–2 rigorous cross-sectional
studies per *quarter*, not per month.

**Data.** **Gated-obtainable**, two regimes. Primary Prolific/panel data is high-control but
small-n at this budget (100–150 → modest power; self-selected-user surveys are contestable — the
Replika npj critique-and-reply is the cautionary tale). Released logs: **WildChat is now
WildChat-4.8M (~3.2M convs through Aug 2025, ODC-BY)** — genuinely open and freshly extended, a
real asset, with structural caveats (self-selected users, English/toxicity skew, no demographic
ground truth; toxic subsets gated). The prized internal corpora (Clio, OpenAI NBER usage data)
are closed monopolies. **The binding barriers are human-subjects governance, not data licensing:**
IRB (pay a commercial board or recruit an affiliated PI co-author; whether venues accept
commercial-IRB approval from independents is unconfirmed ⚠️), and ethical no-go zones for solo
work (minors, patients, suicidality, deception are off-limits without institutional backing —
walling off the teen-companion, clinical-deskilling, and education genres). Adult-crowdworker
work-task studies are the realistic lane.

**Supply exposure.** Low compute/API; the real exposures are non-technical. GPU swings ~irrelevant;
API cost lives in the AI *condition* + log-classifier passes (small, down-shiftable to open
hosts), with a small model-availability risk if a paper is tied to a specific model that's
deprecated mid-study. Dataset-takedown bounded (WildChat's ODC-BY makes it durable; any single
corpus can be gated, as toxic subsets already are). Genuine supply risks are **institutional:**
commercial-IRB pricing/turnaround, **Prolific policy/fee changes** (33.3% academic vs 42.8%
corporate — reclassification would raise costs), participant-pool quality drift, and the
availability of an affiliated co-author or field partner.

**Cost.** **$0–70 for pure-compute/data shapes; ~$500–2,600 all-in for a credible human-subjects
study, with the IRB fee (not compute) the swing factor.** WildChat log analysis / meta-analysis
$0–15 (free corpus + open-host classification; a 20k-item judge pass ~$5 on Flash-Lite). A
Prolific pilot/replication: 125 × 15 min at recommended $12/hr = ~$375 reward + 33.3% academic fee
≈ **~$500** (the AI condition's API usage is trivial, <$10–30) — that single line item essentially
consumes the cap. **IRB:** $0 if a co-author's institution covers it, else **+$1,200 (exempt) to
+$2,100 (expedited)**, pushing a commercially-reviewed solo study to ~$1,700–2,600 all-in.
**Budget-bust flag:** a full Noy-Zhang/METR-scale study is out of reach solo (METR paid ~$150/hr;
the brief estimates ~$75k in participant pay alone). The cap buys a tightly-scoped pilot
(~100–150 participants), not a headline field RCT. Honest read: **compute never busts the budget
here; participant pay + a commercial IRB do, and the IRB fee alone can exceed the entire $500
cap.** **Power:** n/a.

**D3 implication: SUPPORTS a high score on hardware/compute (near-zero GPU, laptop + APIs, well
under budget for the analysis itself) but LOWERS it on the non-compute axis — the binding
constraints are IRB access and participant pay, which push a solo human-subjects study to
$1,700–2,600 (busting the cap unless an affiliated co-author absorbs the IRB), and full-scale
field RCTs are simply out of reach solo.**

---

## What this changes

**Resources rarely gate this program — three specific things do.** For a laptop + free-tier +
≤$500 researcher, the resource-*light* domains are the clear majority: **Reproduction &
meta-science (15), AI supply chain (3), Governance (4), Evaluation science (12), the data science
of AI (14), Model behavior science (13), and AI dev/research tooling (10)** all run on a laptop +
APIs, cost $0–70 per credible study, and are barely supply-exposed — the binding constraint there
is the researcher's *time and rigor*, not money. The resource-*gated* domains gate on three
distinct axes, none of them GPU rental: **human subjects + IRB** (Human-AI interaction (18) at
$1.7k–2.6k all-in, plus the RCT branches of Labor & economics (5), Disempowerment (6), and
Evaluation (12)); **corpus-scale compute** (the one FineWeb-style curation-ablation shape inside
the data science of AI (14), which runs into thousands of dollars); and **access, not dollars**
(Vertical audit (16), where FOI/IRB/DUA and paid domain-expert validation gate the highest-impact
medical/government shapes). A fourth, subtler gate is **uncapped trial multipliers** — Agent
architectures (11) is cheap per run but pass^k reliability studies can cross $500 on frontier
rollouts unless k and benchmark size are capped. Where iteration speed (not money) is the real
constraint, it shows up as *calendar* time: Human-AI interaction (18) is weeks-to-months on IRB +
fielding, and Model behavior's (13) flagship observatory is intrinsically ~10 weeks — both fit
≤15 hrs/wk only because the waiting is passive. **The index should apply these as concrete D3
adjustments** — raise D3 for the api-only/laptop majority, temper it (and note the reason in D2 /
Confidence) where the true gate is IRB, FOI/access, expert pay, or a trial multiplier rather than
compute — so a "budget fit" score reflects the *binding* resource, not just the GPU bill.
