# Domain Applications

Verticals where AI is becoming a distinct research area with its own methods and benchmarks —
beyond general-purpose models.

## Key directions & work

### Healthcare / medicine
- **Clinical reasoning models & agents** — but current clinical agents still show modest
  gains (e.g., ~30% on MedAgentsBench) despite tool access, defining a clear open gap. A
  "clinical world model" framing is emerging to ground competency in real cognition. *[2026 IDs]*

### Education
- **AI tutoring** is re-grounding in *pedagogical theory* (adaptive scaffolding) and moving
  toward agentic/social-learning setups rather than single-tutor chatbots. *[2026 IDs]*

### Cross-cutting
- **Spatial/embodied reasoning**, **3D generation**, and **video understanding** are covered
  in [06 · Robotics & world models](../06-robotics-and-world-models/).

## State of research

**Best-performing now:** General frontier models with light domain adaptation often beat
bespoke systems on knowledge benchmarks (e.g., medical Q&A). Education tutoring has real
deployments.

**Promising but unproven:** *Agentic* clinical workflows and theory-grounded tutoring are
early. The value is in reliable end-to-end task completion, not just benchmark scores.

**Open problems & weaknesses:** High-stakes domains (medicine, law) lack cheap automatic
verification, so **data quality and evaluation are hard** (see
[07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md)). Regulatory, safety,
and liability constraints slow deployment. Benchmark performance routinely overstates
real-world readiness.
