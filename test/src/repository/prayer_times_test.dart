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
    'Verify calculated prayer times returns null for invalide location',
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
}
