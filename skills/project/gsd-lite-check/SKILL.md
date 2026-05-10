---
name: gsd-lite-check
description: Pre-execution gate for Jayden Workflow plans. Verifies direction, grill status, plan sufficiency, and keeps execution closed until user explicitly commands it.
---

# GSD-Lite Check

Objective: verify plan will work before execution burns context. Output one compact result.

Upstream:
- GSD `gsd-plan-checker` goal-backward verification.
- Jayden manual gated workflow.

Read:
- Meta-prompt loop: `../../core/jayden-workflow/META-PROMPTING.md`
- Decision gates: `../../core/jayden-workflow/DECISION-GATES.md`
- Check contract: [CHECK-CONTRACT.md](CHECK-CONTRACT.md)

## Chain

```text
gsd-lite-plan -> gsd-lite-check -> STOP
```

Only after explicit user command:

```text
gsd-lite-execute -> gsd-lite-verify
```

## Output

Write one compact result to `.planning/current/HANDOFF.md`:

```text
Check result: PASS | NEEDS CLARITY | BLOCKED
Direction Check: CONFIRMED | NEEDS_GRILL | BLOCKED
Grill Gate: NEEDED_AND_RAN | NEEDED_BUT_BLOCKED | SKIPPED_NOT_NEEDED
Execution gate: CLOSED
Reason: <one line>
Next: <one line>
```

Do not repeat `Check result` multiple times.

## Rules

- Check goal achievement, not formatting.
- Check direction is confirmed or knowingly provisional.
- Check grill gate status exists.
- Block plans with `NEEDS_GRILL`, `BLOCKED`, or `NEEDED_BUT_BLOCKED` unless the user explicitly accepts the risk.
- For architecture/refactor/debloat plans, require `improve-codebase-architecture` or an explicit reason it was skipped.
- Keep execution gate closed even on PASS.
- PASS means ready for user approval, not permission to execute.
- Do not execute.
- Revise plan up to 3 times when fixable.
