# Topic-Selection Process

*How the deep-commitment topic will be chosen. Implements charter principle #2 ([00-goals-and-operating-principles.md](00-goals-and-operating-principles.md)): **map → read → pilot → choose** — a staged process, never a single jump. Companion to the [knowledge-gaps ledger](03-knowledge-gaps-and-assumptions-ledger.md), whose items gate several stage transitions.*

> **Current status (2026-07-08): NO topic is chosen.** Stage 0 (Map) is complete; Stage 1 has not begun. The next concrete step is the **shortlist gate**: run ledger items CH-1 (adversarially re-score 5 briefs, ≥1 must fail) and CH-5 (filter every on-ramp by ≤15 hrs/wk + no relocation), then cut the ~25 briefed domains to a shortlist of 3–5 using the criteria below. **No new briefs until the shortlist exists** (ledger CH-9: mapping must stop being the deliverable).

## The stages

| Stage | What happens | Entry criteria | Exit criteria |
|---|---|---|---|
| **0 · Map** ✅ done | Broad divergent survey: field maps, 24+ briefs, [comparison index](05-domain-comparison-index.md), [ledger](03-knowledge-gaps-and-assumptions-ledger.md) | — | Maps + briefs + ledger exist. ⚠️ Caveat: fit notes are advocacy, not assessment (ledger A-12) — Stage 0 output does **not** rank fields |
| **Shortlist gate** ⬅ *we are here* | CH-1 + CH-5 from the ledger; apply selection criteria at coarse grain; convert Cluster-A funding unknowns from "website says" to "human confirmed" for shortlisted fields only | Stage 0 done | A written shortlist of **3–5 fields**, each with a one-paragraph impact thesis and a named candidate gap; rejected fields get one honest sentence each |
| **1 · Read** | One reading program per shortlisted field (template below), run in parallel where energy allows | Shortlist exists | Each field has a **verdict memo**: proceed-to-pilot or kill. ≥2 fields must survive; if <2 survive, widen the shortlist, don't lower the bar |
| **2 · Pilot** | 2–3 cheap pilots across **different** surviving fields (rules below) | ≥2 fields passed Stage 1 with a hostile-search-surviving gap, a costed design, and a demand signal | 2–3 shipped public artifacts + honest post-mortems, including at least one candid fit assessment that was *allowed to fail* |
| **3 · Choose** | Apply the selection criteria in priority order to pilot evidence; write the commitment doc | All pilots post-mortemed; ledger updated with what the pilots settled | **One field chosen.** A deep-commitment doc: the gap, the 12-month artifact plan, the moat statement (ledger CH-4), the funding plan. Unchosen fields archived with reasons — they remain re-entry options, not failures |

A stage can send you *backwards* (a failed pilot reopens the shortlist); it can never be skipped forwards. "The demo went well" is not an exit criterion for anything.

## Stage 1 — reading-program template (per shortlisted field)

Time-box: **2–4 weeks part-time per field.** Output is a one-page verdict memo. Steps:

1. **Primary reading.** 10–20 papers read in full — prioritizing the ⚠️-flagged, load-bearing, and snippet-only items in that field's brief ledger. No verdict may rest on a snippet.
2. **Hostile whitespace search** (ledger A-8). Take the candidate gap and try to *kill* it: search as if the gap is closed, document the queries, check automation threats (BenchGuard-class tooling, ledger CH-2). A gap that survives gets a written gap statement; one missed paper kills the contribution.
3. **Why is it empty?** (charter principle #1 + ledger CH-10). If no incumbent exists, name the reason: no customer, no access, no funding, or genuinely overlooked. Only the last is a research opportunity.
4. **Demand probe** (ledger CH-11). 2–3 cold emails to named would-be consumers of the artifact. No reply is a data point too.
5. **Cost & feasibility arithmetic** (ledger A-3, U-E1–E4). Classify the candidate study: **re-analysis tier** (verified ≤$500, API/public-data only) or **primary-data tier** (needs a grant — park until funding is confirmed). Include IRB, ToS/legal exposure, and data-access checks.
6. **Clock-speed check** (ledger A-11). Does the field's pace fit ≤15 hrs/wk? What gets published between your start and finish?
7. **Kill memo** (ledger A-12/CH-1). Write the strongest case *against* the field before writing the case for it. The verdict memo must quote it.

**Verdict memo:** gap statement · tier + cost · demand evidence · clock-speed fit · kill memo summary · PROCEED / KILL.

## Stage 2 — pilot-study rules

1. **2–3 pilots, each in a DIFFERENT field.** Breadth before convergence (charter #1) — the pilots exist to compare fields on evidence, not to get a head start in a favorite.
2. **Cheap and bounded:** re-analysis tier only (≤$500), and an explicit **hours budget** (≤~60 hrs / ≤6 weeks part-time each) — hours, not compute, are the binding constraint (ledger CH-4/§3.2). Track actuals.
3. **Every pilot ships a public artifact:** preprint, dataset, released tool, or substantial post-with-code. No private learning. The artifact is the unit of evidence for Stage 3.
4. **Pre-registered success AND kill criteria,** written before starting. Includes a scoop protocol: weekly arXiv check; if scooped, publish what exists as a comparison note and stop (ledger CH-13b).
5. **No pilot may depend on** unverified funding eligibility (ledger Cluster A), unresolved ToS/legal exposure (U-E3), or unconfirmed data access (U-E4).
6. **Conflict-of-interest rule** (ledger CH-8): cross-vendor judging; disclose any lab funding/credits; no pilot that audits an artifact of the vendor funding it.
7. **Post-mortem per pilot:** engagement data (who used / cited / replied — the A-1 transfer test), hours actual vs. budget, what the pilot settled in the ledger (update statuses), and an honest fit verdict. **At least one "misfit" verdict across the pilots is expected;** three glowing post-mortems means the instrument is still broken (CH-1).

## Selection criteria (Stage 3, in strict priority order)

1. **Impact** — does the work help people and advance the field? Judged on the pilot's artifact and who engaged with it, not on the brief's promise.
2. **Energy / interest** — measured by lived pilot experience (did the hours feel findable?), not by predicted enthusiasm.
3. **Feasibility** — part-time clock-speed fit; re-analysis-tier sustainability; durable data/API access (ledger A-9); and a defensible **moat**: what does this produce that 10,000 other Claude-equipped part-timers can't (ledger CH-4 — sustained longitudinal presence, incumbent-toolset fit, or earned trust)?
4. **Marketability — single constraint-check, LAST** (charter principle #4): *does any path to sustainability exist* — grant, hire, or revenue? Pass/fail only. It never ranks options, and it runs exactly once, here.

A field that wins on 1–3 and fails 4 outright is set aside with the failure documented; 4 is never used to break ties among fields that pass it.

---

**Status line (keep current):** As of **2026-07-08** — no topic chosen · Stage 0 complete · next step: shortlist gate (CH-1 adversarial re-score + CH-5 on-ramp filter → 3–5 field shortlist) · pilots: **0 of 2–3 shipped**.
