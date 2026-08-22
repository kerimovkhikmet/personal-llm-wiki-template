---
name: wiki-bootstrap
description: Seed a new wiki from up to ten raw sources listed in raw/foundation.md. Use for /wiki-bootstrap or requests to ingest foundational sources. Process sources sequentially and require explicit approval before changing AGENTS.md.
---

Read `AGENTS.md`, `raw/foundation.md`, `wiki/index.md`, and `wiki/log.md` first. Follow every source-evaluation and writing rule in the `wiki-ingest` skill.

## Validate the manifest

- Read source paths only from list items under `raw/foundation.md` > Sources.
- Accept at most ten unique files, all located under `raw/` and distinct from `raw/foundation.md`.
- Require every listed path to exist. Report all invalid, duplicate, or missing entries together and stop before ingesting anything.
- Treat manifest order as ingestion order.
- Do not edit the manifest or any listed source.

## Bootstrap procedure

1. For each listed source, check exact raw backlinks and `wiki/log.md`. Skip and report sources already ingested.
2. Process each remaining source completely in the active primary agent session before opening the next one. Never delegate steps or spawn subagents (no Task-tool use, no additional agent sessions); do all reading, judgment, and edits in this session. Never load all source contents into context together.
3. Apply the `wiki-ingest` categories, source-linking rules, confidence handling, page-scope approval threshold, and hub-file updates to each source.
4. If a source does not fit in context, process bounded sections sequentially; never silently truncate it.
5. Continue past **No material** results after recording them as required by `wiki-ingest`. Stop and explain if a source cannot be read or safely interpreted.

## Domain refinements

- The current `AGENTS.md` Wiki Domain governs the entire bootstrap run.
- If foundational sources suggest a narrower, broader, or clearer domain, collect proposed changes while ingesting. Do not change `AGENTS.md` mid-run.
- After processing the manifest, show the exact proposed Topic, Scope, or Out of scope wording and explain why it follows from the sources.
- Change `AGENTS.md` only after the user explicitly approves the proposal. Preserve every non-domain rule and append a dated `structure` entry to `wiki/log.md`.
- If approval is not given, leave `AGENTS.md` unchanged; completed ingests remain valid under the domain used for the run.

## Done

Report sources ingested, skipped, classified as **No material**, or blocked; pages created or updated; hub-file changes; and any domain refinement awaiting approval.
