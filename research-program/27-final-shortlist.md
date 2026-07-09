# 27 · Final shortlist — the two tracks

*Written 2026-07-09. The decision output of the whole program. Two tracks, both serving the found-OR-hire
goal. Full analysis: [20 · decision & ranking](20-decision-and-ranking.md); pre-registrations:
[26](26-preregistrations.md). Data verdicts and scores are from the combined, apples-to-apples audit.*

**The strategy: run both tracks in parallel.** Ship one **build-to-hire** OSS artifact *now* (fast public
credibility + income optionality + a warm path into funded companies), and validate one **founder** bet in
parallel (higher ceiling, with a safety net under it). The tracks are not either/or in time.

---

## Track A · Founder — hold the core, build toward a company

*The rule: do NOT open-source the core (it burns the moat). A small teaser benchmark for inbound is fine.*

| Candidate | Comp | Data | Why it's here | The one risk |
|---|:--:|:--:|---|---|
| **NoteProof** ⭐ | 87.5 | 🟢 SOLID | **Lead founder bet.** Huge exploding market (ambient scribes) + an *aligned* buyer (the signing physician *wants* the check) + genuinely clean commercial-OK data (ACI-Bench CC BY 4.0). Value **and** data both line up. | Distribution (EHR/in-basket) — a known, partner-solvable motion |
| **PortalProof** | 87.5 | 🟡 WORKABLE | Same thesis, distinct sub-workflow (in-basket replies). | Thinner data (fix: MIMIC + MedRedQA); same EHR gate |
| **DisputeProof** | 91.7 | 🟢 SOLID | Fastest, SOLID free public-domain data, pre-reg ready. Run it *and* use it to test whether banks actually want the report. | "Discovery paradox" — the buyer may not want a discoverable report; soft outcome label (PPI protocol handles it) |
| **ReasonProof** | 87.5 | 🟡 WORKABLE | Strong skill-fit + dual-method pre-reg; financial-compliance credential and founding probe. | AVAAS incumbent + controlled-study ceiling until a lender partner |

**Founder lead:** **NoteProof.** **Fast financial wedge + buyer-test:** **DisputeProof.**

---

## Track B · Build-to-hire — open-source + targeted outreach (instead of publishing)

*The play: build the eval/harness, open-source it (an eval — **not** a clone of their paid product), pair it
with a short blog, then approach the incumbents with "I built this in your space; here's how I'd extend it —
hire me." Sell the person + roadmap, not just the tool.*

| Candidate | Comp | Data | Who to approach | The OSS artifact |
|---|:--:|:--:|---|---|
| **Kappa** ⭐ | 83.3 | 🟢 SOLID | Braintrust, LangSmith, Arize, Galileo, Patronus, HumanLoop | Judge-drift / kappa monitor (**your exact published skill**) |
| **Injection Defense Report Card** | 74.2 | 🟢 SOLID | Lakera/Check Point, Prompt Security/SentinelOne, Promptfoo/OpenAI, Gray Swan, HiddenLayer | Adaptive-robustness living leaderboard (acquisitions *prove* the hiring demand) |
| **Ingestion Corruption Detector** | 80.0 | 🟢 SOLID | Reducto, Unstructured, Contextual AI, LlamaIndex, Tensorlake | Numeric-integrity linter + XBRL leaderboard |
| **ToolTamer** | 89.2 | 🟢 SOLID | Vercel, LangChain, LlamaIndex, Sierra, agent startups | Tool-call conformance harness |
| **RewardProof** | 85.0 | 🟢 SOLID | AI labs + RL/eval teams (BenchJack/Fulcrum) | Reward-hacking auditor |
| **QueryProof** | 85.0 | 🟢 SOLID | Analytics / text-to-SQL AI (Numbers Station, Julius, BI vendors) | Semantic-SQL verifier |

**Second-tier (valid, narrower):** MemTrust (agent-memory cos), TrajTrust / VeriJudge (agent-eval / eval
cos), Reviewer Scrutiny Metric (AI code-review cos), TieProof (audit-AI cos — a good *hire* artifact even
though it's a poor *founder* bet).

**Build-to-hire flagship:** **Kappa** — exact skill, richest hiring landscape, OSS burns no moat.
(**Injection Report Card** is the close runner-up; **Ingestion** the fastest to ship.)

**Note:** Ingestion, Injection, and Reviewer Scrutiny already have drafts/pre-regs — so build-to-hire here
is just swapping the go-to-market from "publish an arXiv paper" to "ship OSS + blog + outreach." No new work.

---

## Parked (not on the final list)
Narrower buyer landscape, slower-hiring vertical, or a data block — **DenialProof** (misaligned payer buyer +
huge VLM COGS), **AppealScore**, **ScreenProof**, **CrossCheck**, **CreditProof** (data-blocked),
**PV-Grade** (MedDRA + clinician-gated), **Callsmith** (client-gated), **Multilingual Safety** (native-Tamil
gated), **GroundTruth Streams** (moat being eaten), **SuggestionFix-Bench** (crowded + gold-volume kill).
Re-entry options, not commitments.

---

## Recommended first moves
1. **Ship the build-to-hire flagship now → Kappa** (OSS judge-drift monitor + blog + a short outreach
   sequence to the eval-tooling companies). Fast public credibility + a warm hiring path.
2. **Validate the founder lead in parallel → NoteProof** (write its pre-reg with the seed-real→synthesize
   data recipe + the EHR-distribution plan; run the go/no-go).
3. **Keep the fast financial wedge in reserve → DisputeProof** (pre-reg ready; run it to *test bank demand*
   before over-investing).

Next concrete artifacts to write: **NoteProof + PortalProof pre-regs**, and the **Kappa OSS + outreach spec.**
