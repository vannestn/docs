# Sweep 03 — AI Security Research (Defensive) as a Solo-Viable Field

*Scope: prompt injection & agent-input security, jailbreak science, agentic-security benchmarks, model supply-chain security (backdoors/poisoning detection), MCP/tool-ecosystem audits, AI bug bounties & coordinated disclosure. Defensive / authorized framing throughout — the goal is to help builders and defenders, and every attack technique named below exists in published, disclosed work.*

*Method note: sources I opened in full (WebFetch) are marked **[opened]**; sources summarized from search-result snippets that quote the underlying page are marked **[snippet]**. Anything I could not confirm is flagged **⚠️ unverified**.*

---

## The shape of this space — what the work actually consists of

AI security (defensive) is where classical security methodology (threat modeling, red teaming, fuzzing, coordinated disclosure, CVEs) collides with ML behavior that has no clean trust boundary between "data" and "instructions." The unifying problem, named by Simon Willison in 2022, is **prompt injection**: an LLM follows instructions found in the content it processes, not just instructions from its operator ([lethal-trifecta post, **opened**](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/)). The field is unusually welcoming to solo/independent work because many landmark findings are *demonstrations* — a reproducible exploit against a real product — rather than large-compute results.

The main sub-areas:

- **Prompt injection & agent-input security.** Direct injection (user tricks the model) vs. **indirect** injection (attacker plants instructions in email/web/docs/RAG that the agent later ingests). The canonical framing is Willison's **lethal trifecta**: an agent with (1) access to private data, (2) exposure to untrusted content, and (3) an external communication channel can be turned into a data-exfiltration tool with no exploit code ([**opened**](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/)). Meta's **"Agents Rule of Two"** (Oct 2025) reframes this as a design constraint — allow at most two of {untrusted input, sensitive access, state-change/communication} per session ([Meta AI blog, **snippet**](https://ai.meta.com/blog/practical-ai-agent-security/); [Willison writeup, **snippet**](https://simonwillison.net/2025/Nov/2/new-prompt-injection-papers/)).
- **Jailbreak science.** Systematic study of how safety-aligned models are bypassed, and — critically — of *how to evaluate defenses honestly*. The recurring lesson is that **adaptive attacks** (attacker iterates against the specific defense) break defenses that looked strong under static evaluation. This is the direct analogue of Carlini's decade-old lesson from adversarial-example evaluation.
- **Agentic-security benchmarks.** Environments that jointly measure *utility and security* of tool-using agents under injection (AgentDojo, ASB, WASP, MCP-focused suites). This is the sub-area closest to the researcher's evaluation background.
- **Model supply-chain security.** Malicious model artifacts (pickle/GGUF RCE), and **data/model poisoning + backdoors** — plus detection/scanning. Anthropic's 2025 poisoning result (below) reset the threat model here.
- **MCP / tool-ecosystem security audits.** The Model Context Protocol exploded in 2025; its trust model (clients accept server-supplied tool descriptions) created a whole new attack surface (tool poisoning, rug pulls, tool shadowing, "toxic flows").
- **AI bug bounties & coordinated disclosure.** How AI-specific flaws (jailbreaks, agent hijacks) get reported, paid, patched, and (often not) publicly disclosed with CVEs.

---

## Who does this work

### Companies / commercial labs with public research output
- **Invariant Labs** (Zurich) — now the research division of **Snyk** (acquired 2025) ([blog, **snippet**](https://invariantlabs.ai/blog/mcp-github-vulnerability)). Small, high-output team. Coined the **Tool Poisoning Attack** paradigm for MCP, demonstrated the **GitHub MCP** private-repo exfiltration via a malicious Issue, and ships the open-source **mcp-scan** auditor (now under Snyk's `agent-scan`) ([mcp-scan docs, **snippet**](https://invariantlabs-ai.github.io/docs/mcp-scan/)). Funded as a company/acquired startup. Hires security researchers; publishes reproducible PoCs.
- **Gray Swan AI** — company running the **Gray Swan Arena**, a recurring public jailbreak/agent-red-teaming competition with real cash bounties ($171,800 paid across events cited) ([Arena, **snippet**](https://app.grayswan.ai/arena)). Notably has **hired/contracted 14+ Arena winners** — an explicit competition-to-career pipeline for independents. Company-funded; open worldwide entry.
- **Meta AI** — open-sourced **LlamaFirewall** (PromptGuard 2 classifier + Agent Alignment Checks + CodeShield) and published the "Agents Rule of Two" design guidance. Company-funded; artifacts on GitHub/HF ([arXiv 2505.03574, **snippet**](https://arxiv.org/abs/2505.03574)).
- **Google DeepMind** (+ ETH Zurich) — **CaMeL** ("Defeating Prompt Injections by Design"), a control-/data-flow approach that treats the LLM as untrusted and enforces capabilities in a Python-like interpreter; neutralizes ~67% of AgentDojo attacks ([GitHub, **snippet**](https://github.com/google-research/camel-prompt-injection); [Willison analysis, **snippet**](https://simonwillison.net/2025/Apr/11/camel/)).
- **NVIDIA** — homes **garak**, the leading open-source LLM vulnerability scanner (50+ probe modules; Apache 2.0). Originally a *solo sabbatical project* by Prof. Leon Derczynski (ITU Copenhagen), released June 2023, adopted by NVIDIA Nov 2024 ([Wikipedia, **snippet**](https://en.wikipedia.org/wiki/Garak_(software)); [arXiv 2406.11036, **snippet**](https://arxiv.org/abs/2406.11036)). A clean template for "independent tool → industrial adoption."
- **Anthropic / OpenAI** (frontier-lab red teams + programs). Anthropic runs a public **HackerOne bug bounty** (Model Safety track = universal jailbreaks vs. Constitutional Classifiers in CBRN/cyber; Product Security track incl. Claude Code sandbox escapes; payouts up to ~$15k cited) ([HackerOne, **snippet**](https://hackerone.com/anthropic)) and a distinct **Coordinated Vulnerability Disclosure** policy for *Claude-discovered* vulns (90-day standard, 7-day for active exploitation) ([**opened**](https://www.anthropic.com/coordinated-vulnerability-disclosure)). OpenAI runs a coordinated disclosure policy + bounty ([policy, **snippet**](https://openai.com/policies/coordinated-vulnerability-disclosure-policy/)).

### Government / institutional
- **UK AI Security Institute (AISI)** — government body with an in-house Red Team that stress-tests misuse safeguards, unlearning/data-filtering, and studies data/model poisoning and prompt injection as "third-party attacks" ([research agenda, **snippet**](https://www.aisi.gov.uk/research-agenda)). Runs an external **Alignment Project** and hires via routes including a **MATS stream** ("UKAISI Red-Team," Summer 2026) — a concrete entry point for outside researchers ([MATS, **snippet**](https://www.matsprogram.org/stream/ukaisi-red-team-10)). Government-funded.
- **US CAISI** (NIST Center for AI Standards and Innovation) — co-organized the large-scale agent red-teaming competition with Gray Swan + UK AISI and published findings ([NIST blog, **opened**](https://www.nist.gov/blogs/caisi-research-blog/insights-ai-agent-security-large-scale-red-teaming-competition)). Government-funded.
- **The Alan Turing Institute** — co-author on Anthropic/AISI poisoning work ([Anthropic research, **snippet**](https://www.anthropic.com/research/small-samples-poison)). Academic/nonprofit.

### Academic groups
- **ETH Zurich SPY Lab** (Florian Tramèr's group) — builders of **AgentDojo**; recurring contributors to adaptive-attack evaluation. Academic ([GitHub, **snippet**](https://github.com/ethz-spylab/agentdojo)). Takes PhD students/interns.
- **OWASP GenAI Security Project** — community/nonprofit; maintains the **LLM Top 10** (prompt injection = LLM01, #1 three years running) and an **MCP Top 10**. Open contribution model; a low-friction way for independents to get cited ([OWASP LLM01, **snippet**](https://genai.owasp.org/llmrisk/llm01-prompt-injection/)).

### Nonprofits / independents (the field's distinctive tradition)
- **Palisade Research** — nonprofit studying offensive AI capabilities (automated hacking, honeypots processing 1.7M+ interactions, shutdown-resistance demos) to inform defense/policy ([about, **snippet**](https://palisaderesearch.org/about)). Grant/donation-funded; hires via 80,000 Hours board.
- **Johann Rehberger** (embracethered.com) — the archetypal independent. Solo disclosures of ChatGPT memory persistence ("SpAIware"), data-exfiltration channels, and agent C2, responsibly reported through vendor programs ([research, **snippet**](https://embracethered.com); referenced in [arXiv 2406.00199, **snippet**](https://arxiv.org/abs/2406.00199)).
- **Simon Willison** — independent; coined "prompt injection," maintains the most-cited running taxonomy/commentary (lethal trifecta, CaMeL/Rule-of-Two analyses). Self-funded via blog/open source.
- **Kai Greshake** et al. — the indirect-prompt-injection landmark came from a small independent/academic group (below).

---

## Published exemplars (favoring small-team / solo)

1. **"Not what you've signed up for: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection"** — Greshake, Abdelnabi, Mishra, Endres, Holz, Fritz (AISec '23). [arXiv 2302.12173](https://arxiv.org/abs/2302.12173). Small team; demonstrated live against Bing/GPT-4 Chat and code-completion. **Why it mattered:** created the *indirect* prompt-injection category and its threat taxonomy (data theft, worming, ecosystem contamination) — still the reference definition (OWASP cites it). **[snippet]**

2. **AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents** — Debenedetti, Zhang, Balunović, Beurer-Kellner, Fischer, Tramèr (ETH SPY Lab; NeurIPS 2024). [arXiv 2406.13352](https://arxiv.org/abs/2406.13352). **6 authors.** 97 tasks / 629 security cases; **jointly** scores utility + security; plugin architecture for new attacks/defenses. **Why it mattered:** became the default agent-security benchmark and a NIST-adapted artifact (AgentDojo-Inspect). Directly evaluation-methodology work. **[opened]**

3. **Invariant Labs — "GitHub MCP Exploited: Accessing private repositories via MCP"** (May 2025). [blog](https://invariantlabs.ai/blog/mcp-github-vulnerability). Small team. **Why it mattered:** showed a *fully-trusted* MCP toolchain can still be hijacked by a malicious public GitHub Issue to leak private repos — i.e., the vuln is architectural, not a bad tool. Drove the "toxic flow" framing and vendor responses; no clean fix. **[snippet]**

4. **"A small number of samples can poison LLMs of any size"** — Anthropic Alignment Science + UK AISI + Alan Turing Institute (Oct 2025). [Anthropic research](https://www.anthropic.com/research/small-samples-poison). **Why it mattered:** ~250 poisoned pretraining docs reliably backdoor models from 600M–13B params — attack cost is a near-**constant document count**, not a percentage of data. Reset supply-chain threat modeling; heavily covered. **[snippet]**

5. **"The Attacker Moves Second: Stronger Adaptive Attacks Bypass Defenses Against LLM Jailbreaks and Prompt Injections"** (Oct 2025). [arXiv 2510.09023](https://arxiv.org/abs/2510.09023). Cross-lab (OpenAI/Anthropic/GDM, ~14 authors). **Why it mattered:** search-based adaptive attacks hit >90% ASR against filter defenses (PromptGuard, Model Armor, Protect AI Detector); shows stacking detectors doesn't fix the underlying robustness gap. The methodological check on the whole "guardrail" market. **[snippet]**

6. **CaMeL — "Defeating Prompt Injections by Design"** — Google DeepMind + ETH Zurich (2025). [code](https://github.com/google-research/camel-prompt-injection) · [Willison analysis](https://simonwillison.net/2025/Apr/11/camel/). **Why it mattered:** first widely-credited *principled* (non-model-self-monitoring) defense — treats the LLM as untrusted and enforces control/data-flow capabilities; ~67% of AgentDojo attacks neutralized, with honestly-stated limits (user-defined policies, approval fatigue). **[snippet]**

7. **"Insights into AI Agent Security from a Large-Scale Red-Teaming Competition"** — Gray Swan + UK AISI + NIST CAISI + frontier labs (Mar 2026). [arXiv 2603.15714](https://arxiv.org/pdf/2603.15714) · [NIST blog](https://www.nist.gov/blogs/caisi-research-blog/insights-ai-agent-security-large-scale-red-teaming-competition). **Why it mattered:** 250k+ attempts, 400+ participants, 13 frontier models; **every** model was breached, and "universal" attacks transferred across scenarios/models — evidence of shared instruction-following weaknesses. (Large collaboration, but the *participants* were mostly independents.) **[opened blog]**

8. **garak: A Framework for Security Probing Large Language Models** — Leon Derczynski et al. [arXiv 2406.11036](https://arxiv.org/abs/2406.11036). **Why it mattered:** a solo sabbatical project became the standard open-source LLM vuln scanner and was adopted by NVIDIA — the clearest "independent tool → field infrastructure" path in this space. **[snippet]**

---

## Where the gaps are (grounded in what I read)

- **Detection-based defenses are on borrowed time.** The Attacker-Moves-Second result argues classifier/filter guardrails fail under adaptive attack, and the Rule-of-Two authors explicitly say "*until robustness research allows us to reliably detect and refuse prompt injection*" agents must be architecturally constrained ([Willison, **snippet**](https://simonwillison.net/2025/Nov/2/new-prompt-injection-papers/)). Gap: **honest adaptive-attack evaluation harnesses** and *standardized adaptive-eval protocols* are scarce; most defense papers still report static ASR.
- **Design-level defenses under-evaluated.** CaMeL and Rule-of-Two are promising but early — CaMeL's own limitations (policy authorship, approval fatigue) are unquantified in real deployments. Gap: usability/false-friction studies and coverage beyond AgentDojo's four domains.
- **MCP/tool-ecosystem auditing is immature.** OWASP has an MCP Top 10 and Invariant ships mcp-scan, but there's no broadly-trusted, reproducible audit standard for the exploding MCP server registry; "toxic flow" analysis across composed tools is nascent. Attack classes (rug pulls, tool shadowing) outpace detection tooling.
- **Coordinated disclosure for AI is broken/inconsistent.** Anthropic, Google, and Microsoft reportedly **paid agent-hijack bounties but issued no public advisories or CVEs**, leaving users on old versions unaware ([The Next Web, **snippet**](https://thenextweb.com/news/ai-agents-hijacked-prompt-injection-bug-bounties-no-cve)). Gap: norms/infrastructure for AI-flaw CVEs, versioned advisories, and *what even counts as a "vulnerability"* when the flaw is probabilistic model behavior.
- **Poisoning detection lags the poisoning result.** Anthropic's constant-count finding makes small poisoning sets realistic, but scalable *detection/attribution* of poisoned pretraining docs is largely unsolved and under-published relative to the attack.
- **Supply-chain scanners are rule-based and evadable.** Hugging Face's picklescan uses allow/deny opcode lists; documented bypasses exist, and "safe" formats (GGUF) hide executable Jinja templates that fire at *inference*, invisible to load-time scanners ([JFrog, **snippet**](https://jfrog.com/blog/data-scientists-targeted-by-malicious-hugging-face-ml-models-with-silent-backdoor/)). Gap: behavioral / post-load detection.
- **Benchmark proliferation without consolidation.** Many 2026 agent-security benchmarks appeared (ASB, WASP, MCP-focused suites, plus a "Taxonomy and Consistency Analysis of Safety Benchmarks" arguing they disagree) — a *consistency/meta-evaluation* gap that maps directly onto LLM-as-judge and eval-methodology expertise.

---

## What we still don't know (for OUR ledger)

- **⚠️ Several 2026-dated arXiv IDs surfaced only in search snippets** (e.g., ASB, MCP-SafetyBench, "Taxonomy and Consistency Analysis" 2605.16282, pickle-poisoning 2508.19774). I did **not** open these; treat titles/numbers as unverified until fetched. The exemplars in the section above are the ones I trust most.
- **Team sizes** for Invariant Labs, Palisade, and Gray Swan are inferred as "small" from public footprint, not confirmed headcounts. Verify before citing.
- **Bounty economics unclear.** I confirmed Anthropic's tracks/ceiling from a snippet, not the live scope page; actual payout distributions and acceptance rates for *jailbreak/injection* classes (vs. classic web vulns) are unknown. Worth a direct read of HackerOne stats + OpenAI/xAI/Grok programs.
- **The disclosure-norms story rests largely on one journalistic account** (The Next Web / researcher Aonan Guan). Corroborate with the primary researcher writeup and vendor docs before relying on it.
- **Open question:** does an evaluation-first independent add more marginal value in *adaptive-attack benchmark methodology* (crowded but methodologically weak) or in *MCP audit tooling* (newer, less crowded, more engineering)? This brief can't settle it — needs a hands-on scoping spike.
- **Unverified assumption:** that solo demonstrations still land in 2026 as they did in 2023–2025. The Gray Swan pipeline and independents (Rehberger) suggest yes, but the bar for "novel" is rising fast; test by attempting one reproducible disclosure.

---

## Fit notes (facts only)

The researcher's published work — an **LLM-as-a-judge study on RAG hallucination detection** — sits directly adjacent to agentic-security *evaluation*: AgentDojo-style benchmarks, the "consistency of safety benchmarks" critique, and adaptive-attack harnesses are all evaluation-methodology problems, and judging whether an injection *succeeded* is itself an LLM-judge task. The field's economics match the constraints: landmark results here are frequently reproducible demonstrations (Greshake, Rehberger, Invariant) or open tooling (garak, mcp-scan, AgentDojo) rather than large-compute training runs, and the sub-$500 GPU + frontier-API budget covers most attack/eval reproduction. Entry ramps that take outside contributors exist at multiple funding types — OWASP (open contribution), Gray Swan Arena (competition-to-hire), AISI (MATS stream/Alignment Project), and public bug bounties — spanning nonprofit, company, academic, and government paths. Data-pipeline/classical-ML skills transfer to poisoning-detection and supply-chain-scanner work, where current detection is rule-based and openly acknowledged as evadable.
