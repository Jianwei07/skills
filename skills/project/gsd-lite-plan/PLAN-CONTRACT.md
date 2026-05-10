# Plan Contract

## Required Inputs

- User goal or issue.
- `.planning/current/*` if present.
- `.planning/codebase/*` if present.
- Project instructions and project-local skills.
- Accepted decisions and deferred items.

## Process

1. Initialize context.
2. Normalize goal and mode.
3. Gate missing context:
   - brownfield without map -> recommend `/gsd-map`
   - pivot without fresh map -> block
   - unclear intent -> grill
4. Derive 3-7 must-haves goal-backward.
5. Identify Modules, Interfaces, Seams, Adapters touched.
6. Build tasks with files/action/verify/done.
7. Prefer interface-first order when new seams/contracts are introduced.
8. Check plan with `gsd-lite-check`.
9. Revise up to 3 times if checker returns fixable issues.

## PLAN.md Shape

```md
# Plan: <name>

## Objective
<what/why>

## Context
- <paths>

## Must-Haves
- <observable truth>

## Tasks
| Task | Files | Action | Verify | Done |
|---|---|---|---|---|

## Risks / Checkpoints
- <stop/gate>
```

## TODO.md Shape

```md
# TODO: <name>

- [ ] <task 1>
- [ ] <task 2>
```

## Plan Quality Bar

- All accepted decisions covered.
- Deferred items excluded.
- No vague task like "make it work".
- No placeholder/future-later scope cut.
- Every task has verification.
- Context cost sane: prefer 2-3 tasks per execution slice.
