import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/utils/date_utils.dart';

void main() {
  test('formatToDbDate formats date to MM-dd', () {
    final date = DateTime(2024, 10, 5);
    expect(date.toDbDate(), '10-05');
  });

  test('formatToDbDate handles edge case for single-digit month and day', () {
    final date = DateTime(2023, 1, 1);
    expect(date.toDbDate(), '01-01');
  });
}
