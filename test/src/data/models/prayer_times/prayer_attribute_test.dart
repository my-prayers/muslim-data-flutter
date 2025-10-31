import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/custom_method.dart';
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
      expect(prayerAttribute.customMethod.angles, [18.0, 1.0, 0.0, 0.0, 17.0]);
    });

    test('copyWith creates a new instance with updated values', () {
      const prayerAttribute = PrayerAttribute();
      final updatedPrayerAttribute = prayerAttribute.copyWith(
        calculationMethod: CalculationMethod.karachi,
        asrMethod: AsrMethod.hanafi,
        higherLatitudeMethod: HigherLatitudeMethod.midNight,
        offset: [1, 2, 3, 4, 5, 6],
        customMethod: CustomMethod(fajrAngle: 20.0, ishaAngle: 18.0),
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
      expect(
        updatedPrayerAttribute.customMethod,
        CustomMethod(fajrAngle: 20.0, ishaAngle: 18.0),
      );
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
        expect(
          copiedPrayerAttribute.customMethod,
          prayerAttribute.customMethod,
        );
      },
    );

    test('equality operator works correctly', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute();

      expect(prayerAttribute1, prayerAttribute2);
    });

    test('equality operator returns false for different calculationMethod', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute(
        calculationMethod: CalculationMethod.karachi,
      );

      expect(prayerAttribute1, isNot(prayerAttribute2));
    });

    test('equality operator returns false for different customMethods', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute(
        customMethod: CustomMethod(fajrAngle: 19.0, ishaAngle: 20.0),
      );

      expect(prayerAttribute1, isNot(prayerAttribute2));
    });

    test('equality operator returns false for different asrMethod', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute(asrMethod: AsrMethod.hanafi);

      expect(prayerAttribute1, isNot(prayerAttribute2));
    });

    test(
      'equality operator returns false for different higherLatitudeMethod',
      () {
        const prayerAttribute1 = PrayerAttribute();
        const prayerAttribute2 = PrayerAttribute(
          higherLatitudeMethod: HigherLatitudeMethod.midNight,
        );

        expect(prayerAttribute1, isNot(prayerAttribute2));
      },
    );

    test('equality operator returns false for different offset', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute(offset: [1, 0, 0, 0, 0, 0]);

      expect(prayerAttribute1, isNot(prayerAttribute2));
    });

    test('hashCode is consistent with equality', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute();

      expect(prayerAttribute1.hashCode, prayerAttribute2.hashCode);
    });

    test('hashCode is different for different customAngles', () {
      const prayerAttribute1 = PrayerAttribute();
      const prayerAttribute2 = PrayerAttribute(
        customMethod: CustomMethod(fajrAngle: 19.0, ishaAngle: 20.0),
      );

      expect(prayerAttribute1.hashCode, isNot(prayerAttribute2.hashCode));
    });

    test('toString returns the correct string representation', () {
      const prayerAttribute = PrayerAttribute();
      final stringRepresentation = prayerAttribute.toString();

      expect(
        stringRepresentation,
        'PrayerAttribute(calculationMethod: ${prayerAttribute.calculationMethod}, customMethod: ${prayerAttribute.customMethod}, asrMethod: ${prayerAttribute.asrMethod}, higherLatitudeMethod: ${prayerAttribute.higherLatitudeMethod}, offset: ${prayerAttribute.offset})',
      );
    });
  });
}
