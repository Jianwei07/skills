# Execute Contract

## Process

1. Read plan/todo/decisions/questions/handoff.
2. Confirm plan check status when present.
3. Read codebase map docs.
4. Execute tasks in TODO order.
5. After each task:
   - mark TODO
   - run listed verify command/check
   - record deviation/blocker
6. Write `HANDOFF.md`.
7. Route to `gsd-lite-verify`.

## Deviation Policy

| Situation | Action |
|---|---|
| Direct correctness blocker caused by task | Fix |
| Security issue caused by task | Fix |
| Unrelated pre-existing failure | Record, do not fix |
| New seam/interface needed | Stop unless planned |
| Missing decision | Stop and grill |
| Verification command broken due tooling drift | Record exact failure and closest check |

## HANDOFF.md Shape

```md
# Handoff

## Status
- task:
- result:

## Changed
- path:

## Verification
- command:
- result:

## Deviations
- none | detail

## Next
- verify | blocked | continue
```
