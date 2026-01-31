# Documentation Update Triggers

This document defines the logic for detecting when documentation updates are needed across different project types.

---

## Detection Philosophy

Documentation should be updated **proactively, not reactively**. The goal is to detect update needs immediately after code changes, not weeks later when knowledge is stale.

### Core Principle

> **If a change would confuse a new team member looking at the documentation, trigger an update.**

---

## Universal Trigger Patterns

These patterns apply to almost all software projects, regardless of language or framework.

### 1. Feature Addition

**Signals:**
- New public API, function, class, or module
- New user-facing capability
- New command-line interface
- New configuration option

**Detection Logic:**
```
IF (new files in src/ OR components/ OR lib/)
AND (exports public interface OR user-facing)
THEN
  → Category: features/
  → Action: Create or update feature documentation
  → Include: Purpose, usage examples, API reference
```

**Examples:**
- New React component: `src/components/NewFeature.tsx`
- New API endpoint: `api/v1/new-endpoint/`
- New CLI command: `cli/commands/new-command.js`
- New library function: `lib/utilities/new-util.ts`

---

### 2. API/Interface Changes

**Signals:**
- Function signature modified
- API endpoint parameters changed
- Breaking changes introduced
- Return types altered
- New required parameters

**Detection Logic:**
```
IF (existing function signature changed)
OR (API endpoint modified)
OR (interface/type definition changed)
THEN
  → Category: reference/ OR api/
  → Action: Update API documentation
  → Include: Migration guide if breaking
  → Flag: Version compatibility notes
```

**Examples:**
- Changed: `function process(data)` → `function process(data, options)`
- Modified: `GET /api/users` → `GET /api/users?include=profile`
- Altered: `interface User { name: string }` → `interface User { name: string; email: string }`

---

### 3. Architectural Changes

**Signals:**
- New design pattern introduced
- State management approach changed
- Database schema modified
- Authentication/authorization system altered
- Routing structure redesigned

**Detection Logic:**
```
IF (system-wide change)
OR (new architectural pattern)
OR (cross-cutting concern modified)
THEN
  → Category: architecture/
  → Action: Create ADR (Architecture Decision Record)
  → Include: Rationale, alternatives considered, tradeoffs
  → Update: Related system documentation
```

**Examples:**
- State management: Redux → Zustand
- Database: SQL → NoSQL
- Auth: Session-based → JWT
- Routing: Client-side → Server-side rendering

---

### 4. Complex Solutions (Quality Assurance Patterns)

**Signals:**
- Bug fix required 3+ iterations to solve
- Non-obvious solution discovered
- Debugging pattern identified
- Edge case handling added

**Detection Logic:**
```
IF (debugging iterations >= 3)
OR (solution non-obvious)
OR (requires deep knowledge)
THEN
  → Category: reference/ (quality assurance)
  → Action: Add to troubleshooting documentation
  → Include: Problem description, solution, why it works
```

**Examples:**
- Race condition in async code
- Browser-specific rendering issue
- Performance optimization technique
- Memory leak fix

---

### 5. Dependency/Tool Changes

**Signals:**
- New npm/pip/gem package added
- Build process modified
- Development tool added
- CI/CD pipeline changed
- Environment variable added

**Detection Logic:**
```
IF (package.json changed)
OR (requirements.txt changed)
OR (Dockerfile changed)
OR (.env.example changed)
THEN
  → Category: development/ OR setup/
  → Action: Update setup/installation documentation
  → Include: Installation steps, configuration, prerequisites
```

**Examples:**
- New dependency: `npm install new-package`
- Build change: Webpack → Vite
- Tool added: ESLint → Biome
- CI change: Jenkins → GitHub Actions

---

### 6. Configuration Changes

**Signals:**
- New environment variables
- Configuration file structure changed
- Feature flags added
- Settings schema modified

**Detection Logic:**
```
IF (config file changed: .env, config.json, settings.py)
OR (new configuration option added)
THEN
  → Category: development/ OR reference/
  → Action: Update configuration documentation
  → Include: All available options, defaults, examples
```

**Examples:**
- New env var: `DATABASE_URL`
- Config option: `{ enableFeature: boolean }`
- Feature flag: `FEATURE_NEW_UI=true`

---

