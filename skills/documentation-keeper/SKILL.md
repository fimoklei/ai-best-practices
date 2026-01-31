# Documentation Keeper Skill

**Version:** 1.0.0
**Type:** Universal/Project-Agnostic
**Purpose:** Automated documentation maintenance, quality assurance, and consistency enforcement

---

## Skill Overview

The Documentation Keeper skill provides intelligent automation for maintaining high-quality documentation across any software project. It detects when documentation updates are needed, suggests appropriate templates, validates documentation quality, and ensures consistency.

### Key Capabilities

1. **Smart Update Detection** - Identifies when documentation needs updating based on code changes
2. **Template Management** - Discovers and applies project documentation templates
3. **Quality Validation** - Checks links, code examples, cross-references, and formatting
4. **Timestamp Maintenance** - Automatically updates "Last Updated" metadata
5. **Cross-Reference Integrity** - Ensures bidirectional linking and consistency

---

## When This Skill Activates

### Automatic Activation Triggers

**Code Changes:**
- New feature implementation completed
- API interface or signature changes
- New architectural pattern introduced
- Complex bug fix (3+ iterations to solve)
- New dependencies added
- Build or deployment process changes

**Documentation Tasks:**
- User explicitly asks to create/update documentation
- User mentions "docs", "documentation", "readme", or similar
- Quality gates fail due to outdated documentation
- Cross-reference validation errors detected

**Proactive Detection:**
- Major refactoring completed
- New public APIs exposed
- Breaking changes introduced
- Configuration changes made

### Manual Activation

Users can explicitly invoke this skill by:
```
"Update the documentation for..."
"Create documentation for..."
"Check documentation quality"
"Validate all doc links"
```

---

## Project Configuration

This skill adapts to any project through a `.claude/doc-config.json` configuration file in the project root.

### Configuration Schema

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
      "description": "System design and architecture decisions"
    },
    "features": {
      "path": "docs/features",
      "template": "docs/features/_TEMPLATE.md",
      "description": "Feature-specific implementation guides"
    },
    "development": {
      "path": "docs/development",
      "template": "docs/development/_TEMPLATE.md",
      "description": "Development process and workflow guides"
    }
  },
  "updateTriggers": [
    "New feature in src/",
    "API change in api/",
    "Architecture change",
    "New pattern discovered"
  ],
  "validation": {
    "checkLinks": true,
    "lintCodeExamples": true,
    "verifyTimestamps": true,
    "checkCrossReferences": true
  },
  "timestampFormat": "YYYY-MM-DD",
  "changelogLocation": "CHANGELOG.md"
}
```

### Minimal Configuration

If no configuration exists, the skill uses intelligent defaults:

```json
{
  "documentationRoot": "docs",
  "templateLocations": ["**/_TEMPLATE.md", "**/TEMPLATE.md"],
  "categories": {
    "general": {
      "path": "docs",
      "description": "General documentation"
    }
  }
}
```

---

## Workflow

### 1. Update Detection Phase

**When code changes occur, the skill:**

1. Analyzes the nature of changes (feature, bug fix, refactor, API change)
2. Determines if documentation update is warranted
3. Identifies which documentation category is affected
4. Checks for existing related documentation

**Detection Logic:**
```
IF (new feature OR API change OR architecture change) THEN
  TRIGGER documentation update workflow

IF (complex bug fix AND iterations > 3) THEN
  SUGGEST adding to troubleshooting documentation

IF (new dependency OR config change) THEN
  UPDATE setup/configuration documentation
