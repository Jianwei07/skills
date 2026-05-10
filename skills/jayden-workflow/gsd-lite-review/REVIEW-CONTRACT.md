# Review Contract

## Modes

| Mode | Use |
|---|---|
| quick | pattern scan |
| standard | changed files, default |
| deep | cross-file data/control flow |

## Checks

- Bugs: null, async race, wrong branch, dead path.
- Security: XSS, injection, auth gap, path traversal, hardcoded secret.
- Reliability: swallowed errors, missing await, unchecked IO.
- Architecture: shallow Module, leaky Interface, poor Locality, fake Seam.
- Tests: missing coverage for changed behavior.

## Output

```md
## Findings
- [P1] path:line — problem. Fix.

## Checked
- files:
- mode:

## Residual Risk
- <if relevant>
```
