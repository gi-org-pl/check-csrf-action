#!/bin/sh
set -e

BASE_BRANCH="${1:-main}"

echo "Checking for CRLF line endings against $BASE_BRANCH..."

CRLF_FILES=$(git ls-files --eol | grep -E 'i/crlf|w/crlf' || true)

if [ -n "$CRLF_FILES" ]; then
  echo "❌ CRLF line endings detected:"
  echo "$CRLF_FILES"
  exit 1
fi

echo "✅ No CRLF line endings found."
