---
name: optimize-docs
description: Condense markdown documentation for token efficiency while preserving all semantic meaning. Use when rules, documentation, or config files need optimization. Target 25-40% reduction through systematic condensation patterns.
---

You optimize markdown documentation files to reduce token count while preserving 100% of semantic meaning and actionable guidance.

## Input

User provides:
- Target file(s) or directory to optimize
- Optional: specific token reduction target (default: 30-35%)

## Optimization Pattern

Apply these transformations systematically:

### 1. Heading Consolidation
- Collapse related sections under fewer headings
- Convert `## X` + `## When X` → single `## X`
- Merge subsections with similar themes

**Before:**
```markdown
## Communication style
...
## When Claude Gives Feedback
...
```

**After:**
```markdown
## Style
...
## Giving Feedback
...
```

### 2. Bullet Structure Flattening
- Convert nested bullets to flat structure with em-dashes (—)
- Inline explanations instead of sub-bullets
- Use em-dash for definitions/clarifications

**Before:**
```markdown
- **Direct and specific**
  - Give clear, direct feedback and critiques
  - No need for gentle suggestions or hedging
  - Specific examples work better than vague advice
```

**After:**
```markdown
- **Direct and specific** — Clear feedback and critiques. No hedging. Specific examples beat vague advice.
```

### 3. Verbal Compression
- Remove filler phrases: "in any context", "you should", "it is important to"
- Convert full sentences to fragments
- Use imperative mood consistently
- Eliminate redundant explanations

**Examples:**
- "Give clear, direct feedback" → "Clear feedback"
- "You should always validate" → "Validate"
- "It is important to use" → "Use"
- "Don't take suggestions for granted; challenge them and propose better alternatives" → "Challenge suggestions and propose better alternatives when appropriate"

### 4. Inline Examples
- Move examples from sub-bullets into parentheses
- Keep examples concise and illustrative

**Before:**
```markdown
- Specific examples work better than vague advice
  - Example: "Cut the Kizik story" vs "make it shorter"
```

**After:**
```markdown
- Specific examples beat vague advice ("Cut the Kizik story" vs "make it shorter").
```

### 5. List Condensation
- Merge similar list items
- Remove obvious implications
- Combine related concepts

### 6. Preserve Critical Elements
**NEVER remove or simplify:**
- Technical accuracy
- Actionable guidance
- Specific examples that clarify meaning
- Checklists
- Code blocks
- Semantic distinctions

## Workflow

1. **Analyze** — Read target file(s), count current tokens/lines
2. **Plan** — Identify sections for each optimization pattern
3. **Show preview** — Display 2-3 example transformations for user approval
4. **Execute** — Apply optimizations across entire file
5. **Verify** — Show before/after token counts and reduction percentage
6. **Confirm** — Ensure no semantic meaning lost

## Output Format

After optimization, provide:

```
Optimized: [filename]
Before: [X] lines, ~[Y] tokens
After: [X] lines, ~[Y] tokens
Reduction: [Z]%

Key changes:
- [summary of major transformations]
```

## Multi-File Mode

When given a directory:
1. List all markdown files with current sizes
2. Process files one at a time
3. Checkpoint after each file completion
4. Provide running total of tokens saved
5. Allow user to review/confirm before moving to next file

## Quality Checks

Before marking complete:
- [ ] All semantic meaning preserved
- [ ] Technical accuracy maintained
- [ ] Examples still clear and illustrative
- [ ] No broken markdown syntax
- [ ] Headings still scannable
- [ ] Checklists intact
- [ ] Token reduction achieved (25%+ minimum)
