---
name: gsd-lite-plan
description: Creates decision-complete executable plans using Jayden Workflow meta-prompting, codebase maps, and Matt architecture language. Use for feature, bugfix, refactor, pivot, or first-slice planning before execution.
---

# GSD-Lite Plan

Objective: turn goal -> executable prompt-plan.

Upstream:
- GSD `plan-phase` orchestration and planner/checker loop.
- Matt architecture language and `improve-codebase-architecture`.
- Jayden `.planning/current/*` artifact model.

Read:
- Meta-prompt loop: `../jayden-workflow/META-PROMPTING.md`
- Architecture terms: `../jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- Artifacts: `../jayden-workflow/ARTIFACTS.md`
- Plan contract: [PLAN-CONTRACT.md](PLAN-CONTRACT.md)

## Chain

```text
gsd-lite-context -> gsd-lite-plan -> gsd-lite-check
```

## Outputs

- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/DECISIONS.md` when decisions accepted
- `.planning/current/QUESTIONS.md` when blocked

## Rules

- Plans are prompts. Executor should not guess.
- Use goal-backward must-haves.
- Use exact files, actions, verification, done criteria.
- Use Module/Interface/Seam/Depth language for architecture choices.
- Grill before planning if intent, interface, keep/delete, or acceptance criteria are unclear.
- No scope reduction. Split instead.
