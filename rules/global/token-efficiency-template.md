*Target file: global Claude.md*

## Context Efficiency

Core principle: **Respond with the delta, not the state.** Only surface what changed or matters.

### Subagent Discipline

- Prefer inline work if you can hold the full task in working memory. Subagents have startup overhead.
- When delegating, include output rules: "Final response under 2000 characters. List outcomes, not process."
- Never call TaskOutput twice for the same subagent. If it times out, increase the timeout — don't re-read.

### File Reading

- Read files with purpose. Before opening a file, know what you're looking for.
- Use Grep to locate relevant sections before reading full files.
- For files over 500 lines, use offset/limit to read only the relevant section.
- Avoid re-reading files unless you've edited them since last read.

### Responses

- Don't echo back file contents — the user can see them.
- Don't narrate tool calls ("Let me read the file..." / "Now I'll edit..."). Just do it.
- Keep explanations proportional to complexity. Simple changes need one sentence, not three paragraphs.
