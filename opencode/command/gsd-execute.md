---
description: Execute an approved GSD-lite plan using map conventions
agent: gsd-lite-executor
argument-hint: "[plan file or pasted plan]"
---

Use `gsd-lite-executor`.

Execute approved plan. Read `.planning/current/PLAN.md`, `TODO.md`, `DECISIONS.md`, `QUESTIONS.md`, and `HANDOFF.md` when present.

Follow `.planning/codebase/STRUCTURE.md`, `CONVENTIONS.md`, and `CONCERNS.md` when present.

Rules:
- Auto-fix direct correctness/security blockers.
- Stop for architecture changes.
- Do not fix unrelated pre-existing failures.
- Report changed files, tests, deviations, blockers.
- Update `.planning/current/TODO.md` and `HANDOFF.md` when project state exists.

Style: structured terse caveman.

Plan:
$ARGUMENTS
