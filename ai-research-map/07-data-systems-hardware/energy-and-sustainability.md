# Energy & Environmental Sustainability

The measured (and unmeasured) energy, carbon, and water footprint of AI — a field where the
*measurement methodology* is as contested as the numbers.

## Key directions & work

### Per-query inference energy (now cross-validated)
- **Google's median Gemini Apps text prompt: 0.24 Wh, 0.03 gCO₂e, 0.26 mL water** (May 2025) —
  the first hyperscaler *first-party, in-production* measurement, not an estimate.
  [arXiv:2508.15734](https://arxiv.org/abs/2508.15734)
- **The headline number is a measurement-boundary argument, not just a figure.** Google's
  *Comprehensive* boundary (0.24 Wh) is **2.4× its own narrow *Existing* boundary** (0.10 Wh) that
  mimics published benchmarks. The full-stack breakdown: active AI accelerators 58% (0.14 Wh),
  host CPU & DRAM 24% (0.06 Wh), **provisioned idle machines 10%** (0.02 Wh), data-center overhead/PUE
  8% (0.02 Wh). The idle + host + overhead tail (~42%) is exactly what accelerator-only studies miss —
  Google argues a **1.72× scaling** on accelerator energy is needed (vs the 2× MIT Tech Review applied).
- **Epoch's independent estimate (~0.3 Wh for a GPT-4o query)** sits close to Google's measured
  figure. The *older* ~3 Wh number is De Vries 2023's model-based estimate for a **GPT-3.5** prompt
  (A100s, 175B params) — superseded, not directly comparable to a measured median.
  [Epoch](https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use)
- **Caveat — comparability is fragile.** Google chooses the **median** (not mean) because the
  per-prompt distribution is right-skewed by high-token / low-utilization models; the mean would be
  unrepresentative. And these are *text* prompts: **reasoning models average ~30× more energy** per
  query (token-count driven), per Hugging Face's AI Energy Score analysis.
  [SingularityHub](https://singularityhub.com/2025/12/15/hugging-face-says-ai-models-with-reasoning-use-100x-more-energy-than-those-without/)

### Lifecycle / training footprint
- **Mistral's third-party-reviewed LCA** (with ADEME + Carbone 4, peer-reviewed by Resilio/Hubblo) —
  Mistral Large 2 over its first **18 months** (training *plus* inference, to Jan 2025) emitted
  **20,400 tCO₂e** and consumed **~281,000 m³ water**; **training+running was ~85.5% of emissions and
  ~91% of water**. The methodological gold standard so far (but single-model, France's clean grid).
  Mistral also reports a **marginal per-prompt** figure: **1.14 gCO₂e and 45 mL water** for a 400-token
  *Le Chat* response — ~40× the Gemini water number, illustrating how grid + boundary choices dominate.
  [Mistral](https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai/)

### Macro demand & grid impact
- **IEA: global datacenter electricity roughly *doubles* to ~945 TWh by 2030** (~3% of global, just
  above Japan's total use today), AI the main driver — DC consumption grows ~15%/yr (4× the rest of
  the economy), with accelerated-server electricity up ~30%/yr. The US + China are ~80% of the growth.
  [IEA](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)
- **Now visible in grid prices.** PJM capacity prices hit a **record, capping out near $330/MW-day**
  for a third straight auction (the July 2024 auction alone jumped ~9× off a low base). In the Dec 2025
  auction, **data-center load was ~40% (~$6.5B) of the $16.4B capacity cost**, and ~5,100 MW of the
  forecast peak-load increase was attributable to data centers — upward pressure on bills already set
  to rise ~1.5–5% for some PJM customers.
  [Utility Dive](https://www.utilitydive.com/news/data-centers-pjm-capacity-auction/808951/)

### Water & embodied carbon (poorly measured)
- **Per-query water spans ~30–150× by measurement boundary.** Altman's OpenAI disclosure and Google's
  measured figure are ~0.3 mL (on-site, consumptive); Li et al. estimate **10–50 mL** for GPT-3
  including off-site power-generation water; Mistral reports **45 mL** per *Le Chat* response. Google
  notes most operators don't report water-usage efficiency at all.
- **Embodied carbon — now has *two* first-party anchors, and they're different hardware:**
  - **Google TPUs (measured, first-party LCA):** per-TPU embodied CO₂e ranges **~386 kg (v4i) →
    ~692 kg (v6e/Trillium) → ~1,101 kg (v5p)**; **operational electricity dominates lifetime emissions
    at ~70–90%, embodied <25%, DC construction <5%**. **Memory (HBM + host DRAM) averages ~38%** of
    *manufacturing* emissions and is the fastest-growing hotspot (v6e roughly doubled manufacturing
    emissions vs v5e, driven by 3× host DRAM and larger HBM). Compute carbon intensity (CO₂e/ExaFLOP)
    improved **3× from v4i → v6e** in two generations.
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
  itself the problem.** Per-prompt efficiency (Koomey's Law, better hardware/algorithms) does *not*
  imply falling total consumption; they invoke **Sorrell's critique** that Jevons over-simplifies the
  causal chain (efficiency → price → adoption → behavior) and call for **lifecycle assessment + socio-
  economic analysis**, not technical metrics alone. [arXiv:2501.16548](https://arxiv.org/abs/2501.16548)
- **The paper's taxonomy of rebound** (extending Börjesson-Rivera): *substitution* (AI imagery
  replacing other media), *scale/space* effects (shrinking devices, ballooning hyperscale DCs),
  **direct economic rebound** (NVIDIA shipped **3.7M GPUs in 2024**, >1M more than 2023, even as
  per-unit efficiency rose), *induction* (AI-targeted advertising — a top commercial use — driving
  consumption), and *time* rebound (freed time re-spent on higher-footprint activities).
- **They flag DeepSeek-R1 as the cautionary case:** trained with relatively *less* energy (GPU export
  limits), yet its **reasoning** behavior generates far more inference-time tokens → more energy per
  query, and its ~700B size needs many high-memory GPUs to deploy. Efficiency at one layer, rebound at
  another.
- **Core claim:** the field "lacks the measurement framework" to attribute *net* effects after rebound,
  and absent mandatory transparency the climate-benefit debate "risks devolving into corporate branding."

### What actually drove Google's 33×/44×
The Google paper attributes the **44× emissions cut** (May 2024 → May 2025) to compounding levers, not
one trick: a **33× energy/prompt** drop (**23× from model improvements** — MoE, hybrid reasoning,
quantization/AQT, distillation into Flash/Flash-Lite; **1.4× from better machine utilization**), plus a
**1.4× cleaner-grid factor** (CFE procurement cut Google's fleetwide Scope-2 MB intensity ~30% in a
year), and a **36× Scope 1+3** drop from fewer machine-hours/prompt (less amortized embodied carbon).
Underlying serving techniques: speculative decoding, disaggregated prefill/decode, KV caching, the
XLA/Pallas/Pathways stack, custom TPUs (Ironwood ~30× more energy-efficient than Google's first TPU),
and a fleet PUE of **1.09**. Takeaway: software/architecture efficiency, not just clean energy, did the
heavy lifting — and you can only *see* that with a full-stack metric.

### Responses
- **Carbon-aware scheduling** works for *delay-tolerant* training, less for latency-sensitive
  inference. **Nuclear procurement** (Microsoft/Three Mile Island, Amazon, Google/Kairos, Meta) and
  PPAs are mostly 2028+, so near-term growth leans on gas — and the Luccioni paper warns PPAs/offsets
  are a temporary "stop-gap," not a substitute for emissions reductions (additionality problems,
  unbundled-EAC critiques).
- **Standardized reporting is the central gap** both papers converge on. Google argues a
  *comprehensive, common measurement boundary* is the prerequisite for comparability ("without it,
  figures vary by orders of magnitude"); Luccioni et al. argue ESG-style disclosure today is too narrow
  and call for mandatory, granular, measured (not estimated) reporting across supply chain, lifecycle,
  and e-waste.

## State of research

**Well-measured (for one vendor each):** per-query *operational* inference energy — but only Google has
published a first-party in-production median (0.24 Wh), and Epoch's independent ~0.3 Wh estimate agrees
in order of magnitude; leading-operator PUE/WUE; lab-controlled relative efficiency. Embodied carbon now
has first-party anchors too (Google TPU LCA; NVIDIA H100 PCF) — but they cover *different* hardware and
aren't cross-comparable.

**Reasonably bounded but uncertain:** macro datacenter demand (IEA ~945 TWh by 2030), now corroborated
by observed PJM grid prices — though bottom-up buildout sums run higher.

**Poorly measured / open:** water (~30–150× boundary spread, on-site vs power-generation-inclusive);
**embodied/manufacturing carbon beyond two vendor disclosures** (HBM is the rising hotspot but most
operators disclose nothing); **total** sector footprint and the **net** effect of efficiency after
rebound; **reasoning-model and agentic energy** (the ~30× multiplier is the fast-moving frontier); and
the absence of mandatory, public, *measured* (not estimated) reporting. Numbers across sources aren't
comparable because of boundary inconsistency (market- vs location-based carbon, median vs mean query,
GPU-only vs full-facility, on-site vs lifecycle water). Connects to
[hardware](hardware-and-neuromorphic.md) and the
[capital/power buildout](../12-politics-capital-and-business-models/geopolitics-and-policy.md).
