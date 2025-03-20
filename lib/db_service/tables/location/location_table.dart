import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/tables/location/country_table.dart';

/// Location table class that will be used as the location table.
@DataClassName('LocationRecord')
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
