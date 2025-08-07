#!/bin/bash

# Ensure the tag version is provided
if [ -z "$1" ]; then
  echo "Error: Tag version is required."
  echo "Usage: ./bump_version.sh <tag-version>"
  exit 1
fi

# Validate version format (semantic versioning)
if ! [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+(\+[0-9]+)?$ ]]; then
  echo "Error: Invalid version format. Use semantic versioning (e.g., 1.2.3 or 1.2.3+4)"
  exit 1
fi

# Check if we're on a clean git state
if [ -n "$(git status --porcelain)" ]; then
  echo "Error: Working directory is not clean. Please commit or stash changes first."
  exit 1
fi

# define the commit message
commit_msg="build(release): update version to $1 and regenerate changelog"

# Bump files for the new release
sed -i '' "s/version: .*/version: $1/" pubspec.yaml
flutter pub get

# Check if git-cliff is available
if ! command -v git-cliff &> /dev/null; then
  echo "Error: git-cliff not found. Install git-cliff and try again."
  exit 1
else
  git cliff --unreleased --tag $1 --prepend CHANGELOG.md
fi

# Commit changes.
git add .
git commit -S -m "$commit_msg"

# Create the release tag
git tag -s "$1" -m "Release version $1"

echo "✅ Successfully bumped version to $1"
echo "Don't forget to push: git push origin main --tags"