import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/location/location.dart';

void main() {
  group('Location Model Tests', () {
    test('Equality operator should return true for identical objects', () {
      const location1 = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      const location2 = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      expect(location1, equals(location2));
    });

    test('Equality operator should return false for different objects', () {
      const location1 = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      const location2 = Location(
        id: 2,
        name: 'Mosque B',
        latitude: 40.7128,
        longitude: -74.0060,
        countryCode: 'US',
        countryName: 'United States',
        hasFixedPrayerTime: false,
        prayerDependentId: null,
      );

      expect(location1, isNot(equals(location2)));
    });

    test('hashCode should be consistent for identical objects', () {
      const location1 = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      const location2 = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      expect(location1.hashCode, equals(location2.hashCode));
    });

    test('toString should return a properly formatted string', () {
      const location = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      expect(
        location.toString(),
        equals(
          'Location(id: 1, name: Mosque A, latitude: 35.6895, longitude: 139.6917, countryCode: JP, countryName: Japan, hasFixedPrayerTime: true, prayerDependentId: 10)',
        ),
      );
    });

    test(
      'Location with null prayerDependentId should still work correctly',
      () {
        const location = Location(
          id: 1,
          name: 'Mosque A',
          latitude: 35.6895,
          longitude: 139.6917,
          countryCode: 'JP',
          countryName: 'Japan',
          hasFixedPrayerTime: true,
          prayerDependentId: null,
        );

        expect(location.prayerDependentId, isNull);
      },
    );
  });
}
