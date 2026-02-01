# Git workflows

## Commit messages
- Subject line: imperative mood, present tense, under 72 characters.
- If the change needs more context, add a body after a blank line explaining the why — not a summary of the diff.
  - Good:  "Add rate limiting to webhook endpoint"
  - Bad:   "Added rate limiting to the webhook endpoint because it was getting too many requests"
  - Bad:   "fix stuff"

## Branch naming
- Feature work: `feature/short-description`
- Bug fixes: `fix/short-description`
- Chores: `chore/short-description`
- Kebab-case. No slashes beyond the prefix.
- No ticket IDs unless actively linking to a tracking system.

## Logical commits, not chronological ones
- Group related changes into one commit. Three related changes while working on a feature = one commit, not three.
- Genuinely independent changes = separate commits, regardless of timing.
- Commit after completing a logical unit of work. Not after every file edit, and not mid-task when the unit isn't finished.