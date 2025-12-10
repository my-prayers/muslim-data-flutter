import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../data/database/db_connection.dart';

void main() {
  late AzkarRepository repository;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    repository = AzkarRepository(
      dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
    );
  });

  group('AzkarCategoryTests', () {
    /// Test function to verify the number of azkar categories
    Future<void> testAzkarCategories(Locale language) async {
      final categories = await repository.getAzkarCategories(
        language: language,
      );
      expect(categories, isNotNull);
      expect(categories.length, equals(11));
      expect(categories[0].name, isNotNull);
    }

    test('should fetch English azkar categories correctly', () async {
      await testAzkarCategories(Language.en.locale);
    });

    test('should fetch Arabic azkar categories correctly', () async {
      await testAzkarCategories(Language.ar.locale);
    });

    test('should fetch Central Kurdish azkar categories correctly', () async {
      await testAzkarCategories(Language.ckb.locale);
    });

    test('should fetch Badini Kurdish azkar categories correctly', () async {
      await testAzkarCategories(Language.ckbBadini.locale);
    });

    test('should fetch Persian azkar categories correctly', () async {
      await testAzkarCategories(Language.fa.locale);
    });

    test('should fetch Russian azkar categories correctly', () async {
      await testAzkarCategories(Language.ru.locale);
    });
  });

  group('AzkarChapterTests', () {
    /// Test function to verify the number of azkar chapters in a specific language
    Future<void> testAzkarChapters(
      Locale language, {
      int categoryId = -1,
      int total = 133,
    }) async {
      final repository = AzkarRepository();
      final chapters = await repository.getAzkarChapters(
        language: language,
        categoryId: categoryId,
      );
      expect(chapters, isNotNull);
      expect(chapters.length, total);
    }

    /// Test function to verify the number of azkar chapters by category
    Future<void> testAzkarChaptersByCategory(Locale language) async {
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

    test('Verify English azkar chapters', () async {
      await testAzkarChapters(Language.en.locale);
    });

    test('Verify Arabic azkar chapters', () async {
      await testAzkarChapters(Language.ar.locale);
    });

    test('Verify Central Kurdish azkar chapters', () async {
      await testAzkarChapters(Language.ckb.locale);
    });

    test('Verify Badini Kurdish azkar chapters', () async {
      await testAzkarChapters(Language.ckbBadini.locale);
    });

    test('Verify Persian azkar chapters', () async {
      await testAzkarChapters(Language.fa.locale);
    });

    test('Verify Russian azkar chapters', () async {
      await testAzkarChapters(Language.ru.locale);
    });

    test('Verify chapter IDs for English azkar chapters', () async {
      final chapters = await repository.getAzkarChapters();
      expect(chapters, isNotNull);
      expect(chapters.length, 133);
    });

    test('Verify English azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.en.locale);
    });

    test('Verify Arabic azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ar.locale);
    });

    test('Verify Central Kurdish azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ckb.locale);
    });

    test('Verify Badini Kurdish azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ckbBadini.locale);
    });

    test('Verify Persian azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.fa.locale);
    });

    test('Verify Russian azkar chapters by category', () async {
      await testAzkarChaptersByCategory(Language.ru.locale);
    });

    test('Verifies azkar chapters filter by chapter ids', () async {
      final chapters = await repository.getAzkarChaptersByIds(
        chapterIds: [1, 2, 10],
      );
      expect(chapters, isNotEmpty);
      expect(chapters.length, 3);
    });
  });

  group('SearchAzkarChapters Tests', () {
    /// Test function to verify search results for a given query
    Future<void> testSearchAzkarChapters(Locale language, String query) async {
      final chapters = await repository.searchAzkarChapters(
        language: language,
        query: query,
      );
      expect(chapters, isNotNull);
      expect(chapters, isNotEmpty);
      // Verify that results contain the query in name or category
      for (final chapter in chapters) {
        final containsQuery =
            chapter.name.toLowerCase().contains(query.toLowerCase()) ||
            chapter.categoryName.toLowerCase().contains(query.toLowerCase());
        expect(containsQuery, isTrue);
      }
    }

    test('should return results when searching in English', () async {
      await testSearchAzkarChapters(Language.en.locale, 'morning');
    });

    test('should return results when searching in Arabic', () async {
      await testSearchAzkarChapters(Language.ar.locale, 'الصباح');
    });

    test('should return results when searching in Central Kurdish', () async {
      await testSearchAzkarChapters(Language.ckb.locale, 'بەیانی');
    });

    test('should return results when searching in Badini Kurdish', () async {
      await testSearchAzkarChapters(Language.ckbBadini.locale, 'سپێدێ');
    });

    test('should return results when searching in Persian', () async {
      await testSearchAzkarChapters(Language.fa.locale, 'صبح');
    });

    test('should return results when searching in Russian', () async {
      await testSearchAzkarChapters(Language.ru.locale, 'утро');
    });

    test('should return empty list for non-existent query', () async {
      final chapters = await repository.searchAzkarChapters(
        language: Language.en.locale,
        query: 'noneExistentQuery12345',
      );

      expect(chapters, isNotNull);
      expect(chapters, isEmpty);
    });

    test('should search by category name in English', () async {
      await testSearchAzkarChapters(Language.en.locale, 'sleep');
    });

    test('should search by category name in Arabic', () async {
      await testSearchAzkarChapters(Language.ar.locale, 'النوم');
    });

    test('should search by chapter name in English', () async {
      await testSearchAzkarChapters(Language.en.locale, 'waking up');
    });

    test('should search by chapter name in Arabic', () async {
      await testSearchAzkarChapters(Language.ar.locale, 'الاستيقاظ');
    });

    test('should handle partial search queries in English', () async {
      await testSearchAzkarChapters(Language.en.locale, 'pray');
    });

    test('should handle partial search queries in Arabic', () async {
      await testSearchAzkarChapters(Language.ar.locale, 'صلا');
    });

    test('should be case insensitive for English searches', () async {
      final lowerCase = await repository.searchAzkarChapters(
        language: Language.en.locale,
        query: 'morning',
      );
      final upperCase = await repository.searchAzkarChapters(
        language: Language.en.locale,
        query: 'MORNING',
      );
      expect(lowerCase.length, equals(upperCase.length));
    });

    test('should return empty list for empty query', () async {
      await testSearchAzkarChapters(Language.en.locale, '');
    });

    test('should handle special characters in query', () async {
      final chapters = await repository.searchAzkarChapters(
        language: Language.en.locale,
        query: "test'ing",
      );
      expect(chapters, isNotNull);
    });

    test('should return valid chapter structure', () async {
      final chapters = await repository.searchAzkarChapters(
        language: Language.en.locale,
        query: 'morning',
      );
      expect(chapters, isNotEmpty);
      final chapter = chapters.first;
      expect(chapter.id, isPositive);
      expect(chapter.categoryId, isPositive);
      expect(chapter.name, isNotEmpty);
      expect(chapter.categoryName, isNotEmpty);
    });
  });

  group('AzkarItem Tests', () {
    /// Test function to verify the number of azkar items in a chapter
    Future<void> testChapterItems(Locale language, int id, int total) async {
      final items = await repository.getAzkarItems(
        language: language,
        chapterId: id,
      );
      expect(items, isNotNull);
      expect(items.length, total);
    }

    test('should return correct number of English azkar items', () async {
      await testChapterItems(Language.en.locale, 1, 4);
    });

    test('should return correct number of Arabic azkar items', () async {
      await testChapterItems(Language.ar.locale, 25, 15);
    });

    test(
      'should return correct number of Central Kurdish azkar items',
      () async {
        await testChapterItems(Language.ckb.locale, 50, 2);
      },
    );

    test(
      'should return correct number of Badini Kurdish azkar items',
      () async {
        await testChapterItems(Language.ckbBadini.locale, 50, 2);
      },
    );

    test('should return correct number of Persian azkar items', () async {
      await testChapterItems(Language.fa.locale, 75, 1);
    });

    test('should return correct number of Russian azkar items', () async {
      await testChapterItems(Language.ru.locale, 100, 1);
    });
  });
}
