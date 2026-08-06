# 19 · Pilot data paths — legitimacy audit

*Written 2026-07-09. A per-pilot check that each of the six pilots ([16 · pilot candidates](16-pilot-candidates.md))
has a **legitimate, concrete path to obtaining or generating its data** — with sources verified live (existence,
license, size, access), and specifically whether each source is clean to use in a **publicly released** artifact
(not just for private use). Every source below was web-verified this session.*

**Headline: all six are WORKABLE — none is RISKY.** Every pilot has a real data path. Each carries one manageable
caveat, and in three cases the binding risk turned out to be **data volume**, not licensing. The recurring fix:
anchor the *publicly released* dataset on a redistributable source, and use any research-only/licensed source as a
*measure-only* comparison you don't re-host.

| Pilot | Obtain / generate | Release-clean source | The caveat to manage |
|---|---|---|---|
| 1 · Ingestion | obtain + generate | FinTabNet.c (CDLA-2.0) + SynFinTabs (synthetic) + SEC XBRL (public domain) | OHR-Bench is research-only → measure-only, don't re-release its slices |
| 2 · Reviewer Scrutiny | obtain + generate | AIDev (CC-BY-4.0) + git revert labels (self-generated) | **volume**: only ~15% of agent PRs have substantive reviews → check power first; widen via GH Archive |
| 3 · PV-Grade | obtain + generate | openFDA FAERS (CC0 wrapper) + OnSIDES (MIT) + published rules | **MedDRA terms are licensed** → distribute a rebuild script, release de-MedDRA'd labels |
| 4 · SuggestionFix | obtain + generate | CodeReviewer (CC-BY-4.0, Zenodo) + self-mined permissive pairs | github-codereview is "license: other" → internal index only; **<500-gold volume risk** |
| 5 · Multilingual Safety | obtain + generate | RabakBench (modified-MIT) prompts + self-generated responses + native gold | **responses are NOT free** (generate them); Tamil n=156 is thin; avoid M-ALERT (NC) / IndicJR (unclear) for release |
| 6 · Injection Report Card | obtain | AgentDojo / OET / CaMeL / HarmBench / InjecAgent (MIT/Apache) | re-implement (don't vendor) the no-license AdaptiveAttackAgent; grade Meta-SecAlign via weights, not its CC-BY-NC code |

---

## 1 · Ingestion Corruption Detector — WORKABLE
- **Release-clean gold:** **FinTabNet.c** (CDLA-Permissive-2.0, ~89k pages / 112k S&P-500 tables, redistributable, public-domain source PDFs) + **SynFinTabs** (fully synthetic, CC-BY/MIT, self-regenerable — can even mint targeted corruption cases). Leaderboard ground truth: **SEC EDGAR Inline XBRL** (`data.sec.gov`, U.S.-gov public domain, free, no key; only limit is 10 req/s).
- **Generate:** the detector's own signal is label-free — re-render each page at 150/200/300 DPI + raster round-trip + jitter through one fixed engine; value-flips are the labels.
- **Avoid re-releasing:** **OHR-Bench** and **OmniDocBench** — their cards say "research only / non-commercial" (conflicting with the CC-BY/Apache tags) and their PDFs are scraped from "public online channels" (unresolved third-party copyright). Fine to *measure against*; do **not** redistribute derived slices; state the license caveat in the paper.
- **Volume:** sufficient (pre-reg needs ~300–500 tables; the redistributable corpora vastly exceed it; XBRL is unlimited). A built-in dry run gates the corrupted-cell base rate.
- **Draft correction:** [draft 01](pilot-drafts/01-ingestion-corruption-detector.md) leans on OHR-Bench as headline gold → re-anchor the *released* gold on FinTabNet.c + SynFinTabs; keep OHR-Bench measure-only.

## 2 · Reviewer Scrutiny Metric — WORKABLE (volume is the real risk)
- **Obtain:** **AIDev** (`hao-li/AIDev`, CC-BY-4.0 dataset, 33.6k curated PRs) for review text. **Generate:** revert/hotfix labels from local git clones (factual history; releasable as derived labels keyed to public PR/commit IDs). Don't re-host third-party repo code (per-repo licenses).
- **Volume (load-bearing):** only ~15.4% of merged agent PRs have a substantive human review, and defect-driven reverts are rare — so the positive class across 3–5 repos may undershoot the pre-registered power. **Run the power/positive-class dry run first.**
- **Fallback:** **GH Archive on BigQuery** (free 1 TB/mo) to widen to many repos and get PRs + reviews + post-merge events in one source.
- **Draft correction:** [draft 02](pilot-drafts/02-reviewer-scrutiny-metric.md) — foreground the power dry-run; name GH Archive as the scale path.

## 3 · PV-Grade — WORKABLE (MedDRA is the caveat, fixable)
- **Obtain:** **openFDA FAERS** (public-domain/CC0 distribution wrapper); **OnSIDES** (MIT) for expectedness; published **WHO-UMC / Naranjo / CIOMS** rules (apply freely to make your own gold). **Generate:** small expert-adjudicated causality gold.
- **The caveat:** FAERS reaction terms are **MedDRA-coded**, and **MedDRA is licensed** (ICH/MSSO EULA). CC0 covers FDA's *wrapper*, not the MedDRA terminology — a public release must **not** redistribute MedDRA PT strings.
- **Fix / fallback:** ship the benchmark as **code + labels + a rebuild script** that pulls FAERS at the user's end (MedDRA terms never leave FDA's public source); release derived labels + de-MedDRA'd narratives.
- **Volume:** seriousness + expectedness carry the strong claims at scale (~1,000 cases); causality gold is small (expert-limited, as flagged in the labeling audit).
- **Draft correction:** [draft 03](pilot-drafts/03-pv-grade.md) assumes FAERS/MedDRA redistribution → switch to rebuild-script distribution + de-MedDRA'd release.

