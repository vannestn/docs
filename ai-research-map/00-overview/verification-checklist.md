# Verification Checklist

The map was compiled largely from **search-result extraction** (automated full-text fetch was
frequently blocked), so specific figures and some 2026-dated arXiv IDs are not yet confirmed
against primary full text. This checklist tracks the **load-bearing items most worth a manual
check** before they're cited externally. See [methodology & caveats](methodology-and-sources.md)
for the general caveat and [source index](source-index.md) for the full bibliography.

**Legend:** ☐ unverified · confidence is the compiler's estimate that the claim holds as stated.

## Tier 1 — Must verify (load-bearing claims on secondary / unconfirmed sources)

| ☐ | Claim / figure | Source to open | Confidence |
|---|----------------|----------------|------------|
| ☐ | AlphaProof Nexus solves open Erdős/OEIS problems | arxiv.org/abs/2605.22763 | Med |
| ☐ | Isomorphic IsoDDE "50% vs 23.3%", $2.1B raise, 2026 trials | isomorphiclabs.com (article) | Med |
| ☐ | WeatherNext 2 "beats on 99.9% of variables" | blog.google/…/weathernext-2 | Med |
| ☐ | Constitutional Classifiers++ flag-rate figures | arxiv.org/abs/2601.04603 | Med |
| ☐ | "Self-play only improves with learnable info gain" | arxiv.org/abs/2603.02218 | Low |
| ☐ | "Theory of Generalization" (feature-learning regime) | arxiv.org/abs/2605.01172 | Low |
| ☐ | "TTT is secretly linear attention" | arxiv.org/abs/2602.21204 | Med |
| ☐ | Agentic credit-assignment survey (~47 methods) | arxiv.org/html/2604.09459 | Med |
| ☐ | Benchmark-saturation systematic study | arxiv.org/pdf/2602.16763 | Med |
| ☐ | Persona-vectors model-diffing "~91% accuracy" | arxiv.org/abs/2604.17031 | Low |
| ☐ | MCP/A2A/Agora/ANP protocol-security analysis | arxiv.org/pdf/2602.11327 | Med |
| ☐ | Repo-level code-reasoning bench / SWE-EVO | arxiv.org/pdf/2601.03731 | Med |
| ☐ | Persistent code-agent memory | arxiv.org/pdf/2602.21611 | Low |
| ☐ | Graph agent-memory architectures (MAGMA etc.) | arxiv.org/html/2601.03236 | Low |
| ☐ | Clinical world model / DeepTutor | arxiv.org/pdf/2604.08226 | Low |
| ☐ | LeanMarathon autoformalization | arxiv.org/html/2606.05400 | Low |
| ☐ | DeepSeek-V4 efficiency specifics (no primary report fetched) | (find primary tech report) | Low |
| ☐ | LeCun AMI Labs funding + VL-JEPA specifics | arxiv.org/abs/2601.17094 + press | Low |
| ☐ | Recursive Superintelligence $650M / $4.65B raise | TechCrunch (2026-05-14) | Med |
| ☐ | Thinking Machines "interaction models" 276B MoE | MarkTechPost (2026-05-13) | Low |

## Tier 2 — Confirm the exact arXiv ID only (claim well-corroborated)

| ☐ | Item | Expected ID |
|---|------|-------------|
| ☐ | Falcon-H1 technical report | 2507.22448 |
| ☐ | GLM-4.5 technical report | 2508.06471 |
| ☐ | Fault-Tolerant HSDP authoring org | 2602.00277 |

## Not independently verifiable — flag as "vendor-reported"

Hardware FLOPs (Rubin/MI400), NVIDIA Dynamo "7×", IBM NorthPole "72.7× efficiency", and
vendor EDA PPA-gain claims (Cadence/Synopsys "~20%") are **vendor figures with no neutral
primary** — cite as vendor-reported, not benchmarked.

## How to clear an item
Open the primary source, confirm the figure/ID matches the claim, then check the box and (if
needed) correct the citing leaf. The citing documents for any URL are listed in the
[source index](source-index.md).
