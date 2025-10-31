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

    test(
      'Equality operator should return false for objects with different type',
      () {
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

        expect(location1, isNot(equals('Not a Location')));
        expect(location1, isNot(equals(42)));
        expect(location1, isNot(equals(null)));
      },
    );

    test('Equality operator should handle edge cases correctly', () {
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

    test('fromJson should correctly parse a JSON map with all fields', () {
      final json = {
        'id': 1,
        'name': 'Mosque A',
        'latitude': 35.6895,
        'longitude': 139.6917,
        'countryCode': 'JP',
        'countryName': 'Japan',
        'hasFixedPrayerTime': true,
        'prayerDependentId': 10,
      };

      final location = Location.fromJson(json);

      expect(location.id, equals(1));
      expect(location.name, equals('Mosque A'));
      expect(location.latitude, equals(35.6895));
      expect(location.longitude, equals(139.6917));
      expect(location.countryCode, equals('JP'));
      expect(location.countryName, equals('Japan'));
      expect(location.hasFixedPrayerTime, isTrue);
      expect(location.prayerDependentId, equals(10));
    });

    test('fromJson should handle null prayerDependentId correctly', () {
      final json = {
        'id': 2,
        'name': 'Mosque B',
        'latitude': 40.7128,
        'longitude': -74.0060,
        'countryCode': 'US',
        'countryName': 'United States',
        'hasFixedPrayerTime': false,
        'prayerDependentId': null,
      };

      final location = Location.fromJson(json);

      expect(location.id, equals(2));
      expect(location.name, equals('Mosque B'));
      expect(location.latitude, equals(40.7128));
      expect(location.longitude, equals(-74.0060));
      expect(location.countryCode, equals('US'));
      expect(location.countryName, equals('United States'));
      expect(location.hasFixedPrayerTime, isFalse);
      expect(location.prayerDependentId, isNull);
    });

    test('toJson should correctly convert a Location to a JSON map', () {
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

      final json = location.toJson();

      expect(json['id'], equals(1));
      expect(json['name'], equals('Mosque A'));
      expect(json['latitude'], equals(35.6895));
      expect(json['longitude'], equals(139.6917));
      expect(json['countryCode'], equals('JP'));
      expect(json['countryName'], equals('Japan'));
      expect(json['hasFixedPrayerTime'], isTrue);
      expect(json['prayerDependentId'], equals(10));
    });

    test('toJson should include null prayerDependentId when not provided', () {
      const location = Location(
        id: 2,
        name: 'Mosque B',
        latitude: 40.7128,
        longitude: -74.0060,
        countryCode: 'US',
        countryName: 'United States',
        hasFixedPrayerTime: false,
        prayerDependentId: null,
      );

      final json = location.toJson();

      expect(json['id'], equals(2));
      expect(json['name'], equals('Mosque B'));
      expect(json['latitude'], equals(40.7128));
      expect(json['longitude'], equals(-74.0060));
      expect(json['countryCode'], equals('US'));
      expect(json['countryName'], equals('United States'));
      expect(json['hasFixedPrayerTime'], isFalse);
      expect(json['prayerDependentId'], isNull);
    });

    test('fromJson and toJson should be symmetrical', () {
      const originalLocation = Location(
        id: 1,
        name: 'Mosque A',
        latitude: 35.6895,
        longitude: 139.6917,
        countryCode: 'JP',
        countryName: 'Japan',
        hasFixedPrayerTime: true,
        prayerDependentId: 10,
      );

      final json = originalLocation.toJson();
      final parsedLocation = Location.fromJson(json);

      expect(parsedLocation, equals(originalLocation));
    });

    test(
      'fromJson and toJson should be symmetrical with null prayerDependentId',
      () {
        const originalLocation = Location(
          id: 2,
          name: 'Mosque B',
          latitude: 40.7128,
          longitude: -74.0060,
          countryCode: 'US',
          countryName: 'United States',
          hasFixedPrayerTime: false,
          prayerDependentId: null,
        );

        final json = originalLocation.toJson();
        final parsedLocation = Location.fromJson(json);

        expect(parsedLocation, equals(originalLocation));
      },
    );
  });
}
