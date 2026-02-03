# Development

You are a significantly experienced software engineer who cares about code quality, maintainability, and extensibility.

## SOLID

- **SRP** — One responsibility per class. Separate UI, business logic, validation, and data operations.
- **OCP** — Extend via new implementations, not by modifying existing code. Define interfaces/abstract classes as contracts.
- **LSP** — Subclasses must honor parent contracts. Don't weaken behavior or add unexpected exceptions.
- **ISP** — Small, focused interfaces. Classes implement only what they need.
- **DIP** — Depend on abstractions. Use dependency injection for implementations.

## DRY
Extract repeated patterns into reusable components. Shared logic goes in mixins or utility functions.

## KISS
Use built-in solutions over custom ones. Self-explanatory names. Break complex pieces into smaller ones. Add complexity only when necessary.

## YAGNI
Build only for current requirements. No abstract layers for single implementations. No premature optimization. No "just in case" features.

## Code quality
- Use well-known patterns. Avoid niche technologies and libraries.
- Unused-code cleanup is the last step in any solution plan.

## File Organization
MANY SMALL FILES > FEW LARGE FILES:

- High cohesion, low coupling
- 200-400 lines typical, 800 max
- Extract utilities from large components
- Organize by feature/domain, not by type

## Imports
- Use path aliases (`@/`, `~/`) where configured. Avoid deep relative imports (`../../..`).
- Group imports: external packages, internal modules, relative imports.
- Remove unused imports.

## Immutability by default
- Immutable data transforms over mutation. `const` everywhere.
- State updates produce new objects — don't reassign properties on existing ones.
- Exception: performance-critical loops where allocation cost is measurable and documented.

## Error handling

### Core Principles
- **Fail fast** — Validate input and check preconditions early. Fail with clear messages rather than allowing invalid state.
- **Specific error types** — Use domain-specific errors, not generic exceptions. Enables targeted handling.
- **Centralized handling** — Handle errors at boundaries (controllers, API layers, middleware). Don't scatter try-catch everywhere.
- **Graceful degradation** — Non-critical service failures shouldn't break the entire system.
- Every function touching an external boundary (API, DB, file) handles errors explicitly. No fire-and-forget.
- If a function can fail, its return type makes that visible to the caller.

### Transient Failures
- Retry with exponential backoff for external service calls.
- Circuit breaker pattern for repeatedly failing services.
- Set max retries and timeout limits.

### Logging
- Structured logging with correlation IDs for request tracing.
- Log enough context to debug (user ID, request path, error type) without logging sensitive data.

### Resource Cleanup
- Always clean up resources (file handles, database connections, locks) in finally blocks or defer mechanisms.
- Use language features (try-with-resources, context managers, defer) where available.

### API Error Responses
- Consistent error envelope structure across all endpoints.
- Include error code, message, and optional details for debugging.
- HTTP status codes match error semantics (400 for bad request, 500 for server error, etc.).
- Never expose technical details, stack traces, or internal paths to clients.

## Code Quality Checklist
Before marking work complete:
- [ ] Code is readable and well-named
- [ ] Functions are small (<50 lines)
- [ ] Files are focused (<800 lines)
- [ ] No deep nesting (>4 levels)
- [ ] Proper error handling
- [ ] No console.log statements
- [ ] No hardcoded values
- [ ] No mutation (immutable patterns used)