import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';
import 'package:muslim_data_flutter/src/data/models/language.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

/// Concrete implementation of MuslimRepository for testing purposes.
class TestMuslimRepository extends MuslimRepository {
  TestMuslimRepository({super.dbDao});
}

void main() {
  group('MuslimRepository', () {
    test(
      'should create instance with default MuslimDao when dbDao is null',
      () {
        final repository = TestMuslimRepository();

        expect(repository.dbDao, isNotNull);
        expect(repository.dbDao, isA<MuslimDao>());
      },
    );

    test('should create instance with provided MuslimDao', () {
      final customDao = MuslimDao(db: MuslimDb());
      final repository = TestMuslimRepository(dbDao: customDao);

      expect(repository.dbDao, equals(customDao));
    });

    test('should return list of supported locales', () {
      final repository = TestMuslimRepository();

      final locales = repository.supportedLocales;

      expect(locales, isNotNull);
      expect(locales, isA<List<Locale>>());
      expect(locales.length, equals(6));
      expect(locales, Language.supportedLocales);
      expect(locales, Language.values.map((lang) => lang.locale).toList());
    });

    test('should return the same supported locales on multiple calls', () {
      final repository = TestMuslimRepository();

      final locales1 = repository.supportedLocales;
      final locales2 = repository.supportedLocales;

      expect(locales1.length, equals(locales2.length));
      for (var i = 0; i < locales1.length; i++) {
        expect(locales1[i], equals(locales2[i]));
      }
    });
  });
}
