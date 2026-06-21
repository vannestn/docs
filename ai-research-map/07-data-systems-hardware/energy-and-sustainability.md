# Energy & Environmental Sustainability

The measured (and unmeasured) energy, carbon, and water footprint of AI — a field where the
*measurement methodology* is as contested as the numbers.

## Key directions & work

### Per-query inference energy (now cross-validated)
- **Google's median Gemini text prompt: 0.24 Wh, 0.03 gCO₂e, 0.26 mL water** — the first
  hyperscaler first-party disclosure. [arXiv:2508.15734](https://arxiv.org/pdf/2508.15734)
- **Epoch's independent estimate (~0.3 Wh for a GPT-4o query)** converges with Google's measured
  figure — the strongest cross-validated result in the field — debunking the older ~3 Wh number.
  [Epoch](https://epoch.ai/gradient-updates/how-much-energy-does-chatgpt-use)
- **Caveat:** these are *median* text prompts; **reasoning models use ~30× more energy per query**.

### Lifecycle / training footprint
- **Mistral's third-party-reviewed LCA** — training Mistral Large 2 emitted 20,400 tCO₂e and
  ~281,000 m³ water; the methodological gold standard so far (but single-model, France's clean grid).
  [Mistral](https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai/)

### Macro demand & grid impact
- **IEA: global datacenter electricity ~doubles to ~945 TWh by 2030** (~3% of global), AI the main
  driver. [IEA](https://www.iea.org/reports/energy-and-ai/energy-demand-from-ai)
- **Now visible in prices** — PJM wholesale up ~75% YoY and capacity prices >10× the 2024/25 level,
  with datacenter growth named as the driver — shifting cost onto households.

### Water & embodied carbon (poorly measured)
- **Per-query water spans ~30–80× by measurement boundary** (0.3 mL on-site vs 10–25 mL including
  power generation); <⅓ of operators report water-usage efficiency at all.
- **Embodied carbon** of an 8×H100 board ~1,312 kg CO₂e, with **memory (HBM) the emerging hotspot
  (~42%)** — but these are *modeled*, not vendor-disclosed. [arXiv:2502.01671](https://arxiv.org/pdf/2502.01671)

### The rebound question
> **📦 Concept: Jevons paradox** — efficiency gains can *increase* total consumption by making the
> resource cheaper to use. Google's 33× per-prompt energy drop coexists with *doubling* total
> demand — the textbook Jevons signature.

- The field "lacks the measurement framework" to attribute *net* effects after rebound. Luccioni &
  Strubell — [FAccT 2025, arXiv:2501.16548](https://arxiv.org/abs/2501.16548)

### Responses
- **Carbon-aware scheduling** (Google) works for *delay-tolerant* training, less for latency-
  sensitive inference. **Nuclear procurement** (10+ GW signed: Microsoft/Three Mile Island, Amazon,
  Google/Kairos, Meta) is mostly 2028+, so near-term growth leans on gas.
- **Standardized reporting** is the central gap — the EU AI Act allows *estimates* over measured
  carbon and discloses only to regulators; harmonized standards may not arrive until ~2028.

## State of research

**Well-measured:** per-query *operational* inference energy for major chatbots (~0.2–0.3 Wh,
measured + estimated agree); leading-operator PUE/WUE; lab-controlled relative efficiency.

**Reasonably bounded but uncertain:** macro datacenter demand (IEA), now corroborated by observed
grid prices — though bottom-up buildout sums run higher.

**Poorly measured / open:** water (30–80× boundary spread); **embodied/manufacturing carbon**;
**total** sector footprint and the **net** effect of efficiency after rebound; the absence of
mandatory, public, *measured* (not estimated) reporting. Numbers across sources aren't comparable
because of boundary inconsistency (market- vs location-based carbon, median vs mean query,
GPU-only vs full-facility). Connects to [hardware](hardware-and-neuromorphic.md) and the
[capital/power buildout](../12-politics-capital-and-business-models/geopolitics-and-policy.md).
