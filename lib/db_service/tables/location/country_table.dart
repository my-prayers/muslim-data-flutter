import 'package:drift/drift.dart';

/// Country table class that will be used as the country table.
@DataClassName('CountryRecord')
@TableIndex(name: 'country_index', columns: {#code})
class CountryTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get continent => text()();
  TextColumn get language => text()();

  @override
  String get tableName => 'country';
}
