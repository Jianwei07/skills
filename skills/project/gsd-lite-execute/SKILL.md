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
- `.planning/current/PLAN.md` quality gates section
- `.planning/current/DECISIONS.md` when present
- `.planning/codebase/STRUCTURE.md`
- `.planning/codebase/CONVENTIONS.md`
- `.planning/codebase/CONCERNS.md`

## Outputs

- Updated `.planning/current/TODO.md`
- Updated `.planning/current/HANDOFF.md`
- Changed source files

## Commit Checkpoints

Execution is a sequence of small working commits, not one giant dirty tree.

Principles:

- Fowler rule: each refactor step should be small enough that the program can still work after it.
- Matt rule: slice by Module/Interface/Seam and preserve locality. Do not mix unrelated seams in one checkpoint.
- GSD rule: each checkpoint has objective, files, verification, and done criteria.
- Caveman rule: commit messages are terse; why only when non-obvious.

Before editing:

```text
Pre-execute checkpoint:
- branch: <name>
- base: <sha or upstream>
- existing changed paths: <count>
- commit state: clean | dirty
- planned checkpoints: <count or missing>
```

Stop before editing if the tree is dirty unless the dirty files are explicitly part of the approved plan.

Checkpoint loop:

```text
1. Pick next planned checkpoint.
2. Edit only files in that checkpoint unless a blocker requires a small adjacent change.
3. Run the checkpoint's verification, or explain why only final verification is safe.
4. Inspect `git status --short` and `git diff --stat`.
5. If coherent and verified, draft a `caveman-commit` message.
6. Ask user whether to commit/checkpoint before continuing unless they explicitly allowed auto-commit checkpoints.
```

Hard stops:

- Changed paths exceed ~10 before a checkpoint.
- Diff mixes unrelated work kinds: planning docs + tooling + feature + tests + cleanup.
- New unplanned library, persistence model, breaking Interface, or major Seam shift.
- PR creation/push requested by momentum instead of explicit user instruction.

Suggested checkpoint shapes:

```text
1. docs(plan): project/planning docs only
2. build(test): minimal quality/tooling setup only
3. feat(<module>): one Module/Interface change
4. test(<module>): behavior tests for that Interface
5. refactor(<module>): cleanup behind stable Interface
```

If execution discovers the plan lacks checkpoints, stop and add checkpoint slices to `PLAN.md` / `TODO.md` before continuing.

## Rules

- Refuse execution if user has not explicitly commanded it after check.
- Start with a pre-execute checkpoint (`git status --short --branch`, base sha/upstream, changed path count, dirty/clean state, planned checkpoint count).
- Execute only planned tasks and current checkpoint files.
- Use existing package manager and tooling: respect lockfiles (`pnpm-lock.yaml`, `package-lock.json`, `uv.lock`, etc.); do not switch tools casually.
- If quality tooling is missing, add minimal dev tooling/scripts first and document why.
- Put all new tests under `tests/`; update root `TESTS.md` when tests become non-trivial.
- Remove duplicate/bloated tests during refactor; keep behavior coverage through public Interfaces.
- Follow map placement/style/testing guidance.
- Stop for unplanned new library, persistence model, breaking Interface, or major Seam shift.
- Auto-fix direct correctness/security blockers caused by task.
- Do not fix unrelated pre-existing failures.
