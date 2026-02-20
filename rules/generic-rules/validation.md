# Validation

## Core Principles
- **Server-side mandatory** — Always validate server-side. Never trust client alone.
- **Client-side for UX** — Immediate feedback, but duplicate checks server-side.
- **Consistent rules** — Apply across all entry points (forms, APIs, background jobs).

## Rules
- **Allowlists over blocklists** — Define what's allowed, not what to block.
- **Type and format checking** — Validate types, formats, ranges, required fields.
- **Business rules in logic layer** — Domain constraints (balance, date ranges) validate in business logic, not boundary.
- **Specific errors** — Field-specific feedback helps users correct input.

## Schema Management
- Centralize schemas in shared location.
- Reuse across client forms, API handlers, database operations.
- Single source of truth for valid data.

## Normalization
- Normalize before validation (trim whitespace, lowercase emails, coerce types).
- Apply consistently across entry points.
- Document normalization rules alongside schemas.
