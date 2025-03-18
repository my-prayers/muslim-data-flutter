import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:muslim_data_flutter/utils/date_utils.dart';
import 'package:muslim_data_flutter/models/prayer_times/time_format.dart';
import 'dart:ui';

void main() {
  setUp(() {
    initializeDateFormatting('en', null);
  });

  test('formatToDbDate formats date to MM-dd', () {
    final date = DateTime(2024, 10, 5);
    expect(date.formatToDbDate(), '10-05');
  });

  test('formatToDbDate handles edge case for single-digit month and day', () {
    final date = DateTime(2023, 1, 1);
    expect(date.formatToDbDate(), '01-01');
  });

  test('format formats time in 24-hour format for en locale', () {
    final date = DateTime(2024, 10, 5, 14, 30);
    final locale = Locale('en');
    expect(date.format(TimeFormat.time24, locale), '14:30');
  });

  test('format formats time in 12-hour format for en locale', () {
    final date = DateTime(2023, 10, 5, 14, 30);
    final locale = Locale('en');
    expect(date.format(TimeFormat.time12, locale), '02:30 PM');
  });
}
