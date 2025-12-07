import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/utils/locale_utils.dart';

void main() {
  group('LocaleUtils Extension', () {
    test('toCode should convert Locale with language code only', () {
      const locale = Locale('en');
      expect(locale.toCode(), 'en');
    });

    test('toCode should convert Locale with language and script code', () {
      const locale = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      expect(locale.toCode(), 'zh_Hans');
    });

    test('toCode should convert Locale with language and country code', () {
      const locale = Locale('en', 'US');
      expect(locale.toCode(), 'en');
    });

    test(
      'toCode should convert Locale with language, script, and country code',
      () {
        const locale = Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hans',
          countryCode: 'CN',
        );
        expect(locale.toCode(), 'zh_Hans');
      },
    );

    test('toCode should handle Arabic locale', () {
      const locale = Locale('ar');
      expect(locale.toCode(), 'ar');
    });

    test('toCode should handle Kurdish locale with script code', () {
      const locale = Locale.fromSubtags(
        languageCode: 'ckb',
        scriptCode: 'Badini',
      );
      expect(locale.toCode(), 'ckb_Badini');
    });
  });
}
