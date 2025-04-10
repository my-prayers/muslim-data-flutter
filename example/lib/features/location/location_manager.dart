import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocationManager {
  /// Load the location from SharedPreferences.
  static Future<Location> loadLocation() async {
    final fallbackLocation = Location(
      id: 77359,
      countryName: 'Iraq',
      countryCode: 'IQ',
      name: 'Erbil',
      latitude: 36.1911,
      longitude: 44.0094,
      hasFixedPrayerTime: true,
    );

    final prefs = await SharedPreferences.getInstance();
    final locationJson = prefs.getString('location');
    if (locationJson != null) {
      final locationMap = jsonDecode(locationJson) as Map<String, dynamic>;
      final savedLocation = Location.fromJson(locationMap);
      return savedLocation;
    } else {
      return fallbackLocation;
    }
  }

  /// Save the location to SharedPreferences.
  static Future<void> saveLocation(Location location) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('location', jsonEncode(location.toJson()));
  }
}
