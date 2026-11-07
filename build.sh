#!/usr/bin/env bash
# Build the static site: convert content/*.md to site/*.html with pandoc,
# copy style.css into site/. No network access required.
set -euo pipefail

cd "$(dirname "$0")"

command -v pandoc >/dev/null 2>&1 || {
  echo "error: pandoc is required (https://pandoc.org)" >&2
  exit 1
}

mkdir -p site
rm -f site/*.html

for md in content/*.md; do
  name="$(basename "$md" .md)"
  title="$(sed -n 's/^# //p' "$md" | head -n 1 | tr -s ' ')"
  pandoc --standalone \
         --template=template.html \
         --metadata title="$title" \
         --css=style.css \
         -f markdown \
         -t html \
         -o "site/${name}.html" \
         "$md"
  echo "built site/${name}.html"
done

cp assets/style.css site/style.css
echo "copied site/style.css"
echo "done"
