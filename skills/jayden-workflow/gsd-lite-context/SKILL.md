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
- Jayden artifacts: `../jayden-workflow/ARTIFACTS.md`
- Decision gates: `../jayden-workflow/DECISION-GATES.md`

## Contract

Core:

```text
.planning/
  codebase/
  current/
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
- Store facts, decisions, commands, evidence.
- Do not store transcript.
- Exact paths beat prose.
- Use `DECISIONS.md`, `QUESTIONS.md`, `HANDOFF.md` to avoid context rebuild.
- Structured terse caveman by default; clear prose for security/irreversible ambiguity.
