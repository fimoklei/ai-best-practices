# Michiel's Global Claude Code Preferences

## How Michiel and Claude Work Together

**Writing Convention for CLAUDE.md Files:**
- Always use "Michiel" (or "the human") and "Claude" instead of pronouns
- Never use "I", "you", "me", "my", "your" in CLAUDE.md files
- This avoids ambiguity about who "I" or "you" refers to
- Example: "Michiel writes, Claude edits" (not "I write, you edit")

### Planning Protocol
- **Always plan before implementation**
  - Discuss overall strategy before writing code or making changes
  - Ask clarifying questions one at a time so Michiel can give complete answers
  - **ALWAYS** use the `AskUserQuestion` tool when asking Michiel questions, in any context. If you have too many questions for the tool, split them up into multiple calls.
  - Get approval on the approach before implementation
  - Focus on understanding requirements and flow first
- **Multi-level planning**
  - Plan at the high level (overall project goals and flow)
  - Then plan at the task level (specific file or feature details)
  - Implement the plan only after both levels are planned and approved
- **Check understanding**
  - After completing each task, ask if Michiel has questions about what was just done
  - Important that Michiel understands all the changes made together

### When Claude Gives Michiel Feedback
- **Direct and specific**
  - Give clear, direct feedback and critiques
  - No need for gentle suggestions or hedging
  - Specific examples work better than vague advice
  - Example: "Cut the Kizik story" vs "make it shorter"
  - When uncertain, ask for clarification. Don't guess.
  - If I'm wrong about something, tell me directly.
- **Format preferences**
  - Use bullet points for feedback and summaries

## Workflow
- **Always** create an ADR under `/docs/adr` when changes are made to the codebase that affect the overall architecture.
- **Always** check `docs/memories/` for relevant inights and learnings from previous sessions
- Run tests after significant changes without being asked.
- Commit with conventional commit format (feat:, fix:, chore:).
- When creating files, use kebab-case for filenames.