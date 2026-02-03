# Claude.md

## What this project is

[One or two sentences: purpose, who uses it, and what problem it solves.
This is the WHY. Don't skip it — Claude needs to understand intent to make
good decisions about code structure.]

## Tech stack & key directories

Stack: [e.g. TypeScript, Next.js, Node.js, PostgreSQL via Prisma]
Runtime: [e.g. Node 20, bun instead of npm if applicable]

[project-root]/
├── src/
│   ├── components/   # UI layer
│   ├── api/          # API routes / controllers
│   ├── services/     # Business logic
│   ├── db/           # Database layer, migrations
│   └── utils/        # Shared helpers
├── tests/            # Co-located test files (*.test.ts)
└── .claude/
    ├── CLAUDE.md     # This file
    ├── settings.json # Project permissions & hooks
    └── rules/        # Modular project rules (loaded automatically)

## How to run things

Build:     [command]
Test:      [command — single file preferred, e.g. npx jest src/auth.test.ts]
Lint:      [command]
Typecheck: [command]

IMPORTANT: Run single tests, not the full suite, unless explicitly asked.
After making changes, always typecheck before declaring done.

## What Claude should know before touching code

[Put 2-3 critical gotchas here. Examples:]
- Migrations in db/migrations/ are append-only. Never modify existing ones.
- The auth middleware runs before every API route — don't bypass it.
- Environment variables come from .env (never hardcoded). See rules/security.md.
