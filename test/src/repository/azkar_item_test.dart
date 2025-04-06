import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';
import 'package:muslim_data_flutter/src/data/models/language.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

import '../data/database/db_connection.dart';

void main() {
  group('AzkarItem Tests', () {
    late MuslimRepository repository;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      repository = MuslimRepository(
        dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
      );
    });

    /// Test function to verify the number of azkar items in a chapter
    Future<void> testChapterItems(Language language, int id, int total) async {
      final items = await repository.getAzkarItems(id, language);
      expect(items, isNotNull);
      expect(items.length, total);
    }

    test('should return correct number of English azkar items', () async {
      await testChapterItems(Language.en, 1, 4);
    });

    test('should return correct number of Arabic azkar items', () async {
      await testChapterItems(Language.ar, 25, 8);
    });

    test(
      'should return correct number of Central Kurdish azkar items',
      () async {
        await testChapterItems(Language.ckb, 50, 2);
      },
    );

    test(
      'should return correct number of Badini Kurdish azkar items',
      () async {
        await testChapterItems(Language.ckbBadini, 50, 2);
      },
    );

    test('should return correct number of Persian azkar items', () async {
      await testChapterItems(Language.fa, 75, 1);
    });

    test('should return correct number of Russian azkar items', () async {
      await testChapterItems(Language.ru, 100, 1);
    });
  });
}
