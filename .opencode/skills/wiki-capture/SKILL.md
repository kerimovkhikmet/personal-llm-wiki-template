---
name: wiki-capture
description: Append a quick, untitled entry to today's raw/ daily log (raw/YYYY/YYYY-MM-DD.md). Use for /wiki-capture or requests like "note that...", "jot this down", or "add to today's log". Not for titled sources, articles, or clippings - those go in raw/notes/ (see wiki-ingest and raw/notes/README.md).
---

Read `AGENTS.md` first if you haven't already this session (Wiki Domain, `raw/` conventions).

## Procedure

1. Determine today's date and the corresponding path: `raw/YYYY/YYYY-MM-DD.md`.
2. If the year folder or day file doesn't exist yet, create it from `raw/_template.md`, filling in `title`/`date` in the frontmatter.
3. Append the given content under a new `## HH:MM` heading (24-hour, current local time), after any existing entries in the file.
4. Keep the wording close to the original - this is a fast, unfiltered capture, not a polished note. Only lightly clean up formatting (e.g. fix an obvious typo) if it doesn't change the meaning.

## Rules

- **Never edit or remove existing entries** in the file - only append.
- Perform the capture in this session; never delegate or spawn a subagent for it.
- Don't touch `wiki/` in this skill. Capturing is not ingesting.
- If the content already has a clear title and/or references an external source (a link, an article, a quote from a specific document), suggest `raw/notes/<YYYY-MM-DD>-<slug>.md` instead and ask before proceeding - don't silently redirect it.

## Done

Confirm which file was appended to and under which heading.
