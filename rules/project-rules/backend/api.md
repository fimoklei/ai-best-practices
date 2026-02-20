# API Standards

## Versioning
- Include explicit version in all endpoints (`/api/v1/`, `/api/v2/`).
- Deploy only versioned endpoints to production.
- Ship breaking changes as new versions. Ship non-breaking changes (additive fields, optional params) in existing versions.

## REST Conventions
- Use resource-based URLs with plural nouns (`/users`, `/orders`).
- Match HTTP methods to intent: GET (read), POST (create), PUT (replace), PATCH (update), DELETE (remove).
- Limit nested resources to 2 levels (`/users/123/orders` works, `/users/123/orders/456/items` does not).
- Use query params for filtering, sorting, pagination, search.

## Request/Response Format
- Validate requests at boundary before business logic. Return structured 4xx errors on failure.
- Use consistent response envelope: `{ data, meta?, errors? }`.
- Use semantic status codes: 200 (success), 201 (created), 400 (bad request), 401 (unauthorized), 403 (forbidden), 404 (not found), 500 (server error).
- Structure errors as `{ error: { code, message, details? } }`. Prohibit stack traces and internal paths in client responses.

## Pagination
- Small datasets: offset (`page`, `pageSize`).
- Large/append-only: cursor (`cursor`, `limit`).
- Return pagination metadata: `meta.pagination` with `total`, `hasNext`, and cursor/page info.

## Security
- Authenticate at boundary before business logic.
- Validate authorization per resource, not per endpoint alone.
- Apply rate limits to all public endpoints.
- Set CORS policies explicitly and minimally. Prohibit `*` in production.

## Observability
- Log structured data with correlation IDs and request metadata (method, path, status, latency).
- Centralize error handling to log full context without exposing to clients.
- Provide health check endpoint (`/health` or `/api/health`).