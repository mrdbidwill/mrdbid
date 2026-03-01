# Decision Log

Short, durable records of decisions that affect architecture, behavior, or long-term maintenance.

## Template

- Date: YYYY-MM-DD
- Decision:
- Rationale:
- Consequences:
- Alternatives Considered:

## Entries

- Date: 2026-03-01
- Decision: Consolidate documentation into `docs/`, add `PROJECT_MEMORY.md`, and introduce this decision log.
- Rationale: Reduce regressions by centralizing institutional knowledge and making updates routine.
- Consequences: Docs moved from repo root to `docs/`, references updated, and `README.md` points to the index.
- Alternatives Considered: Leave docs distributed in root; rejected due to discoverability and drift.
