#!/bin/bash
# Timestamp Updater
# Updates "Last Updated" timestamps in documentation files
# Usage: ./timestamp-updater.sh <doc-file> [date-format]

set -e

FILE="$1"
DATE_FORMAT="${2:-%Y-%m-%d}"  # Default: YYYY-MM-DD
CURRENT_DATE=$(date +"$DATE_FORMAT")

if [[ ! -f "$FILE" ]]; then
  echo "❌ File not found: $FILE"
  exit 1
fi

echo "📅 Updating timestamp in: $(basename "$FILE")"

# Create backup
cp "$FILE" "${FILE}.bak"

# Try different Last Updated patterns
UPDATED=0

# Pattern 1: **Last Updated:** YYYY-MM-DD
if grep -q '\*\*Last Updated:\*\*' "$FILE"; then
  sed -i.tmp "s|\*\*Last Updated:\*\* .*|\*\*Last Updated:\*\* $CURRENT_DATE|" "$FILE"
  UPDATED=1
fi

# Pattern 2: Last Updated: YYYY-MM-DD
if grep -q 'Last Updated:' "$FILE" && [[ $UPDATED -eq 0 ]]; then
  sed -i.tmp "s|Last Updated: .*|Last Updated: $CURRENT_DATE|" "$FILE"
  UPDATED=1
fi

# Pattern 3: - Last Updated: YYYY-MM-DD
if grep -q '^- Last Updated:' "$FILE" && [[ $UPDATED -eq 0 ]]; then
  sed -i.tmp "s|^- Last Updated: .*|- Last Updated: $CURRENT_DATE|" "$FILE"
  UPDATED=1
fi

# Clean up temp files
rm -f "${FILE}.tmp"

if [[ $UPDATED -eq 1 ]]; then
  echo "✅ Updated timestamp to: $CURRENT_DATE"
  rm -f "${FILE}.bak"
  exit 0
else
  # Restore backup if no timestamp found
  mv "${FILE}.bak" "$FILE"
  echo "⚠️  No 'Last Updated' field found to update"
  echo "ℹ️  Add one of these patterns to your documentation:"
  echo "   **Last Updated:** YYYY-MM-DD"
  echo "   Last Updated: YYYY-MM-DD"
  echo "   - Last Updated: YYYY-MM-DD"
  exit 0  # Don't fail
fi
