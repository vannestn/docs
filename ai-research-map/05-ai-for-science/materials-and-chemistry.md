# Materials & Chemistry

Generative discovery of new materials and molecules, universal interatomic potentials, and
the closing of the autonomous experimental loop.

## Key directions & work

- **MatterGen** (Microsoft) — joint diffusion over atom types, coordinates, and lattices to
  generate novel inorganic materials conditioned on target properties; trained on 600k+ DFT
  structures. Paired with **MatterSim**, a universal interatomic potential (<50 meV/atom).
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
generated materials can't actually be made. Property prediction beyond formation energy
(catalysis, conductivity in context) is harder. Robotic experimentation is slow and
expensive, so the loop is far from closed. Validation throughput, again, is the bottleneck.
