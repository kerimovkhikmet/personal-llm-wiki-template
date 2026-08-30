---
title: LLM-Maintained Personal Wikis
date: 2026-08-26
tags: [llm, knowledge-management, personal-wiki]
---

An LLM-maintained personal wiki is a knowledge base that an agent builds up over time from a set of raw source files. The agent compiles knowledge as sources arrive, instead of re-combining the raw files for every question. This way summaries, links, contradictions, and earlier conclusions can build up and stay current.

> Methodology -- this page is the template methodology, derived from `[[raw/notes/2026-08-26-llm-wiki.md]]` (Karpathy gist). It is exempt from the Wiki Domain, lives under `## About this wiki / Methodology` in `wiki/index.md`, and is present in every instance. Never delete it and never report it as out-of-domain.

## Core model

A common approach today is retrieval-augmented generation (RAG): the system keeps the raw files, searches them for relevant parts on each question, and builds an answer from scratch every time. In the wiki model, the agent instead reads each new source and integrates it into long-lived topic pages. A later question can start from what is already written instead of re-finding every connection in the original files.

The source describes three layers:

- **Raw sources:** source documents chosen by the human. They are immutable - the agent reads them but never changes them.
- **Wiki:** agent-maintained Markdown pages containing summaries, concepts, comparisons, and cross-references.
- **Schema:** repository instructions that define structure, conventions, and maintenance workflows.

## Operating loop

- **Ingest:** read one new source, decide which pages it significantly affects, update or create those pages, keep the links up to date, and record the operation.
- **Query:** find the relevant wiki pages, combine them into an answer with citations, and optionally save valuable new material back into the wiki.
- **Lint:** find contradictions, stale claims, broken links, orphan pages, and missing topics. This template exposes the operation as `/wiki-lint`.

`index.md` gives a content-oriented map for navigation and retrieval. `log.md` gives a chronological record of important wiki operations.

## Responsibilities

The human curates sources, sets the domain and priorities, reviews important changes, and asks questions. The agent does the recurring bookkeeping: writing summaries, filing new material, cross-linking pages, tracking contradictions, and general maintenance.

## Progressive tooling

Plain Markdown, an index, lexical search, and wikilinks are enough at small and moderate scale. Add search engines, embeddings, richer page types, and additional output formats only after the simpler setup stops meeting a real need.

The source presents this as a design pattern and an implementation proposal, not as a proven replacement for every retrieval system.

## Sources

- [[raw/notes/2026-08-26-llm-wiki]]
