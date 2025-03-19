import 'package:drift/drift.dart';

/// Name table class that will be used as the name table.
@DataClassName('NameRecord')
class NameTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  TextColumn get name => text()();

  @override
  String get tableName => 'name';
}

/// Name translation table class that will be used as the name_translation table.
@DataClassName('NameTranslationRecord')
class NameTranslationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get nameId => integer().named('name_id')();
  TextColumn get language => text()();
  TextColumn get name => text()();

  @override
  String get tableName => 'name_translation';
}
