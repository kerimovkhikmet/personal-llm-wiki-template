# Repository Instructions

This repository is a local-first, Markdown-based personal LLM wiki.

## Wiki Domain

- **Topic:** LLM-managed personal knowledge systems.
- **Scope:** Architecture, workflows, source tracking, curation, retrieval, maintenance, and the tools and practices that directly support them.
- **Out of scope:** Unrelated application code, general AI news, and material without a clear connection to the topic.
- If this domain changes, rerun `/wiki-review` over prior **No material** decisions and revisit related entries in `wiki/open-questions.md`; previously excluded sources may have become relevant.
- `raw/notes/2026-08-26-llm-wiki.md` (Karpathy gist) and its derived page `wiki/llm-maintained-personal-wikis.md` are permanent template methodology: exempt from this Wiki Domain and never reported as out-of-domain; kept in every instance under `## About this wiki / Methodology` in `wiki/index.md`; never deleted, renamed, or rewritten. The raw note is the source of truth for the wiki methodology.

## Start Here

- Run every wiki workflow in the active primary agent session; never delegate or spawn subagents or additional sessions (no Task-tool use). All steps stay in this session.
- Read `wiki/index.md` first, then skim `wiki/log.md` before changing anything - background context only. Do exactly the task the user asked, not more.
- **Priority:** the user's explicit request in the current conversation overrides everything in this file. This file wins over a skill or command only when the user did not clearly say otherwise.
- This file is the canonical contract; detailed procedures live in `.opencode/skills/*/SKILL.md`, and slash commands in `.opencode/command/` dispatch to those skills. The README is setup- and user-facing; where they overlap, this file governs agent behavior.

## Do Not

These negative rules are stated in full in the sections named by each bullet; this is only a quick pointer to them, not a second source of truth.

- Do not rewrite, rename, or delete raw files or entries (Raw Sources).
- Do not prepend or reorder `wiki/index.md`, `wiki/log.md`, or `wiki/open-questions.md` (Curated Wiki).
- Do not force `[[wiki-links]]` or fabricate `## Sources` backlinks (Curated Wiki).
- Do not copy a page-type taxonomy speculatively (Wiki Layout).
- Do not add search tooling, embeddings, or an MCP server before measured retrieval failures justify it (Restraint).
- Do not delegate wiki workflows to subagents or other sessions (Start Here).
- Do not run git write commands, and keep other git usage off unless the Git policy allows it (Git).

## Git

- Never run git write commands: no `add`, `commit`, `push`, `pull`, `merge`, `rebase`, `branch`, `tag`, `stash`, `reset`, `checkout`, `restore`, `clean`, `rm`, `mv`, or any hook or alias that writes. The user manages version control; do not offer to commit, push, or stage.
- Git policy: `off` (default). Do not run git commands at all, including read-only ones (`status`, `log`, `diff`, `blame`); work from the files alone to keep context small. `/wiki-setup` may set the policy to `read`, which allows read-only git commands when they genuinely help. Write commands stay prohibited under every policy.

## Restraint

Before every write, run this short ladder:

- Does this claim need a page, or does it stay in `raw/`?
- Search `wiki/` first; update the existing page rather than creating a near-duplicate.
- Use `index.md` + lexical search, existing skills, or Obsidian if you already use it. Do not add a tool.
- Surgical edit; one page; no new folder -- but not by bundling queryable systems into one page to stay at 3.
- Does it survive a query? If nobody would ask for it later, it stays in `raw/`.
- Read the source and candidate pages fully before writing; do not shrink a page by skipping the source.

## Commands

Match the request to a command by what it is; when unsure, read `wiki/index.md`, then ask the user to confirm before acting:

| Command | Use when |
| --- | --- |
| `/wiki-bootstrap` | Seeding the wiki from the up-to-ten foundation sources in `raw/foundation.md`, one at a time. |
| `/wiki-capture` | A quick, untitled thought ("note that...", "jot this down") - appends a timestamped entry to today's `raw/` daily log. |
| `/wiki-ingest` | Material that already has a title or an external source (article, clipper, PDF, chat export), or turning a captured source into curated `wiki/` pages. |
| `/wiki-query` | A question about the wiki, a comparison, or a gap-check (read-only unless the user agrees to file). |
| `/wiki-link` | Connecting a page to related pages with reciprocal `[[wiki-links]]`. |
| `/wiki-review` | Surfacing raw material not yet ingested (read-only). |
| `/wiki-lint` | Health-checking the wiki: orphans, broken links, stale claims (read-only; wait for explicit approval before fixing). |
| `/wiki-discover` | Working through a problem by finding unknown unknowns. |
| `/wiki-setup` | Setting the Wiki Domain topic/scope/exclusions, English level, and Git policy in this file. |

