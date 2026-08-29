---
name: wiki-discover
description: Work through a task or topic by finding your unknown unknowns before, during, and after the work. Use for /wiki-discover or requests to do a blind-spot pass, brainstorm, interview, collect references, make an implementation plan, keep implementation notes, or quiz yourself on what changed. Works as a thought partner to reduce unknowns and clarify what you really want to build or file.
---

Read `AGENTS.md` first if you haven't already this session (Wiki Domain, Style & Formatting, the two `raw/` lanes). Read `wiki/index.md` before proposing any page.

This workflow treats clear thinking as the skill. The better the model is, the more results are limited by how well the working problem is defined - the things that are assumed, the questions not yet asked, and what has not been considered at all. It works the same for a small local model and a frontier model; only the depth of the answers changes.

## The four quadrants

Break a problem into what you actually know:

- Known knowns - what you can already state.
- Known unknowns - what you know you have not figured out.
- Unknown knowns - what is so obvious you would never write it down, but you would recognize it if you saw it.
- Unknown unknowns - what you have not considered and did not know to ask about.

Most of the work below exists to shrink the second, third, and fourth quadrants before the cost of being wrong grows.

## Pre-implementation

Choose the step that matches where the user's unknowns sit. Act as a thought partner, so start by getting context about who the user is and what they already know about the problem.

- Blind-spot pass - use when the user expects many unknown unknowns (new area, unfamiliar work). Ask them to find and explain the questions they have not thought to ask, and to suggest how to prompt you better.
- Brainstorm and prototype - use when there are many unknown knowns the user only recognizes by seeing (design, layout, scope). Ask for several different directions or a cheap mock before touching the real thing. Verbalize criteria early; finding them during implementation is more expensive.
- Interview - use when brainstorming still leaves ambiguity. Interview the user one question at a time, prioritizing questions whose answers would change the architecture or the approach.
- References - use when the user cannot describe what they want precisely. Point at source code, a component, a design, or a spec they like and tell them what to look for. Source code and other structured artifacts carry far more detail than a screenshot.
- Implementation plan - use when the user is almost ready to build. Lead with the parts most likely to change (data models, interfaces, anything user-facing) and keep the mechanical parts brief.

## During implementation

- Implementation notes - keep a temporary notes file. If an edge case forces a deviation from the plan, take the conservative option, log the deviation, and continue.

## Post implementation

- Pitches and explainers - when the user needs buy-in, package the working result into a single artifact (spec, notes, demo) that a new reader can understand.
- Quizzes - to be sure the user actually understands what changed, explain the change with context and intuition, then quiz them on it. Have them review before they accept the work.

## Recording what was learned in this wiki

This wiki's purpose is to keep lasting knowledge, so discovered unknowns and decisions should not stay only in the session:

- A quick decision or observation goes to today's `raw/` log via `/wiki-capture`.
- Titled or external material goes to `raw/notes/` via `/wiki-ingest`.
- A durable concept or practice, once you have settled it, can become a curated `wiki/` page through `/wiki-ingest`.

## Rules

- Keep every step in the active primary session. Never delegate or spawn subagents, and never hand the reading, judgment, or edits to another session.
- Do not invent a parallel structure; the Wiki Domain in `AGENTS.md` still governs what belongs here.
- Do not modify `raw/`; only append captures through the approved workflows.
- Match the Style & Formatting rules in `AGENTS.md` when writing wiki content.

## Done

Report the unknowns you surfaced, the approach taken, and whether anything was captured to `raw/` or `wiki/` (and offer to do so if not).
