# Materials & Chemistry

AI is reshaping how new materials and molecules are found: generative models propose
candidates, universal interatomic potentials (fast ML surrogates for quantum-accurate
simulation) screen them, and autonomous labs aim to close the experimental loop.

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
