# Jayden's OpenCode Kit

This directory is the OpenCode-specific part of the repo.

It intentionally stays small:

- `command/` contains thin slash-command wrappers.
- `opencode.json` keeps OpenCode lean and skill-first.
- `agents/` is reserved for custom agents, but should stay empty unless an agent earns its keep.
- `skills/` is reserved for OpenCode-only skills that should not live in the shared `skills/` tree.

Run `../scripts/install-opencode.sh` from this repo to sync the kit into your global OpenCode config.
