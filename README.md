# Jayden Skills

A personal, versioned, agent-agnostic skills repo.

Goal: keep the workflows clean, minimal, and practical. Curated skills live in `core/` and `project/`. Imported/reference material stays separate until reviewed.

## Structure

- `VERSION` — current repo version
- `CHANGELOG.md` — small release/change log
- `skills/core/` — reusable operating principles and workflows
- `skills/project/` — project execution, planning, debugging, reviewing, shipping
- `skills/misc/` — useful but not yet fully curated
- `skills/imported/` — copied/reference skills, not active by default
- `skills/deprecated/` — old or superseded skills retained for reference
- `scripts/` — lightweight install/list helpers only
- `opencode/` and `.claude-plugin/` — thin adapter files, not the source of truth

## Curation rules

- Keep imported skills separate from curated skills.
- Promote only reviewed, useful skills into `core/` or `project/`.
- Prefer renaming, moving, or deprecating over deleting until duplicates are confirmed.
- Do not copy this whole repo into project repos.
- Project repos should get only small local context files or planning docs when needed.
- Avoid big adapter/plugin systems unless the repo clearly needs them.

## Active skills

### Core

Real reusable operating principles and workflows I want agents to follow by default.

- **[caveman](./skills/core/caveman/SKILL.md)** — Ultra-compressed communication mode. Cuts token usage ~75% by dropping filler, articles, and pleasantries while keeping full technical accuracy. Use when user says "caveman mode", "talk like caveman", "use caveman", "less tokens", "be brief", or invokes /caveman.
- **[caveman-commit](./skills/core/caveman-commit/SKILL.md)** — Ultra-compressed commit message generator. Cuts noise from commit messages while preserving intent and reasoning. Conventional Commits format. Subject ≤50 chars, body only when "why" isn't obvious. Use when user says "write a commit", "commit message", "generate commit", "/commit", or invokes /caveman-commit. Auto-triggers when staging changes.
- **[caveman-compress](./skills/core/caveman-compress/SKILL.md)** — Compress natural language memory files (CLAUDE.md, todos, preferences) into caveman format to save input tokens. Preserves all technical substance, code, URLs, and structure. Compressed version overwrites the original file. Human-readable backup saved as FILE.original.md. Trigger: /caveman:compress <filepath> or "compress memory file"
- **[caveman-help](./skills/core/caveman-help/SKILL.md)** — Quick-reference card for all caveman modes, skills, and commands. One-shot display, not a persistent mode. Trigger: /caveman-help, "caveman help", "what caveman commands", "how do I use caveman".
- **[caveman-review](./skills/core/caveman-review/SKILL.md)** — Ultra-compressed code review comments. Cuts noise from PR feedback while preserving the actionable signal. Each comment is one line: location, problem, fix. Use when user says "review this PR", "code review", "review the diff", "/review", or invokes /caveman-review. Auto-triggers when reviewing pull requests.
- **[grill-me](./skills/core/grill-me/SKILL.md)** — Interview the user relentlessly about a plan or design until reaching shared understanding, resolving each branch of the decision tree. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".
- **[jayden-workflow](./skills/core/jayden-workflow/SKILL.md)** — Top-level Jayden Workflow operating system for layered GSD-lite work. Use when choosing or orchestrating Map/New/Pivot -> Plan -> Check -> Execute -> Verify workflows across OpenCode, Claude Code, or Codex.
- **[write-a-skill](./skills/core/write-a-skill/SKILL.md)** — Create new agent skills with proper structure, progressive disclosure, and bundled resources. Use when user wants to create, write, or build a new skill.

### Project

Project execution, planning, debugging, reviewing, and shipping workflows.

