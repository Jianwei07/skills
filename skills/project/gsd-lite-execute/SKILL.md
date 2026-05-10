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

During execution, prevent giant diffs.

Before editing:

```text
Pre-execute checkpoint:
- branch: <name>
- existing changed paths: <count>
- commit state: clean | dirty
```

Rules:

- If the working tree is dirty before execution, stop and ask whether to checkpoint, stash, continue, or abort.
- After each coherent slice, inspect `git status --short` and `git diff --stat`.
- If changed paths exceed ~10, or changes cross unrelated seams (planning docs + tooling + feature + tests), stop for a checkpoint before continuing.
- Use `caveman-commit` to draft terse conventional commit messages for each checkpoint.
- Do not create PRs during execute. PR prep belongs after `gsd-lite-verify` and explicit user request.
- Prefer small commits that each pass applicable quality gates over one large mixed commit.

Suggested commit slices:

```text
1. planning docs only
2. tooling/quality setup only
3. feature/source change
4. tests/docs for that feature
5. cleanup/hardening
```

## Rules

- Refuse execution if user has not explicitly commanded it after check.
- Start with a pre-execute checkpoint (`git status --short --branch`, changed path count, dirty/clean state).
- Execute only planned tasks.
- Use existing package manager and tooling: respect lockfiles (`pnpm-lock.yaml`, `package-lock.json`, `uv.lock`, etc.); do not switch tools casually.
- If quality tooling is missing, add minimal dev tooling/scripts first and document why.
- Put all new tests under `tests/`; update root `TESTS.md` when tests become non-trivial.
- Remove duplicate/bloated tests during refactor; keep behavior coverage through public Interfaces.
- Follow map placement/style/testing guidance.
- Stop for unplanned new library, persistence model, breaking Interface, or major Seam shift.
- Auto-fix direct correctness/security blockers caused by task.
- Do not fix unrelated pre-existing failures.
