# raw/

This is the **append-only capture log**, split into two lanes by content shape:

- **`YYYY/YYYY-MM-DD.md`** - optional quick, untitled captures created when you use `/wiki-capture` or create a file manually: a thought, a link, a quote, or something learned. This lane can remain empty.
- **`notes/`** - anything that already has a title and/or an external source: articles clipped with the [Obsidian Web Clipper](https://obsidian.md/clipper), saved PDFs or optional Markdown extractions, chat exports, or substantial personal notes. See `notes/README.md`.
- **`foundation.md`** - an optional ordered manifest of up to ten files from either source lane that should seed a new wiki through `/wiki-bootstrap`. It lists paths only and is not itself a source.

Use whichever fits. A passing thought can go in today's daily file; something you'd naturally give a title to, or that a browser clipper already titled, goes in `notes/`. Project configuration decisions belong in `AGENTS.md`, `README.md`, or `opencode.jsonc`, not in `raw/`.

## Rules

- **Never rewrite or delete past entries**, in either lane. If something turns out to be wrong or outdated, note that in a *new* entry (or correct it in the curated `wiki/` page instead) - don't edit history.
- `foundation.md` is the foundation manifest: a mutable control file containing source paths, not captured material, and an exception to the append-only rule. Bootstrap progress is tracked through wiki backlinks and `wiki/log.md`, not by editing this manifest.
- The bundled `notes/2026-08-26-llm-wiki.md` is a permanent canonical source: never delete, rename, or rewrite it. When the wiki is used locally, it is the source of truth for the wiki methodology.
- Minimal frontmatter for daily log files: `title`, `date`, `tags` - see `_template.md`. `notes/` files keep whatever frontmatter a clipper tool
  provides - see `notes/README.md`.

## How entries get here

- Daily log, manually: create/open today's file and append under a new `## HH:MM` heading.
- Daily log, via opencode: run `/wiki-capture <what you want to note>` and the agent will append it for you, creating the day's file from `_template.md` if needed.
- `notes/`: drop a file in directly (Obsidian Clipper can write here automatically), or via opencode with a manual note.
- Foundation manifest: add up to ten existing raw source paths under `foundation.md` > Sources, then run `/wiki-bootstrap`.

## What happens next

Entries sit here until they're worth ingesting into the curated wiki (see `/wiki-ingest` and `../wiki/README.md`), or until a periodic `/wiki-review` shows them for a decision. Not everything needs to be ingested - some things are fine as historical log only.

See `_template.md` for the daily-log format.
