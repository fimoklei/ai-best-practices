# Coding Style

## Fundamentals
- **Consistent naming** — Follow project conventions for variables, functions, classes, files.
- **Meaningful names** — Descriptive names that reveal intent. Avoid abbreviations and single-letter variables except in narrow contexts (loop indices, math).
- **Automated formatting** — Use formatter (Prettier, ESLint auto-fix) to enforce consistent style. Don't manually format.
- **Consistent indentation** — Configure editor/linter to enforce project standard (spaces or tabs).

## Function Design
- Small and focused. One task per function.
- Extract common logic into reusable utilities.

## Code Hygiene
- Delete unused code, commented-out blocks, and unused imports.
- Don't leave TODO comments without linked issues or context.

## TypeScript
- Strong types end-to-end. No `any` without justification.
- Type API responses, not just function signatures.
- Use type inference where appropriate. Don't over-annotate.

## Imports
- Use path aliases (`@/`, `~/`) where configured. Avoid deep relative imports (`../../..`).
- Group imports: external packages, internal modules, relative imports.
- Remove unused imports.

## Backward Compatibility
- Assume forward-only development unless explicitly required to support legacy versions.
- When backward compatibility is needed, document why and for how long.