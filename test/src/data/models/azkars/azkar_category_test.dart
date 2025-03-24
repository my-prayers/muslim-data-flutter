import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/azkars/azkar_category.dart';

void main() {
  group('AzkarCategory', () {
    test('should correctly compare two identical AzkarCategory objects', () {
      const azkarCategory1 = AzkarCategory(id: 1, name: 'Morning');
      const azkarCategory2 = AzkarCategory(id: 1, name: 'Morning');

      expect(azkarCategory1, equals(azkarCategory2));
    });

    test('should correctly compare two different AzkarCategory objects', () {
      const azkarCategory1 = AzkarCategory(id: 1, name: 'Morning');
      const azkarCategory2 = AzkarCategory(id: 2, name: 'Evening');

      expect(azkarCategory1, isNot(equals(azkarCategory2)));
    });

    test(
      'should return correct hashCode for identical AzkarCategory objects',
      () {
        const azkarCategory1 = AzkarCategory(id: 1, name: 'Morning');
        const azkarCategory2 = AzkarCategory(id: 1, name: 'Morning');

        expect(azkarCategory1.hashCode, equals(azkarCategory2.hashCode));
      },
    );

    test(
      'should return different hashCode for different AzkarCategory objects',
      () {
        const azkarCategory1 = AzkarCategory(id: 1, name: 'Morning');
        const azkarCategory2 = AzkarCategory(id: 2, name: 'Evening');

        expect(azkarCategory1.hashCode, isNot(equals(azkarCategory2.hashCode)));
      },
    );

    test('should return correct string representation', () {
      const azkarCategory = AzkarCategory(id: 1, name: 'Morning');

      expect(
        azkarCategory.toString(),
        equals('AzkarCategory(id: 1, name: Morning)'),
      );
    });
  });
}
