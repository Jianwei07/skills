---
description: Create an executable GSD-lite plan using codebase map docs
agent: gsd-lite-planner
argument-hint: "[goal, issue, PRD, or feature request]"
---

Use `gsd-lite-planner`.

Create decision-complete plan. Read `.planning/current/*` and `.planning/codebase/*.md` if present. If map missing on brownfield repo, recommend `/gsd-map` but still plan.

Write/update:
- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/DECISIONS.md` when decisions are accepted
- `.planning/current/QUESTIONS.md` when blockers remain

Plan format:
- Objective
- Context files
- Tasks: files/action/verify/done
- Risks/checkpoints

Style: structured terse caveman.

Goal:
$ARGUMENTS