```

### 2. Category Selection Phase

**The skill determines the appropriate documentation category:**

- **Reference Docs** - For new patterns, standards, or technical references
- **Architecture Docs** - For system design changes or architectural decisions
- **Feature Docs** - For new user-facing features or capabilities
- **Development Docs** - For process, workflow, or tooling changes

**Selection Criteria:**
```
User-facing feature → features/
System design change → architecture/
New pattern/standard → reference/
Process/workflow change → development/
```

### 3. Template Application Phase

**The skill:**

1. Locates the appropriate template for the category
2. Copies template structure
3. Pre-fills standard sections with context
4. Leaves placeholders for manual content

**Template Detection:**
- Searches configured `templateLocations`
- Falls back to common patterns: `_TEMPLATE.md`, `TEMPLATE.md`, `.template.md`
- Uses category-specific templates when available

### 4. Content Guidance Phase

**The skill provides:**

- **Purpose Section** - Suggests why this documentation exists
- **Context Section** - Identifies where/when it applies
- **Implementation Section** - Outlines key points to document
- **Examples Section** - Recommends code examples to include
- **Cross-References** - Suggests related documentation to link

### 5. Validation Phase

**The skill checks:**

✅ **Link Validity** - All markdown links resolve correctly
✅ **Code Examples** - All code blocks are lint-compliant (if configured)
✅ **Cross-References** - Bidirectional linking is maintained
✅ **Timestamps** - "Last Updated" is current
✅ **Template Compliance** - Required sections are present
✅ **Formatting** - Consistent markdown formatting

### 6. Maintenance Phase

**The skill automatically:**

- Updates "Last Updated" timestamps
- Adds change summaries
- Updates cross-references in related docs
- Validates all links still work
- Checks for orphaned documentation

---

## Validation Scripts

The skill includes universal validation utilities:

### Link Checker (`validators/link-checker.sh`)

Validates all markdown links in documentation:

```bash
#!/bin/bash
# Find all markdown files and check links

DOC_ROOT="${1:-.}"

find "$DOC_ROOT" -name "*.md" -type f | while read -r file; do
  # Extract links and verify they exist
  grep -oE '\[.*\]\(([^)]+)\)' "$file" | \
    sed 's/.*(\(.*\))/\1/' | \
    while read -r link; do
      # Skip external URLs (basic check)
      if [[ ! $link =~ ^http ]]; then
        # Resolve relative path
        dir=$(dirname "$file")
        target="$dir/$link"

        if [[ ! -e "$target" ]]; then
          echo "❌ Broken link in $file: $link"
        fi
      fi
    done
done
```

### Code Example Linter (`validators/code-example-linter.sh`)

Extracts and validates code examples (project-specific linter):

```bash
#!/bin/bash
# Extract code blocks and run through project linter

DOC_FILE="$1"
TEMP_DIR=$(mktemp -d)

# Extract code blocks
awk '/```typescript/,/```/' "$DOC_FILE" | \
  sed '/```/d' > "$TEMP_DIR/code.ts"

# Run project linter (if configured)
if command -v npm &> /dev/null && [ -f "package.json" ]; then
  npx eslint "$TEMP_DIR/code.ts" || echo "⚠️ Code example lint issues in $DOC_FILE"
fi

rm -rf "$TEMP_DIR"
```

### Cross-Reference Validator (`validators/cross-ref-validator.sh`)

Ensures bidirectional linking:

```bash
#!/bin/bash
# Check that linked documents link back

DOC_ROOT="${1:-.}"

find "$DOC_ROOT" -name "*.md" -type f | while read -r file; do
  # Get all local links from this file
  grep -oE '\[.*\]\(([^)]+\.md)\)' "$file" | \
    sed 's/.*(\(.*\))/\1/' | \
    while read -r link; do
      # Get target file
      dir=$(dirname "$file")
      target="$dir/$link"

      if [[ -e "$target" ]]; then
        # Check if target links back
        filename=$(basename "$file")
        if ! grep -q "$filename" "$target"; then
          echo "⚠️ Unidirectional link: $file → $target (no backlink)"
        fi
      fi
    done
done
```

### Timestamp Updater (`maintenance/timestamp-updater.sh`)

Updates "Last Updated" fields:

```bash
#!/bin/bash
# Update "Last Updated" timestamp in documentation

FILE="$1"
DATE_FORMAT="${2:-"%Y-%m-%d"}"
CURRENT_DATE=$(date +"$DATE_FORMAT")

