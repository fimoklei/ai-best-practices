# Format on Edit Hook

Auto-formats files after `Edit` or `Write` tool calls. Runs Prettier for web/config files (`.ts`, `.tsx`, `.js`, `.jsx`, `.css`, `.json`, `.md`) and Black for Python files (`.py`). Silently skips files when the formatter is not installed or the extension is unsupported.

## Installation

1. **Copy the hook script:**

   ```bash
   mkdir -p ~/.claude/hooks
   cp format-after-edit.sh ~/.claude/hooks/format-after-edit.sh
   chmod +x ~/.claude/hooks/format-after-edit.sh
   ```

2. **Add to `~/.claude/settings.json`:**

   ```json
   {
     "hooks": {
       "PostToolUse": [
         {
           "matcher": "Edit|Write",
           "hooks": [
             {
               "type": "command",
               "command": "bash -c '~/.claude/hooks/format-after-edit.sh'",
               "timeout": 10
             }
           ]
         }
       ]
     }
   }
   ```

3. **Restart Claude Code** to activate.

## How it works

1. Fires after every `Edit` or `Write` tool call (PostToolUse event)
2. Parses the tool input JSON from stdin to extract the file path
3. Determines the file extension and selects the appropriate formatter
4. For `.ts`, `.tsx`, `.js`, `.jsx`, `.css`, `.json`, `.md` — runs `npx prettier --write`
5. For `.py` — runs `black --quiet`
6. Silently exits if the formatter is not available or the file type is unsupported

The 10-second timeout is sufficient since formatting individual files is fast.

## Prerequisites

- **Prettier** — `npm install -g prettier` or available via project `node_modules`
- **Black** (optional, for Python) — `pip install black`
- **jq** — required for parsing tool input JSON

## Testing

```bash
# Simulate an Edit on a TypeScript file
echo '{"tool_name":"Edit","tool_input":{"file_path":"src/index.ts"}}' | bash format-after-edit.sh

# Simulate an Edit on a Python file
echo '{"tool_name":"Edit","tool_input":{"file_path":"main.py"}}' | bash format-after-edit.sh

# Simulate an Edit on an unsupported file (should pass through silently)
echo '{"tool_name":"Edit","tool_input":{"file_path":"data.csv"}}' | bash format-after-edit.sh
```

## Removal

Remove the `format-after-edit.sh` entry from the `PostToolUse` hooks in `~/.claude/settings.json` and delete `~/.claude/hooks/format-after-edit.sh`.
