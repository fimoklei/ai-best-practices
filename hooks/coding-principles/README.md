# Coding Principles Hook

Injects coding principles (DRY, YAGNI, KISS, Pragmatic) into every Claude Code prompt and adds random animal emojis to responses.

## Installation

1. **Create the hook script:**
   ```bash
   mkdir -p ~/.claude/hooks/coding-principles
   # Copy user-prompt-submit.py to this directory
   chmod +x ~/.claude/hooks/coding-principles/user-prompt-submit.py
   ```

2. **Add to `~/.claude/settings.json`:**
   ```json
   {
     "hooks": {
       "UserPromptSubmit": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "python3 ~/.claude/hooks/coding-principles/user-prompt-submit.py",
               "timeout": 10
             }
           ]
         }
       ]
     }
   }
   ```

3. **Restart Claude Code** to activate.

## Testing

```bash
# Test script directly
python3 ~/.claude/hooks/coding-principles/user-prompt-submit.py

# Should output JSON with hookSpecificOutput and a random emoji
```

## Removal

Remove the `hooks` section from `~/.claude/settings.json` or delete this directory.
