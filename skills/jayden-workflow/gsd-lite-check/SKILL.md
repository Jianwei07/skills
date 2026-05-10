---
name: gsd-lite-check
description: Pre-execution gate for Jayden Workflow plans. Use after gsd-lite-plan and before gsd-lite-execute to verify the plan will achieve the goal.
---

# GSD-Lite Check

Objective: verify plan will work before execution burns context.

Upstream:
- GSD `gsd-plan-checker` goal-backward verification.
- Jayden central-current artifact model.

Read:
- Meta-prompt loop: `../jayden-workflow/META-PROMPTING.md`
- Decision gates: `../jayden-workflow/DECISION-GATES.md`
- Check contract: [CHECK-CONTRACT.md](CHECK-CONTRACT.md)

## Chain

```text
gsd-lite-plan -> gsd-lite-check -> gsd-lite-execute
```

## Output

Write compact result to `.planning/current/HANDOFF.md`:

- `PASS`
- `NEEDS CLARITY`
- `BLOCKED`

## Rules

- Check goal achievement, not formatting.
- Block only real execution risks.
- Grill user for missing decisions.
- Do not execute.
- Revise plan up to 3 times when fixable.
