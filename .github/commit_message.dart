import 'dart:io';

void main() {
  final commitMessageFile = File('.git/COMMIT_EDITMSG');

  if (!commitMessageFile.existsSync()) {
    print('Commit message file does not exist.');
    exit(1);
  }

  final commitMessage = commitMessageFile.readAsStringSync();

  if (!isValidCommitMessage(commitMessage)) {
    print('👎 Invalid commit message format.');
    print('Commit message should follow the Conventional Commits format.');
    exit(1);
  }

  print('👍 Valid commit message!');
  exit(0);
}

bool isValidCommitMessage(String commitMessage) {
  final RegExp pattern = RegExp(
    r'^(?<type>feat|fix|build|chore|ci|docs|style|refactor|perf|test)(?<scope>(?:\([^()\r\n]*\)|\()?(?<breaking>!)?)(?<subject>:.*)?',
  );
  return pattern.hasMatch(commitMessage);
}
