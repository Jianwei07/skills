---
name: gsd-lite-verify
description: Goal-backward verification for completed work. Use when checking whether an implementation achieved the promised outcome, not just whether tasks were completed.
---

# GSD-Lite Verify

Objective: verify outcome from goal backward. Do not trust summaries.

## Inputs

- User goal, plan, PRD, issue, or acceptance criteria.
- Changed files, if known.
- Existing tests and project instructions.
- `.planning/current/PLAN.md`, `TODO.md`, and `HANDOFF.md` if present.

## Process

1. Read project instructions: `AGENTS.md`, `CLAUDE.md`, or local docs if present.
2. Read `.planning/current/*` if present.
3. Find contract: goal, acceptance criteria, issue body, PRD, or user request.
4. Derive 3-7 must-haves:
   - truths: observable behavior that must be true.
   - artifacts: files/modules/UI/API that must exist.
   - wiring: imports, routes, calls, config, data flow that must connect.
5. Verify each must-have against code:
   - exists: artifact present.
   - substantive: not placeholder/stub/hardcoded fake.
   - wired: reachable from user/API/runtime path.
   - data: dynamic data comes from real source when relevant.
6. Run available tests or targeted checks when cheap.
7. Write compact summary to `.planning/current/VERIFY.md` when project state exists.
8. Report pass/fail/uncertain with evidence.

## Output

Use terse format:

```md
## Verdict
PASS | FAIL | UNCERTAIN

## Must-Haves
- [PASS] <truth> — evidence: <file/line/check>
- [FAIL] <truth> — gap: <specific missing/stub/unwired thing>

## Tests
- <command>: <result>

## Fix Next
1. <highest leverage fix>
2. <next fix>
```

## Rules

- Task done does not mean goal achieved.
- Prefer observable behavior over implementation claims.
- Mark `UNCERTAIN` when only human/browser/manual validation can prove it.
- Line evidence beats narrative.
- Max 8 findings unless user asks for full audit.
