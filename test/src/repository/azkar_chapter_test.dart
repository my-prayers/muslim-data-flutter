import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../data/database/db_connection.dart';

void main() {
  late MuslimRepository repository;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    repository = MuslimRepository(
      dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
    );
  });

  group('AzkarChapterTests', () {
    test('Verify English azkar chapters', () async {
      await testAzkarChapters(Language.en);
    });

    test('Verify Arabic azkar chapters', () async {
      await testAzkarChapters(Language.ar);
    });

    test('Verify Central Kurdish azkar chapters', () async {
      await testAzkarChapters(Language.ckb);
    });

    test('Verify Badini Kurdish azkar chapters', () async {
      await testAzkarChapters(Language.ckbBadini);
    });

    test('Verify Persian azkar chapters', () async {
      await testAzkarChapters(Language.fa);
    });

    test('Verify Russian azkar chapters', () async {
      await testAzkarChapters(Language.ru);
    });

    test('Verify chapter IDs for English azkar chapters', () async {
      final chapters = await repository.getAzkarChapters(Language.en);
      expect(chapters, isNotNull);
      expect(chapters.length, 133);
    });

    test('Verify English azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.en);
    });

    test('Verify Arabic azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ar);
    });

    test('Verify Central Kurdish azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ckb);
    });

    test('Verify Badini Kurdish azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ckbBadini);
    });

    test('Verify Persian azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.fa);
    });

    test('Verify Russian azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ru);
    });
  });
}

/// Test function to verify the number of azkar chapters in a specific language
Future<void> testAzkarChapters(
  Language language, {
  int categoryId = -1,
  int total = 133,
}) async {
  final repository = MuslimRepository();
  final chapters = await repository.getAzkarChapters(language, categoryId);
  expect(chapters, isNotNull);
  expect(chapters.length, total);
}

/// Test function to verify the number of azkar chapters by category
Future<void> testAzkarChaptersByCategory(Language language) async {
  final testCases = {
    1: 7,
    2: 14,
    3: 7,
    4: 15,
    5: 11,
    6: 19,
    7: 9,
    8: 8,
    9: 20,
    10: 10,
    11: 13,
  };

  for (final entry in testCases.entries) {
    await testAzkarChapters(
      language,
      categoryId: entry.key,
      total: entry.value,
    );
  }
}
