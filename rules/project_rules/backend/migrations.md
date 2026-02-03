# Database Migrations

## Core Principles
- **Reversible** — Provide down scripts or documented rollback steps for every migration.
- **Small & focused** — One logical change per migration.
- **Idempotent** — Migrations run multiple times safely without side effects.
- **Version controlled** — Commit sequentially. Create new migrations to fix issues, never modify shipped ones.
- **Track applied migrations** — Use dedicated table/collection to record completed migrations.

## Zero-Downtime Deployments
- New code tolerates both old and new schemas during rollout.
- **Multi-phase pattern**: (1) Add column/table, (2) backfill data, (3) switch code, (4) remove old column/table.
- Use feature flags for data backfills.

## Schema vs. Data
- Separate schema changes (DDL) from data migrations (DML).
- Write data backfills as idempotent scripts that resume safely if interrupted.
- Prohibit mixing DDL and large data operations in single migration.

## Index Management
- Build indexes online/in background to avoid blocking writes.
- Coordinate index changes with query plan reviews before production.
- Drop unused indexes before adding new ones.

## Safety & Observability
- Capture backups before destructive migrations (DROP, TRUNCATE, ALTER with data loss).
- Log execution metrics: start time, duration, rows affected.
- Alert on anomalies (timeouts, excessive duration, error rates).

## Testing & Verification
- Run migrations in staging with production-like data volume.
- Verify before/after metrics (row counts, query performance, disk usage).
- Cover migrations with integration tests.

## Naming & Organization
- Timestamp-prefixed filenames: `YYYYMMDDHHMMSS-description.sql` (e.g., `20251016120000-add-user-email-index.sql`).
- Use imperative, specific descriptions: `add-user-email-index`, not `update-users`.

## Automation
- Integrate migration execution into deployment pipeline.
- Document manual runbooks for emergency rollback.
- Keep migration tooling and env vars consistent across environments.