# AI for Law & Finance

Two high-stakes, heavily-regulated domains where the gap between **adoption** and **measured
reliability** is the whole story — and where hallucination is an active real-world harm, not a
benchmark artifact.

## AI for Law

- **Commercial legal tools still hallucinate materially** — Stanford's reference study found
  Lexis+ AI ~17% and Westlaw AI-Assisted Research ~33% hallucination rates *even with RAG over
  authoritative databases*. [Stanford RegLab](https://law.stanford.edu/publications/hallucination-free-assessing-the-reliability-of-leading-ai-legal-research-tools/)
- **Autonomous end-to-end legal work is far from solved** — Harvey's Legal Agent Benchmark (LAB,
  May 2026, strict all-pass scoring) has frontier models passing only **~7–11%** of real legal
  agent tasks. [Harvey LAB](https://www.harvey.ai/blog/legal-agent-benchmark-initial-results)
- **…yet adoption is racing ahead** — Harvey raised at an $11B valuation (~$190M ARR, 142k+
  professionals); Thomson Reuters re-architected CoCounsel as a "fiduciary-grade" agentic platform
  on Claude. The gap is filled by **human-in-the-loop review**.
- **Hallucinated citations are a documented court crisis** — 1,300+ sanctioned/flagged cases
  worldwide by April 2026 (~5–6/day). [database](https://www.damiencharlotin.com/hallucinations/)
- **What works:** document Q&A and clause/risk tagging on *provided* documents now match or beat
  lawyer baselines (Vals VLAIR); ContractEval shows proprietary > open-source, none production-grade.

## AI for Finance

- **Financial RAG is unreliable for multi-document reasoning** — on FinanceBench, GPT-4-class
  models answer correctly only ~19% of the time when answers require synthesizing multiple filings.
  [FinanceBench](https://www.emergentmind.com/topics/financebench)
- **Capability profile** (FinBen, 42 datasets): strong at extraction/textual analysis, **weak at
  advanced reasoning, forecasting, and generation**. [arXiv:2402.12659](https://neurips.cc/virtual/2024/poster/97525)
- **Open adaptation beat from-scratch** — FinGPT (<$300/run domain adaptation) displaced the
  closed BloombergGPT (~$3M) approach. [FinGPT arXiv:2306.06031](https://arxiv.org/abs/2306.06031)
- **LLM-RL trading is promising-but-unproven** — Trading-R1 and AlphaAgent report strong *backtest*
  returns, but on a few large-caps, not live/out-of-sample; **alpha decay** (LLM-generated factors
  are homogeneous → crowding) is the named open problem. [AlphaAgent arXiv:2502.16789](https://arxiv.org/abs/2502.16789)
- **Structured/numerical grounding is the bottleneck** — LLMs fail at XBRL tagging, spreadsheets,
  and multi-step computation unless paired with RAG + symbolic calculators. [FinTagging](https://arxiv.org/html/2505.20650v1)

## Regulation as the binding constraint
EU AI Act classifies **credit-scoring as high-risk** (penalties to €30M / 6% turnover), though the
Digital Omnibus deferred Annex III obligations to Dec 2027. Legal AI is shaped by **court sanctions
and professional-responsibility duties** driving citation-verification features. See
[12 · Geopolitics & policy](../12-politics-capital-and-business-models/geopolitics-and-policy.md).

## State of research

**Best-performing now:** extraction, summarization, document Q&A, and clause/risk tagging on
provided documents — at or above human baselines.

**Promising but unproven:** autonomous legal/financial agents; LLM-RL trading; "fiduciary-grade"
verified architectures.

**Open problems & weaknesses:** **hallucination in high-stakes use** (a real sanctions/malpractice
problem, not just benchmarks); **multi-document and numerical reasoning**; **judge/ market
variability** undermining prediction claims; and **regulatory constraints** that gate deployment.
The cross-cutting lesson: these domains expose the [reliability gap](../11-emerging-application-subfields/ai-for-software-engineering.md)
between capability demos and dependable work product more starkly than almost anywhere else.
