---
name: improve-codebase-architecture
description: Use when improving architecture, reviving stale repos, finding refactor/debloat opportunities, or making codebases more testable and AI-navigable. Finds deepening candidates, then passes selected work through Direction Check and Grill Gate before planning.
version: 1.1.0
author: Jayden + Matt Pocock-inspired workflow
license: MIT
metadata:
  hermes:
    tags: [architecture, refactor, deep-modules, codebase, debloat]
    related_skills: [grill-me, map-codebase-architecture, gsd-lite-plan, gsd-lite-check]
---

# Improve Codebase Architecture

Goal: find small, high-leverage architecture moves. No generic cleanup. No big refactor plan before gates.

## Chain

```text
map-codebase-architecture -> improve-codebase-architecture -> Direction Check -> Grill Gate -> gsd-lite-plan -> gsd-lite-check -> STOP
```

Use before `gsd-lite-plan` for architecture/refactor/debloat/stale-project work.

## Language

Use Matt terms:

- **Module** — thing with Interface + Implementation.
- **Interface** — everything caller must know: types, invariants, errors, ordering, config, side effects.
- **Implementation** — code behind Interface.
- **Depth** — leverage behind small Interface. Shallow = Interface nearly as complex as Implementation.
- **Seam** — where Interface lives; behavior can change without editing all callers.
- **Adapter** — concrete thing satisfying Interface at Seam.
- **Leverage** — caller benefit.
- **Locality** — change/bugs/knowledge concentrated in one place.

Tests:

- **Deletion test**: delete Module mentally. Complexity vanish = bloat. Complexity reappears across callers = Module earns keep.
- **Interface is test surface**.
- **One Adapter = hypothetical Seam. Two Adapters = real Seam**. Avoid adapter systems unless useful now.

## Process

1. Read local context:
   - `.planning/codebase/*`
   - `.planning/PROJECT.md`, `.planning/STATE.md`
   - `CONTEXT.md`, `CLAUDE.md`, `AGENTS.md` if present
   - `docs/adr/*` if present
   - relevant source files

2. If map missing/stale, run `map-codebase-architecture` first.

3. Find friction:
   - shallow pass-through Modules
   - concepts scattered across files
   - Interface leaks Implementation details
   - hard-to-test behavior
   - duplicate workflows needing one deeper Module
   - stale-project bloat blocking new direction
   - fake seams/adapters with no current payoff

4. Present 3-5 candidates max:

```text
N. <candidate>
Files: <paths>
Problem: <friction>
Deepening move: <Module/Interface/Seam change>
Why: <Leverage + Locality + test impact>
Keep/delete: <stay/move/merge/deprecate>
Risk: <main unknown>
```

5. Recommend one candidate. Then record:

```text
Direction Check: CONFIRMED | NEEDS_GRILL | BLOCKED
Chosen direction: <one line>
Why: <one line>
Main risk: <one line>
User confirmation needed: yes/no
```

6. Run or skip grill explicitly:

```text
Grill Gate: NEEDED_AND_RAN | NEEDED_BUT_BLOCKED | SKIPPED_NOT_NEEDED
Reason: <one line>
```

7. Stop before plan unless user requested candidates + plan in one pass.

## Grill Gate Rule

Run `grill-me` if selected candidate has unresolved decisions that change:

- product/user outcome;
- delete/merge/preserve call;
- smallest useful Module;
- caller Interface;
- whether Seam is real or adapter bloat;
- test proof;
- first-slice scope.

Skip grill only when code/context answers those decisions clearly. Mark `SKIPPED_NOT_NEEDED` with reason.

## Pitfalls

- Candidate -> plan directly. Wrong. Gate first.
- Style nits framed as architecture. Require Leverage + Locality + test impact.
- Adapter/plugin system too early. Keep concrete.
- Giant `.planning/` docs. Write only next-useful artifacts.
- Imported/reference skills treated as active. Keep separate until promoted.

## Checklist

- [ ] Map/context read or refreshed.
- [ ] Candidates are real architecture friction.
- [ ] Each candidate names files, move, payoff, risk.
- [ ] Direction Check present.
- [ ] Grill Gate status present.
- [ ] No implementation plan before gates.
- [ ] First slice small if planned.
- [ ] `gsd-lite-check` before execution.
