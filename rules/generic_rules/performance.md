# Performance Optimization

## Model Selection

**Haiku 4.5** (lightweight, 3x cheaper):
- Frequent invocation agents
- Pair programming and code generation
- Worker agents in multi-agent systems

**Sonnet 4.5** (best coding):
- Main development work
- Multi-agent orchestration
- Complex coding tasks

**Opus 4.5** (deepest reasoning):
- Architectural decisions
- Research and analysis

## Context Window

Avoid last 20% for:
- Large-scale refactoring
- Multi-file features
- Complex debugging

Lower sensitivity tasks:
- Single-file edits
- Utility creation
- Documentation
- Simple fixes

## Ultrathink + Plan Mode

For complex tasks requiring deep reasoning:
1. Use `ultrathink` for enhanced thinking
2. Enable **Plan Mode** for structured approach
3. "Rev the engine" with multiple critique rounds
4. Use split role sub-agents for diverse analysis