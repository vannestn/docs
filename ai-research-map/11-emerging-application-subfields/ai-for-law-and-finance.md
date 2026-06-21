# AI for Law & Finance

Two high-stakes, heavily-regulated domains where the gap between **adoption** and **measured
reliability** is the whole story — and where hallucination is an active real-world harm, not a
benchmark artifact.

## AI for Law

- **Commercial legal tools still hallucinate materially** — Stanford RegLab/HAI's preregistered
  study found Lexis+ AI accurate on ~65% of queries (hallucinating/mis-grounding >17%) and Westlaw
  AI-Assisted Research accurate only ~42% (hallucinating nearly *twice* as often), *even with RAG
  over authoritative databases* — directly contradicting vendor "hallucination-free" marketing.
  [Stanford RegLab](https://reglab.stanford.edu/publications/hallucination-free-assessing-the-reliability-of-leading-ai-legal-research-tools/)
- **Autonomous end-to-end legal work is far from solved** — Harvey's Legal Agent Benchmark (LAB,
  May 2026) scores tasks under a strict **all-pass rubric** (a deliverable catching 8/10 risks is
  *not* 80% useful). In aggregate frontier models complete **<10% end-to-end**; initial results put
  Claude Opus 4.7 top at 7.1% (Sonnet 4.6 5.4%, GPT-5.5 2.1%, Gemini 3.5 Flash 0.8%). Per-criterion
  pass rates are far higher (~86–90%) — the gap is in *chaining* steps without any failure.
  [Harvey LAB](https://www.harvey.ai/blog/legal-agent-benchmark-initial-results)
- **…yet adoption is racing ahead** — Harvey raised $200M at an **$11B valuation** (Mar 2026; GIC +
  Sequoia), on ~**$190M ARR** (up from $100M in 5 months) with **100,000+ lawyers** across 1,300+
  customers in 60+ countries. [Harvey](https://www.harvey.ai/blog/harvey-raises-at-dollar11-billion-valuation-to-scale-agents-across-law-firms-and-enterprises)
  The gap between LAB scores and deployment is filled by **human-in-the-loop review**.
- **Hallucinated citations are a documented court crisis** — Charlotin's database catalogued
  **1,350+** sanctioned/flagged cases worldwide by mid-2026 (updated daily; one day in Mar 2026 saw
  17 U.S. decisions noting suspected AI hallucinations), with sanctions reaching a $110K penalty
  (Oregon) and a first U.S. indefinite license suspension (Nebraska).
  [database](https://www.damiencharlotin.com/hallucinations/)
- **What works:** document Q&A and extraction on *provided* documents now beat lawyer baselines —
  Vals VLAIR (Feb 2025, human-lawyer control group) found Document Q&A the highest-scoring task
  overall at **80.2%**, with AI tools surpassing the lawyer baseline on four document-analysis/
  retrieval/extraction tasks. [VLAIR](https://www.vals.ai/industry-reports/vlair-2-27-25)
  On clause-level risk, ContractEval (CUAD-based) finds **proprietary > open-source** but most LLMs
  perform only at a junior-legal-assistant level. [arXiv:2508.03080](https://arxiv.org/abs/2508.03080)

## AI for Finance

- **Financial RAG is unreliable for multi-document reasoning** — on FinanceBench (150 questions over
  368 10-K/10-Q filings, shared vector store), GPT-4 answers correctly only **~19%** of the time
  when answers require synthesizing multiple filings; numeric precision is a named failure mode
  (returning "≈$1.5B" when the answer is "$1.577B"). [FinanceBench](https://www.emergentmind.com/topics/financebench)
- **Capability profile** (FinBen, **42 datasets / 24 tasks**, 21 LLMs incl. GPT-4): strong at
  information extraction and textual analysis, **weak at advanced reasoning, forecasting, and
  generation**. NeurIPS 2024 D&B Track. [arXiv:2402.12659](https://arxiv.org/abs/2402.12659)
- **Open adaptation beat from-scratch** — FinGPT does lightweight LoRA/QLoRA domain adaptation at
  **~$300/fine-tune** vs BloombergGPT's ~1.3M GPU-hours ≈ **$3M** train. LoRA cuts trainable params
  ~1000× (6.17B → 3.67M); in the paper's sentiment experiment, FinGPT (Llama-3.1-8B SFT+RLSP)
  reaches **82.1% acc / 80.9 macro-F1**, beating FinBERT (71.2/69.9) and 0-shot ChatGPT (63.4/61.7).
  Note: it democratizes *adaptation*, not raw accuracy ceilings. [arXiv:2306.06031](https://arxiv.org/abs/2306.06031)
- **LLM-agent factor mining is promising-but-unproven** — AlphaAgent (KDD'25) reports backtested
  annualized **excess** returns of **11.0% (IR 1.49) on CSI 500** and **8.74% (IR 1.05) on S&P 500**
  over 2021–2024 *after transaction costs* (out-of-sample, but Qlib backtest, not live trading). Its
  thesis: **alpha decay** from factor homogenization/crowding is *the* open problem — LLMs default
  to known factors (momentum/value/RSI), so it adds AST-similarity originality, hypothesis-alignment,
  and complexity-control regularizers, yielding an 81% higher hit ratio (0.29 vs 0.16) at ~23–30%
  fewer tokens. [arXiv:2502.16789](https://arxiv.org/abs/2502.16789)
- **Structured/numerical grounding is the bottleneck** — FinTagging recasts XBRL tagging as
  extract-then-link over the full **17k+-concept US-GAAP taxonomy**. Even strong LLMs (DeepSeek-V3,
  GPT-4o) hit only **~0.19 accuracy** on fine-grained concept linking (FinCL) and **~0.10 F1**
  end-to-end; single-step extreme classification over the full taxonomy collapses *all* models to
  ~0. Extraction is recoverable; **disambiguation against the taxonomy is the hard part**.
  [arXiv:2505.20650](https://arxiv.org/abs/2505.20650)

## Regulation as the binding constraint
The EU AI Act classifies **credit-scoring of natural persons as high-risk** (Annex III; fraud
detection excepted). Max fines run to **€35M / 7% turnover** for prohibited-practice violations and
€15M / 3% for most other obligations (Art. 99). The **Digital Omnibus** (provisional agreement
May 2026) deferred standalone Annex III high-risk obligations from Aug 2026 to **2 Dec 2027**.
[Gibson Dunn](https://www.gibsondunn.com/eu-ai-act-omnibus-agreement-postponed-high-risk-deadlines-and-other-key-changes/)
Legal AI, by contrast, is shaped less by statute than by **court sanctions and professional-
responsibility duties** driving citation-verification features. See
[12 · Geopolitics & policy](../12-politics-capital-and-business-models/geopolitics-and-policy.md).

## State of research

**Best-performing now:** extraction, summarization, document Q&A, and clause/risk tagging on
provided documents — at or above human baselines.

**Promising but unproven:** autonomous legal/financial agents (Harvey LAB <10% end-to-end);
LLM-agent factor mining (AlphaAgent — backtest-only, alpha decay unresolved at scale);
"fiduciary-grade" verified architectures.

**Open problems & weaknesses:** **hallucination in high-stakes use** (a real sanctions/malpractice
problem, not just benchmarks); **long-horizon chaining** (per-step competence ≫ end-to-end reliability
— LAB's all-pass gap); **fine-grained grounding against large taxonomies** (FinTagging: extraction
works, 17k-concept disambiguation doesn't); **multi-document and numerical reasoning** (FinanceBench
~19%); and **alpha/strategy decay from homogenization** (AlphaAgent's central argument). Regulatory
deadlines (EU AI Act Annex III) gate finance; sanctions gate law. The cross-cutting lesson: these
domains expose the [reliability gap](../11-emerging-application-subfields/ai-for-software-engineering.md)
between capability demos and dependable work product more starkly than almost anywhere else.
