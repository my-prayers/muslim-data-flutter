import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../data/database/db_connection.dart';

void main() {
  late NameOfAllahRepository repository;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    repository = NameOfAllahRepository(
      dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
    );
  });

  Future<void> testNames(Locale language) async {
    final names = await repository.getNames(language: language);
    expect(names, isNotNull);
    expect(names, isNotEmpty);
    expect(names.length, 99);
  }

  test('Verify English names of Allah are correct', () async {
    await testNames(Language.en.locale);
  });

  test('Verify Arabic names of Allah are correct', () async {
    await testNames(Language.ar.locale);
  });

  test('Verify Central Kurdish names of Allah are correct', () async {
    await testNames(Language.ckb.locale);
  });

  test('Verify Central Kurdish (Badini) names of Allah are correct', () async {
    await testNames(Language.ckbBadini.locale);
  });

  test('Verify Persian names of Allah are correct', () async {
    await testNames(Language.fa.locale);
  });

  test('Verify Russian names of Allah are correct', () async {
    await testNames(Language.ru.locale);
  });
}
