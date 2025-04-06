import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../data/database/db_connection.dart';

void main() {
  group('AzkarCategoryTests', () {
    late MuslimRepository repository;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      repository = MuslimRepository(
        dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
      );
    });

    /// Test function to verify the number of azkar categories
    Future<void> testAzkarCategories(Language language) async {
      final categories = await repository.getAzkarCategories(language);
      expect(categories, isNotNull);
      expect(categories.length, equals(11));
      expect(categories[0].name, isNotNull);
    }

    test('should fetch English azkar categories correctly', () async {
      await testAzkarCategories(Language.en);
    });

    test('should fetch Arabic azkar categories correctly', () async {
      await testAzkarCategories(Language.ar);
    });

    test('should fetch Central Kurdish azkar categories correctly', () async {
      await testAzkarCategories(Language.ckb);
    });

    test('should fetch Badini Kurdish azkar categories correctly', () async {
      await testAzkarCategories(Language.ckbBadini);
    });

    test('should fetch Persian azkar categories correctly', () async {
      await testAzkarCategories(Language.fa);
    });

    test('should fetch Russian azkar categories correctly', () async {
      await testAzkarCategories(Language.ru);
    });
  });
}
