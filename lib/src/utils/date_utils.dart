extension DateUtils on DateTime {
  /// Format date to match the database date style.
  /// Pattern: MM-dd
  String toDbDate() {
    final String month = this.month.toString().padLeft(2, '0');
    final String day = this.day.toString().padLeft(2, '0');
    return '$month-$day';
  }
}
