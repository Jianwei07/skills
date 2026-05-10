---
name: gsd-lite-review
description: Decoupled Jayden Workflow review for changed files. Use when reviewing diffs for bugs, security risks, missing wiring, shallow modules, and maintainability issues.
---

# GSD-Lite Review

Objective: find real defects, not style noise.

Upstream:
- GSD code-review severity discipline.
- Matt locality/depth language.
- Jayden central context.

Read:
- `../jayden-workflow/ARCHITECTURE-LANGUAGE.md`
- `../jayden-workflow/ARTIFACTS.md`
- Review contract: [REVIEW-CONTRACT.md](REVIEW-CONTRACT.md)

## Chain

```text
gsd-lite-context -> gsd-lite-review -> optional gsd-lite-plan for fixes
```

## Outputs

- `.planning/review/*.md` when useful
- `.planning/current/HANDOFF.md`

## Rules

- Findings first.
- Every finding needs path, line, why, fix.
- Flag shallow Modules and leaky Interfaces when they create real risk.
- No speculative nits.
- If clean, say clean and name residual test gaps.
