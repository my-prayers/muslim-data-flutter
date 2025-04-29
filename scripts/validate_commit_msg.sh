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

# Define the Conventional Commits regex pattern
PATTERN='^(feat|fix|build|chore|ci|docs|style|refactor|perf|test)(\([^)]*\))?(!)?: .+'

# Validate the commit message
if [[ "$COMMIT_MSG" =~ $PATTERN ]]; then
  echo "👍 Valid commit message!"
  exit 0
else
  echo "👎 Invalid commit message format."
  echo "Commit message should follow the Conventional Commits format."
  exit 1
fi