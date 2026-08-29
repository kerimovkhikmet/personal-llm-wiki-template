[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner-direct-single.svg)](https://stand-with-ukraine.pp.ua/)

# Personal LLM Wiki Template

A local-first template for building a personal knowledge base with [OpenCode](https://opencode.ai) and [Ollama](https://ollama.com), based directly on [Andrej Karpathy's LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) as the source of both the concept and this implementation. It keeps immutable source material in `raw/` and lets a small local model turn it into a curated, evergreen wiki (evergreen = kept current and useful over time) without API fees.

## Contents

- [Philosophy](#philosophy)
- [Requirements](#requirements)
- [This is a template - instantiate it per topic](#this-is-a-template---instantiate-it-per-topic)
- [Quick start](#quick-start)
- [Workflow](#workflow)
- [Folder structure](#folder-structure)
- [Obsidian compatibility](#obsidian-compatibility)
- [Local setup with Ollama](#local-setup-with-ollama)
- [Optional cloud model](#optional-cloud-model)
- [Architecture: skills + thin commands](#architecture-skills--thin-commands)
- [Multi-tool support](#multi-tool-support)
- [Why the stack stays small](#why-the-stack-stays-small)
- [Markdown linting](#markdown-linting)
- [License](#license)

## Philosophy

Two folders, two different rules:

- **`raw/`** - an append-only source log, in two lanes: a daily file for quick, untitled thoughts (`raw/YYYY/YYYY-MM-DD.md`, via `/wiki-capture`), and `raw/notes/` for anything already titled or sourced - articles clipped with the [Obsidian Web Clipper](https://obsidian.md/clipper), saved PDFs, chat exports (see `raw/notes/_chat-export-prompt.md`). Captured material is immutable; the path-only foundation manifest is the sole exception. The bundled `raw/notes/2026-08-26-llm-wiki.md` is a permanent canonical source that is never removed, and is the source of truth for the wiki methodology when the wiki is used locally.
- **`wiki/`** - a curated reference. One markdown file per topic. Built from `raw/` entries, rewritten and refined over time, cross-linked with `[[wiki-links]]` so the wiki stays navigable instead of becoming a pile of orphaned pages. `wiki/index.md` is the entry point and `wiki/log.md` is its changelog.

The agent does the tedious part: reading through raw captures, spotting what's worth keeping, writing it up clearly, and linking it into the rest of the wiki. You do the interesting part: living your life and capturing things as they happen.

## Requirements

- **[OpenCode](https://opencode.ai/docs)** - required. This runs the setup/bootstrap/capture/ingest/link/review/query/lint/discover workflow.
- **[Ollama](https://ollama.com/download)** - the default local provider. Cloud users can use the optional profile below instead.
- **[Obsidian](https://obsidian.md)** - optional, for browsing `wiki/` with backlinks/graph view, and for the [Obsidian Web Clipper](https://obsidian.md/clipper) browser extension if you want one-click clipping into `raw/notes/`.
- **Node.js** - optional, only needed to run `markdownlint-cli` locally (see [Markdown linting](#markdown-linting)). Not required to use a wiki instance day to day.

## This is a template - instantiate it per topic

This repo is intentionally generic. **Don't turn it into one giant wiki for everything.** Instead, use it once per topic/domain - e.g. a `devops-wiki` repo and a separate `wellbeing-wiki` repo, each created from this template.

To start a new wiki:

1. Click **"Use this template"** on GitHub (or `gh repo create <your-username>/<new-wiki-name> --template <template-owner>/<template-repo> --private`).
2. Run `/wiki-setup` and provide the topic, included scope, and exclusions. This updates the **Wiki Domain** section in `AGENTS.md` without replacing the template's workflows or OpenCode configuration. The bundled LLM-wiki seed source and its derived page are permanent and are never removed; when the wiki is used locally, the seed is the source of truth for the wiki methodology. Do not run OpenCode's `/init`; this template already includes its canonical instructions. (`wiki/` is always English regardless of topic - see `AGENTS.md` > Language.)
3. (Optional) List up to ten seed sources in `raw/foundation.md` and run `/wiki-bootstrap` to ingest them sequentially. Bootstrap may propose domain refinements but requires approval before changing `AGENTS.md`.
4. (Optional) If you'll use [Obsidian Web Clipper](https://obsidian.md/clipper), point it at this repo's `raw/notes/` folder.
5. Start capturing.

## Quick start

1. Install [OpenCode](https://opencode.ai/docs). Install [Ollama](https://ollama.com/download) for the default local setup, or follow [Optional cloud model](#optional-cloud-model).
2. Create the local model by following [Local setup with Ollama](#local-setup-with-ollama), unless using the cloud profile.
3. Run `opencode` in this directory and try:
   - `/wiki-bootstrap` to seed it from the sources listed in `raw/foundation.md`
   - `/wiki-capture I just learned that ...`
   - `/wiki-discover` to find unknown unknowns before/during/after a task
   - `/wiki-ingest` to turn a raw entry or `raw/notes/` clipping into wiki pages
   - `/wiki-link` to connect a wiki page to related pages
   - `/wiki-lint` to health-check the wiki itself (orphans, broken links)
   - `/wiki-query` to query the wiki directly
   - `/wiki-review` to see what's been captured but not yet ingested
   - `/wiki-setup` to configure a new instance's topic, scope, and exclusions

## Workflow

1. **Set up** - configure a new instance's topic, included scope, and exclusions with `/wiki-setup`.
2. **Bootstrap** - optionally seed it from up to ten sources listed in `raw/foundation.md`, processed one at a time with `/wiki-bootstrap`.
3. **Capture** - new information goes into `raw/` first, fast and unfiltered: `/wiki-capture` for a quick thought, or drop a titled file into `raw/notes/` for anything clipped or already substantial.
4. **Ingest** - periodically (or immediately, if it's clearly valuable), integrate a raw entry or clipping into `wiki/`: either creating topic pages or updating existing ones. Use `/wiki-ingest`.
5. **Link** - after adding or updating a wiki page, make sure it's connected to related pages so the wiki stays navigable. Use `/wiki-link`.
6. **Review** - periodically check for raw entries/clippings not yet ingested. Use `/wiki-review`.
7. **Query** - ask the wiki for short summaries, comparisons, retrieval questions, or gap-checks without necessarily changing anything. Use `/wiki-query` or plain language.
8. **Lint** - periodically health-check the wiki itself for orphans, broken links, stale claims, and index/log drift. This is semantic, read-only linting; use `/wiki-lint`.

See `AGENTS.md` for the full set of conventions the agent follows (folder layout, frontmatter schema, `[[wiki-link]]` syntax, quote/formatting normalization, naming rules).

## Folder structure

```text
raw/YYYY/YYYY-MM-DD.md         # append-only daily capture log
raw/notes/YYYY-MM-DD-<slug>.md # titled clippings/sources (e.g. Obsidian Web Clipper)
raw/notes/<source>.pdf         # immutable canonical PDF source (optional)
raw/foundation.md              # optional ordered manifest of up to ten seed sources
ollama/Modelfile               # local Qwen3 4B model with a 16K context window
wiki/index.md                  # entry point: every topic page, one-line summary
wiki/log.md                    # the wiki's own changelog
wiki/open-questions.md         # unresolved gaps/contradictions
wiki/<topic-slug>.md           # curated, evergreen topic pages
```

See `raw/README.md`, `raw/notes/README.md`, and `wiki/README.md` for details, and `_template.md` in each folder for the frontmatter format. `raw/notes/_chat-export-prompt.md` has a reusable prompt for turning a thread from another chatbot into a note here.

## Obsidian compatibility

Open the repository root as an [Obsidian](https://obsidian.md) vault. This keeps `[[raw/...]]` source links from wiki pages resolvable while preserving the `raw/` and `wiki/` separation. The template doesn't ship an `.obsidian/` config; Obsidian generates its own on first open. Backlinks, outgoing links, graph view, and visible orphans are useful optional settings, but keep `.obsidian/` as local state rather than committing it.

Two optional Obsidian plugins worth knowing about, if useful for your workflow: **Dataview** (query wiki page frontmatter into dynamic tables/ lists - handy if you tag pages with `tags`/`date`) and **Marp** (turn wiki content into a slide deck). Neither is required.

At larger scale (hundreds of pages), `wiki/index.md` plus `grep`/`glob` may stop being fast enough - see `AGENTS.md` > Optional patterns > Search tooling at scale for a local-search-engine option.

## Local setup with Ollama

The default targets a machine with 16 GB of RAM or VRAM. It uses one Qwen3 4B model for normal and lightweight tasks, avoiding the memory overhead of keeping separate models resident.

1. Pull the base model:

   ```sh
   ollama pull qwen3:4b
   ```

2. Create the project model with a 16K context window:

   ```sh
   ollama create llm-wiki:4b -f ollama/Modelfile
   ```

3. Start OpenCode from the repository root:

   ```sh
   opencode
   ```

`opencode.jsonc` pins `ollama/llm-wiki:4b` as the default, disables sharing, web access, formatters, and language servers, and removes older tool results. This keeps the default operation fully local and limits context growth. Other providers can still be selected explicitly as described below. Small models are less reliable at combining information across many pages, so the ingestion workflow asks before significantly changing more than three topic pages.

The English level of generated wiki pages also depends on the model - a small local model tends to write simpler, plainer English, while larger or cloud models may use a richer vocabulary. The target level is `plain` by default (see `AGENTS.md` > Style & Formatting) and can be changed with `/wiki-setup`.

If 4B is not reliable enough and the machine has enough spare memory, change the `FROM` line in `ollama/Modelfile` to `qwen3:8b`, build it under a distinct tag, update both model fields in `opencode.jsonc`, and review latency and memory use before adopting it permanently.

## Optional cloud model

Users who prefer an OpenCode Zen model can select one explicitly. The local Ollama model remains the default, and no cloud request occurs unless you choose a cloud model.

1. Start OpenCode and run `/connect`.
2. Select **OpenCode Zen** and enter your Zen API key.
3. Run `/models` and confirm the current model ID.
4. Start OpenCode with the selected model:

   ```sh
   opencode -m opencode/<model-id>
   ```

For a complete cloud switch, also change `model` and `small_model` in `opencode.jsonc` to the same `opencode/<model-id>`. The project config intentionally does not restrict enabled providers, so explicit cloud selection works while the local model remains the default. It keeps web access disabled, but your prompts and any raw/wiki content included in the context are sent to the selected cloud provider. Use Ollama when the content must remain on the local machine.

OpenCode Zen is pay-as-you-go. Set a workspace monthly limit and review automatic balance reload settings before using it. The Zen usage display and account billing page may not update at the same time; use the billing page as the source of truth for charges.

## Architecture: skills + thin commands

Each workflow (setup, bootstrap, capture, ingest, link, review, query, lint, discover) is a full `.opencode/skills/<name>/SKILL.md` with the detailed procedure and rules. The slash commands in `.opencode/command/` are simple - a couple of lines that point at the matching skill. This means the same rules apply whether you type `/wiki-ingest` or just ask in plain language ("can you turn this into wiki pages?") - skills, unlike commands, are also loaded automatically when a plain request matches their description.

| Command           | Skill            | What it does                                                                      |
| ----------------- | ---------------- | --------------------------------------------------------------------------------- |
| `/wiki-bootstrap` | `wiki-bootstrap` | Ingest up to ten sources from the foundation manifest, one at a time.             |
| `/wiki-capture`   | `wiki-capture`   | Append a new timestamped entry to today's `raw/` daily log.                       |
| `/wiki-discover`  | `wiki-discover`  | Find unknown unknowns on a task before/during/after.                              |
| `/wiki-ingest`    | `wiki-ingest`    | Integrate a raw source into curated wiki pages with source backlinks.             |
| `/wiki-link`      | `wiki-link`      | Scan `wiki/` for related pages and add cross-links/backlinks.                     |
| `/wiki-lint`      | `wiki-lint`      | Semantically check wiki health: orphans, broken links, and stale claims.          |
| `/wiki-query`     | `wiki-query`     | Answer a question from the wiki, with citations and optional retrieval questions. |
| `/wiki-review`    | `wiki-review`    | Surface raw entries/clippings not yet ingested (read-only).                     |
| `/wiki-setup`     | `wiki-setup`     | Configure the domain; the bundled seed is kept as canonical material.             |

All nine commands run from start to finish in the active primary agent session. Delegating or spawning subagents (e.g. the Task tool, additional agent sessions) is prohibited - source discovery, judgment, approvals, and edits stay in one visible context so the wiki owner keeps control over what is read and changed. This also avoids divergent context, overlapping edits, and additional model requests, which keeps local Ollama runs predictable.

The commands and conventions above are documented for agents in `AGENTS.md`, including a request-routing guide (`Choosing a workflow`) and a compact command reference (`Commands at a glance`).

## Multi-tool support

`AGENTS.md` is the canonical contract, written to be tool-agnostic. If you also use other agent TUIs against this repo, `GEMINI.md` and `.github/copilot-instructions.md` are thin stubs that point Gemini CLI and GitHub Copilot back at `AGENTS.md` so conventions stay consistent regardless of which tool resumes a session. They're inert if you only use opencode.

## Why the stack stays small

The default uses plain Markdown, `wiki/index.md`, lexical search, and wikilinks. It deliberately omits embeddings, vector databases, MCP servers, background watchers, scheduled ingestion, graph-analysis services, and automatic commits. Add one only after a measured retrieval or workflow problem justifies its memory, installation, and maintenance cost.

## Markdown linting

`/wiki-lint` checks semantic wiki health, such as stale claims, missing source links, orphans, and broken wikilinks. It does not check Markdown syntax or formatting.

`.markdownlint.json` configures the separate `markdownlint-cli` formatting tool (long lines and inline HTML allowed, frontmatter doesn't need to be preceded by a heading, etc.). This tooling is optional and is not required to use a wiki instance day to day. To run it:

```sh
npx -y markdownlint-cli "**/*.md"
```

## License

[MIT](LICENSE) - use this template for any wiki you want, commercial or not. Derivative repositories must retain the existing copyright and permission notice; you may add your own copyright notice for your modifications.
