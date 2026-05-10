---
name: map-codebase-architecture
description: Map a codebase into GSD-compatible `.planning/codebase/` docs using GSD mapper structure plus Matt-style Module/Interface/Seam/Depth vocabulary. Use before planning, pivoting, execution, refactors, or onboarding to a brownfield repo.
---

# Map Codebase Architecture

Objective: create compact project memory so future agents stop re-reading whole repo.

Sources:
- GSD `map-codebase` workflow shape: 4 focused passes, direct doc writes, confirmations only.
- GSD `gsd-codebase-mapper` contracts: 7 docs, paths, templates, project-skill loading.
- Matt architecture language: Module, Interface, Seam, Adapter, Depth, Leverage, Locality.

Do not edit Matt skill files. Do not quote secrets.

## Output

Write 7 docs to `.planning/codebase/`:

| Focus | Docs |
|---|---|
| `tech` | `STACK.md`, `INTEGRATIONS.md` |
| `arch` | `ARCHITECTURE.md`, `STRUCTURE.md` |
| `quality` | `CONVENTIONS.md`, `TESTING.md` |
| `concerns` | `CONCERNS.md` |

Full contract: [MAP-CONTRACT.md](MAP-CONTRACT.md).
Shared architecture terms: `../jayden-workflow/ARCHITECTURE-LANGUAGE.md`.
Shared gates: `../jayden-workflow/DECISION-GATES.md`.

## Process

1. Check existing `.planning/codebase/`:
   - If present, ask/decide refresh, update focus, or skip.
   - If absent, create directory.
2. Read project instructions and skills:
   - `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, ADRs if present.
   - Project skills in `.claude/skills/`, `.agents/skills/`, `.cursor/skills/`, `.github/skills/`.
3. Run 4 focused passes:
   - `tech`: manifests, runtime, configs, env names only, integrations.
   - `arch`: entrypoints, layers, modules, interfaces, seams, data flow.
   - `quality`: conventions, tests, lint/build/typecheck patterns.
   - `concerns`: debt, bugs, security, performance, fragility, test gaps.
4. Prefer subagents when available. Fallback sequentially.
5. Verify:
   - all 7 docs exist
   - each doc >20 lines unless repo is truly tiny
   - docs include exact paths in backticks
6. Scan generated docs for secret-looking values before suggesting commit.
7. Return confirmation only: docs written, line counts, missing docs, next step.

## Rules

- Current state only. No history guessing.
- Paths beat prose: use `app/page.tsx`, not "homepage".
- Be prescriptive: "Put route handlers in `app/api/*/route.ts`."
- Use Matt terms in arch/concerns docs when useful.
- `CONCERNS.md` must include impact + fix approach.
- `STRUCTURE.md` must answer "where do I put this?"
- `TESTING.md` must say what tests exist and how to add/run them.
- Never read `.env*`, private keys, token files, credential files, or secret dirs.
- Structured terse caveman by default; clear prose for security/irreversible risk.
