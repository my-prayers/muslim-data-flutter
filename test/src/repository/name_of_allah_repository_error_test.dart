import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';

// Important Note: Error tests should be in a separate file to avoid interference with other tests.
// This is because we used singleton pattern for database access in MuslimDao. If we mock the DAO in
// one test file, it may affect other tests that rely on the actual database.

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('NameOfAllahRepository Error Handling', () {
    test('should return empty list when getNames fails', () async {
      final repository = NameOfAllahRepository(dao: _FailingDaoWrapper());
      final names = await repository.getNames();
      expect(names, isEmpty);
    });
  });
}

/// Mock DAO that throws exceptions for testing error handling
class _FailingDaoWrapper implements MuslimDao {
  @override
  Future<List<NameOfAllah>> getNames(Language language) async {
    throw Exception('Database error');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
