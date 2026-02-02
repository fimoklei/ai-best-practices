# Code Comments

## Fundamentals
- **Self-documenting code first** — Clear structure and naming over comments.
- **Comment the why, never the what** — If code needs a what-comment, refactor instead.
- **Evergreen comments only** — No comments about recent changes, fixes, or temporary states. Comments should be relevant indefinitely.

## When to Comment
- Module/file purpose at the top.
- Public API contracts (function intent, params, return values).
- Non-obvious business logic or domain constraints.
- Complex algorithms where the approach isn't immediately clear.

## File Headers
- One-line plain-language description of what the file does.
- Use everyday wording. Non-engineers should understand.
- Update when the file's role changes.

## Cross-References
- Link to supporting docs instead of duplicating information.
- Format: `[See: docs/reference/file.md]` for tooling and reviewers.
- Reference standards docs (e.g., error handling, architecture decisions) rather than repeating details.

## What NOT to Comment
- Obvious code ("increment counter").
- Change history ("fixed bug on 2024-10-15") — use version control.
- Commented-out code — delete it instead.
- TODO without context or linked issue.