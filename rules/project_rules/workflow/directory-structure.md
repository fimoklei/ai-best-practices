# Directory Structure

## Purpose
Standard directory organization for Next.js full-stack projects with TypeScript. High-level principles, not rigid blueprints. Use judgment based on project size and complexity.

## Key Principles
- **Feature proximity over technical grouping** — Group by domain/feature, not file type.
- **Flat until it hurts** — Don't nest prematurely. Create structure when flat lists become hard to scan.
- **Clear boundaries** — Make server/client boundaries explicit through naming and folder structure.
- **Tests in dedicated folder** — All test files in `tests/` at root, organized by test type.

## Top-Level Organization
```
project-root/
├── app/                    # Next.js App Router (routes, layouts, pages)
├── components/             # React components (by feature/domain)
├── lib/                    # Utilities, hooks, helpers (by feature/domain)
├── server/                 # Server-side business logic (optional, for complex backends)
├── public/                 # Static assets
├── tests/                  # All test files (unit/, integration/, e2e/)
├── docs/                   # Documentation, ADRs
└── config files
```

## Folder Purposes
**`app/`** — Routes, layouts, loading states, error boundaries. Keep route handlers thin; move business logic to `lib/` or `server/`.

**`components/`** — React components by feature/domain.
- `components/user/` — User profile, avatar, settings
- `components/ui/` — Generic UI primitives

**`lib/`** — Shared utilities, hooks, constants, types, client-side helpers.
- `lib/auth/` — Authentication utilities, hooks, types
- `lib/api/` — API client functions
- `lib/utils/` — Generic helpers

**`server/` (optional)** — Server-side business logic for complex backends. For simple projects, use `lib/` with `.server.ts` suffix.

**`tests/`** — All test files, organized by test type first, then mirroring source structure.

## Server vs. Client Boundaries
1. **`.server.ts` suffix** — Server-only files
2. **`lib/client/` folder** — Client-only utilities
3. **`'use client'` directive** — Components needing client interactivity

Enforce with ESLint rules and TypeScript path aliases.

## Naming Conventions
- Files: `kebab-case.ts` or `kebab-case.tsx`
- Components: `PascalCase` in `PascalCase.tsx`
- Utilities: `camelCase` functions in `kebab-case.ts`
- Next.js conventions: `route.ts`, `page.tsx`, `layout.tsx`, `actions.ts`
- Tests: `*.test.ts` or `*.spec.ts` (in `tests/` folder)

## When to Deviate
- Legacy codebase — Don't force-migrate without clear benefit
- Framework conventions take precedence
- Team has established patterns
- Small projects (<10 files) — start flat
- Monorepo — apply principles within each package