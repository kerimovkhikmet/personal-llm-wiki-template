---
name: wiki-link
description: Scan wiki/ for pages related to a given topic or page and add reciprocal [[wiki-link]] cross-references. Use for /wiki-link, after creating or updating a wiki page, or when asked to "link this up", "connect related pages", or "add backlinks". Not for creating new content - use wiki-ingest for that.
---

Read `wiki/index.md` first.

## Procedure

1. Read the target page and skim `wiki/index.md` (and other pages if needed) for topical overlap - shared tags, referenced concepts, related tools/subjects.
2. For each genuinely related page found, add or update a `## Related` section on the target page with a `[[wiki-link]]`.
3. Add a reciprocal `[[wiki-link]]` on the related page(s) back to the target page, if one isn't already there.
4. Don't force links that aren't a good fit just to have more of them - an empty or short `## Related` section is fine.

## Done

Report which pages were linked together. No changes to `wiki/index.md` or `wiki/log.md` are needed for pure linking unless a page was newly created in the process (in which case follow `wiki-ingest`'s hub-file step too). Perform the linking in this session; never delegate or spawn a subagent for it.
