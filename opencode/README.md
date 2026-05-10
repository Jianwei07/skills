# Jayden OpenCode Adapter

Purpose: thin OpenCode runtime layer for the shared skills repo.

Keep source of truth in `skills/`. Do not copy the harness into project repos.

## Pieces

- `command/` — slash-command wrappers. Cheap routing only; no workflow logic.
- `agents/` — four role prompts used by commands when a role boundary earns the cost.
- `opencode.json` — minimal OpenCode defaults.
- `skills/` — reserved for OpenCode-only skills; normally empty.

Commands do not auto-run each other. They load an agent + prompt the shared skill. Manual gates still apply.

## Agent Roles

```text
jayden-planner   map/pivot/direction/grill/plan/check; never executes
jayden-builder   explicit execute only; scoped implementation + quality gates
jayden-reviewer  review/verify after changes
jayden-debugger  reproduce/root-cause/fix bugs
```

Do not create one agent per GSD step. Steps are sequential workflow state, not separate workers.

## Main Commands

```text
/jayden-workflow   entry/router
/gsd-map           map repo
/gsd-pivot         stale/dead project direction
/gsd-plan          draft plan; stop
/gsd-check         pre-exec check; stop
/gsd-execute       explicit approved execution only
/verify            verify result
/review            review changed files
/gsd-debug         debug loop
```

Other commands are aliases/helpers (`/caveman`, `/grill-me`, `/grill`, `/tdd`, etc.). Keep them thin or remove. `/grill-me` is plain no-file grilling; `/grill` is the docs-aware `grill-with-docs` flow.

## Install

From repo root:

```bash
./scripts/install-opencode.sh
```

Then restart OpenCode.
