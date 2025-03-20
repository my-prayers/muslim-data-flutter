import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:muslim_data_flutter/db_service/tables/azkars/azkar_category_table.dart';
import 'package:muslim_data_flutter/db_service/tables/azkars/azkar_chapter_table.dart';
import 'package:muslim_data_flutter/db_service/tables/azkars/azkar_item_table.dart';
import 'package:muslim_data_flutter/db_service/tables/location/country_table.dart';
import 'package:muslim_data_flutter/db_service/tables/location/location_table.dart';
import 'package:muslim_data_flutter/db_service/tables/names/name_table.dart';
import 'package:muslim_data_flutter/db_service/tables/prayer_times/prayer_time_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AzkarCategoryTable,
    AzkarCategoryTranslationTable,
    AzkarChapterTable,
    AzkarChapterTranslationTable,
    AzkarItemTable,
    AzkarItemTranslationTable,
    AzkarReferenceTable,
    AzkarReferenceTranslationTable,
    CountryTable,
    LocationTable,
    NameTable,
    NameTranslationTable,
    PrayerTimeTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      // do nothing...
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// Open the database connection
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'muslim_data_flutter.db'));

      if (!await file.exists()) {
        // Extract the pre-populated database file from assets
        final blob = await rootBundle.load(
          'packages/muslim_data_flutter/assets/db/muslim_db_v2.4.0.db',
        );
        final buffer = blob.buffer;
        await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes),
        );
      }

      // Also work around limitations on old Android versions
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      // Make sqlite3 pick a more suitable location for temporary files - the
      // one from the system may be inaccessible due to sandboxing.
      final cachebase = (await getTemporaryDirectory()).path;
      // We can't access /tmp on Android, which sqlite3 would try by default.
      // Explicitly tell it about the correct temporary directory.
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }
}
