# Pivot Contract

## Process

1. Require map:
   - if `.planning/codebase/*` missing/stale -> run/update map first
2. Scout current project:
   - planning docs
   - codebase map
   - entrypoints
   - known blockers
3. Grill unclear:
   - new product core value
   - keep/delete boundary
   - first slice
   - irreversible deletion
4. Write `PIVOT.md`.
5. Rewrite core project spine.
6. Create first plan/todo.
7. Check plan before execution.

## PIVOT.md Shape

```md
# Pivot: <project>

## Old
## New
## Keep
## Delete Or Sideline
## First Slice
## Risks
```

## Keep/Delete Heuristics

- Keep Modules with depth, leverage, locality.
- Keep UI primitives, domain data, useful adapters.
- Delete shallow pass-throughs that force old product shape.
- Delete invalid public seams, debug routes, and stale duplicate implementations.
- Mark stale maps/docs clearly.