## 4 · SuggestionFix-Bench — WORKABLE (anchor on CodeReviewer; volume borderline)
- **Release-clean:** **CodeReviewer** dataset (Zenodo, CC-BY-4.0) as the backbone + **self-mined accepted-suggestion pairs** from permissively-licensed repos via **GH Archive** (BigQuery, metadata-level) + GitHub API enrichment.
- **Avoid re-releasing:** `ronantakizawa/github-codereview` is **"license: other"** with no redistribution grant → use as an *internal index* only.
- **Volume:** borderline — the **<500-gold-items kill line is genuinely at risk** (independent estimate: only ~8% of suggestion blocks are defect fixes). The kill is correctly load-bearing.
- **Fallback:** build the released benchmark entirely from CodeReviewer + self-mined permissive pairs.
- **Draft correction:** [draft 04](pilot-drafts/04-code-review-catch-vs-noise.md) — demote github-codereview to internal index; anchor the released set on CodeReviewer + permissive self-mined pairs.

## 5 · Multilingual Safety Meter — WORKABLE (RabakBench clean; two draft fixes)
- **Release-clean prompts:** **RabakBench** public set (verified **modified-MIT**, redistributable; Tamil 156 + Malay/Chinese/Singlish ~132 each).
- **Two corrections to the draft:** (1) **responses are NOT free** — you must self-generate model responses to the prompts (the draft assumed reuse); (2) public **Tamil n=156 is likely too thin** for the pre-registered power → generate more items or add a language.
- **Avoid for release:** **IndicJR** (license unsettled — research-only placeholder) and **M-ALERT** (CC-BY-NC-SA, non-commercial). Reference only.
- **Generate:** ~50-item/language ternary gold via native annotators (Prolific/Fiverr/Upwork — see the translator options from the earlier turn).
- **Fallback:** RabakBench public set only + self-generated responses + native gold.
- **Draft correction:** [draft 05](pilot-drafts/05-multilingual-safety-meter.md) — fix "responses are free"; address thin Tamil volume; use RabakBench (not M-ALERT/IndicJR) for the released artifact.

## 6 · Injection Defense Report Card — WORKABLE (richest data path; two license fixes)
- **Clean + runnable:** **AgentDojo** (MIT — 629 security test cases with deterministic ground truth), **OET** (MIT), **CaMeL** (Apache-2.0), **HarmBench** validation set (MIT, 602 items), **InjecAgent** (MIT). There are ample runnable defenses to grade — the "no obtainable defenses" fear is **cleared.**
- **Two mandatory fixes:** (a) **AdaptiveAttackAgent** has **no license** (all-rights-reserved) → re-implement/cite, don't vendor it; (b) **Meta-SecAlign** *code* is CC-BY-NC → grade it via its (commercially-licensed) **weights** + your own harness, don't fork the code.
- **Volume:** sufficient (629 test cases clear the ~96/defense power need).
- **Fallback:** attack code released with *The Attacker Moves Second* + each defense's own adaptive attacks.
- **Draft correction:** [draft 06](pilot-drafts/06-injection-defense-report-card.md) — add the two license fixes.

---

## What this means
No pilot is blocked on data. The two you'd most want to de-risk *before* committing are the **volume** ones —
**Reviewer Scrutiny** (thin positive class) and **SuggestionFix** (the <500-gold kill), both of which have a
cheap first-check that settles it. The one genuine *legitimacy* item to handle deliberately is **PV-Grade's
MedDRA** licensing, solved by shipping a rebuild script rather than the raw terms. Draft corrections above are
small and should be applied to whichever pilot(s) you promote.
