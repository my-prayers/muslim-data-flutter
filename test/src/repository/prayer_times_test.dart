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
      expect(locations.length, equals(251));

      final date = DateTime.fromMillisecondsSinceEpoch(1709206718000);
      for (final location in locations) {
        final prayerTime = await repository.getPrayerTimes(
          location,
          date,
          attributes,
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
      location,
      date,
      attributes,
    );

    expect(prayerTimes, isNotNull);
    expect(prayerTimes!.fajr.formatTime(), '05:41');
    expect(prayerTimes.sunrise.formatTime(), '07:01');
    expect(prayerTimes.dhuhr.formatTime(), '12:30');
    expect(prayerTimes.asr.formatTime(), '15:38');
    expect(prayerTimes.maghrib.formatTime(), '18:00');
    expect(prayerTimes.isha.formatTime(), '19:30');
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
        location,
        date,
        attributes,
      );

      expect(prayerTimes, isNull);
    },
  );
}
