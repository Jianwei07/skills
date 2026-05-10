---
name: gsd-lite-pivot
description: High-level Jayden Workflow orchestrator for stale, dead, or wrong-direction projects. Use when existing code should be reframed, rebuilt, or aggressively simplified before execution.
---

# GSD-Lite Pivot

Objective: old repo -> new direction -> first checked plan.

Upstream:
- GSD map/plan gates.
- Matt deletion test and deepening vocabulary.
- `grill-me` for keep/delete and product direction decisions.

Read:
- `../jayden-workflow/META-PROMPTING.md`
- `../jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- `../jayden-workflow/DECISION-GATES.md`
- Pivot contract: [PIVOT-CONTRACT.md](PIVOT-CONTRACT.md)

## Chain

```text
map-codebase-architecture refresh/update -> gsd-lite-pivot -> gsd-lite-plan -> gsd-lite-check
```

## Outputs

- `.planning/pivot/PIVOT.md`
- `.planning/PROJECT.md`
- `.planning/REQUIREMENTS.md`
- `.planning/ROADMAP.md`
- `.planning/STATE.md`
- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`

## Rules

- Fresh or explicitly updated map is mandatory.
- User intent beats stale docs.
- Use deletion test for keep/delete boundaries.
- Preserve foundations that add leverage; delete blockers when permission exists.
- Do not execute.
