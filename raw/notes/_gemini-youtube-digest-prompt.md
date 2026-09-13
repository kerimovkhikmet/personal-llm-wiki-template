# Prompt: digest a video via Gemini

Use **Gemini** (Google) to turn a video into a compact, timestamped Markdown digest for this wiki. Paste the video URL and the prompt in the same message; Gemini reads the video itself (audio and on-screen content, plus captions where they exist). As with any external model, the transcript never enters the repo - the agent reads the digest instead (typically ~1-2k tokens per hour of video, so a multi-hour source stays cheap to ingest).

Two modes, one note per video:

- **One-shot** - videos of about 2 hours or less. One message, one reply.
- **Three passes** - videos longer than about 2 hours. A single pass compresses unevenly and loses the middle, so map the video, mine it chapter by chapter, then close.

Save the reply as `raw/notes/YYYY-MM-DD-digest-<slug>.md` (date = today, when you saved it - not the publish date) and run `/wiki-ingest` on it.

**Do not** paste the raw transcript into this repo. The digest is model output about a source: skim it before saving, fix or drop anything that looks wrong, and treat its claims as `reported`-tier at ingest time (exact numbers, dates, and quotes only from the timestamped verbatim marks - see `raw/notes/README.md`).

## Mode 1: one-shot (about 2 hours or less)

Paste the video URL and this prompt in one message:

```text
Create a digest note of THIS video for my personal wiki. I will save your reply as a file. Output Markdown only. No preamble.

Rules:
- Analyze the video itself - its audio and on-screen content - not just the title, description, or comments.
- Cover the ENTIRE video from start to finish, in order. Do not skip the middle and do not stop early.
- Every claim and quote must carry its timestamp (HH:MM or HH:MM:SS).
- Mark verbatim quotes clearly and keep them short. Paraphrase everything else.
- Do not invent. If something was not covered, write "not covered" instead of guessing.
- Answer in English even if the source is in another language; do not translate quotes into a different meaning.
- Max ~800 words. Prefer bullets.

Use this structure exactly:

---
title: "<5-10 word title>"
source: "<canonical URL or 'local file'>"
tool: gemini
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
- ...

## Open questions
- ...

## Not covered
- Topics I might expect that this source does not address.
- Any span of the video you could not cover, with its timestamp range (e.g. "18:00-24:00 not covered").
```

## Mode 2: three passes, one note (over about 2 hours)

Run these in order in the same chat, then assemble the note yourself. Aim for roughly 600-800 digest words per hour of video.

**Pass 1 - map:**

```text
List the chapters or topic segments of THIS video in order. For each: a short title, its start timestamp (HH:MM:SS), who is speaking or featured, and one line on what it covers. Output as a Markdown list. Do not summarize content beyond one line per segment.
```

**Pass 2 - mine (repeat once per chapter):**

```text
Work through the segment from <HH:MM:SS> to <HH:MM:SS> only. For that segment list:
- Key claims, each with its timestamp.
- Short verbatim quotes worth keeping, each with its timestamp and speaker.
- Anything contradicted elsewhere in the video (note where).
Do not invent. If the segment is not covered or the timestamps are unclear, say so.
```

**Pass 3 - close:**

```text
Across THIS video as a whole, list:
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
tool: gemini
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

One note per video. The `## Chapter - HH:MM` sections let `/wiki-ingest` process and cite chapters independently, so several wiki pages can backlink different parts of the same digest.

## Practical notes

- Paste the URL and the prompt in one message. Do not send the prompt first, and do not ask for a summary before running it - that wastes the one shot.
- The video should be public or unlisted. Private, age-restricted, or members-only videos usually fail; if the URL does not load, upload the video or a transcript file instead and keep the prompt the same. Gemini can also read a local video or audio file directly.
- Auto-captions on niche or non-English audio can be low quality, and the digest inherits those errors. Note anything suspicious under `## Open questions` before saving.
- In one-shot mode, always read the `## Not covered` line and spot-check the middle of the video against the Timeline - the failure mode is silent compression of the middle.
- Gemini's video and file limits change over time; check the current limits in the product rather than relying on numbers here.
- If you have your own takeaways, append them under a `## My annotations` section - kept separate from the model output by design.

After saving the file, run `/wiki-ingest raw/notes/YYYY-MM-DD-digest-<slug>.md` (or `/wiki-review` to see the backlog). Never apply wiki-side normalization to the digest afterwards; it is an append-only raw source like any other.
