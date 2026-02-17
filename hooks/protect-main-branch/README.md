# Protect Main Branch Hook

Blocks `git commit` and `git push` when on `main` or `master` branch. Forces feature branch workflow by denying the Bash tool call with a helpful error message.

## Installation

1. **Copy the hook script:**
   ```bash
   mkdir -p ~/.claude/hooks
   cp protect-main-branch.sh ~/.claude/hooks/protect-main-branch.sh
   chmod +x ~/.claude/hooks/protect-main-branch.sh
   ```

2. **Add to `~/.claude/settings.json`:**
   ```json
   {
     "hooks": {
       "PreToolUse": [
         {
           "matcher": "Bash",
           "hooks": [
             {
               "type": "command",
               "command": "~/.claude/hooks/protect-main-branch.sh",
               "timeout": 5
             }
           ]
         }
       ]
     }
   }
   ```

3. **Restart Claude Code** to activate.

## How it works

1. Fires on every `Bash` tool call (PreToolUse event)
2. Parses the tool input JSON from stdin using `jq`
3. Checks if the command starts with `git commit` or `git push`
4. If on `main` or `master`, outputs a `permissionDecision: "deny"` JSON response
5. Claude Code reads the denial and stops the command before execution

## Testing

```bash
# Simulate a git commit on main
echo '{"tool_input":{"command":"git commit -m test"}}' | bash protect-main-branch.sh
# Should output deny JSON when on main branch

# Simulate a non-git command (should pass through silently)
echo '{"tool_input":{"command":"ls -la"}}' | bash protect-main-branch.sh
# Should produce no output
```

## Removal

Remove the `PreToolUse` entry from `~/.claude/settings.json` and delete `~/.claude/hooks/protect-main-branch.sh`.
