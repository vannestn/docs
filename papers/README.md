# Papers — download manifest & fetch script

Everything you need to download the sources cited in the [AI Research Map](../ai-research-map/)
**on your own machine** (this repo's research was compiled in a sandbox that can't reach
`arxiv.org`, so the downloads have to happen on your network).

## Files

| File | What it is |
|------|------------|
| `arxiv-ids.txt` | 192 unique arXiv IDs cited in the map (one per line) |
| `non-arxiv-sources.txt` | 127 non-arXiv URLs (journals, lab blogs, institutes, press) |
| `all-sources.txt` | All 310 unique source URLs |
| `download-arxiv.sh` | Script to fetch every arXiv PDF into `./pdf/` |

These are regenerated from the map's citations, so they stay in sync if the map changes.

## Quick start (on your local computer)

```bash
git pull                       # get the latest map + manifests
cd papers
chmod +x download-arxiv.sh
./download-arxiv.sh            # downloads 192 PDFs into papers/pdf/<id>.pdf
```

The script is **resumable** (skips files you already have), **polite** (3s between
requests, as arXiv asks), and logs anything that fails to `download-failures.log`.

> ⚠️ **Heads-up on 2026-dated IDs.** Many citations carry 2026 arXiv IDs (e.g. `2602.xxxxx`)
> surfaced during research. Some may not resolve on the real arXiv and will land in
> `download-failures.log` — that's expected, and those are exactly the items on the
> [verification checklist](../ai-research-map/00-overview/verification-checklist.md) worth a
> manual look.

## Non-arXiv sources
`non-arxiv-sources.txt` lists journal/lab/press URLs. These aren't bulk-downloadable with one
script (paywalls, varied formats), so fetch the ones you need manually. The
[source index](../ai-research-map/00-overview/source-index.md) shows which map document cites
each URL, so you can prioritize.

## After downloading — analysis
Once the PDFs are on your machine, you can have me analyze them: pull them back into this repo
(e.g. leave them in `papers/pdf/`) within a session and I'll read each from disk and write the
analysis. Suggested first pass: the ~20 Tier-1 items in the
[verification checklist](../ai-research-map/00-overview/verification-checklist.md) rather than
all 192 at once.
