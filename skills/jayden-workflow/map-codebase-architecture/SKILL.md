---
name: map-codebase-architecture
description: Map a codebase into lean GSD-compatible architecture docs using Matt-style module/interface/seam/depth vocabulary. Use before planning, execution, refactors, or onboarding to a brownfield repo.
---

# Map Codebase Architecture

Objective: externalize codebase memory so planners/executors avoid re-reading whole repo.

Use Matt architecture language from `../improve-codebase-architecture/LANGUAGE.md`: Module, Interface, Seam, Adapter, Depth, Leverage, Locality. Do not edit Matt skill files.

## Output

Write 4 docs to `.planning/codebase/`:

| Doc | Purpose |
|---|---|
| `ARCHITECTURE.md` | conceptual modules, interfaces, seams, data flow |
| `STRUCTURE.md` | file layout, where new code goes |
| `CONVENTIONS.md` | naming, imports, errors, tests |
| `CONCERNS.md` | shallow modules, fragile seams, debt, missing tests |

## Process

1. Read project instructions: `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, ADRs if present.
2. Explore repo with `rg`, `find`, manifests, configs, entrypoints, tests.
3. Map current state only. No history, no guessed intent.
4. Prefer prescriptive facts:
   - good: "Put route handlers in `src/app/api/*/route.ts`."
   - bad: "There are some route handlers."
5. Use exact paths. Paths beat prose.
6. Surface deepening opportunities in `CONCERNS.md` using depth/locality/leverage.
7. Return confirmation only; do not paste full docs unless user asks.

## Subagent Focus

If subagents are available, split:

| Focus | Writes |
|---|---|
| architecture | `ARCHITECTURE.md` |
| structure | `STRUCTURE.md` |
| conventions | `CONVENTIONS.md` |
| concerns | `CONCERNS.md` |

If not, write sequentially.

## Document Contracts

### ARCHITECTURE.md

Include:
- analysis date
- pattern overview
- key modules with interface + implementation summary
- main seams/adapters
- core data/request flow
- error/state handling

### STRUCTURE.md

Include:
- top-level directory tree
- directory purposes
- key file locations
- where to add common new code
- file/directory naming conventions

### CONVENTIONS.md

Include:
- naming patterns
- import organization
- formatting/linting tools
- error handling
- test structure and commands

### CONCERNS.md

Include:
- shallow modules
- fragile seams
- missing/weak tests
- security/reliability risks
- fix approach for each concern

## Style

Structured terse caveman:
- short bullets
- exact labels
- no filler
- keep technical meaning exact
- switch to clearer prose for security/irreversible ambiguity

