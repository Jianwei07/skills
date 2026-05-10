---
name: setup-pre-commit
description: Set up minimal quality tooling and optional pre-commit hooks using the repo's existing package managers. Covers pnpm/npm frontend and uv/python backend lint, format, typecheck, and tests without switching tools or adding bloat.
---

# Setup Quality Tooling / Pre-Commit

Goal: standardize shortcuts so agents run the same checks and avoid deviated commits.

## Detect First

Do not switch package managers casually.

Frontend:

- `pnpm-lock.yaml` -> pnpm
- `package-lock.json` -> npm
- `yarn.lock` -> yarn
- `bun.lockb` / `bun.lock` -> bun

Backend:

- `uv.lock` or `[tool.uv]` -> uv
- `poetry.lock` -> poetry
- `pyproject.toml` -> inspect existing tool sections
- `requirements.txt` -> pip + existing commands

## Standard Scripts

Add only missing scripts that the repo can actually support.

Frontend `package.json` preferred names:

```json
{
  "scripts": {
    "lint": "...",
    "format": "... --write",
    "format:check": "... --check",
    "typecheck": "tsc --noEmit",
    "test": "..."
  }
}
```

Python preferred commands:

```bash
uv run ruff check .
uv run ruff format --check .
uv run pyright .   # or basedpyright/mypy if project uses it
uv run pytest tests
```

If tooling missing, install minimal dev deps only. Examples:

```bash
pnpm add -D prettier eslint typescript vitest
npm install -D prettier eslint typescript vitest
uv add --dev ruff pytest pyright
```

Adapt to existing stack; do not add Vitest/Pyright if repo already uses another test/type tool.

## Pre-Commit Hooks

Optional after commands work.

JS frontend:

- Husky + lint-staged okay for JS repos.
- Keep staged formatting fast.
- Full slow tests can stay manual/CI.

Python/backend:

- `pre-commit` okay when Python tooling exists.
- Prefer ruff format/check hooks.

Do not install hooks before commands pass manually.

## Agent Context

If repo has `AGENTS.md` or `CLAUDE.md`, add/update a compact block:

```md
## Quality Gates

Before committing code changes, run applicable checks:

- FE lint: `<command or N/A>`
- FE format check: `<command or N/A>`
- FE typecheck: `<command or N/A>`
- FE test: `<command or N/A>`
- BE lint: `<command or N/A>`
- BE format check: `<command or N/A>`
- BE typecheck: `<command or N/A>`
- BE test: `<command or N/A>`

Tests live under `tests/`. Update `TESTS.md` when coverage is non-trivial.
```

Create `AGENTS.md` only if repeated agent work needs it. Do not copy harness.

## Verify

- [ ] Existing package manager preserved.
- [ ] Minimal dev deps added only when needed.
- [ ] Standard lint/format/typecheck/test commands exist or are marked N/A.
- [ ] FE and BE commands documented in `AGENTS.md`/`CLAUDE.md` when present.
- [ ] Tests live under `tests/`.
- [ ] Root `TESTS.md` exists when test coverage is non-trivial.
- [ ] Optional pre-commit hook runs fast checks only.
