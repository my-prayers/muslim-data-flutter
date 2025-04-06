import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:sqlite3/sqlite3.dart';

/// This function opens a test connection to a SQLite database.
LazyDatabase openTestConnection() {
  return LazyDatabase(() async {
    // Load the pre-populated database from assets
    final blob = await rootBundle.load('assets/db/muslim_db_v2.4.0.db');
    final buffer = blob.buffer;
    final data = buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes);

    // Create a temporary file to store the asset database
    final tempFile = File('${Directory.systemTemp.path}/temp_db.db');
    await tempFile.writeAsBytes(data);

    // Open an in-memory SQLite database
    final sqliteDb = sqlite3.openInMemory();

    // Attach the temporary file-based database
    sqliteDb.execute('ATTACH DATABASE ? AS file_db', [tempFile.path]);

    // Copy all tables from the file-based database into the in-memory database, excluding reserved tables
    final tables = sqliteDb.select(
      "SELECT name FROM file_db.sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';",
    );
    for (final table in tables) {
      final tableName = table['name'] as String;
      sqliteDb.execute(
        'CREATE TABLE $tableName AS SELECT * FROM file_db.$tableName;',
      );
    }

    // Detach the file-based database
    sqliteDb.execute('DETACH DATABASE file_db;');

    // Delete the temporary file
    await tempFile.delete();

    // Use the in-memory SQLite database with Drift
    return NativeDatabase.opened(sqliteDb);
  });
}
