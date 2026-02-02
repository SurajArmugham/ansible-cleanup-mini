#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-}"
DAYS="${2:-7}"

if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: cleanup.sh <target_dir> [days]"
  exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "ERROR: Directory does not exist: $TARGET_DIR"
  exit 1
fi

echo "Cleaning files older than $DAYS days in: $TARGET_DIR"

# macOS: -mtime counts full days
find "$TARGET_DIR" -type f -mtime +"$DAYS" -print -delete

echo "Cleanup complete."
