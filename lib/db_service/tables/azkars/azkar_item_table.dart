import 'package:drift/drift.dart';

/// Azkar item table class that will be used as azkar_item table.
@DataClassName('AzkarItemRecord')
class AzkarItemTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get chapterId => integer().named('chapter_id')();
  TextColumn get item => text()();

  @override
  String get tableName => 'azkar_item';
}

/// Azkar item translation table class that will be used as azkar_item_translation table.
@DataClassName('AzkarItemTranslationRecord')
class AzkarItemTranslationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get itemId => integer().named('item_id')();
  TextColumn get language => text()();
  TextColumn get itemTranslation => text().named('item_translation')();

  @override
  String get tableName => 'azkar_item_translation';
}

/// Azkar reference table class that will be used as azkar_reference table.
@DataClassName('AzkarReferenceRecord')
class AzkarReferenceTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get itemId => integer().named('item_id')();

  @override
  String get tableName => 'azkar_reference';
}

/// Azkar reference translation table class that will be used as azkar_reference_translation table.
@DataClassName('AzkarReferenceTranslationRecord')
class AzkarReferenceTranslationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get referenceId => integer().named('reference_id')();
  TextColumn get language => text()();
  TextColumn get reference => text()();

  @override
  String get tableName => 'azkar_reference_translation';
}
