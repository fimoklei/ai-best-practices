# Documentation Keeper - Project Adaptation Guide

This guide explains how to adapt the Documentation Keeper skill for different types of projects.

---

## Quick Adaptation Steps

### 1. Create Configuration File

Add `.claude/doc-config.json` to your project root:

```bash
cd your-project
touch .claude/doc-config.json
```

### 2. Define Documentation Structure

Identify your documentation categories:

```json
{
  "documentationRoot": "docs",
  "categories": {
    "your-category": {
      "path": "docs/your-category",
      "template": "docs/your-category/_TEMPLATE.md",
      "description": "Description of this category"
    }
  }
}
```

### 3. Create Templates

Add `_TEMPLATE.md` files to each category directory.

### 4. Test Validation Scripts

Run validators to ensure they work with your structure:

```bash
~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/
~/.claude/skills/documentation-keeper/validators/cross-ref-validator.sh docs/
```

---

## Project Type Examples

### React/Next.js Application

**Structure:**
```
docs/
├── components/          # Component API docs
├── hooks/              # Custom hooks docs
├── pages/              # Page/route docs
├── api/                # API endpoints
└── architecture/       # System design
```

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "templateLocations": [
    "docs/**/_TEMPLATE.md"
  ],
  "categories": {
    "components": {
      "path": "docs/components",
      "template": "docs/components/_TEMPLATE.md",
      "description": "React component documentation with props API, usage examples, and accessibility notes"
    },
    "hooks": {
      "path": "docs/hooks",
      "template": "docs/hooks/_TEMPLATE.md",
      "description": "Custom hooks with parameters, return values, and usage patterns"
    },
    "pages": {
      "path": "docs/pages",
      "template": "docs/pages/_TEMPLATE.md",
      "description": "Page-level features and routing"
    },
    "api": {
      "path": "docs/api",
      "template": "docs/api/_TEMPLATE.md",
      "description": "API endpoints, request/response schemas, authentication"
    },
    "architecture": {
      "path": "docs/architecture",
      "template": "docs/architecture/_TEMPLATE.md",
      "description": "System design decisions and patterns"
    }
  },
  "updateTriggers": [
    "New component in src/components/",
    "New hook in src/hooks/",
    "New page in app/ or pages/",
    "API change in app/api/ or pages/api/",
    "State management change",
    "Build or deployment change"
  ],
  "validation": {
    "checkLinks": true,
    "lintCodeExamples": true,
    "verifyTimestamps": true,
    "checkCrossReferences": true
  },
  "lintCommand": "npm run lint"
}
```

**Template Example (components/_TEMPLATE.md):**
```markdown
# Component Name

> Brief description of the component's purpose and use case.

---

## Props API

| Prop | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| propName | string | Yes | - | What this prop does |

## Usage

\`\`\`tsx
import { ComponentName } from '@/components/ComponentName'

function Example() {
  return <ComponentName propName="value" />
}
\`\`\`

## Accessibility

- ARIA labels and roles
- Keyboard navigation
- Screen reader support

## Related Components

- [OtherComponent](./other-component.md)

---

**Last Updated:** YYYY-MM-DD
```

---

### Python/Django Backend

**Structure:**
```
docs/
├── models/             # Database models
├── views/              # Views and viewsets
├── serializers/        # API serializers
├── api/                # API endpoints
└── deployment/         # Deployment guides
```

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "models": {
      "path": "docs/models",
      "template": "docs/models/_TEMPLATE.md",
      "description": "Django models with fields, relationships, and managers"
    },
    "views": {
      "path": "docs/views",
      "template": "docs/views/_TEMPLATE.md",
      "description": "Views, viewsets, and business logic"
    },
    "api": {
      "path": "docs/api",
      "template": "docs/api/_TEMPLATE.md",
      "description": "REST API endpoints and documentation"
    },
    "deployment": {
      "path": "docs/deployment",
      "template": "docs/deployment/_TEMPLATE.md",
      "description": "Deployment processes and infrastructure"
    }
  },
  "updateTriggers": [
    "New model in */models.py",
    "New view in */views.py",
    "Database migration created",
    "API endpoint changed",
    "Settings updated"
  ],
  "validation": {
    "checkLinks": true,
    "lintCodeExamples": true
  },
  "lintCommand": "pylint"
}
```

---

### Go Microservices

**Structure:**
```
docs/
├── services/           # Individual services
├── packages/           # Shared packages
├── api/                # API contracts
└── deployment/         # K8s, Docker configs
```

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "services": {
      "path": "docs/services",
      "description": "Microservice documentation"
    },
    "packages": {
      "path": "docs/packages",
      "description": "Shared package documentation"
    },
    "api": {
      "path": "docs/api",
      "description": "API contracts and interfaces"
    }
  },
  "updateTriggers": [
    "New service in services/",
    "Proto file changed",
    "Package interface changed"
  ],
  "lintCommand": "golint"
}
```

