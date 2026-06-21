# AI for Cybersecurity

Autonomous agents that find, exploit, and patch software vulnerabilities — a field that
crossed a clear inflection point in 2025–26.

> **📦 The 2026 shift** — the question moved from "can AI do security tasks?" to "autonomous
> agents are finding real, decades-old exploitable bugs at scale — and the bottleneck is now
> *patching/triage*, not discovery."

## Key directions & work

### Autonomous find-and-patch
- **DARPA AIxCC final** (Aug 2025) — seven autonomous Cyber Reasoning Systems found 54/63
  synthetic vulns and **18 real 0-days**, producing real patches; 4 of 7 systems open-sourced.
  Winning architectures combined **LLMs with traditional fuzzing**. [DARPA](https://www.darpa.mil/news/2025/aixcc-results)
- **Google Big Sleep** (DeepMind + Project Zero) — found a critical SQLite 0-day and cut it off
  *before* in-the-wild exploitation; later reported 20 unknown vulns in FFmpeg/ImageMagick. [Google](https://blog.google/innovation-and-ai/technology/safety-security/cybersecurity-updates-summer-2025/)

### Autonomous pentesting & economics
- **XBOW** became the **#1 ranked researcher on HackerOne's US leaderboard** — the first
  autonomous system to top a major bug-bounty board. [Dark Reading](https://www.darkreading.com/vulnerabilities-threats/ai-based-pen-tester-top-bug-hunter-hackerone)
- **The economics collapsed** — an autonomous agent found 21 FFmpeg 0-days (incl. a ~23-year-old
  bug) for ~$1,000 in compute. [CSA](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-autonomous-vuln-discovery-economics-202/)

### Benchmarks & the patching bottleneck
- Benchmarks moved from CTFs to **real-vulnerability suites** — CyberGym (1,507 tasks, surfaced
  35 new 0-days), CVE-Bench, BountyBench. [CyberGym arXiv:2506.02548](https://arxiv.org/abs/2506.02548)
- **Patching is the new weak link** — LLM security patches frequently fail or *introduce* new
  flaws (one study: ~9× the human rate). Anthropic's Project Glasswing found 10,000+ 0-days but
  only ~97 patches landed upstream — explicitly reframing the bottleneck to verification/patching.

### Offensive AI in the wild
- Anthropic disclosed (Nov 2025) the **first largely-autonomous AI cyber-espionage campaign**
  (~80–90% AI-performed), though hallucinated credentials still block full autonomy. [Anthropic](https://www.anthropic.com/news/disrupting-AI-espionage)

## State of research

**Best-performing now:** **LLM + fuzzing hybrids** for memory-safety bugs (Big Sleep,
OSS-Fuzz-Gen, AIxCC winners) and autonomous web pentesting (XBOW) — discovery is cheap, fast,
and finds real decades-old bugs.

**Promising but unproven:** fully autonomous *correct* patching at scale; agentic SOC triage;
"incomplete patch" detection.

**Open problems & weaknesses:** the **find-vs-fix asymmetry** (10,000 found vs ~97 patched);
AI patches introducing new vulns (~9× human rate); hallucinated results blocking full offensive
autonomy; **dual-use** (the same agents top bug-bounty boards and power real espionage); and
benchmark validity as CTFs saturate. Relates to dangerous-capability evals in
[08 · Safety institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md).
