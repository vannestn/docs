# Methodology & Sources

## How this map was built

This map was assembled in **June 2026** via a fan-out of parallel research passes, each
targeting a distinct slice of the field:

1. Frontier large models & core capabilities
2. Alignment, interpretability & safety
3. Architectures, training, efficiency & theory
4. AI-for-science, robotics & world models
5. Small startups, independent labs & nascent fields
6. Evaluation science, governance & economics
7. The global lab ecosystem (Chinese, European, sovereign, open-source)
8. Reinforcement learning & open-endedness
9. Data-centric AI, systems & hardware
10. Emerging application-driven subfields

Each pass searched arXiv, lab blogs, technical reports, institute publications, and
reputable tech press from **late 2025 through mid-2026**, then extracted concrete,
falsifiable claims with the responsible org, the paper/source title, and a URL.

## Reliability caveats — read before citing

- **Primary-source fetching was frequently blocked.** During compilation, automated
  fetches to `arxiv.org` abstract/PDF pages, several lab blogs (DeepMind, Anthropic,
  Isomorphic), and `transformer-circuits.pub` returned HTTP 403. Many paper-internal
  details (exact benchmark percentages, precise arXiv IDs) therefore come from
  **search-engine snippets of those pages** rather than full-text reads. Treat specific
  numbers as "as reported" and verify against the primary PDF before formal citation.

- **2026-dated arXiv IDs (26xx.xxxxx).** These follow the standard YYMM convention for
  2026 submissions and surfaced in indexed search results. Where an ID could not be
  anchored to a confirmed primary page, it is flagged inline in the relevant document.

- **Secondary coverage is flagged.** Some funding figures, release dates, and unreleased
  models (e.g., DeepSeek-V4 specifics, AMI Labs funding, certain Feb–Jun 2026 model
  versions) rest substantially on tech-press aggregators. These are marked **[secondary]**
  or noted in the document where they appear.

- **Org attribution.** For third-party academic papers (especially 26xx IDs), author
  affiliations were inferred from snippets and may need confirmation before attributing
  a result to a specific lab.

## How to use the leaf documents

Each topic file lists research directions with:
- **What it is / why it matters** — the conceptual stake.
- **Key work** — papers/models with org and link.
- **Status flags** — where claims are uncertain or rest on secondary sources.

The map favors *breadth and navigability* over exhaustive depth. Treat it as an index
into the literature, not a substitute for reading the papers.

## A note on dates

"Current" throughout means **mid-2026**. Where a foundational result predates 2025 but
remains the load-bearing reference (e.g., Mamba-2 SSD, Byte Latent Transformer), it is
included with its original date.