---

### Rust CLI Application

**Structure:**
```
docs/
├── commands/           # CLI commands
├── modules/            # Code modules
└── development/        # Development setup
```

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "commands": {
      "path": "docs/commands",
      "description": "CLI command documentation"
    },
    "modules": {
      "path": "docs/modules",
      "description": "Module and crate documentation"
    }
  },
  "updateTriggers": [
    "New command in src/commands/",
    "Public API change"
  ]
}
```

---

### Mobile App (React Native)

**Structure:**
```
docs/
├── screens/            # App screens
├── components/         # UI components
├── navigation/         # Navigation structure
└── api/                # API integration
```

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "screens": {
      "path": "docs/screens",
      "description": "App screen documentation"
    },
    "components": {
      "path": "docs/components",
      "description": "Reusable component documentation"
    },
    "navigation": {
      "path": "docs/navigation",
      "description": "Navigation structure and flows"
    }
  }
}
```

---

## Custom Template Creation

### Template Structure Guidelines

Good templates should include:

1. **Title Section**
```markdown
# [Item Name]

> Brief one-line description

---
```

2. **Standard Sections**
```markdown
## Purpose
Why this exists / what problem it solves

## Usage
How to use / integrate / implement

## API / Interface
Public interface, parameters, returns

## Examples
Code examples, screenshots, diagrams

## Related
Links to related documentation

---

**Last Updated:** YYYY-MM-DD
```

3. **Context-Specific Sections**

**For Components:**
- Props/Parameters
- Events/Callbacks
- Accessibility
- Styling/Theming

**For APIs:**
- Endpoints
- Request/Response
- Authentication
- Error Handling

**For Architecture:**
- Design Rationale
- Alternatives Considered
- Trade-offs
- Migration Path

---

## Validation Configuration

### Enable/Disable Validators

```json
{
  "validation": {
    "checkLinks": true,           // Validate all markdown links
    "lintCodeExamples": false,    // Skip code linting
    "verifyTimestamps": true,     // Check timestamps current
    "checkCrossReferences": false  // Skip bidirectional check
  }
}
```

### Custom Lint Command

```json
{
  "lintCommand": "npm run lint",           // Node/npm project
  "lintCommand": "pylint",                 // Python project
  "lintCommand": "rubocop",                // Ruby project
  "lintCommand": "golint",                 // Go project
  "lintCommand": "cargo clippy"            // Rust project
}
```

---

## Update Trigger Customization

### Default Triggers

The skill has universal triggers that work for most projects:
- New features
- API changes
- Architecture changes
- Complex solutions (3+ iterations)
- Dependency changes

### Custom Triggers

Add project-specific triggers:

```json
{
  "updateTriggers": [
    "New GraphQL schema in *.graphql",
    "Terraform config change in infrastructure/",
    "GitHub Action workflow modified",
    "Database migration in migrations/",
    "Docker image updated"
  ]
}
```

### Trigger Patterns

Use glob patterns for flexibility:

```json
{
  "customTriggers": [
    {
      "pattern": "src/features/*/index.ts",
      "category": "features",
      "reason": "New feature module added"
    },
    {
      "pattern": "api/v*/",
      "category": "api",
      "reason": "API version change"
    }
  ]
}
```

---

## Integration Examples

