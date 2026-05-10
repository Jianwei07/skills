# Cost Saving Strategy

Goal: keep GSD's useful outcomes while making Matt-style skills the default shape: small, composable, lazy-loaded, and easy to debug.

## Core Rules

1. Commands stay thin.
   - Good: route to one skill, set intent, pass `$ARGUMENTS`.
   - Bad: embed full workflow, examples, templates, and agent policy in every command.

2. Skills hold workflow.
   - Keep `SKILL.md` under ~150 lines where possible.
   - Move rare details into sibling references.
   - Load references only when needed.

3. Agents must earn their prompt.
   - Prefer no custom agent.
   - Use a custom agent only when a different role, permission set, or context boundary improves outcome.
   - Target <500 words per custom agent.

4. GSD imports must be distilled, not copied.
   - Preserve invariants, checklists, and outputs.
   - Drop motivational prose, long examples, repeated rules, exhaustive edge-case essays.

5. Use caveman style for operational prompts.
   - Short imperatives.
   - Tables over prose.
   - Exact output contracts.
   - No repeated values already implied by command/skill name.

## Cost Levers

### 0. Central Context Spine

Use project-local `.planning/` as shared state:

```text
.planning/
  codebase/
  current/
  debug/
  research/
  review/
  lint/
  pr/
```

`current/` holds active `PLAN.md`, `TODO.md`, `DECISIONS.md`, `QUESTIONS.md`, `HANDOFF.md`, and `VERIFY.md`.

Agents read central context first, then write compact summaries back. Detailed transcripts stay out.

### 1. Default Model Routing

Use cheap/fast default, escalate only on explicit need.

- `build`: medium reasoning.
- `plan`: high reasoning.
- heavy audit/research: manual command or explicit agent only.

Avoid making `xhigh` global. It turns every typo fix into a premium reasoning job.

### 2. Lazy Sibling Docs

Pattern:

```text
skill-name/
  SKILL.md              # trigger + 5-8 step workflow
  OUTPUT-CONTRACT.md    # load only when producing final artifact
  EXAMPLES.md           # load only when user asks or output weak
  CHECKS.md             # load only before verification
```

Most turns need the workflow, not every example.

### 3. Replace Multi-Agent GSD With Skill Phases

Old GSD often does:

```text
command -> workflow -> planner agent -> checker agent -> executor agent -> verifier agent
```

Lean version:

```text
command -> skill -> local checklist -> optional agent only at risk boundary
```

Keep agents for:

- `reviewer`: independent critique.
- `verifier`: goal-backward validation.
- `researcher`: isolated source/docs reading.

Avoid agents for:

- simple planning,
- normal implementation,
- formatting docs,
- status summaries.

### 4. Collapse GSD Commands Into 6-8 Personal Commands

High-value keepers:

- `/plan` or `/phase-plan`: small plan + acceptance criteria.
- `/execute`: execute approved plan.
- `/verify`: goal-backward verification.
- `/review`: bug/security/code review.
- `/debug`: use `diagnose`.
- `/ship`: commit/push/PR.
- `/status`: terse project state.

Everything else should become either:

- a skill reference,
- a section in one command,
- or parked.

### 5. Use State Files, Not Prompt Memory

For long work, write compact state:

```text
.planning/current/PLAN.md
.planning/current/TODO.md
.planning/current/DECISIONS.md
.planning/current/QUESTIONS.md
.planning/current/HANDOFF.md
```

Rules:

- Store facts, not narrative.
- 1 line per decision.
- Include file paths and commands.
- Never paste full logs unless needed.

### 6. Use Output Budgets

Put output limits in commands:

```text
Output:
- Max 8 bullets.
- Include only blockers, changed files, tests.
- No recap of obvious steps.
```

This cuts both assistant output and future context.

### 7. Compress Before Installing

Before importing any GSD agent:

1. Count words.
2. Extract objective, inputs, outputs, invariants.
3. Delete examples unless they prevent known failure.
4. Convert prose to checklist/table.
5. Move rare policy to sibling `.md` files.
6. Target 70-90% reduction.

## Suggested Personal GSD-Lite Layout

```text
skills/
  core/
    jayden-workflow/
      SKILL.md
      META-PROMPTING.md
      ARTIFACTS.md
      DECISION-GATES.md
      ARCHITECTURE-LANGUAGE.md
  project/
    gsd-lite-context/
      SKILL.md
    gsd-lite-plan/
      SKILL.md
      PLAN-CONTRACT.md
    gsd-lite-check/
      SKILL.md
      CHECK-CONTRACT.md
    gsd-lite-execute/
      SKILL.md
      EXECUTE-CONTRACT.md
    gsd-lite-new-project/
      SKILL.md
      NEW-PROJECT-CONTRACT.md
    gsd-lite-pivot/
      SKILL.md
      PIVOT-CONTRACT.md
    map-codebase-architecture/
      SKILL.md
      MAP-CONTRACT.md
    gsd-lite-verify/
      SKILL.md
      VERIFY-CONTRACT.md
    gsd-lite-review/
      SKILL.md
      REVIEW-CONTRACT.md
    gsd-lite-debug/
      SKILL.md
      DEBUG-CONTRACT.md

opencode/command/
  gsd-map.md
  gsd-plan.md
  gsd-check.md
  gsd-execute.md
  gsd-debug.md
  plan.md
  execute.md
  verify.md
  review.md
```

## Compression Template For GSD Agents

Use this when refactoring one GSD agent:

```md
---
name: gsd-lite-<role>
description: <one sentence capability>. Use when <specific trigger>.
---

# Role

Objective: <one line>

Inputs:

- <input>

Process:

1. <step>
2. <step>
3. <step>

Output:

- <artifact or response shape>
- Max <N> bullets unless user asks detail.

Rules:

- <invariant>
- <invariant>

Escalate when:

- <condition>
```

## What To Import First

Start with the highest outcome-per-token parts:

1. `gsd-verifier` -> `gsd-lite-verify`
2. `gsd-code-reviewer` -> `gsd-lite-review`
3. `gsd-codebase-mapper` -> `map-codebase-architecture`
4. `gsd-planner` -> `gsd-lite-planner`
5. `gsd-executor` -> `gsd-lite-executor`
6. `gsd-debugger` -> `gsd-lite-debug` + Matt `diagnose`

Skip initially:

- roadmap/milestone machinery,
- workspaces,
- graph/intel systems,
- autonomous mode,
- update/install flows,
- profile/user modeling.

Those are useful only after the lean core proves itself.

## Caveman Suite

Import caveman helpers as first-class productivity skills:

- `caveman`
- `caveman-commit`
- `caveman-review`
- `caveman-compress`
- `caveman-help`
- `compress` legacy alias

Use structured terse output by default. Keep exact labels, paths, commands, dates, and evidence.
