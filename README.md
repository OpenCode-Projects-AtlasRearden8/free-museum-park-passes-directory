# Free Culture &amp; Outdoors Directory

A plain-English, ad-free directory of legitimately free and low-cost ways to see culture and the outdoors in the United States:

- **Library museum-pass programs** — borrow free admission like a book
- **National park free entrance days** — the official 2026 fee-free day list
- **State park free days** — verified examples plus the state-by-state lookup method
- **Free-museum programs** — Museums for All (SNAP/EBT), Smithsonian, Blue Star Museums, Museums on Us
- **Student, teacher, and military passes** — Every Kid Outdoors, America the Beautiful passes, Gold Star Family, Access Pass, and honest notes on teacher perks

Every entry includes what it is, who it's for (eligibility, stated honestly), and an official check-availability link. The site is static HTML built from Markdown, uses system fonts, includes no JavaScript, no accounts, no tracking, and no advertising.

## Run it

No build is required to view the site — open `site/index.html` in any browser. Or serve it locally:

```sh
python3 -m http.server 8000 --directory site
# then visit http://localhost:8000
```

## Rebuild from Markdown

Requires [pandoc](https://pandoc.org):

```sh
./build.sh
```

This converts `content/*.md` into `site/*.html` using the shared `template.html` and copies `assets/style.css` into `site/`.

## Structure

```
content/        Markdown source (editable)
template.html   Pandoc HTML template (header/nav/footer)
assets/         Stylesheet source
site/           Generated static site (safe to serve as-is)
build.sh        Pandoc build script
```

## License

MIT — see [LICENSE](LICENSE). Copyright (c) 2026 Asdale Dynamics, LLC.

Published by [Asdale Dynamics, LLC](https://dylanasdale.github.io/) — beginner-friendly, plain-English guides and tools. This directory is independent, unaffiliated with any museum, park agency, or bank, and earns nothing from its links.
