import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../../utils/date_extension.dart';
import '../data/database/db_connection.dart';

void main() {
  late MuslimDao dao;
  late MuslimRepository repository;
  late PrayerAttribute attributes;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    dao = MuslimDao(db: MuslimDb(connection: openTestConnection()));
    repository = MuslimRepository(dao: dao);
    attributes = PrayerAttribute(
      calculationMethod: CalculationMethod.makkah,
      asrMethod: AsrMethod.shafii,
      higherLatitudeMethod: HigherLatitudeMethod.angleBased,
    );
  });

  test(
    'Verify all fixed prayer times have prayer time data in the db',
    () async {
      final locations = await dao.getFixedPrayerTimesList();
      expect(locations, isNotNull);
      expect(locations.length, equals(252));

      final date = DateTime.fromMillisecondsSinceEpoch(1709206718000);
      for (final location in locations) {
        final prayerTime = await repository.getPrayerTimes(
          location: location,
          date: date,
          attribute: attributes,
        );
        expect(prayerTime, isNotNull);
      }
    },
  );

  test('Verify calculated prayer times have prayer time data', () async {
    final date = DateTime(2025, 1, 15);
    final location = Location(
      id: 0,
      name: 'Makkah',
      countryCode: 'SA',
      countryName: 'Saudi Arabia',
      latitude: 21.42088,
      longitude: 39.81872,
      hasFixedPrayerTime: false,
    );
    final prayerTimes = await repository.getPrayerTimes(
      location: location,
      date: date,
      attribute: attributes,
    );

    expect(prayerTimes, isNotNull);
    expect(prayerTimes!.fajr.formatTime(), isNotNull);
    expect(prayerTimes.sunrise.formatTime(), isNotNull);
    expect(prayerTimes.dhuhr.formatTime(), isNotNull);
    expect(prayerTimes.asr.formatTime(), isNotNull);
    expect(prayerTimes.maghrib.formatTime(), isNotNull);
    expect(prayerTimes.isha.formatTime(), isNotNull);
  });

  test(
    'Verify calculated prayer times returns null for invalid location',
    () async {
      final date = DateTime(2025, 1, 15);
      final location = Location(
        id: 0,
        name: 'Unknown',
        countryCode: 'XX',
        countryName: 'Unknown',
        latitude: -100.0,
        longitude: -100.0,
        hasFixedPrayerTime: false,
      );
      final prayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
      );

      expect(prayerTimes, isNull);
    },
  );

  test(
    'Verify useFixedPrayer=false returns calculated prayer times for fixed prayer location',
    () async {
      final date = DateTime(2025, 1, 15);
      final location = await dao.geocoder('IQ', 'Erbil');
      expect(location, isNotNull);
      expect(location!.hasFixedPrayerTime, true);

      final calculatedPrayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
        useFixedPrayer: false,
      );

      expect(calculatedPrayerTimes, isNotNull);
      expect(calculatedPrayerTimes!.fajr.formatTime(), isNotNull);
      expect(calculatedPrayerTimes.sunrise.formatTime(), isNotNull);
      expect(calculatedPrayerTimes.dhuhr.formatTime(), isNotNull);
      expect(calculatedPrayerTimes.asr.formatTime(), isNotNull);
      expect(calculatedPrayerTimes.maghrib.formatTime(), isNotNull);
      expect(calculatedPrayerTimes.isha.formatTime(), isNotNull);
    },
  );

  test(
    'Verify useFixedPrayer=true returns fixed prayer times for fixed prayer location',
    () async {
      final date = DateTime(2025, 1, 15);
      final location = await dao.geocoder('IQ', 'Erbil');
      expect(location, isNotNull);
      expect(location!.hasFixedPrayerTime, true);

      final fixedPrayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
        useFixedPrayer: true,
      );

      expect(fixedPrayerTimes, isNotNull);
      expect(fixedPrayerTimes!.fajr.formatTime(), isNotNull);
      expect(fixedPrayerTimes.sunrise.formatTime(), isNotNull);
      expect(fixedPrayerTimes.dhuhr.formatTime(), isNotNull);
      expect(fixedPrayerTimes.asr.formatTime(), isNotNull);
      expect(fixedPrayerTimes.maghrib.formatTime(), isNotNull);
      expect(fixedPrayerTimes.isha.formatTime(), isNotNull);
    },
  );

  test(
    'Verify fixed and calculated prayer times differ when useFixedPrayer is toggled',
    () async {
      final date = DateTime(2025, 1, 15);
      final location = await dao.geocoder('IQ', 'Erbil');
      expect(location, isNotNull);
      expect(location!.hasFixedPrayerTime, true);

      final fixedPrayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
        useFixedPrayer: true,
      );

      final calculatedPrayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
        useFixedPrayer: false,
      );

      expect(fixedPrayerTimes, isNotNull);
      expect(calculatedPrayerTimes, isNotNull);

      // The prayer times should be different
      expect(fixedPrayerTimes!.fajr != calculatedPrayerTimes!.fajr, isTrue);
      expect(fixedPrayerTimes.sunrise != calculatedPrayerTimes.sunrise, isTrue);
      expect(fixedPrayerTimes.dhuhr != calculatedPrayerTimes.dhuhr, isTrue);
      expect(fixedPrayerTimes.asr != calculatedPrayerTimes.asr, isTrue);
      expect(fixedPrayerTimes.maghrib != calculatedPrayerTimes.maghrib, isTrue);
      expect(fixedPrayerTimes.isha != calculatedPrayerTimes.isha, isTrue);
    },
  );

  test('Verify useFixedPrayer parameter defaults to true', () async {
    final date = DateTime(2025, 1, 15);
    final location = await dao.geocoder('IQ', 'Erbil');
    expect(location, isNotNull);
    expect(location!.hasFixedPrayerTime, true);

    final defaultPrayerTimes = await repository.getPrayerTimes(
      location: location,
      date: date,
      attribute: attributes,
    );

    final fixedPrayerTimes = await repository.getPrayerTimes(
      location: location,
      date: date,
      attribute: attributes,
      useFixedPrayer: true,
    );

    expect(defaultPrayerTimes, isNotNull);
    expect(fixedPrayerTimes, isNotNull);

    // Default behavior should match useFixedPrayer=true
    expect(defaultPrayerTimes!.fajr, equals(fixedPrayerTimes!.fajr));
    expect(defaultPrayerTimes.sunrise, equals(fixedPrayerTimes.sunrise));
    expect(defaultPrayerTimes.dhuhr, equals(fixedPrayerTimes.dhuhr));
    expect(defaultPrayerTimes.asr, equals(fixedPrayerTimes.asr));
    expect(defaultPrayerTimes.maghrib, equals(fixedPrayerTimes.maghrib));
    expect(defaultPrayerTimes.isha, equals(fixedPrayerTimes.isha));
  });

  test(
    'Verify useFixedPrayer=false works for location without fixed prayer times',
    () async {
      final date = DateTime(2025, 1, 15);
      final location = Location(
        id: 0,
        name: 'Makkah',
        countryCode: 'SA',
        countryName: 'Saudi Arabia',
        latitude: 21.42088,
        longitude: 39.81872,
        hasFixedPrayerTime: false,
      );

      final prayerTimes = await repository.getPrayerTimes(
        location: location,
        date: date,
        attribute: attributes,
        useFixedPrayer: false,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr, isNotNull);
      expect(prayerTimes.sunrise, isNotNull);
      expect(prayerTimes.dhuhr, isNotNull);
      expect(prayerTimes.asr, isNotNull);
      expect(prayerTimes.maghrib, isNotNull);
      expect(prayerTimes.isha, isNotNull);
    },
  );
}
