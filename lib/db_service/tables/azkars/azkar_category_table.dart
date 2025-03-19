import 'package:drift/drift.dart';

/// Azkar category table class that will be used as azkar_category table.
@DataClassName('AzkarCategoryRecord')
class AzkarCategoryTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();

  @override
  String get tableName => 'azkar_category';
}

/// Azkar category translation table class that will be used as azkar_category_translation table.
@DataClassName('AzkarCategoryTranslationRecord')
class AzkarCategoryTranslationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get categoryId =>
      integer().named('category_id').references(AzkarCategoryTable, #id)();
  TextColumn get language => text()();
  TextColumn get categoryName => text().named('category_name')();

  @override
  String get tableName => 'azkar_category_translation';
}
