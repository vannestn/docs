# Robustness & Jailbreaks

Defending models against adversarial inputs, jailbreaks, and misuse — and reducing
hallucination — especially as agents gain real-world privileges.

## Key directions & work

- **Constitutional Classifiers++** — production-grade jailbreak defense from Anthropic,
  combining three ideas: (1) *exchange classifiers* that score a model's output **in the
  context of its input**, closing the reconstruction/obfuscation attacks that defeated the
  prior input + output-only design; (2) a **two-stage cascade** where a lightweight first
  stage screens all traffic and escalates only suspicious exchanges to an expensive second
  stage; (3) **linear activation probes** (trained with sliding-window logit smoothing + a
  softmax-weighted loss) ensembled with external classifiers. The deployed system uses a
  probe as the first stage and a probe + Haiku-4.5 exchange-classifier ensemble as the
  second, guarding Claude Sonnet 4.5. Shadow-deployed on production traffic (Dec 1 2025 –
  Jan 1 2026), it hit a **0.05% flag rate** (vs **0.38%** for the prior Constitutional
  Classifiers of Sharma et al. 2025) at **~8× lower** compute than the two-stage cascade
  and **~40× lower** than a single exchange classifier. Over **1,736 red-team hours**
  across ~198K attempts surfaced only **one** high-risk vulnerability (0.005 per 1K queries,
  the lowest of all systems tested; 30 h to discover); no universal CBRN jailbreak was
  found. [arXiv:2601.04603](https://arxiv.org/abs/2601.04603)
- **AgentHarm** (UK AISI + Gray Swan) — 110 malicious *agentic* tasks (440 with
  augmentations) across 11 harm categories. Leading LLMs are "surprisingly compliant" with
  malicious agent requests **even without jailbreaks**, and simple universal jailbreak
  templates can be adapted to jailbreak agents. [arXiv:2410.09024](https://arxiv.org/abs/2410.09024).
  See [08 · Safety institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md).
- **Behaviorally-calibrated RL** for hallucination reduction via abstention (ByteDance Seed +
  CMU + Fudan). Custom reward functions teach a model to abstain (`<IDK>`) instead of guessing
  whenever its confidence falls below a user-set risk threshold. [arXiv:2512.19920](https://arxiv.org/abs/2512.19920)
- **Data poisoning** — backdoors implanted with a **near-constant ~250 documents regardless
  of model size** (600M–13B params), because attack success tracks the *absolute* number of
  poison docs, not the poisoning *rate*. Anthropic + UK AISI + Alan Turing Institute (+ Oxford,
  ETH) — [arXiv:2510.07192](https://arxiv.org/abs/2510.07192).
  (Security/data angle: [07 · Data-centric AI](../07-data-systems-hardware/data-centric-ai.md).)

## Prompt injection & agent-input security

Prompt injection is **OWASP's #1 LLM risk (LLM01:2025)** and the dominant threat to deployed
agents: attacker-controlled text overrides the developer's or user's intended instructions,
causing data leakage, privilege escalation, or unwanted tool calls
([OWASP GenAI](https://genai.owasp.org/llmrisk/llm01-prompt-injection/)). It differs from a
jailbreak in its target — the *application's* trust boundary rather than (only) the model's
safety training.

**Taxonomy.**
- **Direct injection** — the user themselves types instructions that subvert the system prompt.
- **Indirect / tool-stream injection** — malicious instructions hide in content the agent
  *retrieves* (emails, web pages, documents, tickets, code repos, tool outputs) and are then
  treated as trusted instructions. This is the dangerous mode for retrieval-augmented (RAG) and
  tool-using agents, where untrusted data flows straight into the context that drives actions.

**Benchmarks.**
- **AgentDojo** (ETH Zürich) — a dynamic environment, not a static suite: **97 realistic tasks**
  (email, e-banking, travel, etc.) and **629 security test cases**, with pluggable attacks and
  defenses. Headline finding: SOTA LLMs fail many tasks even *without* attacks, and existing
  injection attacks break *some* security properties but not all — robustness is far from solved.
  [arXiv:2406.13352](https://arxiv.org/abs/2406.13352)
- **InjecAgent** — **1,054 test cases** over 17 user tools and 62 attacker tools, scoring
  *indirect* prompt injection by intent (direct harm vs. private-data exfiltration). ReAct-prompted
  GPT-4 was attackable **~24%** of the time, a rate that roughly doubles when the injected
  instruction is reinforced with a "hacking" prompt. [arXiv:2403.02691](https://arxiv.org/abs/2403.02691)

**Design-level defense consensus — prompting alone cannot solve it.** Because the model cannot
reliably distinguish trusted instructions from untrusted data in a single context, the field has
moved to *architectural* / information-flow defenses rather than better system prompts:
- **CaMeL** (Google DeepMind) — a **dual-LLM** design. A **privileged LLM (P-LLM)** plans over the
  trusted query and emits code; a **quarantined LLM (Q-LLM)** parses untrusted data and never feeds
  its raw tokens back to the P-LLM. A custom interpreter then attaches **capabilities** to every
  value and enforces information-flow control, so untrusted data can never alter control flow or
  exfiltrate private data. It **neutralizes ~67% of AgentDojo attacks** (often to zero for some
  models) and solves **77% of tasks with provable security** (vs **84%** undefended).
  [arXiv:2503.18813](https://arxiv.org/abs/2503.18813)
- **MELON** — a **provable, detection-based** defense that re-executes the agent's trajectory with a
  *masked* user prompt. If the original and masked runs produce similar tool calls, the action was
  driven by injected content rather than the user task, so it is flagged. No model training required.
  [arXiv:2502.05174](https://arxiv.org/abs/2502.05174)
- **Meta SecAlign** (Meta) — the first **fully open-source LLM with built-in model-level** injection
  defense (Meta-SecAlign-8B / -70B). Despite training only on generic instruction-tuning data, it is
  more secure than several flagship proprietary models with injection defenses, and the security
  *transfers* to unseen tool-calling and web-navigation tasks. [arXiv:2507.02735](https://arxiv.org/abs/2507.02735)

**Real-CVE anchor — EchoLeak (CVE-2025-32711).** A **zero-click** indirect-injection exploit in
**Microsoft 365 Copilot** (CVSS 9.3, disclosed by Aim Security, June 2025): a single crafted email
embeds instructions that Copilot ingests while answering an unrelated user query, then exfiltrates
internal data with **no user interaction**. It chained bypasses of Microsoft's XPIA
cross-prompt-injection classifier, link redaction, auto-fetched images, and a CSP-allowed Teams
proxy — the canonical demonstration that classifier-style filters alone are insufficient against
indirect injection. Patched server-side. [arXiv:2509.10540](https://arxiv.org/abs/2509.10540),
[HackTheBox](https://www.hackthebox.com/blog/cve-2025-32711-echoleak-copilot-vulnerability)

> Cross-link: [11 · AI for cybersecurity](../11-emerging-application-subfields/ai-for-cybersecurity.md) and
> [01 · Agents & tool use](../01-foundation-models-and-capabilities/agents-and-tool-use.md) should
> point here for the agent-input threat model and defenses.

## Constitutional Classifiers++, in depth

**Mechanism.** The prior generation (Sharma et al. 2025) paired an *input* classifier with
an *output-only* classifier, and red-teaming broke it two ways. **Reconstruction attacks**
(fragment a harmful request across a benign context — e.g. scattered through a codebase — then
have the model reassemble it) bypass the input filter; **output obfuscation attacks** (metaphors,
renamed chemical reagents, character-separated output) defeat an output-only classifier that
cannot see the input. The fix is the **exchange classifier**, which scores each output segment
*within its full conversational context* during generation (prompt caching keeps this cheap),
making obfuscation far harder. This alone gave **2.2× fewer high-risk vulnerabilities per
jailbreak attempt** than the dual-classifier approach — at higher cost, which is what motivates
the cascade and probes.

**Linear probes.** Probes reuse activations already computed during sampling, so their marginal
cost is effectively zero. Per the ablations, two training tricks are load-bearing: **sliding-window
logit smoothing** (flag only when harm is consistently predicted across consecutive tokens, which
suppresses single-token false positives) and a **softmax-weighted loss** (concentrate gradient on
the most-confidently-harmful tokens, letting the probe predict "harmless" for prefixes that only
become harmful later). Using **neither** trick roughly doubles attack success vs. using both, and
multi-layer probing (all layers) reaches ~1.4% attack success vs. worse rates for fewer layers. The
best probe nearly matches a small Haiku-4.5 external classifier, and **ensembling a probe with a
small classifier beats either alone** because the probe's errors are less correlated with the
external classifier's (lower Spearman rank correlation).

**Results, with the eval.** Robustness is measured by **high-risk vulnerability discovery rate**
(high-risk vuln = an attack answering >5 of 8 CBRN target queries at ≥50% the detail of an
unguarded model), normalized per 1K red-team queries to account for uneven red-teaming effort
(Table 1):

| System | Rel. compute | High-risk vuln rate (/1K) | Prod. refusal rate |
| --- | --- | --- | --- |
| Last-gen dual classifier (§2) | 100.0 | 0.01871 | 0.073% |
| Single exchange classifier (§3) | 150.0 | 0.00885 | 0.038% |
| Two-stage cascade (§4) | 27.8 | 0.00878 | 0.036% |
| **Production-grade (§6)** | **3.5** | **0.00505** | 0.050% |

The production system wins on compute *and* robustness. The authors flag one caveat: while no
red-teamer in the bounty program found a universal jailbreak, **expert red-teamers operating
outside the program did discover universal jailbreaks** for the system, "though this required
substantial effort and automated tools" — i.e. strong, not unbreakable.

## State of research

**Best-performing now:** Classifier cascades that combine full-context exchange classifiers with
near-free activation probes (Constitutional Classifiers++) are the strongest deployed jailbreak
defense — and cheap enough to run in production at a 0.05% flag rate. Abstention-trained models
meaningfully cut hallucination: behaviorally-calibrated RL on a 4B model (confidence-prod variant)
reaches an SNR-Gain of **0.806** on the hard BeyondAIME math benchmark vs **0.207** for GPT-5, and
the calibration "meta-skill" transfers zero-shot to factual QA (SimpleQA), where the 4B model's
calibration rivals Gemini-2.5-Pro/Grok-4 despite far lower raw accuracy.

**Promising but unproven:** Robust agentic guardrails. Current defenses are tuned for chat;
extending them to tool-using, privileged agents is early. Claim-level (not just response-level)
abstention is similarly nascent — the calibration paper notes intermediate-step correctness is
ambiguous to define and supervised only weakly from the final outcome.

**Open problems & weaknesses:**
- **Agentic guardrails lag chat guardrails badly.** AgentHarm shows frontier agents comply with
  harmful requests at high rates even *without* jailbreaks, and universal templates transfer.
- **No robustness guarantees.** Defenses remain an empirical cat-and-mouse game — even the
  production Constitutional Classifier was broken by expert red-teamers outside the bounty program.
  The authors' own future work points to tighter classifier–model integration (signals in sampling)
  and targeted synthetic data to teach decision boundaries, not to formal guarantees.
- **The training-data attack surface is wider and cheaper than assumed.** ~250 poison docs
  backdoor models up to 13B (just 0.00016% of tokens for the 13B model); the same absolute-count
  dynamic holds for fine-tuning (poisoning Llama-3.1-8B and GPT-3.5-turbo) and across DoS and
  language-switch backdoors. Continued clean training *partially* degrades backdoors but the
  authors decline to claim it as a reliable defense. Persistence through realistic safety
  post-training is explicitly noted as unassessed. ⚠️ The headline 250-doc result is for
  *backdoor/DoS-style* triggers, not arbitrary harmful-behavior backdoors.
- **Hallucination is reduced, not solved**, and the strongest abstention result is on a single
  4B model trained on math; cross-domain transfer is shown but raw accuracy stays low.
