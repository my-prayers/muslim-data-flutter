import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/utils/string_date.dart';

void main() {
  group('StringDate Extension', () {
    test('fromDBString should convert valid time string to DateTime', () {
      const timeString = '14:30';
      final date = DateTime(2023, 10, 1);
      final result = timeString.toDate(date);

      expect(result.year, date.year);
      expect(result.month, date.month);
      expect(result.day, date.day);
      expect(result.hour, 14);
      expect(result.minute, 30);
    });

    test(
      'fromDBString should throw FormatException for invalid time string',
      () {
        const invalidTimeString = 'invalid';
        final date = DateTime(2023, 10, 1);

        expect(() => invalidTimeString.toDate(date), throwsFormatException);
      },
    );

    test('fromDBString should throw FormatException for missing colon', () {
      const invalidTimeString = '1430';
      final date = DateTime(2023, 10, 1);

      expect(() => invalidTimeString.toDate(date), throwsRangeError);
    });

    test(
      'fromDBString should throw FormatException for non-numeric values',
      () {
        const invalidTimeString = '14:xx';
        final date = DateTime(2023, 10, 1);

        expect(() => invalidTimeString.toDate(date), throwsFormatException);
      },
    );

    test(
      'fromDBString should handle single-digit hour and minute correctly',
      () {
        const timeString = '4:5';
        final date = DateTime(2023, 10, 1);
        final result = timeString.toDate(date);

        expect(result.year, date.year);
        expect(result.month, date.month);
        expect(result.day, date.day);
        expect(result.hour, 4);
        expect(result.minute, 5);
      },
    );
  });
}
