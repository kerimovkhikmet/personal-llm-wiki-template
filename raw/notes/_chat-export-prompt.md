# Prompt: summarize an old chatbot thread for this wiki

Use this in **any** other chatbot (web ChatGPT, Claude, Gemini, Grok, a corporate bot, etc.) - anywhere you have a conversation you want to turn into a note here, without pasting the whole transcript into this repo.

Then save the Markdown it emits as `raw/notes/YYYY-MM-DD-chat-<short-slug>.md` (date = today, when you're saving it - not when the original conversation happened) and run `/wiki-ingest` on it.

**Do not** paste the whole transcript into this repo. **Do not** leave tokens, passwords, internal URLs, ticket IDs, or other people's names in the output - the prompt below asks the other chatbot to redact these, but skim the result yourself before saving it.

## Prompt to copy

```text
Summarize THIS conversation as a personal note for my wiki. I will save your reply as a file. Output Markdown only. No preamble.

Rules:
- Do not quote long passages. Paraphrase.
- Do not invent. If something was unclear, write "unclear".
- Redact secrets, API keys, passwords, internal hostnames, ticket IDs, real names of other people, and private URLs. Replace with [REDACTED] or a generic label.
- Max ~800 words. Prefer bullets.
- If the thread mixed several topics, split into clearly headed sections.
- If I only pasted an excerpt, say so under Source.

Use this structure exactly:

---
title: "<5-10 word title>"
source: "chatbot-export"
chatbot: "<product name if known, else unknown>"
date-approx: "YYYY-MM-DD or unknown"
created: "<today>"
tags: [chat-export]
---

# <same title>

## What this thread was about
2-4 sentences.

## Claims and decisions
- Durable conclusions we reached (or I stated). One bullet each.

## Facts worth keeping
- Concrete mechanisms, commands, or designs - only if they appeared.
- Note if they might be outdated.

## Contradictions / I changed my mind
- ...

## Open questions I still had
- ...

## Relevance to <your wiki's topic - fill this in before pasting the prompt, based on AGENTS.md > Wiki Domain, e.g. "DevOps" or "Wellbeing">
- Only if something in the thread actually connects to that topic.

## Do not carry forward
- Small talk, failed approaches we discarded, one-off debugging noise.
```

If the other bot **cannot see** the thread (a fresh session, no memory of it), paste the prompt first, then a **trimmed** export or the last N messages. If the export is huge, do one topic per run rather than one giant note.

After saving the file, run `/wiki-ingest raw/notes/YYYY-MM-DD-chat-<slug>.md` (or just ask) to have it turned into `wiki/` pages - the informal leftover text (the "Do not carry forward" section) is meant to be dropped at that step, not carried into the wiki page.