### With Pre-Commit Hooks

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Check if docs were modified
DOCS_CHANGED=$(git diff --cached --name-only | grep '^docs/')

if [[ -n "$DOCS_CHANGED" ]]; then
  echo "📚 Validating documentation..."

  # Run validators
  ~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/

  if [[ $? -ne 0 ]]; then
    echo "❌ Fix documentation issues before committing"
    exit 1
  fi
fi
```

### With GitHub Actions

```yaml
name: Documentation Quality

on:
  pull_request:
    paths:
      - 'docs/**'

jobs:
  validate-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Validate Links
        run: |
          bash ~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/

      - name: Check Cross-References
        run: |
          bash ~/.claude/skills/documentation-keeper/validators/cross-ref-validator.sh docs/
```

### With npm/yarn Scripts

```json
{
  "scripts": {
    "docs:validate": "~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/",
    "docs:check-refs": "~/.claude/skills/documentation-keeper/validators/cross-ref-validator.sh docs/",
    "docs:update-timestamps": "find docs -name '*.md' -exec ~/.claude/skills/documentation-keeper/maintenance/timestamp-updater.sh {} \\;"
  }
}
```

---

## Troubleshooting Common Issues

### Issue: Skill Not Activating

**Solution:**
1. Ensure `.claude/doc-config.json` exists in project root
2. Check that `documentationRoot` path is correct
3. Verify templates exist at configured paths
4. Try explicitly mentioning "documentation" in your message

### Issue: Link Checker False Positives

**Cause:** Links use absolute paths or anchors

**Solution:**
- Use relative paths: `./sibling.md` or `../parent/file.md`
- Link checker skips external URLs automatically
- Anchor-only links (`#section`) are skipped

### Issue: Code Linter Fails

**Cause:** Linter not installed or misconfigured

**Solution:**
1. Ensure linter is installed: `npm install` or `pip install pylint`
2. Check `lintCommand` in config matches your project
3. Set `lintCodeExamples: false` to skip linting

### Issue: Templates Not Found

**Cause:** Template path misconfigured

**Solution:**
- Use full path from project root: `docs/category/_TEMPLATE.md`
- Check file actually exists at that path
- Ensure filename is exactly `_TEMPLATE.md` (case-sensitive)

---

## Best Practices

### 1. Start Simple

Begin with minimal config:
```json
{
  "documentationRoot": "docs"
}
```

Add categories and validation as needed.

### 2. Use Templates

Create templates even if simple - they ensure consistency.

### 3. Run Validators Regularly

Integrate into CI or pre-commit hooks to catch issues early.

### 4. Document as You Code

Update docs immediately after changes while knowledge is fresh.

### 5. Link Bidirectionally

When you link from Doc A → Doc B, add a backlink from Doc B → Doc A.

---

## Example Projects

### Minimal Project

```
my-app/
├── .claude/
│   └── doc-config.json       # Just documentationRoot
├── docs/
│   ├── README.md
│   └── API.md
└── src/
```

### Standard Project

```
my-app/
├── .claude/
│   └── doc-config.json       # Categories + validation
├── docs/
│   ├── features/
│   │   ├── _TEMPLATE.md
│   │   └── auth.md
│   ├── api/
│   │   ├── _TEMPLATE.md
│   │   └── endpoints.md
│   └── architecture/
│       ├── _TEMPLATE.md
│       └── system-design.md
└── src/
```

### Enterprise Project

```
my-app/
├── .claude/
│   ├── doc-config.json        # Full config
│   └── detect-doc-updates.sh  # Custom detection
├── docs/
│   ├── [multiple categories with templates]
│   ├── .github/
│   │   └── workflows/
│   │       └── docs-validation.yml
│   └── scripts/
│       └── validate-all.sh
└── src/
```

---

## Getting Help

If you encounter issues adapting the skill:

1. **Check existing examples** in this guide
2. **Review the main SKILL.md** for detailed behavior
3. **Test validators** individually to isolate issues
4. **Start minimal** and add complexity gradually

---

**Version:** 1.0.0
**Last Updated:** 2025-10-18
