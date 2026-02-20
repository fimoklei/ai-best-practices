# Coding Preferences

## Language & Style
- TypeScript for all new code unless context dictates otherwise.
- Follow existing ESLint/Prettier configs. Ask before introducing new rules.
- Destructure imports where sensible.
- ES module syntax (import/export). Never CommonJS.

## Naming
- Files: kebab-case.
- Name for what things do, not what they are (`fetchUserProfile` over `userProfileFetcher`).
- Descriptive names reveal intent. Avoid abbreviations except narrow contexts (loop indices, math).

## Comments
- **Self-documenting first** — Clear structure and naming over comments.
- **Comment why, never what** — If code needs what-comment, refactor.
- **Evergreen only** — No recent changes, fixes, or temporary states.

### When to Comment
- Module/file purpose at top.
- Public API contracts (intent, params, return values).
- Non-obvious business logic or domain constraints.
- Complex algorithms where approach isn't clear.

### File Headers
- One-line plain-language description.
- Use everyday wording. Non-engineers should understand.
- Update when file's role changes.

### Never Comment
- Obvious code
- Change history (use version control)
- Commented-out code (delete it)
- TODO without context or linked issue

## Output Format
- Config files: valid JSON/YAML, no trailing commas.