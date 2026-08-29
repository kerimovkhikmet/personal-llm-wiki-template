# Repository Instructions

This repository is a local-first, Markdown-based personal LLM wiki.

## Wiki Domain

- **Topic:** LLM-managed personal knowledge systems.
- **Scope:** Architecture, workflows, source tracking, curation, retrieval, maintenance, and the tools and practices that directly support them.
- **Out of scope:** Unrelated application code, general AI news, and material without a clear connection to the topic.
- If this domain changes, rerun `/wiki-review` over prior **No material** decisions and revisit related entries in `wiki/open-questions.md`; previously excluded sources may have become relevant.

## Start Here

- Read `wiki/index.md` first, then skim `wiki/log.md` before changing anything.
- Treat this startup reading as context preparation. It must not replace or broaden the workflow the user explicitly requested.
- Treat this file as the canonical contract. Detailed procedures are in `.opencode/skills/*/SKILL.md`; slash commands in `.opencode/command/` dispatch to those skills.
- Run every wiki workflow from start to finish in the active primary agent session. Never delegate or spawn subagents: no Task-tool delegation, no additional agent sessions, and no handing off of reading, judgment, or edits to another agent. All steps stay in this session.
- Search existing wiki pages before creating a topic. Do not invent a parallel structure or duplicate an existing page.

## Raw Sources

- `raw/` is append-only. Never rewrite, rename, or delete an existing raw file or entry; record corrections in a new entry or in `wiki/`.
- `raw/foundation.md` is the foundation manifest: a mutable control file that lists up to ten source paths, contains no source content, and is read by `/wiki-bootstrap`.
- `raw/notes/2026-08-26-llm-wiki.md` is a permanent canonical source: never delete, rename, or rewrite it or its derived page. When this wiki is used locally, it is the source of truth for the wiki methodology.
- Use `raw/YYYY/YYYY-MM-DD.md` for quick, untitled captures, appended under a new `## HH:MM` heading.
- Use `raw/notes/YYYY-MM-DD-<slug>.md` for titled or externally sourced material. Keep its original language and frontmatter.
- A capture sits in the daily log until it becomes substantial enough to promote to `raw/notes/` (titled or sourced) or to ingest directly into `wiki/`. Surface anything not yet ingested with `/wiki-review`; not every capture needs promoting.
- `/wiki-capture` appends to `raw/` only; it must not modify `wiki/`.
- `/wiki-bootstrap` reads foundation sources sequentially and never modifies them. It may propose Wiki Domain refinements, but changing `AGENTS.md` requires explicit approval.

## PDF Sources

- Treat PDFs in `raw/notes/` as immutable canonical sources. Use the built-in PDF reader for semantic extraction and, when available, `pdfinfo` for metadata, `pdftotext -layout` for layout-aware text, and `pdftoppm` for rendered pages.
- Inspect rendered pages when diagrams, visual hierarchy, tables, or annotations carry meaning that text extraction may lose.

## Curated Wiki

- `wiki/` is evergreen and English-only. Translate sources during ingestion, never in `raw/`.
- Use lowercase, hyphen-separated topic filenames and minimal frontmatter in the order `title`, `date`, `tags`.
- Preserve a cumulative `## Sources` section with `[[raw/...]]` backlinks. Use genuine `[[wiki-links]]` for related pages; do not force links.
- Every topic page must have a one-line entry in `wiki/index.md`, appended to the end of the relevant section (never prepended to the top). After an ingest or structural change, append the dated change to the bottom of `wiki/log.md` (never prepend or reorder), keeping the body concise and using `-` bullets, one per change, when it covers several changes; record unresolved gaps or contradictions in `wiki/open-questions.md` as appended entries - never prepend or delete existing ones.
- When ingesting, search for existing pages first, keep the `## Sources` backlinks, and ask before creating or significantly updating more than three topic pages.
- Only normalize wiki output: use ASCII quotes/apostrophes and `-` list markers. Do not reformat raw sources.

## Language

- Curated `wiki/` content is English-only. Raw sources retain their original language.
- Translate during ingestion and identify the source language in `## Sources` when it is not English.

## Style & Formatting

- English level: `plain` (default). Write wiki pages in plain, simple English that a non-native speaker can read easily. Set `standard` or `technical` via `/wiki-setup` if preferred.
- Write concise, evergreen prose instead of summaries that just mirror the source.
- Use ASCII quotes and apostrophes, decode HTML entities, and use `-` for unordered lists in `wiki/`.
- Keep frontmatter minimal and ordered as `title`, `date`, `tags`; do not apply these normalizations to `raw/`.
- Base exact numbers, dates, and direct quotes on a linked raw source. Mark uncertainty or contradictions instead of hiding them.

## Wiki Layout

- Keep topic pages flat in `wiki/` initially.
- Introduce shallow page-type folders only when real pages make the flat layout unwieldy. Choose types that fit this wiki's domain, such as `concepts/`, `entities/`, or `practices/`; do not copy a taxonomy speculatively.
- Keep `index.md`, `log.md`, `open-questions.md`, `README.md`, and `_template.md` at the `wiki/` root.
- Group `wiki/index.md` by the same page types when folders are introduced. Distinguish entities from ideas or practices derived from them.

## Optional Patterns

### Confidence tagging

Use claim labels such as `established`, `reported`, `inferred`, or `contested` only when source quality or disagreement significantly affects interpretation. Do not add labels mechanically to every sentence.

### Page-type subfolders

Stay flat until navigation becomes difficult. Add one shallow folder at a time, move only pages of that genuine type, update links and `wiki/index.md`, and record the change in `wiki/log.md`.

### Search tooling at scale

Use `wiki/index.md` and lexical search by default. Consider a local Markdown search tool only after the wiki reaches a size where measured retrieval failures justify the extra dependency; do not add embeddings or an MCP server before they are needed.

## Read-Only Workflows

- `/wiki-review` reports raw material not yet ingested, without edits.
- `/wiki-query` answers from existing wiki content and is read-only unless the user agrees to file new material.
- `/wiki-lint` reports semantic wiki hygiene issues without edits; wait for explicit approval before fixing findings.

## Local Setup and Checks

The default OpenCode model is local Ollama (`ollama/llm-wiki:4b`), with web access, formatters, and LSP disabled by `opencode.jsonc`.

```sh
ollama pull qwen3:4b
ollama create llm-wiki:4b -f ollama/Modelfile
opencode
npx -y markdownlint-cli "**/*.md"
```

The repository has no application build or test suite. Use the Markdown lint command for focused verification after documentation changes.
