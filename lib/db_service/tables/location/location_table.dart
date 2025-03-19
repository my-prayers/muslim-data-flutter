import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/tables/location/country_table.dart';

/// Location table class that will be used as the location table.
@DataClassName('LocationRecord')
@TableIndex(name: 'location_country_id_index', columns: {#countryId})
@TableIndex(
  name: 'location_prayer_dependent_id_index',
  columns: {#prayerDependentId},
)
@TableIndex(name: 'location_name_index', columns: {#name})
@TableIndex(name: 'location_lat_long_index', columns: {#latitude, #longitude})
class LocationTable extends Table {
  IntColumn get id => integer().named('_id').autoIncrement()();
  IntColumn get countryId => integer().references(CountryTable, #id)();
  TextColumn get name => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  BoolColumn get hasFixedPrayerTime =>
      boolean().withDefault(const Constant(false))();
  IntColumn get prayerDependentId =>
      integer().nullable().references(LocationTable, #id)();

  @override
  String get tableName => 'location';
}
