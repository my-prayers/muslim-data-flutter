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
  echo ""  
  echo "  body (optional)"
  echo ""  
  echo "  footer (optional)"
  echo ""  
  echo "Where: "
  echo "  - type: feat, fix, build, chore, ci, docs, style, refactor, perf, test"
  echo "  - scope: optional, no spaces allowed (use hyphens or underscores instead)"
  echo "  - description: brief description"
  echo "  - body: optional, detailed description"
  echo "  - footer: optional, references to issues or breaking changes"
  echo ""
  exit 1
fi

# Check if the description is no more than 72 characters
if [ ${#FIRST_LINE} -gt 72 ]; then
  echo "👎 Commit message description is too long (${#FIRST_LINE} characters)."
  echo "Please keep the description to 72 characters or less."
  exit 1
fi

# Check if the description is ended with a period
if [[ "$FIRST_LINE" == *"." ]]; then
  echo "👎 Commit message description cannot end with full stop."
  exit 1
fi

echo "👍 Valid commit message!"
exit 0
