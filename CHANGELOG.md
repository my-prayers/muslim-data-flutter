# Changelog

All notable changes to this project will be documented in this file.

## [1.1.2] - 2025-08-07

### 🚀 Features

- *(actions)* Create setup-flutter action for CI workflows

### 🐛 Bug Fixes

- *(pubspec)* Update Flutter version format in pubspec.yaml
- *(actions)* Remove unnecessary shell declaration in setup action
- *(prayer-times)* Correct timezone calculation and improve readability
- *(example)* Update prayer times on location change
- *(pubspec)* Update flutter version constraint format

### 🚜 Refactor

- *(actions)* Rename action.yaml to action.yml
- *(githook)* Improve commit message validation logic
- *(example)* Update prayer times on location change
- *(githook)* Improve validation message for commit format
- Update .github/CODEOWNERS
- Update pattern check of the semantic version

### ⚙️ Miscellaneous Tasks

- *(dependabot)* Update configuration for dependency updates
- Update Flutter CI workflow for pull request checks
- Add checkout step in pull request workflow
- Remove redundant checkout steps from setup-flutter action
- Add CODEOWNERS file for default code ownership
- Add names to analyze and test jobs in pull request workflow

## [1.1.1] - 2025-07-17

### 🐛 Bug Fixes

- *(database)* Update database version and fix Piranshahr, IR prayer time

### 🚜 Refactor

- *(bump version)* Remove generating doc while bumpping a new version
- *(bump version)* Update version bump script to include pub get

## [1.1.0] - 2025-05-09

### 🐛 Bug Fixes

- Fix undefined variables in the bump version script
- Fix Kalar, IQ prayer times by reverting the fajr and sunrise to the old timetable
- R and n are not a valid letter in the commit message scope
- *(prayer times)* Prayer times but fixes

### 📚 Documentation

- Update read me file to address the availability of muslim data on other platforms
- Update heading style in the readme file

### 🧪 Testing

- Update calculated prayer times test
- *(prayer times)* Update total fixed prayer times as we added Rovia, IQ

### ⚙️ Miscellaneous Tasks

- Remove the footer of the changelog
- Add build options to the commit parser for the changelog
- Remove the footer of the changelog file
- Update cliff configuration
- Simplify the bump version script
- Update pubspec.lock of the example app
- Update flutter action in the pull request workflow
- Update flutter version in the pull request workflow
- Update flutter version to 3.27.0 in the pull request workflow
- Update flutter version to 3.29.0 in the pull request workflow

## [1.0.1] - 2025-04-13

### 🚜 Refactor

- Reformat the dart files to match the dart formatter style

### 📚 Documentation

- Update screenshot size in the README file

### ⚙️ Miscellaneous Tasks

- Add auto publish github workflow

## [1.0.0] - 2025-04-13

### 🚀 Features

- Add date format extensions
- Add string date extension
- Add prayer time models
- Add names of ALLAH model
- Add location models
- Add azkar models
- Add table and database classes
- Add a sample database service
- Add a sample repository with getPrayerTimes method
- Add an example project to the package
- Get prayer times in the example app
- Get prayer times in the example app
- Add language to the example app
- Add location functionalities to the muslim repository
- Add azkar funtionalities to the muslim data repository
- Add calculated and fixed prayer times to the muslim repository
- Add upgrade mechanism for the prepopulated database
- Create singletone for muslim repository and hide unnecessary files
- Add simple app layout for the example app
- Add prayer times screen in the example app
- Add location screen for the example app
- Add Names of Allah screen to the example app
- Add azkar categories screen to the example app
- Add azkar chapters screen to the example app
- Add azkar items screen to the example app

### 🚜 Refactor

- Update database table classes to match the prepopulated db
- Remove unnecessary functionalities in the prayer times
- Remove intl package and do the formatting manually
- Add await keyword to the get prayer times method in db service
- Update the datebase queries by using custom selections
- Delete all table classes as we use custom selection instead of them
- Remove freezed dependency in the package
- Update folder structure and database file names
- Rename a test util file name
- Rename the names to names screen
- Change the order of the getAzkarItems parameters
- Change the positional parameters to named parameters in the MuslimRepository

### 📚 Documentation

- Add README file

### 🎨 Styling

- Add more spacing to the prayer times list in the example app

### 🧪 Testing

- Add unit tests for all models except the calculated prayer times
- Add unit tests for the calculated prayer times
- Fix some calculated prayer time tests
- Add unit tests for the muslim repository class
- Prevent concurrency on the flutter tests
- Add location exception test
- Add unit test for getAzkarChaptersByIds

### ⚙️ Miscellaneous Tasks

- Add intl dependency
- Add lefthook for managing git hooks
- Update gitignore file
- Add git-cliff for generating change logs
- Add dependabot for auto dependency update
- Add a pull request action for running tests before merge.
- Add gitattributes file to ignore generated file in the PR review
- Add drift dependency
- Remove freezed transitive dependency in the example app
- Add license
- Update pubspec to include package information
- Add pre-tag hook to bump version
- Update lefthook file
- Update bump version script
- Update bump version script
- Update doc path in the bump version script
- Update version to 1.0.0 and regenerate changelog and docs
