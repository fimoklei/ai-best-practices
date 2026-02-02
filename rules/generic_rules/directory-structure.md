# Directory Structure

## Purpose

This document establishes standard directory organization for **Next.js full-stack projects**. These are high-level principles that guide organization, not rigid blueprints. Use judgment based on project size and complexity.

**Applicability:** Next.js projects with TypeScript, particularly those with both frontend and backend concerns.

## Key Principles

- **Feature proximity over technical grouping** — Group by domain/feature, not by file type. User-related components, hooks, and utilities live together.
- **Flat until it hurts** — Don't create nested folders prematurely. Two files don't need a subfolder. Five files probably don't either. Create structure when the flat list becomes hard to scan.
- **Clear boundaries** — Make server/client boundaries explicit through naming and folder structure.
- **Tests in dedicated folder** — All test files live in `tests/` at the root, organized by test type, not scattered throughout source code.

## Next.js Projects

### Top-Level Organization

```
project-root/
├── app/                    # Next.js App Router (routes, layouts, pages)
├── components/             # React components (organized by feature/domain)
├── lib/                    # Utilities, hooks, helpers (organized by feature/domain)
├── server/                 # Server-side business logic (optional, for complex backends)
├── public/                 # Static assets
├── tests/                  # All test files (unit/, integration/, e2e/)
├── docs/                   # Documentation, ADRs
└── config files            # package.json, tsconfig.json, etc.
```

### Folder Purposes

**`app/`** — Next.js App Router structure. Routes, layouts, loading states, error boundaries. Keep route handlers thin; move business logic to `lib/` or `server/`.

**`components/`** — React components organized by feature or domain.
- `components/user/` — User profile, avatar, settings components
- `components/dashboard/` — Dashboard-specific widgets
- `components/ui/` — Generic UI primitives (buttons, modals, inputs)

**`lib/`** — Shared utilities, hooks, constants, types, and client-side helpers.
- `lib/auth/` — Authentication utilities, hooks, types
- `lib/api/` — API client functions, fetch wrappers
- `lib/utils/` — Generic helpers (date formatting, string manipulation)
- `lib/hooks/` — Shared custom React hooks (use sparingly; prefer feature proximity)

**`server/` (optional)** — Server-side business logic for complex backends. Use when you have substantial server-only code that doesn't fit cleanly in route handlers or server actions.
- `server/auth/` — Authentication logic, session management
- `server/db/` — Database queries, schema, migrations
- `server/services/` — Business logic services

For simple projects, server logic can live in `lib/` with `.server.ts` suffix instead.

**`tests/`** — All test files, organized by test type first, then mirroring source structure.
```
tests/
├── unit/
│   ├── lib/
│   │   └── auth/
│   └── components/
├── integration/
│   └── api/
└── e2e/
    └── flows/
```

**`docs/`** — Documentation, architecture decision records (ADRs), diagrams.

## Full-Stack Patterns

### API Routes & Server Actions

**Route handlers** (`app/api/**/route.ts`) — Keep thin. Validate input, call business logic, return response. Move complex logic to `lib/` or `server/`.

**Server actions** — Colocate with the feature that uses them when possible.
- Simple CRUD: In `app/[feature]/actions.ts` near the route
- Shared across features: In `lib/[domain]/actions.server.ts`
- Complex business logic: In `server/[domain]/` with server actions as thin wrappers

### Database & Data Access

**Simple projects:** Database client and queries in `lib/db/`.

**Complex projects:**
- Schema and migrations in `server/db/schema/`
- Query builders and repositories in `server/db/repositories/`
- Business logic that orchestrates queries in `server/services/`

### Server vs. Client Boundaries

Make the boundary explicit:

1. **`.server.ts` suffix** — Files that must only run on the server. TypeScript and bundler can enforce this.
2. **`lib/client/` folder** — Client-only utilities (browser APIs, localStorage, etc.)
3. **`'use client'` directive** — In component files that need client-side interactivity

Enforcement:
- ESLint rules to prevent server imports in client components
- TypeScript path aliases to make boundaries clear (`@/server/*`, `@/lib/client/*`)

## Naming Conventions

Follows `preferences.md`:
- **Files:** `kebab-case.ts` or `kebab-case.tsx`
- **Components:** `PascalCase` in `PascalCase.tsx` files
- **Utilities:** `camelCase` functions in `kebab-case.ts` files

**Special cases:**
- Route handlers: `route.ts` (Next.js convention)
- Page components: `page.tsx` (Next.js convention)
- Layout components: `layout.tsx` (Next.js convention)
- Server actions: `actions.ts` or `actions.server.ts`
- Test files: `*.test.ts` or `*.spec.ts` (in `tests/` folder)

## When to Deviate

These are principles, not laws. Deviate when:

- **Legacy codebase** — Don't force-migrate existing structure unless there's a clear benefit.
- **Framework conventions** — Next.js conventions (app/, public/, route.ts) take precedence.
- **Team standards** — If the team has established patterns, document them and follow them.
- **Small projects** — Sub-10 files don't need `lib/` and `components/` separation. Start flat.
- **Monorepo** — Package-level structure may differ. Apply principles within each package.

## Migration Note

Existing projects using different stacks (e.g., Vite/React) are not required to adopt this structure. This is guidance for **new Next.js projects** and a reference for refactoring existing ones when beneficial.

Projects like `painter` use alternative structures appropriate to their context and are not considered non-compliant.
