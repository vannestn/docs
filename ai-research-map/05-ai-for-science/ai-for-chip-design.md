# AI for Chip Design (EDA)

Using AI — reinforcement learning and, increasingly, generative/agentic models — to design the
chips that AI itself runs on.

> **📦 Concept: EDA (Electronic Design Automation)** — the software used to design computer
> chips. "Placement/floorplanning" = deciding where blocks go on the silicon, a hard
> optimization problem. **Macro placement** = positioning the large blocks (SRAMs, compute units)
> first, before the millions of small standard cells are placed around them.

## Key directions & work

- **AlphaChip** (Google DeepMind) — deep RL for macro placement, framed as a sequential
  decision process: the agent places macros one at a time onto a coarse grid, guided by a graph
  neural network and a proxy reward blending wirelength, congestion, and density. The central
  claimed advantage is pre-training on prior chip blocks — the agent gets better as it sees more
  designs. Google says it has designed layouts for **TPU v5e, v5p, and Trillium (6th-gen)**, with
  AlphaChip handling a *growing share* of each generation's floorplan, plus 7 blocks in the Axion
  Arm CPU. Pre-trained checkpoint and weights are open-sourced.
  [DeepMind](https://deepmind.google/blog/how-alphachip-transformed-computer-chip-design/) ·
  original method [Nature 2021 / arXiv:2004.10746](https://arxiv.org/abs/2004.10746)
- **A genuine, still-contested reproducibility dispute.** Two distinct critiques exist — don't
  conflate them:
  - **Cheng, Kahng et al. (UCSD), ISPD 2023** [arXiv:2302.11014](https://arxiv.org/abs/2302.11014)
    — reimplemented the method, ran SA and a commercial macro placer (Cadence CMP), and reported
    that Google RL did *not* beat them; SA had lower variance and CMP led on quality.
  - **Igor L. Markov, "The False Dawn,"** *Comm. ACM* Nov 2024 / [arXiv:2306.09633](https://arxiv.org/abs/2306.09633)
    — a meta-analysis (no new experiments) arguing the Nature paper's claims are "substantially
    undermined" and alleging questionable practices; it leans heavily on the Cheng et al. results
    and on court filings from the Google whistleblower lawsuit.
  - **Google's rebuttal, "That Chip Has Sailed"** [arXiv:2411.10053](https://arxiv.org/abs/2411.10053)
    (Goldie, Mirhoseini, Dean) answers both: it says Cheng et al. *didn't run the method as
    published* (no pre-training, 20× fewer RL collectors, 8 vs 16 GPUs, not trained to convergence,
    older 45nm/12nm nodes), and notes Markov co-authored an anonymous PDF he cites without
    disclosure. **Status: Nature investigated, found in the authors' favor, and published an
    Addendum (not a Correction) in Sep 2024, removing its editor's note**
    ([Nature Addendum](https://www.nature.com/articles/s41586-024-08032-5)). Markov maintains none
    of the substantive concerns were addressed. So the dispute is *resolved editorially but not by
    community consensus* — the most important caveat here.
- **Commercial EDA leans agentic/generative AI, not pure RL.** Cadence Cerebrus AI Studio and
  Synopsys.ai Copilot are the shipping direction; NVIDIA built a domain-adapted LLM, **ChipNeMo**,
  as an internal copilot for chatbot/EDA-script/bug-summary tasks
  [arXiv:2311.00176](https://arxiv.org/abs/2311.00176). Notably, Synopsys' VP for AI/ML
  **Thomas Andersen** said of RL for core EDA: *"there have been attempts with reinforcement
  learning to come up with better solutions, but that hasn't really panned out."*
  [SemiEngineering](https://semiengineering.com/ais-potential-and-limitations-in-chip-design/) ·
  product launch [Synopsys 2025-09-03](https://www.prnewswire.com/news-releases/synopsys-announces-expanding-ai-capabilities-for-its-leading-eda-solutions-302544656.html)

## How the AlphaChip dispute actually breaks down

The two papers on disk are the rebuttal (2411.10053) and Markov's meta-analysis (2306.09633).
The substantive technical disagreement reduces to a few concrete points:

- **Pre-training.** Google's core claim is that the RL agent improves with experience; the
  rebuttal reproduces Nature Fig. 4/5 to show that a from-scratch policy needs ~48h to reach what
  a pre-trained policy hits in ~6h on the Ariane RISC-V CPU. Cheng et al. pre-trained on **0
  blocks** vs Google's 20 — which Google argues invalidates the comparison ("like evaluating
  AlphaGo that never saw a game of Go").
- **The proxy reward.** Markov's central methodological charge (via Cheng et al.) is that the RL
  proxy cost correlates *poorly* with real chip-timing metrics (TNS/WNS), which are themselves
  high-variance (σ/|μ| > 0.5) — so reported timing "improvements" may just be noise from later,
  non-RL steps. Google's counter: Cheng et al.'s own correlation table actually shows a *weak but
  positive* correlation between overall proxy cost and final metrics (except standard-cell area,
  a hard constraint they don't optimize), and the study cherry-picks (only proxy costs < 0.9, a
  single 45nm case).
- **The initial-placement / clustering "ablation."** Cheng et al. argued RL secretly exploits
  (x,y) coordinates from commercial tools. Google's rebuttal Table 2 shows clustering *with vs
  without* initial placement gives essentially identical RL results (wirelength 5,176 vs 5,133;
  TNS −2.466 vs −2.583), arguing no hidden dependence. Markov, conversely, cites Cheng's finding
  that using those initial locations improved metrics by 7–10%.
- **Baselines.** Markov argues every baseline in the Nature paper (human, SA, RePlAce) was
  handicapped — e.g. RePlAce was misused on clustered netlists outside its intended mixed-size
  regime, and the SA implementation was weak; a stronger SA ("Stronger Baselines" paper) beat RL
  in less time on the same proxy.
- **Deployment as evidence.** Google points to TPU v5e/v5p/Trillium + Axion tape-outs and external
  adoption (MediaTek extended AlphaChip for its "most advanced chips"). Markov counters that wide
  internal use could be "dogfooding" and doesn't prove the state of the art was advanced, since
  chips ship every year without doing so.

A separate, independent 2024 benchmark Markov cites (Wang et al., arXiv:2407.15026) reportedly
found post-Nature RL placement lagging RePlAce, DREAMPlace, and AutoDMP on end-to-end chip metrics
— though those authors also could not fully reproduce the Nature method.

## State of research

**In production:** AlphaChip is deployed for Google's own silicon (TPU v5e → Trillium, Axion) and
extended by MediaTek; commercial vendors are shipping generative/agentic LLM copilots, not RL
placers.

**Promising but unproven:** whether RL macro placement generalizes/reproduces *outside* Google on
public benchmarks and modern nodes; end-to-end agentic chip design.

**Open problems & weaknesses:**
- The **AlphaChip dispute** is editorially closed (Nature Addendum, Sep 2024) but not settled by
  community consensus — the two sides still disagree on whether the published method was ever
  faithfully reproduced.
- **Vendor PPA-gain claims are not independently audited.** Cadence reports Cerebrus AI Studio
  delivers *up to 20% PPA* improvement and 5–10× faster delivery (⚠️ vendor-reported)
  ([Cadence](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/soc-implementation-and-floorplanning/cadence-cerebrus-ai-studio.html));
  customer case studies cite smaller, design-specific numbers (TI ~4.4%, Samsung ~8–11%) (⚠️
  vendor/customer-reported).
- **Explicit industry skepticism** that RL beats classical optimizers for *core* placement
  (Andersen, Synopsys), even as generative/agentic AI for copilots and design-space exploration
  gains traction.
- **No open modern benchmarks.** Both sides agree fully-open chip designs are stuck at older nodes
  (28/45/130nm); sub-7nm IP is proprietary, which is *itself* a barrier to settling the dispute.
