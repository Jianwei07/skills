# Verify Contract

## Process

1. Read plan/todo/handoff.
2. Extract acceptance contract.
3. Derive 3-7 must-haves.
4. Check each:
   - exists
   - substantive
   - wired
   - data-backed when relevant
   - verified
5. Run available cheap checks.
6. Write verdict.

## Verdicts

- `PASS`: all must-haves proven.
- `FAIL`: one or more must-haves missing or broken.
- `UNCERTAIN`: evidence requires human/manual/browser check.

## Output

```md
## Verdict
PASS | FAIL | UNCERTAIN

## Must-Haves
- [PASS] truth — evidence
- [FAIL] truth — gap

## Tests
- command: result

## Fix Next
1. highest leverage fix
```
