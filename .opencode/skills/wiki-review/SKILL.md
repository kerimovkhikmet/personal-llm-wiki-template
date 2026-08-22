---
name: wiki-review
description: Surface raw/ entries and raw/notes/ clippings not yet ingested into wiki/, without making edits. Use for /wiki-review or requests like "what hasn't been ingested yet", "review the backlog", or "what's new in raw/". Read-only - use wiki-ingest to act on findings.
---

Read `wiki/index.md` and `wiki/log.md` first, to know what's already been ingested.

## Scope

Default to all of `raw/` if no scope is given; otherwise respect a requested range (e.g. "last 7 days", "this month", a specific `raw/notes/` subset).

## Procedure

1. Read through the relevant daily log files (`raw/YYYY/YYYY-MM-DD.md`) and source files in `raw/notes/`, including Markdown and PDFs, in scope.
2. For each entry/file, check in this order: an exact `[[raw/...]]` backlink in a topic page, the exact raw path in `wiki/log.md`, then semantic overlap as an uncertain fallback.
3. Produce a short list of items not yet ingested, each with:
   - the raw source reference (file, and heading/time for daily-log entries)
   - a one-line summary
   - a suggestion: ingest into a new wiki page, fold into an existing page (name it), or leave as historical log (not wiki-worthy)

## Rules

- **Do not make any edits.** This skill only reports findings.
- Do not treat `raw/foundation.md` as a source; review the files it lists normally.
- Don't change `wiki/index.md`, `wiki/log.md`, or `wiki/open-questions.md`.
- After a Wiki Domain change, include sources previously logged as **No material** and unresolved questions whose relevance may have changed.
- Wait for the user to request specific sources for ingestion, via `/wiki-ingest` or plain language.
