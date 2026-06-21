# Verification Checklist

The map was originally compiled from **search-result extraction** (automated full-text fetch was
frequently blocked), so specific figures and some 2026-dated arXiv IDs were not confirmed against
primary full text. **Status (2026-06-21):** the 192 cited arXiv papers were downloaded and a
full-text verification + enrichment pass was run over all 58 paper-citing leaf docs. The table
below records what that pass found. See [methodology & caveats](methodology-and-sources.md) for the
general caveat and [source index](source-index.md) for the full bibliography.

**Legend:** ✅ verified against full text · ⚠️ corrected (claim or ID was wrong — see citing leaf) ·
☐ still unverified (no primary source on disk / out of enrichment scope).

## Tier 1 — load-bearing claims (status after full-text pass)

| Status | Claim / figure | Source | Finding |
|--------|----------------|--------|---------|
| ✅ | AlphaProof Nexus solves open Erdős/OEIS problems | [2605.22763](https://arxiv.org/abs/2605.22763) | True, made precise: **9 of 353** open Erdős problems + **44 of 492** OEIS conjectures (`mathematics`) |
| ☐ | Isomorphic IsoDDE "50% vs 23.3%", $2.1B raise, 2026 trials | isomorphiclabs.com | Out of scope — `drug-discovery-and-clinical` cited no readable arXiv paper |
| ✅ | WeatherNext 2 "beats on 99.9% of variables" | blog.google | Verified (8×/99.9%/FGN) (`weather-physics-and-climate`) |
| ✅ | Constitutional Classifiers++ flag-rate figures | [2601.04603](https://arxiv.org/abs/2601.04603) | Verified: **0.05%** on Sonnet 4.5 vs **0.38%** prior (`robustness-and-jailbreaks`) |
| ✅ | "Self-play only improves with learnable info gain" | [2603.02218](https://arxiv.org/abs/2603.02218) | Verified; 2026 ID confirmed real (`training-methods-and-rl`) |
| ✅ | "Theory of Generalization" (feature-learning regime) | [2605.01172](https://arxiv.org/abs/2605.01172) | Verified (O(1) kernel-drift / signal-reservoir decomposition) (`scaling-laws-and-theory`) |
| ✅ | "TTT is secretly linear attention" | [2602.21204](https://arxiv.org/abs/2602.21204) | Verified (analytic reduction, ≤4.0× speedup) (`post-transformer-architectures`) |
| ✅ | Agentic credit-assignment survey (~47 methods) | [2604.09459](https://arxiv.org/abs/2604.09459) | Verified: **exactly 47** methods (`rl-for-reasoning`) |
| ☐ | Benchmark-saturation systematic study | [2602.16763](https://arxiv.org/abs/2602.16763) | Not opened — `evaluation-science-and-benchmarks` was grounded on its three cited papers instead |
| ⚠️ | Persona-vectors model-diffing "~91% accuracy" | ~~2604.17031~~ → [2506.19823](https://arxiv.org/abs/2506.19823) | **Mis-attributed.** The ~91%/AUC≈0.95 figure is OpenAI's *Persona Features* paper, not Anthropic's *Persona Vectors* ([2507.21509](https://arxiv.org/abs/2507.21509)) (`mechanistic-interpretability`, `model-organisms-of-misalignment`) |
| ⚠️ | MCP/A2A/Agora/ANP protocol-security analysis | ~~2602.11327~~ → [2503.23278](https://arxiv.org/abs/2503.23278) + [2505.02279](https://arxiv.org/abs/2505.02279) | Re-grounded on verified primaries (MCP security study + protocol survey) (`multi-agent-systems`) |
| ☐ | Repo-level code-reasoning bench / SWE-EVO | 2601.03731 | Still unverified — no primary source on disk (`ai-for-software-engineering`) |
| ☐ | Persistent code-agent memory | 2602.21611 | Still unverified — no primary source on disk |
| ✅ | Graph agent-memory architectures (MAGMA etc.) | [2601.03236](https://arxiv.org/abs/2601.03236) | ID verified real (`rag-and-memory-systems`) |
| ☐ | Clinical world model / DeepTutor | 2604.08226 | Out of scope — not cited by an enriched leaf |
| ✅ | LeanMarathon autoformalization | [2606.05400](https://arxiv.org/abs/2606.05400) | ID verified real (`mathematics`) |
| ☐ | DeepSeek-V4 efficiency specifics | (no primary report) | No V4 claim survived in the enriched docs |
| ◑ | LeCun AMI Labs funding + VL-JEPA specifics | [2601.17094](https://arxiv.org/abs/2601.17094) + press | Partial — AMI funding web-verified; VL-JEPA specifics not deep-read (`emerging-labs`) |
| ◑ | Recursive Superintelligence $650M / $4.65B raise | TechCrunch | Partial — founder/role verified; exact raise not confirmed (`emerging-labs`) |
| ⚠️ | Thinking Machines "interaction models" 276B MoE | MarkTechPost | Recast as a research preview (TML-Interaction-Small, 276B/12B); Tinker shipped (`emerging-labs`) |

## Tier 2 — exact arXiv ID (all confirmed)

| Status | Item | ID |
|--------|------|-----|
| ✅ | Falcon-H1 technical report | [2507.22448](https://arxiv.org/abs/2507.22448) |
| ✅ | GLM-4.5 technical report | [2508.06471](https://arxiv.org/abs/2508.06471) (correct ID added to `chinese-labs`; 2507.01006 is the GLM-4.5**V** vision paper) |
| ✅ | Fault-Tolerant HSDP authoring org | [2602.00277](https://arxiv.org/abs/2602.00277) (re-cited from `systems-and-infrastructure`) |

## Vendor-reported figures (status)

- **NVIDIA Dynamo "7×"** → ⚠️ corrected to **up to 30×** (DeepSeek-R1 on GB200 NVL72), verified via NVIDIA (`systems-and-infrastructure`).
- **IBM NorthPole "72.7×"** → ✅ confirmed (3B model from Granite-8B-Code, 28,356 tok/s, HPEC Sept 2024) (`hardware-and-neuromorphic`).
- **Hardware FLOPs (Rubin/MI400)** and **EDA PPA-gain claims (Cadence/Synopsys "~20%")** remain **vendor figures with no neutral primary** — cite as vendor-reported (`hardware-and-neuromorphic`, `ai-for-chip-design`).

## How to read this
Items marked ⚠️ had their citing leaf corrected during the pass — the leaf now carries the right ID
or figure. Items still marked ☐ had no full-text source available on disk and remain genuinely
unconfirmed. Per-doc details are in each leaf's commit; the citing documents for any URL are listed
in the [source index](source-index.md).
