# Documentation Category Selector

This guide helps determine the appropriate documentation category for different types of changes.

---

## Decision Tree

```
Start: What changed?
│
├─ User-facing feature?
│  └─ YES → features/
│     └─ Template: Feature documentation template
│     └─ Include: Purpose, usage, API, examples
│
├─ Architecture/Design?
│  └─ YES → architecture/
│     └─ Template: Architecture template or ADR template
│     └─ Include: Rationale, alternatives, tradeoffs
│
├─ Technical pattern/standard?
│  └─ YES → reference/
│     └─ Template: Reference documentation template
│     └─ Include: Pattern, when to use, examples
│
├─ Development process/tool?
│  └─ YES → development/
│     └─ Template: Development template
│     └─ Include: Setup, usage, commands
│
└─ API/Interface change?
   └─ YES → api/ (or reference/)
      └─ Template: API documentation template
      └─ Include: Endpoints, parameters, responses
```

---

## Category Definitions

### features/
**When to use:**
- New user-facing capability
- Feature that end-users interact with
- Functionality that requires user documentation

**Examples:**
- User authentication system
- Data export functionality
- Dashboard widgets
- Search filters

**Template sections:**
- Purpose: What problem does this solve for users?
- Usage: How do users interact with it?
- API: Integration points (if applicable)
- Examples: Screenshots, code examples

---

### architecture/
**When to use:**
- System-wide design changes
- Cross-cutting concerns
- Major architectural decisions
- Pattern introductions

**Examples:**
- State management approach
- Database schema design
- Authentication architecture
- Routing strategy

**Template sections:**
- Purpose: What system problem does this solve?
- Context: Dependencies and relationships
- Logic: How it works (diagrams helpful)
- API/Interfaces: Public contracts
- ADR: Architecture Decision Record format

---

### reference/
**When to use:**
- Technical patterns and standards
- Coding guidelines
- Quality assurance patterns
- Troubleshooting guides

**Examples:**
- Testing strategies
- Code style guides
- Error handling patterns
- Debugging techniques

**Template sections:**
- Purpose: Why this standard exists
- Context: Where/when to apply
- Specification: Technical details
- Examples: Code samples
- Cross-references: Related standards

---

### development/
**When to use:**
- Development environment setup
- Build/deployment processes
- Tool usage guides
- Workflow documentation

**Examples:**
- Environment setup
- Database migrations
- Build configuration
- CI/CD processes

**Template sections:**
- Purpose: What this process achieves
- Prerequisites: What's needed first
- Steps: How to execute
- Troubleshooting: Common issues
- Related: Links to related processes

---

## Selection Algorithm

```typescript
function selectCategory(change) {
  // Check for user-facing features first
  if (change.userFacing && change.type === 'feature') {
    return 'features';
  }

  // Architecture changes (system-wide impact)
  if (change.scope === 'system-wide' || change.affectsMultipleComponents) {
    return 'architecture';
  }

  // API/Interface changes
  if (change.type === 'api-change' || change.publicInterface) {
    return change.hasArchitecturalImpact ? 'architecture' : 'reference';
  }

  // Development tools/processes
  if (change.affects(['build', 'deploy', 'setup', 'tools'])) {
    return 'development';
  }

  // Technical patterns and standards
  if (change.type === 'pattern' || change.iterationsToSolve >= 3) {
    return 'reference';
  }

  // Default to reference for general technical docs
  return 'reference';
}
```

---

## Multi-Category Updates

Some changes may require updates in multiple categories:

**Example: New Authentication System**
1. `architecture/authentication.md` - Overall system design
2. `features/user-login.md` - User-facing login feature
3. `api/auth-endpoints.md` - API documentation
4. `development/auth-setup.md` - Developer setup guide

**Approach:**
1. Start with primary category (architecture in this case)
2. Create or update related documentation in other categories
3. Cross-link all related documents

---

## Special Cases

### ADRs (Architecture Decision Records)

Use for significant architectural decisions:
- Format: `ADR-{number}-{title}.md`
- Location: `architecture/`
- Include: Context, decision, consequences, alternatives

### API Documentation

Can live in `api/` or `reference/` depending on project structure:
- Dedicated API project → `api/`
- Full-stack with some APIs → `reference/api-endpoints.md`

### Troubleshooting Guides

Usually belong in `reference/`:
- Format: Add to existing troubleshooting docs or create new
- Include: Problem, solution, why it works

---

## Project-Specific Customization

Projects can define custom categories in `.claude/doc-config.json`:

```json
{
  "categories": {
    "hooks": {
      "path": "docs/hooks",
      "template": "docs/hooks/_TEMPLATE.md",
      "description": "React custom hooks documentation"
    },
    "components": {
      "path": "docs/components",
      "template": "docs/components/_TEMPLATE.md",
      "description": "Component API documentation"
    }
  }
}
```

---

**Version:** 1.0.0
**Last Updated:** 2025-10-18
