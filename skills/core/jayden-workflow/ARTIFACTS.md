# Artifact Contract

All artifacts are project-local under `.planning/`.

Create only what the current workflow needs. Empty directories and ceremonial docs are bloat.

## Minimum Useful Set

| Path | Purpose |
|---|---|
| `.planning/PROJECT.md` | project identity, core value, constraints, key decisions |
| `.planning/STATE.md` | current position and next action |
| `.planning/current/PLAN.md` | decision-complete executable plan |
| `.planning/current/TODO.md` | local execution checklist |
| `.planning/current/HANDOFF.md` | compact latest state |

## Core

| Path | Purpose |
|---|---|
| `.planning/PROJECT.md` | project identity, core value, constraints, decisions |
| `.planning/REQUIREMENTS.md` | requirements, out of scope, traceability |
| `.planning/ROADMAP.md` | phases/slices, goals, success criteria |
| `.planning/STATE.md` | current position and next action |

## Current Work

| Path | Purpose |
|---|---|
| `.planning/current/PLAN.md` | decision-complete executable plan |
| `.planning/current/TODO.md` | local execution checklist |
| `.planning/current/DECISIONS.md` | accepted decisions |
| `.planning/current/QUESTIONS.md` | unresolved blockers |
| `.planning/current/HANDOFF.md` | compact latest state |
| `.planning/current/VERIFY.md` | latest goal-backward verification |

## Codebase Memory

`/gsd-map` writes:

- `.planning/codebase/STACK.md`
- `.planning/codebase/INTEGRATIONS.md`
- `.planning/codebase/ARCHITECTURE.md`
- `.planning/codebase/STRUCTURE.md`
- `.planning/codebase/CONVENTIONS.md`
- `.planning/codebase/TESTING.md`
- `.planning/codebase/CONCERNS.md`

## Optional Area State

Create these only when the matching workflow needs them.

| Path | Purpose |
|---|---|
| `.planning/pivot/PIVOT.md` | old/new direction, keep/delete, first slice |
| `.planning/debug/{slug}.md` | persistent debug state |
| `.planning/review/*.md` | compact review summaries |
| `.planning/research/*.md` | optional research summaries |
| `.planning/lint/*.md` | lint/format summaries |
| `.planning/pr/*.md` | PR prep/review/cleanup summaries |

## Rules

- Store facts, not transcript.
- Exact paths and commands beat prose.
- Do not create empty directories or phase directories unless a workflow explicitly asks.
- Do not store secrets.
