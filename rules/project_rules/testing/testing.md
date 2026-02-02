##Testing

## Core Principles
- **Test-driven development** — Write failing tests before implementation (Red → Green → Refactor).
- **Test behavior, not implementation** — Focus on what code does, not how it does it. Reduces brittleness during refactoring.
- **Test isolation** — Each test runs independently. No shared state between tests.
- **Deterministic tests** — Tests produce same results every run. No flaky tests.
- **Fast feedback** — Unit tests run in milliseconds. Developers run them frequently.

## Test Types (All Required)
- **Unit tests** — Individual functions, utilities, components in isolation. Mock dependencies.
- **Integration tests** — Components working together. API endpoints, database operations, service interactions.
- **E2E tests** — Critical user flows end-to-end. Use sparingly for essential paths only.

## TDD Workflow (Mandatory)
1. **Write test first (RED)** — Test describes desired behavior before implementation exists.
2. **Run test** — Verify it fails for the right reason.
3. **Write minimal implementation (GREEN)** — Simplest code to make test pass.
4. **Run test** — Verify it passes.
5. **Refactor (IMPROVE)** — Clean up code while keeping tests green.
6. **Verify coverage** — Ensure coverage meets threshold.

## Test Structure
- **Descriptive test names** — Explain what's being tested and expected outcome.
- **Arrange, Act, Assert** — Clear setup, execution, verification in every test.
- **One assertion per test** — Focus on single behavior. Multiple assertions only when tightly coupled.

## Mocking & Dependencies
- **Mock external dependencies** — Isolate units by mocking databases, APIs, file systems, external services.
- Use real implementations for core business logic where possible.
- Document what is mocked and why.

### Data Management
- Reset database/state after each test suite.
- Use fixtures or factories for test data. Don't hardcode.
- Seed data through shared helpers for consistency.

## Coverage
- **Minimum threshold: 80%** — Block merges below this threshold.
- **Track trends** — Monitor coverage over time. Gate PRs to prevent regressions.
- **Enforce in tooling** — Keep thresholds synchronized in test config and CI.
- **Exclude appropriately** — Don't count generated code, test files, or config files in coverage.
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

## Documentation
- Update test docs when approaches or tooling change.
- Document patterns for common scenarios (auth, async operations, error cases).
- Keep examples current with codebase.