- **[diagnose](./skills/project/diagnose/SKILL.md)** — Disciplined diagnosis loop for hard bugs and performance regressions. Reproduce → minimise → hypothesise → instrument → fix → regression-test. Use when user says "diagnose this" / "debug this", reports a bug, says something is broken/throwing/failing, or describes a performance regression.
- **[grill-with-docs](./skills/project/grill-with-docs/SKILL.md)** — Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates documentation (CONTEXT.md, ADRs) inline as decisions crystallise. Use when user wants to stress-test a plan against their project's language and documented decisions.
- **[gsd-lite-check](./skills/project/gsd-lite-check/SKILL.md)** — Pre-execution gate for Jayden Workflow plans. Use after gsd-lite-plan and before gsd-lite-execute to verify the plan will achieve the goal.
- **[gsd-lite-context](./skills/project/gsd-lite-context/SKILL.md)** — Defines project-local `.planning/` as Jayden Workflow's central context spine. Use before planning, checking, executing, verifying, debugging, reviewing, pivoting, or starting new project work.
- **[gsd-lite-debug](./skills/project/gsd-lite-debug/SKILL.md)** — Persistent Jayden Workflow debugging wrapper around Matt's diagnose loop. Use when a bug needs root-cause investigation, evidence, and cross-turn state.
- **[gsd-lite-execute](./skills/project/gsd-lite-execute/SKILL.md)** — Executes approved Jayden Workflow plans from `.planning/current/*` while following codebase maps and stop gates. Use only after gsd-lite-check passes or user explicitly overrides.
- **[gsd-lite-new-project](./skills/project/gsd-lite-new-project/SKILL.md)** — High-level Jayden Workflow orchestrator for new repos or product ideas. Use when starting a new side project or converting a rough idea into `.planning/` and a first checked plan.
- **[gsd-lite-pivot](./skills/project/gsd-lite-pivot/SKILL.md)** — High-level Jayden Workflow orchestrator for stale, dead, or wrong-direction projects. Use when existing code should be reframed, rebuilt, or aggressively simplified before execution.
- **[gsd-lite-plan](./skills/project/gsd-lite-plan/SKILL.md)** — Creates decision-complete executable plans using Jayden Workflow meta-prompting, codebase maps, and Matt architecture language. Use for feature, bugfix, refactor, pivot, or first-slice planning before execution.
- **[gsd-lite-review](./skills/project/gsd-lite-review/SKILL.md)** — Decoupled Jayden Workflow review for changed files. Use when reviewing diffs for bugs, security risks, missing wiring, shallow modules, and maintainability issues.
- **[gsd-lite-verify](./skills/project/gsd-lite-verify/SKILL.md)** — Goal-backward verification for Jayden Workflow. Use after execution to prove the implementation achieved the promised outcome, not merely completed tasks.
- **[improve-codebase-architecture](./skills/project/improve-codebase-architecture/SKILL.md)** — Find deepening opportunities in a codebase, informed by the domain language in CONTEXT.md and the decisions in docs/adr/. Use when the user wants to improve architecture, find refactoring opportunities, consolidate tightly-coupled modules, or make a codebase more testable and AI-navigable.
- **[map-codebase-architecture](./skills/project/map-codebase-architecture/SKILL.md)** — Map a codebase into GSD-compatible `.planning/codebase/` docs using GSD mapper structure plus Matt-style Module/Interface/Seam/Depth vocabulary. Use before planning, pivoting, execution, refactors, or onboarding to a brownfield repo.
- **[tdd](./skills/project/tdd/SKILL.md)** — Test-driven development with red-green-refactor loop. Use when user wants to build features or fix bugs using TDD, mentions "red-green-refactor", wants integration tests, or asks for test-first development.
- **[to-issues](./skills/project/to-issues/SKILL.md)** — Break a plan, spec, or PRD into independently-grabbable issues on the project issue tracker using tracer-bullet vertical slices. Use when user wants to convert a plan into issues, create implementation tickets, or break down work into issues.
- **[to-prd](./skills/project/to-prd/SKILL.md)** — Turn the current conversation context into a PRD and publish it to the project issue tracker. Use when user wants to create a PRD from the current context.
- **[triage](./skills/project/triage/SKILL.md)** — Triage issues through a state machine driven by triage roles. Use when user wants to create an issue, triage issues, review incoming bugs or feature requests, prepare issues for an AFK agent, or manage issue workflow.
- **[zoom-out](./skills/project/zoom-out/SKILL.md)** — Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how it fits into the bigger picture.

### Misc

Useful skills that are not yet curated enough for core/project.

