# Database Migrations

## Core Principles
- **Reversible** — Every migration must be reversible. Provide down scripts or documented rollback steps.
- **Small & focused** — One logical change per migration. Easier to troubleshoot and roll back.
- **Idempotent** — Migrations can run multiple times safely without side effects.
- **Version controlled** — Commit migrations sequentially. Never modify a shipped migration; create a new one to fix issues.
- **Track applied migrations** — Use a dedicated table/collection to record which migrations have run. Never rely on filesystem inspection.

## Zero-Downtime Deployments
- New code must tolerate both old and new schemas during rollout.
- **Multi-phase pattern**: (1) Add new column/table, (2) backfill data, (3) switch code, (4) remove old column/table.
- Use feature flags for data backfills when needed.

## Schema vs. Data
- Separate schema changes (DDL) from data migrations (DML).
- Data backfills run as idempotent scripts that can resume safely if interrupted.
- Never mix DDL and large data operations in a single migration.

## Index Management
- Build indexes online/in background to avoid blocking writes.
- Coordinate index changes with query plan reviews before production.
- Drop unused indexes before adding new ones to minimize overhead.

## Safety & Observability
- Capture backups before destructive migrations (DROP, TRUNCATE, ALTER with data loss).
- Log execution metrics: start time, duration, rows affected.
- Alert on anomalies (timeouts, excessive duration, error rates).

## Testing & Verification
- Run migrations in staging with production-like data volume.
- Verify before/after metrics (row counts, query performance, disk usage).
- Cover migrations with integration tests where feasible.

## Naming & Organization
- Timestamp-prefixed filenames: `YYYYMMDDHHMMSS-description.sql` (e.g., `20251016120000-add-user-email-index.sql`).
- Description is imperative and specific: `add-user-email-index`, not `update-users`.

## Automation
- Integrate migration execution into deployment pipeline.
- Document manual runbooks for emergency rollback scenarios.
- Ensure migration tooling and env vars are consistent across local, staging, production.