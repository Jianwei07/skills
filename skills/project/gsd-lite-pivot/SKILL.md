---
name: gsd-lite-pivot
description: High-level Jayden Workflow step for stale, dead, or wrong-direction projects. Produces a compact pivot direction and Direction Check before any plan or execution.
---

# GSD-Lite Pivot

Objective: old repo -> new direction -> explicit Direction Check. No execution.

Upstream:
- GSD map/plan gates.
- Matt deletion test and deepening vocabulary.
- `grill-me` for keep/delete and product direction decisions when needed.

Read:
- `../../core/jayden-workflow/META-PROMPTING.md`
- `../../core/jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- `../../core/jayden-workflow/DECISION-GATES.md`
- Pivot contract: [PIVOT-CONTRACT.md](PIVOT-CONTRACT.md)

## Chain

```text
map-codebase-architecture refresh/update -> gsd-lite-pivot -> Direction Check -> Grill Gate -> gsd-lite-plan -> gsd-lite-check -> STOP
```

If pivot involves architecture/refactor/debloat choices, insert:

```text
improve-codebase-architecture -> Grill Gate
```

before first-slice planning.

## Outputs

Write only what is useful now:

- `.planning/pivot/PIVOT.md`
- `.planning/PROJECT.md` when project intent changed
- `.planning/REQUIREMENTS.md` when requirements changed
- `.planning/ROADMAP.md` when roadmap changed
- `.planning/STATE.md`
- `.planning/current/QUESTIONS.md` only for unresolved execution questions

Do not write `.planning/current/PLAN.md` here unless the user explicitly requested pivot + plan in one pass.

## Direction Check

End pivot output with exactly one block:

```text
Direction Check: CONFIRMED | NEEDS_GRILL | BLOCKED
Chosen direction: <one line>
Why: <one line>
Main risk: <one line>
User confirmation needed: yes/no
```

Use:

- `CONFIRMED` when direction follows from user intent + repo facts.
- `NEEDS_GRILL` when uncertainty changes plan shape.
- `BLOCKED` when planning would be irresponsible without user input.

## Grill Gate

- If keep/delete, product direction, first-slice scope, Interface shape, or acceptance criteria changes plan shape -> run `grill-me` before plan.
- If uncertainty only affects later execution -> record in `.planning/current/QUESTIONS.md` and continue.
- Always record one gate line before plan:

```text
Grill Gate: NEEDED_AND_RAN | NEEDED_BUT_BLOCKED | SKIPPED_NOT_NEEDED
Reason: <one line>
```

## Rules

- Fresh or explicitly updated map is mandatory.
- User intent beats stale docs.
- Use deletion test for keep/delete boundaries.
- Preserve foundations that add leverage; delete blockers only with permission or plan approval.
- Do not execute.
- Do not spam repeated gate text.
