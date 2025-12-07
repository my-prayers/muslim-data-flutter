import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/language.dart';

void main() {
  group('Language enum tests', () {
    test('Language enum should have all expected values', () {
      expect(Language.values.length, 6);
      expect(Language.values, contains(Language.en));
      expect(Language.values, contains(Language.ar));
      expect(Language.values, contains(Language.ckb));
      expect(Language.values, contains(Language.ckbBadini));
      expect(Language.values, contains(Language.fa));
      expect(Language.values, contains(Language.ru));
    });

    test('Language.locale should return correct Locale for each enum', () {
      expect(Language.en.locale, equals(const Locale('en')));
      expect(Language.ar.locale, equals(const Locale('ar')));
      expect(Language.ckb.locale, equals(const Locale('ckb')));
      expect(
        Language.ckbBadini.locale,
        equals(
          const Locale.fromSubtags(
            languageCode: 'ckb',
            scriptCode: 'Badini',
            countryCode: 'IQ',
          ),
        ),
      );
      expect(Language.fa.locale, equals(const Locale('fa')));
      expect(Language.ru.locale, equals(const Locale('ru')));
    });
  });

  group('Language.fromLocale tests', () {
    test('should return default language (en) when locale is null', () {
      expect(Language.fromLocale(null), equals(Language.en));
    });

    test('should return exact match for simple locales', () {
      expect(Language.fromLocale(const Locale('en')), equals(Language.en));
      expect(Language.fromLocale(const Locale('ar')), equals(Language.ar));
      expect(Language.fromLocale(const Locale('ckb')), equals(Language.ckb));
      expect(Language.fromLocale(const Locale('fa')), equals(Language.fa));
      expect(Language.fromLocale(const Locale('ru')), equals(Language.ru));
    });

    test('should return exact match for ckbBadini with scriptCode', () {
      expect(
        Language.fromLocale(
          const Locale.fromSubtags(
            languageCode: 'ckb',
            scriptCode: 'Badini',
            countryCode: 'IQ',
          ),
        ),
        equals(Language.ckbBadini),
      );
    });

    test('should match by languageCode only when no exact match found', () {
      // ckb with different script/country should match ckb (not ckbBadini)
      expect(
        Language.fromLocale(const Locale.fromSubtags(languageCode: 'ckb')),
        equals(Language.ckb),
      );

      // ar with country code should match ar
      expect(
        Language.fromLocale(const Locale('ar', 'SA')),
        equals(Language.ar),
      );

      // en with country code should match en
      expect(
        Language.fromLocale(const Locale('en', 'US')),
        equals(Language.en),
      );
    });

    test('should return default language (en) for unsupported locales', () {
      expect(Language.fromLocale(const Locale('es')), equals(Language.en));
      expect(Language.fromLocale(const Locale('fr')), equals(Language.en));
      expect(Language.fromLocale(const Locale('de')), equals(Language.en));
    });

    test('should prioritize exact match over language code match', () {
      // First add ckbBadini (exact match with script), then try ckb alone
      expect(Language.fromLocale(const Locale('ckb')), equals(Language.ckb));

      expect(
        Language.fromLocale(
          const Locale.fromSubtags(
            languageCode: 'ckb',
            scriptCode: 'Badini',
            countryCode: 'IQ',
          ),
        ),
        equals(Language.ckbBadini),
      );
    });
  });

  group('Language.supportedLocales tests', () {
    test('should return list of all supported locales', () {
      final locales = Language.supportedLocales;

      expect(locales.length, equals(6));
      expect(locales, contains(const Locale('en')));
      expect(locales, contains(const Locale('ar')));
      expect(locales, contains(const Locale('ckb')));
      expect(
        locales,
        contains(
          const Locale.fromSubtags(
            languageCode: 'ckb',
            scriptCode: 'Badini',
            countryCode: 'IQ',
          ),
        ),
      );
      expect(locales, contains(const Locale('fa')));
      expect(locales, contains(const Locale('ru')));
    });

    test('should return locales in the same order as Language.values', () {
      final locales = Language.supportedLocales;
      final expectedLocales = Language.values.map((e) => e.locale).toList();

      expect(locales, equals(expectedLocales));
    });
  });
}
