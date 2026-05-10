Skills are organized into bucket folders under `skills/`:

- `core/` — reusable operating principles and workflows to use by default
- `project/` — project execution, planning, debugging, reviewing, and shipping workflows
- `misc/` — useful but not yet curated enough for core/project
- `imported/` — copied/reference skills kept separate until reviewed and promoted
- `deprecated/` — old or superseded skills retained for reference

Every skill in `core/`, `project/`, or `misc/` must have a reference in the top-level `README.md` and an entry in `.claude-plugin/plugin.json`.
Skills in `imported/` and `deprecated/` must not appear in `.claude-plugin/plugin.json` unless explicitly promoted.

Each skill entry in the top-level `README.md` must link the skill name to its `SKILL.md`.

Each bucket folder has a `README.md` that lists every skill in the bucket with a one-line description, with the skill name linked to its `SKILL.md`.

Keep this repo minimal: prefer moving to `misc/`, `imported/`, or `deprecated/` over adding adapters or copying the full harness into project repos.
Project repos should only receive small local context files such as `AGENTS.md`, `CLAUDE.md`, or planning docs when needed.
