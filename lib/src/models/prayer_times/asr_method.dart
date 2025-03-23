/// Prayer asr method.
enum AsrMethod {
  shafii(value: 0), // Shafii (standard)
  hanafi(value: 1); // Hanafi

  const AsrMethod({required this.value});

  final int value;
}
