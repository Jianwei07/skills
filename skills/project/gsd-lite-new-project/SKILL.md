---
name: gsd-lite-new-project
description: High-level Jayden Workflow orchestrator for new repos or product ideas. Use when starting a new side project or converting a rough idea into `.planning/` and a first checked plan.
---

# GSD-Lite New Project

Objective: idea -> project spine -> first checked plan.

Upstream:
- GSD `new-project` questioning -> requirements -> roadmap.
- Jayden local-first, low-token workflow.
- `grill-me` for missing product decisions.

Read:
- `../../core/jayden-workflow/META-PROMPTING.md`
- `../../core/jayden-workflow/ARTIFACTS.md`
- `../../core/jayden-workflow/DECISION-GATES.md`
- New-project contract: [NEW-PROJECT-CONTRACT.md](NEW-PROJECT-CONTRACT.md)

## Chain

```text
gsd-lite-context -> gsd-lite-new-project -> gsd-lite-plan -> gsd-lite-check
```

## Outputs

- `.planning/PROJECT.md`
- `.planning/REQUIREMENTS.md`
- `.planning/ROADMAP.md`
- `.planning/STATE.md`
- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`

## Rules

- Local-first. Research only when requested or required by new external decision.
- Ask/grill only decisions that materially affect product shape.
- First slice must be visible or core-path working.
- Do not execute.
