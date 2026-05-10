---
name: jayden-workflow
description: Top-level Jayden Workflow operating system for layered GSD-lite work. Use when choosing or orchestrating Map/New/Pivot -> Plan -> Check -> Execute -> Verify workflows across OpenCode, Claude Code, or Codex.
---

# Jayden Workflow

Objective: one personal workflow layer on top of GSD rigor and Matt architecture language.

Core chain:

```text
Map / New / Pivot -> Plan -> Check -> Execute -> Verify
```

## Use

| Situation | Chain |
|---|---|
| Existing repo | `map-codebase-architecture` -> `gsd-lite-plan` -> `gsd-lite-check` -> `gsd-lite-execute` -> `gsd-lite-verify` |
| New project | `gsd-lite-context` -> `gsd-lite-new-project` -> `gsd-lite-plan` -> `gsd-lite-check` |
| Pivot/dead project | `map-codebase-architecture` mandatory -> `gsd-lite-pivot` -> `gsd-lite-plan` -> `gsd-lite-check` |
| Bug | `gsd-lite-debug` -> `gsd-lite-plan` if fix needed -> `gsd-lite-check` -> `gsd-lite-execute` -> `gsd-lite-verify` |
| Review | `gsd-lite-review` -> optional `gsd-lite-plan` for fixes |

## Support Docs

- Meta-prompt loop: [META-PROMPTING.md](META-PROMPTING.md)
- Architecture language: [ARCHITECTURE-LANGUAGE.md](ARCHITECTURE-LANGUAGE.md)
- Decision gates: [DECISION-GATES.md](DECISION-GATES.md)
- Artifacts: [ARTIFACTS.md](ARTIFACTS.md)

## Rules

- Skills define behavior. Commands route. Agents execute focused roles.
- Use project-local `.planning/`; never global project state.
- Keep `SKILL.md` executable; move deeper supporting detail to sibling `.md` files.
- Use `grill-me` when product intent, interface shape, keep/delete boundary, irreversible action, or acceptance criteria is unclear.
- Use Matt terms: Module, Interface, Implementation, Seam, Adapter, Depth, Leverage, Locality.
- Structured terse caveman by default; clear prose for security, irreversible action, or ambiguity.
- Do not edit Matt skill files.
