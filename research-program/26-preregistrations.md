# 26 · Pre-registrations — the commitment specs

*Written 2026-07-09. Tight, runnable pre-registrations for the top candidates from the
[combined ranking](20-decision-and-ranking.md), with the data + labeling methods locked in before any data
is touched. Each states a falsifiable question, the exact data plan (sources verified this session), the
labeling protocol, and **pre-registered success AND kill criteria** — written now so results can't be
rationalized later. Budget ≤$500, part-time, solo.*

**Recommended starting set:** run **Ingestion** (fast, null-proof anchor) + **DisputeProof** (best founding
bet, SOLID public-domain data). **ReasonProof** is the strong second founding bet (same liability-verifier
thesis, different regulation). NoteProof (clinical, CC BY 4.0 data) or Kappa can be added as a third.

---

## Pre-reg A · Ingestion Corruption Detector (pilot anchor)

**Research question (falsifiable).** Does holding one extraction engine fixed and perturbing only the
*render* along semantically-null axes (DPI 150/200/300 + raster round-trip + sub-pixel jitter) surface a
**non-empty set of silent numeric corruptions that multi-parser disagreement and temperature
self-consistency both miss**?

**Data plan (verified).** *Released/gold:* FinTabNet.c (CDLA-Permissive-2.0, redistributable, S&P-500
financial tables) + SynFinTabs (synthetic, CC-BY/MIT, self-regenerable). *Leaderboard ground truth:* SEC
EDGAR Inline XBRL (`data.sec.gov`, public domain, free, 10 req/s). *Measure-only (not re-released):*
OHR-Bench (research-only license — comparison set, cite the caveat). No human labeling of the positive
class needed (value-flips are self-labeling); ~150–400 flagged cells self-audited (~3–6 hrs) for precision.

**Metrics.** Per-cell corruption precision/recall; the **render-only-caught set** (Venn vs the two
baselines) as the headline; precision control on legitimately-ambiguous cells.

**Success (pre-registered).** The render-only-caught set is non-empty and statistically distinguishable
from noise on ≥1 document class, at precision ≥0.7 on the self-audited sample — → publish the method +
release the OSS linter + the XBRL "numeric-survival-rate" leaderboard.

**Kill (pre-registered).** If, after the ~50-table power dry-run, the render-only-caught set is empty or
indistinguishable from noise across all classes → report the clean null (with the render-sensitivity
distribution) and stop. **The null is publishable** (DMLR/TMLR).

**Scoop protocol.** Weekly check on "metamorphic OCR", "render-invariance table extraction",
"silent numeric corruption RAG". If scooped, publish as a comparison note.

**First week.** OHR-Bench numeric slice + one open OCR engine → render at 3 DPIs → flag value-flips → run
the two baselines on the same cells → the power dry-run gate. **Budget:** ~$50 (CPU) + ~$100–200 API for
the RF-Cloze secondary signal. **Artifact:** OSS linter + leaderboard + short paper.

---

## Pre-reg B · DisputeProof (top founding bet)

**Research question (falsifiable).** Can an **independent, vendor-agnostic verifier** flag
Regulation-E electronic-fund-transfer dispute *denials* that are **indefensible** (unsupported by the
stated facts / the rule) at an agreement with human adjudication meaningfully above the CCDB disposition
baseline?

**Data plan (verified this session).** CFPB Consumer Complaint Database (`consumerfinance.gov`, **public
domain**, full CSV/JSON + API). Filter to EFT/Reg-E-relevant complaints via the product/issue taxonomy
(checking/savings + EFT/unauthorized-transaction issues). **Honest constraint I verified:** there is *no
clean "monetary relief / defensibility" outcome field* — so the label is engineered (below), not looked up.

**Labeling protocol (locked — the load-bearing design).**
1. **AI extraction (scale, low-risk):** an LLM converts each narrative into structured facts (unauthorized
   vs error, timing vs the 60-day rule, what the bank asserted, evidence cited). This is *reading*, not
   judging.
2. **Silver defensibility label at scale:** an LLM judges defensibility from the extracted facts + the
   bank's public response.
3. **Human gold anchor (non-negotiable):** the researcher hand-labels ~200–300 cases (his ~4–7 hrs) as the
   true label.
4. **Prediction-Powered Inference:** use the human gold to *measure and correct* the LLM labeler's bias;
   report the corrected estimate with CIs (same discipline as his RAG-judge paper + the Ternary-PPI pilot).
