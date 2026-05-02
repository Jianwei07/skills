---
description: Map codebase architecture into lean GSD-compatible docs
agent: build
argument-hint: "[optional focus: architecture|structure|conventions|concerns]"
---

Use the `map-codebase-architecture` skill.

Write lean docs to `.planning/codebase/`:
- `ARCHITECTURE.md`
- `STRUCTURE.md`
- `CONVENTIONS.md`
- `CONCERNS.md`

Use `gsd-lite-mapper` subagents when available:
- architecture -> `ARCHITECTURE.md`
- structure -> `STRUCTURE.md`
- conventions -> `CONVENTIONS.md`
- concerns -> `CONCERNS.md`

Fallback: write sequentially.

Style: structured terse caveman. Return confirmations, not full docs.

Scope:
$ARGUMENTS

