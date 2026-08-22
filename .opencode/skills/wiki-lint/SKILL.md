---
name: wiki-lint
description: Read-only semantic wiki lint - orphan pages, broken or empty [[wiki-links]], index drift, duplicate topics, contradictions, stale claims, and missing concepts. Use for /wiki-lint or requests to health-check or lint the wiki. Not for Markdown syntax checks (use markdownlint), raw backlog review (use wiki-review), or creating and editing pages (use wiki-ingest).
---

Read `wiki/index.md`, `wiki/log.md`, and `wiki/open-questions.md` first. Don't open network tools - this is a check against what's already in the repo, not a fact-check against the web.

## Check

- **Orphan pages** - topic pages with no entry in `index.md`, or isolated pages despite the existence of genuinely related topic pages. Exclude `README.md`, `_template.md`, `index.md`, `log.md`, and `open-questions.md`.
- **Broken or empty `[[wiki-links]]`** - a link target that doesn't exist as a file, or a `## Related` section that's just the empty template comment. Ignore wikilinks inside HTML comments, templates, and other documentation examples.
- **Missing from index** - a page exists but has no row in `wiki/index.md`, or `index.md` has a row pointing at a page that no longer exists.
- **Duplicate/near-duplicate topics** - two pages covering essentially the same thing that should probably be merged.
- **Contradictions not filed** - two pages disagree on a claim but neither notes it, and it's not tracked in `wiki/open-questions.md`.
- **Stale claims** - a page states something that a *newer* `raw/` source (dated after the page's `date` frontmatter) appears to contradict or update, but the page hasn't been revisited.
- **Concepts mentioned but never given a page** - a term referenced on several pages as if it were a `[[wiki-link]]`, but no such page exists, and it looks substantial enough to deserve one.
- **`wiki/open-questions.md` entries that could now be resolved** - a gap was filed, and a `raw/` source that would resolve it has since appeared.
- **Source links** - every topic page has a non-empty `## Sources` section, every listed raw target exists, and earlier sources were not dropped during an update.
- **High-signal grounding** - exact numbers, dates, and direct quotes can be found in at least one linked raw source. Treat matches as mechanical evidence checks, not proof that the surrounding interpretation is correct.
- **Formatting drift** - curly quotes, HTML entities, or `*`/`+` list markers that slipped into a `wiki/` page (see `AGENTS.md` > Style & Formatting).

## Output

A simple list only: `path | problem | suggested action`. Separate clear-cut hygiene findings from judgment-based findings, and group by page when useful.

## Rules

- **Do not edit any file.** Report only.
- Do not change `wiki/index.md`, `wiki/log.md`, or `wiki/open-questions.md`.
- Wait for the user to say "fix these" (or name specific items) before making any changes - then treat each fix as a normal `wiki-ingest` or `wiki-link` edit, with its own hub-file updates.
