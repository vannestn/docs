# Pilot drafts — publication-grade Introduction & Methods

*Written 2026-07-09. One paper draft per candidate pilot from [16 · pilot candidates](../16-pilot-candidates.md),
each written to genuine submission quality: working title, target venue, abstract, a full **Introduction** (stakes,
gap, prior-work delta, contributions) and a full **Methods** (data, the method formalized, baselines, metrics,
human validation, statistics, pre-registered success/kill criteria, reproducibility & budget). Citations are the
verified references from docs 14/15 (arXiv IDs/DOIs checked; none fabricated).*

*These are drafts of the paper each pilot would produce — Introduction + Methods only (no Results yet, since the
study hasn't been run). They double as pre-registrations: the success and kill criteria are written before any
data is collected.*

| # | Draft | Working title | Target venue | The riskiest design bet |
|--:|---|---|---|---|
| 1 | [Ingestion Corruption Detector](01-ingestion-corruption-detector.md) | Render-Invariance as a Free Oracle for Silent Numeric Corruption in Document-to-LLM Pipelines | ACL/EMNLP or SIGIR RAG/eval workshop; arXiv | The "render-only-caught set" is non-empty (confident-consistent corruptions still flip under null render perturbations) — this is the pre-registered kill line. |
| 2 | [Reviewer Scrutiny Metric](02-reviewer-scrutiny-metric.md) | The Stamp Score: Measuring Review Depth on AI-Generated Pull Requests and Validating It Against Revert History | SE / human-AI workshop (MSR, ICSE/EASE, CSCW); arXiv | Merge-then-revert/hotfix is a usable proxy for "reviewer missed a real defect" (heavily confounded; positive class may be too rare). |
| 3 | [PV-Grade](03-pv-grade.md) | PV-Grade: A Public Benchmark for the Decision Quality of LLMs on Liability-Bearing Pharmacovigilance Tasks | ML4H/ClinicalNLP workshop + *Drug Safety* journal; arXiv | Anchoring the causality leaderboard to a ~60–80-case two-rater gold set for a decision with no universal reference standard. |
| 4 | [Code-Review Catch-vs-Noise](04-code-review-catch-vs-noise.md) | Catch versus Noise: An Operating-Characteristic Benchmark for AI Code Review | ICSE/FSE/ISSTA or ML4Code workshop / NeurIPS Evals; arXiv | NullPatch traps being *truly* behavior-preserving (oracles are only probabilistic). |
| 5 | [Multilingual Safety Meter](05-multilingual-safety-meter.md) | Measuring Per-Language Safety Parity Under an Unreliable Judge | ACL-family workshop (TrustNLP/MRL/SoLaR); arXiv | Translation failures route to UNCLEAR rather than a fluent-but-wrong COMPLY (identifiability). |
| 6 | [Injection Defense Report Card](06-injection-defense-report-card.md) | The Injection Defense Report Card: A Standardized, Independent Adaptive-Robustness Protocol | NeurIPS/ICLR safety or SaTML workshop; arXiv | Authority-vs-budget: a ≤$500 solo fields weaker attacks, so a good grade may reflect under-attacking. |

**How to read these.** Each is a real draft, not a summary — the Methods sections are detailed enough to run from.
Every draft states its own kill criterion, so a null result is a publishable outcome (see the labeling &
publishability analysis folded into [doc 16](../16-pilot-candidates.md)). They are unrun: the point of the pilot is
to execute the Methods and fill in Results.
