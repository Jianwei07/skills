# OpenCode Layer

This folder is Jayden's curated OpenCode layer on top of the skill library.

## Structure

- `opencode/command/` contains slash-command wrappers that make selected skills easy to invoke.
- `opencode/agents/` contains small custom agents only when a role boundary is worth the prompt cost.
- `opencode/opencode.json` is the lean global OpenCode config to sync into `~/.config/opencode/opencode.json`.
- `skills/` remains the source of truth for reusable skill instructions.
- `skills/jayden-workflow/` contains Jayden-owned GSD-lite and caveman extensions.

## Install

Install/sync strategy is still undecided. Do not run this against live tool directories unless you intentionally want to update local OpenCode config.

For testing only, use temp dirs:

```bash
OPENCODE_CONFIG_DIR=/private/tmp/opencode-test-config \
AGENTS_SKILLS_DIR=/private/tmp/opencode-test-agents-skills \
SKILLS_BACKUP_DIR=/private/tmp/opencode-test-backups \
./scripts/install-opencode.sh
```

The script:

1. Copies command wrappers into `~/.config/opencode/command/`.
2. Copies small custom agents into `~/.config/opencode/agents/`.
3. Backs up and copies `opencode/opencode.json`.
4. Links non-deprecated skills into `~/.agents/skills/`, which OpenCode discovers globally.

## Command Policy

Keep commands thin. A command should route to a skill, add a little intent, and pass `$ARGUMENTS`.

Skills should hold the workflow. Commands should make the workflow easy to call.

## Current Command Set

- `/diagnose` -> `diagnose`
- `/tdd` -> `tdd`
- `/grill` -> `grill-with-docs`
- `/grill-me` -> `grill-me`
- `/zoom-out` -> `zoom-out`
- `/refactor` -> `improve-codebase-architecture`
- `/to-prd` -> `to-prd`
- `/to-issues` -> `to-issues`
- `/caveman` -> `caveman`
- `/verify` -> `gsd-lite-verify` via `gsd-lite-verifier`
- `/review` -> `gsd-lite-review` via `gsd-lite-reviewer`
- `/gsd-map` -> `map-codebase-architecture` via `gsd-lite-mapper`
- `/gsd-plan` -> `gsd-lite-planner`, writing `.planning/current/PLAN.md` and `TODO.md`
- `/gsd-check` -> `gsd-lite-checker`, validating plan completeness before execution
- `/gsd-execute` -> `gsd-lite-executor`, following `.planning/current/*` and map conventions
- `/gsd-debug` -> `gsd-lite-debug` via `gsd-lite-debugger`
- `/caveman-commit` -> `caveman-commit`
- `/caveman-review` -> `caveman-review`
- `/caveman-compress` -> `caveman-compress`
- `/compress` -> `compress` legacy alias
- `/caveman-help` -> `caveman-help`

## Project Context

GSD-lite uses project-local `.planning/` as central context:

- `.planning/codebase/` from `/gsd-map`
- `.planning/current/PLAN.md` and `TODO.md` from `/gsd-plan`
- `.planning/current/HANDOFF.md` for compact cross-agent state
- `.planning/current/VERIFY.md` from `/verify`
- Optional `.planning/debug/`, `.planning/review/`, `.planning/research/`, `.planning/lint/`, `.planning/pr/`

Default non-trivial workflow: Plan -> Check -> Execute -> Verify.
