## Testing

## Core Principles
- Write failing tests before implementation (Red → Green → Refactor).
- Focus on what code does, not how.
- Each test runs independently. No shared state.
- Tests produce same results every run. No flaky tests.
- Unit tests run in milliseconds.

## Test Types
- **Unit** — Individual functions, utilities, components in isolation. Mock dependencies.
- **Integration** — Components working together. API endpoints, database operations, service interactions.
- **E2E** — Critical user flows. Use sparingly for essential paths.

## TDD Workflow
MANDATORY:

- Write test first (RED)
- Run test → should FAIL
- Write minimal implementation (GREEN)
- Run test → should PASS
- Refactor (IMPROVE)
- Verify coverage (80%+)

## Test Structure
- Explain what's tested and expected outcome.
- Clear setup, execution, verification.
- Focus on single behavior. Multiple assertions only when tightly coupled.

## Mocking & Dependencies
- Isolate units by mocking databases, APIs, file systems, external services.
- Use real implementations for core business logic.
- Document what is mocked and why.

### Data Management
- Reset database/state after each test suite.
- Use fixtures or factories for test data. Avoid hardcoding.
- Seed data through shared helpers.

## Coverage
- Block merges below 80% threshold.
- Business logic and critical paths require coverage.
- Coverage doesn't guarantee quality. Focus on meaningful tests.

## Troubleshooting Test Failures
- Check test isolation. Tests sharing state or dependencies?
- Verify mocks match actual behavior.
- Fix implementation, not tests (unless test is wrong).
- Review test assumptions. Preconditions still valid?

## Type Safety
- Maintain strict type checking in tests and implementation.
- Address type errors. Never suppress.
- Tests validate types match reality.

## Quality Gates
- All tests pass
- Coverage meets 80%+ threshold
- Linter passes
- Type checker passes
- Build succeeds