##Testing

## Core Principles
- Write failing tests before implementation (Red → Green → Refactor).
- Focus on what code does, not how it does it.
- Each test runs independently. No shared state between tests.
- Tests produce same results every run. No flaky tests.
- Unit tests run in milliseconds. Developers run them frequently.

## Test Types
- Unit tests — Individual functions, utilities, components in isolation. Mock dependencies.
- Integration tests — Components working together. API endpoints, database operations, service interactions.
- E2E tests — Critical user flows end-to-end. Use sparingly for essential paths only.

## TDD Workflow 
MANDATORY workflow:

- Write test first (RED)
- Run test - it should FAIL
- Write minimal implementation (GREEN)
- Run test - it should PASS
- Refactor (IMPROVE)
- Verify coverage (80%+)

## Test Structure
- Explain what's being tested and expected outcome.
- Clear setup, execution, verification in every test.
- Focus on single behavior. Multiple assertions only when tightly coupled.

## Mocking & Dependencies
- Isolate units by mocking databases, APIs, file systems, external services.
- Use real implementations for core business logic where possible.
- Document what is mocked and why.

### Data Management
- Reset database/state after each test suite.
- Use fixtures or factories for test data. Don't hardcode.
- Seed data through shared helpers for consistency.

## Coverage
- Block merges below 80% threshold.
- Coverage on business logic and critical paths is non-negotiable.
- Coverage alone doesn't guarantee quality. Focus on meaningful tests.

## Troubleshooting Test Failures
1. Check test isolation — are tests sharing state or dependencies?
2. Verify mocks are correct — do they match actual behavior?
3. Fix implementation, not tests — unless the test itself is wrong.
4. Review test assumptions — are preconditions still valid?

## Type Safety
- Maintain strict type checking in tests and implementation.
- Address type errors; don't suppress them.
- Tests validate types match reality.

## Quality Gates
Before merging:
- All tests pass
- Coverage meets threshold (80%+)
- Linter passes
- Type checker passes
- Build succeeds