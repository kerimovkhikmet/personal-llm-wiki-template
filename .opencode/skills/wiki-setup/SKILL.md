---
name: wiki-setup
description: Configure a new wiki instance's Wiki Domain in AGENTS.md. Use for /wiki-setup, first-time template setup, or requests to define or change the wiki's topic, included scope, and exclusions. Preserve existing workflows and OpenCode configuration.
---

Read `AGENTS.md`, `wiki/index.md`, and `wiki/log.md` first.

## Required input

Collect these three fields:

- **Topic:** a short description of the wiki's central subject.
- **Scope:** the subjects, practices, or source types that belong in the wiki.
- **Out of scope:** adjacent material that should not be filed here.

And one optional field:

- **English level:** how the wiki's English should read. Options: `plain` (default - plain, simple English that a non-native speaker can read easily), `standard` (clear, neutral English with common words), or `technical` (technical English for expert readers). If the user does not give one, keep the current level.

If any field is missing or ambiguous, ask for all missing details in one concise question. Do not infer a broad scope from the repository name alone.

Also verify that both bundled canonical files still exist:

- `raw/notes/2026-08-26-llm-wiki.md`
- `wiki/llm-maintained-personal-wikis.md`

They are permanent. Never delete, rename, or rewrite them, and never offer to remove them. When this wiki is used locally, the source note is the source of truth for the wiki methodology.

## Procedure

1. Replace only the corresponding values in `AGENTS.md` > Wiki Domain, and write the chosen English level into the `English level` bullet in `AGENTS.md` > Style & Formatting.
2. Preserve the domain-change re-review rule and every workflow, source, language, style, layout, and tooling rule outside those values and the level bullet.
3. Do not modify `opencode.jsonc`, commands, skills, raw sources, or topic pages. The bundled seed source and its derived page are permanent - never delete, rename, or rewrite them.
4. Search `wiki/index.md` for other existing pages that appear clearly outside the new domain. Report them for review; do not move, rewrite, or delete them.
5. Append a concise dated `structure` entry to the bottom of `wiki/log.md` recording the domain configuration. Do not claim that other existing content was reviewed unless it actually was.
6. Run the setup end-to-end in the active primary agent session; never delegate or spawn subagents (no Task-tool delegation, no additional agent sessions).

## Rules

- Keep the wording specific enough to make ingestion decisions predictable.
- Leave the English level at its current value if the user does not specify one.
- Do not create a taxonomy or page-type folders during setup.
- Do not run OpenCode's `/init`; this repository already has a canonical `AGENTS.md`.
- Do not broaden the requested change into README rewriting unless the user explicitly asks for it.
- The bundled seed source `raw/notes/2026-08-26-llm-wiki.md` and its derived page `wiki/llm-maintained-personal-wikis.md` are permanent. When this wiki is used locally, the seed is the source of truth for the wiki methodology; never delete, rename, or rewrite it.
- After retargeting to a genuinely different topic, the preserved seed page `wiki/llm-maintained-personal-wikis.md` is out of the new domain. Keep it, but recommend the owner group it separately in `wiki/index.md` (for example under an explicit "About this wiki / Methodology" heading) so it stays referenceable without feeding domain ingestion decisions. Do not delete, rewrite, or re-file it during setup, and only move or rename it with the owner's explicit approval as a normal `wiki-ingest` edit.

## Done

Report the configured topic, scope, exclusions, and English level; confirm the bundled seed source and its derived page are preserved; and list any existing pages that may need review, including how the out-of-domain seed page should be kept grouped in `wiki/index.md`.
