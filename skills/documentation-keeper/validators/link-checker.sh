#!/bin/bash
# Link Checker for Documentation
# Validates all markdown links in documentation files
# Usage: ./link-checker.sh [docs-directory]

set -e

DOC_ROOT="${1:-.}"
BROKEN_LINKS=0
CHECKED_FILES=0

echo "🔍 Checking links in: $DOC_ROOT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Find all markdown files
find "$DOC_ROOT" -name "*.md" -type f | while read -r file; do
  ((CHECKED_FILES++))

  # Extract all markdown links: [text](link)
  grep -oE '\[.*\]\(([^)]+)\)' "$file" 2>/dev/null | \
    sed 's/.*(\(.*\))/\1/' | \
    while read -r link; do
      # Skip external URLs (http/https)
      if [[ $link =~ ^https?:// ]]; then
        continue
      fi

      # Skip anchors (they're complex to validate)
      if [[ $link =~ ^# ]]; then
        continue
      fi

      # Remove anchor from link
      clean_link=$(echo "$link" | sed 's/#.*//')

      # Resolve relative path
      dir=$(dirname "$file")

      # Handle absolute paths from repo root
      if [[ $clean_link == /* ]]; then
        target="$clean_link"
      else
        target="$dir/$clean_link"
      fi

      # Normalize path (resolve ..)
      target=$(cd "$dir" 2>/dev/null && cd "$(dirname "$clean_link")" 2>/dev/null && pwd)/$(basename "$clean_link") 2>/dev/null || echo "$target"

      # Check if target exists
      if [[ ! -e "$target" ]]; then
        echo "❌ Broken link in $(basename "$file"): $link"
        echo "   Full path: $file"
        echo "   Target: $target"
        echo ""
        ((BROKEN_LINKS++))
      fi
    done
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $BROKEN_LINKS -eq 0 ]]; then
  echo "✅ All links valid! Checked $CHECKED_FILES files."
  exit 0
else
  echo "⚠️  Found $BROKEN_LINKS broken link(s) in $CHECKED_FILES files."
  exit 1
fi
