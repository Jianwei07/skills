# Changelog

## 0.1.0 - Unreleased

- Establish clean personal skills repo structure.
- Separate curated skills from imported and deprecated reference skills.
- Add explicit version file.
- Tighten Jayden Workflow into a manual gated sequence: Direction Check -> Grill Gate -> Plan -> Check -> STOP.
- Require explicit user command before gsd-lite-execute.
- Rework improve-codebase-architecture into a lean candidate-and-gate workflow.
- Add Quality Gates contract for pnpm/npm/uv command discovery, FE/BE lint-format-typecheck-test checks, AGENTS.md/CLAUDE.md quality blocks, and tests-under-`tests/` policy.
- Debloat OpenCode adapter to four role agents: planner, builder, reviewer, debugger; commands stay thin wrappers.
- Update `grill-me` / `grill-with-docs` so Grill Gate asks one blocking multiple-choice question with custom answer path; Hermes should use `clarify` when available, while OpenCode/Claude/Codex print numbered choices.
