# STATUS.md — Free Culture & Outdoors Directory

Date: 2026-11-07

## What was built

A static HTML directory of free and low-cost ways to see culture and the outdoors in the US, built from Markdown sources:

- `site/index.html` — landing page with the 60-second version and links to all five sections.
- `site/library-passes.html` — library museum-pass lending programs (incl. Culture Pass NYC, Discover & Go; examples: Boston BPL, Kansas City).
- `site/national-parks.html` — the official 2026 NPS fee-free-day list (8 dates, US-resident policy change noted) plus BLM/FWS/Forest Service/USACE dates, all sourced from official pages.
- `site/state-parks.html` — state free-day model, full 2026 Washington State free-pass-day table as a worked example, plus seven other state programs with official links and the two-step lookup method for any state.
- `site/free-museums.html` — Museums for All (SNAP/EBT, 1,600+ museums, $5-or-less, up to 4 people), Smithsonian free admission, Blue Star Museums, Museums on Us, individual free-day patterns (Art Institute of Chicago, Met pay-what-you-wish), and always-free honorable mentions.
- `site/eligibility-passes.html` — Every Kid Outdoors (4th graders), America the Beautiful free passes (Military Annual, Gold Star Family lifetime, Access, Volunteer), senior passes for context, and an honest teacher section (NPS Teacher-Ranger-Teacher, classroom field trips, Exploratorium free-admission example for CA teachers).

Properties: system fonts only, no JavaScript, no analytics, no accounts, all external links point to official `.gov`/organization sites; page-level template with shared header/nav/footer. Distinct positioning from the sibling projects: covers eligibility-based and event-based free access (not age-based senior discounts, not read-aloud resources).

## How to run

- View without building: open `site/index.html` in a browser.
- Serve locally: `python3 -m http.server 8000 --directory site` → http://localhost:8000
- Rebuild from Markdown (requires pandoc): `./build.sh`

## Verification results

- `./build.sh` completes with no errors; six HTML pages plus stylesheet generated.
- HTML structure verified programmatically: all 6 pages have balanced tags, no leftover unrendered Markdown markup (`**`, `$title$`, stray backticks), matching `<title>` metadata per page.
- Internal-link check: every internal `href` resolves to an existing page in `site/`; stylesheet link resolves.
- Local HTTP smoke test: `python3 -m http.server` served all six pages and the stylesheet with HTTP 200.
- External link check (curl): 36 unique official URLs. Confirmed reachable (200): NPS fee-free page, Recreation.gov fee-free article, museums4all.org, everykidoutdoors.gov, store.usgs.gov/pass, arts.gov Blue Star page, parks.{ca,ny,wa}.gov, tpwd.texas.gov, dnr.mn.us, dcr.virginia.gov, mostateparks.com, bpl.org, kclibrary.org, culturepass.org, bankofamerica Museums on Us, va.gov VetRec, and others. Two dead/wrong links found during verification were fixed (theculturepass.org → culturepass.org; dead Exploratorium educator-membership URL → live Exploratorium-for-Educators page).
- URLs that returned 403/405/429 to automated requests (freelibrary.org, artic.edu, nga.gov, si.edu, metmuseum.org) are bot-protection and rate-limiting responses, not dead links — these are well-known, real pages (for example, museums4all.org and si.edu/visit return 200 with a browser-like GET).

## Known gaps

- External-link check was snapshot-based (2026-11-07). Free-day calendars, pass prices, and program rosters change often; users should still confirm on the official pages (the site itself says this).
- Library pass programs and state park free days are inherently local; the site gives verified examples (Washington full table, seven other states) plus a lookup method rather than an exhaustive 50-state list.
- Content sources: web research for the 2026 NPS fee-free days and Museums for All details; other figures (program sizes, address-standard examples) reflect commonly documented published information and official page statements at build time.
- Pandoc wraps prose at ~72 columns in HTML source (cosmetic only; rendering is unaffected), and smart quotes/apostrophes are used in output (intentional).
- No favicon and no RSS feed yet — both are easy additions if wanted.

## Housekeeping

- Git initialized in the project folder; single commit with all files. No remote configured; nothing pushed or published (per instructions).
- `LICENSE`: MIT with the exact line `Copyright (c) 2026 Asdale Dynamics, LLC`.
- `README.md`: usage, rebuild instructions, and credit to Asdale Dynamics, LLC.
