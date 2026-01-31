# Documentation Keeper Skill

**Universal Documentation Maintenance & Quality Assurance**

---

## Overview

The Documentation Keeper skill provides automated documentation maintenance for any software project. It detects when documentation updates are needed, suggests appropriate templates, validates quality, and ensures consistency.

### Key Benefits

✅ **Smart Detection** - Automatically identifies when docs need updating
✅ **Template Management** - Discovers and applies project templates
✅ **Quality Validation** - Checks links, code examples, and cross-references
✅ **Universal** - Works with any project, any language, any framework
✅ **Customizable** - Adapts via `.claude/doc-config.json`

---

## Quick Start

### 1. Add Configuration to Your Project

Create `.claude/doc-config.json` in your project root:

```json
{
  "documentationRoot": "docs",
  "categories": {
    "features": {
      "path": "docs/features",
      "template": "docs/features/_TEMPLATE.md",
      "description": "Feature documentation"
    }
  },
  "validation": {
    "checkLinks": true,
    "lintCodeExamples": true
  }
}
```

### 2. Create Documentation Templates

Add template files to your docs directory:

```bash
# Example: docs/features/_TEMPLATE.md
```

### 3. Start Using

The skill activates automatically when:
- You implement a new feature
- You change an API
- You modify architecture
- You explicitly mention documentation

---

## Project Structure

```
~/.claude/skills/documentation-keeper/
├── SKILL.md                        # Main skill definition
├── README.md                       # This file
├── detectors/
│   ├── update-triggers.md          # When to update docs
│   └── category-selector.md        # Which category to use
├── validators/
│   ├── link-checker.sh             # Validate all links
│   ├── cross-ref-validator.sh      # Check bidirectional links
│   └── code-example-linter.sh      # Lint code in docs
├── maintenance/
│   └── timestamp-updater.sh        # Update timestamps
├── config-schemas/
│   └── doc-config.schema.json      # Configuration schema
├── templates/
│   └── (example templates)
└── examples/
    └── (usage examples)
```

---

## Validation Scripts

### Check All Links

```bash
~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/
```

**What it does:**
- Finds all markdown files
- Extracts all links `[text](link)`
- Verifies local links exist
- Reports broken links

### Validate Cross-References

```bash
~/.claude/skills/documentation-keeper/validators/cross-ref-validator.sh docs/
```

**What it does:**
- Checks all inter-document links
- Ensures bidirectional linking
- Warns about unidirectional links

### Lint Code Examples

```bash
~/.claude/skills/documentation-keeper/validators/code-example-linter.sh docs/api.md
```

**What it does:**
- Extracts code blocks from markdown
- Runs project linter on code
- Reports syntax or lint issues

### Update Timestamps

```bash
~/.claude/skills/documentation-keeper/maintenance/timestamp-updater.sh docs/feature.md
```

**What it does:**
- Finds "Last Updated" field
- Updates to current date
- Uses configured date format

---

## Configuration Reference

### Minimal Configuration

```json
{
  "documentationRoot": "docs"
}
```

### Full Configuration

```json
{
  "documentationRoot": "docs",
  "templateLocations": [
    "docs/**/_TEMPLATE.md",
    ".github/TEMPLATES/*.md"
  ],
  "categories": {
    "reference": {
      "path": "docs/reference",
      "template": "docs/reference/_TEMPLATE.md",
      "description": "Technical standards and patterns"
    },
    "architecture": {
      "path": "docs/architecture",
      "template": "docs/architecture/_TEMPLATE.md",
      "description": "System design decisions"
    },
    "features": {
      "path": "docs/features",
      "template": "docs/features/_TEMPLATE.md",
      "description": "Feature implementation guides"
    }
  },
  "updateTriggers": [
    "New feature in src/",
    "API change in api/",
    "Architecture change"
  ],
  "validation": {
    "checkLinks": true,
    "lintCodeExamples": true,
    "verifyTimestamps": true,
    "checkCrossReferences": true
  },
  "timestampFormat": "YYYY-MM-DD",
  "changelogLocation": "CHANGELOG.md",
  "lintCommand": "npm run lint"
}
```

---

## Adapting for Your Project

### React/TypeScript Projects

```json
{
  "categories": {
    "components": {
      "path": "docs/components",
      "description": "Component API documentation"
    },
    "hooks": {
      "path": "docs/hooks",
      "description": "Custom hooks documentation"
    }
  },
  "lintCommand": "npm run lint"
}
```

### Python/Django Projects

```json
{
  "categories": {
    "models": {
      "path": "docs/models",
      "description": "Database models"
    },
    "views": {
      "path": "docs/views",
      "description": "Views and endpoints"
    }
  },
  "lintCommand": "pylint"
}
```

### Go Projects

```json
{
  "categories": {
    "packages": {
      "path": "docs/packages",
      "description": "Package documentation"
    }
  },
  "lintCommand": "golint"
}
```

---

## Integration with CI/CD

### GitHub Actions Example

```yaml
name: Documentation Quality

on: [pull_request]

jobs:
  check-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Check Documentation Links
        run: |
          ~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/

      - name: Validate Cross-References
        run: |
          ~/.claude/skills/documentation-keeper/validators/cross-ref-validator.sh docs/
```

### Pre-Commit Hook

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Check if documentation was modified
if git diff --cached --name-only | grep -q '^docs/'; then
  echo "📚 Validating documentation..."

  # Run link checker
  ~/.claude/skills/documentation-keeper/validators/link-checker.sh docs/

  if [[ $? -ne 0 ]]; then
    echo "❌ Documentation validation failed!"
    exit 1
  fi
fi
```

---

## Troubleshooting

### Skill Not Activating

**Check:**
1. Is `.claude/doc-config.json` present?
2. Are you making changes that match update triggers?
3. Try explicitly mentioning "documentation" in your message

### Link Checker False Positives

**Solution:**
- Ensure paths are relative to documentation root
- Use `./` for same-directory links
- Use `../` for parent directory links

### Code Linter Not Working

**Check:**
1. Is the linter installed? (`npm install` or similar)
2. Is `lintCommand` correctly configured?
3. Are code blocks properly tagged with language?

### Timestamps Not Updating

**Solution:**
- Ensure file has a "Last Updated" field
- Use one of these formats:
  - `**Last Updated:** YYYY-MM-DD`
  - `Last Updated: YYYY-MM-DD`
  - `- Last Updated: YYYY-MM-DD`

---

## Examples

See `examples/` directory for:
- Real-world configuration files
- Template examples
- Integration examples
- Usage scenarios

---

## Version History

**1.0.0** (2025-10-18)
- Initial universal implementation
- Smart update detection
- Template management
- Validation scripts
- Cross-project support

---

## Contributing

To improve this skill:

1. Test with your project type
2. Document patterns that work
3. Share configuration examples
4. Report issues or edge cases

---

## Resources

- **Main Skill:** [`SKILL.md`](SKILL.md)
- **Update Triggers:** [`detectors/update-triggers.md`](detectors/update-triggers.md)
- **Category Selection:** [`detectors/category-selector.md`](detectors/category-selector.md)
- **Configuration Schema:** [`config-schemas/doc-config.schema.json`](config-schemas/doc-config.schema.json)

---

**Skill Type:** Universal/Project-Agnostic
**Version:** 1.0.0
**Last Updated:** 2025-10-18
