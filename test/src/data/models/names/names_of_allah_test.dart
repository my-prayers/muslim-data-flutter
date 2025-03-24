import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/names/names_of_allah.dart';

void main() {
  group('NameOfAllah', () {
    test('should correctly compare two identical NameOfAllah objects', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
      );
      const name2 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
      );

      expect(name1, equals(name2));
    });

    test('should correctly identify two different NameOfAllah objects', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
      );
      const name2 = NameOfAllah(
        id: 2,
        name: 'Ar-Rahim',
        translation: 'The Most Compassionate',
      );

      expect(name1, isNot(equals(name2)));
    });

    test('should correctly generate hashCode', () {
      const name = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
      );
      final expectedHashCode = Object.hash(1, 'Ar-Rahman', 'The Most Merciful');

      expect(name.hashCode, equals(expectedHashCode));
    });

    test('should correctly convert to string', () {
      const name = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
      );
      const expectedString =
          'NameOfAllah(id: 1, name: Ar-Rahman, translation: The Most Merciful)';

      expect(name.toString(), equals(expectedString));
    });
  });
}
