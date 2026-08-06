# Energy & Environmental Sustainability

## In brief
- **What it is** — the study of AI's physical footprint: the electricity, carbon emissions, and water
  it consumes, both when running a query and across a model's full lifecycle (chip manufacturing,
  training, and serving). Crucially, it is a field where the *measurement methodology* is as contested
  as the numbers themselves — what counts as "the energy of one query" depends entirely on where you
  draw the boundary (just the AI chip, or the idle backup machines and cooling too?).
- **Why it's pursued** — AI's compute demand is growing fast enough to move national electricity
  markets and grid prices, yet public figures for its footprint vary by orders of magnitude because
  operators measure differently (or not at all). Getting the numbers and the methods right is the
  prerequisite for any honest debate about whether AI's climate cost is acceptable.
- **Potential impact** — reliable, comparable measurement would let regulators, buyers, and the public
  hold AI's footprint accountable and target the real hotspots (idle capacity, memory manufacturing,
  reasoning-model token counts). The key tension: per-query efficiency is improving sharply, yet total
  consumption is still rising — so efficiency alone does not guarantee a smaller footprint.

## Key directions & work

### Per-query inference energy (now cross-validated)
- **Google's median Gemini Apps text prompt: 0.24 Wh, 0.03 gCO₂e, 0.26 mL water** (May 2025) —
  the first hyperscaler *first-party, in-production* measurement, not an estimate.
  [arXiv:2508.15734](https://arxiv.org/abs/2508.15734)
- **The headline number is really an argument about measurement boundaries, not just a figure.**
  Google's *Comprehensive* boundary (0.24 Wh) is **2.4× its own narrow *Existing* boundary** (0.10 Wh),
  which mimics published benchmarks. The full-stack breakdown: active AI accelerators 58% (0.14 Wh),
  host CPU & DRAM 24% (0.06 Wh), **provisioned idle machines 10%** (0.02 Wh), data-center overhead/PUE
  8% (0.02 Wh). That idle + host + overhead tail (~42%) is exactly what accelerator-only studies miss —
  Google argues accelerator energy should be scaled by **1.72×** (vs the 2× MIT Tech Review applied).
- **Epoch's independent estimate (~0.3 Wh for a GPT-4o query)** sits close to Google's measured
  figure. The *older* ~3 Wh number is De Vries 2023's model-based estimate for a **GPT-3.5** prompt
  (A100s, 175B params) — superseded, not directly comparable to a measured median.
  [Epoch](https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use)
- **Caveat — comparability is fragile.** Google reports the **median** (not the mean) because the
  per-prompt distribution is right-skewed by high-token, low-utilization models, which would make the
  mean unrepresentative. And these are *text* prompts: **reasoning models average ~30× more energy** per
  query (driven by token count), per Hugging Face's AI Energy Score analysis.
  [SingularityHub](https://singularityhub.com/2025/12/15/hugging-face-says-ai-models-with-reasoning-use-100x-more-energy-than-those-without/)

### Lifecycle / training footprint
- **Mistral's third-party-reviewed LCA** (life-cycle assessment, with ADEME + Carbone 4, peer-reviewed
  by Resilio/Hubblo): over its first **18 months** (training *plus* inference, to Jan 2025), Mistral
  Large 2 emitted **20,400 tCO₂e** and consumed **~281,000 m³ water**; **training + running was ~85.5%
  of emissions and ~91% of water**. This is the methodological gold standard so far, though limited to a
  single model on France's clean grid. Mistral also reports a **marginal per-prompt** figure: **1.14
  gCO₂e and 45 mL water** for a 400-token *Le Chat* response — ~40× the Gemini water number, showing how
  grid and boundary choices dominate.
  [Mistral](https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai/)

### Macro demand & grid impact
- **IEA: global datacenter electricity roughly *doubles* to ~945 TWh by 2030** (~3% of global use, just
  above Japan's total use today), with AI the main driver. Datacenter consumption grows ~15%/yr (4× the
  rest of the economy), and accelerated-server electricity ~30%/yr. The US and China together account for
  ~80% of the growth.
  [IEA](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)
- **Now visible in grid prices.** PJM capacity prices hit a **record, capping out near $330/MW-day**
  for a third straight auction (the July 2024 auction alone jumped ~9× off a low base). In the Dec 2025
  auction, **data-center load was ~40% (~$6.5B) of the $16.4B capacity cost**, and ~5,100 MW of the
  forecast peak-load increase was attributable to data centers — adding upward pressure to bills already
  set to rise ~1.5–5% for some PJM customers.
  [Utility Dive](https://www.utilitydive.com/news/data-centers-pjm-capacity-auction/808951/)

### Water & embodied carbon (poorly measured)
- **Per-query water spans ~30–150× depending on the measurement boundary.** Altman's OpenAI disclosure
  and Google's measured figure are ~0.3 mL (on-site, consumptive); Li et al. estimate **10–50 mL** for
  GPT-3 when off-site power-generation water is included; Mistral reports **45 mL** per *Le Chat*
  response. Google notes that most operators don't report water-usage efficiency at all.
- **Embodied carbon — now has *two* first-party anchors, but on different hardware:**
  - **Google TPUs (measured, first-party LCA):** per-TPU embodied CO₂e ranges **~386 kg (v4i) →
    ~692 kg (v6e/Trillium) → ~1,101 kg (v5p)**; **operational electricity dominates lifetime emissions
    at ~70–90%, embodied <25%, DC construction <5%**. **Memory (HBM + host DRAM) averages ~38%** of
    *manufacturing* emissions and is the fastest-growing hotspot (v6e roughly doubled manufacturing
    emissions vs v5e, driven by 3× host DRAM and larger HBM). Compute carbon intensity (CO₂e/ExaFLOP)
    improved **3× from v4i → v6e** across two generations.
    [arXiv:2502.01671](https://arxiv.org/abs/2502.01671)
  - **NVIDIA H100 (vendor PCF, separate source):** an **8×H100 baseboard ~1,312 kg CO₂e** embodied
    (~164 kg/card), with **memory ~42%** of material impact, ICs ~25%, thermal ~18%. ⚠️ This is the
    NVIDIA H100 product-carbon-footprint disclosure — *not* from the Google TPU LCA above.
    [NVIDIA PCF](https://images.nvidia.com/aem-dam/Solutions/documents/HGX-H100-PCF-Summary.pdf)

### The rebound question
> **📦 Concept: Jevons paradox** — efficiency gains can *increase* total consumption by making the
> resource cheaper to use. The textbook signature: Google's **33× per-prompt** energy drop in one year
> sits alongside IEA's projection that **total** datacenter demand roughly **doubles by 2030** — falling
> intensity, rising totals.

- **Luccioni, Strubell & Crawford (FAccT 2025) argue the binary "is AI net positive?" question is
  itself the problem.** Per-prompt efficiency (Koomey's Law, better hardware and algorithms) does *not*
  imply falling total consumption. They invoke **Sorrell's critique** that Jevons over-simplifies the
  causal chain (efficiency → price → adoption → behavior), and call for **lifecycle assessment plus
  socio-economic analysis**, not technical metrics alone. [arXiv:2501.16548](https://arxiv.org/abs/2501.16548)
- **The paper's taxonomy of rebound** (extending Börjesson-Rivera): *substitution* (AI imagery
  replacing other media), *scale/space* effects (shrinking devices, ballooning hyperscale DCs),
  **direct economic rebound** (NVIDIA shipped **3.7M GPUs in 2024**, >1M more than 2023, even as
  per-unit efficiency rose), *induction* (AI-targeted advertising — a top commercial use — driving
  consumption), and *time* rebound (freed time re-spent on higher-footprint activities).
- **They flag DeepSeek-R1 as the cautionary case:** trained with relatively *less* energy (due to GPU
  export limits), yet its **reasoning** behavior generates far more inference-time tokens — and so more
  energy per query — while its ~700B size needs many high-memory GPUs to deploy. Efficiency at one layer,
  rebound at another.
- **Core claim:** the field "lacks the measurement framework" to attribute *net* effects after rebound,
  and absent mandatory transparency the climate-benefit debate "risks devolving into corporate branding."

### What actually drove Google's 33×/44×
The Google paper attributes the **44× emissions cut** (May 2024 → May 2025) to compounding levers, not
one trick:
- a **33× energy/prompt** drop — **23× from model improvements** (MoE, hybrid reasoning,
  quantization/AQT, distillation into Flash/Flash-Lite) plus **1.4× from better machine utilization**;
- a **1.4× cleaner-grid factor** (carbon-free-energy procurement cut Google's fleetwide Scope-2
  market-based intensity ~30% in a year);
- a **36× Scope 1+3** drop from fewer machine-hours per prompt (less amortized embodied carbon).

Underlying serving techniques include speculative decoding, disaggregated prefill/decode, KV caching, the
XLA/Pallas/Pathways stack, custom TPUs (Ironwood ~30× more energy-efficient than Google's first TPU),
and a fleet PUE of **1.09**. Takeaway: software and architecture efficiency, not just clean energy, did
the heavy lifting — and you can only *see* that with a full-stack metric.

### Responses
- **Carbon-aware scheduling** works for *delay-tolerant* training but less for latency-sensitive
  inference. **Nuclear procurement** (Microsoft/Three Mile Island, Amazon, Google/Kairos, Meta) and
  power-purchase agreements (PPAs) mostly come online in 2028+, so near-term growth leans on gas. The
  Luccioni paper warns that PPAs and offsets are a temporary "stop-gap," not a substitute for emissions
  reductions (citing additionality problems and unbundled-EAC critiques).
- **Standardized reporting is the central gap** both papers converge on. Google argues a
  *comprehensive, common measurement boundary* is the prerequisite for comparability ("without it,
  figures vary by orders of magnitude"); Luccioni et al. argue ESG-style disclosure today is too narrow
  and call for mandatory, granular, measured (not estimated) reporting across supply chain, lifecycle,
  and e-waste.

## State of research

**Well-measured (for one vendor each):** per-query *operational* inference energy — though only Google
has published a first-party in-production median (0.24 Wh), with Epoch's independent ~0.3 Wh estimate
agreeing in order of magnitude; leading-operator PUE/WUE; lab-controlled relative efficiency. Embodied
carbon now has first-party anchors too (Google TPU LCA; NVIDIA H100 PCF), but they cover *different*
hardware and aren't cross-comparable.

**Reasonably bounded but uncertain:** macro datacenter demand (IEA ~945 TWh by 2030), now corroborated
by observed PJM grid prices — though bottom-up buildout sums run higher.

**Poorly measured / open:** water (~30–150× boundary spread, on-site vs power-generation-inclusive);
**embodied/manufacturing carbon beyond the two vendor disclosures** (HBM is the rising hotspot, but most
operators disclose nothing); **total** sector footprint and the **net** effect of efficiency after
rebound; **reasoning-model and agentic energy** (the ~30× multiplier is the fast-moving frontier); and
the absence of mandatory, public, *measured* (not estimated) reporting. Numbers across sources aren't
comparable because boundaries are inconsistent (market- vs location-based carbon, median vs mean query,
GPU-only vs full-facility, on-site vs lifecycle water). Connects to
[hardware](hardware-and-neuromorphic.md) and the
[capital/power buildout](../12-politics-capital-and-business-models/geopolitics-and-policy.md).
