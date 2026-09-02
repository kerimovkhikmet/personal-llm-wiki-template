# Prompt: digest a long video or audio source via NotebookLM

Use **NotebookLM** (Google) to turn a long video or audio source - a podcast episode, lecture, talk, or panel - into a compact, timestamped Markdown note for this wiki. The transcript (often 50-100k tokens for a long episode) never enters the repo; the agent reads the digest instead (~1-2k tokens per hour of source, roughly a 90% token saving, and it makes video/audio ingestable at all).

Then save the result as `raw/notes/YYYY-MM-DD-digest-<slug>.md` (date = today, when you saved it - not the publish date) and run `/wiki-ingest` on it.

**Do not** paste the raw transcript into this repo. The digest is model output about a source: skim it before saving, fix or drop anything that looks wrong, and treat its claims as `reported`-tier at ingest time (exact numbers, dates, and quotes only from the timestamped verbatim marks - see `raw/notes/README.md`).

## Short source (about 2 hours or less): one pass

Add the source to a new NotebookLM notebook, then paste this into the chat:

```text
Create a digest note of THIS source for my personal wiki. I will save your reply as a file. Output Markdown only. No preamble.

Rules:
- Do not invent. If something was not covered, write "not covered" instead of guessing.
- Every claim and quote must carry its timestamp (HH:MM or HH:MM:SS).
- Mark verbatim quotes clearly and keep them short. Paraphrase everything else.
- Answer in English even if the source is in another language; do not translate quotes into a different meaning.
- Max ~800 words. Prefer bullets.

Use this structure exactly:

---
title: "<5-10 word title>"
source: "<canonical URL or 'local file'>"
tool: notebooklm
duration: "<HH:MM:SS or unknown>"
date: "<today, YYYY-MM-DD>"
tags: [digest]
---

# <same title>

## Summary
- Up to 5 bullets, one line each.

## Key claims
- <claim> (<HH:MM>)
- ...

## Verbatim quotes
- "<quote>" - <speaker> (<HH:MM>)
- ...

## Timeline
- <HH:MM> - <what happens / topic starts>

## Open questions
- ...

## Not covered
- Topics I might expect that this source does not address.
```

## Long source (more than 2 hours): three passes, one note

A single "summarize everything" pass over a 3-6 hour episode compresses unevenly and loses the middle. Use the same notebook, run these prompts in order, and assemble the note yourself. Aim for roughly 600-800 digest words per hour of source.

**Pass 1 - map:**

```text
List the chapters or topic segments of THIS source in order. For each: a short title, its start timestamp (HH:MM:SS), who is speaking or featured, and one line on what it covers. Output as a Markdown list. Do not summarize content beyond one line per segment.
```

**Pass 2 - mine (repeat once per chapter):**

```text
Work through the segment from <HH:MM:SS> to <HH:MM:SS> only. For that segment list:
- Key claims, each with its timestamp.
- Short verbatim quotes worth keeping, each with its timestamp and speaker.
- Anything contradicted elsewhere in the source (note where).
Do not invent. If the segment is not covered or the timestamps are unclear, say so.
```

**Pass 3 - close:**

```text
Across THIS source as a whole, list:
- Open questions the speakers raised but did not answer.
- Contradictions between speakers or between segments.
- Expected topics that were not covered.
One line each, with timestamps where they apply.
```

**Assemble the note yourself** with this shape:

```markdown
---
title: "<5-10 word title>"
source: "<canonical URL or 'local file'>"
tool: notebooklm
duration: "<HH:MM:SS or unknown>"
date: "<today, YYYY-MM-DD>"
tags: [digest]
---

# <same title>

## Chapter - <HH:MM:SS> <chapter title>
- <claims with timestamps>
- "<verbatim quote>" - <speaker> (<HH:MM:SS>)

## Chapter - ...

## Open questions
- ...

## Not covered
- ...
```

One note per episode. The `## Chapter - HH:MM` sections let `/wiki-ingest` process and cite chapters independently, so several wiki pages can backlink different parts of the same digest.

## Practical notes

- Prefer adding the source by YouTube URL; NotebookLM's audio upload cap can reject a 3-6 hour MP3. For RSS-only podcasts, split the audio into hour-block files or upload an existing transcript as the source instead.
- NotebookLM's per-source and per-notebook limits change over time; check the current limits in the product rather than relying on numbers here.
- Auto-captions on niche or non-English audio can be low quality; the digest inherits those errors. Note anything suspicious under `## Open questions` before saving.
- If you have your own takeaways, append them under a `## My annotations` section - kept separate from the model output by design.

After saving the file, run `/wiki-ingest raw/notes/YYYY-MM-DD-digest-<slug>.md` (or `/wiki-review` to see the backlog). Never apply wiki-side normalization to the digest afterwards; it is an append-only raw source like any other.
