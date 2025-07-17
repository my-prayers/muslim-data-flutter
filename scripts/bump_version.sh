#!/bin/bash

# Ensure the tag version is provided
if [ -z "$1" ]; then
  echo "Error: Tag version is required."
  echo "Usage: ./bump_version.sh <tag-version>"
  exit 1
fi

# define the commit message
commit_msg="build(release): update version to $1 and regenerate changelog"

# Bump files for the new release
sed -i '' "s/version: .*/version: $1/" pubspec.yaml
flutter pub get
git cliff --unreleased --tag $1 --prepend CHANGELOG.md

# Commit changes.
git add .
git commit -m "$commit_msg"

# Create the release tag
git tag -a "$1" -m "Release version $1"
