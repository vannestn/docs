# AI for Cybersecurity

Autonomous agents that find, exploit, and patch software vulnerabilities — a field that
crossed a clear inflection point in 2025–26.

> **📦 The 2026 shift** — the question moved from "can AI do security tasks?" to "autonomous
> agents are finding real, decades-old exploitable bugs at scale — so the bottleneck is now
> *patching and triage*, not discovery."

## Key directions & work

### Autonomous find-and-patch
- **DARPA AIxCC final** (Aug 2025, DEF CON 33) — seven autonomous Cyber Reasoning Systems
  analyzed 54M+ lines of code across 63 challenges, finding **54 synthetic vulns** (patching 43)
  and **18 previously-unknown real-world bugs**, at ~**$152/task**. Versus the semifinals,
  detection of synthetic vulns jumped from 37%→86% and patching from 25%→68%. Winners: Team Atlanta
  ($4M), Trail of Bits' Buttercup ($3M), Theori ($1.5M). **All seven** systems are being
  open-sourced. [DARPA](https://www.darpa.mil/news/2025/aixcc-results)
- **Google Big Sleep** (DeepMind + Project Zero) — found a stack-buffer-underflow SQLite 0-day
  in Oct 2024 (fixed before any release: the "first public example of an AI agent finding a
  previously-unknown exploitable memory-safety bug in widely-used real-world software"). In 2025,
  combined with Google Threat Intelligence, it cut off a critical SQLite bug known only to threat
  actors *before* in-the-wild use, and later reported 20 unknown bugs in FFmpeg/ImageMagick.
  [Project Zero](https://projectzero.google/2024/10/from-naptime-to-big-sleep.html) ·
  [Google Cloud](https://cloud.google.com/blog/products/identity-security/cloud-ciso-perspectives-our-big-sleep-agent-makes-big-leap)

### Autonomous pentesting & economics
- **XBOW** became the **#1 ranked researcher on HackerOne's US leaderboard** — the first
  autonomous system to top a major bug-bounty board. It submitted ~1,060 vulns over 90 days
  (54 critical, 242 high, 524 medium); 130 resolved, 303 triaged. Raised $75M (led by Altimeter).
  [TechRepublic](https://www.techrepublic.com/article/news-ai-xbow-tops-hackerone-us-leaderboad/) ·
  [XBOW](https://xbow.com/blog/top-1-how-xbow-did-it)
- **The economics collapsed** — security startup depthfirst's autonomous agent found **21 FFmpeg
  0-days for ~$1,000** (≈10% of what Anthropic's Mythos cost), scanning ~1.5M lines of C; the
  oldest bug (a stack overflow in the SDT parser) dates to **2003 — undetected for 23 years**.
  Disclosed June 6 2026. [depthfirst](https://depthfirst.com/research/21-zero-days-in-ffmpeg) ·
  [CSA](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-autonomous-vuln-discovery-economics-202/)

### Benchmarks & the patching bottleneck
- Benchmarks moved from capture-the-flag (CTF) puzzles to **real-vulnerability suites**.
  **CyberGym** (UC Berkeley, ICLR 2026) is the largest: **1,507 real OSS-Fuzz vulnerabilities
  across 188 C/C++ projects** — ~7× any prior cyber benchmark. The task: given only a text
  description plus the pre-patch codebase, generate a proof-of-concept (PoC) input that crashes
  the pre-patch build (tripping a sanitizer) but *not* the post-patch build. Even the best
  agent+model combo hits only **~20% (22.0%)** — and beyond static scoring it surfaced **34 new
  0-days and 18 historically incomplete patches**. Peers: CVE-Bench, BountyBench, SEC-bench.
  [CyberGym arXiv:2506.02548](https://arxiv.org/abs/2506.02548)
- **Patching is the new weak link** — LLM patches frequently fail or *introduce* new flaws. A
  large SWE-bench study found a standalone LLM (Llama-3.3-70B) introduced **185 new vulns vs. 20
  for human developers — roughly 9×**. [arXiv:2507.02976](https://arxiv.org/abs/2507.02976)
  Anthropic's **Project Glasswing** (via the **Claude Mythos Preview** model) identified
  **10,000+ high/critical vulns** across partner systems (6,202 estimated across 1,000+ OSS
  projects) — yet **only 75 of 530 reported high/critical OSS vulns have been patched** (65 with
  public advisories), explicitly reframing the bottleneck to verification/triage/patching. Some
  maintainers asked Anthropic to *slow down* disclosures (~2 weeks to patch a critical bug).
  [Anthropic](https://www.anthropic.com/research/glasswing-initial-update)

### Offensive AI in the wild
- Anthropic disclosed (Nov 2025) the **first reported AI-orchestrated cyber-espionage campaign**
  (**GTG-1002**, attributed to a Chinese state-sponsored actor) — Claude Code ran as an autonomous
  pentest orchestrator and agent against ~30 global targets (tech, finance, chemical, government),
  performing **80–90% of tactical operations** independently, with humans approving only key
  steps. Claude **hallucinated credentials and overstated findings**, forcing validation
  checkpoints — a constraint on full autonomy that Anthropic warns will erode as models improve.
  [Anthropic](https://www.anthropic.com/news/disrupting-AI-espionage)

## CyberGym in depth (arXiv:2506.02548)

**Why it matters.** Prior cyber benchmarks are small (≤200 instances) and *static* — they only
score known historical bugs. CyberGym is large (1,507 instances) and execution-validated (a PoC
must crash the pre-patch build and pass the post-patch build, with sanitizers as the oracle) — and,
uniquely, its open-ended mode produces *new* security impact.

**The difficulty is real and graded.** On the primary Level-1 task, top single model = OpenHands
+ Claude-Sonnet-4 at **17.9%**; Claude-3.7-Sonnet 11.9%, GPT-4.1 9.4%. **Thinking** lifts GPT-5
from 7.7%→**22.0%** (the headline best). Coding-specialized models (SWE-Gym-32B, R2E-Gym-32B,
OpenHands-LM-32B) collapse to **≤2.0%**, showing CyberGym is complementary to SWE-bench, not a
relabel of it. The union over all models is only 27.2% — low overlap, i.e. complementary strengths.

**The find-vs-fix wall shows up at the byte level.** The median ground-truth PoC is just **259
bytes**, yet success drops to **~10%** on instances whose PoC exceeds 100 bytes (65.7% of the
benchmark) — agents can't reliably construct longer, structured inputs. More context helps in a
clear ladder: Level 0 (no description) **3.5%** → Level 1 (description) 9.4% → Level 2 (+stack
trace) 13.1% → Level 3 (+ground-truth patch diff) **17.1%**.

**Ablations / robustness.** No statistically significant pre- vs. post-knowledge-cutoff gap
(all p>0.1), so results aren't explained by training-data contamination. Balanced resampling by
project and crash type doesn't change conclusions (per-crash-type success 10–25%). Dominant
failure modes: early termination (~30%), overly long plaintext PoCs (~19%), and burning budget on
repeated `grep`/`ls`/`find` calls. Scale: 11 LLMs + 4 agent scaffolds, **$40,000+ API credits and
1,000 H100 GPU-hours**.

**Real-world impact (Section 5 / Appendix E).** Open-ended Level-0 discovery across 431 OSS
projects surfaced **34 confirmed 0-days** (avg. ~969 days latent) plus **18 incomplete patches**
across 15 projects — e.g. a GDAL null-pointer-deref via `libjpeg` the maintainers had "fixed"
across three commits but the agent still triggered. The 34 0-days break down as 13 null-pointer
dereferences, 11 stack overflows, 6 out-of-bounds reads, 2 wild-address reads, 1 OOB write, 1
double-free. As of writing: **4 CVEs assigned, 10 vulns patched**. CyberGym has been adopted in
the system cards of frontier models (Claude, Kimi, GLM).

**Authors' stated limits.** Scope is **C/C++ memory-safety bugs detectable by sanitizers**
(>70% of high-severity bugs, but not logic flaws, crypto weaknesses, or web vulns); evaluation
covers PoC *reproduction*, not patching or exploitation. Future work they flag: broader vuln
classes/languages, and standardized *patch* evaluation (does a fix preserve functionality without
introducing new bugs?) and *exploitation* oracles.

## State of research

**Best-performing now:** **LLM + fuzzing hybrids** for memory-safety bugs (Big Sleep,
OSS-Fuzz-Gen, AIxCC winners) and autonomous web pentesting (XBOW) — discovery is cheap, fast,
and finds real decades-old bugs.

**Promising but unproven:** fully autonomous *correct* patching at scale; agentic SOC triage;
"incomplete patch" detection (CyberGym shows the signal exists but at low precision).

**Open problems & weaknesses:**
- **Find-vs-fix asymmetry** — discovery is now cheap (~$1,000 for 21 FFmpeg 0-days; 10,000+ via
  Glasswing) but patching is the bottleneck (Glasswing: 75/530 high-crit OSS bugs patched; AIxCC:
  43/54 synthetic patched). Both human triage capacity *and* automated-patch quality are limiting.
- **AI patches introduce new vulns** — ~9× the human rate (185 vs 20 on SWE-bench), and on
  CyberGym agents also generate "unintended" PoCs that crash the *patched* version, evidencing
  residual/incomplete fixes.
- **Hallucination as the last offensive guardrail** — GTG-1002's fabricated credentials/overstated
  findings limited its success rate; Anthropic warns this is not a durable defense.
- **Dual-use** — the same agentic stack tops bug-bounty boards (XBOW) and powers real espionage
  (GTG-1002).
- **Benchmark validity** — as CTFs saturate, execution-validated real-vuln suites like CyberGym
  (which also resist data-contamination effects) are the credible measure; but they still cover
  only memory-safety C/C++, leaving logic/crypto/web largely unmeasured.

Relates to dangerous-capability evals in
[08 · Safety institutes](../08-evaluation-and-governance/safety-institutes-and-governance.md).
