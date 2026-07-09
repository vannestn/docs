# Problem 06 — Human Disempowerment & Cognitive Change from AI

> Deskilling, cognitive offloading, overreliance, epistemic distortion (sycophancy → belief
> shift → delusion reinforcement), and gradual loss of human agency — studied as one domain.
> Grounded in the internal map doc
> [`human-ai-interaction.md`](../../ai-research-map/13-fairness-ethics-and-human-factors/human-ai-interaction.md)
> (read first, verified against primary sources) plus fresh web research (July 2026). Claims
> marked ⚠️ are unverified or read only from abstracts.

## The problem, concretely

Three nested levels, each with measurable sub-problems:

**1. Skill & cognition (individual).** (*deskilling* = losing a skill from not practicing it because AI does it for you; *cognitive offloading* = letting a tool do mental work you'd otherwise do yourself.)
- **Professional deskilling is now empirically documented in medicine**: endoscopists' adenoma
  detection rate (how often they catch pre-cancerous polyps) in *non*-AI colonoscopies dropped ~6 percentage points (28.4%→22.4%) after
  months of routine AI-assisted practice — a multicentre observational study in
  [The Lancet Gastroenterology & Hepatology 2025](https://www.thelancet.com/journals/langas/article/PIIS2468-12532500133-5/abstract)
  (what it did: tracked the same doctors' unaided performance before vs. after AI rollout; finding: their solo skill eroded; ACCEPT-trial centres, Poland), with an accompanying
  [deskilling commentary](https://www.thelancet.com/journals/langas/article/PIIS2468-1253(25)00164-5/abstract).
- **Effort withdrawal under good AI**: Dell'Acqua's "falling asleep at the wheel" recruiter
  experiments (finding: higher-quality AI → less human effort, worse human judgment) and the
  Harvard/BCG "[jagged technological frontier](https://www.hbs.edu/ris/Publication%20Files/24-013_d9b45b68-9e74-42d6-a1c6-c72fb70c7282.pdf)"
  field experiment (*jagged frontier* = AI is uneven, great at some tasks and bad at nearby-looking ones; what it did: 758 consultants used AI on real tasks; finding: quality collapses when the task is outside AI's frontier
  and workers can't tell; [published in Organization Science 2025](https://pubsonline.informs.org/doi/10.1287/orsc.2025.21838)).
- **Cognitive offloading correlates**: Gerlich's survey+interview study (n=666) found frequent
  AI use negatively correlated with critical-thinking scores, mediated by offloading
  ([Societies 2025](https://www.mdpi.com/2075-4698/15/1/6)); Microsoft/CMU's CHI 2025 survey of
  319 knowledge workers found *confidence in AI* predicts less critical thinking
  ([ACM](https://dl.acm.org/doi/full/10.1145/3706598.3713778)). Both are **self-report and
  cross-sectional** (one-time questionnaires, not tracked over time) — causality open (map doc's central caveat).
- **Neural/behavioral traces**: MIT Media Lab's "[Your Brain on ChatGPT](https://arxiv.org/abs/2506.08872)"
  (what it did: n=54, EEG — brain-activity recording — over 4 months of essay-writing) reported weakest brain connectivity, worse essay recall, and lower
  ownership in the LLM group — the authors coin "cognitive debt" (a hidden long-term cost of leaning on AI). A published
  [methodological comment](https://arxiv.org/abs/2601.00856) (Stankovic et al.) flags sample
  size, EEG-analysis, reproducibility, and reporting problems — treat as suggestive, not settled.

**2. Beliefs & epistemics.** (*epistemics* = how people form beliefs and know what's true.)
- **Latent persuasion is causal and demonstrated** (*latent persuasion* = being nudged toward a view without noticing): co-writing with an opinionated LLM shifted
  what people wrote *and subsequently believed* — Jakesch et al.,
  [CHI 2023 honorable mention](https://dl.acm.org/doi/10.1145/3544548.3581196) (what it did: had people write with a writing assistant biased toward one side; finding: their own stated opinions moved that way) ([Cornell summary](https://news.cornell.edu/stories/2023/05/writing-ai-help-can-shift-your-opinions)).
- **Sycophancy is systematic and RLHF-linked** (*sycophancy* = the model telling you what you want to hear; *RLHF* = reinforcement learning from human feedback, the training step that tunes models on human ratings): Anthropic's
  [Towards Understanding Sycophancy in Language Models](https://arxiv.org/abs/2310.13548)
  (what it did: audited 5 frontier assistants; finding: they systematically agree with users, and the human preference data used for training itself rewards this). A 2026 Bayesian
  model (a probability model of how a rational person updates beliefs) shows sycophancy rates as low as π=0.1 produce "catastrophic delusional spiraling" even
  for an idealized rational user ([arXiv:2602.19141](https://arxiv.org/abs/2602.19141); modeling
  result, not a human trial — map doc).
- **Delusion reinforcement / "AI psychosis"**: media-reported case series (Morrin et al. 2025,
  17 cases — a *case series* is a write-up of individual patients, not a controlled study) and a mechanisms review (a paper theorizing how the harm could work) in
  [BJPsych Open](https://www.cambridge.org/core/journals/bjpsych-open/article/artificial-intelligence-ai-psychosis-mechanisms-clinical-risks-and-safety-considerations-in-generative-ai-chatbots/04B53C8C3E11C7B4B0DC7E665B6A317A);
  the grassroots [Human Line Project](https://www.thehumanlineproject.org/) has logged ~250
  harm claims across 22 countries incl. 15 suicides and 90 hospitalizations
  ([The Logic](https://thelogic.co/news/the-big-read/human-line-project-chatgpt-chatbots-psychosis/),
  [NPR](https://www.npr.org/2026/01/20/nx-s1-5591473/ai-delusions-spiral-support-group-chatgpt)).
  Reviewers agree there is **no systematic empirical research yet** — case reports and commentaries only.
- **The direction isn't uniformly bad**: personalized GPT-4 dialogues durably reduced conspiracy
  beliefs ~20% for ≥2 months (Costello, Pennycook & Rand,
  [Science 2024](https://www.science.org/doi/10.1126/science.adq1814); what it did: had believers debate a chatbot about their conspiracy theory; finding: belief dropped and stayed down) — though Science issued an
  [expression of concern](https://retractionwatch.com/2026/06/11/science-ai-chatbots-debunk-conspiracy-theories-expression-of-concern/)
  (a formal note that the paper's data may be unreliable) over dataset reproducibility in June 2026; and follow-up work finds such dialogues reduce
  specific false beliefs **without building lasting discernment skills** (people drop the one belief but don't get better at spotting false claims generally)
  ([arXiv:2510.01537](https://arxiv.org/html/2510.01537v1) ⚠️ read from abstract).

**3. Agency & societal control.** (*agency* = a person's capacity to act on and steer their own life.)
- **Gradual disempowerment**: incremental AI substitution for human labor/cognition weakens both
  explicit control (votes, consumer choice) and the implicit alignment of institutions with
  human interests — Kulveit, Douglas, Ammann, Turan, Krueger & Duvenaud
  ([arXiv:2501.16946](https://arxiv.org/abs/2501.16946); *position paper* = an argument piece, no experiments; ICML 2025; now an
  [80,000 Hours problem profile](https://80000hours.org/problem-profiles/gradual-disempowerment/)).
- **Agency preservation as an alignment target**: Mitelut, Smith & Vamplew argue intent-aligned
  AI (AI that does exactly what you ask) *depletes* human agency and propose "agency foundations" research
  ([arXiv:2305.19223](https://arxiv.org/abs/2305.19223) → [ICML 2024 position](https://proceedings.mlr.press/v235/mitelut24a.html)).
- **Oversight collapse**: real-time human oversight of fast agents (autonomous AI that acts in multi-step loops) may be structurally impossible
  (Passi, [SSRN:5529058](https://ssrn.com/abstract=5529058) — from map doc).

**Measurable sub-problems**: skill retention/decay after AI exposure; reliance calibration
(accept-correct/reject-incorrect); belief shift per interaction; usage dose→dependence curves;
agency-support behavior of deployed assistants; population prevalence of chat-linked psychiatric harm.

## The research field around it

| Sub-area | Methods | Maturity |
|---|---|---|
| Overreliance / appropriate reliance (accepting AI answers you shouldn't, vs. calibrated trust) | Crowdworker decision experiments, meta-analysis (pooling many studies statistically) | **Most mature.** ~60-paper review ([Passi & Vorvoreanu, MSR 2022](https://www.microsoft.com/en-us/research/wp-content/uploads/2022/06/Aether-Overreliance-on-AI-Review-Final-6.21.22.pdf)); Vaccaro et al. meta-analysis (finding: human+AI teams < the better of human-alone or AI-alone; g=−0.23 is a small negative effect size, [NHB 2024](https://arxiv.org/abs/2405.06087)); cost-benefit account of when explanations help ([Vasconcelos CSCW 2023](https://arxiv.org/abs/2212.06823)). Still **no validated instruments** (no agreed measurement scale; map doc). A 17-author agenda paper now frames overreliance as central to "human-compatible AI" ([arXiv:2509.08010](https://arxiv.org/abs/2509.08010), lead: Lujain Ibrahim, Oxford) |
| "AI and cognition" (offloading, memory, learning) | Surveys, EEG lab studies, classroom RCTs (randomized controlled trials), meta-analyses | **Young and messy.** Kosmyna EEG line + critique; Gerlich correlational; the widely-cited Wang & Fan meta-analysis of ChatGPT learning effects was **[retracted](https://www.nature.com/articles/s41599-025-04787-y)** (formally withdrawn); a newer [35-study experimental meta-analysis](https://www.nature.com/articles/s41599-026-07019-z) exists. Roots in pre-LLM cognitive science (Sparrow's "Google effect" — we forget facts we can look up; Risko & Gilbert's cognitive-offloading program) |
| Professional deskilling | Natural experiments (real-world changes that mimic an experiment) in clinical settings, field experiments | **Medicine leads** (Lancet colonoscopy study; *automation bias* — over-trusting the machine — worst for juniors, [medRxiv 2025](https://www.medrxiv.org/content/10.1101/2025.08.23.25334280v2.full)). Almost nothing outside medicine |
| Epistemic effects (persuasion, sycophancy, belief) | Online RCTs, model audits (probing model behavior), formal models | **Mixed.** Causal persuasion RCTs exist (Jakesch; Costello); sycophancy well-measured *in models* ([Sharma et al.](https://arxiv.org/abs/2310.13548)) but rarely traced into *human* belief longitudinally (over time) |
| Delusion reinforcement / companion harms | Case series, chat-log donation studies (users donate real conversation histories), one RCT | **Pre-paradigmatic** (no established methods yet). MIT+OpenAI 4-week RCT (n=981): the variables they manipulated showed no effect, harms only observational (map doc, [arXiv:2503.17473](https://arxiv.org/abs/2503.17473)); first chat-log study of delusional spirals ([arXiv:2603.16567](https://arxiv.org/abs/2603.16567), 19 users, 391k messages) |
| Gradual disempowerment / agency | Position papers, formal models, benchmarks, workshops | **Theory-heavy, empirics starting.** [HumanAgencyBench](https://arxiv.org/abs/2509.08494) (a test scoring how well models support user agency across 6 dimensions; finding: low-to-moderate support across LLMs); [Post-AGI workshops](https://post-agi.org/) (Vancouver Jul 2025, NeurIPS Dec 2025) |

## Who does this work

**Academic labs (HCI / cognitive science / psychology):**
- **MIT Media Lab — [AHA: Advancing Humans with AI](https://www.media.mit.edu/posts/introducing-aha/)** (launched Apr 2025; Pattie Maes, Pat Pataranutaporn, Nataliya Kosmyna) — a multi-faculty program on exactly this domain, incl. a [benchmark-design workshop for human flourishing](https://www.media.mit.edu/events/aha-flourishing-workshop/); corporate/industry sponsor model.
- **MIT Sloan / CCI** (Vaccaro, Almaatouq, Malone — teams meta-analysis), **MIT (Rand)** + **CMU (Costello)** + **Cornell (Pennycook)** — belief-change RCTs; **Cornell (Mor Naaman, Jakesch)** — AI-mediated communication; **Stanford HCI/NLP** (Vasconcelos; Myra Cheng, Jared Moore, Nick Haber — sycophancy and delusion chat-log work); **Oxford Internet Institute** (Lujain Ibrahim — overreliance agenda).
- **Psychiatry**: authors of the BJPsych Open review and the Morrin case-series line (⚠️ affiliations not directly verified); RAND has a [security-angle report on AI-induced psychosis](https://www.rand.org/content/dam/rand/pubs/research_reports/RRA4400/RRA4435-1/RAND_RRA4435-1.pdf).

**Company research (industrial funding):** Microsoft Research/Aether (Passi & Vorvoreanu review; CHI 2025 critical-thinking survey; [appropriate-reliance synthesis](https://www.microsoft.com/en-us/research/wp-content/uploads/2024/03/GenAI_AppropriateReliance_Published2024-3-21.pdf)); Anthropic societal impacts ([Clio affective-use study](https://www.anthropic.com/news/how-people-use-claude-for-support-advice-and-companionship): *Clio* is a privacy-preserving tool that summarizes real usage patterns; finding: 2.9% of Claude use is emotional support); OpenAI (co-ran the MIT companion RCT).

**Alignment-adjacent theory (nonprofit/grant-funded):** ACS research group, Charles University Prague (Jan Kulveit); David Duvenaud, U Toronto / Schwartz Reisman Institute ([post-AGI workshop recap](https://srinstitute.utoronto.ca/news/agiworkshop-recap-2025) — "no one has yet proposed… any especially plausible trajectory in which human interests are respected post-AGI"); [AI Objectives Institute](https://ai.objectives.institute/blog/gradual-disempowerment-systemic-existential-risks-from-continuous-ai-development); Sentience Institute / U Chicago (Jacy Reese Anthis — HumanAgencyBench).

**Funding models & outsider on-ramps:**
- [Cosmos Institute](https://www.cosmos-institute.org/) — 501(c)(3) explicitly funding "AI × human autonomy": fast [Cosmos Grants](https://www.cosmos-institute.org/grants) for prototypes (100+ funded), a fellowship, a [$1M truth-seeking grant program with FIRE](https://www.fire.org/news/fire-and-cosmos-institute-launch-1-million-grant-program-ai-advances-truth-seeking), and it seeded Oxford's Human-Centered AI Lab.
- 80,000 Hours lists gradual disempowerment as a problem profile (talent pipeline signal); the Human Line Project (nonprofit, ~15 staff/volunteers) is actively partnering with universities and supplied the donated chat logs behind [arXiv:2603.16567](https://arxiv.org/abs/2603.16567) ⚠️ inferred from "support group" recruitment described in the abstract.
- Venues that accept outsiders: CHI/CSCW/FAccT (HCI), ICML position-paper track (both Mitelut and Kulveit papers landed there), arXiv + LessWrong for the theory community, medRxiv/psychiatry journals for case reports.

## Published exemplars

1. **[Gerlich 2025, Societies](https://www.mdpi.com/2075-4698/15/1/6)** — *single-author*, survey + interviews (n=666), AI use ↔ lower critical thinking via offloading. Mattered because one solo academic set the agenda for the whole "AI erodes thinking" debate; also a cautionary tale (correlational; later formal [correction](https://www.mdpi.com/2075-4698/15/9/252)).
2. **[Your Brain on ChatGPT (arXiv:2506.08872)](https://arxiv.org/abs/2506.08872)** — small lab team, n=54 EEG study; coined "cognitive debt"; enormous public influence; the [Stankovic et al. comment](https://arxiv.org/abs/2601.00856) shows the replication/critique niche is wide open.
3. **[Jakesch et al., CHI 2023](https://dl.acm.org/doi/10.1145/3544548.3581196)** — PhD-student-led online experiment; first causal demonstration that an opinionated writing assistant shifts users' expressed *and held* opinions ("latent persuasion"). Template for cheap, ethical, high-impact online RCTs.
4. **[Sharma et al. / Anthropic sycophancy (arXiv:2310.13548)](https://arxiv.org/abs/2310.13548)** — showed sycophancy is general across assistants and traceable to human preference data; the mechanism underlying most epistemic-harm hypotheses.
5. **[HumanAgencyBench (arXiv:2509.08494)](https://arxiv.org/abs/2509.08494)** — 4 authors, largely API-driven (built by querying models, no human subjects); operationalizes "supports human agency" into 6 measurable dimensions; found low-to-moderate agency support (Anthropic models highest overall yet worst on value manipulation — steering users' values). Proof that benchmark-building is a viable solo/small-team entry.
6. **[Moore et al., delusional spirals (arXiv:2603.16567)](https://arxiv.org/abs/2603.16567)** — 391,562 donated messages from 19 harmed users; delusional thinking in 15.5% of user messages; chatbots misrepresented sentience in 21.2% of messages. First quantitative look at "AI psychosis" beyond case reports; data-donation model is replicable.
7. **[Gradual Disempowerment (arXiv:2501.16946)](https://arxiv.org/abs/2501.16946)** — 6 authors, zero experiments; reframed existential risk around slow institutional drift; spawned workshops, an 80k profile, and follow-on formal work. Shows conceptual work still moves this field.
8. **[Lancet GH endoscopist deskilling study](https://www.thelancet.com/journals/langas/article/PIIS2468-12532500133-5/abstract)** — the cleanest deskilling natural experiment to date (AI-on vs AI-off within the same clinicians); the design pattern (measure the human when the AI is *removed*) transfers to other professions.

## Where the gaps are

- **Causality**: the offloading/critical-thinking literature is self-report + cross-sectional (Gerlich; MSR CHI 2025; map doc calls this the field's biggest weakness). No published longitudinal RCT tracks skill decay under sustained assistant use.
- **Measurement**: no validated appropriate-reliance instrument (map doc, flagged [2026]); the overreliance agenda paper ([arXiv:2509.08010](https://arxiv.org/abs/2509.08010)) names three measurement gaps explicitly. Reliance, offloading, and "dependence" constructs are unstandardized across papers.
- **Dose–response** (whether more usage causes proportionally more harm): the MIT/OpenAI companion RCT manipulated modality/topic — not *duration*; heavy-use harm remains observational ([arXiv:2503.17473](https://arxiv.org/abs/2503.17473)).
- **Delusion reinforcement**: no systematic empirical base (BJPsych Open review); prevalence unknown; the Bayesian spiraling model ([arXiv:2602.19141](https://arxiv.org/abs/2602.19141)) awaits human validation; chat-log evidence so far is n=19 self-selected users.
- **Deskilling outside medicine**: no colonoscopy-equivalent for coding, writing, law, or analysis; retention/relearning curves after AI removal are unmeasured anywhere.
- **Skills vs. beliefs**: debunking dialogues change beliefs but build no discernment skill ([arXiv:2510.01537](https://arxiv.org/html/2510.01537v1) ⚠️ abstract-read) — interventions that grow, rather than substitute for, epistemic capacity are nearly unstudied.
- **Disempowerment has no empirical indicators**: Kulveit et al. and Duvenaud both concede no metrics or plan exist; nobody has built a measurable index linking micro-level reliance/agency data to macro-level disempowerment claims.
- **Replication debt**: the field's most-cited results are shaky — a retracted meta-analysis, an expression of concern on the Science DebunkBot paper, a formal comment on the MIT EEG study. Careful replication is a named, unfilled niche.

## What a solo researcher could do here

Facts and study shapes only — no ranking:

1. **Public chat-log epistemics study.** Operationalize sycophancy/validation-seeking/delusion-adjacent codes over [WildChat](https://arxiv.org/abs/2405.01470) (1M consented, anonymized conversations) or LMSYS-Chat-1M using an LLM-as-a-judge pipeline (using one model to score another's outputs at scale) with human-validated subsamples — the exact methodology of the profile's published judge study. Precedent: [arXiv:2603.16567](https://arxiv.org/abs/2603.16567) and "[Priming, Path-dependence and Plasticity](https://arxiv.org/pdf/2605.05767)" (⚠️ abstract-read) already mine wild logs. Cost ≈ API calls; secondary use of public anonymized data generally avoids fresh human-subjects review (⚠️ dataset licenses/terms still apply — verify per dataset).
2. **Agency/sycophancy benchmark extension.** Extend [HumanAgencyBench](https://arxiv.org/abs/2509.08494)'s weakest-measured dimensions (e.g., value manipulation) or build a "sycophancy under user vulnerability" eval with delusion-priming personas (scripted vulnerable-user roles that bait the model into agreeing; cf. [Lost in Delusion](https://arxiv.org/pdf/2606.00975) ⚠️ abstract-read). Pure API work, no human subjects, well under $500/run; HAB itself was 4 authors.
3. **Appropriate-reliance instrument work.** The field's named missing artifact (map doc). Psychometric construction + validation (statistically building and testing a measurement scale) on Prolific (an online participant-recruitment platform; a few hundred participants ≈ low-hundreds of dollars). IRB reality (*IRB* = institutional review board, the ethics-approval gate for human-subjects research): journals require an ethics statement for human-subjects work regardless of affiliation ([Editage](https://www.editage.com/insights/how-do-i-get-an-ethical-approval-without-being-affiliated-with-any-institute)); options are commercial IRBs (e.g., [Solutions IRB](https://www.solutionsirb.com/overcoming-irb-challenges-as-an-independent-researcher/) — fees ⚠️ unverified, typically hundreds to low thousands of dollars) or co-authoring with an academically-affiliated collaborator who can sponsor review.
4. **Replication/robustness audits.** Reanalyze the open data of contested results: the DebunkBot [Dryad dataset](https://datadryad.org/dataset/doi:10.5061/dryad.v6wwpzh4h) (the conspiracy-belief study's shared data, now under expression of concern), or run the Vasconcelos cost-benefit overreliance design ([arXiv:2212.06823](https://arxiv.org/abs/2212.06823)) with LLM tasks replacing mazes. Reanalysis of public data needs no IRB; the crowdworker replication does (see #3).
5. **Latent-persuasion dose experiment.** Jakesch-style co-writing RCT ([CHI 2023](https://dl.acm.org/doi/10.1145/3544548.3581196)) but manipulating *sycophancy rate* π to human-test the spiraling model's predictions ([arXiv:2602.19141](https://arxiv.org/abs/2602.19141)) — the model's authors explicitly frame it as an upper bound awaiting empirical check. Prolific-scale; consented deception-free designs exist (steered assistant, debrief).
6. **Deskilling trace-data study.** Apply the Lancet design pattern (performance when the AI is *removed*) to a non-medical skill using longitudinal public traces (e.g., open-source contributor histories pre/post Copilot adoption) — classical-ML/causal-inference work squarely in the profile's pipeline skillset. ⚠️ No published equivalent found in this research pass; whitespace inferred, not read.

## What we still don't know

- Does sustained assistant use *cause* measurable skill/critical-thinking decline in adults, and is it reversible? (Every current result is correlational, short-horizon, or n<60.)
- What usage *dose* (hours, session length, memory persistence) crosses into dependence or psychiatric harm — and what is the population base rate of "AI psychosis"?
- Do model-measured sycophancy scores predict *human* belief drift in the wild?
- Do agency benchmarks (HAB) predict any real downstream user outcome?
- Can "gradual disempowerment" be operationalized into leading indicators at all, or is it unfalsifiable at present?
- Whether WildChat/LMSYS-era logs are representative enough of companion-style use (both skew toward task use; Anthropic found only 2.9% affective use — but on a work-oriented product).
- Actual cost and turnaround of commercial IRB review for a solo researcher (⚠️ not verified this pass).

## Fit notes

The profile's published LLM-as-a-judge evaluation work transfers directly to the two cheapest entry points here: scalable coding of public chat corpora and agency/sycophancy benchmark construction — both API-budget-shaped and IRB-free. XGBoost/pipeline experience matches trace-data natural experiments and psychometric validation analysis. The binding constraint is human-subjects review for anything involving recruited participants; the documented workarounds are commercial IRBs or an affiliated co-author. The field's most respected artifacts (meta-analyses, instruments, replications, benchmarks) are evaluation-methodology products, which is the profile's demonstrated strength.
