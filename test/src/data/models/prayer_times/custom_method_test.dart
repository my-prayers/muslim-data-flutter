import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/custom_method.dart';

void main() {
  group('CustomMethod Constructor', () {
    test('Constructor should create instance with default values', () {
      const customMethod = CustomMethod();

      expect(customMethod.fajrAngle, 18.0);
      expect(customMethod.ishaAngle, 17.0);
    });

    test('Constructor should create instance with custom values', () {
      const customMethod = CustomMethod(fajrAngle: 15.0, ishaAngle: 14.0);

      expect(customMethod.fajrAngle, 15.0);
      expect(customMethod.ishaAngle, 14.0);
    });

    test('CustomMethod should work with different angle values', () {
      const customMethod1 = CustomMethod(fajrAngle: 12.0, ishaAngle: 12.0);
      const customMethod2 = CustomMethod(fajrAngle: 20.0, ishaAngle: 20.0);

      expect(customMethod1.fajrAngle, 12.0);
      expect(customMethod1.ishaAngle, 12.0);
      expect(customMethod2.fajrAngle, 20.0);
      expect(customMethod2.ishaAngle, 20.0);
    });

    test(
      'CustomMethod with only fajrAngle specified should use default ishaAngle',
      () {
        const customMethod = CustomMethod(fajrAngle: 16.0);

        expect(customMethod.fajrAngle, 16.0);
        expect(customMethod.ishaAngle, 17.0);
      },
    );

    test(
      'CustomMethod with only ishaAngle specified should use default fajrAngle',
      () {
        const customMethod = CustomMethod(ishaAngle: 16.0);

        expect(customMethod.fajrAngle, 18.0);
        expect(customMethod.ishaAngle, 16.0);
      },
    );
  });

  group('CustomMethod angles getter', () {
    test('angles getter should return correct list of angles', () {
      const customMethod = CustomMethod(fajrAngle: 16.0, ishaAngle: 15.0);

      expect(customMethod.angles, [16.0, 1.0, 0.0, 0.0, 15.0]);
    });

    test('angles getter should return list with correct length', () {
      const customMethod = CustomMethod();

      expect(customMethod.angles.length, 5);
    });

    test('angles getter should include fajrAngle at first position', () {
      const customMethod = CustomMethod(fajrAngle: 19.5);

      expect(customMethod.angles[0], 19.5);
    });

    test('angles getter should include ishaAngle at last position', () {
      const customMethod = CustomMethod(ishaAngle: 18.5);

      expect(customMethod.angles[4], 18.5);
    });
  });

  group('CustomMethod equality operator', () {
    test('Equality operator should return true for identical objects', () {
      const customMethod1 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const customMethod2 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);

      expect(customMethod1, equals(customMethod2));
    });

    test('Equality operator should return true for same instance', () {
      const customMethod = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);

      expect(customMethod, equals(customMethod));
    });

    test('Equality operator should return false for different fajrAngle', () {
      const customMethod1 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const customMethod2 = CustomMethod(fajrAngle: 19.0, ishaAngle: 17.0);

      expect(customMethod1, isNot(equals(customMethod2)));
    });

    test('Equality operator should return false for different ishaAngle', () {
      const customMethod1 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const customMethod2 = CustomMethod(fajrAngle: 18.0, ishaAngle: 18.0);

      expect(customMethod1, isNot(equals(customMethod2)));
    });

    test('Equality operator should return false for different types', () {
      const customMethod = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const otherObject = 'not a CustomMethod';

      expect(customMethod, isNot(equals(otherObject)));
    });
  });

  group('CustomMethod hashCode', () {
    test('hashCode should be consistent for identical objects', () {
      const customMethod1 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const customMethod2 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);

      expect(customMethod1.hashCode, equals(customMethod2.hashCode));
    });

    test('hashCode should be different for different objects', () {
      const customMethod1 = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);
      const customMethod2 = CustomMethod(fajrAngle: 19.0, ishaAngle: 18.0);

      expect(customMethod1.hashCode, isNot(equals(customMethod2.hashCode)));
    });
  });

  group('CustomMethod toString', () {
    test('toString should return a properly formatted string', () {
      const customMethod = CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0);

      expect(
        customMethod.toString(),
        equals('CustomMethod(fajrAngle: 18.0, ishaAngle: 17.0)'),
      );
    });

    test('toString should reflect custom values', () {
      const customMethod = CustomMethod(fajrAngle: 15.5, ishaAngle: 14.5);

      expect(
        customMethod.toString(),
        equals('CustomMethod(fajrAngle: 15.5, ishaAngle: 14.5)'),
      );
    });
  });
}
