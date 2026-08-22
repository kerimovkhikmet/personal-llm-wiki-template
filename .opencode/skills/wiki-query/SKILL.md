---
name: wiki-query
description: Query the wiki for summaries, comparisons, retrieval practice, relationship mapping, or gap-checks against the Wiki Domain scope. Use for /wiki-query or questions like "what do I know about X", "quiz me on X", or "what am I missing on X". Read-only by default; only files new content back into the wiki if the user agrees.
---

Read `wiki/index.md` first. Search `wiki/` for the question's key terms and synonyms, then open only the small set of relevant pages. Consult `wiki/open-questions.md` if the topic has known gaps.

## Answer shape

1. A short summary in a few sentences.
2. Relationships between concepts, using `[[wiki-links]]` to the relevant pages.
3. Citations: which wiki page(s) this comes from, and the `raw/` source behind them when useful.
4. If this is clearly a learning/retrieval turn (not a quick factual lookup): 3-5 retrieval questions from different angles.
5. If relevant: a gap-check against the Wiki Domain scope in `AGENTS.md` or against `wiki/open-questions.md`.

## Guardrails

- If the wiki is silent or contradictory on something, say so plainly and point at `wiki/open-questions.md` - don't make up an answer from memory and present it as wiki content. If it's worth sourcing, tell the user which kind of file to drop into `raw/` or `raw/notes/`.
- Stay within the Wiki Domain scope; if asked something clearly off-topic for this instance, say so rather than answering as if it belonged.
- Prefer lexical search and existing wikilinks. Do not introduce embeddings or load the whole corpus unless retrieval has demonstrably stopped working at scale.

## Filing

If the answer brings up something worth keeping, offer to file it - but only act after the user agrees unless they already requested filing. A synthesis based entirely on existing wiki pages may cite those pages. New factual material or personal observations must enter `raw/` first and then follow `wiki-ingest`. Valuable query answers - an analysis, a comparison, a connection - can be filed back into the wiki as new pages so explorations compound in the knowledge base just like ingested sources do; use `wiki-ingest` for that.
