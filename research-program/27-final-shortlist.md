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

| Candidate | Comp | Data | What it does & addresses | Why it's the pick / the risk |
|---|:--:|:--:|---|---|
| **NoteProof** ⭐ | 87.5 | 🟢 SOLID | Verifies each sentence of an AI clinical-scribe note is grounded in the visit transcript — catches fabricated exam findings before the physician signs. | **Lead** — aligned buyer + clean CC-BY data; risk = EHR distribution |
| **PortalProof** | 87.5 | 🟡 WORKABLE | Checks AI-drafted patient-portal message replies for fabrications, dropped safety-netting, and missed emergencies before a clinician sends. | Sibling thesis; thinner data (MIMIC/MedRedQA fix), same EHR gate |
| **DisputeProof** | 91.7 | 🟢 SOLID | Grades whether a bank's denial of a Reg-E electronic-payment dispute is actually defensible against the evidence and the rule. | Fast wedge + a real bank-demand test; discovery-paradox risk |
| **ReasonProof** | 87.5 | 🟡 WORKABLE | Verifies a lender's AI-generated loan-denial reason codes actually reflect what drove the decision (ECOA fair-lending faithfulness). | Financial credential + founding probe; controlled-study ceiling |

**Founder lead:** **NoteProof.** **Fast financial wedge + buyer-test:** **DisputeProof.**

---

## Track B · Build-to-hire — open-source + targeted outreach (instead of publishing)

*The play: build the eval/harness, open-source it (an eval — **not** a clone of their paid product), pair it
with a short blog, then approach the incumbents with "I built this in your space; here's how I'd extend it —
hire me." Sell the person + roadmap, not just the tool.*

| Candidate | Comp | Data | What it does & addresses (the OSS artifact) | Target companies *(Arize/Unstructured excluded)* |
|---|:--:|:--:|---|---|
| **Kappa** ⭐ | 83.3 | 🟢 SOLID | Monitors your LLM-as-judge evals for drift and alerts when a judge silently stops being reliable. | Braintrust, Patronus, LangChain; Cisco (ex-Galileo) |
| **Injection Defense Report Card** | 74.2 | 🟢 SOLID | Independent A–F grades of prompt-injection defenses under *adaptive* attack — exposes overstated robustness. | Check Point (Lakera), SentinelOne (Prompt Security), OpenAI (Promptfoo), Gray Swan, HiddenLayer |
| **Ingestion Corruption Detector** | 80.0 | 🟢 SOLID | Flags numbers silently corrupted when documents are parsed/OCR'd into an AI pipeline — no answer key needed. | Reducto, Contextual AI (⚠️), LlamaIndex, Tensorlake |
| **ToolTamer** | 89.2 | 🟢 SOLID | Real-time middleware that validates and repairs malformed agent/MCP tool calls. | Sierra, LangChain, Vercel, LlamaIndex |
| **RewardProof** | 85.0 | 🟢 SOLID | Audits an RL reward/grader for exploitability — what % of provably-wrong solutions it wrongly rewards (reward hacking). | OpenAI/Anthropic/DeepMind + RL-eval teams (BenchJack, Fulcrum) |
| **QueryProof** | 85.0 | 🟢 SOLID | Verifies AI-generated SQL actually answers the question — catches confidently-wrong-but-runnable queries. | Numbers Station, Julius, BI-vendor AI |

**Second-tier (valid, narrower):**

| Candidate | Comp | Data | What it does & addresses | Target companies |
|---|:--:|:--:|---|---|
| **MemTrust** | 85.0 | 🟡 WORKABLE | Tests an AI agent's memory for staleness, contradictions, and time-drift. | Mem0, Letta, Zep, cognee |
| **TrajTrust** | 83.3 | 🟡 WORKABLE | Judge-of-the-judge: reveals which failure types an agent-trajectory evaluator silently misses. | Patronus, LangChain |
| **VeriJudge** | 83.3 | 🟢 SOLID | Certifies an LLM-judge measures the real thing vs. being fooled by verbosity/position/self-preference. | Braintrust, Patronus |
| **Reviewer Scrutiny Metric** | 78.3 | 🟡 WORKABLE | Measures whether humans truly review AI-written code vs. rubber-stamp it (validated against later reverts). | CodeRabbit, Qodo, Greptile |
| **TieProof** | 91.7 | 🟡 WORKABLE | Verifies the evidence an auditor's AI cites actually supports each financial claim before the partner signs. | MindBridge, DataSnipper, Trullion |

**Excluded target companies (prior employers — cannot return): Arize, Unstructured.** (Both are in his
build-to-hire spaces, so the *experience* is a credibility asset for the artifacts — aim outreach at their
competitors.) Target company funding/stage vetted 2026-07-09; note several eval/security firms were
acquired (Galileo→Cisco, Lakera→Check Point, Prompt Security→SentinelOne, Promptfoo→OpenAI).

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
