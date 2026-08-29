---
name: wiki-ingest
description: Ingest a raw/ entry or notes/ source into curated wiki/ pages, creating or updating them with source backlinks. Use for /wiki-ingest, a named raw path, or requests to ingest, file, or turn source material into wiki knowledge. Not for quick captures (use wiki-capture) or read-only questions (use wiki-query).
---

Read `AGENTS.md` first if you haven't already this session (Wiki Domain, Style & Formatting, the two `raw/` lanes). Read `wiki/index.md` before writing anything.

## 1. Locate the source

- If given a specific path (`raw/YYYY/YYYY-MM-DD.md#HH:MM`, `raw/notes/YYYY-MM-DD-source-title.md`), read exactly that.
- If given a vague reference ("today's note about X", a bare topic name), search both `raw/` lanes - today's/recent daily log files and `raw/notes/` - and confirm what you found before proceeding.
- `raw/foundation.md` is the foundation manifest, not an ingestible source. Use `wiki-bootstrap` to process the files it lists.
- Do not crawl unrelated raw files or follow links embedded in a saved source. If a limited request reveals additional candidate files, list them and wait for confirmation before including them.
- Never modify the source file itself.
- If the source references local images (typically `raw/assets/...`, see `raw/notes/README.md` > Images and attachments), view them separately before writing anything that depends on visual content - reading the markdown text alone doesn't reliably convey what's in a diagram or screenshot.
- For a PDF, treat the PDF as canonical. Use the built-in PDF reader, supplement with layout-aware extraction when available, and inspect rendered pages when diagrams, tables, or annotations carry meaning.

## 2. Classify the source (use these signals, in this order)

1. `url`/`source` field and its host/path (official docs, man pages, `docs.*` domains carry more weight than a blog).
2. Page shape (spec/reference structure vs. narrative/opinion).
3. Title or `site` field - weak signal alone.
4. Which `raw/` folder it's in - weakest signal; a blog clipped into `notes/` is still a blog, an official doc doesn't need to be moved.

Assign a rough confidence per claim you extract (optional but recommended - see AGENTS.md > Optional Patterns > Confidence tagging):

- `established` - official docs/spec, current behavior.
- `reported` - blog, tutorial, vendor claim, or "docs" that are really marketing.
- `inferred` - your own synthesis, not stated outright by any source.
- `contested` - sources disagree; note the contradiction explicitly.

## 3. Choose an intake posture

Three postures -- encode them as scope, not as a mode switch. Default is **full**; use **lite** when triaging, **ultra** when hygiene matters (template). User can name a posture, otherwise pick full:

- **lite** -- file the claim; name the lazier option ("this could stay a `raw/` note").
- **full** -- update or create the minimum pages; skip extra types and tools.
- **ultra** -- default to **No material** unless the source changes a page you would actually query later.

## 4. Find or create the target page

- Search the full `wiki/` for the source's key concepts and synonyms, not only `index.md`. Update existing pages rather than creating near-duplicates.
- Before writing, decide the category: **New**, **Update**, **Disputed**, or **No material**. These may combine except No material, which is exclusive.
- List the pages that would be created or materially updated. If there are more than three, ask the user to approve that scope first.
- If the source adds no new knowledge, or posture is **ultra** and the source does not change what you would query later, leave it in `raw/`, append a `No material` entry to `wiki/log.md`, and stop.
- If creating a new page, use `wiki/_template.md`, lowercase hyphen-separated filename.

## 5. Write the page

- Write a clear, concise, evergreen version - don't copy-paste the raw text.
- Apply every rule in `AGENTS.md` > Style & Formatting: normalize curly quotes/apostrophes and HTML entities to straight ASCII, write the page in English regardless of the source's language (translate fully and note the source language in `## Sources`), use `-` list markers, and preserve minimal frontmatter field order. Never apply these normalizations or translation to the `raw/` source itself.
- Before writing an exact number, date, or direct quote, locate it in a linked raw source. If it cannot be found, omit the precision or identify it as an inference.
- Preserve a cumulative `## Sources` list with one raw backlink per source. Never replace earlier source references.
- Set frontmatter `date` to today's date whenever sourced content changes materially.
- Add reciprocal links among affected pages during the ingest when the relationship is genuine.
- If this contradicts something already on another wiki page, note the contradiction explicitly on both pages and consider filing `wiki/open-questions.md` if it's unresolved.

## 6. Update the hub files

- Add or update a one-line entry for the page in `wiki/index.md`, appended to the end of the relevant section (never prepended).
- Append a dated entry to the bottom of `wiki/log.md` (newest last, never prepend or reorder): `## [YYYY-MM-DD] ingest | raw/<path> + main changes`. Keep the body concise; when it covers several distinct changes, list them as `-` bullets, one per change.
- If a gap or contradiction surfaced that you couldn't resolve, add a dated entry to `wiki/open-questions.md` instead of guessing.

## Resource limits

- Analyze the source and affected pages before editing, but keep this within the same ingest turn rather than invoking a second LLM pass.
- Extract the source's material claims and their evidence before drafting wiki prose.
- Read only the candidate pages found through the index and lexical search.
- If a source does not fit in the context, say so and process it in smaller parts, one after another; never silently cut it off.

## Ingesting many sources at once

Process multiple files one at a time in the active primary agent session rather than loading their raw content together: read one, write or update its pages and hubs, then move to the next. Never delegate steps or spawn subagents (no Task-tool use, no additional agent sessions) to handle parts of the batch. For a large batch, ask the user to split or confirm the sequential run.

## Rules

- Prefer a surgical edit to an existing page over a full rewrite.
- Don't touch `raw/`.
- Don't invent a parallel wiki structure - check `AGENTS.md` Wiki Domain scope; if the content doesn't fit, say so instead of filing it anyway.

## Done

Report the disposition, source, pages created or updated, and whether `index.md`, `log.md`, or `open-questions.md` changed.
