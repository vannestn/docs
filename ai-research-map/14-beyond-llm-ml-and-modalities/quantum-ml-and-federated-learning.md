# Quantum ML & Federated Learning

## In brief
- **What it is** — Two distinct "emerging ML" fields bundled here for contrast. *Quantum machine learning (QML)* tries to run learning algorithms on quantum computers, hoping their exotic physics unlocks patterns classical computers cannot. *Federated learning (FL)* trains a shared model across many phones or hospitals without ever pooling their raw data — each device computes updates locally and only those updates are combined.
- **Why it's pursued** — QML is chasing a speed or accuracy advantage on hard problems no classical machine can match. FL solves a privacy problem: it lets you learn from sensitive data (keyboard typing, medical records) that legally or ethically cannot be centralized.
- **Potential impact** — They have opposite hype-vs-reality profiles. QML is mostly *promise*: leading groups now find its flagship models are secretly reproducible on a classical laptop, so real-world advantage remains unproven. FL is quietly *deployed*: it already ships at scale (Google Gboard, Apple) with formal privacy guarantees, and the live frontier is stretching it to fine-tune large language models on-device.

## Quantum machine learning (QML) — mostly promise

- **The central deflationary result:** the architectural fixes that make variational QML
  *trainable* (provably no "barren plateaus") tend to also encode the problem into a small,
  **classically simulable** subspace — so the cure may erase the advantage. This is the explicit
  thesis of Cerezo et al., *Nature Communications* 16, 7907 (2025), "Does provable absence of
  barren plateaus imply classical simulability?" [arXiv:2312.09121](https://arxiv.org/abs/2312.09121).
  For the broader barren-plateau landscape (ansatz, init, observable, loss, noise — any can
  induce BPs), see the Los Alamos review [Nature Rev. Phys. 2025](https://www.nature.com/articles/s42254-025-00813-9).

### Flagship architectures don't deliver advantage

Quantum CNNs (QCNNs) — long regarded as one of the most promising QML architectures because
they were shown to be *barren-plateau-free* on low-entanglement data — are shown to be
**effectively classically simulable**. Bermejo, Braccia, Rudolph, Holmes, Cincio & Cerezo
(Los Alamos / EPFL), [arXiv:2408.12739](https://arxiv.org/abs/2408.12739) (v2, Feb 2026).

The argument is a **proof by demonstration**, resting on two facts:
1. **Randomly initialized QCNNs only process low-bodyness information.** Using Weingarten
   calculus, the authors prove (Result 1) that for a randomly initialized tracing-out QCNN, a
   Pauli's contribution to the Heisenberg-evolved measurement operator decays *exponentially*
   with its bodyness `k` — concretely as `O((2/3)^k)`. So the QCNN acts only on a
   polynomially-sized subspace of low-weight observables. The same holds for measurement-based
   QCNNs (Result 2). This is the *flip side* of why QCNNs avoid barren plateaus.
2. **The benchmark datasets are "locally-easy."** Every classical and quantum dataset used in
   the QCNN literature can be classified from the expectation values of low-bodyness observables
   alone — so the task never requires leaving the simulable subspace.

They then **build and train an explicit classical surrogate** (low-bodyness Pauli propagation /
LOWESA + tensor networks + classical shadows) that **matches or outperforms** standard QCNNs on
all benchmarks, scaling to **1024 qubits** (1024 for Bond-Alternating XXX, 512 for the Haldane
chain, 32 qubits for ANNNI/Cluster multi-class tasks) — on a laptop.

**Results with the eval:**
- *Quantum-phase tasks* (condensed-matter ground states via DMRG): the classical QCNN reaches
  test accuracy **>90%** on Bond-Alternating XXX, **~85.8%** (200 training points) / **80.2%**
  (20 points) on the Haldane chain, and **80–84%** on ANNNI / Cluster — comparable to or better
  than reported full-QCNN numbers, while using **order-of-magnitude fewer measurements**
  (≤20,000 shots total vs. 5,000–10,000 shots *per training step per data point* on hardware).
- *Classical-image tasks* (MNIST, Fashion-MNIST, EuroSAT, GTSRB via amplitude / angle encoding):
  the simulated QCNN hits **91–100%** test accuracy across pairs (Table I), again matching or
  beating literature QCNNs. For classical data the embedding scheme is itself classically
  simulable, so **even classical shadows are unnecessary** — no quantum resources at all.

**Author-stated scope/limits (do not overclaim):**
- This is **not a full dequantization** of QML. For *quantum* input data, a quantum device is
  still needed for the shadow-tomography acquisition phase — but only state prep + single-qubit
  measurements, *not* a universal/digital quantum computer or a hybrid training loop.
- The claims cover the **two most-used 1D QCNN variants** (tracing-out and measurement-based,
  nearest-neighbor). The authors *deliberately did not* analyze 2D / exotic-topology QCNNs, and
  acknowledge those raise simulation cost (though Pauli-propagation / belief-propagation methods
  may still handle them).
- The results are **average-case** (random init) extended *heuristically* by the numerical
  experiments to trained models — explicitly *not* a proven bridge from average-case to
  worst-case.
- One can *construct* non-simulable QCNNs by embedding Shor / cryptographic structure, but the
  authors call these "mathematical artifacts… nowhere near related to practical problems."

> **Their boldest claim:** *"There is currently no evidence that QCNNs will work on classically
> non-trivial tasks."* The field is "in dire need of non-trivial datasets"; until a task is
> found that cannot be solved by simulating the QCNN's low-bodyness action, the burden of proof
> rests on QML proponents.

### Dequantization

Dequantization (random Fourier features, classical surrogates) reproduces many QML models
classically. Provable quantum advantages exist only on **artificial, structured data**
(discrete-log-style / Shor-embedded), not on real datasets. The QCNN result above is a concrete
instance: for classical data, the authors argue using QCNN-based QML is "an ill-motivated task."

> **📦 Honest read** — QML is a vibrant *theory* field, but the 2025–26 consensus among leading
> groups (Los Alamos, EPFL) is skeptical about near-term advantage on classical-data tasks. The
> open question is now framed as a **dataset** problem, not a model problem.

## Federated learning (FL) — quietly real

- **Production FL with formal differential-privacy guarantees ships at scale** — Google trained
  and deployed **20+ Gboard next-word-prediction language models** with formal DP guarantees
  (ρ-zCDP, ρ ∈ (0.2, 2)) via **DP-FTRL**; all Gboard NWP models now carry DP guarantees and all
  future user-data launches require them. Apple ships on-device DP FL similarly.
  [Google](https://research.google/blog/federated-learning-with-formal-differential-privacy-guarantees/),
  [arXiv:2305.18465](https://arxiv.org/abs/2305.18465). (Note: "billion-device scale" describes
  the *deployment surface*; reported training rounds use ~6,500 devices/round.)
- **Federated LLM fine-tuning** is the hot frontier but research-stage — gated by device memory;
  side-tuning/split designs and FedLoRA reduce the burden (see below).
- **Cross-silo FL** (healthcare/finance) is the commercially serious segment (NVIDIA FLARE,
  Flower, Owkin).

> **📦 Concept: federated learning** — train a shared model across many devices without
> centralizing their raw data; only privatized model *updates* (or, in side-tuning, activations)
> leave the device.

### Federated LLM fine-tuning: the memory wall and the side-tuning fix

The blocker is concrete: standard PEFT (LoRA/adapters) still requires each device to store the
frozen backbone, **intermediate activations, and optimizer states** and to **backprop through
the full LLM** — e.g. LoRA on a 1.3B model needs **>14.5 GB GPU memory**, vs. the **4–12 GB**
on most phones (per *Fed MobiLLM*, citing MobiLLM). Synchronous aggregation also stalls on
stragglers.

**Fed MobiLLM** (Yang, Li et al., U. Houston / Pengcheng Lab),
[arXiv:2508.06765](https://arxiv.org/abs/2508.06765), pushes **all trainable parameters and all
backprop to the server** via a *server-assisted federated side-tuning* paradigm (building on
MobiLLM [arXiv:2502.20421](https://arxiv.org/abs/2502.20421) and PAE MobiLLM
[arXiv:2507.01216](https://arxiv.org/abs/2507.01216)):
- Each device runs **only a forward pass** through its **frozen** backbone and uploads selected
  intermediate activations + a prediction residual `Δy` (output minus label, so no raw label
  leaves the device). No on-device backprop, no optimizer state.
- The server trains a shared **side-network asynchronously**, updating immediately on *any*
  device's activations — eliminating the straggler/synchronization barrier. Each device passes
  its local data **once**; the server caches and shuffles activations for further iterations.
- **Heterogeneity handling** (the real novelty vs. single-device MobiLLM): devices load
  *different-sized* backbones matched to their RAM (e.g. OPT-125M/350M/1.3B). Two alignment
  mechanisms unify them — *layer-wise activation sampling* (partition all backbones into a fixed
  number of blocks = the shallowest model's depth, sample the last layer of each block) and
  *hidden-size scaling* (per-backbone trainable linear projections to a common adapter width).

**Eval — GLUE benchmark, OPT + RoBERTa, NVIDIA Jetson testbed (TX2 / Xavier NX / AGX Xavier),
100 clients, A100 server.** Headline numbers (vs. FedPETuning/FL, FedBert/SFL, FwdLLM baselines,
on RoBERTa-Base@MRPC, Table 1):
- **≥95.2% lower on-device computation** (2.7 vs. ~390 TFLOPs) and **≥93.2% lower communication**
  (1.1 MB vs. 23–5,437 MB; SFL is the worst, up to **175×**).
- **2.68× lower on-device memory** (0.38 GB, i.e. inference-level — abstract/intro frame the
  memory win as "extremely low," the precise 2.68× figure is for RoBERTa-Base).
- **≥5.1× faster convergence** (time-to-target-accuracy 5.1–6.0 min vs. 20–780 min). Crucially,
  Fed MobiLLM's wall-clock is **near-constant across homogeneous vs. mixed-device setups**, while
  synchronous baselines degrade to ~the slowest device — its straggler-resilience claim.
- **Accuracy:** only **1.5% drop** vs. centralized (88.1 federated vs. 89.6 centralized side-tune)
  and **≥0.3% better than every federated baseline**; the best baseline (FwdLLM-BitFit) drops
  ≥3.3%. Under extreme non-IID (Dirichlet α=0.1) Fed MobiLLM degrades **1.2% less** than
  SFL-BitFit, and reaches **87.3%** vs. 81.5–85.2% for baselines.
- **Ablations confirm the design:** activation-sampling — *average-interval* sampling ≈
  expensive importance-based selection, and more sampled layers → higher accuracy; hidden-size —
  peak accuracy when adapter width matches backbone (mismatch hurts; e.g. forcing OPT-125M's
  768-dim to 2048 degrades it), so pick the *median* dim for multi-device, the *larger* dim for
  two-model cases. *Global* (collaborative) side-network beats *Single* (per-device) everywhere,
  by **≥8.8% (OPT) / ≥7.4% (RoBERTa)** at α=0.1 — i.e. low-capacity devices *help* rather than
  drag down high-capacity ones.

**Author-stated context/limits:** the headline efficiency numbers are *per-device* and reported
on a Jetson testbed (not phones); the memory/comp/comm wins come from never doing on-device
backprop, but they **shift cost to the server** (A100). Side-tuning also assumes the backbone is
available to the server's projection-layer training; the privacy story (no raw data/labels) is
inherited from PAE MobiLLM, not separately re-proven here.

> Related forward-only and split designs the paper benchmarks against: **FwdLLM** (gradient-free,
> perturbation-based, but needs *many* forward passes/update) and **FedBert / split FL** (offload
> deep layers but pay huge communication — up to 175× here).

### Private inference

- **Private LLM inference** via homomorphic encryption/MPC has moved from impossible to
  demonstrable-but-slow (orders of magnitude slower than plaintext). **Secure aggregation** is the
  mature, deployed primitive (it's what lets the server combine FL updates without seeing any
  single device's).

## State of research

**Best-performing now:** FL + differential privacy is **deployed** (Google Gboard 20+ DP models,
Apple); secure aggregation is mature; cross-silo FL has real enterprise use.

**Promising but unproven:** federated LLM fine-tuning at scale — *strong lab results* (Fed
MobiLLM: ≥95% compute / ≥93% comm reduction, 5.1× speedup on a Jetson testbed) but not yet
production; FHE/MPC private LLM inference (demos, not production); *any* practical QML advantage
on real data.

**Open problems & weaknesses:**
- **QML's trainability-vs-simulability tension is the core unresolved question.** The QCNN result
  sharpens it: advantage is confined to *constructed* (Shor/crypto-embedded) data, and the field
  lacks even *one* natural dataset provably outside the low-bodyness simulable subspace. The
  burden of proof has shifted to finding such a dataset.
- **FL faces slow dev cycles, low device participation, and a privacy-vs-robustness trilemma**
  (local DP noise can invite poisoning). For federated *LLM* FT specifically: device heterogeneity
  + straggler stalls (Fed MobiLLM's target) and the on-device memory wall (>14.5 GB for a 1.3B
  LoRA run vs. 4–12 GB phones) remain the gating constraints; side-tuning trades them for
  server-side cost.
- **Private inference remains impractically slow for interactive use.**
