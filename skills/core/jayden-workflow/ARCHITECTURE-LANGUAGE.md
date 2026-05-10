# Architecture Language Contract

Source: Matt `improve-codebase-architecture`.

Use these exact terms.

| Term | Meaning |
|---|---|
| Module | Anything with an interface and implementation. |
| Interface | Everything caller must know: types, invariants, ordering, errors, config, performance. |
| Implementation | Code hidden behind the interface. |
| Seam | Place where behavior can change without editing in place. |
| Adapter | Concrete thing satisfying an interface at a seam. |
| Depth | Leverage at interface: lots of behavior behind small interface. |
| Leverage | What callers get from depth. |
| Locality | What maintainers get: change and bugs concentrated. |

## Principles

- Say `seam`, not boundary.
- Avoid `component/service/API` when discussing architecture shape.
- Apply deletion test: if deleting a module makes complexity vanish, it was shallow. If complexity spreads across callers, it earned depth.
- Interface is the test surface.
- One adapter = hypothetical seam. Two adapters = real seam.

## Where Used

- Map: `ARCHITECTURE.md`, `CONCERNS.md`.
- Plan: task design, module contracts, interface-first ordering.
- Check: shallow plan detection, missing seams, unwired adapters.
- Execute: stop for unplanned seam/interface changes.
- Review: flag shallow modules, poor locality, leaky interfaces.
