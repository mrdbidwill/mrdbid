# Decision Log

Short, durable records of decisions that affect architecture, behavior, or long-term maintenance.

## Template

- Date: YYYY-MM-DD
- Decision:
- Rationale:
- Consequences:
- Alternatives Considered:

## Entries

- Date: 2026-03-14
- Decision: Enforce demo-only access for public mushroom/image show pages and require Pundit authorization on show actions.
- Rationale: Align runtime behavior with the documented public/demo boundary and prevent unintended data exposure.
- Consequences: Guest requests to non-demo show pages now redirect with authorization messaging.
- Alternatives Considered: Leave show pages open to public; rejected due to privacy and policy drift.

- Date: 2026-03-14
- Decision: Serialize PDF/image exports per user using cache-based active export locks.
- Rationale: Avoid duplicate long-running export jobs and reduce queue pressure without removing features.
- Consequences: Users can queue one active export at a time (10-minute reentry window).
- Alternatives Considered: Dedicated database table; deferred for simplicity.

- Date: 2026-03-01
- Decision: Consolidate documentation into `docs/`, add `PROJECT_MEMORY.md`, and introduce this decision log.
- Rationale: Reduce regressions by centralizing institutional knowledge and making updates routine.
- Consequences: Docs moved from repo root to `docs/`, references updated, and `README.md` points to the index.
- Alternatives Considered: Leave docs distributed in root; rejected due to discoverability and drift.
