---
name: gsd-lite-execute
description: Executes explicitly approved Jayden Workflow plans from `.planning/current/*`. Use only after gsd-lite-check passes and the user separately commands execution.
---

# GSD-Lite Execute

Objective: implement approved local todo with bounded autonomy.

Upstream:
- GSD execute-plan discipline.
- Jayden manual gated workflow.
- Matt seam/interface stop rules.

Read:
- Artifacts: `../../core/jayden-workflow/ARTIFACTS.md`
- Decision gates: `../../core/jayden-workflow/DECISION-GATES.md`
- Architecture terms: `../../core/jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- Execute contract: [EXECUTE-CONTRACT.md](EXECUTE-CONTRACT.md)

## Chain

```text
gsd-lite-check PASS + explicit user execute command -> gsd-lite-execute -> gsd-lite-verify
```

Accepted execute phrases:

```text
execute current plan
execute the checked plan
/run execute
/execute current plan
```

Treat `/execute` as workflow phrase unless runtime provides a real command.

## Inputs

- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/HANDOFF.md` with `Check result: PASS`
- `.planning/current/DECISIONS.md` when present
- `.planning/codebase/STRUCTURE.md`
- `.planning/codebase/CONVENTIONS.md`
- `.planning/codebase/CONCERNS.md`

## Outputs

- Updated `.planning/current/TODO.md`
- Updated `.planning/current/HANDOFF.md`
- Changed source files

## Rules

- Refuse execution if user has not explicitly commanded it after check.
- Execute only planned tasks.
- Follow map placement/style/testing guidance.
- Stop for unplanned new library, persistence model, breaking Interface, or major Seam shift.
- Auto-fix direct correctness/security blockers caused by task.
- Do not fix unrelated pre-existing failures.
