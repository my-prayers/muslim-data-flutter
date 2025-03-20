import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/tables/location/location_table.dart';

/// Prayer time table class that will be used as the prayer_time table.
@DataClassName('PrayerTimeRecord')
class PrayerTimeTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get locationId =>
      integer().named('location_id').references(LocationTable, #id)();
  TextColumn get date => text()();
  TextColumn get fajr => text()();
  TextColumn get sunrise => text()();
  TextColumn get dhuhr => text()();
  TextColumn get asr => text()();
  TextColumn get maghrib => text()();
  TextColumn get isha => text()();

  @override
  String get tableName => 'prayer_time';
}
