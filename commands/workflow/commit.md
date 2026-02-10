# Commit
additional instructions = $ARGUMENTS

type = "feat", "fix", "docs", "style", "refactor", "perf", "test", "chore"

# Smart Git Commit

Please help me create a git commit by:

1. First, check the current git status and analyze what changed:

```bash
git status
git diff --staged
```

2. If no files are staged, show me the changes and help me decide what to stage:

```bash
git diff
git status -s
```

3. Before committing, first run lint and unit tests:

```bash
npm run lint
npm test -s
```

   If any fail, stop and assist in fixing issues before proceeding.

4. Before suggesting a commit, review the security checklist security.md (relative to the repo root) and confirm the changes meet the mandatory security checks. If any issue is found, stop and assist in fixing it before continuing.

5. Based on the changes, suggest:

- The appropriate commit type (feat/fix/docs/style/refactor/perf/test/chore)
- A concise, descriptive commit message following conventional commits
- If the changes are complex, suggest breaking into multiple commits

6. The commit format should be:

$type: description for simple commits
For complex changes, include a body explaining what and why

7. After showing me the suggested commit message, ask if I want to:

- Use it as-is
- Modify it
- Add more details to the body
- Stage different files

8. Once approved, create the commit and show me the result.

9. Finally, ask if I want to push or create a PR.