import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

import '../data/database/db_connection.dart';

void main() {
  late MuslimRepository repository;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    repository = MuslimRepository(
      dao: MuslimDao(db: MuslimDb(connection: openTestConnection())),
    );
  });

  group('geocoder tests', () {
    test('geocoder returns correct location for London, GB', () async {
      final location = await repository.geocoder(
        countryCode: 'GB',
        locationName: 'London',
      );
      expect(location, isNotNull);
      expect(location!.latitude, equals(51.50853));
      expect(location.longitude, equals(-0.12574));
      expect(location.hasFixedPrayerTime, true);
    });

    test('geocoder returns null for unknown city', () async {
      final location = await repository.geocoder(
        countryCode: 'abc',
        locationName: 'Unknown',
      );
      expect(location, isNull);
    });

    test('geocoder returns correct location for Tehran, IR', () async {
      final location = await repository.geocoder(
        countryCode: 'IR',
        locationName: 'Tehran',
      );
      expect(location, isNotNull);
      expect(location!.latitude, equals(35.69439));
      expect(location.longitude, equals(51.42151));
      expect(location.hasFixedPrayerTime, false);
    });

    test('geocoder returns correct location for Soran, IQ', () async {
      final location = await repository.geocoder(
        countryCode: 'IQ',
        locationName: 'Soran',
      );
      expect(location, isNotNull);
      expect(location!.latitude, equals(36.652686));
      expect(location.longitude, equals(44.541427));
      expect(location.hasFixedPrayerTime, true);
    });

    test('geocoder returns correct location for Qasre, IQ', () async {
      final location = await repository.geocoder(
        countryCode: 'IQ',
        locationName: 'Qasre',
      );
      expect(location, isNotNull);
      expect(location!.latitude, equals(36.557804));
      expect(location.longitude, equals(44.827805));
      expect(location.hasFixedPrayerTime, true);
    });
  });

  group('reverseGeocoder tests', () {
    test('reverse geocoder returns correct details for London, GB', () async {
      final location = await repository.reverseGeocoder(
        latitude: 51.50853,
        longitude: -0.12574,
      );
      expect(location, isNotNull);
      expect(location!.name, 'London');
      expect(location.countryCode, 'GB');
      expect(location.countryName, 'United Kingdom');
      expect(location.hasFixedPrayerTime, true);
    });

    test('reverse geocoder returns correct details for Tehran, IR', () async {
      final location = await repository.reverseGeocoder(
        latitude: 35.69439,
        longitude: 51.42151,
      );
      expect(location, isNotNull);
      expect(location!.name, 'Tehran');
      expect(location.countryCode, 'IR');
      expect(location.countryName, 'Iran');
      expect(location.hasFixedPrayerTime, false);
    });

    test('reverse geocoder returns correct details for Soran, IQ', () async {
      final location = await repository.reverseGeocoder(
        latitude: 36.652686,
        longitude: 44.541427,
      );
      expect(location, isNotNull);
      expect(location!.name, 'Soran');
      expect(location.countryCode, 'IQ');
      expect(location.countryName, 'Iraq');
      expect(location.hasFixedPrayerTime, true);
    });

    test('reverse geocoder returns correct details for Qasre, IQ', () async {
      final location = await repository.reverseGeocoder(
        latitude: 36.557804,
        longitude: 44.827805,
      );
      expect(location, isNotNull);
      expect(location!.name, 'Qasre');
      expect(location.countryCode, 'IQ');
      expect(location.countryName, 'Iraq');
      expect(location.hasFixedPrayerTime, true);
    });
  });

  group('searchLocations tests', () {
    test('search returns correct locations for query "Tehran"', () async {
      final locations = await repository.searchLocations(
        locationName: 'Tehran',
      );
      expect(locations, isNotEmpty);
      expect(locations.first.name, 'Tehran');
      expect(locations.first.countryCode, 'IR');
      expect(locations.first.latitude, equals(35.69439));
      expect(locations.first.longitude, equals(51.42151));
      expect(locations.first.hasFixedPrayerTime, false);
    });

    test('search returns multiple locations for query "Erbil"', () async {
      final locations = await repository.searchLocations(locationName: 'Erbil');
      expect(locations, isNotEmpty);
      expect(locations.length, equals(1));
      expect(locations.first.name, 'Erbil');
      expect(locations.first.countryCode, 'IQ');
      expect(locations.first.latitude, equals(36.191196));
      expect(locations.first.longitude, equals(44.009962));
      expect(locations.first.hasFixedPrayerTime, true);
    });

    test('search returns empty list for unknown query', () async {
      final locations = await repository.searchLocations(
        locationName: 'UnknownLocation',
      );
      expect(locations, isEmpty);
    });

    test('search returns empty list for bad query', () async {
      final locations = await repository.searchLocations(
        locationName: '\'Throw exception here\'',
      );
      expect(locations, isEmpty);
    });
  });
}
