#!/bin/bash

# Ensure the tag version is provided
if [ -z "$1" ]; then
  echo "Error: Tag version is required."
  echo "Usage: ./bump_version.sh <tag-version>"
  exit 1
fi

GIT_TAG=$1

# Use the tag version to update pubspec.yaml
sed -i '' "s/version: .*/version: $GIT_TAG/" pubspec.yaml

# Temporarily create the tag locally
git tag "$GIT_TAG"

# Generate changelog using cliff
git-cliff -o CHANGELOG.md

# Delete the temporary tag
git tag -d "$GIT_TAG"

# Update documentation
dart doc --output=docs

git add pubspec.yaml CHANGELOG.md docs

git commit -m "chore: update version to $GIT_TAG and regenerate changelog and docs"

git tag -a "$GIT_TAG" -m "Release version $GIT_TAG"
