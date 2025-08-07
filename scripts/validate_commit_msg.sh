#!/bin/bash

# Path to the commit message file
COMMIT_MSG_FILE=".git/COMMIT_EDITMSG"

# Check if the commit message file exists
if [ ! -f "$COMMIT_MSG_FILE" ]; then
  echo "Commit message file does not exist."
  exit 1
fi

# Read the commit message
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

# Get the first line of the commit message
FIRST_LINE=$(echo "$COMMIT_MSG" | head -n 1)

# Define the Conventional Commits regex pattern
# Scope cannot contain spaces - only letters, numbers, hyphens, and underscores
PATTERN='^(feat|fix|build|chore|ci|docs|style|refactor|perf|test)(\([a-zA-Z0-9_-]+\))?(!)?: .+'

# Validate the commit message format
if [[ ! "$FIRST_LINE" =~ $PATTERN ]]; then
  echo "👎 Invalid commit message format."
  echo "Commit message should follow the Conventional Commits format:"
  echo "  <type>(<scope>): <description>"
  echo "  - type: feat, fix, build, chore, ci, docs, style, refactor, perf, test"
  echo "  - scope: optional, no spaces allowed (use hyphens or underscores instead)"
  echo "  - description: brief description"
  echo ""
  echo "Examples:"
  echo "  ✅ feat(user-auth): Add new authentication method"
  echo "  ✅ fix(api_client): Fix connection timeout issue" 
  echo "  ❌ fix(my feature): Fix some bug (scope contains spaces)"
  exit 1
fi

# Check if the first line is no more than 72 characters
if [ ${#FIRST_LINE} -gt 72 ]; then
  echo "👎 Commit message first line is too long (${#FIRST_LINE} characters)."
  echo "Please keep the first line to 72 characters or less."
  exit 1
fi

echo "👍 Valid commit message!"
exit 0