5. **Independent triangulation signal:** the CCDB "company response" disposition ("Closed with monetary
   relief / non-monetary relief / explanation") + the "consumer disputed" flag — a *bank-reported,
   non-AI* weak signal to cross-check the labels are not measuring the AI itself.

**Circularity guard (pre-registered).** The verifier is evaluated **only against the human gold anchor**,
never against the silver LLM labels — so we measure *correctness*, not agreement-with-an-AI.

**Metrics.** Verifier precision/recall + AUC vs the human gold; PPI-corrected indefensibility prevalence
with CIs; agreement between the verifier and the independent disposition signal.

**Success (pre-registered).** Human-gold inter-annotator reliability is adequate (κ ≥ 0.6) AND the verifier
beats the CCDB-disposition baseline on the gold set (AUC ≥ 0.75) → release the verifier + a public
"EFT-dispute-defensibility" report and pursue a design-partner bank/credit-union.

**Kill (pre-registered).** If human-gold κ < 0.5 (the target isn't reliably judgeable from the data) OR the
verifier can't beat the disposition baseline → the label is too weak for a product; publish the prevalence
finding as a note and stop / pivot.

**Scoop protocol.** Watch FairPlay/Stratyfy/Zest and "Reg E dispute AI", "chargeback defensibility AI".

**First week.** Pull the EFT complaint slice; build the extraction prompt; hand-label ~50 to test κ
feasibility *before* scaling (a cheap go/no-go on the whole thesis). **Budget:** ~$100–200 API. **Artifact:**
OSS verifier + public report + (founding) design-partner outreach.

---

## Pre-reg C · ReasonProof (second founding bet — controlled study, dual-method + PPI)

**Research question (falsifiable).** Can an independent verifier detect unfaithful adverse-action reason
codes — reasons that don't reflect what actually drove a credit decision — and **how much harder is
*naturally-occurring* LLM unfaithfulness than *synthetic* unfaithfulness** (the injected-vs-natural gap)?

**Why controlled (stated up front).** A *real-lender* measurement is impossible from public data (no access
to the lender's model; public HMDA redacts credit score + underwriting variables). So this is a
**controlled study: we build the model, so we know the true drivers by construction.** It proves the
*method*; a real-lender claim requires a design-partner lender later — pre-registered as out of scope here.

**Data plan (re-pointed).** *Modeling substrate (features present):* a public lending dataset **with**
underwriting features + outcomes — Lending Club, Home Credit Default Risk, "Give Me Some Credit," or
Fannie/Freddie loan-performance data (check each license; several CC0/permissive). *Realism/fairness
context:* HMDA public LAR (used for context, not modeling — credit score redacted). Ground-truth
attributions come from the model we build.

**Two probes, combined (the design).**
- **Probe A — injection (clean-truth floor).** Corrupt reason codes by swapping the true top driver for a
  plausible decoy, **graded** from obvious (rank-1 swap) to subtle (rank-2↔rank-3). Ground truth known by
  construction — zero label noise.
- **Probe B — natural (realistic headline).** Have an LLM generate reason codes the way production
  gen-AI-underwriting does; label faithfulness against the model's true top-k attributions. Realistic, but
  the label rests on (contestable) attributions.
- **How they combine (the point):**
  1. **A validates B's scorer.** Run B's faithfulness-scorer on the *known-answer* Probe-A cases; its
     accuracy there = the measured reliability of B's labels (reported, not assumed).
  2. **PPI headline (the signature move).** Treat B (large, realistic, noisy-label) as the bulk + a
     clean-truth gold anchor (Probe-A cases + ~50 hand-validated natural cases) → **Prediction-Powered
     Inference** → one unbiased real-world verifier-performance estimate **with CIs**.
  3. **Difficulty curve.** Verifier catch-rate vs. injection subtlety — a dose-response curve anchored
     clean-synthetic ↔ natural.
  4. **Disagreement region (named deliverable).** The cases where clean-logic (A) and the attribution-scorer
     (B) disagree = the genuinely-ambiguous slice where attribution instability bites and real reason-code
     disputes live. Characterized as a first-class output.

**Ground-truth reliability guard.** Use exact attributions (linear/GAM) *or* require SHAP + permutation
importance to agree on the top driver; hand-validate ~50 of B's "unfaithful" calls; report B's numbers
*with* this reliability caveat.

**Metrics.** PPI-corrected real-world AUC **with CIs** (headline); B-scorer accuracy on known-answer cases
(reliability); the subtlety dose-response curve; injected-vs-natural gap; size + characterization of the
disagreement region.

**Success (pre-registered).** *Floor:* verifier catches obvious injected unfaithfulness at AUC ≥ 0.85
(sanity). *Headline:* PPI-corrected real-world AUC ≥ 0.75 with the CI lower bound above the keyword-overlap
baseline → release the method + dual-method benchmark; pursue a lender design partner.

**Kill (pre-registered).** Fails the injected floor (can't catch even *obvious* synthetic unfaithfulness →
no signal) → stop. If it passes the floor but the PPI-corrected real-world estimate isn't distinguishable
from baseline → report "natural unfaithfulness isn't reliably detectable at this fidelity — here's the gap
and the disagreement region" (still a finding) and stop/pivot.

**Caveat (pre-registered).** If you later *train* the verifier on A and *test* on B, the
train-synthetic/test-real generalization gap is real but **measurable** — report it, don't assume it away.

**Scoop protocol.** Watch "reason code faithfulness", "adverse action explanation verification", FairPlay/
Stratyfy roadmaps, and the SHAP-instability paper cluster.

**First week (go/no-go).** One dataset (Lending Club) + one linear/GBM model + attributions + Probe-A
injection on a small slice → confirm the verifier catches *obvious* injections (the floor); then run ~20
natural LLM reason codes (Probe B) to confirm they produce gradable cases. Both must pass before scaling.
**Budget:** ~$50–150. **Artifact:** OSS verifier + dual-method benchmark (floor + PPI headline + difficulty
curve + disagreement region) + short paper.

---

## Across all three
- **Pre-registration is binding:** success/kill were written before data collection; a null is a
  publishable result, not a failure.
- **Data is verified** (Ingestion, DisputeProof this session; ReasonProof re-pointed to features-inclusive
  data because HMDA lacks credit score).
- **The labeling discipline is the same everywhere** — AI to scale, a human gold anchor to keep it honest,
  PPI to combine — which is exactly the researcher's published methodological edge.
- **Next action:** pick the starting 2 (recommended: Ingestion + DisputeProof), run each first-week go/no-go
  gate, and only scale what clears it.
