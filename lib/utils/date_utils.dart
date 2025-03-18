import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:muslim_data_flutter/models/prayer_times/time_format.dart';

extension DateUtils on DateTime {
  /// Format date to match the database date style.
  /// Pattern: MM-dd
  String formatToDbDate() {
    final DateFormat formatter = DateFormat('MM-dd', 'en');
    return formatter.format(this);
  }

  /// Format time to be 12 or 24 time format.
  String format(TimeFormat format, Locale locale) {
    switch (format) {
      case TimeFormat.time24:
        return formatTime24(locale);
      case TimeFormat.time12:
        return formatTime12(locale);
    }
  }

  /// Formats the time in 24-hour format based on the provided [locale].
  String formatTime24(Locale locale) {
    DateFormat.useNativeDigitsByDefaultFor('ar', true);
    final DateFormat formatter = DateFormat('HH:mm', locale.toString());
    return formatter.format(this);
  }

  /// Formats the time in 12-hour format based on the provided [locale].
  String formatTime12(Locale locale) {
    if (locale.languageCode == 'ckb') {
      final DateFormat formatter = DateFormat('hh:mm a', 'ar');
      return formatter
          .format(this)
          .replaceAll('م', 'د.ن')
          .replaceAll('ص', 'ب.ن');
    } else {
      final DateFormat formatter = DateFormat('hh:mm a', locale.toString());
      return formatter.format(this);
    }
  }
}
