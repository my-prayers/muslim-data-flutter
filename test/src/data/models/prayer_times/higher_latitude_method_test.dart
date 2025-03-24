import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/higher_latitude_method.dart';

void main() {
  group('HigherLatitudeMethod', () {
    test('should have correct enum values', () {
      expect(HigherLatitudeMethod.none.index, 0);
      expect(HigherLatitudeMethod.midNight.index, 1);
      expect(HigherLatitudeMethod.oneSeven.index, 2);
      expect(HigherLatitudeMethod.angleBased.index, 3);
    });

    test('should return correct string representation', () {
      expect(HigherLatitudeMethod.none.toString(), 'HigherLatitudeMethod.none');
      expect(
        HigherLatitudeMethod.midNight.toString(),
        'HigherLatitudeMethod.midNight',
      );
      expect(
        HigherLatitudeMethod.oneSeven.toString(),
        'HigherLatitudeMethod.oneSeven',
      );
      expect(
        HigherLatitudeMethod.angleBased.toString(),
        'HigherLatitudeMethod.angleBased',
      );
    });

    test('should compare enum values correctly', () {
      expect(HigherLatitudeMethod.none == HigherLatitudeMethod.none, isTrue);
      expect(
        HigherLatitudeMethod.none == HigherLatitudeMethod.midNight,
        isFalse,
      );
    });

    test('should have all enum values in values list', () {
      expect(HigherLatitudeMethod.values, [
        HigherLatitudeMethod.none,
        HigherLatitudeMethod.midNight,
        HigherLatitudeMethod.oneSeven,
        HigherLatitudeMethod.angleBased,
      ]);
    });
  });
}
