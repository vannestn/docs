# Neuroscience & Brain-Computer Interfaces

AI decoding neural activity — restoring speech to paralyzed patients, decoding *inner*
speech, and building cross-species "brain foundation models."

## Key directions & work

- **Real-time voice synthesis from brain activity** (UC Davis / BrainGate2) — an ALS
  participant's intended speech instantaneously synthesized from **256 microelectrodes** in
  ventral precentral gyrus, with **<10 ms** closed-loop latency. On a large open vocabulary,
  human listeners transcribed the synthesized voice at **43.75% median WER** (vs **96.43%** for
  the participant's residual dysarthric speech), and matched the correct transcript with **94.3%**
  mean accuracy. The system also decoded *paralinguistics*: question intonation (90.5%) and word
  emphasis (95.7%), and let him sing three-note melodies. A limited 50-word vocabulary was used
  only for the first-day online demo. [Wairagkar et al., Nature 2025](https://www.nature.com/articles/s41586-025-09127-3) · [ScienceDaily](https://www.sciencedaily.com/releases/2025/06/250612081317.htm)
- **Inner-speech decoding** (Stanford / BrainGate2) — decoded self-paced *imagined* speech from
  motor cortex across 4 participants (ALS + stroke). Real-time WER reached **14%** on a 50-word
  vocabulary (T15) and **26%** on a **125,000-word** vocabulary (T15); harder participants were
  worse (e.g. 54% WER at 125K). Inner speech shares the same neural representation as attempted
  speech but at **~40–75% of its magnitude** (≈52% for one array), which is why it decodes less
  reliably. A "password" safeguard (unlock phrase *"chitty chitty bang bang"*) was detected with
  **98.75%** accuracy, addressing mental-privacy concerns. [Kunz et al., Cell 2025](https://www.cell.com/cell/fulltext/S0092-8674(25)00681-6)
- **Cross-species end-to-end speech decoding (BIT, *BraIn-to-Text*)** — a transformer neural
  encoder pretrained with masked self-supervision on **~98 h of human + ~269 h of monkey** Utah-array
  recordings, paired with an audio-LLM decoder. Cross-species, cross-task pretraining transfers to
  both attempted and imagined speech and sets SOTA on the Brain-to-Text '24/'25 benchmarks. Its
  end-to-end variant cuts WER from the prior end-to-end method's **24.69% → 10.22%** (ensembled, BTT
  '24). [arXiv:2511.21740](https://arxiv.org/abs/2511.21740) (ICLR 2026)
- **"Brain foundation models" (BFMs)** — proposed as a defined 2025 paradigm: large-scale,
  *neurocentric* pretraining on EEG/fMRI (and MEG/fNIRS) for cross-scenario, cross-task decoding
  plus brain simulation. [Survey arXiv:2503.00580](https://arxiv.org/abs/2503.00580)

## How the work actually works

### BIT — end-to-end speech decoding via a cross-species encoder + audio-LLM

The core thesis of [BIT](https://arxiv.org/abs/2511.21740) is that *modern speech BCIs are
cascaded* (RNN → phonemes → n-gram LM → sentence) and can't be optimized end-to-end — and that
lower phoneme error doesn't reliably translate to lower WER. BIT replaces this with a single
differentiable network:

- **Neural encoder.** A transformer over **20 ms** patches of thresholded spike counts and
  spiking-band power (z-scored per day to fight non-stationarity), with RoPE positional embeddings
  and bidirectional attention. Pretrained with **masked modeling** (MAE-style: mask spans, MSE-reconstruct
  the patch tokens) on human + monkey Utah-array data, then fine-tuned for phoneme decoding with a CTC loss.
- **Audio-LLM decoder.** Encoder outputs are projected (shallow MLP) into the text embedding space
  of a small audio-LLM and fed alongside a prompt (*"decode the above neural activity into an English
  sentence:"*). The LLM is fine-tuned with **LoRA** + cross-entropy + a **contrastive modality-alignment**
  loss (à la LLaVA, treating neural activity as a "vision-for-language" modality).

**Results, with the eval.** On the **Brain-to-Text '24** holdout (1,200 sentences):

| Decoder | Entry | WER |
|---|---|---|
| End-to-end | Feng et al. 2024 (prior SOTA) | 24.69% |
| End-to-end | BIT End-to-End + Ensemble | **10.22%** |
| Cascaded (5-gram LM) | Feghhi et al. 2025 (prior) | 7.98% |
| Cascaded | BIT Cascaded | **6.35%** |
| Cascaded + Ensemble | BIT Cascaded + Ensemble | **5.10%** |

On the **'25** leaderboard, BIT Cascaded + Ensemble leads at **1.76% WER**.

**Ablations the paper actually runs:**
- **Pretraining scale & cross-species transfer.** *BIT-All* (human + monkey) > *BIT-Human* >
  *BIT-TFS* (from scratch). For imagined speech (50-word vocab), pretraining helps by **39–45%**
  relative WER — i.e. SSL pretraining matters most in *low-data* regimes. Cross-subject, label-free
  SSL gives **larger** transfer than within-subject supervised pretraining (*BIT-All* > *BIT-Cross-Task-Only*).
- **LLM choice.** Audio-LLMs (e.g. Aero1-Audio 1.5B) beat text-LLMs of equal size; smaller LLMs
  (1–7B) beat larger ones here, since the task is English *translation*, not reasoning. Contrastive
  alignment further lowers WER.
- **Representation analysis (RSA).** Pretrained encoder outputs are more similar to audio-LLM text
  embeddings than RNN/scratch encoders, and attempted vs. imagined embeddings align after BIT (vs.
  linearly separable before) — evidence for genuine cross-task generalization.

**Author-stated limitations.** End-to-end is **slower (~0.95 s/sentence vs 0.24 s cascaded)** and
not yet real-time-ready; the encoder uses bidirectional attention (offline) — going causal costs
accuracy; the 1.5B audio-LLM is too big to run on-device; monkey reaching transfers *less* than
human speech data; and the end-to-end decoder still trails the cascaded decoder (the paper aims to
*narrow*, not close, that gap).

### Brain Foundation Models — the survey's framework

The [BFM survey](https://arxiv.org/abs/2503.00580) offers what it claims is the **first formal
definition** of BFMs and argues they differ from generic FMs along data (high noise, non-stationary,
heterogeneous channels), objectives (neuroscience constraints, spatial+temporal modeling), and
ethics (neural-data privacy, clinical safety). Its taxonomy:

- **Three model classes:** pretrained-only; pretrained + fine-tuned; pretrained + interpretability
  (for brain *discovery* via digital-twin brains).
- **Data processing.** Discretized signal segmentation (fixed window *w*, sliding step *s*) to unify
  variable channel counts/lengths; positional encoding is split — *fixed* in time (stable patterns)
  but *learnable* in space (functional connectivity varies across people).
- **Training.** SSL via reconstruction (masked prediction for fMRI's spatial co-activation; autoregression
  for EEG's temporal continuity) or contrastive learning (intra-brain vs. brain-heterogeneous, e.g.
  aligning EEG↔text in NeuroLM or fMRI↔images in CLIP-style decoders).
- **Representative models** (Table II/III): BrainLM (650M), LaBraM (369M), NeuroLM (1.7B), Brant (505M),
  Brain-JEPA (307M), EEGPT (1.1B). On fMRI HCP-Aging, Brain-JEPA beats BrainLM on sex classification
  (**81.5% vs 74.4% ACC**); on EEG TUAB abnormal detection, LaBraM hits **0.902 AUROC**.

## State of research

**Best-performing now:** invasive (intracortical) speech BCIs are **proven in-patient** — real-time
text *and* voice synthesis with paralinguistic control is a landmark, but still at high WER on open
vocabularies (~44% for UC Davis voice synthesis; lower for cascaded text decoders).

**Promising but unproven:** cross-species pretraining transfer (BIT); end-to-end (vs. cascaded)
decoding; inner-speech BCIs; non-invasive decoding; and general "brain foundation models," which the
survey itself frames as still early.

## Open problems & weaknesses

- **Single-subject, invasive, small-data.** Every flagship speech result is per-participant with
  surgical implants. BIT's own evidence shows pretraining only pays off because labeled data is
  scarce — generalization across people remains the bottleneck.
- **Inner speech is intrinsically weaker.** Kunz et al. show imagined speech is ~40–75% the magnitude
  of attempted speech, capping decoding fidelity (54% WER at 125K words for the hardest participant).
- **End-to-end isn't real-time.** BIT is ~4× slower than cascaded and uses non-causal attention; the
  cascaded pipeline still wins on WER and latency.
- **Mental privacy.** Decoding *inner* speech raises consent/privacy stakes; mitigations exist
  (password unlock at 98.75% detection; "imagery-silenced" training) but are early. [Kunz et al., Cell 2025](https://www.cell.com/cell/fulltext/S0092-8674(25)00681-6)
- **BFMs are AI adaptations, not neuro-tailored.** The survey's own critique: current BFMs lean on
  heavy fine-tuning (curtailing true zero-shot), borrow NLP/CV training recipes wholesale, and rarely
  encode biological priors (connectivity, oscillations, cortical gradients) — limiting biological
  interpretability and real-world use. Data harmonization (GDPR/HIPAA, no standardized preprocessing)
  is the other named blocker. [Survey arXiv:2503.00580](https://arxiv.org/abs/2503.00580)
