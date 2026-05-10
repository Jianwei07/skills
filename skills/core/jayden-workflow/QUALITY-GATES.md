# Quality Gates

Purpose: stop useless deviated commits. Every project workflow should discover, standardize, run, and record quality checks before commit.

## Package Manager Policy

Detect and follow existing lockfiles. Do not switch package managers casually.

Frontend / JS:

| Lockfile | Manager | Run prefix |
|---|---|---|
| `pnpm-lock.yaml` | `pnpm` | `pnpm` |
| `package-lock.json` | `npm` | `npm run` |
| `yarn.lock` | `yarn` | `yarn` |
| `bun.lockb` / `bun.lock` | `bun` | `bun run` |

Python / backend:

| File | Tool |
|---|---|
| `uv.lock` or `[tool.uv]` | `uv` |
| `poetry.lock` | `poetry` |
| `pyproject.toml` only | inspect scripts/tool sections |
| `requirements.txt` only | `python -m pip` + existing commands |

Rules:

- Do not add pnpm/npm/uv tooling if the repo already has equivalent commands.
- Do not add large frameworks just to satisfy a generic checklist.
- If standard scripts are missing, plan the smallest package/config addition first.
- Prefer dev-only dependencies for lint/format/test tooling.

## Standard Commands

Use or create these names when practical:

Frontend:

```text
lint
format
format:check
typecheck
test
```

Backend:

```text
lint
format
format:check
typecheck
test
```

Python examples:

```bash
uv run ruff check .
uv run ruff format --check .
uv run basedpyright .   # or pyright/mypy if project uses it
uv run pytest tests
```

JS examples:

```bash
pnpm lint
pnpm format:check
pnpm typecheck
pnpm test
```

or npm:

```bash
npm run lint
npm run format:check
npm run typecheck
npm test
```

## Required Workflow Checks

Before execution plan is approved, identify commands for every active layer:

```text
FE lint:
FE format check:
FE typecheck:
FE test:
BE lint:
BE format check:
BE typecheck:
BE test:
```

Mark missing commands explicitly:

```text
MISSING — plan minimal tooling setup first
NOT APPLICABLE — no backend in first slice
```

Before commit, run all applicable FE and BE checks. Record exact commands + results in `.planning/current/VERIFY.md`.

## Agent Context Rule

If project has `AGENTS.md` or `CLAUDE.md`, ensure it includes the active quality commands. If absent and workflow will touch code repeatedly, create a small `AGENTS.md` only when useful. Do not copy the harness.

Minimum block:

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

Tests live under `tests/`. Track test intent in `TESTS.md` when test coverage grows beyond trivial.
```

## Test Policy

- Tests live under `tests/` unless the repo already has a strong contrary convention. If contrary convention exists, ask before changing.
- Keep a root `TESTS.md` when tests are non-trivial. Track what is covered, what is intentionally not covered, and known gaps.
- Tests must verify behavior through public Interfaces, not implementation details.
- Avoid biased tests written to match current implementation. Use red-green when changing behavior.
- Remove duplicate tests or merge into one clearer behavior test.
- Do not add broad snapshot/golden tests unless they catch real regressions.
- No bloated edge-case matrix without risk justification.

## Pre-Commit Policy

Pre-commit is optional but recommended once commands are stable.

- JS: Husky + lint-staged is okay if repo already uses JS tooling.
- Python: pre-commit with ruff/pytest hooks is okay if repo already uses Python tooling.
- Keep hooks fast. Full slow suites belong in CI or manual verify.
