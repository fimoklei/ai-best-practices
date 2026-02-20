---
paths:
  - "tests/**/*"
  - "**/*.test.ts"
  - "**/*.test.tsx"
  - "**/*.spec.ts"
  - "**/*.spec.tsx"
---

## Testing

Stack: Vitest + React Testing Library + Testing Library User Event

Tests in `tests/` organized by type: `unit/`, `integration/`, `e2e/`

## Core Principles
- Focus on behavior, not implementation
- Independent tests—no shared state
- Fast unit tests (<100ms each)
- Deterministic results—no flaky tests

## Test Types
- **Unit** (`tests/unit/`) — Functions, utilities, components in isolation. Mock external dependencies.
- **Integration** (`tests/integration/`) — Server actions, API routes, database operations.
- **E2E** (`tests/e2e/`) — Critical user flows only. Use sparingly.

## TDD Workflow
Use `Skill(superpowers:test-driven-development)` for RED → GREEN → REFACTOR cycle before implementation.

## Project-Specific Patterns

### Next.js Testing
- **Server Components:** Test data fetching logic in isolation
- **Server Actions:** Mock `revalidatePath` and verify side effects
- **API Routes:** Use `NextRequest`/`NextResponse` mocks from Next.js test utils

### React Testing Library
- Query priority: getByRole → getByLabelText → getByText → getByTestId
- Use `userEvent` over `fireEvent` for realistic interactions
- Avoid testing implementation details (state, props, component internals)

### Mocking Strategy
- **MongoDB:** Mock mongoose models, not the database
- **Next.js APIs:** Mock `revalidatePath`, `redirect`, `cookies()`, `headers()`
- **External services:** Mock at module boundary, not deep in implementation

## Coverage Requirements
- **Threshold:** 80% minimum
- **Priority areas:** Server actions, API routes, validation schemas, business logic
- **Lower priority:** UI components (focus on behavior), type definitions

Run: `npm test -- --coverage`

## Quality Gates (Pre-Merge)
```bash
npm test              # All tests pass
npm run type-check    # TypeScript strict mode
npm run lint          # ESLint
npm run build         # Production build succeeds
```

## Common Test Patterns

### Testing Server Actions
```typescript
// Mock Next.js APIs
vi.mock('next/cache', () => ({
  revalidatePath: vi.fn(),
}))

// Test action result structure
const result = await serverAction(data)
expect(result.success).toBe(true)
```

### Testing Components with Client Interactions
```typescript
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

const user = userEvent.setup()
await user.click(screen.getByRole('button'))
```

### Testing API Routes
```typescript
const request = new NextRequest('http://localhost:3000/api/...')
const response = await GET(request, { params })
expect(response.status).toBe(200)
```