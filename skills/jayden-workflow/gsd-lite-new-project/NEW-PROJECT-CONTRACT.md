# New Project Contract

## Process

1. Scout repo if files exist: README, docs, manifests, entrypoints.
2. Capture product intent:
   - audience
   - core value
   - first use case
   - constraints
   - out of scope
3. Grill missing decisions only.
4. Write project spine.
5. Create first vertical slice plan.
6. Run/check with `gsd-lite-check`.

## Product Spine

| File | Required content |
|---|---|
| `PROJECT.md` | what this is, core value, constraints, decisions |
| `REQUIREMENTS.md` | v1 requirements, later, out of scope, traceability |
| `ROADMAP.md` | 3-6 phases/slices with success criteria |
| `STATE.md` | current position, next action, blockers |

## Defaults

- Personal side projects: keep v1 small.
- Prefer useful workflow over platform completeness.
- Avoid auth/multi-user/payment unless core value requires it.
- First slice should prove one real user loop.
