# Verification Checklist

The map was originally compiled from **search-result extraction** (automated full-text fetch was
frequently blocked), so specific figures and some 2026-dated arXiv IDs were not confirmed against
primary full text. **Status (2026-06-21):** the 192 cited arXiv papers were downloaded and a
full-text verification + enrichment pass was run over all 58 paper-citing leaf docs, followed by a
second pass that verified the remaining outstanding items and integrated several previously-uncited
papers. The tables below record the final state. See [methodology & caveats](methodology-and-sources.md)
for the general caveat and [source index](source-index.md) for the full bibliography.

**Legend:** ✅ verified against full text · ⚠️ corrected (claim or ID was wrong — citing leaf fixed) ·
◑ partially verified · ☐ still unverified (no primary source reachable).

## Tier 1 — load-bearing claims (final status)

| Status | Claim / figure | Source | Finding |
|--------|----------------|--------|---------|
| ✅ | AlphaProof Nexus solves open Erdős/OEIS problems | [2605.22763](https://arxiv.org/abs/2605.22763) | True, made precise: **9 of 353** open Erdős + **44 of 492** OEIS conjectures (`mathematics`) |
| ✅ | Isomorphic IsoDDE "50% vs ~23%", $2.1B raise, 2026 trials | isomorphiclabs.com + PR | Verified: 50% (30/60) on hardest cofolding bin vs AF3 ~23%; $2.1B Series B (Thrive), May 12 2026; clinical trials targeted 2026 |
| ✅ | WeatherNext 2 "beats on 99.9% of variables" | blog.google | Verified (8×/99.9%/FGN) (`weather-physics-and-climate`) |
| ✅ | Constitutional Classifiers++ flag-rate figures | [2601.04603](https://arxiv.org/abs/2601.04603) | Verified: **0.05%** on Sonnet 4.5 vs **0.38%** prior (`robustness-and-jailbreaks`) |
| ✅ | "Self-play only improves with learnable info gain" | [2603.02218](https://arxiv.org/abs/2603.02218) | Verified; 2026 ID confirmed real (`training-methods-and-rl`) |
| ✅ | "Theory of Generalization" (feature-learning regime) | [2605.01172](https://arxiv.org/abs/2605.01172) | Verified (O(1) kernel-drift / signal-reservoir decomposition) (`scaling-laws-and-theory`) |
| ✅ | "TTT is secretly linear attention" | [2602.21204](https://arxiv.org/abs/2602.21204) | Verified (analytic reduction, ≤4.0× speedup) (`post-transformer-architectures`) |
| ✅ | Agentic credit-assignment survey (~47 methods) | [2604.09459](https://arxiv.org/abs/2604.09459) | Verified: **exactly 47** methods (`rl-for-reasoning`) |
| ✅ | Benchmark-saturation systematic study | [2602.16763](https://arxiv.org/abs/2602.16763) | Verified + **integrated**: "When AI Benchmarks Plateau", 29/60 saturated, age+scale predict it (Bayesian R²=0.884) (`evaluation-science-and-benchmarks`) |
| ⚠️ | Persona-vectors model-diffing "~91% accuracy" | ~~2604.17031~~ → [2506.19823](https://arxiv.org/abs/2506.19823) | **Mis-attributed + unconfirmed in primary.** ~91%/AUC≈0.95 traces only to a secondary summary; citing leaves downgraded to the paper's "toxic persona feature predicts misalignment" framing. Kept distinct from Anthropic's [2507.21509](https://arxiv.org/abs/2507.21509) |
| ⚠️ | MCP/A2A/Agora/ANP protocol-security analysis | ~~2602.11327~~ → [2503.23278](https://arxiv.org/abs/2503.23278) + [2505.02279](https://arxiv.org/abs/2505.02279) | Re-grounded on verified primaries (`multi-agent-systems`) |
| ✅ | Repo-level code-reasoning bench ("SWE-EVO") | [2601.03731](https://arxiv.org/abs/2601.03731) (RepoReason) + [2512.18470](https://arxiv.org/abs/2512.18470) (SWE-EVO) | Verified + **integrated**: the candidate ID is **RepoReason** (abductive assertion verification, DFI bottleneck); "SWE-EVO" is a *separate* real benchmark (2512.18470) (`ai-for-software-engineering`) |
| ✅ | Persistent code-agent memory | [2602.21611](https://arxiv.org/abs/2602.21611) | Verified + **integrated** (corrected): subtask-level functional memory, +4.7pp SWE-bench Verified — not a "cross-session" store (`agents-and-tool-use`) |
| ✅ | Graph agent-memory architectures (MAGMA etc.) | [2601.03236](https://arxiv.org/abs/2601.03236) | ID verified real (`rag-and-memory-systems`) |
| ✅ | Clinical world model ("/ DeepTutor") | [2604.08226](https://arxiv.org/abs/2604.08226) | Verified + **integrated**: Clinical World Model + Skill-Mix framework paper. "DeepTutor" was a wrong conflation — it is the separate [2604.26962](https://arxiv.org/abs/2604.26962) (`domain-applications`) |
| ✅ | LeanMarathon autoformalization | [2606.05400](https://arxiv.org/abs/2606.05400) | ID verified real (`mathematics`) |
| ✅ | DeepSeek-V4 efficiency specifics | [2606.19348](https://arxiv.org/abs/2606.19348) | Verified + **integrated**: V4-Pro 1.6T/49B, 1M context, **27% FLOPs / 10% KV cache vs V3.2**; CSA+HCA, mHC, Muon (`long-context-and-memory`, `efficiency-quantization-and-inference`, `chinese-labs`) |
| ⚠️ | LeCun AMI Labs / VL-JEPA specifics | ~~2601.17094~~ → press | **Refuted as a citation:** 2601.17094 is an unrelated single-author paper ("the Mouth is Not the Brain"). AMI Labs (~$1.03B seed, ~$3.5B, Mar 2026) and Meta VL-JEPA are real but re-sourced to press (`emerging-labs`) |
| ✅ | Recursive Superintelligence $650M / $4.65B raise | TechCrunch 2026-05-14 | Verified ($650M, $4.65B, Richard Socher) |
| ⚠️ | Thinking Machines "interaction models" 276B MoE | MarkTechPost | Recast as research preview (TML-Interaction-Small, 276B/12B); Tinker shipped (`emerging-labs`) |

## Tier 2 — exact arXiv ID (all confirmed)

| Status | Item | ID |
|--------|------|-----|
| ✅ | Falcon-H1 technical report | [2507.22448](https://arxiv.org/abs/2507.22448) |
| ✅ | GLM-4.5 technical report | [2508.06471](https://arxiv.org/abs/2508.06471) (2507.01006 is the GLM-4.5**V** vision paper) |
| ✅ | Fault-Tolerant HSDP authoring org | [2602.00277](https://arxiv.org/abs/2602.00277) |
| ✅ | Nested Learning / "Hope" | [2512.24695](https://arxiv.org/abs/2512.24695) (on disk; placeholder cleared in `post-transformer-architectures`) |

## Tracked single-source / vendor / secondary figures

These are correct as far as we can tell but rest on a vendor disclosure, a single source, or a
secondary summary — re-verify against a neutral primary if cited externally:

- **NVIDIA Dynamo throughput** → corrected to "up to 30×" (was "7×"), NVIDIA-reported (`systems-and-infrastructure`).
- **IBM NorthPole "72.7×"** → confirmed against the paper (`hardware-and-neuromorphic`).
- **Hardware FLOPs (Rubin/VR200, MI400)** and **EDA PPA gains (Cadence/Synopsys "~20%")** — vendor figures, no neutral primary (`hardware-and-neuromorphic`, `ai-for-chip-design`).
- **INTELLECT-2** decentralized-training internals (590 Mb/s, 14 min, 100×, 1:4) — single-source (the paper itself) (`open-source-and-decentralized`).
- **Persona-vectors ~91% / AUC 0.95** — secondary summary only; downgraded in-text (see Tier 1).
- **Cartesia Sonic "$300M ARR" / "Speech Arena 2026"** — unverified; flagged/dropped in-text (`emerging-labs`, `speech-and-audio-ai`).
- **NVIDIA H100 PCF (1,312 kg / 42% HBM)** — vendor PCF via search summary, not the parseable datasheet (`energy-and-sustainability`).
- **Science aea3884 (persuasion study)** — paywalled; figures cross-verified via secondary (`safety-institutes-and-governance`).

## Genuinely still open (no reachable primary)

- Repository-level "persistent code memory" beyond the subtask-memory paper; some mechanistic-interp
  pointers (reasoning-model diffing, "CodeCircuit") — flagged inline, IDs unresolved.

## How to read this
Items marked ⚠️ had their citing leaf corrected during the pass. Items still marked ☐/open had no
full-text source reachable. The citing documents for any URL are listed in the
[source index](source-index.md).