### 7. Testing/Quality Changes

**Signals:**
- New testing pattern introduced
- Quality gate process changed
- Coverage threshold updated
- New testing tool added

**Detection Logic:**
```
IF (test patterns changed)
OR (quality gates modified)
OR (testing tools added)
THEN
  → Category: reference/ (testing strategy)
  → Action: Update testing documentation
  → Include: New patterns, examples, rationale
```

**Examples:**
- New pattern: Integration test isolation strategy
- Tool added: Vitest → Playwright
- Gate changed: Coverage 80% → 90%

---

## Project-Specific Triggers

### React/Next.js Projects

**Additional Signals:**
- New custom hook: `src/hooks/useNewHook.ts`
- New context provider: `src/context/NewContext.tsx`
- New page/route: `app/new-page/page.tsx`
- New API route: `app/api/new-route/route.ts`

**Category Mapping:**
```
Custom hook → docs/hooks/ OR docs/reference/
Context provider → docs/architecture/ (state management)
New page → docs/features/
API route → docs/api/
```

---

### Backend/API Projects

**Additional Signals:**
- New model/schema: `models/NewModel.js`
- New endpoint: `routes/new-endpoint.js`
- Database migration: `migrations/001_new_table.sql`
- New middleware: `middleware/newMiddleware.js`

**Category Mapping:**
```
Model/schema → docs/models/ OR docs/architecture/
Endpoint → docs/api/
Migration → docs/development/ (database migrations)
Middleware → docs/architecture/ (request processing)
```

---

### Python/Django Projects

**Additional Signals:**
- New Django app: `myapp/`
- New model: `models.py`
- New view/viewset: `views.py`
- New serializer: `serializers.py`
- New management command: `management/commands/`

**Category Mapping:**
```
Django app → docs/apps/
Model → docs/models/
View/viewset → docs/api/
Management command → docs/commands/
```

---

### Microservices Projects

**Additional Signals:**
- New service: `services/new-service/`
- Service contract changed: `contracts/service.proto`
- Inter-service communication pattern: `messaging/`
- Deployment configuration: `k8s/` or `docker-compose.yml`

**Category Mapping:**
```
New service → docs/services/
Contract change → docs/contracts/
Communication pattern → docs/architecture/
Deployment → docs/deployment/
```

---

## Detection Algorithm

### Pseudo-Code

```typescript
function shouldUpdateDocumentation(changeContext) {
  const {
    filesChanged,
    changeType,
    affectedScope,
    iterationsToSolve,
    userFacing
  } = changeContext;

  // Feature addition
  if (changeType === 'feature' && userFacing) {
    return {
      shouldUpdate: true,
      category: 'features',
      reason: 'New user-facing feature',
      template: 'features/_TEMPLATE.md'
    };
  }

  // API change
  if (changeType === 'api-change' || filesChanged.some(f => f.includes('api/'))) {
    return {
      shouldUpdate: true,
      category: 'api',
      reason: 'API interface changed',
      template: 'api/_TEMPLATE.md',
      warning: 'Check if breaking change requires migration guide'
    };
  }

  // Architecture change
  if (affectedScope === 'system-wide' || changeType === 'architecture') {
    return {
      shouldUpdate: true,
      category: 'architecture',
      reason: 'Architectural change detected',
      template: 'architecture/_TEMPLATE.md',
      suggestion: 'Consider creating an ADR'
    };
  }

  // Complex solution
  if (iterationsToSolve >= 3) {
    return {
      shouldUpdate: true,
      category: 'reference',
      reason: 'Complex solution worth documenting',
      template: 'reference/_TEMPLATE.md',
      section: 'Add to quality assurance or troubleshooting'
    };
  }

  // Dependency change
  if (filesChanged.some(f => ['package.json', 'requirements.txt', 'Gemfile'].includes(f))) {
    return {
      shouldUpdate: true,
      category: 'development',
      reason: 'Dependencies changed',
      template: 'development/_TEMPLATE.md',
      update: 'Setup/installation documentation'
    };
  }

  // Configuration change
  if (filesChanged.some(f => f.includes('.env') || f.includes('config'))) {
    return {
      shouldUpdate: true,
      category: 'development',
      reason: 'Configuration changed',
      template: 'development/_TEMPLATE.md',
      update: 'Configuration reference'
    };
  }

  // No documentation update needed
  return {
    shouldUpdate: false,
    reason: 'Change does not warrant documentation update'
  };
}
```

