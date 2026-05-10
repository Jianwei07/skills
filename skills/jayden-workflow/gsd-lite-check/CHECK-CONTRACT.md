# Check Contract

## Dimensions

| Dimension | Question |
|---|---|
| Requirement coverage | Does every must-have or requirement have tasks? |
| Task completeness | Does every task have files, action, verify, done? |
| Dependency correctness | Are task/order dependencies valid and acyclic? |
| Key links planned | Are artifacts wired together, not just created? |
| Scope sanity | Is the slice small enough for quality? |
| Verification derivation | Does verification prove the goal, not just command success? |
| Decision compliance | Accepted decisions honored, deferred ideas excluded? |

## Blockers

- Missing accepted decision.
- Unsafe scope reduction.
- No verification path.
- Pivot without map.
- Unplanned architecture/seam change.
- Dependency conflict.
- Secret/security risk.

## Output

```md
## Plan Check
Verdict: PASS | NEEDS CLARITY | BLOCKED

## Evidence
- <dimension>: <finding>

## Fix List
- <specific plan edit or question>
```
