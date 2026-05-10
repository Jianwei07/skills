---
name: gsd-lite-verify
description: Goal-backward verification for Jayden Workflow. Use after execution to prove the implementation achieved the promised outcome, not merely completed tasks.
---

# GSD-Lite Verify

Objective: prove outcome from goal backward.

Upstream:
- GSD verifier goal-backward method.
- Jayden central context.

Read:
- `../../core/jayden-workflow/ARTIFACTS.md`
- Verification contract: [VERIFY-CONTRACT.md](VERIFY-CONTRACT.md)

## Chain

```text
gsd-lite-execute -> gsd-lite-verify
```

## Inputs

- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/HANDOFF.md`
- `.planning/current/PLAN.md` quality gates section
- `TESTS.md` when present
- changed files
- acceptance criteria

## Output

- `.planning/current/VERIFY.md`

## Rules

- Do not trust summaries.
- Derive must-haves from goal.
- Check code exists, is substantive, wired, and data-backed.
- Run all applicable quality gates from plan: FE/BE lint, format check, typecheck, tests.
- Verify new tests live under `tests/`; if test set is non-trivial, verify `TESTS.md` documents coverage/gaps.
- Flag duplicate, implementation-coupled, or bloated tests as verification failures.
- Mark `UNCERTAIN` when only manual/browser validation can prove it.
