extension DateFormat on DateTime {
  /// Convert date to string.
  String toStringHourMinute() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
