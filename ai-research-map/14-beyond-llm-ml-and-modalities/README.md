# 14 · Beyond-LLM ML & Other Modalities

The large, active research areas that *aren't* text LLMs — yet are being reshaped by the
same "foundation model" thinking. The frontier-LLM map systematically under-weights these.

## Contents

- [**Structured-data ML**](structured-data-ml.md) — time-series, tabular, and graph/relational
  foundation models; the GBDT-vs-deep-learning debate.
- [**Recommender systems**](recommender-systems.md) — generative recommendation, the "ChatGPT
  moment" for RecSys.
- [**Speech & audio AI**](speech-and-audio-ai.md) — ASR, audio-language models, full-duplex
  voice, music, codecs.
- [**Retrieval & embeddings**](retrieval-and-embeddings.md) — the representation-learning and
  IR research underneath RAG and search.
- [**Quantum ML & federated learning**](quantum-ml-and-federated-learning.md) — two fields with
  very different hype-vs-reality profiles.

## The shape of this area

The "foundation model" pattern spread far beyond text: **time-series** (Chronos-2, TimesFM),
**tabular** (TabPFN), **graph/relational** (Google's GFM, Relational Transformer),
**recommendation** (Meta HSTU, Kuaishou OneRec in production), **audio** (omnilingual ASR,
audio-language models), and **embeddings** (decoder-LLM embedders topping MTEB). A recurring
theme: classical methods (**gradient-boosted trees**, even **xLSTMs**) are *not* dead — they
remain at or near SOTA in their niches, so "deep learning won everything" is false here.

> **📦 Concept: "foundation model"** — a single large model pretrained broadly, then reused
> across many tasks (often zero-shot). The 2025–26 story is this idea arriving in domain after
> domain beyond text.
