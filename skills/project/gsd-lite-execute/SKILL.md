---
name: gsd-lite-execute
description: Executes approved Jayden Workflow plans from `.planning/current/*` while following codebase maps and stop gates. Use only after gsd-lite-check passes or user explicitly overrides.
---

# GSD-Lite Execute

Objective: implement approved local todo with bounded autonomy.

Upstream:
- GSD execute-plan discipline.
- Jayden central-current artifact model.
- Matt seam/interface stop rules.

Read:
- Artifacts: `../../core/jayden-workflow/ARTIFACTS.md`
- Decision gates: `../../core/jayden-workflow/DECISION-GATES.md`
- Architecture terms: `../../core/jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- Execute contract: [EXECUTE-CONTRACT.md](EXECUTE-CONTRACT.md)

## Chain

```text
gsd-lite-check PASS -> gsd-lite-execute -> gsd-lite-verify
```

## Inputs

- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/DECISIONS.md`
- `.planning/codebase/STRUCTURE.md`
- `.planning/codebase/CONVENTIONS.md`
- `.planning/codebase/CONCERNS.md`

## Outputs

- Updated `.planning/current/TODO.md`
- Updated `.planning/current/HANDOFF.md`
- Changed source files

## Rules

- Execute only planned tasks.
- Follow map placement/style/testing guidance.
- Stop for unplanned new library, persistence model, breaking interface, or major seam shift.
- Auto-fix direct correctness/security blockers caused by task.
- Do not fix unrelated pre-existing failures.
