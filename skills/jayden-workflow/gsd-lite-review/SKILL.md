---
name: gsd-lite-review
description: Compact GSD-style code review for changed files. Use when reviewing diffs for bugs, security risks, missing error handling, and maintainability issues.
---

# GSD-Lite Review

Objective: find real defects, not style noise.

## Scope

Review changed source files. Skip generated files, lockfiles, build output, and planning docs unless explicitly requested.

Modes:

| Mode | Use |
|---|---|
| quick | grep/pattern scan |
| standard | read changed files, default |
| deep | trace cross-file calls/data |

## Checks

- Bugs: null/undefined, off-by-one, wrong condition, async race, unhandled edge, dead path.
- Security: injection, XSS, unsafe eval/exec, path traversal, hardcoded secret, authz/authn gap.
- Reliability: swallowed errors, missing await, unhandled promise, unchecked IO/network result.
- Maintainability: confusing branch, large duplicated block, hidden coupling, stale commented code.

## Process

1. Read `.planning/current/*` if present.
2. Determine files from user args, staged diff, or branch diff.
3. Read project instructions if present.
4. Filter to reviewable files.
5. Inspect with chosen mode.
6. Write compact summary to `.planning/review/` or `.planning/current/HANDOFF.md` when useful.
7. Report only actionable findings.

## Output

Findings first:

```md
## Findings
- [P1] path:line — problem. Fix.
- [P2] path:line — problem. Fix.

## Checked
- <N> files, mode=<quick|standard|deep>

## Residual Risk
- <only if relevant>
```

Severity:

- `P0`: exploit/data loss/main flow crash.
- `P1`: likely bug/security issue.
- `P2`: edge-case bug/fragile behavior.
- `P3`: maintainability, low urgency.

## Rules

- No praise sandwich.
- No speculative nits.
- Every finding needs file, line, why, fix.
- If no issues, say clean and name test gaps.
- Max 10 findings; rank by severity.
