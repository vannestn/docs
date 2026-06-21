# Robustness & Jailbreaks

Defending models against adversarial inputs, jailbreaks, and misuse — and reducing
hallucination — especially as agents gain real-world privileges.

## Key directions & work

- **Constitutional Classifiers++** — production-grade jailbreak defense: a two-stage
  cascade + exchange classifiers (full conversational context) + linear-probe ensembles.
  Shadow-deployed on Claude Sonnet 4.5 production traffic; flag rate 0.05% (vs 0.38% prior),
  2.2× fewer high-risk vulnerabilities, at ~8–40× lower cost. Anthropic — [arXiv:2601.04603](https://arxiv.org/abs/2601.04603) *[2026 ID — verify]*
- **AgentHarm** (UK AISI + Gray Swan) — leading LLMs are "surprisingly compliant" with
  malicious *agentic* requests even without jailbreaks, and simple universal jailbreak
  templates transfer to agents. See [08 · Safety institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md).
- **Behaviorally-calibrated RL** for hallucination reduction via abstention. [arXiv:2512.19920](https://arxiv.org/abs/2512.19920)
- **Data poisoning** — backdoors implanted with a near-constant ~250 documents regardless
  of model size. Anthropic + UK AISI + Turing — [arXiv:2510.07192](https://arxiv.org/abs/2510.07192).
  (Security/data angle: [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).)

## State of research

**Best-performing now:** Classifier cascades with full-context probes (Constitutional
Classifiers) are the strongest deployed jailbreak defense, and they're cheap enough to run
in production. Abstention-trained models meaningfully cut hallucination.

**Promising but unproven:** Robust agentic guardrails. Current defenses are tuned for
chat; extending them to tool-using, privileged agents is early.

**Open problems & weaknesses:** **Agentic guardrails lag chat guardrails badly** —
AgentHarm shows agents comply with harmful requests at high rates. Universal jailbreaks
still transfer. Defenses are largely empirical cat-and-mouse with no robustness guarantees.
The poisoning result shows the *training-data* attack surface is wider and cheaper than
assumed. Hallucination is reduced, not solved.