---

## Threshold Configuration

Projects can configure sensitivity for triggering updates:

```json
{
  "updateThresholds": {
    "complexityIterations": 3,
    "minFilesChanged": 1,
    "userFacingOnly": false,
    "requirePublicAPI": true
  }
}
```

**Explanation:**
- `complexityIterations`: Number of debug iterations before documenting solution
- `minFilesChanged`: Minimum files changed to trigger update
- `userFacingOnly`: Only trigger for user-facing changes
- `requirePublicAPI`: Only trigger for public API changes

---

## Suppressing False Positives

Not all changes require documentation updates. Skip updates for:

**1. Trivial Changes**
```
✗ Formatting/linting fixes
✗ Comment updates
✗ Test-only changes (unless new pattern)
✗ Dependency version bumps (patch only)
✗ Internal refactoring (no API change)
```

**2. Work in Progress**
```
✗ Branch name contains "wip"
✗ Commit message contains "[skip-docs]"
✗ Feature flag disabled
```

**3. Temporary Changes**
```
✗ Experimental code
✗ Debug/logging additions
✗ Hotfix (document later)
```

---

## Priority Levels

Different triggers have different urgency:

**🔴 High Priority (Update Immediately)**
- Breaking API changes
- New user-facing features
- Security-related changes
- Major architectural shifts

**🟡 Medium Priority (Update Soon)**
- Non-breaking API additions
- Internal architectural changes
- New development patterns
- Complex bug fixes

**🟢 Low Priority (Update When Convenient)**
- Minor configuration changes
- Dependency updates (non-breaking)
- Performance improvements
- Code organization refactoring

---

## Integration with Development Workflow

### With Quality Gates

```
RED → GREEN → REFACTOR → DOCUMENT
                            ↓
                    Check triggers
                    Select category
                    Apply template
                    Validate quality
                    Update cross-refs
```

### With Pull Requests

```
PR Created → CI Checks → Documentation Check
                            ↓
                         Triggers detected?
                            ↓
                         Yes: Request doc update
                         No: Approve
```

### With Continuous Integration

```yaml
# Example CI step
- name: Check Documentation
  run: |
    # Detect if documentation update needed
    if [[ $(changed_files) matches triggers ]]; then
      echo "⚠️ Documentation update recommended"
      # Optionally block merge
    fi
```

---

## Examples by Project Type

### React Component Library

**Trigger:** New component added
```
Files changed: src/components/Button/Button.tsx
Trigger: New public component
Category: components/
Action: Create docs/components/button.md
Include: Props API, usage examples, accessibility notes
```

### REST API Project

**Trigger:** New endpoint added
```
Files changed: api/v1/users.js
Trigger: New API endpoint
Category: api/
Action: Update docs/api/endpoints.md
Include: Route, parameters, responses, authentication
```

### CLI Tool

**Trigger:** New command added
```
Files changed: cli/commands/deploy.js
Trigger: New CLI command
Category: commands/
Action: Create docs/commands/deploy.md
Include: Usage, flags, examples, exit codes
```

---

## Best Practices

1. **Update Immediately** - Document while knowledge is fresh
2. **Be Specific** - "New authentication system" not "Updated docs"
3. **Include Examples** - Show how to use new features
4. **Link Related Docs** - Maintain bidirectional references
5. **Version Compatibility** - Note which versions feature applies to

---

## Customization

Projects can extend triggers by:

1. **Adding Custom Patterns**
```json
{
  "customTriggers": [
    {
      "pattern": "src/schema/*.graphql",
      "category": "api",
      "reason": "GraphQL schema change"
    }
  ]
}
```

2. **File Path Mappings**
```json
{
  "pathMappings": {
    "src/features/*": "docs/features/",
    "src/hooks/*": "docs/hooks/",
    "api/*": "docs/api/"
  }
}
```

3. **Custom Detection Scripts**
```bash
#!/bin/bash
# .claude/detect-doc-updates.sh
# Custom project-specific detection logic
```

---

**Version:** 1.0.0
**Last Updated:** 2025-10-18
