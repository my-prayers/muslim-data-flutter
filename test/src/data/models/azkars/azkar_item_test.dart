import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/azkars/azkar_item.dart';

void main() {
  group('AzkarItem', () {
    test('should correctly compare two identical AzkarItem objects', () {
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
        reference: 'Hadith Reference',
      );

      expect(azkarItem1, equals(azkarItem2));
    });

    test('should correctly identify two different AzkarItem objects', () {
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

    test('should correctly calculate hashCode for identical objects', () {
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
        reference: 'Hadith Reference',
      );

      expect(azkarItem1.hashCode, equals(azkarItem2.hashCode));
    });

    test('should correctly calculate hashCode for different objects', () {
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

    test('should correctly convert AzkarItem to string', () {
      final azkarItem = AzkarItem(
        id: 1,
        chapterId: 101,
        item: 'SubhanAllah',
        translation: 'Glory be to Allah',
        reference: 'Hadith Reference',
      );

      expect(
        azkarItem.toString(),
        equals(
          'AzkarItem(id: 1, chapterId: 101, item: SubhanAllah, translation: Glory be to Allah, reference: Hadith Reference)',
        ),
      );
    });
  });
}
