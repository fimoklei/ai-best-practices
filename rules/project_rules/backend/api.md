# API Standards

## Versioning
- All endpoints must include explicit version (`/api/v1/`, `/api/v2/`).
- Never deploy unversioned endpoints to production.
- Breaking changes require a new version. Non-breaking changes (additive fields, new optional params) can ship in existing versions.

## REST Conventions
- Resource-based URLs with plural nouns (`/users`, `/orders`).
- HTTP methods match intent: GET (read), POST (create), PUT (replace), PATCH (update), DELETE (remove).
- Nested resources limited to 2 levels (`/users/123/orders` is fine, `/users/123/orders/456/items` is not).
- Query params for filtering, sorting, pagination, search — not separate endpoints.

## Request/Response Format
- **Request validation at the boundary** — Validate before business logic executes. Return structured 4xx errors on failure.
- **Response envelope** — Consistent structure: `{ data, meta?, errors? }`.
- **HTTP status codes** — Use semantically: 200 (success), 201 (created), 400 (bad request), 401 (unauthorized), 403 (forbidden), 404 (not found), 500 (server error).
- **Error structure** — `{ error: { code, message, details? } }`. Never leak stack traces or internal paths to clients.

## Pagination
- Small datasets: offset (`page`, `pageSize`).
- Large/append-only: cursor (`cursor`, `limit`).
- Always return metadata: `meta.pagination` with `total`, `hasNext`, and relevant cursor/page info.

## Security
- Authenticate at the boundary. No business logic before auth check.
- Validate authorization per-resource, not just per-endpoint.
- Rate limit all public endpoints.
- CORS policies explicit and minimal — no `*` in production.

## Observability
- Structured logging with correlation IDs and request metadata (method, path, status, latency).
- Centralized error handling that logs full context without exposing it to clients.
- Health check endpoint (`/health` or `/api/health`) for monitoring.