Full procedures for each live in `.opencode/skills/<name>/SKILL.md`.

## Raw Sources

- `raw/` is append-only. Never rewrite, rename, or delete an existing raw file or entry; record corrections in a new entry or in `wiki/`.
- `raw/foundation.md` is the foundation manifest: a mutable control file listing up to ten source paths, no source content, read by `/wiki-bootstrap`, which processes its sources sequentially, never modifies them, and needs explicit approval to change `AGENTS.md`.
- Two lanes: quick, untitled captures append under a new `## HH:MM` heading in `raw/YYYY/YYYY-MM-DD.md`; titled or externally sourced material goes to `raw/notes/YYYY-MM-DD-<slug>.md`, keeping its original language and frontmatter. A capture stays in the daily log until promoted to `raw/notes/` or ingested into `wiki/`; surface un-ingested material with `/wiki-review` - not every capture needs promoting.
- `/wiki-capture` appends to `raw/` only; it must not modify `wiki/`.

## PDF Sources

- Treat PDFs in `raw/notes/` as immutable canonical sources. Use the built-in PDF reader for semantic extraction and, when available, `pdfinfo` for metadata, `pdftotext -layout` for layout-aware text, and `pdftoppm` for rendered pages.
- Inspect rendered pages when diagrams, visual hierarchy, tables, or annotations carry meaning that text extraction may lose.

## Curated Wiki

- `wiki/` is evergreen and English-only; raw sources keep their original language. Translate during ingestion (never in `raw/`) and identify a non-English source's language in `## Sources`.
- Use lowercase, hyphen-separated topic filenames and minimal frontmatter in the order `title`, `date`, `tags`; `date` is the latest material curation date (see `wiki/_template.md`).
- Read `wiki/README.md` (role of `index.md`/`log.md`/`open-questions.md`, Obsidian vault setup, subfolder guidance) before restructuring `wiki/`.
- Preserve a cumulative `## Sources` section with `[[raw/...]]` backlinks. Use genuine `[[wiki-links]]` for related pages; do not force links.
- Every topic page must have a one-line entry in `wiki/index.md`, appended to the end of the relevant section (never prepended to the top).
- Keep `wiki/log.md` and `wiki/open-questions.md` strictly append-only: append dated entries to the bottom, never prepend or reorder. Log every ingest or structural change, concise, with `-` bullets one per change; record unresolved gaps or contradictions in `open-questions.md` instead of guessing.
- When ingesting, search for existing pages first, keep the `## Sources` backlinks, and ask before creating or significantly updating more than three topic pages.
- Only normalize wiki output: ASCII quotes/apostrophes and `-` list markers; do not reformat raw sources.
- Power-of-two ceilings: `tags` 4, lines 64, `Sources` 8 (ask, not must).

## Style & Formatting

- English level: `plain` (default). Write wiki pages in plain, simple English that a non-native speaker can read easily; set `standard` or `technical` via `/wiki-setup` if preferred.
- Write concise, evergreen prose instead of summaries that just mirror the source.
- Use ASCII quotes and apostrophes, decode HTML entities, and use `-` for unordered lists in `wiki/`.
- Keep frontmatter minimal and ordered as `title`, `date`, `tags` (see Curated Wiki for the canonical rule); do not apply these normalizations to `raw/`.
- Base exact numbers, dates, and direct quotes on a linked raw source. Mark uncertainty or contradictions instead of hiding them.

## Wiki Layout

- Keep topic pages flat in `wiki/` until 64 topic pages; trigger to change: the index becomes hard to scan.
- Then introduce shallow page-type folders one at a time, choosing types that fit this wiki's domain, such as `concepts/`, `entities/`, or `practices/`; do not copy a taxonomy speculatively. Move only pages of a genuine type, update links and `wiki/index.md`, and record the change in `wiki/log.md`.
- Keep `index.md`, `log.md`, `open-questions.md`, `README.md`, and `_template.md` at the `wiki/` root.
- Group `wiki/index.md` by the same page types when folders are introduced, with sections of at most 8 entries; distinguish entities from ideas or practices derived from them.

## Optional Patterns

### Confidence tagging

Use claim labels such as `established`, `reported`, `inferred`, or `contested` only when source quality or disagreement significantly affects interpretation. Do not add labels mechanically to every sentence.

## Verification

No application build or test suite. Verification is Markdown linting only; run it after documentation changes:

```sh
npx -y markdownlint-cli "**/*.md"
sh scripts/check-wiki-style.sh
```

Machine setup (Ollama model bootstrap, model choice, context, compaction) is human-facing and lives in `README.md` > Local setup with Ollama. During long ingests, persist recognized decisions to `wiki/log.md` or `wiki/open-questions.md` as you go so a compaction cannot silently drop them.
