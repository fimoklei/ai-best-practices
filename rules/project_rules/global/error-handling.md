# Error Handling

## Core Principles
- **Fail fast** — Validate input and check preconditions early. Fail with clear messages rather than allowing invalid state.
- **Specific error types** — Use domain-specific errors, not generic exceptions. Enables targeted handling.
- **Centralized handling** — Handle errors at boundaries (controllers, API layers, middleware). Don't scatter try-catch everywhere.
- **Graceful degradation** — Non-critical service failures shouldn't break the entire system.

## User-Facing Errors
- Clear, actionable messages for users.
- Never expose technical details, stack traces, or internal paths to clients.
- Consistent error structure across API responses.

## Transient Failures
- Retry with exponential backoff for external service calls.
- Circuit breaker pattern for repeatedly failing services.
- Set max retries and timeout limits.

## Logging
- Structured logging with correlation IDs for request tracing.
- Log enough context to debug (user ID, request path, error type) without logging sensitive data.
- Centralize log collection for observability pipelines.

## Resource Cleanup
- Always clean up resources (file handles, database connections, locks) in finally blocks or defer mechanisms.
- Use language features (try-with-resources, context managers, defer) where available.

## API Error Responses
- Consistent error envelope structure across all endpoints.
- Include error code, message, and optional details for debugging.
- HTTP status codes match error semantics (400 for bad request, 500 for server error, etc.).