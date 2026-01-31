---
name: session-summarizer
description: Use when user runs /summarize command to capture session knowledge
---

# Session Summarizer

## Overview

Every session generates knowledge: decisions made, patterns that worked, problems encountered, questions that arose. Session summaries capture this for future compound learning.

**Core principle:** Document sessions to build knowledge that compounds across time.

## When to Use

User runs `/summarize` command to create a session summary.

**Create summaries to capture:**
- What worked and why
- What didn't work and why
- Questions encountered
- Patterns to remember
- Context for future sessions

## Information Sources (Required)

You MUST integrate all three sources:

1. **Session logs**: `~/.claude/projects/[project-path]/[session-id]/session-memory/summary.md`
   - Contains context, decisions, learnings that commit messages miss
   - Read this FIRST before writing summary

2. **Git history**: `git log --oneline -n 20` and `git diff` since session start
   - What actually changed
   - Commit messages and patterns

3. **Conversation context**: Your memory of the session
   - Questions asked, approaches tried, decisions made

**Using session logs:**
```bash
# Find current session log
ls -la ~/.claude/projects/$(pwd | sed 's/\/Users\/[^/]*\/Projects\///g')/*/session-memory/summary.md | tail -1

# Read it
cat [path-from-above]
```

## Summary Structure

```markdown
# Session Summary - [Date]

## Context
[One-line: what was the goal/problem]

## Victories
- [What worked, solutions found]
- [Patterns that were effective]

## Failures
- [What didn't work, why]
- [Dead ends, wrong assumptions]

## Root Causes
- [For each failure above: What in your system prompt or tooling made you make this mistake?]
- [Analyze prompt assumptions, tool limitations, missing context that led to errors]
- [Example: "Assumed Write tool would create parent directories - tooling doesn't support this"]
- [Example: "System prompt emphasized speed over verification - led to skipping file reads"]

## Tough Questions
- [Questions that came up, answered or not]
- [Ambiguities encountered]

## Improvements
- [What could be better next time]
- [Patterns to codify, failures to document]

## Git Activity
- [Commit count, key changes]
- [Files modified, tests added]

## Next Session
- [Unfinished items, follow-ups needed]
```

## Workflow

1. User runs `/summarize` command
2. Read session logs at `~/.claude/projects/.../summary.md`
3. Check git log and git diff
4. Write structured summary integrating all three sources
5. For each failure, analyze root causes in system prompt/tooling
6. Ask user if they want summary saved anywhere specific

## Root Cause Analysis

For each failure or mistake documented:
- **What in the system prompt** made you assume something incorrect?
- **What tool limitations** were you unaware of?
- **What context was missing** that would have prevented the error?

**Examples:**
- "Assumed Edit tool would preserve formatting - tool doesn't guarantee this"
- "System prompt didn't mention needing parent directories - led to Write failures"
- "Believed git hooks were disabled by default - prompt never specified"

**Purpose:** Understand what gaps in prompts or tooling cause errors, enabling systemic improvements.

## Example

User: `/summarize`

You: "I'll create a session summary capturing what we accomplished and learned today."

[Read session logs, check git, write summary with root cause analysis...]

You: "Here's the summary:

# Session Summary - 2025-01-18

## Context
Fixed authentication bug in React app where tokens weren't persisting across page refreshes.

## Victories
- Identified root cause in localStorage timing
- Implemented useEffect hook with proper dependencies
- All tests pass, authentication now persists correctly

## Failures
- Initially tried sessionStorage (wrong storage type)
- First useEffect implementation had dependency array issues causing infinite loops

## Root Causes
- **sessionStorage attempt**: System prompt didn't emphasize localStorage vs sessionStorage differences - I assumed sessionStorage would persist but it's page-scoped only
- **useEffect infinite loop**: Tool limitations - no linter feedback in Edit tool, had to discover through testing rather than static analysis

## Tough Questions
- Should tokens go in httpOnly cookies instead of localStorage? (security trade-off)

## Improvements
- Add localStorage persistence patterns to project documentation
- Consider adding ESLint rules for useEffect dependencies

## Git Activity
- 3 commits
- Modified: src/hooks/useAuth.ts, src/components/Login.tsx
- Added: tests for token persistence

## Next Session
- Consider cookie-based auth implementation for better security

Would you like me to save this anywhere specific, or is the session log sufficient?"
