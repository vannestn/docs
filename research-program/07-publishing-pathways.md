# Publishing Pathways

*The program's publishing playbook. Implements charter principle #4's twin — [04-topic-selection-process.md](04-topic-selection-process.md) requires that **every pilot ship a public artifact** (Stage 2, rule 3); that doc says an artifact is mandatory, this one says **where and how** to put it. Voice and constraints from [00-goals-and-operating-principles.md](00-goals-and-operating-principles.md): solo, part-time, ≤$500/study, impact-first, three exit paths open.*

> **Current status (2026-07-08):** No pilot has shipped yet (topic-selection Stage 2 not started). This is a reference playbook, written *before* it's needed, so that when a pilot's artifact is ready the publishing route is already decided and the arXiv endorsement lead-time (below) is already in motion. **All facts current as of mid-2026; the arXiv endorsement regime changed on 2026-01-21 and is the single most important thing here.**

## The publishing philosophy for this program

Three convictions, each of which shapes a concrete choice downstream:

1. **The artifact IS the contribution.** For this program the deliverable is a dataset, a benchmark integrated into a harness, a released tool, or a paper *with* reproducible code — not a PDF alone. The named exemplars below (Willison's `llm`, Teknium's OpenHermes, EleutherAI's harness) built standing on the artifact, with the write-up as documentation, not the reverse.
2. **Visibility is a distribution problem, not a prestige problem.** The common failure is not "my work wasn't good enough for a top venue" — it's "great work nobody saw." The rule of thumb from the solo-builder literature is roughly **30% building / 70% distributing** ([solo-founder playbook](https://lishchuk.com/blog/solo-founder-marketing-playbook-2026.html)). Budget accordingly.
3. **Open-science signals are our cheapest substitute for institutional prestige.** ORCID + versioned repo + DOI-archived code/data + honest limitations measurably raise the perceived credibility of work by unknown authors ([ISC round-up](https://council.science/blog/open-science-round-up-embedding-open-science-incentives-in-research-systems/); [Van Vaerenbergh et al. 2026](https://journals.sagepub.com/doi/10.1177/10946705251338461)). We have no affiliation to trade on; this stack is what we trade on instead.

This aligns with the charter's impact-first stance: we optimize for *being findable and citable by the tools researchers already run*, not for a venue's brand.

## Pathway by artifact type

The decision table. Read the row that matches what a pilot produced. "Preprint route" assumes the arXiv endorsement reality in the next section; "artifact home" is where the *usable* thing lives; "distribution moves" are the first 72 hours after posting.

| Artifact type | Primary venue (credential) | Preprint route | Artifact home | Distribution moves |
|---|---|---|---|---|
| **Empirical paper** (a study with results) | NeurIPS/ICLR/ICML **workshop** first; D&B full paper once fundable | arXiv (cs.CL/cs.LG/cs.AI) via manual endorsement → **Zenodo DOI** if endorsement stalls | GitHub repo (code + exact reproduce command) + Zenodo DOI archive | HF Daily Papers submit (within 14 days of arXiv post) · X thread w/ one strong figure · r/ML if reproducible |
| **Benchmark** (eval task + data) | **NeurIPS Datasets & Benchmarks** track | arXiv → Zenodo fallback | **Integrate into `lm-evaluation-harness`** (YAML task) + HF dataset + a leaderboard Space | HF Daily Papers · X thread · post the one-flag command to run it |
| **Dataset** (corpus, labels) | NeurIPS D&B; or dataset-paper on arXiv | arXiv → Zenodo (versioned DOI) | **HF Hub** with a *complete* dataset card (see §Making artifacts useful) | HF Daily Papers · X · a `load_dataset(...)` copy-paste that works |
| **Tool / library** | No paper needed — the tool + a blog post *is* the standing | Optional arXiv "system" note; Zenodo DOI for citability | **PyPI + GitHub** (five-item code checklist), stable CLI entrypoint | Show HN · X thread w/ a demo GIF · relentless changelog-blogging (Willison model) |
| **Analysis essay** (argument, lit synthesis, methodology critique) | **LessWrong / Alignment Forum** (safety); **Tech Policy Press / The Conversation** (policy); own blog | Zenodo DOI if you want it citable; arXiv only if it's a genuine position paper | Own site (canonical) + cross-post | Post to AF/LW for promotion · X · newsletter-bait (be *cited* by Ahead of AI, not submitted) |

**Cross-cutting rule:** whatever the type, ship the *reproduce artifact* alongside the write-up — code + data + exact prompts/hyperparameters + the one command that regenerates each results-table row. This is the single highest-signal element and it is nearly free once the study is done.

## Preprint mechanics for an independent

### The arXiv endorsement reality (the big one — plan a week of lead time)

On **21 January 2026**, arXiv **eliminated institutional email as a standalone qualifier** for endorsement, citing "an unsustainable increase in non-scientific submissions" (this extended a policy first applied to arXiv Mathematics in December 2025). ([arXiv blog 2026-01-21](https://blog.arxiv.org/2026/01/21/attention-authors-updated-endorsement-policy/); [Math version 2025-12-10](https://blog.arxiv.org/2025/12/10/updated-endorsement-policy-for-arxiv-mathematics/)) *Verified against the blog post directly.*

A first-time submitter (or anyone posting to a *new* category) now qualifies one of two ways ([info.arxiv.org/help/endorsement](https://info.arxiv.org/help/endorsement.html)):

- **Automatic:** institutional email **AND** already a claimed author on an arXiv paper in that endorsement domain. **We qualify for neither half** — no institution, no prior arXiv paper. Plan on the manual path from day one.
- **Manual:** a personal endorsement from an established arXiv author in the same domain.

**Step-by-step manual request** (verified against the endorsement help page):

1. Register **ORCID first** (see below), then start an arXiv submission and pick the category (e.g., `cs.CL`).
2. arXiv generates a **six-character alphanumeric endorsement code** and a shareable link.
3. Find eligible endorsers: open the abstract page of a paper you cite, click **"Which of these authors are endorsers?"** at the bottom; endorser emails appear under "Submission history."
4. Email **one** well-matched author (someone you actually cite, or an advisor-equivalent): reference their specific paper, attach your ORCID + the actual draft PDF, and give the code. **One positive endorsement per category suffices.**
5. Wait. There is no SLA — endorsement can take days to never.

**Endorser eligibility (the contested number):** arXiv deliberately does *not* publish exact per-category thresholds; it only states that a would-be endorser's qualifying papers must have been submitted **between 3 months and 5 years ago**, tuned so "any active scientist … for a few years" can endorse ([mirrorhelp](https://arxiv.org/mirrorhelp/endorsement.html)). Community reports for the **cs.\*** domain cite roughly **3 submissions** to CS categories; some report ~5. ⚠️ **unverified** — treat as "3–5, not officially published." The **econ.GN** (economics domain) threshold I could not verify — ⚠️ **unverified**.

**Failure modes, so we don't trip them:**
- **Cold-emailing at scale is a policy violation.** arXiv forbids mass-emailing potential endorsers or repeat-pestering one person; overdoing it can get you flagged. One well-matched author, one follow-up, done.
- **Category mismatch.** An endorser must be an endorser for *your specific domain* — a `cs.LG` endorser cannot endorse an `econ.GN` submission.
- **Endorsement ≠ acceptance.** Moderators can still reclassify or reject after endorsement.

### No-endorsement alternatives (ranked for us)

- **Zenodo** (CERN-operated, free) — **our guaranteed-DOI fallback.** New upload → answer "No" to "already have a DOI?" → **"Get a DOI now!"** to reserve; it registers on publish. 100 files / 50 GB. Full **DOI versioning**: "New version" mints a new DOI plus a stable concept-DOI that always resolves to latest. ([create-upload](https://help.zenodo.org/docs/deposit/create-new-upload/); [reserve-DOI](https://help.zenodo.org/docs/deposit/describe-records/reserve-doi/); [versioning](https://help.zenodo.org/docs/deposit/manage-versions/)) No endorsement — but also no arXiv-grade scholarly discovery.
- **SSRN** (Elsevier, free) — account required; most submissions **post within ~3 business days**; assigns a DOI. Econ/law/finance-leaning: a genuine fit for **econ.GN-flavored** work, weaker for pure cs.LG reach. ([review-process](https://www.elsevier.support/ssrn/answer/ssrn-review-process); [DOI blog](https://blog.ssrn.com/2023/01/31/ssrn-uses-doi-for-preprint-articles/))
- **Research Square** (free) — open-access, **CC-BY 4.0**, DOI, posted ~72h after a light prescreen. ([submit guide](https://support.researchsquare.com/support/solutions/articles/6000271843-how-do-i-submit-a-preprint-))
- **OSF Preprints — do NOT plan around this for AI work.** The **generalist server has been closed to new submissions since August 2025, and the closure is indefinite** (generative-AI-content and paper-mill pressure); community servers (PsyArXiv, SocArXiv, MetaArXiv) still run but **none fits cs/AI**, and OSF bans papers "completely or mostly generated by … AI tools." ([cos.io update](https://www.cos.io/blog/update-on-future-of-osf-preprints), *verified directly*). *(OSF is still useful for one narrow thing — preregistration — see the credibility stack.)*

### Identity setup (do this once, before the first submission)

- **ORCID** — register free at [orcid.org/register](https://orcid.org/), verify email, set visibility to "Everyone," link it in the arXiv dashboard. Do this *before* your first submission. ([arXiv identity policy](https://info.arxiv.org/help/policies/identity_and_affiliation.html))
- **Affiliation** — list **"Independent Researcher"** (accepted norm across servers and publishers; alternatives: "Unaffiliated," a registered company name). Never misrepresent affiliation — arXiv can permanently suspend for it. ([arXiv identity policy](https://info.arxiv.org/help/policies/identity_and_affiliation.html))
- **Google Scholar profile** — create with a Google account; populate ORCID from it via **Scholar → Export → BibTeX → ORCID → Import**, or link the Scholar URL in ORCID's "Websites." ([Purdue guide](https://guides.lib.purdue.edu/c.php?g=1343380&p=9910723))
- **Licensing on arXiv** — for maximum reuse pick **CC-BY 4.0**; you keep copyright under every option except CC0. **The choice is irrevocable.** ([info.arxiv.org/help/license](https://info.arxiv.org/help/license/index.html))
- **Versioning** — arXiv supports unlimited replacements (v1, v2, …) under one identifier, all permanently visible — standard for updating after feedback/peer review.

## Venue map by field

Ordered by fit for an unaffiliated, part-time researcher. The load-bearing constraint throughout: **can you publish without traveling, and does the venue gate on affiliation?**

| Venue | Field | Affiliation gate? | Publish without attending? | Cost / acceptance reality |
|---|---|---|---|---|
| **NeurIPS Datasets & Benchmarks** | ML eval | No — open OpenReview submit | **No** — ≥1 author must register + present **in person**; a Virtual-Only Pass is explicitly insufficient | Highest credibility, highest cost. 2025: **1,995 submissions, ≈24.9% accepted** (mirrors main track); reg ~$375 student / $800 academic / $1000 industry ⚠️ (2023 figures, may be stale). **Financial Assistance** gives complimentary reg + up to 7 hotel nights (criteria include "financial hardship," "first-time attendance") — apply as an independent |
| **ICLR/ICML/NeurIPS workshops** | ML / safety | No | Often yes (varies by workshop) | The cheap on-ramp. **Non-archival** → you can publish the full version at an archival venue later. A *top-conf* workshop carries real weight; present it as "the opening line, not the headline," never as archival |
| **EvalEval Coalition / shared tasks** | ML eval | No | Yes (remote) | **Most solo-friendly concrete opportunity found.** Qualifying contributors invited as **co-authors** on the shared-task paper. ACL 2026 window (May 1 deadline) now past, but the coalition is ongoing/repeatable |
| **Apart Research hackathons → Apart Lab** | Safety | No | Yes (remote, weekend-scale) | Free. Proven prototype-to-paper pipeline (hackathon work → ICLR/NeurIPS/ACL). 2026 sprints listed at [apartresearch.com/sprints](https://apartresearch.com/sprints/all) |
| **LessWrong / Alignment Forum** | Safety | No — output over credentials | Yes | Free, fast feedback, genuine standing. Post to LW; strong posts get **promoted** to AF. Full AF membership is invite-based (bar is "higher than working on alignment professionally") |
| **DEF CON AI Village** | Security | No | **No** — in-person only, **no archival proceedings** | Good for reach/reputation-in-the-scene, weak as a citable credential |
| **USENIX Security (+ WOOT/SOUPS)** | Security | No | **No** — ≥1 author at *full* reg, in person (hardship exception exists) | Co-located workshops are the lower-barrier entry |
| **FAccT** | HCI / fairness | No | Tiered country-based reg (in person) | Strong fit for eval-fairness/inequality work. ⚠️ 2026 acceptance rate not yet public |
| **SSRN / SocArXiv** | Economics | No | Yes | Your realistic econ preprint home |
| **NBER / IZA** | Economics | **Yes — closed to you** | — | NBER is affiliate-only; IZA needs nomination by two current Fellows. Treat as closed initially |
| **Lawfare / Tech Policy Press / The Conversation** | Policy | No | Yes | Pitch a *specific editor*, not a form. Fast, free, high-reach — but essays count as **commentary, not research credentials** |

**Sources for this table:** [D&B chairs blog](https://blog.neurips.cc/2025/09/30/reflecting-on-the-2025-review-process-from-the-datasets-and-benchmarks-chairs/) · [D&B "Art to Science"](https://blog.neurips.cc/2025/12/05/neurips-datasets-benchmarks-track-from-art-to-science-in-ai-evaluations/) · [NeurIPS Author Registration FAQ](https://neurips.cc/FAQ/AuthorRegistration) · [Financial Assistance](https://neurips.cc/Conferences/2025/FinancialAssistance) · [ICLR 2025 CfP](https://iclr.cc/Conferences/2025/CallForPapers) · [EvalEval shared task](https://evalevalai.com/events/shared-task-every-eval-ever/) · [Apart / EA Forum](https://forum.effectivealtruism.org/posts/suvWKJbwfPDsQK3PM/how-apart-research-would-use-marginal-funding-to-scale-ai) · [AF invite mechanics](https://www.lesswrong.com/posts/GAHyuEzYndxDjzXti/how-does-one-get-invited-to-the-alignment-forum) · [DEF CON AIV](https://easychair.org/cfp/AIV31) · [USENIX '26 instructions](https://www.usenix.org/conference/usenixsecurity26/instructions-presenters-and-authors) · [FAccT 2026 CfP](https://facctconference.org/2026/cfp.html) · [IZA guidelines](https://www.iza.org/content/publikationen/dp/guidelines) · [Tech Policy Press contributor guidelines](https://www.techpolicy.press/contributor-guidelines/).

## Making artifacts useful

**Core finding (verified):** documentation completeness is the single strongest *observable* predictor of adoption. A large-scale analysis of HuggingFace dataset cards found **86.0% of the top-100 most-downloaded datasets fill every suggested card section, vs. 7.9% of zero-download datasets** ([arXiv 2401.13822](https://arxiv.org/html/2401.13822v1)). The code parallel: repos completing all five items of the ML Code Completeness Checklist had a **median of 196 GitHub stars**, rising monotonically with items checked ([paperswithcode/releasing-research-code](https://github.com/paperswithcode/releasing-research-code)). Both are correlations, not causation — but the takeaway (fill the whole card; ship the whole checklist) is cheap and directionally clear.

**Datasets/benchmarks on HuggingFace:** the card that gets used has (1) every templated section filled; (2) a filled **YAML header** (`license`, `task_categories`, `size_categories`, `configs`) — this drives faceted search; (3) a copy-paste `load_dataset(...)` that works; (4) a splits table with row counts. "Considerations for Using the Data" is chronically under-written (~2% of card length) — writing it is a cheap differentiator.

**What makes a benchmark *adopted* vs ignored (the real lever):** *integration into the harness people already run.* Getting your task into **EleutherAI's `lm-evaluation-harness`** means anyone benchmarking a model runs yours with one flag. The path is a declarative **YAML task config** (`dataset_path`, `output_type`, `doc_to_text`, `metric_list`) + a contribution checklist ([new_task_guide.md](https://github.com/EleutherAI/lm-evaluation-harness/blob/main/docs/new_task_guide.md)). A benchmark that is *only a dataset* gets ignored; dataset + harness task + leaderboard gets adopted. For a leaderboard, the HF-recommended architecture is four pieces — public Gradio UI Space, a *private* evaluator Space holding test labels, a submissions dataset, a results dataset — keeping the test set private to prevent contamination ([HF build guide](https://huggingface.co/blog/hugging-science/building-a-benchmark-or-challenge)).

**Tools on GitHub/PyPI:** ship the **five checklist items** — dependency spec, training code, eval code, pre-trained artifacts, and a **README with a results table + the exact command to reproduce each row** ([checklist](https://github.com/paperswithcode/releasing-research-code)). Publish to **PyPI** (installability enables a plugin ecosystem) and keep a stable CLI entrypoint.

**Licensing (match the license to the goal — broad reuse ⇒ permissive):** code → **MIT or Apache-2.0** (Apache adds a patent grant, safer default); datasets → **CC-BY-4.0** (avoid CC-BY-NC if you want adoption); model weights → **Apache-2.0 or OpenRAIL-M** ([ML licensing analysis](https://arxiv.org/html/2502.04484v2); [Turing Way](https://book.the-turing-way.org/reproducible-research/licensing/licensing-ml/)).

**Named solo/small-team exemplars where the artifact — not a paper — was the standing:**
- **Simon Willison — `llm` CLI** ([github.com/simonw/llm](https://github.com/simonw/llm)): no paper; tool + relentless changelog-blogging became developer infrastructure.
- **Teknium — OpenHermes-2.5** ([HF](https://huggingface.co/datasets/teknium/OpenHermes-2.5)): a dataset that built a reputation from near-zero credential.
- **EleutherAI — `lm-evaluation-harness`**: the lesson is that the winning move is often the *harness*, not another benchmark.
- **ARC Prize** ([arcprize.org](https://arcprize.org/arc-agi/2)): dataset + public leaderboard + prize — artifact-as-field-definer.
- **LMSYS Chatbot Arena**: an interactive results site *is* the artifact.
- **Nomic — nomic-embed-text** ([HF](https://huggingface.co/nomic-ai/nomic-embed-text-v1.5)): adoption from full reproducibility (open weights + open data), not the paper.

## Distribution & credibility playbook

**The channels that move work (by leverage):**
1. **arXiv** — now a *gate*, not a given (see mechanics above). Budget a week to secure endorsement before planning any launch.
2. **HuggingFace Daily Papers** — the highest-leverage self-submit channel once you have one indexed arXiv paper: submit the arXiv ID at [huggingface.co/papers](https://huggingface.co/papers) within 14 days, claim authorship, attach images/video ([HF guide](https://huggingface.co/blog/AdinaY/a-guide-to-hugging-faces-papers-page)).
3. **X/Twitter** — still the primary discovery layer. The unit of distribution is a thread that translates the paper into a clear narrative + one strong figure. Adjacent tools researchers actually use: [alphaXiv](https://www.alphaxiv.org/) (line-by-line comments, author Q&A), Papers-with-Code, Semantic Scholar, searchthearXiv.
4. **r/MachineLearning + HackerNews** — reward a self-contained artifact (working demo, reproducible repo, honest results); punish thin self-promotion. Amplifiers of an already-good post, not primary venues.
5. **Newsletters** — aim to *be cited*, not to submit: **Ahead of AI** (Raschka, 190k+), **Import AI** (Clark, 100k+), **Interconnects** (Lambert), **AlphaSignal** (daily digest).

**Verified case studies (the "blog → standing" pattern):**
- **Chris Olah** — no degree; built reputation via public blog posts + visualizations, then cold-emailed labs: *"if you write really good cold emails, it's actually not that hard to be the best email I received that week."* ([80,000 Hours](https://80000hours.org/podcast/episodes/chris-olah-unconventional-career-path/))
- **Neel Nanda** — seeded a research area partly via a **"one blog post per day for a month"** challenge; advises "maximising your luck surface area" — write publicly, reach out, say yes. ([80,000 Hours pt 2](https://80000hours.org/podcast/episodes/neel-nanda-career-advice-frontier-ai-companies/))
- **Anthropic careers** (institutional signal): "If you have done interesting independent research, written an insightful blog post, or made substantial contributions to open-source software, put that at the TOP of your resume." ([Anthropic careers](https://www.anthropic.com/careers))
- ⚠️ **unverified:** I found no *documented, named* case of a single preprint/post directly causing a job offer with a traceable citation (2024–2026). Treat "blog → job" as a well-supported **pattern**, not a guaranteed shortcut.

**Cold outreach that works** ([Princeton PCUR](https://pcur.princeton.edu/2025/04/cracking-cold-emails-reaching-out-to-professors-in-a-way-that-works/); [MIT Comm Lab](https://mitcommlab.mit.edu/be/2025/10/03/writing-professional-emails-effective-strategies-and-etiquette/)): (1) reference a *specific* paper; (2) three short paragraphs — connection, one-line bio, one **low-commitment ask** (a 15-min call, not mentorship); (3) 5 personalized emails beat 50 templated; (4) one follow-up after ~10 business days, no apology; (5) emailing a grad student/lab member often gets a reply the PI won't send.

**Failure modes ("great work nobody saw"):** a preprint with no thread/figure/demo; no endorsement so it never indexes; self-promo on r/ML/HN with no reproducible artifact; a great result buried in a PDF with no plain-language TL;DR; one-shot broadcasting instead of sustained presence (building-in-public is years, not months).

**The credibility stack (assemble all of it):** ORCID + versioned repo + **DOI-archived code/data** (Zenodo/figshare) + **preregistration** (OSF is still fine for this — time-stamped before running) + **honest, explicit limitations**. This is our cheapest substitute for institutional prestige.

## The default pipeline for this program

The one-page recommended flow. When a pilot's artifact is ready, run this without re-deciding.

**Setup (do once, now — before the first pilot ships):**
> Register **ORCID** → set up a **Google Scholar** profile → stand up the **personal website** (below) → identify 2–3 potential arXiv endorsers among authors you already cite, so the ask is ready the moment a draft exists.

**Per-artifact flow:**
> **1. Preprint venue:** arXiv (cs.CL/cs.LG/cs.AI) via manual endorsement, **"Independent Researcher," CC-BY 4.0**. If endorsement stalls past ~1 week → **Zenodo with a DOI** (SSRN instead if the work is econ.GN-flavored). Never OSF for AI work.
> **2. Artifact home:** GitHub (five-item checklist, MIT/Apache) + **the type-specific home** — HF dataset card for data, `lm-evaluation-harness` task for a benchmark, PyPI for a tool. Archive a snapshot to Zenodo for the DOI.
> **3. Distribution sequence (first 72h):** HF Daily Papers submit → X thread (clear narrative + one figure + the reproduce command) → cross-post to own site → r/ML or Show HN *only if* the artifact is self-contained → for safety work, LessWrong for promotion to AF.
> **4. Credibility stack:** ORCID linked · repo versioned · code/data DOI'd · preregistration where applicable · limitations stated plainly.

**Credential-building order over time** (the escalation ladder): LessWrong/AF posts + an Apart hackathon (zero cost, fast standing) → an EvalEval-style shared task or a NeurIPS/ICLR *workshop* eval paper (real but cheap credential) → a **NeurIPS D&B full paper** once you can fund or waiver the in-person requirement. Policy essays and SSRN preprints are amplifiers, reserved for when they serve a specific piece.

**Website recommendation, stated plainly:** **Run your own custom domain fronting a static site (GitHub Pages / Quarto) as the canonical home — not Substack-as-everything.** A project portfolio needs to aggregate "what have you built?" in one place; Substack scatters that and can't dynamically aggregate work ([Jenny Ouyang](https://jennyouyang.substack.com/p/ai-can-build-your-personal-website-within-minutes-then-what); [Quarto site example](https://github.com/kozodoi/website)). Willison's own-domain blog is the canonical exemplar. Use Substack/newsletter only as a *reach complement*, never the base.

## Still unverified

- Exact **cs.\* arXiv endorser paper count** (reported 3–5; arXiv does not publish it).
- **econ.GN** endorser threshold; whether an obtained endorsement expires (arXiv docs state no duration).
- Whether the tightened endorsement rule had *fully* rolled to econ.GN by mid-2026 (announced for "all categories," phased from Math in Dec 2025).
- **NeurIPS 2025 exact registration fees** ($375/$800/$1000 is a 2023 source; the 2025 pricing page would not render numbers) and **NeurIPS 2025 D&B exact acceptance %** (≈24.9% inferred from ~497/1,995; chairs' post gives the submission count, not the final rate).
- **FAccT 2026** acceptance rate and exact fees (not yet public); **DEF CON DC34 AI Village** CFP specifics (quoted from the AIV31 template — verify DC34's current text).
- Live **download counts** for OpenHermes-2.5 / nomic-embed (HF returned likes, not downloads); the **196-star median** is from a NeurIPS-2019 sample and may not reflect 2026 baselines.
