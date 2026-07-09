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

## Pre-reg C · ReasonProof (second founding bet — controlled study)

**Research question (falsifiable).** Can an independent verifier **detect unfaithful adverse-action reason
codes** — reasons that don't reflect what actually drove a credit decision — at high precision in a
setting where the true feature attributions are known?

**Why controlled (stated up front).** A *real-lender* measurement is impossible from public data (no access
to the lender's model; public HMDA redacts credit score + underwriting variables). So this is a
**controlled study: we build the model, so we know the true reasons by construction.** It proves the
*method*; a real-lender claim requires a design-partner lender later — pre-registered as out of scope here.

**Data plan (re-pointed, per the method discussion).** *Modeling substrate (features present):* a public
lending dataset **with** underwriting features + outcomes — Lending Club, Home Credit Default Risk, "Give
Me Some Credit," or Fannie/Freddie loan-performance data (check each license; several are CC0/permissive).
*Realism/fairness context:* HMDA public LAR (denial-reason fields; credit score redacted — used for context,
not modeling). No external labeling: ground-truth attributions come from the model we build (SHAP /
exact attributions).

**Method.** (1) Train a credit model on the features. (2) Have an LLM generate adverse-action reason codes
for its decisions. (3) **Inject known-unfaithful reason codes** (swap the true top driver for a plausible
decoy) as positives, keep faithful ones as negatives. (4) The verifier must separate faithful from
unfaithful, scored against the *known* attributions.

**Metrics.** Verifier precision/recall/AUC at detecting unfaithful reason codes; robustness across model
types (linear vs GBM) and attribution methods.

**Success (pre-registered).** Verifier detects injected-unfaithful reason codes at AUC ≥ 0.8 across ≥2 model
families → release the method + benchmark; pursue a lender design partner for the real-system extension.

**Kill (pre-registered).** If the verifier can't beat a trivial baseline (e.g., keyword overlap) at
separating faithful/unfaithful → the signal isn't there; report and stop.

**Scoop protocol.** Watch "reason code faithfulness", "adverse action explanation verification", FairPlay/
Stratyfy roadmaps, and the SHAP-instability paper cluster.

**First week.** One dataset (Lending Club) + one GBM model + SHAP attributions + the unfaithful-injection
harness on a small slice → confirm the verifier gets signal *before* scaling. **Budget:** ~$50–150.
**Artifact:** OSS verifier + benchmark + short paper.

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
