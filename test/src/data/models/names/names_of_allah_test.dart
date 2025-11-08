import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/names/names_of_allah.dart';

void main() {
  group('NameOfAllah', () {
    test('should correctly compare two identical NameOfAllah objects', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      const name2 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );

      expect(name1, equals(name2));
    });

    test('should correctly identify two different NameOfAllah objects', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      const name2 = NameOfAllah(
        id: 2,
        name: 'Ar-Rahim',
        translation: 'The Most Compassionate',
        transliteration: 'Ar-Rahim',
      );

      expect(name1, isNot(equals(name2)));
    });

    test('should return true when comparing an object with itself', () {
      const name = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );

      expect(name, equals(name));
    });

    test(
      'should return false when comparing with object of different type',
      () {
        const name = NameOfAllah(
          id: 1,
          name: 'Ar-Rahman',
          translation: 'The Most Merciful',
          transliteration: 'Ar-Rahman',
        );

        String notName = 'Not a NameOfAllah';

        expect(name, isNot(equals(notName)));
      },
    );

    test('should return false when only name is different', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      const name2 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahim',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahim',
      );

      expect(name1, isNot(equals(name2)));
    });

    test('should return false when only translation is different', () {
      const name1 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      const name2 = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Compassionate',
        transliteration: 'Ar-Rahman',
      );

      expect(name1, isNot(equals(name2)));
    });

    test('should correctly generate hashCode', () {
      const name = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      final expectedHashCode = Object.hash(
        1,
        'Ar-Rahman',
        'The Most Merciful',
        'Ar-Rahman',
      );

      expect(name.hashCode, equals(expectedHashCode));
    });

    test('should correctly convert to string', () {
      const name = NameOfAllah(
        id: 1,
        name: 'Ar-Rahman',
        translation: 'The Most Merciful',
        transliteration: 'Ar-Rahman',
      );
      const expectedString =
          'NameOfAllah(id: 1, name: Ar-Rahman, translation: The Most Merciful, transliteration: Ar-Rahman)';

      expect(name.toString(), equals(expectedString));
    });
  });
}
