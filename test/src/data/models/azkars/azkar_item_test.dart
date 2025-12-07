import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/azkars/azkar_item.dart';

void main() {
  group('AzkarItem - Equality', () {
    test('should correctly compare two identical AzkarItem objects', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        count: '33',
        topNote: 'Top note',
        bottomNote: 'Bottom note',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        count: '33',
        topNote: 'Top note',
        bottomNote: 'Bottom note',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, equals(azkarItem2));
    });

    test('should correctly compare two different AzkarItem objects', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 2,
        chapterId: 102,
        item: 'Alhamdulillah',
        translation: 'Praise be to Allah',
        reference: 'Another Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return true when comparing an object with itself', () {
      final azkarItem = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem, equals(azkarItem));
    });

    test(
      'should return false when comparing with object of different type',
      () {
        final azkarItem = AzkarItem(
          id: 1,
          chapterId: 101,
          item: 'SubhanAllah',
          translation: 'Glory be to Allah',
          reference: 'Hadith Reference',
        );
        String notAzkarItem = 'Not an AzkarItem';

        expect(azkarItem, isNot(equals(notAzkarItem)));
      },
    );

    test('should return false when only id is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 2,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only chapterId is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 102,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only item is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'Alhamdulillah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only transliteration is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhana Allah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only count is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        count: '33',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        count: '100',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only topNote is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        topNote: 'Top note 1',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        topNote: 'Top note 2',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only bottomNote is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        bottomNote: 'Bottom note 1',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        bottomNote: 'Bottom note 2',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only translation is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Praise be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });

    test('should return false when only reference is different', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Another Reference',
      );

      expect(azkarItem1, isNot(equals(azkarItem2)));
    });
  });

  group('AzkarItem - HashCode', () {
    test('should return correct hashCode for identical AzkarItem objects', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        count: '33',
        topNote: 'Top note',
        bottomNote: 'Bottom note',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        count: '33',
        topNote: 'Top note',
        bottomNote: 'Bottom note',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(azkarItem1.hashCode, equals(azkarItem2.hashCode));
    });

    test('should return correct hashCode for different AzkarItem objects', () {
      final azkarItem1 = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      final azkarItem2 = AzkarItem(
        id: 2,
        chapterId: 102,
        item: 'Alhamdulillah',
        translation: 'Praise be to Allah',
        reference: 'Another Reference',
      );

      expect(azkarItem1.hashCode, isNot(equals(azkarItem2.hashCode)));
    });
  });

  group('AzkarItem - ToString', () {
    test('should return correct string representation from toString()', () {
      final azkarItem = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        transliteration: 'Subhan Allah',
        count: '33',
        topNote: 'Top note',
        bottomNote: 'Bottom note',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(
        azkarItem.toString(),
        equals(
          'AzkarItem(id: 1, chapterId: 101, item: SubhanAllah, transliteration: Subhan Allah, count: 33, topNote: Top note, bottomNote: Bottom note, translation: Glory be to Allah, reference: Hadith Reference)',
        ),
      );
    });

    test(
      'should return correct string with null optional fields from toString()',
      () {
        final azkarItem = AzkarItem(
          id: 1,
          chapterId: 101,
          reference: 'Hadith Reference',
        );

        expect(
          azkarItem.toString(),
          equals(
            'AzkarItem(id: 1, chapterId: 101, item: null, transliteration: null, count: null, topNote: null, bottomNote: null, translation: null, reference: Hadith Reference)',
          ),
        );
      },
    );
  });
}
