#!/usr/bin/env bash
# Download every arXiv paper cited in the AI Research Map — run this on YOUR machine.
#
# Usage:
#   cd papers
#   ./download-arxiv.sh            # downloads into ./pdf/
#   ./download-arxiv.sh /some/dir  # downloads into /some/dir
#
# Notes:
#  - Reads arxiv-ids.txt (one ID per line).
#  - Skips files already downloaded, so it's safe to re-run / resume.
#  - Sleeps 3s between requests (arXiv asks bots to rate-limit; be polite).
#  - Logs anything that fails to download-failures.log — some IDs are 2026-dated
#    and may not resolve; that's expected, they'll land in the failures log.
#  - Requires: bash + curl.

set -uo pipefail
IDS_FILE="$(dirname "$0")/arxiv-ids.txt"
OUTDIR="${1:-$(dirname "$0")/pdf}"
FAILLOG="$(dirname "$0")/download-failures.log"
mkdir -p "$OUTDIR"
: > "$FAILLOG"

total=$(grep -c . "$IDS_FILE")
i=0; ok=0; skip=0; fail=0
echo "Downloading $total arXiv PDFs into $OUTDIR"

while IFS= read -r id; do
  [ -z "$id" ] && continue
  i=$((i+1))
  out="$OUTDIR/${id}.pdf"
  if [ -s "$out" ]; then
    skip=$((skip+1)); printf '[%d/%d] skip %s (have it)\n' "$i" "$total" "$id"; continue
  fi
  printf '[%d/%d] get  %s ... ' "$i" "$total" "$id"
  code=$(curl -L -sS --max-time 60 -o "$out" -w '%{http_code}' \
         -A 'ai-research-map paper fetch (mailto:you@example.com)' \
         "https://arxiv.org/pdf/${id}")
  if [ "$code" = "200" ] && [ -s "$out" ]; then
    echo "ok"; ok=$((ok+1))
  else
    echo "FAILED (http $code)"; rm -f "$out"; echo "$id http=$code" >> "$FAILLOG"; fail=$((fail+1))
  fi
  sleep 3
done < "$IDS_FILE"

echo
echo "Done. ok=$ok skipped=$skip failed=$fail (see $FAILLOG for failures)"
