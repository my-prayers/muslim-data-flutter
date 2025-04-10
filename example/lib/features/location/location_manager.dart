import 'dart:async'; // Add this import
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocationManager {
  static final _locationStreamController =
      StreamController<Location>.broadcast();

  /// Stream to listen for location changes.
  static Stream<Location> get locationStream =>
      _locationStreamController.stream;

  /// Load the location from SharedPreferences.
  static Future<void> loadLocation() async {
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
      _locationStreamController.add(savedLocation);
    } else {
      return _locationStreamController.add(fallbackLocation);
    }
  }

  /// Save the location to SharedPreferences and notify listeners.
  static Future<void> saveLocation(Location location) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('location', jsonEncode(location.toJson()));
    _locationStreamController.add(location); // Notify listeners
  }

  /// Dispose the stream controller.
  static void dispose() {
    _locationStreamController.close();
  }
}
