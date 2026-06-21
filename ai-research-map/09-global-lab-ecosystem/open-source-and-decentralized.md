# Open-Source & Decentralized

The labs and movements treating *openness* and *decentralization* as research values in
themselves.

> **📦 Concept: "fully open" vs "open-weight"** — *Open-weight* releases just the trained
> model. *Fully open* also releases the **training data, code, and intermediate
> checkpoints** — so others can reproduce and study the whole process. Ai2's OLMo is the
> leading fully-open example.

> **📦 Concept: "decentralized training"** — training one model across many machines in
> different locations (even owned by different people) over the internet, instead of in one
> datacenter. Hard because the machines must constantly share huge updates; the research is
> about cutting that communication.

## The players

- **Allen Institute for AI (Ai2)** — **OLMo 3** (7B/32B), the first *fully open* 32B
  reasoning model: data, code, checkpoints, and logs all released. [arXiv:2512.13961](https://arxiv.org/abs/2512.13961)
- **EleutherAI** — open datasets and interpretability; **Common Pile v0.1**, an 8TB
  copyright-clean corpus. [EleutherAI](https://blog.eleuther.ai/common-pile/)
- **Prime Intellect** — **INTELLECT-2**, the first globally *decentralized* RL training run
  of a 32B model across a permissionless compute swarm. [arXiv:2505.07291](https://arxiv.org/abs/2505.07291)
- **Nous Research** — the **Psyche** decentralized network + DisTrO optimizer; Hermes 4.3 was
  post-trained over the open internet and beat its centralized counterpart. [Nous](https://nousresearch.com/introducing-hermes-4-3)

## State of research

**Best-performing now:** Fully-open models (OLMo 3) are now genuinely competitive for their
size and are the best resource for *studying* how models work. Open clean corpora (Common
Pile) address the copyright/data-quality problem.

**Promising but unproven:** **Decentralized training at frontier scale.** It's demonstrated
at 32B–100B, but the flagship "decentralized" models still train on centralized clusters —
a real mission-vs-execution gap.

**Open problems & weaknesses:** Communication efficiency, trust/verification of untrusted
nodes, and economics all limit decentralization. Fully-open models trail the closed frontier
by months (Epoch estimates ~4 months on aggregate capability). Sustaining funding without a
closed-product business model is the structural challenge (see
[12 · Business models](../12-politics-capital-and-business-models/business-models.md)).