- **[edit-article](./skills/misc/edit-article/SKILL.md)** — Edit and improve articles by restructuring sections, improving clarity, and tightening prose. Use when user wants to edit, revise, or improve an article draft.
- **[git-guardrails-claude-code](./skills/misc/git-guardrails-claude-code/SKILL.md)** — Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before they execute. Use when user wants to prevent destructive git operations, add git safety hooks, or block git push/reset in Claude Code.
- **[migrate-to-shoehorn](./skills/misc/migrate-to-shoehorn/SKILL.md)** — Migrate test files from `as` type assertions to @total-typescript/shoehorn. Use when user mentions shoehorn, wants to replace `as` in tests, or needs partial test data.
- **[obsidian-vault](./skills/misc/obsidian-vault/SKILL.md)** — Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
- **[scaffold-exercises](./skills/misc/scaffold-exercises/SKILL.md)** — Create exercise directory structures with sections, problems, solutions, and explainers that pass linting. Use when user wants to scaffold exercises, create exercise stubs, or set up a new course section.
- **[setup-pre-commit](./skills/misc/setup-pre-commit/SKILL.md)** — Set up Husky pre-commit hooks with lint-staged (Prettier), type checking, and tests in the current repo. Use when user wants to add pre-commit hooks, set up Husky, configure lint-staged, or add commit-time formatting/typechecking/testing.

## Reference only

### Imported

Copied or reference skills kept separate until reviewed and promoted.

- **[setup-matt-pocock-skills](./skills/imported/setup-matt-pocock-skills/SKILL.md)** — Sets up an `## Agent skills` block in AGENTS.md/CLAUDE.md and `docs/agents/` so the engineering skills know this repo's issue tracker (GitHub or local markdown), triage label vocabulary, and domain doc layout. Run before first use of `to-issues`, `to-prd`, `triage`, `diagnose`, `tdd`, `improve-codebase-architecture`, or `zoom-out` — or if those skills appear to be missing context about the issue tracker, triage labels, or domain docs.

### Deprecated

Old or superseded skills retained for reference. Not part of the active set.

- **[compress](./skills/deprecated/compress/SKILL.md)** — Legacy alias for `caveman-compress`; deprecated because it duplicated the full implementation.
- **[design-an-interface](./skills/deprecated/design-an-interface/SKILL.md)** — Generate multiple radically different interface designs for a module using parallel sub-agents. Use when user wants to design an API, explore interface options, compare module shapes, or mentions "design it twice".
- **[qa](./skills/deprecated/qa/SKILL.md)** — Interactive QA session where user reports bugs or issues conversationally, and the agent files GitHub issues. Explores the codebase in the background for context and domain language. Use when user wants to report bugs, do QA, file issues conversationally, or mentions "QA session".
- **[request-refactor-plan](./skills/deprecated/request-refactor-plan/SKILL.md)** — Create a detailed refactor plan with tiny commits via user interview, then file it as a GitHub issue. Use when user wants to plan a refactor, create a refactoring RFC, or break a refactor into safe incremental steps.
- **[ubiquitous-language](./skills/deprecated/ubiquitous-language/SKILL.md)** — Extract a DDD-style ubiquitous language glossary from the current conversation, flagging ambiguities and proposing canonical terms. Saves to UBIQUITOUS_LANGUAGE.md. Use when user wants to define domain terms, build a glossary, harden terminology, create a ubiquitous language, or mentions "domain model" or "DDD".

## Install

Skills are global to the agent runtime, not copied into each project repo.
Project repos should only get small local context files such as `.planning/`, `AGENTS.md`, or `CLAUDE.md` when needed.

### Hermes

```bash
./scripts/install-hermes.sh
```

This symlinks active skills from `skills/core`, `skills/project`, and `skills/misc` into `~/.hermes/skills`.
It does not install `skills/imported` or `skills/deprecated`.

After installing, start a new Hermes session or run `/reload-skills`.

### OpenCode

```bash
./scripts/install-opencode.sh
```

This syncs thin OpenCode commands/agents and links the same active skill set into `~/.agents/skills`.

### Claude Code

```bash
./scripts/link-skills.sh
```

This links the active skill set into `~/.claude/skills`.

## Maintenance

```bash
./scripts/list-skills.sh
```
