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

## Defense / national-security AI
The frontier labs are now direct defense contractors, and procurement has become a venue for
fights over model-use red lines.
- **Pentagon "frontier AI" awards (Jul 2025).** The DoD Chief Digital & AI Office (CDAO) gave
  ceiling **$200M** Other-Transaction agreements to **OpenAI** (first, Jun 2025), then
  **Anthropic, Google, and xAI** (Jul 14, 2025) to develop **agentic AI workflows** across
  national-security mission areas. [DefenseScoop](https://defensescoop.com/2025/07/14/pentagon-ai-contracts-musk-xai-google-openai-anthropic-cdao/) · [CNBC](https://www.cnbc.com/2025/07/14/anthropic-google-openai-xai-granted-up-to-200-million-from-dod.html) · [Anthropic](https://www.anthropic.com/news/anthropic-and-the-department-of-defense-to-advance-responsible-ai-in-defense-operations)
- **Classified-network deployment (May 1, 2026).** DoD signed agreements with **eight** firms —
  **Google, Microsoft, AWS, NVIDIA, OpenAI, SpaceX, Oracle, and Reflection** — to run their AI on
  **IL6** (Secret) and **IL7** (Top Secret / most sensitive) networks, explicitly to "prevent AI
  vendor lock." [DoD release](https://www.war.gov/News/Releases/Release/Article/4475177/classified-networks-ai-agreements/) · [TechCrunch](https://techcrunch.com/2026/05/01/pentagon-inks-deals-with-nvidia-microsoft-and-aws-to-deploy-ai-on-classified-networks/)
- **The Anthropic dispute — red lines vs. procurement.** Anthropic was **excluded** from the May
  2026 cohort after refusing the Pentagon's demand for unrestricted use. Dario Amodei held two
  red lines: no **fully autonomous weapons** (distinct from human-in-the-loop systems) and no
  **domestic mass surveillance** of Americans (distinct from lawful foreign intelligence). [DefenseScoop](https://defensescoop.com/2026/05/01/dod-expands-classified-ai-work-with-8-companies-excluding-anthropic/) · [Amodei statement](https://www.anthropic.com/news/statement-department-of-war)
- **Escalation & litigation.** DoD designated Anthropic a **"supply-chain risk"** (early Mar 2026)
  — reportedly the first time the label was applied to a US company — and the administration
  directed agencies to cease using its tech. A federal judge (Rita Lin) **blocked** the
  designation on **First Amendment** grounds (Mar 26, 2026), calling it "classic illegal First
  Amendment retaliation"; a DC appeals court then **declined to extend** that block while the suit
  proceeds (Apr 8, 2026). [CNN](https://edition.cnn.com/2026/03/26/business/anthropic-pentagon-injunction-supply-chain-risk) · [NPR](https://www.npr.org/2026/03/26/nx-s1-5762971/judge-temporarily-blocks-anthropic-ban) · [CNBC](https://www.cnbc.com/2026/04/08/anthropic-pentagon-court-ruling-supply-chain-risk.html)
- **Export-control / dual-use tie-in.** The same dual-use logic that gates chips now reaches
  models: BIS established **worldwide license requirements on closed-weight model weights** above
  **10²⁶** training operations (ECCN 4E091), on the theory that frontier models can act as an
  "on-demand technical consultant" for weapons-relevant know-how controlled under EAR/ITAR. [BIS](https://www.bis.gov/press-release/biden-harris-administration-announces-regulatory-framework-responsible-diffusion-advanced-artificial) · [Just Security](https://www.justsecurity.org/126643/ai-model-outputs-export-control/)

See [08 · Safety institutes & governance](../08-evaluation-and-governance/safety-institutes-and-governance.md)
and [09 · US frontier labs](../09-global-lab-ecosystem/us-frontier-labs.md).

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
