---
name: gsd-lite-plan
description: Creates decision-complete draft plans using Jayden Workflow gates, codebase maps, Matt architecture language, and explicit grill-gate status. Always stops after plan/check; execution requires a separate user command.
---

# GSD-Lite Plan

Objective: turn goal -> executable prompt-plan. Stop before execution.

Upstream:
- GSD `plan-phase` planner/checker loop.
- Matt architecture language and `improve-codebase-architecture`.
- Jayden `.planning/current/*` artifact model.

Read:
- Meta-prompt loop: `../../core/jayden-workflow/META-PROMPTING.md`
- Architecture terms: `../../core/jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- Artifacts: `../../core/jayden-workflow/ARTIFACTS.md`
- Plan contract: [PLAN-CONTRACT.md](PLAN-CONTRACT.md)

## Chain

```text
Direction Check -> Grill Gate -> gsd-lite-plan -> gsd-lite-check -> STOP
```

Architecture/refactor/debloat chain:

```text
map-codebase-architecture -> improve-codebase-architecture -> Direction Check -> Grill Gate -> gsd-lite-plan -> gsd-lite-check -> STOP
```

## Inputs

Before writing a plan, ensure:

```text
Direction Check: CONFIRMED | NEEDS_GRILL | BLOCKED
Grill Gate: NEEDED_AND_RAN | NEEDED_BUT_BLOCKED | SKIPPED_NOT_NEEDED
```

If missing, add them. If `NEEDS_GRILL`, run `grill-me` first. If `BLOCKED` or `NEEDED_BUT_BLOCKED`, write questions and stop.

## Outputs

- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/DECISIONS.md` only for durable accepted decisions
- `.planning/current/QUESTIONS.md` only when unresolved execution questions exist
- Quality gate commands for FE/BE, copied from `.planning/codebase/TESTING.md` or discovered from manifests

## Plan Footer

End `PLAN.md` with:

```text
Quality gates:
- FE lint: <command | N/A | MISSING>
- FE format check: <command | N/A | MISSING>
- FE typecheck: <command | N/A | MISSING>
- FE test: <command | N/A | MISSING>
- BE lint: <command | N/A | MISSING>
- BE format check: <command | N/A | MISSING>
- BE typecheck: <command | N/A | MISSING>
- BE test: <command | N/A | MISSING>
Tests policy: tests under tests/; update TESTS.md when non-trivial.
Execution gate: CLOSED
Execute only after explicit user command.
Suggested command: execute current plan
```

## Rules

- Plans are prompts. Executor should not guess.
- Use goal-backward must-haves.
- Use exact files, actions, verification, done criteria.
- Use Module/Interface/Seam/Depth language for architecture choices.
- If ambiguity changes direction, Interface, keep/delete call, first-slice scope, irreversible action, or acceptance criteria -> run `grill-me` before plan.
- If ambiguity only affects later execution -> record in `.planning/current/QUESTIONS.md`; planning may continue.
- If quality commands are missing, add a setup task before feature/refactor tasks; use existing package manager (`pnpm`/`npm`/`uv`/etc.) and minimal dev deps.
- Test tasks must create/update tests under `tests/` and update root `TESTS.md` when coverage is non-trivial.
- Ask one grill question at a time. If code inspection can answer it, inspect instead of asking.
- Do not execute.
- Do not imply execution approval.
- No scope reduction. Split instead.