# Find and update "Last Updated" line
sed -i.bak "s/\*\*Last Updated:\*\* .*/\*\*Last Updated:\*\* $CURRENT_DATE/" "$FILE"
sed -i.bak "s/Last Updated: .*/Last Updated: $CURRENT_DATE/" "$FILE"

rm -f "${FILE}.bak"
echo "✅ Updated timestamp in $FILE to $CURRENT_DATE"
```

---

## Update Trigger Patterns

### Universal Patterns

These patterns apply to most projects:

**Feature Addition:**
```
✓ New component in src/components/
✓ New API endpoint in api/ or routes/
✓ New public function/class
✓ New user-facing capability

→ Update: features/ documentation
→ Add: Usage examples
→ Update: API documentation if applicable
```

**Architectural Change:**
```
✓ New design pattern introduced
✓ State management change
✓ Database schema modification
✓ Authentication/authorization change

→ Update: architecture/ documentation
→ Create: ADR (Architecture Decision Record) if significant
→ Update: Related system documentation
```

**API/Interface Change:**
```
✓ Function signature changed
✓ API endpoint modified
✓ Breaking changes introduced
✓ New parameters added

→ Update: reference/ or api/ documentation
→ Add: Migration guide if breaking
→ Update: All examples using the API
```

**Complex Solution:**
```
✓ Bug fix required 3+ iterations
✓ Non-obvious solution discovered
✓ Debugging pattern identified

→ Add: troubleshooting/ documentation
→ Update: quality-assurance/ patterns
→ Document: The "why" behind the solution
```

**Dependency/Tool Change:**
```
✓ New npm package added
✓ Build process modified
✓ Development tool added
✓ Configuration changed

→ Update: development/ or setup/ documentation
→ Add: Installation/configuration steps
→ Update: README if user-facing
```

---

## Category Selection Logic

```typescript
function selectDocumentationCategory(changeContext) {
  const { changeType, affectedFiles, impactScope } = changeContext;

  // User-facing features
  if (changeType === 'feature' && impactScope === 'user-facing') {
    return {
      category: 'features',
      template: 'features/_TEMPLATE.md',
      suggestedName: `${featureName}.md`
    };
  }

  // Architecture/design changes
  if (changeType === 'architecture' || impactScope === 'system-wide') {
    return {
      category: 'architecture',
      template: 'architecture/_TEMPLATE.md',
      suggestedName: `${componentName}.md` or `ADR-${number}-${title}.md`
    };
  }

  // Technical patterns/standards
  if (changeType === 'pattern' || changeType === 'standard') {
    return {
      category: 'reference',
      template: 'reference/_TEMPLATE.md',
      suggestedName: `${patternName}.md`
    };
  }

  // Development process/workflow
  if (affectedFiles.includes('build') || affectedFiles.includes('config')) {
    return {
      category: 'development',
      template: 'development/_TEMPLATE.md',
      suggestedName: `${processName}.md`
    };
  }

  // Default to general documentation
  return {
    category: 'general',
    template: '_TEMPLATE.md',
    suggestedName: `${topic}.md`
  };
}
```

---

## Integration with Development Workflow

### Typical Usage Flow

**1. Feature Development Complete**
```
Developer: "I've finished implementing the user authentication feature"

Skill Activates:
  ✓ Detects: Feature implementation complete
  ✓ Category: features/ (user-facing capability)
  ✓ Suggests: Create features/user-authentication.md
  ✓ Template: Applies features/_TEMPLATE.md
  ✓ Pre-fills: Purpose, context from implementation
  ✓ Prompts: For API usage examples, integration points
```

**2. Architecture Change**
```
Developer: "I've refactored the state management to use Zustand"

Skill Activates:
  ✓ Detects: Architecture change (state management)
  ✓ Category: architecture/ (system-wide impact)
  ✓ Suggests: Create architecture/state-management.md or ADR-XXX
  ✓ Template: Applies architecture/_TEMPLATE.md
  ✓ Pre-fills: Rationale, dependencies, migration notes
  ✓ Updates: Related component documentation
```

**3. Quality Assurance Pattern**
```
Developer: "I found a tricky race condition in the API tests"

