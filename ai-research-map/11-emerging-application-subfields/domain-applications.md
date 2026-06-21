# Domain Applications

Verticals where AI is becoming a distinct research area with its own methods and benchmarks —
beyond general-purpose models.

## Key directions & work

### Healthcare / medicine
- **Clinical reasoning models & agents** — current clinical agents still show modest gains
  (e.g., ~30% on MedAgentsBench) despite tool access, defining a clear open gap. The field is
  shifting from agentic architectures (planning + memory + tool use) that inherit base-model
  unreliability while adding cascading risk — "a single misread laboratory value can silently
  propagate into a harmful recommendation."
  [arXiv:2604.08226](https://arxiv.org/abs/2604.08226)
- **A "clinical world model" framing** is emerging to ground competency in real cognition rather
  than benchmark scores (Safavi-Naini et al., a conceptual/framework paper). It formalizes care as
  a **tripartite Patient–Provider–Ecosystem** interaction across **13 world dimensions**, and a
  **Clinical AI Skill-Mix** that decomposes competency into **8 dimensions** — 5 clinical (condition,
  care phase, care setting, clinical task, provider role) + 3 for how AI engages human reasoning
  (agent-facing, anchoring layer, assigned authority). Their combinatorial product yields **"billions
  of distinct competency coordinates,"** and the central claim is that validation at one coordinate
  gives *minimal* evidence for another (the space is "irreducible"). It reframes the field's question
  from *"does AI work?"* to *"in which coordinates has reliability been demonstrated, and for whom?"*
  — useful as a structured argument for *why* high benchmark scores overstate readiness (<6% of
  externally validated radiology models hold their performance, AUC dropping ~8% on external data).
  [arXiv:2604.08226](https://arxiv.org/abs/2604.08226)

### Education
- **AI tutoring** is re-grounding in *pedagogical theory* (adaptive scaffolding) and moving toward
  *agentic* setups rather than single-tutor chatbots. **DeepTutor** (Zhao et al.) is a fully
  open-source agentic tutoring framework pairing citation-grounded instruction with
  difficulty-calibrated question generation and a hybrid engine (fixed knowledge base + dynamic
  per-student memory). It reports **+10.8%** on personalization metrics and **+29.4%** on agentic
  reasoning across five backbone models, evaluated on **TutorBench** — an interactive benchmark with
  curriculum-aligned learner profiles and a first-person LLM student-simulator protocol.
  [arXiv:2604.26962](https://arxiv.org/abs/2604.26962)

### Enterprise / agentic workflow automation
- **Office and enterprise-API agents are being benchmarked on *state change*, not trace-matching.**
  **Agent-Diff** (224 tasks across enterprise productivity software, 9 LLMs) scores success by
  whether the *expected change in environment state* was achieved — separating outcome from process
  — using containerized replicas of real APIs. The shift toward state-diff / end-to-end grading
  mirrors the legal/finance pattern (see [AI for law & finance](./ai-for-law-and-finance.md)):
  per-step competence outpaces reliable multi-step task completion.
  [arXiv:2602.11224](https://arxiv.org/abs/2602.11224)

### Agriculture
- **Multimodal agronomic reasoning is an emerging vertical with its own benchmarks.** A UAV-imagery
  benchmark for plant phenotyping (385 images, 3,000+ samples; disease ID, pest/weed control, yield
  estimation on soybean and cotton) evaluated 11 vision-language models: task-specific fine-tuning
  helped substantially (top model Qwen3-VL ~78%), but **quantitative and biologically-grounded
  multi-step reasoning remain the bottleneck**, and accuracy gains diminish past a certain model
  size. [arXiv:2604.09907](https://arxiv.org/abs/2604.09907)

### Cross-cutting
- **Spatial/embodied reasoning**, **3D generation**, and **video understanding** are covered
  in [06 · Robotics & world models](../06-robotics-and-world-models/).

## State of research

**Best-performing now:** General frontier models with light domain adaptation often beat
bespoke systems on knowledge benchmarks (e.g., medical Q&A). Education tutoring has real
deployments.

**Promising but unproven:** *Agentic* clinical workflows, theory-grounded tutoring, enterprise-API
agents, and multimodal agronomy are all early. The value is in reliable end-to-end task completion,
not per-step or single-coordinate benchmark scores — a theme echoed by the clinical world-model
argument (validation at one competency coordinate transfers minimally to another) and by
state-diff/all-pass grading in enterprise and legal agents.

**Open problems & weaknesses:** High-stakes domains (medicine, law) lack cheap automatic
verification, so **data quality and evaluation are hard** (see
[07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md)). Regulatory, safety,
and liability constraints slow deployment. Benchmark performance routinely overstates
real-world readiness.
