# Validation

## Core Principles
- **Server-side is mandatory** — Never trust client-side validation alone. Always validate on the server.
- **Client-side for UX** — Provide immediate feedback to users, but duplicate checks server-side.
- **Consistent validation** — Apply the same rules across all entry points (web forms, API endpoints, background jobs).

## Validation Rules
- **Allowlists over blocklists** — Define what is allowed, not what to block.
- **Type and format checking** — Validate data types, formats, ranges, required fields.
- **Business rules at appropriate layer** — Domain constraints (sufficient balance, valid date ranges) validate in business logic, not at the boundary.
- **Specific error messages** — Field-specific feedback that helps users correct input.

## Schema Management
- Centralize validation schemas in a shared location.
- Reuse schemas across client forms, API handlers, and database operations.
- Single source of truth for what constitutes valid data.

## Normalization
- Normalize input before validation (trim whitespace, lowercase emails, coerce types).
- Apply normalization consistently across all entry points.
- Document normalization rules alongside validation schemas.
