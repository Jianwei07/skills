---
name: gsd-lite-context
description: Defines project-local `.planning/` as the central GSD-lite context spine. Use when planning, checking, executing, verifying, debugging, reviewing, researching, linting, or preparing PR work for a feature or bug fix.
---

# GSD-Lite Context

Objective: one project-local context spine. Agents read/write compact state instead of rebuilding context.

`.planning/` belongs to the target project. Never use global home dirs for project state.

## Contract

```text
.planning/
  codebase/        # `/gsd-map` output
  current/         # active feature/bugfix context
  debug/           # optional debug sessions
  research/        # optional research summaries
  review/          # optional review summaries
  lint/            # optional lint/format summaries
  pr/              # optional PR prep/cleanup summaries
```

## Current Context

Create/update `.planning/current/` for feature/bugfix work:

| File | Purpose |
|---|---|
| `PLAN.md` | decision-complete plan |
| `TODO.md` | local execution checklist |
| `DECISIONS.md` | accepted decisions, one line each |
| `QUESTIONS.md` | unresolved blockers/questions |
| `HANDOFF.md` | compact latest state for next agent |
| `VERIFY.md` | latest goal-backward verification summary |

## Workflow

Default: Plan -> Check -> Execute -> Verify.

- Plan: write `PLAN.md` + `TODO.md`.
- Check: validate plan completeness before execution.
- Execute: work from `TODO.md`, update progress + `HANDOFF.md`.
- Verify: compare result to must-haves, write `VERIFY.md`.

Tiny tasks may use `TODO.md` directly. If work spans turns, update `HANDOFF.md`.

## Rules

- Store facts, not transcript.
- Use exact paths, commands, evidence.
- Keep summaries compact.
- Detailed agent state goes in `.planning/<area>/`.
- Decoupled agents read `.planning/current/*` and write summary back.
- Do not edit Matt skill files.
- Structured terse caveman by default; use clear prose for security/irreversible ambiguity.