Skill Activates:
  ✓ Detects: Complex bug (3+ iterations to debug)
  ✓ Category: reference/ (quality assurance pattern)
  ✓ Suggests: Add to reference/QUALITY_ASSURANCE.md
  ✓ Guidance: Document the pattern for future reference
  ✓ Updates: Testing strategy documentation
```

### With TDD/BDD Workflow

**Integrated with Quality Gates:**

```
RED → GREEN → REFACTOR → DOCUMENT
                            ↓
                    Skill Activates:
                    - Feature complete?
                    - New pattern?
                    - Update docs
                    - Run validation
```

---

## Examples for Different Project Types

### React/TypeScript Project

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "components": {
      "path": "docs/components",
      "template": "docs/components/_TEMPLATE.md"
    },
    "hooks": {
      "path": "docs/hooks",
      "template": "docs/hooks/_TEMPLATE.md"
    },
    "api": {
      "path": "docs/api",
      "template": "docs/api/_TEMPLATE.md"
    }
  },
  "validation": {
    "lintCodeExamples": true,
    "checkLinks": true
  }
}
```

### Python/Django Project

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "models": {
      "path": "docs/models",
      "description": "Database models documentation"
    },
    "views": {
      "path": "docs/views",
      "description": "View and endpoint documentation"
    },
    "architecture": {
      "path": "docs/architecture",
      "description": "System architecture"
    }
  }
}
```

### Microservices Project

**Configuration:**
```json
{
  "documentationRoot": "docs",
  "categories": {
    "services": {
      "path": "docs/services",
      "description": "Individual service documentation"
    },
    "contracts": {
      "path": "docs/contracts",
      "description": "API contracts and interfaces"
    },
    "deployment": {
      "path": "docs/deployment",
      "description": "Deployment and infrastructure"
    }
  }
}
```

---

## Best Practices

### For Documentation Writers

1. **Start with Templates** - Always use project templates for consistency
2. **Document the Why** - Explain decisions, not just what the code does
3. **Keep Examples Current** - Ensure code examples are tested and lint-clean
4. **Bidirectional Linking** - Always link back from referenced documents
5. **Update Timestamps** - Use the timestamp updater utility

### For Project Maintainers

1. **Create Templates** - Define templates for each documentation category
2. **Configure the Skill** - Add `.claude/doc-config.json` to your project
3. **Run Validation** - Regularly check documentation quality
4. **Review Changes** - Validate documentation updates in pull requests
5. **Keep It Fresh** - Trigger updates when code changes

### For Teams

1. **Documentation Reviews** - Review docs alongside code reviews
2. **Template Updates** - Evolve templates as needs change
3. **Shared Patterns** - Document common solutions for team benefit
4. **Onboarding** - Use documentation as onboarding material
5. **Living Documentation** - Keep docs current, not archived

---

## Skill Maintenance

### Updating This Skill

Update when:
- New documentation patterns discovered
- Validation logic needs enhancement
- Template structures evolve
- New project types require support

### Version History

**1.0.0** (2025-10-18)
- Initial universal/project-agnostic implementation
- Smart update detection
- Template management system
- Validation scripts (links, code, cross-refs)
- Timestamp maintenance
- Project configuration schema
- Examples for multiple project types

---

## Resources

### In This Skill

- `detectors/update-triggers.md` - Detailed update detection logic
- `detectors/category-selector.md` - Category selection algorithms
- `validators/` - All validation scripts
- `maintenance/` - Maintenance utilities
- `templates/` - Example templates for different project types
- `examples/` - Real-world usage examples
- `config-schemas/` - Configuration file schemas

### External Resources

- **Markdown Best Practices**: https://www.markdownguide.org/basic-syntax/
- **Documentation Systems**: https://documentation.divio.com/
- **ADR Template**: https://github.com/joelparkerhenderson/architecture-decision-record

---

**Skill Type:** Universal
**Skill Name:** documentation-keeper
**Version:** 1.0.0
**Last Updated:** 2025-10-18
**Maintainer:** Claude Code Skills Project
