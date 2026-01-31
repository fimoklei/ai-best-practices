#!/bin/bash
# Cross-Reference Validator
# Ensures bidirectional linking between documentation files
# Usage: ./cross-ref-validator.sh [docs-directory]

set -e

DOC_ROOT="${1:-.}"
UNIDIRECTIONAL=0

echo "🔗 Checking cross-references in: $DOC_ROOT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Find all markdown files
find "$DOC_ROOT" -name "*.md" -type f | while read -r file; do
  # Extract all local markdown links
  grep -oE '\[.*\]\(([^)]+\.md[^)]*)\)' "$file" 2>/dev/null | \
    sed 's/.*(\([^)]*\.md[^)]*\))/\1/' | \
    sed 's/#.*//' | \
    while read -r link; do
      # Resolve relative path
      dir=$(dirname "$file")

      # Handle absolute paths from repo root
      if [[ $link == /* ]]; then
        target="$link"
      else
        target="$dir/$link"
      fi

      # Normalize path
      target=$(cd "$dir" 2>/dev/null && cd "$(dirname "$link")" 2>/dev/null && pwd)/$(basename "$link") 2>/dev/null || echo "$target"

      # Check if target exists
      if [[ -e "$target" ]]; then
        # Check if target links back to source
        filename=$(basename "$file")

        if ! grep -q "$filename" "$target" 2>/dev/null; then
          echo "⚠️  Unidirectional link:"
          echo "   From: $(basename "$file")"
          echo "   To: $(basename "$target")"
          echo "   Suggestion: Add backlink in $(basename "$target")"
          echo ""
          ((UNIDIRECTIONAL++))
        fi
      fi
    done
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $UNIDIRECTIONAL -eq 0 ]]; then
  echo "✅ All cross-references are bidirectional!"
  exit 0
else
  echo "ℹ️  Found $UNIDIRECTIONAL unidirectional link(s)."
  echo "   Consider adding backlinks for better navigation."
  exit 0  # Don't fail, just warn
fi
