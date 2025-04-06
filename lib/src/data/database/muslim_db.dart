import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'muslim_db.g.dart';

final _dbVersion = 1;

@DriftDatabase()
class MuslimDb extends _$MuslimDb {
  MuslimDb._internal(super.connection);

  static MuslimDb? _instance;

  /// Factory constructor to initialize the singleton instance
  factory MuslimDb({LazyDatabase? connection}) {
    _instance ??= MuslimDb._internal(connection ?? _openConnection());
    return _instance!;
  }

  @override
  int get schemaVersion => _dbVersion;

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

      if (!await file.exists() || await _hasUpdate()) {
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

  /// Check if the database has been updated
  static Future<bool> _hasUpdate() async {
    final dbVersionFile = File(
      p.join((await getApplicationDocumentsDirectory()).path, 'db_version.txt'),
    );

    int currentVersion = 1;
    if (await dbVersionFile.exists()) {
      final versionString = await dbVersionFile.readAsString();
      currentVersion = int.tryParse(versionString) ?? 1;
    }

    if (currentVersion < _dbVersion) {
      await dbVersionFile.writeAsString(_dbVersion.toString());
      return true;
    }
    return false;
  }
}
