---
name: jayden-workflow
description: Top-level Jayden Workflow router for manual, gated GSD-lite work. Use when choosing Map/New/Pivot -> Direction -> Plan -> Check -> explicit Execute -> Verify workflows across agents.
---

# Jayden Workflow

Objective: one lean personal workflow layer: GSD rigor + Matt architecture language + caveman token discipline.

Core chain:

```text
Map / New / Pivot -> Direction Check -> Plan -> Check -> STOP -> Execute only on explicit command -> Verify
```

## Use

| Situation | Chain |
|---|---|
| Existing repo | `map-codebase-architecture` -> optional `improve-codebase-architecture` -> Direction Check -> `gsd-lite-plan` -> `gsd-lite-check` -> STOP |
| New project | `gsd-lite-context` -> `gsd-lite-new-project` -> Direction Check -> `gsd-lite-plan` -> `gsd-lite-check` -> STOP |
| Pivot/dead project | `map-codebase-architecture` -> `gsd-lite-pivot` -> optional `improve-codebase-architecture` -> Direction Check -> Grill Gate -> `gsd-lite-plan` -> `gsd-lite-check` -> STOP |
| Bug | `gsd-lite-debug` -> optional `gsd-lite-plan` -> `gsd-lite-check` -> STOP |
| Review | `gsd-lite-review` -> optional `gsd-lite-plan` for fixes -> STOP |
| Execute approved plan | explicit user command only -> `gsd-lite-execute` -> `gsd-lite-verify` |

## Default Personal Project Loop

For stale side projects:

```text
Map current repo -> Pivot direction -> Direction Check -> Grill Gate -> Plan first slice -> Check -> STOP
```

Then wait. Execute only after user explicitly says one of:

```text
execute current plan
execute the checked plan
/run execute
/execute current plan
```

Treat `/execute` as a workflow phrase unless a real runtime command exists.

## Required Gates

### Companion Skills

Jayden Workflow may work hand-in-hand with focused skills. Load them when the user goal or repo artifacts call for them; they refine the plan, they do not bypass gates.

Common companions:

- `design-md` when the user references `DESIGN.md`, design tokens, visual identity, UI polish, accessibility, Tailwind/theme export, or Google DESIGN.md.
- `tdd` when adding/changing behavior with meaningful tests.
- `setup-pre-commit` when quality commands/tooling are missing.
- `grill-me` when direction/design/product/API ambiguity changes the first slice.

If a companion skill is used, note it in `.planning/current/HANDOFF.md` under `Skills used:`.

### Direction Check

After pivot/direction and before plan, state once:

```text
Direction Check: CONFIRMED | NEEDS_GRILL | BLOCKED
Chosen direction: <one line>
Why: <one line>
Main risk: <one line>
User confirmation needed: yes/no
```

### Grill Gate

Before plan, state once:

```text
Grill Gate: NEEDED_AND_RAN | NEEDED_BUT_BLOCKED | SKIPPED_NOT_NEEDED
Reason: <one line>
```

Rules:

- If ambiguity changes direction, Interface, keep/delete call, first-slice scope, design system, visual direction, provider/cost posture, irreversible action, or acceptance criteria -> run `grill-me` before plan.
- If ambiguity only affects later execution -> record in `.planning/current/QUESTIONS.md`; planning may continue.
- If no material ambiguity -> mark `SKIPPED_NOT_NEEDED` with reason.
- Do not mark `SKIPPED_NOT_NEEDED` when the user asks broad design/product direction questions (e.g. "improve the design", "make it feel better", "which provider?", "what should the first slice be?"). Those require one `grill-me` choice unless prior docs answer them clearly.
- Do not repeat gate text in every section.

## Project Artifacts

Do not create a giant harness in project repos. Write only small project-local files needed now:

- `.planning/PROJECT.md`
- `.planning/STATE.md`
- `.planning/codebase/*` when mapping is needed
- `.planning/current/PLAN.md`
- `.planning/current/TODO.md`
- `.planning/current/HANDOFF.md`
- `.planning/current/QUESTIONS.md` only when unresolved execution questions exist
- `TESTS.md` when test coverage becomes non-trivial

Everything else is on-demand.

## Support Docs

- Meta-prompt loop: [META-PROMPTING.md](META-PROMPTING.md)
- Architecture language: [ARCHITECTURE-LANGUAGE.md](ARCHITECTURE-LANGUAGE.md)
- Decision gates: [DECISION-GATES.md](DECISION-GATES.md)
- Artifacts: [ARTIFACTS.md](ARTIFACTS.md)
- Quality gates: [QUALITY-GATES.md](QUALITY-GATES.md)

## Rules

- Manual gated workflow. Plan/check never implies execute.
- Execute only after explicit user command.
- Quality gates are mandatory for code changes: discover FE/BE lint, format:check, typecheck, and test commands; run applicable checks before commit; record results in `.planning/current/VERIFY.md`.
- Package/tooling setup must follow existing lockfiles (`pnpm`/`npm`/`uv`/etc.) and add only minimal dev dependencies needed for standard commands.
- Tests live under `tests/`; use root `TESTS.md` when coverage becomes non-trivial; remove duplicate/bloated tests.
- Caveman is core purpose: cut token usage by default. Terse, structured, no filler.
- Skills define behavior. Commands route. Agents execute focused roles.
- Use project-local `.planning/`; never global project state.
- Create the fewest planning artifacts needed for next action.
- Keep `SKILL.md` executable; move deeper detail to sibling `.md` only when needed.
- Avoid repeated skills. If two skills overlap, keep lean canonical one; move reference/old versions to `imported/` or `deprecated/`.
- For architecture/refactor/debloat work, use `improve-codebase-architecture` before planning.
- Use Matt terms: Module, Interface, Implementation, Seam, Adapter, Depth, Leverage, Locality.
- Clear prose only for security, irreversible action, or ambiguity.
- Do not edit Matt skill files.
