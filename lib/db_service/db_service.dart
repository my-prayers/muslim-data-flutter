import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/app_database.dart';

/// A service class responsible for handling database operations.
class DbService {
  final AppDatabase _db;

  DbService(this._db);

  /// Get prayer times for the specified user's location and date in the database.
  Future<PrayerTimeRecord?> getPrayerTimes(int locationId, String date) {
    return _db.managers.prayerTimeTable
        .filter((f) => f.locationId.id(locationId) & f.date.equals(date))
        .getSingleOrNull();
  }
}
