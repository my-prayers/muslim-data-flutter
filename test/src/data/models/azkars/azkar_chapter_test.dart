import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/azkars/azkar_chapter.dart';

void main() {
  group('AzkarChapter', () {
    test('should correctly compare two identical AzkarChapter objects', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      expect(azkarChapter1, equals(azkarChapter2));
    });

    test('should correctly compare two different AzkarChapter objects', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 2,
        categoryId: 20,
        categoryName: 'Evening',
        name: 'Evening Azkar',
      );

      expect(azkarChapter1, isNot(equals(azkarChapter2)));
    });

    test('should return true when comparing an object with itself', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      expect(azkarChapter, equals(azkarChapter));
    });

    test(
      'should return false when comparing with object of different type',
      () {
        const azkarChapter = AzkarChapter(
          id: 1,
          categoryId: 10,
          categoryName: 'Morning',
          name: 'Morning Azkar',
        );
        String notAzkarChapter = 'Not an AzkarChapter';

        expect(azkarChapter, isNot(equals(notAzkarChapter)));
      },
    );

    test('should return false when only categoryId is different', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 1,
        categoryId: 20,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      expect(azkarChapter1, isNot(equals(azkarChapter2)));
    });

    test('should return false when only name is different', () {
      const azkarChapter1 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );
      const azkarChapter2 = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
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
          categoryName: 'Morning',
          name: 'Morning Azkar',
        );
        const azkarChapter2 = AzkarChapter(
          id: 1,
          categoryId: 10,
          categoryName: 'Morning',
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
          categoryName: 'Morning',
          name: 'Morning Azkar',
        );
        const azkarChapter2 = AzkarChapter(
          id: 2,
          categoryId: 20,
          categoryName: 'Evening',
          name: 'Evening Azkar',
        );

        expect(azkarChapter1.hashCode, isNot(equals(azkarChapter2.hashCode)));
      },
    );

    test('should return correct string representation from toString()', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      expect(
        azkarChapter.toString(),
        equals('AzkarChapter(id: 1, categoryId: 10, name: Morning Azkar)'),
      );
    });

    test('should create a copy with updated id using copyWith', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      final copied = azkarChapter.copyWith(id: 2);

      expect(copied.id, equals(2));
      expect(copied.categoryId, equals(10));
      expect(copied.categoryName, equals('Morning'));
      expect(copied.name, equals('Morning Azkar'));
    });

    test('should create a copy with updated categoryId using copyWith', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      final copied = azkarChapter.copyWith(categoryId: 20);

      expect(copied.id, equals(1));
      expect(copied.categoryId, equals(20));
      expect(copied.categoryName, equals('Morning'));
      expect(copied.name, equals('Morning Azkar'));
    });

    test('should create a copy with updated categoryName using copyWith', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      final copied = azkarChapter.copyWith(categoryName: 'Evening');

      expect(copied.id, equals(1));
      expect(copied.categoryId, equals(10));
      expect(copied.categoryName, equals('Evening'));
      expect(copied.name, equals('Morning Azkar'));
    });

    test('should create a copy with updated name using copyWith', () {
      const azkarChapter = AzkarChapter(
        id: 1,
        categoryId: 10,
        categoryName: 'Morning',
        name: 'Morning Azkar',
      );

      final copied = azkarChapter.copyWith(name: 'Evening Azkar');

      expect(copied.id, equals(1));
      expect(copied.categoryId, equals(10));
      expect(copied.categoryName, equals('Morning'));
      expect(copied.name, equals('Evening Azkar'));
    });

    test(
      'should create a copy with multiple fields updated using copyWith',
      () {
        const azkarChapter = AzkarChapter(
          id: 1,
          categoryId: 10,
          categoryName: 'Morning',
          name: 'Morning Azkar',
        );

        final copied = azkarChapter.copyWith(
          id: 2,
          categoryId: 20,
          categoryName: 'Evening',
          name: 'Evening Azkar',
        );

        expect(copied.id, equals(2));
        expect(copied.categoryId, equals(20));
        expect(copied.categoryName, equals('Evening'));
        expect(copied.name, equals('Evening Azkar'));
      },
    );

    test(
      'should create identical copy when no parameters provided to copyWith',
      () {
        const azkarChapter = AzkarChapter(
          id: 1,
          categoryId: 10,
          categoryName: 'Morning',
          name: 'Morning Azkar',
        );

        final copied = azkarChapter.copyWith();

        expect(copied.id, equals(azkarChapter.id));
        expect(copied.categoryId, equals(azkarChapter.categoryId));
        expect(copied.categoryName, equals(azkarChapter.categoryName));
        expect(copied.name, equals(azkarChapter.name));
        expect(copied, equals(azkarChapter));
      },
    );
  });
}
