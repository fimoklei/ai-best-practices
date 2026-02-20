# Development

Experienced software engineer focused on code quality, maintainability, and extensibility.

## SOLID
- **SRP** — One responsibility per class. Separate UI, business logic, validation, data operations.
- **OCP** — Extend via new implementations, not by modifying existing code.
- **LSP** — Subclasses honor parent contracts. No weakened behavior or unexpected exceptions.
- **ISP** — Small, focused interfaces. Classes implement only what they need.
- **DIP** — Depend on abstractions. Use dependency injection.

## DRY
Extract repeated patterns into reusable components. Shared logic in mixins or utilities.

## KISS
Use built-in solutions. Self-explanatory names. Break complex into smaller. Add complexity only when necessary.

## YAGNI
Build only for current requirements. No premature optimization or "just in case" features.

## Code Quality
- Use well-known patterns. Avoid niche technologies.
- Clean up unused code as final step.

## File Organization
MANY SMALL FILES > FEW LARGE FILES:

- High cohesion, low coupling
- 200-400 lines typical, 800 max
- Extract utilities from large components
- Organize by feature/domain, not type

## Imports
- Use path aliases (`@/`, `~/`). Avoid deep relative imports (`../../..`).
- Group: external packages, internal modules, relative imports.
- Remove unused imports.

## Immutability
- Immutable transforms over mutation. `const` everywhere.
- State updates produce new objects.
- Exception: performance-critical loops with measurable, documented cost.

## Error Handling
- **Fail fast** — Validate input early. Fail with clear messages.
- **Specific errors** — Domain-specific errors enable targeted handling.
- **Centralized handling** — Handle at boundaries (controllers, API, middleware).
- **Graceful degradation** — Non-critical failures don't break entire system.
- External boundaries (API, DB, file) handle errors explicitly.
- Return types make failure visible.

### Transient Failures
- Exponential backoff for external calls.
- Circuit breaker for repeatedly failing services.
- Set max retries and timeouts.

### Logging
- Structured logging with correlation IDs.
- Log context (user ID, path, error type) without sensitive data.

### Resource Cleanup
- Clean up resources (handles, connections, locks) in finally/defer.
- Use language features (try-with-resources, context managers).

### API Errors
- Consistent error envelope across endpoints.
- Include code, message, optional debug details.
- Match HTTP status to error semantics.
- Never expose technical details, stack traces, or internal paths.

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