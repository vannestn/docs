# Geopolitics & Policy

How national competition, export controls, regulation, and the physical constraints of
compute and power shape who can do frontier AI research.

## US–China competition & export controls
- **Compute access is the lever.** US export controls on advanced chips push Chinese labs
  toward **efficiency research** — much of the linear-attention/sparse-attention innovation
  is a direct response (do more with constrained hardware). See
  [09 · Chinese labs](../09-global-lab-ecosystem/chinese-labs.md).
- **Open weights as strategy.** Chinese labs releasing strong open-weight models (DeepSeek,
  Qwen) both build global influence and route around being locked out of US APIs.
- **Domestic chips.** Efforts like SpikingBrain trained on non-NVIDIA (MetaX) hardware signal
  a push for compute independence.

## Sovereign AI
Countries building their own models/compute to avoid dependence — UAE (Falcon), Korea
(HyperCLOVA/EXAONE), India (Sarvam/BharatGen), Japan (Sakana). See
[09 · European & sovereign labs](../09-global-lab-ecosystem/european-and-sovereign-labs.md).

## Regulation
- **EU AI Act / GPAI Code** — the most consequential binding regime; obligations in force Aug
  2025, enforcement from **Aug 2026**. [EU](https://digital-strategy.ec.europa.eu/en/policies/ai-code-practice)
- **Safety institutes** — UK AISI, US CAISI/NIST now have pre-deployment access to frontier
  models from five labs. See [08 · Safety institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md).
- **Compute governance** — regulating by training-FLOP thresholds (EU systemic-risk tier, US
  reporting); Epoch projects >200 models above 10²⁶ FLOP by 2030, stressing this approach.

## Power & energy (the physical constraint)
> **📦 The binding constraint is electricity, not chips.** Data-center demand is projected to
> ~double to ~945 TWh by 2030 (IEA). Hyperscalers are buying **nuclear** baseload —
> Microsoft (Three Mile Island restart), Google (Kairos SMRs), Amazon (X-energy), Meta
> (multi-GW) — but it won't deliver until ~2028+.

This ties directly to research: efficiency, low-precision training, and alternative computing
(neuromorphic/photonic) are increasingly justified by the **energy crunch**. See
[07 · Hardware](../07-data-systems-hardware/hardware-and-neuromorphic.md).

## State of the dynamic

**Clearest:** Export controls demonstrably shaped Chinese research toward efficiency; the EU
AI Act is real and enforceable; power is now a genuine ceiling on scaling.

**Most uncertain:** Whether compute governance (FLOP thresholds) remains workable as efficiency
improves; whether sovereign efforts achieve real independence; how US–China dynamics evolve.

**Risks & weaknesses:** Regulation races a faster capability frontier and may lock in metrics
(FLOP thresholds) that efficiency gains erode. Energy buildout lags demand. Geopolitical
fragmentation could split the research ecosystem into incompatible blocs — already visible in
diverging open-weight vs. closed, US vs. China stacks.
