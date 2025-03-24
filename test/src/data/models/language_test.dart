import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/language.dart';

void main() {
  group('Language enum tests', () {
    test('Language values should match their string representation', () {
      expect(Language.en.value, 'en');
      expect(Language.ar.value, 'ar');
      expect(Language.ckb.value, 'ckb');
      expect(Language.ckbBadini.value, 'ckb_BADINI');
      expect(Language.fa.value, 'fa');
      expect(Language.ru.value, 'ru');
    });

    test('Language enum should have all expected values', () {
      expect(Language.values.length, 6);
      expect(Language.values, contains(Language.en));
      expect(Language.values, contains(Language.ar));
      expect(Language.values, contains(Language.ckb));
      expect(Language.values, contains(Language.ckbBadini));
      expect(Language.values, contains(Language.fa));
      expect(Language.values, contains(Language.ru));
    });

    test('Language enum should not contain unexpected values', () {
      expect(
        Language.values,
        isNot(contains('es')),
      ); // Example: Spanish not included
    });

    test('Language.value should return correct string for each enum', () {
      for (var language in Language.values) {
        expect(language.value, isA<String>());
        expect(language.value.isNotEmpty, true);
      }
    });
  });
}
