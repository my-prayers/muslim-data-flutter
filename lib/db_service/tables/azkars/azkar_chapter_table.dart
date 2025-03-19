import 'package:drift/drift.dart';

/// Azkar chapter table class that will be used as azkar_chapter table.
@DataClassName('AzkarChapterRecord')
class AzkarChapterTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get categoryId => integer()();

  @override
  String get tableName => 'azkar_chapter';
}

/// Azkar chapter translation table class that will be used as azkar_chapter_translation table.
@DataClassName('AzkarChapterTranslationRecord')
class AzkarChapterTranslationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get chapterId => integer().references(AzkarChapterTable, #id)();
  TextColumn get language => text()();
  TextColumn get chapterName => text()();

  @override
  String get tableName => 'azkar_chapter_translation';
}
