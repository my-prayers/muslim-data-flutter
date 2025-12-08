import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';

// Important Note: Error tests should be in a separate file to avoid interference with other tests.
// This is because we used singleton pattern for database access in MuslimDao. If we mock the DAO in
// one test file, it may affect other tests that rely on the actual database.

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('AzkarRepository Error Handling', () {
    test('should return empty list when getAzkarCategories fails', () async {
      final repository = AzkarRepository(dao: _FailingDaoWrapper());
      final categories = await repository.getAzkarCategories();
      expect(categories, isEmpty);
    });

    test('should return empty list when getAzkarChapters fails', () async {
      final repository = AzkarRepository(dao: _FailingDaoWrapper());
      final chapters = await repository.getAzkarChapters();
      expect(chapters, isEmpty);
    });

    test('should return empty list when getAzkarChaptersByIds fails', () async {
      final repository = AzkarRepository(dao: _FailingDaoWrapper());
      final chapters = await repository.getAzkarChaptersByIds(
        chapterIds: [1, 2, 3],
      );
      expect(chapters, isEmpty);
    });

    test('should return empty list when getAzkarItems fails', () async {
      final repository = AzkarRepository(dao: _FailingDaoWrapper());
      final items = await repository.getAzkarItems(chapterId: 1);
      expect(items, isEmpty);
    });
  });
}

/// Mock DAO that throws exceptions for testing error handling
class _FailingDaoWrapper implements MuslimDao {
  @override
  Future<List<AzkarCategory>> getAzkarCategories(Language language) async {
    throw Exception('Database error');
  }

  @override
  Future<List<AzkarChapter>> getAzkarChapters(
    Language language,
    int categoryId,
  ) async {
    throw Exception('Database error');
  }

  @override
  Future<List<AzkarChapter>> getAzkarChaptersByIds(
    Language language,
    List<int> chapterIds,
  ) async {
    throw Exception('Database error');
  }

  @override
  Future<List<AzkarItem>> getAzkarItems(
    Language language,
    int chapterId,
  ) async {
    throw Exception('Database error');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
