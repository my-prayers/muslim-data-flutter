import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculated_prayer_time.dart';
import '../../../../utils/date_extension.dart';

void main() {
  final attribute = PrayerAttribute(
    calculationMethod: CalculationMethod.mwl,
    asrMethod: AsrMethod.shafii,
    higherLatitudeMethod: HigherLatitudeMethod.angleBased,
  );
  final calculator = CalculatedPrayerTime(attribute);

  group('Washington DC, USA Tests', () {
    final location = Location(
      id: 0,
      name: 'Washington DC',
      countryCode: 'US',
      countryName: 'USA',
      latitude: 38.89018,
      longitude: -77.00911,
      hasFixedPrayerTime: false,
    );

    test('Washington DC, USA - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -5.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:51');
      expect(prayerTimes.sunrise.formatTime(), '07:25');
      expect(prayerTimes.dhuhr.formatTime(), '12:18');
      expect(prayerTimes.asr.formatTime(), '14:51');
      expect(prayerTimes.maghrib.formatTime(), '17:11');
      expect(prayerTimes.isha.formatTime(), '18:39');
    });

    test('Washington DC, USA - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -4.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '04:02');
      expect(prayerTimes.sunrise.formatTime(), '05:55');
      expect(prayerTimes.dhuhr.formatTime(), '13:14');
      expect(prayerTimes.asr.formatTime(), '17:09');
      expect(prayerTimes.maghrib.formatTime(), '20:33');
      expect(prayerTimes.isha.formatTime(), '22:18');
    });
  });

  group('Mexico City, Mexico Tests', () {
    final location = Location(
      id: 0,
      name: 'Mexico City',
      countryCode: 'MX',
      countryName: 'Mexico',
      latitude: 19.43257,
      longitude: -99.13437,
      hasFixedPrayerTime: false,
    );

    test('Mexico City, Mexico - 1 Junuary 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -6.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:56');
      expect(prayerTimes.sunrise.formatTime(), '07:13');
      expect(prayerTimes.dhuhr.formatTime(), '12:46');
      expect(prayerTimes.asr.formatTime(), '15:56');
      expect(prayerTimes.maghrib.formatTime(), '18:19');
      expect(prayerTimes.isha.formatTime(), '19:32');
    });

    test('Mexico City, Mexico - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -5.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:45');
      expect(prayerTimes.sunrise.formatTime(), '07:07');
      expect(prayerTimes.dhuhr.formatTime(), '13:43');
      expect(prayerTimes.asr.formatTime(), '16:59');
      expect(prayerTimes.maghrib.formatTime(), '20:18');
      expect(prayerTimes.isha.formatTime(), '21:35');
    });
  });

  group('Santiago, Chile Tests', () {
    final location = Location(
      id: 0,
      name: 'Santiago',
      countryCode: 'CL',
      countryName: 'Chile',
      latitude: -33.44891,
      longitude: -70.66925,
      hasFixedPrayerTime: false,
    );

    test('Santiago, Chile - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -3.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:10');
      expect(prayerTimes.sunrise.formatTime(), '06:49');
      expect(prayerTimes.dhuhr.formatTime(), '13:52');
      expect(prayerTimes.asr.formatTime(), '17:36');
      expect(prayerTimes.maghrib.formatTime(), '20:55');
      expect(prayerTimes.isha.formatTime(), '22:28');
    });

    test('Santiago, Chile - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: -4.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '06:17');
      expect(prayerTimes.sunrise.formatTime(), '07:44');
      expect(prayerTimes.dhuhr.formatTime(), '12:49');
      expect(prayerTimes.asr.formatTime(), '15:34');
      expect(prayerTimes.maghrib.formatTime(), '17:53');
      expect(prayerTimes.isha.formatTime(), '19:16');
    });
  });

  group('Stockholm, Sweden Tests', () {
    final location = Location(
      id: 0,
      name: 'Stockholm',
      countryCode: 'SE',
      countryName: 'Sweden',
      latitude: 59.33177,
      longitude: 18.06507,
      hasFixedPrayerTime: false,
    );

    test('Stockholm, Sweden - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 1.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:57');
      expect(prayerTimes.sunrise.formatTime(), '08:30');
      expect(prayerTimes.dhuhr.formatTime(), '11:57');
      expect(prayerTimes.asr.formatTime(), '13:10');
      expect(prayerTimes.maghrib.formatTime(), '15:25');
      expect(prayerTimes.isha.formatTime(), '17:50');
    });

    test('Stockholm, Sweden - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 2.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '02:07');
      expect(prayerTimes.sunrise.formatTime(), '03:58');
      expect(prayerTimes.dhuhr.formatTime(), '12:54');
      expect(prayerTimes.asr.formatTime(), '17:27');
      expect(prayerTimes.maghrib.formatTime(), '21:49');
      expect(prayerTimes.isha.formatTime(), '23:33');
    });
  });

  group('London, UK Tests', () {
    final location = Location(
      id: 0,
      name: 'London',
      countryCode: 'GB',
      countryName: 'United Kingdom',
      latitude: 51.5074,
      longitude: -0.1278,
      hasFixedPrayerTime: false,
    );

    test('London, UK - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 0.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:59');
      expect(prayerTimes.sunrise.formatTime(), '07:59');
      expect(prayerTimes.dhuhr.formatTime(), '12:10');
      expect(prayerTimes.asr.formatTime(), '14:02');
      expect(prayerTimes.maghrib.formatTime(), '16:21');
      expect(prayerTimes.isha.formatTime(), '18:15');
    });

    test('London, UK - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 1.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '02:40');
      expect(prayerTimes.sunrise.formatTime(), '05:01');
      expect(prayerTimes.dhuhr.formatTime(), '13:07');
      expect(prayerTimes.asr.formatTime(), '17:25');
      expect(prayerTimes.maghrib.formatTime(), '21:11');
      expect(prayerTimes.isha.formatTime(), '23:24');
    });
  });

  group('Budapest, Hungary Tests', () {
    final location = Location(
      id: 0,
      name: 'Budapest',
      countryCode: 'HU',
      countryName: 'Hungary',
      latitude: 47.49806,
      longitude: 19.03994,
      hasFixedPrayerTime: false,
    );

    test('Budapest, Hungary - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 1.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:37');
      expect(prayerTimes.sunrise.formatTime(), '07:27');
      expect(prayerTimes.dhuhr.formatTime(), '11:53');
      expect(prayerTimes.asr.formatTime(), '14:00');
      expect(prayerTimes.maghrib.formatTime(), '16:20');
      expect(prayerTimes.isha.formatTime(), '18:04');
    });

    test('Budapest, Hungary - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 2.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '02:31');
      expect(prayerTimes.sunrise.formatTime(), '05:02');
      expect(prayerTimes.dhuhr.formatTime(), '12:50');
      expect(prayerTimes.asr.formatTime(), '17:01');
      expect(prayerTimes.maghrib.formatTime(), '20:37');
      expect(prayerTimes.isha.formatTime(), '23:00');
    });
  });

  group('Makkah, Sudia Arabia Tests', () {
    final attribute = PrayerAttribute(
      calculationMethod: CalculationMethod.makkah,
      asrMethod: AsrMethod.shafii,
      higherLatitudeMethod: HigherLatitudeMethod.angleBased,
    );
    final calculator = CalculatedPrayerTime(attribute);

    final location = Location(
      id: 0,
      name: 'Makkah',
      countryCode: 'SA',
      countryName: 'Saudi Arabia',
      latitude: 21.42088,
      longitude: 39.81872,
      hasFixedPrayerTime: false,
    );

    test('Makkah, KSA - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 3.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:41');
      expect(prayerTimes.sunrise.formatTime(), '07:01');
      expect(prayerTimes.dhuhr.formatTime(), '12:30');
      expect(prayerTimes.asr.formatTime(), '15:38');
      expect(prayerTimes.maghrib.formatTime(), '18:00');
      expect(prayerTimes.isha.formatTime(), '19:30');
    });

    test('Makkah, KSA - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 3.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '04:21');
      expect(prayerTimes.sunrise.formatTime(), '05:47');
      expect(prayerTimes.dhuhr.formatTime(), '12:27');
      expect(prayerTimes.asr.formatTime(), '15:41');
      expect(prayerTimes.maghrib.formatTime(), '19:06');
      expect(prayerTimes.isha.formatTime(), '20:36');
    });
  });

  group('Lusaka, Zambia Tests', () {
    final location = Location(
      id: 0,
      name: 'Lusaka',
      countryCode: 'ZM',
      countryName: 'Zambia',
      latitude: -15.41576,
      longitude: 28.27725,
      hasFixedPrayerTime: false,
    );

    test('Lusaka, Zambia - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 2.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '04:29');
      expect(prayerTimes.sunrise.formatTime(), '05:48');
      expect(prayerTimes.dhuhr.formatTime(), '12:16');
      expect(prayerTimes.asr.formatTime(), '15:37');
      expect(prayerTimes.maghrib.formatTime(), '18:44');
      expect(prayerTimes.isha.formatTime(), '19:58');
    });

    test('Lusaka, Zambia - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 2.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:18');
      expect(prayerTimes.sunrise.formatTime(), '06:34');
      expect(prayerTimes.dhuhr.formatTime(), '12:13');
      expect(prayerTimes.asr.formatTime(), '15:27');
      expect(prayerTimes.maghrib.formatTime(), '17:52');
      expect(prayerTimes.isha.formatTime(), '19:03');
    });
  });

  group('Hanoi, Vietnam Tests', () {
    final location = Location(
      id: 0,
      name: 'Hanoi',
      countryCode: 'VN',
      countryName: 'Vietnam',
      latitude: 21.02770,
      longitude: 105.83402,
      hasFixedPrayerTime: false,
    );

    test('Budapest, Hungary - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 7.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:18');
      expect(prayerTimes.sunrise.formatTime(), '06:36');
      expect(prayerTimes.dhuhr.formatTime(), '12:06');
      expect(prayerTimes.asr.formatTime(), '15:14');
      expect(prayerTimes.maghrib.formatTime(), '17:36');
      expect(prayerTimes.isha.formatTime(), '18:49');
    });

    test('Budapest, Hungary - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 7.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '04:01');
      expect(prayerTimes.sunrise.formatTime(), '05:24');
      expect(prayerTimes.dhuhr.formatTime(), '12:03');
      expect(prayerTimes.asr.formatTime(), '15:18');
      expect(prayerTimes.maghrib.formatTime(), '18:41');
      expect(prayerTimes.isha.formatTime(), '19:59');
    });
  });

  group('Canberra, Australia Tests', () {
    final location = Location(
      id: 0,
      name: 'Canberra',
      countryCode: 'AU',
      countryName: 'Australia',
      latitude: -35.28031,
      longitude: 149.13086,
      hasFixedPrayerTime: false,
    );

    test('Canberra, Australia - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 11.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '04:21');
      expect(prayerTimes.sunrise.formatTime(), '06:05');
      expect(prayerTimes.dhuhr.formatTime(), '13:13');
      expect(prayerTimes.asr.formatTime(), '17:00');
      expect(prayerTimes.maghrib.formatTime(), '20:21');
      expect(prayerTimes.isha.formatTime(), '21:57');
    });

    test('Canberra, Australia - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 10.0,
      );

      expect(prayerTimes, isNotNull);
      expect(prayerTimes!.fajr.formatTime(), '05:40');
      expect(prayerTimes.sunrise.formatTime(), '07:10');
      expect(prayerTimes.dhuhr.formatTime(), '12:09');
      expect(prayerTimes.asr.formatTime(), '14:51');
      expect(prayerTimes.maghrib.formatTime(), '17:09');
      expect(prayerTimes.isha.formatTime(), '18:34');
    });
  });

  group('Unknown Location Tests', () {
    final location = Location(
      id: 0,
      name: 'Unknown',
      countryCode: 'XX',
      countryName: 'Unknown',
      latitude: -100.0,
      longitude: -100.0,
      hasFixedPrayerTime: false,
    );

    test('Unknown Location - 15 January 2025', () {
      final date = DateTime(2025, 1, 15);
      final prayerTimes = calculator.getPrayerTimes(
        location,
        date,
        timezone: 0.0,
      );

      expect(prayerTimes, isNull);
    });
  });
}
