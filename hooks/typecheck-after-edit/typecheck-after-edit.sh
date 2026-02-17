#!/bin/bash
# Runs TypeScript type-check after file edits.
# PostToolUse hook — only fires for .ts/.tsx files.

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only check after Edit or Write
if [ "$TOOL_NAME" != "Edit" ] && [ "$TOOL_NAME" != "Write" ]; then
  exit 0
fi

# Get the file path that was edited
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only type-check TypeScript files
if ! echo "$FILE_PATH" | grep -qE '\.(ts|tsx)$'; then
  exit 0
fi

# Only run if tsconfig.json exists in cwd
if [ ! -f "tsconfig.json" ]; then
  exit 0
fi

# Run type-check, capture output
OUTPUT=$(npx tsc --noEmit 2>&1 | head -20)
EXIT_CODE=${PIPESTATUS[0]}

if [ $EXIT_CODE -ne 0 ]; then
  echo "TypeScript errors found after editing $FILE_PATH:" >&2
  echo "$OUTPUT" >&2
  exit 1
fi

exit 0
