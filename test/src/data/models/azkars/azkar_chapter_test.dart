import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/azkars/azkar_chapter.dart';

void main() {
  group('AzkarChapter', () {
    test('should correctly compare two identical AzkarChapter objects', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 1,
        categoryId: 10,
        name: 'Morning Azkar',
      );

      expect(azkarChapter1, equals(azkarChapter2));
    });

    test('should correctly compare two different AzkarChapter objects', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 2,
        categoryId: 20,
        name: 'Evening Azkar',
      );

      expect(azkarChapter1, isNot(equals(azkarChapter2)));
    });

    test(
      'should return correct hashCode for identical AzkarChapter objects',
      () {
        const azkarChapter1 = AzkarChapter(
          id: 1,
          categoryId: 10,
          name: 'Morning Azkar',
        );
        const azkarChapter2 = AzkarChapter(
          id: 1,
          categoryId: 10,
          name: 'Morning Azkar',
        );

        expect(azkarChapter1.hashCode, equals(azkarChapter2.hashCode));
      },
    );

    test(
      'should return correct hashCode for different AzkarChapter objects',
      () {
        const azkarChapter1 = AzkarChapter(
          id: 1,
          categoryId: 10,
          name: 'Morning Azkar',
        );
        const azkarChapter2 = AzkarChapter(
          id: 2,
          categoryId: 20,
          name: 'Evening Azkar',
        );

        expect(azkarChapter1.hashCode, isNot(equals(azkarChapter2.hashCode)));
      },
    );

    test('should return correct string representation from toString()', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        name: 'Morning Azkar',
      );

      expect(
        azkarChapter.toString(),
        equals('AzkarChapter(id: 1, categoryId: 10, name: Morning Azkar)'),
      );
    });
  });
}
