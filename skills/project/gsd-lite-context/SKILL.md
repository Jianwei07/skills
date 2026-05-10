---
name: gsd-lite-context
description: Defines project-local `.planning/` as Jayden Workflow's central context spine. Use before planning, checking, executing, verifying, debugging, reviewing, pivoting, or starting new project work.
---

# GSD-Lite Context

Objective: one project-local source of truth for agent handoff.

Upstream:
- GSD persistent `.planning/` memory.
- Jayden central-current artifact model.

Read:
- Jayden artifacts: `../../core/jayden-workflow/ARTIFACTS.md`
- Decision gates: `../../core/jayden-workflow/DECISION-GATES.md`

## Contract

Minimum:

```text
.planning/
  current/
    PLAN.md
    TODO.md
    HANDOFF.md
  codebase/
  PROJECT.md
  STATE.md
```

Optional, create only when used:

```text
.planning/
  pivot/
  debug/
  review/
  research/
  lint/
  pr/
```

Active work lives in `.planning/current/*`.

## Rules

- Project-local only. No global state.
- Do not create empty folders or unused planning docs.
- Store facts, decisions, commands, evidence.
- Do not store transcript.
- Exact paths beat prose.
- Use `DECISIONS.md`, `QUESTIONS.md`, `HANDOFF.md` to avoid context rebuild.
- Structured terse caveman by default; clear prose for security/irreversible ambiguity.
