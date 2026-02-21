#!/usr/bin/env bash
# Auto-format files after Edit/Write operations.
# Runs prettier for web/config files, black for Python.
# Silent on missing formatters or unsupported extensions.

set -euo pipefail

# Read tool input from stdin
INPUT=$(cat)

# Extract file_path from tool_input (handles file_path, path, target_file)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // .tool_input.target_file // empty' 2>/dev/null)

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

EXT="${FILE_PATH##*.}"

case ".$EXT" in
  .ts|.tsx|.js|.jsx|.css|.json|.md)
    if command -v npx &>/dev/null; then
      npx prettier --write "$FILE_PATH" 2>/dev/null && \
        echo "formatted: $FILE_PATH" >&2
    fi
    ;;
  .py)
    if command -v black &>/dev/null; then
      black --quiet "$FILE_PATH" 2>/dev/null && \
        echo "formatted: $FILE_PATH" >&2
    fi
    ;;
esac

exit 0
