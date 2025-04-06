extension DateFormat on DateTime {
  /// Formats the date to a string in the format 'HH:mm'.
  String formatTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
