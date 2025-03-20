import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/app_database.dart';
import 'package:muslim_data_flutter/models/location/location.dart';

/// A service class responsible for handling database operations.
class DbService {
  final AppDatabase _db;

  DbService(this._db);

  /// Search for locations in the database by the given [locationName].
  Future<List<Location>> searchLocations(String locationName) async {
    final dbLocations =
        await _db.managers.locationTable
            .withReferences((prefetch) => prefetch(countryId: true))
            .filter((f) => f.name.contains('%$locationName%'))
            .get();

    return dbLocations
        .map(
          (e) => Location(
            id: e.$1.id,
            name: e.$1.name,
            latitude: e.$1.latitude,
            longitude: e.$1.longitude,
            countryCode: e.$2.countryId.prefetchedData?.first.code ?? '',
            countryName: e.$2.countryId.prefetchedData?.first.name ?? '',
            hasFixedPrayerTime: e.$1.hasFixedPrayerTime,
          ),
        )
        .toList();
  }

  /// Get the location by the given [countryCode] and [locationName].
  Future<Location?> geocoder(String countryCode, String locationName) async {
    return await _db
        .customSelect(_geocoderQuery(countryCode, locationName))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
          );
        })
        .getSingleOrNull();
  }

  /// Query to get the location by the given [countryCode] and [locationName].
  String _geocoderQuery(String countryCode, String locationName) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "WHERE country.code='$countryCode'  COLLATE NOCASE "
        "AND location.name='$locationName' COLLATE NOCASE";
  }

  /// Get the location by the given [latitude] and [longitude].
  Future<Location?> reverseGeocoder(double latitude, double longitude) async {
    return await _db
        .customSelect(_reverseGeocoderQuery(latitude, longitude))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
          );
        })
        .getSingleOrNull();
  }

  /// Query to get the location by the given [latitude] and [longitude].
  String _reverseGeocoderQuery(double latitude, double longitude) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "ORDER BY abs(latitude - $latitude) + abs(longitude - $longitude) "
        "LIMIT 1";
  }

  /// Get prayer times for the specified user's location and date in the database.
  Future<PrayerTimeRecord?> getPrayerTimes(int locationId, String date) {
    return _db.managers.prayerTimeTable
        .filter((f) => f.locationId.id(locationId) & f.date.equals(date))
        .getSingleOrNull();
  }
}
