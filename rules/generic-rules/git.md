# Git Workflows

## Commit Messages
- Subject: imperative mood, present tense, under 72 characters.
- Add body after blank line to explain why (not what).
  - Good: "Add rate limiting to webhook endpoint"
  - Bad: "Added rate limiting to the webhook endpoint because it was getting too many requests"
  - Bad: "fix stuff"

## Branch Naming
- Feature: `feature/short-description`
- Bug: `fix/short-description`
- Chore: `chore/short-description`
- Kebab-case. No slashes beyond prefix.
- No ticket IDs unless linking to tracker.

## Logical Commits
- Group related changes into one commit.
- Genuinely independent changes get separate commits.
- Commit after completing logical unit. Not per file, not mid-task.