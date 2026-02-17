# TypeCheck After Edit Hook

Runs `tsc --noEmit` after editing `.ts` or `.tsx` files. Surfaces TypeScript type errors immediately in the same session turn as the code change.

## Installation

1. **Copy the hook script:**
   ```bash
   mkdir -p ~/.claude/hooks
   cp typecheck-after-edit.sh ~/.claude/hooks/typecheck-after-edit.sh
   chmod +x ~/.claude/hooks/typecheck-after-edit.sh
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
               "command": "~/.claude/hooks/typecheck-after-edit.sh",
               "timeout": 30
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
2. Parses the tool input JSON from stdin to get the tool name and file path
3. Skips non-TypeScript files (only `.ts` and `.tsx`)
4. Skips projects without a `tsconfig.json` in the working directory
5. Runs `npx tsc --noEmit` and captures up to 20 lines of output
6. If type errors exist, prints them to stderr and exits with code 1

The 30-second timeout is intentionally generous since `tsc --noEmit` can be slow on larger codebases.

## Testing

```bash
# Simulate an Edit on a .ts file (requires tsconfig.json in cwd)
echo '{"tool_name":"Edit","tool_input":{"file_path":"src/index.ts"}}' | bash typecheck-after-edit.sh

# Simulate an Edit on a non-TypeScript file (should pass through silently)
echo '{"tool_name":"Edit","tool_input":{"file_path":"README.md"}}' | bash typecheck-after-edit.sh
```

## Removal

Remove the `PostToolUse` entry from `~/.claude/settings.json` and delete `~/.claude/hooks/typecheck-after-edit.sh`.
