# Scaling Laws & Theory

The quantitative and theoretical understanding of *why* deep learning works and how
performance scales with compute, data, and parameters.

## Key directions & work

### Empirical scaling & efficiency trends
- **Epoch AI trends** — frontier training compute growing ~5×/year (doubling ~5.2 months);
  algorithmic/pretraining efficiency ~3×/year (doubling ~7.6 months); LLM inference price at
  fixed performance falling ~40×/year (median across benchmarks; the rate ranges from
  ~9×/year to ~900×/year depending on the task/capability tracked). [Epoch](https://epoch.ai/trends)
  (see also [08 · Economics & forecasting](../08-evaluation-and-governance/economics-and-forecasting.md))

### Distillation scaling
- **Distillation Scaling Laws** (Apple; Busbridge, Shidani, Weers, Ramapuram, Littwin, Webb;
  ICML 2025) — a closed-form law predicting a distilled *student's* cross-entropy from the
  compute budget and how it is split between teacher and student.
  [arXiv:2502.08606](https://arxiv.org/abs/2502.08606)
  - **Form.** Student loss `L_S(N_S, D_S, L_T)` is a *broken power law* in the **teacher's
    cross-entropy** `L_T` plus a power law in student size `N_S` and distillation tokens
    `D_S` (Eq. 8). The decisive finding: teacher *size* `N_T` and teacher tokens `D_T`
    matter only through the resulting `L_T` — so teacher size/tokens can be dropped as
    search dimensions. The fit holds to ≲1% relative prediction error, including when
    *extrapolating* from weak to strong students.
  - **Capacity gap.** Improving the teacher does **not** monotonically improve the student:
    past an optimum, a stronger teacher yields a *worse* student. The paper reframes this as
    a gap in *learning capacity* between teacher and student (hypothesis space + ability to
    optimize), of which relative size is only a special case, and gives the first controlled
    demonstrations (kernel-regression and MLP settings, Appendices C.1–C.2).
  - **When distillation pays off.** Distillation can **never** produce a *lower* cross-entropy
    than supervised learning given enough student compute/tokens. It is more *efficient* only
    when (i) the student's total compute/tokens stays below a student-size-dependent threshold
    **and** (ii) a teacher already exists or has uses beyond a single distillation (e.g. as a
    server model). If the only goal is one model of a target size and no teacher exists,
    supervised pretraining wins. Smaller students are more likely to benefit from supervised
    pretraining; larger students from distillation (Table 3).
  - **Setup.** Transformer students and teachers from **143M to 12.6B** non-embedding params,
    trained on C4 (English-only) with seq-len 4096, MHA + RMSNorm + RoPE, under μP; distillation
    up to **512B tokens**. *Pure* distillation (`λ=1`) at temperature `τ=1`, which they verify
    gives statistically-best students. They observe **weak-to-strong generalization** (student
    can outperform its teacher) in some configs.

### Theory of generalization
- **"A Theory of Generalization in Deep Learning"** (Litman & Guo, Stanford; preprint, May 2026)
  — a *non-asymptotic* theory built on the **empirical** neural tangent kernel (eNTK), which
  partitions output space into a **signal channel** (`range` of a cumulative-dissipation
  Gramian `W_S` — directions training moved the outputs) and a **reservoir** (`ker W_S` —
  directions training dissipated nothing). [arXiv:2605.01172](https://arxiv.org/abs/2605.01172)
  - **What it proves.** *Generalization survives even when the kernel drifts by O(1) in
    operator norm* — i.e. in the **full feature-learning regime**, not just the lazy/frozen-NTK
    regime (their experiments measure drift peaking at ~4.8× and settling ~2.4×, far outside
    lazy). The reservoir is *test-invisible* (`ker W_S ⊆ ker G_QS`, Prop. 3.2): residual error
    parked there contributes nothing to test predictions. Inside the signal channel, minibatch
    SGD's *drift* accumulates coherent signal linearly while its centered *fluctuation* diffuses,
    so fitted label noise dies at rate ~`1/√n` rather than accumulating (Thm. 4.1). Under squared
    loss, test displacement is determined *exactly* by training displacement on the realized path
    via a closed-form predictor `A_∘ = G·D†` (Thm. 5.1) — no kernel-stability or asymptotic
    assumption.
  - **Unification.** A four-cell (signal/noise × channel/reservoir) decomposition of test error
    (Figure 1) locates classical phenomena as special cases: **benign overfitting** (noise
    sitting in the reservoir at interpolation), **double descent** (noise moving between channels
    as capacity sweeps interpolation), **implicit bias** (signal channel filling from the top
    eNTK eigenvalue down), and **grokking** (signal migrating from reservoir into the signal
    channel as the kernel evolves). The frozen-kernel limit recovers kernel regression as one
    choice of preconditioner (Appendix H).
  - **Practical payoff.** They derive an *exact* population-risk objective from a single training
    run with **no validation data**, for any architecture/loss/optimizer, that measures the
    signal-channel noise precisely. It reduces to an **SNR preconditioner on top of Adam** — one
    extra parameter-sized state vector, a one-line change. Reported results: a noisy-IC PINN
    (`u_t + βu_x = 0`, β=5) reaches relative ℓ₂ ≤ 0.40 in **2.4× fewer** iterations than the best
    LR-tuned AdamW; on modular division `a·b⁻¹ mod 97` at 25% training fraction it hits 95%
    held-out accuracy at step **5,950 vs 29,450** for AdamW (~**4.9×** faster grokking, hence the
    "~5×" headline); and DPO fine-tuning of Qwen2.5-0.5B-Instruct under 30%-swapped UltraFeedback
    preferences raises reward accuracy 0.566 → 0.641 while staying **3.05× closer** to the
    reference policy. Memorization is *suppressed* (PINNs, implicit neural representations).

### Test-time-compute scaling
- **"Scaling LLM Test-Time Compute Optimally..."** (Snell, Lee, Xu, Kumar; UC Berkeley /
  Google DeepMind; Aug 2024) — the primary scaling study of *inference*-time compute, asking
  how much a fixed, non-trivial test-time budget can improve a model on a hard prompt.
  [arXiv:2408.03314](https://arxiv.org/abs/2408.03314)
  - **Two mechanisms studied:** (1) searching against a dense, *process-based* verifier reward
    model (PRM), and (2) adaptively updating the model's response distribution at test time. In
    both, the *best* allocation depends sharply on prompt **difficulty** — no single strategy
    dominates across the difficulty spectrum.
  - **Compute-optimal allocation.** Adaptively allocating test-time compute *per prompt* by
    estimated difficulty improves test-time-scaling efficiency by **>4×** over a best-of-N
    baseline. In a FLOPs-matched comparison, on problems where a smaller base model already has
    non-trivial success rates, spending compute at test time can **outperform a 14× larger
    model** — directly trading pretraining params against inference compute.
  - See [01 · Reasoning & test-time compute](../01-foundation-models-and-capabilities/reasoning-and-test-time-compute.md)
    for the downstream reasoning methods (o-series, verifiers, search) this scaling result underpins.

## State of research

**Best-performing now:** Empirical scaling/efficiency laws (Epoch, Chinchilla-lineage) are
reliable enough to guide multi-hundred-million-dollar training decisions and compute-
governance thresholds. The distillation law gives actionable teacher/student trade-offs and
reduces distillation search to a single variable (teacher cross-entropy).

**Promising but unproven:** A unified theory of feature-learning generalization is an
active, exciting target but not yet consensus — the Litman–Guo eNTK partition is a strong
recent candidate (it claims O(1)-drift guarantees and a no-validation-data objective), but it
is a single 2026 preprint, leans on squared-loss for its exact train-test coupling, and the
optimizer claims rest on a handful of small-to-mid-scale tasks (PINN, modular arithmetic, a
0.5B DPO run) rather than frontier pretraining. Scaling laws for *test-time compute* now have a
primary anchor (Snell et al.; compute-optimal allocation beats best-of-N by >4× and can outperform
a 14× larger model), but laws for *reasoning RL* training and for non-transformer architectures are
still being mapped.

**Open problems & weaknesses:** Theory lags practice badly — most frontier progress is
empirical. Scaling laws describe loss, not *capabilities* (emergence remains poorly
predicted). The "data wall" introduces a regime (repeated/synthetic data) where classic
laws may not hold. The distillation law explicitly warns it is *broken* by a fundamental
limit — distillation can match but not beat supervised learning at sufficient compute, and it
carries its own failure mode (the capacity gap), so it is not a free lunch for frontier-scale
models. Whether inference-time scaling has its own clean law is open.
