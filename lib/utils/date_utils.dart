import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  /// Format date to match the database date style.
  /// Pattern: MM-dd
  String toDbDate() {
    final DateFormat formatter = DateFormat('MM-dd', 'en');
    return formatter.format(this);
  }
}
