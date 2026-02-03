# Directory Structure

Next.js full-stack projects with TypeScript. Principles, not rigid rules. Adapt to project size and complexity.

## Key Principles
- **Feature proximity over technical grouping** — Group by domain/feature, not file type.
- **Flat until it hurts** — Create structure when flat lists become hard to scan.
- **Clear boundaries** — Make server/client boundaries explicit.
- **Tests in dedicated folder** — All test files in `tests/` at root, organized by test type.

## Top-Level Organization
```
project-root/
├── app/                    # Next.js App Router (routes, layouts, pages)
├── components/             # React components (by feature/domain)
├── lib/                    # Utilities, hooks, helpers (by feature/domain)
├── server/                 # Server-side business logic (optional, complex backends)
├── public/                 # Static assets
├── tests/                  # All test files (unit/, integration/, e2e/)
├── docs/                   # Documentation, ADRs
└── config files
```

## Folder Purposes
- **`app/`** — Routes, layouts, loading states, error boundaries. Keep route handlers thin.
- **`components/`** — React components by feature/domain (`components/user/`, `components/ui/`).
- **`lib/`** — Shared utilities, hooks, constants, types (`lib/auth/`, `lib/api/`, `lib/utils/`).
- **`server/`** — Business logic for complex backends. Simple projects use `lib/` with `.server.ts` suffix.
- **`tests/`** — Organized by test type, then mirroring source structure.

## Server vs. Client Boundaries
- **`.server.ts` suffix** — Server-only files
- **`lib/client/` folder** — Client-only utilities
- **`'use client'` directive** — Components needing client interactivity

Enforce with ESLint and TypeScript path aliases.

## Naming Conventions
- Files: `kebab-case.ts` or `kebab-case.tsx`
- Components: `PascalCase` in `PascalCase.tsx`
- Utilities: `camelCase` functions in `kebab-case.ts`
- Next.js: `route.ts`, `page.tsx`, `layout.tsx`, `actions.ts`
- Tests: `*.test.ts` or `*.spec.ts` in `tests/`

## When to Deviate
- Legacy codebases without clear migration benefit
- Framework conventions take precedence
- Team has established patterns
- Small projects (<10 files)
- Monorepos (apply within each package)