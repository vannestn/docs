# Materials & Chemistry

## In brief
- **What it is** — AI applied to finding new materials and molecules. Instead of chemists
  guessing candidates one at a time, generative models *propose* new structures, fast ML
  "surrogate" simulators (universal interatomic potentials) *screen* them for stability far
  cheaper than exact quantum physics, and autonomous robotic labs aim to *make and test*
  the winners — ideally closing the whole loop with little human input.
- **Why it's pursued** — the search space of possible materials is astronomically large and
  traditional discovery is slow and expensive: real quantum-mechanical simulation is
  costly, and physically synthesizing and measuring a candidate is slower still. AI promises
  to explore that space orders of magnitude faster.
- **Potential impact** — faster discovery of batteries, catalysts, superconductors, and
  drugs could reshape energy and medicine. The key limits: many computationally "stable"
  candidates can't actually be made in a lab (the *synthesizability* gap), and the
  bottleneck of slow, costly physical validation keeps the discovery loop from truly closing.

## Key directions & work

- **MatterGen** (Microsoft) — a diffusion model that jointly generates atom types,
  coordinates, and lattices to produce novel inorganic materials conditioned on target
  properties; trained on 600k+ DFT structures. Paired with **MatterSim**, a universal
  interatomic potential (<50 meV/atom).
  [Microsoft](https://www.microsoft.com/en-us/research/blog/mattergen-a-new-paradigm-of-materials-design-with-generative-ai/)
- **GNoME** (DeepMind) — identified 2.2M+ new stable inorganic materials and 45k+ crystal
  prototypes; the reference large-scale discovery dataset. [overview](https://www.sentisight.ai/ai-materials-discovery-gnome-changes-science/)
- **Autonomous "science factory" labs** — Periodic Labs (materials/chemistry/physics) and
  Lila Sciences ("AI Science Factories") pair AI hypothesis generation with robotic
  experimentation. See [10 · Emerging labs](../10-startups-and-nascent-fields/emerging-labs.md)
  and [12 · Business models](../12-politics-capital-and-business-models/business-models.md).

## State of research

**Best-performing now:** Generative models (MatterGen) + universal interatomic potentials
(MatterSim, MACE-family) are the working toolkit, and GNoME-scale screening is established.

**Promising but unproven:** The *autonomous lab* — closing generate→synthesize→measure→
learn entirely in the loop — is the big bet (Periodic, Lila) but unproven at scale and
capital-intensive.

**Open problems & weaknesses:** **Synthesizability** is the chronic gap — many "stable"
generated materials can't actually be made in the lab. Predicting properties beyond
formation energy (e.g., catalysis, in-context conductivity) is harder still. And because
robotic experimentation remains slow and expensive, the loop stays far from closed:
validation throughput is the bottleneck.
