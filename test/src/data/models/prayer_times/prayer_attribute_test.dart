import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/prayer_attribute.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/asr_method.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculation_method.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/higher_latitude_method.dart';

void main() {
  group('PrayerAttribute', () {
    test('default values are correct', () {
      const prayerAttribute = PrayerAttribute();

      expect(prayerAttribute.calculationMethod, CalculationMethod.makkah);
      expect(prayerAttribute.asrMethod, AsrMethod.shafii);
      expect(
        prayerAttribute.higherLatitudeMethod,
        HigherLatitudeMethod.angleBased,
      );
      expect(prayerAttribute.offset, [0, 0, 0, 0, 0, 0]);
    });

    test('copyWith creates a new instance with updated values', () {
      const prayerAttribute = PrayerAttribute();
      final updatedPrayerAttribute = prayerAttribute.copyWith(
        calculationMethod: CalculationMethod.karachi,
        asrMethod: AsrMethod.hanafi,
        higherLatitudeMethod: HigherLatitudeMethod.midNight,
        offset: [1, 2, 3, 4, 5, 6],
      );

      expect(
        updatedPrayerAttribute.calculationMethod,
        CalculationMethod.karachi,
      );
      expect(updatedPrayerAttribute.asrMethod, AsrMethod.hanafi);
      expect(
        updatedPrayerAttribute.higherLatitudeMethod,
        HigherLatitudeMethod.midNight,
      );
      expect(updatedPrayerAttribute.offset, [1, 2, 3, 4, 5, 6]);
    });

    test(
      'copyWith retains original values when no parameters are provided',
      () {
        const prayerAttribute = PrayerAttribute();
        final copiedPrayerAttribute = prayerAttribute.copyWith();

        expect(
          copiedPrayerAttribute.calculationMethod,
          prayerAttribute.calculationMethod,
        );
        expect(copiedPrayerAttribute.asrMethod, prayerAttribute.asrMethod);
        expect(
          copiedPrayerAttribute.higherLatitudeMethod,
          prayerAttribute.higherLatitudeMethod,
        );
        expect(copiedPrayerAttribute.offset, prayerAttribute.offset);
      },
    );

    test('equality operator works correctly', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute();

      expect(prayerAttribute1, prayerAttribute2);
    });

    test('hashCode is consistent with equality', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute();

      expect(prayerAttribute1.hashCode, prayerAttribute2.hashCode);
    });

    test('toString returns the correct string representation', () {
      const prayerAttribute = PrayerAttribute();
      final stringRepresentation = prayerAttribute.toString();

      expect(
        stringRepresentation,
        'PrayerAttribute(calculationMethod: ${prayerAttribute.calculationMethod}, asrMethod: ${prayerAttribute.asrMethod}, higherLatitudeMethod: ${prayerAttribute.higherLatitudeMethod}, offset: ${prayerAttribute.offset})',
      );
    });
  });
}
