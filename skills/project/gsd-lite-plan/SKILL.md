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

Budget gate: do not enter `gsd-lite-plan` during broad discovery. Planning starts only after one direction/slice is selected by the user or clearly established by existing docs.

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
Commit checkpoints:
- Needed: yes | no
- Slice 1: <intent> | files: <paths/globs> | verify: <command or same as final>
- Slice 2: <intent> | files: <paths/globs> | verify: <command or same as final>
Execution gate: CLOSED
Awaiting user approval/revision.
```

If checkpoints are not needed, write `Needed: no — <reason>` and omit slices.

Do not print or recommend an execute command as the next step. Offer review choices instead:

```text
Next: approve plan | revise plan | grill this decision | stop
```

## Rules

- Plans are prompts. Executor should not guess.
- Do not create a plan from broad discovery alone. First ask for/select one direction or slice.
- Keep plan artifacts lean: only files, actions, verification, done criteria needed for the selected slice.
- Add commit checkpoints when a plan likely touches >10 paths, mixes seams, or includes more than one kind of work (planning docs, tooling, feature, tests, cleanup). Each checkpoint must leave the repo working, following Fowler's small-refactor rule.
- Checkpoint slices should be by intent and seam, not by arbitrary file count: planning docs, tooling setup, one Module/Interface change, tests for that Interface, cleanup.
- Do not include PR creation in plan/execute. PR prep starts only after `gsd-lite-verify` and explicit user request.
- Use goal-backward must-haves.
- Use exact files, actions, verification, done criteria.
- Use Module/Interface/Seam/Depth language for architecture choices.
- If ambiguity changes direction, Interface, keep/delete call, first-slice scope, design system, visual direction, provider/cost posture, irreversible action, or acceptance criteria -> run `grill-me` before plan.
- If ambiguity only affects later execution -> record in `.planning/current/QUESTIONS.md`; planning may continue.
- If user asks broad design/product direction questions, or if `DESIGN.md` exists and the plan changes UI/visual direction, load `design-md` and run one `grill-me` choice unless prior docs answer the decision clearly.
- If quality commands are missing, add a setup task before feature/refactor tasks; use existing package manager (`pnpm`/`npm`/`uv`/etc.) and minimal dev deps.
- Test tasks must create/update tests under `tests/` and update root `TESTS.md` when coverage is non-trivial.
- Ask one grill question at a time. If code inspection can answer it, inspect instead of asking.
- Do not execute.
- Do not imply execution approval.
- Do not recommend an execute command in the final planning/check response; say the gate is closed and ask whether to approve, revise, grill, or stop.
- No scope reduction. Split instead.
