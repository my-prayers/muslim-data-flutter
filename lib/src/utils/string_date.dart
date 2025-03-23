extension StringDate on String {
  /// Convert database string date to date.
  DateTime toDate(DateTime date) {
    final List<String> hourMinute = split(':');
    final int hour = int.parse(hourMinute[0]);
    final int minute = int.parse(hourMinute[1]);
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}
