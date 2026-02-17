#!/bin/bash
# Blocks git commit/push on main/master branches.
# PreToolUse hook — reads tool input from stdin JSON.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Only check git commit and git push commands
if ! echo "$COMMAND" | grep -qE '^git (commit|push)'; then
  exit 0
fi

# Get current branch
BRANCH=$(git branch --show-current 2>/dev/null)

if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "BLOCKED: You are on the main branch. Create a feature branch first: git checkout -b feature/<description>"
    }
  }'
  exit 0
fi

exit 0
