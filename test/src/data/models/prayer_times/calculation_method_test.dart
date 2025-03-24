import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculation_method.dart';

void main() {
  group('CalculationMethod', () {
    test(
      'methodList should return correct values for each calculation method',
      () {
        final methodList = CalculationMethod.methodList();

        expect(methodList[CalculationMethod.makkah], [
          18.5,
          1.0,
          0.0,
          1.0,
          90.0,
        ]);
        expect(methodList[CalculationMethod.mwl], [18.0, 1.0, 0.0, 0.0, 17.0]);
        expect(methodList[CalculationMethod.isna], [15.0, 1.0, 0.0, 0.0, 15.0]);
        expect(methodList[CalculationMethod.karachi], [
          18.0,
          1.0,
          0.0,
          0.0,
          18.0,
        ]);
        expect(methodList[CalculationMethod.egypt], [
          19.5,
          1.0,
          0.0,
          0.0,
          17.5,
        ]);
        expect(methodList[CalculationMethod.jafari], [
          16.0,
          0.0,
          4.0,
          0.0,
          14.0,
        ]);
        expect(methodList[CalculationMethod.tehran], [
          17.7,
          0.0,
          4.5,
          0.0,
          14.0,
        ]);
        expect(methodList[CalculationMethod.custom], [
          18.0,
          1.0,
          0.0,
          0.0,
          17.0,
        ]);
      },
    );

    test('methodList should contain all calculation methods', () {
      final methodList = CalculationMethod.methodList();

      expect(methodList.keys, CalculationMethod.values.toSet());
    });

    test('methodList values should have correct length', () {
      final methodList = CalculationMethod.methodList();

      for (final values in methodList.values) {
        expect(values.length, 5);
      }
    });

    test('methodList values should contain only doubles', () {
      final methodList = CalculationMethod.methodList();

      for (final values in methodList.values) {
        for (final value in values) {
          expect(value, isA<double>());
        }
      }
    });
  });
}
