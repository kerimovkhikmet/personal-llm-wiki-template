# wiki/

This is the **curated, evergreen reference**. Start with one flat file per topic: `wiki/<topic-slug>.md`.

## Rules

- Unlike `raw/`, pages here are *meant* to be rewritten and refined over time as your understanding improves.
- Use lowercase, hyphen-separated filenames (`kubernetes-networking.md`, not `Kubernetes Networking.md`).
- Minimal frontmatter per file: `title`, `date`, `tags` - see `_template.md`. `date` is the latest material curation date.
- Link between pages with `[[wiki-link]]` syntax (Obsidian-style), not relative markdown links - see "Obsidian compatibility" below.
- Preserve a cumulative `## Sources` list linking to every `raw/` entry a page was built from, and link sideways/forward to genuinely related wiki pages.
- Prefer updating an existing page over creating a near-duplicate topic page - search `wiki/` first.
- Every topic page needs a one-line entry in `index.md`, appended to the end of the relevant section; hub files do not. Structural or ingestion changes get a dated entry appended to the bottom of `log.md` (never prepended). Unresolved gaps/contradictions go in `open-questions.md`.
- Follow the quote-normalization and other formatting rules in the root `AGENTS.md` > Style & Formatting when writing or updating a page.

## Hub files

- **`index.md`** - read this first. Every page is listed here with a one-line summary; new rows are appended to the end of the relevant section.
- **`log.md`** - the wiki's own changelog (distinct from `raw/`'s daily log): one dated entry per ingest or structural change, appended at the bottom, newest last. Keep entries concise; use `-` bullets when an entry covers several changes.
- **`open-questions.md`** - dated log of contradictions and gaps found while ingesting or linking, so they don't get silently hidden; entries are appended, never prepended or deleted.

## How pages get here

- Manually: create a new file from `_template.md`.
- Via opencode: run `/wiki-ingest <reference to a raw entry or topic>` to integrate a raw capture into wiki pages, and `/wiki-link` to connect related pages. `/wiki-query` answers questions from the wiki, while `/wiki-lint` performs a read-only semantic health check.

## Obsidian compatibility

Open the repository root as the Obsidian vault so `[[raw/...]]` source links from wiki pages resolve - not the `wiki/` folder alone. The vault is named after the repo directory (for example `devops-wiki`), so multiple instantiated wikis stay distinguishable in Obsidian's switcher rather than all appearing as "wiki". To keep the graph view limited to curated pages, add a graph filter matching `path:wiki`. The template ships no `.obsidian/` configuration; Obsidian creates it locally on first open.

## Optional: page-type subfolders

A flat `wiki/` works well initially. If it becomes unwieldy, introduce shallow page-type folders that fit the actual content, such as `concepts/`, `entities/`, or `practices/`, and mirror those groups in `index.md`. Keep `index.md`, `log.md`, `open-questions.md`, `_template.md`, and this README at the root. See `AGENTS.md` > Optional Patterns > Page-type subfolders.
