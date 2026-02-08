# Claude Code Environment Health Check

## Task
Run a full health check on my Claude Code environment and fix everything that's broken.

## Checklist

### 1. Settings Validation
- [ ] Read project-level Claude Code settings files
- [ ] Read user-level Claude Code settings files
- [ ] Validate all JSON syntax is correct
- [ ] Fix any JSON syntax errors found

### 2. Hook Testing
- [ ] List every registered hook
- [ ] Test each hook by simulating its trigger condition
- [ ] Report which hooks fire successfully
- [ ] Report which hooks fail

### 3. Hook Diagnostics
- [ ] For failing hooks, diagnose root cause:
  - [ ] Check PATH environment
  - [ ] Check CLAUDE_PLUGIN_ROOT env var
  - [ ] Check file permissions
  - [ ] Check CLI availability

### 4. Issue Resolution
- [ ] Fix every issue found
- [ ] Do not just report problems — actually resolve them

### 5. Observer Daemon
- [ ] Verify scripts/observer can start
- [ ] Run observer for 5 seconds without errors
- [ ] Confirm stable operation

### 6. Reporting
- [ ] Write health check report to docs/environment-health.md
- [ ] Include status table showing:
  - Component name
  - Status (Healthy/Fixed/Failed)
  - What was fixed (if applicable)

## Instructions
- Do not ask questions
- If encountering ambiguity, check git history and existing docs for intent
- Be thorough and systematic in your approach