# raw/notes/

The second `raw/` capture lane: anything that already has a **title and/or an external source**, as opposed to the quick, untitled captures that go into the daily log (`raw/YYYY/YYYY-MM-DD.md` - see `../README.md`).

## What goes here

- Articles clipped with the [Obsidian Web Clipper](https://obsidian.md/clipper) browser extension - point it at this folder and it writes directly here.
- A saved PDF or spec. Keep the original PDF when it is the canonical source; conversion to Markdown is optional and must not replace it.
- A chat export from another tool - see `_chat-export-prompt.md` for a reusable prompt that turns an old chatbot thread into a clean note.
- A personal note substantial enough to deserve its own file (not just a line in today's log).

## Filenames and frontmatter

- Filename = `YYYY-MM-DD-slug.md`, where the date is **when you clipped or captured it**, not necessarily the source's publish date (e.g. `2026-08-26-the-history-of-cgroups-v2.md`).
- Obsidian Web Clipper's actual default is to name the file after the raw page title, word for word (spaces, punctuation, capitalization intact, no date). That doesn't match this convention - plan on a quick rename right after clipping if you want the date prefix and a clean slug.
- No fixed frontmatter schema here - keep whatever a clipper tool provides. Obsidian Web Clipper typically writes `title`, `source`/`url`, `published`, `clipped`, `tags`. Don't force these into the minimal `title`/`date`/`tags` schema used elsewhere in this repo; just don't strip fields that are already there. The same flexibility applies to chat-export notes produced via `_chat-export-prompt.md` (they carry `source`, `chatbot`, `date-approx`, `created`, `tags` instead).
- If you're writing a note here by hand (not via a clipper), a simple `title`, `date`, `tags` frontmatter is fine.

## Images and attachments (optional)

If a clipped article's images matter (diagrams, screenshots, charts - not just decorative), download them locally instead of relying on remote URLs that can break:

- In Obsidian, set **Settings → Files and links → Attachment folder path** to a fixed directory, e.g. `raw/assets/`.
- In **Settings → Hotkeys**, bind "Download attachments for current file" to a key combo. After clipping, press it and every image referenced in that note gets pulled to `raw/assets/` and re-linked locally.
- When ingesting a note with local images, view the referenced images separately before writing conclusions that depend on visual content - an agent can't reliably process inline markdown images and surrounding text in a single pass. Read the text first, then look at the image(s) it references.

## PDF handling

- Use the built-in PDF reader for semantic extraction. If Poppler is installed, supplement it with `pdfinfo`, `pdftotext -layout`, and `pdftoppm` for metadata, layout-aware text, and rendered-page inspection.
- Prefer the PDF as the canonical source when text extraction and visual layout differ; diagrams, tables, and annotations may encode relationships that plain text cannot preserve.

## Rules

- Same append-only spirit as the daily log: once a file is here, don't rewrite or delete it. If a clipped source turns out to be wrong or outdated, note that on the `wiki/` page it was ingested into, or in `wiki/open-questions.md` - not by editing the file here.
- Never move or rename a file here to "fix" its classification (e.g. an official doc that a clipper filed alongside opinion pieces). Classify by reading the content (`url`, title, body), not by which folder it is in - see the `wiki-ingest` skill.
- Untranslated/non-English sources are fine here - translation into the wiki's stated language (see `AGENTS.md` > Language) happens on `/wiki-ingest`, not before.

## How it gets ingested

Run `/wiki-ingest <path or topic>` to have the agent integrate a file into `wiki/`, or `/wiki-review` to see what has accumulated here without being ingested.
