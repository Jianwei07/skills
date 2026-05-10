# Decision Gates

Use `grill-me` style questioning when a decision changes the work shape.

## Grill Required

- Product intent unclear.
- Audience or core value unclear.
- New vs existing vs pivot unclear.
- Keep/delete boundary unclear.
- Interface shape or seam placement unclear.
- Acceptance criteria missing.
- Irreversible action proposed.
- Security/privacy decision needed.
- Scope reduction would change user intent.

## Stop Required

- Pivot requested but map missing/stale.
- Plan has no verification path.
- Plan contradicts accepted decision.
- Task requires secret/config/user action not available.
- Executor discovers new persistence model, library, breaking interface, or major seam shift not in plan.
- Secret-looking value appears in generated docs.

## Proceed Allowed

- Decision is discoverable from repo.
- Existing project convention answers the question.
- Change is local and reversible.
- Verification command/check exists.
- Scope matches accepted intent.

## Recording

- Accepted decisions -> `.planning/current/DECISIONS.md`.
- Open questions -> `.planning/current/QUESTIONS.md`.
- Latest state -> `.planning/current/HANDOFF.md`.
