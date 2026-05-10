# Map Codebase Contract

Purpose: preserve the useful GSD mapper backbone without copying its bulk.

## Focus Passes

| Focus | Explore | Write |
|---|---|---|
| `tech` | package manifests, lockfiles, runtime files, config names, deployment files, SDK imports | `STACK.md`, `INTEGRATIONS.md` |
| `arch` | directory tree, entrypoints, import layers, route/API surfaces, state/data flow | `ARCHITECTURE.md`, `STRUCTURE.md` |
| `quality` | lint/format config, test files, CI, sample source files, error/log patterns | `CONVENTIONS.md`, `TESTING.md` |
| `concerns` | TODO/FIXME, large files, duplicate paths, debug code, security seams, missing tests | `CONCERNS.md` |

## Existing Map Policy

If `.planning/codebase/` exists:

| Choice | Behavior |
|---|---|
| Refresh | Replace all 7 docs from current code |
| Update | Rewrite only requested focus docs |
| Skip | Use existing map as-is |

For stale pivot projects, default to Refresh unless user asks to preserve docs.

## Project Skills

Before mapping, inspect lightweight project-local skill indexes:

- `.claude/skills/*/SKILL.md`
- `.agents/skills/*/SKILL.md`
- `.cursor/skills/*/SKILL.md`
- `.github/skills/*/SKILL.md`

Surface project-specific patterns in `CONVENTIONS.md`, `STRUCTURE.md`, and `CONCERNS.md`.

## Document Contracts

### STACK.md

Include:
- analysis date
- languages and versions when detectable
- runtime and package managers
- frameworks
- critical dependencies only
- config files and env var names only
- development and production platform assumptions

### INTEGRATIONS.md

Include:
- external APIs/services
- data stores
- auth/identity
- monitoring/logging
- deployment/CI
- webhook/callback surfaces
- env var names only, no values

### ARCHITECTURE.md

Include:
- pattern overview
- conceptual layers
- Modules with Interface + Implementation summary
- Seams and Adapters
- main request/data flows
- state management
- error handling and cross-cutting concerns

### STRUCTURE.md

Include:
- top-level tree
- directory purposes
- key file locations
- naming conventions
- where to add new features/routes/components/tests/utilities
- generated/special directories and whether committed

### CONVENTIONS.md

Include:
- naming patterns
- formatting/linting/typecheck commands
- import organization
- error handling
- logging
- comments
- function/module design
- project skill constraints

### TESTING.md

Include:
- test runner/config if detected
- run commands
- file organization
- suite/mocking/fixture patterns
- coverage policy
- missing test path when tests are absent
- recommended first regression tests

### CONCERNS.md

Include:
- tech debt
- known bugs
- security considerations
- performance bottlenecks
- fragile areas
- scaling limits
- dependencies at risk
- missing critical features
- test coverage gaps

Each concern needs:
- issue/risk
- files in backticks
- impact
- fix approach

## Secret Safety

Never read or quote:

- `.env`, `.env.*`, `*.env`
- `credentials.*`, `secrets.*`, `*secret*`, `*credential*`
- `*.pem`, `*.key`, `*.p12`, `*.pfx`, `*.jks`
- `id_rsa*`, `id_ed25519*`, `id_dsa*`
- `.npmrc`, `.pypirc`, `.netrc`
- `config/secrets/*`, `.secrets/*`, `secrets/`
- `serviceAccountKey.json`, `*-credentials.json`

Generated docs must not contain secret-looking values:

- OpenAI-style `sk-...`
- Stripe live/test keys
- GitHub/GitLab tokens
- AWS access keys
- Slack tokens
- private key blocks
- JWT-looking bearer tokens

If found: stop and ask for review before commit.

## Confirmation Format

Return only:

```text
Mapping complete.

Docs:
- .planning/codebase/STACK.md (N lines)
- .planning/codebase/INTEGRATIONS.md (N lines)
- .planning/codebase/ARCHITECTURE.md (N lines)
- .planning/codebase/STRUCTURE.md (N lines)
- .planning/codebase/CONVENTIONS.md (N lines)
- .planning/codebase/TESTING.md (N lines)
- .planning/codebase/CONCERNS.md (N lines)

Warnings:
- missing/short docs, if any
- secret scan result

Next:
- /gsd-plan or /gsd-pivot
```
