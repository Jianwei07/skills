# Jayden's OpenCode Kit

This directory is the OpenCode-specific part of the repo.

It intentionally stays small:

- `command/` contains thin slash-command wrappers.
- `opencode.json` keeps OpenCode lean and skill-first.
- `agents/` contains small Jayden Workflow agents when a role boundary earns its prompt cost.
- `skills/` is reserved for OpenCode-only skills that should not live in the shared `skills/` tree.

Install/sync strategy is still undecided. Use `../scripts/install-opencode.sh` only with temp env vars unless you intentionally want to update live OpenCode config.

Key Jayden Workflow commands:

```text
/jayden-workflow
/gsd-new-project
/gsd-pivot
/gsd-map
/gsd-plan
/gsd-check
/gsd-execute
/verify
```
