import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

/// Repository for accessing location data.
class LocationRepository extends MuslimRepository {
  LocationRepository._internal({super.dbDao});

  static LocationRepository? _instance;

  factory LocationRepository({MuslimDao? dao}) {
    _instance ??= LocationRepository._internal(dbDao: dao);
    return _instance!;
  }

  /// Search for locations by the given [locationName].
  /// Returns a list of locations that match the search query.
  Future<List<Location>> searchLocations({required String locationName}) async {
    try {
      return await dbDao.searchLocations(locationName);
    } catch (e) {
      return [];
    }
  }

  /// Get the location by the given [countryCode] and [locationName].
  /// Returns the location if found, otherwise returns null.
  Future<Location?> geocoder({
    required String countryCode,
    required String locationName,
  }) async {
    try {
      return await dbDao.geocoder(countryCode, locationName);
    } catch (e) {
      return null;
    }
  }

  /// Get the location by the given [countryCode] and [locationName].
  /// Returns the location if found, otherwise returns null.
  Future<Location?> reverseGeocoder({
    required double latitude,
    required double longitude,
  }) async {
    try {
      return await dbDao.reverseGeocoder(latitude, longitude);
    } catch (e) {
      return null;
    }
  }
}
