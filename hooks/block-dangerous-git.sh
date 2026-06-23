#!/bin/bash

INPUT=$(cat)

COMMAND=$(echo "$INPUT" | grep -oP '"command"\s*:\s*"\K[^"]*' | head -1)

if [ -z "$COMMAND" ]; then
  COMMAND="$INPUT"
fi

# ponytail: hard block, no override — these actions require aaron's manual execution
BLOCKED_PATTERNS=(
  "git push"
  "push --force"
  "git reset --hard"
  "git clean -fd"
  "git clean -f"
  "git branch -D"
  "git checkout \."
  "git restore \."
  "glab mr create"
  "glab mr note"
  "glab issue note"
  "rm -rf"
  "rm -r"
  "DROP TABLE"
  "DROP DATABASE"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qiE "$pattern"; then
    echo "BLOCKED: '$pattern' 需要 aaron 手動執行。請將此動作存入 pending/ 並等待授權。" >&2
    exit 2
  fi
done

exit 0
