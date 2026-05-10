---
name: grill-me
description: "Clarify a plan/design with one blocking question at a time. Use interactive choice UI when available; otherwise print choices and stop. Use when user says grill me, a workflow hits Grill Gate, or a plan needs decision-tree stress testing."
---

# Grill Me

Purpose: resolve plan/design ambiguity without execution theater.

## Core Loop

1. Inspect first. If code/docs can answer the question, read them instead of asking.
2. Ask exactly one blocking question at a time.
3. Provide 2-4 concrete options plus a custom/other path.
4. Mark one option as recommended when useful, but do not hide alternatives.
5. Wait for the user's answer before continuing.
6. Record durable decisions in the project docs only when the current workflow asks for it.

## Runtime UX Rule

Use the best interaction mode the runtime supports:

- Hermes: call the `clarify` tool with `choices` whenever available. Hermes will render multiple options plus Other/custom answer.
- OpenCode / Claude Code / Codex / plain CLI: print numbered options and say the user may type a custom answer.
- Background / non-interactive runs: write the single blocking question and options to the workflow handoff/questions file, then stop.

Do not replace an interactive question with only `Recommended answer: yes`.

## Question Shape

Good:

```text
Choose first slice:
1. Static workspace shell only — safest free-tier harness test
2. Serverless Vercel BFF + hosted LLM — recommended if testing production LLM path
3. Local FastAPI/local LLM only — good dev loop, not Vercel-first
4. Plan UI + contracts only — defer backend/provider
Other: type your own answer
```

Bad:

```text
Should we do serverless Vercel BFF with Gemini? Recommended answer: yes.
```

## Docs / Decisions

- For plain grilling, do not edit files unless the user/workflow explicitly asks.
- For docs-aware grilling, use `grill-with-docs` instead.
- If used inside Jayden/GSD-lite, record blocking unanswered questions in `.planning/current/QUESTIONS.md` and resolved decisions in `.planning/current/DECISIONS.md` when those files exist or are required by the workflow.

## Stop Rules

Stop and ask when the answer changes:

- direction
- first-slice scope
- Interface/API shape
- keep/delete call
- irreversible action
- acceptance criteria
- cost/provider/deployment posture

Skip grilling when ambiguity is low-impact or can be safely deferred.
