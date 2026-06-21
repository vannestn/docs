# Business Models

The distinct ways organizations try to turn AI research into a sustainable business — each
of which pulls research in a different direction.

## The main models

| Model | How it makes money | Who | Research pull |
|-------|--------------------|-----|---------------|
| **Frontier API** | Sell access to the best closed models | OpenAI, Anthropic, Google | Reasoning, agents, multimodal, safety |
| **Open-weight** | Give away weights; monetize cloud/enterprise/goodwill | Meta, DeepSeek, Qwen, Mistral, Ai2 | Efficiency, accessibility, ecosystem |
| **Inference / infrastructure** | Sell fast/cheap serving or chips | NVIDIA, Groq, Cerebras, Together, Fireworks | Quantization, serving, hardware |
| **Agents-as-product** | Sell autonomous task completion (coding, research) | Cursor, Cognition, Manus, many | Long-horizon agents, tool use, memory |
| **AI-for-science "labs"** | Create IP/value directly (drugs, materials) | Isomorphic, Periodic, Lila, EvolutionaryScale | Domain foundation models, autonomous labs |
| **World models / media** | Sell generation/simulation (video, 3D, audio) | World Labs, Runway, Black Forest, Suno | World models, generative media |
| **Interpretability-as-a-service** | Sell understanding/control tooling | Goodfire | Mechanistic interpretability |
| **Data / RL-environment foundry** | Sell training data, expert labor, and RL environments to the labs | Surge, Mercor, Scale, Turing, Handshake, Invisible, Mechanize, Prime Intellect | Agentic RL, evals, verifiable rewards |
| **Decentralized / open collective** | Community + token/donation funded | EleutherAI, Nous, Prime Intellect | Open data, decentralized training |

## Key tensions

> **📦 The core tension** — *shipping products* (which funds the lab) vs. *doing careful
> research/safety* (which the missions promise). Every frontier lab lives this conflict;
> independent scorecards find safety commitments lagging capability (see
> [08 · Governance](../08-evaluation-and-governance/safety-institutes-and-governance.md)).

- **Open vs. closed** is partly a business-model choice: open-weight labs trade direct API
  revenue for ecosystem leverage and (for Chinese labs) a way to compete despite compute
  constraints.
- **"Lab" vs. "product company"** — the AI-for-science labs (Isomorphic, Periodic, Lila) bet
  that *owning the discoveries* beats selling model access.
- **Focused capability vs. platform** — a single-capability startup (audio, video, interp)
  must show it's a durable business, not a feature a frontier lab absorbs.

## The data / RL-environment foundry — picks-and-shovels for the agentic-RL boom

As training shifts from pre-training on scraped text to **agentic RL on verifiable tasks**, the
scarce input is no longer raw tokens but *expert-graded tasks, rubrics, and executable
environments* ("RL gyms") in which an agent can act and be scored (the technique:
[15 · Building agents & RL environments](../15-research-methods-and-how-systems-are-built/building-agents-and-rl-environments.md)).
A new vendor layer sells exactly this to the frontier labs — and it is the fastest-growing
business model on this page.

- **Demand side — labs are spending at scale.** Anthropic leadership reportedly discussed
  spending **>$1B on RL environments** over the following year
  ([TechCrunch, Sept 2025](https://techcrunch.com/2025/09/21/silicon-valley-bets-big-on-environments-to-train-ai-agents/), citing The Information).
  SemiAnalysis reports contract sizes of **six-to-seven figures per quarter**, per-task costs
  of **~$200–$2,000**, and "UI gym" website replicas at ~$20k each (a Slack-grade replica ~$300k)
  ([SemiAnalysis](https://newsletter.semianalysis.com/p/scaling-reinforcement-learning-environments-reward-hacking-agents-scaling-data)).
- **Surge AI** — crossed **~$1B+ ARR (~$1.2B revenue in 2024)** *bootstrapped, with no outside capital*,
  reportedly in talks to raise ~$1B at a **~$25B valuation**
  ([Bloomberg](https://www.bloomberg.com/news/articles/2025-07-30/scale-rival-surge-ai-in-talks-for-funding-at-25-billion-value)).
  Stood up an internal org dedicated to building RL environments
  ([TechCrunch](https://techcrunch.com/2025/09/21/silicon-valley-bets-big-on-environments-to-train-ai-agents/)).
- **Mercor** — marketplace connecting labs with domain experts (scientists, doctors, lawyers);
  **~$1.5B ARR by May 2026** (up from ~$760M end-2025), **$10B valuation** on a $350M Series C
  (Oct 2025), paying contractors **>$1.5M/day**
  ([TechCrunch](https://techcrunch.com/2025/10/27/mercor-quintuples-valuation-to-10b-with-350m-series-c/)).
- **Scale AI** — the incumbent, valued at **$29B** after Meta's **$14.3B** investment for a ~49% stake
  (June 2025). Post-deal it **declined**: laid off ~14% of staff and lost work as Google, OpenAI,
  and xAI pulled back over confidentiality/competitive conflict with Meta
  ([TechCrunch](https://techcrunch.com/2025/08/29/cracks-are-forming-in-metas-partnership-with-scale-ai/)) —
  directly fueling rivals' growth.
- **Turing, Handshake, Invisible** — the **$100M+** tier. Turing launched *Turing Frontier* to supply
  elite experts beyond coding (finance, legal, medicine, energy); Handshake's *APEX-Agents* benchmarks
  long-horizon banking/consulting/law tasks; Invisible (~$134M revenue, 2024) supplies RLHF data to
  Anthropic/OpenAI ([TechCrunch](https://techcrunch.com/2025/09/21/silicon-valley-bets-big-on-environments-to-train-ai-agents/)).
  Open-source-leaning entrants like **Prime Intellect** (an "RL environments hub") and **Mechanize**
  (coding gyms, partnered with Anthropic) round out the field.

> **🛠️ Why it's a distinct model** — these firms don't ship a model or an end-user product; they sell
> the *training substrate*. The open question is whether labs keep outsourcing environment-building
> or pull it in-house (Surge/Scale already build internally), and whether one player becomes
> "the Scale AI for environments."

## State of the dynamic

**Proven:** Frontier-API and inference/infrastructure are clearly profitable engines
(NVIDIA's results; frontier-lab revenue growth). Open-weight as ecosystem strategy works.
The data / RL-environment foundry is now a real revenue engine too — Surge and Mercor each
cleared **$1B+ ARR** selling training substrate to the labs.

**Promising but unproven:** Agents-as-product (monetizing autonomy reliably), AI-for-science
labs (the drugs/materials haven't reached market yet), and interpretability-as-a-service.

**Risks & weaknesses:** Many focused models risk being commoditized or absorbed by frontier
labs. The science labs are capital-intensive with long payback. Decentralized/open collectives
struggle to fund frontier-scale compute without a closed-product business. The data /
RL-environment foundry depends on a handful of lab customers and faces in-housing risk — Scale
AI's post-Meta decline shows how fast a single customer relationship can reshape the layer.
