# Meta-Prompting Contract

Inspired by GSD `plan-phase.md`: orchestrator stays lean, focused agents/skills do bounded work, checker loops improve output before execution.

## Loop

1. Initialize context:
   - project instructions: `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, ADRs
   - project skills: `.agents/skills`, `.claude/skills`, `.cursor/skills`, `.github/skills`
   - `.planning/current/*`
   - `.planning/codebase/*`
2. Normalize args:
   - goal, mode, flags, target files, phase/pivot/new-project intent
3. Gate missing context:
   - missing map on pivot -> stop and map
   - missing decision -> grill
   - missing verification path -> check fails
4. Run focused skill/agent:
   - map, new, pivot, plan, check, execute, verify, debug, review
5. Validate output:
   - artifacts exist
   - fields complete
   - paths exact
   - verification command present
6. Revise up to 3 times when checker returns fixable issues.
7. Escalate to user when blocker remains.

## Planning Standard

Plans are prompts. A different agent should execute without guessing.

Every executable task needs:

| Field | Meaning |
|---|---|
| files | exact files to create/change |
| action | concrete implementation instructions |
| verify | command/check proving behavior |
| done | observable acceptance criteria |

Must-haves are derived goal-backward:

1. What must be true for goal to be achieved?
2. Which artifacts must exist?
3. Which wires must connect artifacts?
4. Which tests/checks prove it?

## Revision Gate

Checker can return:

- `PASS`: execute.
- `NEEDS CLARITY`: grill user, update decisions, re-plan.
- `BLOCKED`: missing decision, unsafe scope, no verification, dependency conflict, or context too large.

Max 3 plan revisions. After that, write blocker to `.planning/current/QUESTIONS.md`.

## Research Policy

- Existing/pivot repo: map first.
- New project: local-first by default.
- Research only when user asks or when a new external framework/API/design decision is required.
- Technical docs should be primary sources when research happens.
