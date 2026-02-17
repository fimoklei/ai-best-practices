#!/bin/bash
# Prevents direct commits to main/master and force-pushes.
# Allows normal pushes (needed after merging feature branches).
# PreToolUse hook — reads tool input from stdin JSON.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Get current branch
BRANCH=$(git branch --show-current 2>/dev/null)

# Only care about main/master
if [ "$BRANCH" != "main" ] && [ "$BRANCH" != "master" ]; then
  exit 0
fi

# Block: git commit on main (direct commits bypass feature branch workflow)
if echo "$COMMAND" | grep -qE 'git commit'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "BLOCKED: Cannot commit directly to main. Create a feature branch first: git checkout -b feature/<description>"
    }
  }'
  exit 0
fi

# Block: git push --force on main (destructive rewrite of shared history)
if echo "$COMMAND" | grep -qE 'git push\b.*--force|git push\b.*-f\b'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "BLOCKED: Force-push to main is not allowed. This rewrites shared history."
    }
  }'
  exit 0
fi

# Everything else is fine (push, checkout, branch -d, merge, etc.)
exit 0
