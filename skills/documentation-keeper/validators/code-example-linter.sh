#!/bin/bash
# Code Example Linter
# Extracts and validates code examples in documentation
# Usage: ./code-example-linter.sh <doc-file> [language]

set -e

DOC_FILE="$1"
LANGUAGE="${2:-typescript}"  # Default to TypeScript

if [[ ! -f "$DOC_FILE" ]]; then
  echo "❌ File not found: $DOC_FILE"
  exit 1
fi

echo "🔍 Linting code examples in: $(basename "$DOC_FILE")"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

# Extract code blocks for the specified language
awk -v lang="$LANGUAGE" '
  /^```/ {
    if (!in_block) {
      # Check if this is the right language
      if ($0 ~ "```" lang || $0 == "```typescript" || $0 == "```ts" || $0 == "```javascript" || $0 == "```js") {
        in_block = 1
        block_num++
        next
      }
    } else {
      in_block = 0
      next
    }
  }
  in_block {
    print > ("'"$TEMP_DIR"'/code-block-" block_num ".ts")
  }
' "$DOC_FILE"

# Count extracted blocks
BLOCK_COUNT=$(ls -1 "$TEMP_DIR"/code-block-*.ts 2>/dev/null | wc -l | tr -d ' ')

if [[ $BLOCK_COUNT -eq 0 ]]; then
  echo "ℹ️  No $LANGUAGE code blocks found to lint."
  exit 0
fi

echo "Found $BLOCK_COUNT code block(s) to validate..."
echo ""

# Try to lint each block
LINT_ERRORS=0

for code_file in "$TEMP_DIR"/code-block-*.ts; do
  block_name=$(basename "$code_file")

  # Try to run project linter if available
  if command -v npx &> /dev/null && [[ -f "package.json" ]]; then
    echo "Checking $block_name..."

    if npx eslint "$code_file" --no-eslintrc --parser @typescript-eslint/parser 2>/dev/null; then
      echo "  ✅ Passed"
    else
      echo "  ⚠️  Has linting issues (not blocking)"
      ((LINT_ERRORS++))
    fi
  else
    # Basic syntax check with Node (if available)
    if command -v node &> /dev/null; then
      if node --check "$code_file" 2>/dev/null; then
        echo "  ✅ $block_name - Syntax valid"
      else
        echo "  ❌ $block_name - Syntax error"
        ((LINT_ERRORS++))
      fi
    else
      echo "  ℹ️  $block_name - No linter available, skipping"
    fi
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $LINT_ERRORS -eq 0 ]]; then
  echo "✅ All code examples passed validation!"
  exit 0
else
  echo "⚠️  $LINT_ERRORS code block(s) have issues (non-blocking)"
  exit 0  # Don't fail, just warn
fi
