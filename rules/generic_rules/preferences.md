# Coding preferences

## Language & style
- TypeScript for all new code unless project context dictates otherwise.
- Follow existing ESLint / Prettier configs. Don't introduce new linting rules without asking.
- Destructure imports wherever sensible.
- ES module syntax (import/export). Never CommonJS require.

## Naming
- Files: kebab-case. Classes/interfaces: PascalCase. Functions/variables: camelCase. Constants: UPPER_SNAKE_CASE.
- Name for what things do, not what they are — `fetchUserProfile` over `userProfileFetcher`.

## Comments
- Comment the why, never the what. If code needs a what-comment, refactor instead.
- Exception: public API surfaces get a one-line JSDoc on intent and params.

## Output format
- Config files: valid JSON/YAML, no trailing commas.