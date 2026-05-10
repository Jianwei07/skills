# Debug Contract

## Session Commands

- `list`: active sessions.
- `status <slug>`: summary.
- `continue <slug>`: resume.
- otherwise: new session.

## State Shape

```md
# Debug Session: <slug>

## Symptoms
## Current Focus
## Evidence
## Eliminated
## Root Cause
## Fix
## Verification
```

## Evidence Rules

- Preserve exact error text, commands, paths.
- Every eliminated hypothesis needs reason.
- Root cause needs mechanism + evidence.
- Verification must reproduce failure signal or add regression test/check.
