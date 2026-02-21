# Ship Branch

additional instructions = $ARGUMENTS

Ship the current feature branch: push, open PR, merge to main, and clean up local + remote branch.

## Steps

1. **Verify branch state**
   - Confirm not on main/master. If on main, stop and tell the user.
   - Run `git status` — if there are uncommitted changes, stop and tell the user to commit first (suggest `/workflow:commit`).

2. **Push branch**
   - If branch has no remote tracking: `git push -u origin <branch>`
   - If already tracking: `git push`

3. **Summarize what's being shipped**
   - Run `git log main..HEAD --oneline` to list commits
   - Show the list to the user so they know what's going into the PR

4. **Create PR**
   - Use `gh pr create` with:
     - Title derived from the branch name and commit list (conventional commits style)
     - Body with a ## Summary (bullet list of changes) and ## Test plan (checklist)
   - Show the PR URL

5. **Merge PR**
   - Run `gh pr merge <number> --merge --delete-branch`
   - `--delete-branch` removes the remote branch automatically

6. **Switch to main and update**
   - `git checkout main && git pull`

7. **Delete local branch**
   - `git branch -d <branch>` (safe delete — refuses if unmerged)

8. **Confirm clean state**
   - Run `git status` and `git branch` to confirm working tree is clean and on main

## Error handling

- If `gh pr merge` fails (e.g. checks failing), stop and tell the user what failed. Do not force-merge.
- If local branch delete fails with "not fully merged", warn the user and do not use `-D` (force). Let them decide.
- If the remote branch was already deleted by the merge step, skip the remote deletion step silently.
