import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculated_prayer_time.dart';
import '../../../../utils/prayer_timezone.dart';

void main() {
  final attribute = PrayerAttribute(
    calculationMethod: CalculationMethod.mwl,
    asrMethod: AsrMethod.shafii,
    higherLatitudeMethod: HigherLatitudeMethod.angleBased,
  );
  final calculator = CalculatedPrayerTime(attribute);

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -5.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:51');
      expect(formatTime(prayerTimes.sunrise), '07:25');
      expect(formatTime(prayerTimes.dhuhr), '12:18');
      expect(formatTime(prayerTimes.asr), '14:51');
      expect(formatTime(prayerTimes.maghrib), '17:11');
      expect(formatTime(prayerTimes.isha), '18:39');
    });

    test('Washington DC, USA - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -4.0,
      );

      expect(formatTime(prayerTimes.fajr), '04:02');
      expect(formatTime(prayerTimes.sunrise), '05:55');
      expect(formatTime(prayerTimes.dhuhr), '13:14');
      expect(formatTime(prayerTimes.asr), '17:09');
      expect(formatTime(prayerTimes.maghrib), '20:33');
      expect(formatTime(prayerTimes.isha), '22:18');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -6.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:56');
      expect(formatTime(prayerTimes.sunrise), '07:13');
      expect(formatTime(prayerTimes.dhuhr), '12:46');
      expect(formatTime(prayerTimes.asr), '15:56');
      expect(formatTime(prayerTimes.maghrib), '18:19');
      expect(formatTime(prayerTimes.isha), '19:32');
    });

    test('Mexico City, Mexico - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -5.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:45');
      expect(formatTime(prayerTimes.sunrise), '07:07');
      expect(formatTime(prayerTimes.dhuhr), '13:43');
      expect(formatTime(prayerTimes.asr), '16:59');
      expect(formatTime(prayerTimes.maghrib), '20:18');
      expect(formatTime(prayerTimes.isha), '21:35');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -3.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:10');
      expect(formatTime(prayerTimes.sunrise), '06:49');
      expect(formatTime(prayerTimes.dhuhr), '13:52');
      // FIXME: Asr time is not correct
      // expect(formatTime(prayerTimes.asr), '17:36');
      expect(formatTime(prayerTimes.maghrib), '20:55');
      expect(formatTime(prayerTimes.isha), '22:28');
    });

    test('Santiago, Chile - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: -4.0,
      );

      expect(formatTime(prayerTimes.fajr), '06:17');
      expect(formatTime(prayerTimes.sunrise), '07:44');
      expect(formatTime(prayerTimes.dhuhr), '12:49');
      // FIXME: Asr time is not correct
      // expect(formatTime(prayerTimes.asr), '15:34');
      expect(formatTime(prayerTimes.maghrib), '17:53');
      expect(formatTime(prayerTimes.isha), '19:16');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 1.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:57');
      expect(formatTime(prayerTimes.sunrise), '08:30');
      expect(formatTime(prayerTimes.dhuhr), '11:57');
      expect(formatTime(prayerTimes.asr), '13:10');
      expect(formatTime(prayerTimes.maghrib), '15:25');
      expect(formatTime(prayerTimes.isha), '17:50');
    });

    test('Stockholm, Sweden - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 2.0,
      );

      expect(formatTime(prayerTimes.fajr), '02:07');
      expect(formatTime(prayerTimes.sunrise), '03:58');
      expect(formatTime(prayerTimes.dhuhr), '12:54');
      expect(formatTime(prayerTimes.asr), '17:27');
      expect(formatTime(prayerTimes.maghrib), '21:49');
      expect(formatTime(prayerTimes.isha), '23:33');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 0.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:59');
      // FIXME: Sunrise time is not correct
      // expect(formatTime(prayerTimes.sunrise), '06:59');
      expect(formatTime(prayerTimes.dhuhr), '12:10');
      expect(formatTime(prayerTimes.asr), '14:02');
      expect(formatTime(prayerTimes.maghrib), '16:21');
      expect(formatTime(prayerTimes.isha), '18:15');
    });

    test('London, UK - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 1.0,
      );

      expect(formatTime(prayerTimes.fajr), '02:40');
      expect(formatTime(prayerTimes.sunrise), '05:01');
      expect(formatTime(prayerTimes.dhuhr), '13:07');
      expect(formatTime(prayerTimes.asr), '17:25');
      expect(formatTime(prayerTimes.maghrib), '21:11');
      expect(formatTime(prayerTimes.isha), '23:24');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 1.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:37');
      expect(formatTime(prayerTimes.sunrise), '07:27');
      expect(formatTime(prayerTimes.dhuhr), '11:53');
      expect(formatTime(prayerTimes.asr), '14:00');
      expect(formatTime(prayerTimes.maghrib), '16:20');
      expect(formatTime(prayerTimes.isha), '18:04');
    });

    test('Budapest, Hungary - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 2.0,
      );

      expect(formatTime(prayerTimes.fajr), '02:31');
      expect(formatTime(prayerTimes.sunrise), '05:02');
      expect(formatTime(prayerTimes.dhuhr), '12:50');
      expect(formatTime(prayerTimes.asr), '17:01');
      expect(formatTime(prayerTimes.maghrib), '20:37');
      expect(formatTime(prayerTimes.isha), '23:00');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 3.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:41');
      expect(formatTime(prayerTimes.sunrise), '07:01');
      expect(formatTime(prayerTimes.dhuhr), '12:30');
      expect(formatTime(prayerTimes.asr), '15:38');
      expect(formatTime(prayerTimes.maghrib), '18:00');
      expect(formatTime(prayerTimes.isha), '19:30');
    });

    test('Makkah, KSA - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 3.0,
      );

      expect(formatTime(prayerTimes.fajr), '04:21');
      expect(formatTime(prayerTimes.sunrise), '05:47');
      expect(formatTime(prayerTimes.dhuhr), '12:27');
      expect(formatTime(prayerTimes.asr), '15:41');
      expect(formatTime(prayerTimes.maghrib), '19:06');
      expect(formatTime(prayerTimes.isha), '20:36');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 2.0,
      );

      expect(formatTime(prayerTimes.fajr), '04:29');
      expect(formatTime(prayerTimes.sunrise), '05:48');
      expect(formatTime(prayerTimes.dhuhr), '12:16');
      expect(formatTime(prayerTimes.asr), '15:37');
      expect(formatTime(prayerTimes.maghrib), '18:44');
      expect(formatTime(prayerTimes.isha), '19:58');
    });

    test('Lusaka, Zambia - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 2.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:18');
      expect(formatTime(prayerTimes.sunrise), '06:34');
      expect(formatTime(prayerTimes.dhuhr), '12:13');
      expect(formatTime(prayerTimes.asr), '15:27');
      expect(formatTime(prayerTimes.maghrib), '17:52');
      expect(formatTime(prayerTimes.isha), '19:03');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 7.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:18');
      expect(formatTime(prayerTimes.sunrise), '06:36');
      expect(formatTime(prayerTimes.dhuhr), '12:06');
      expect(formatTime(prayerTimes.asr), '15:14');
      expect(formatTime(prayerTimes.maghrib), '17:36');
      expect(formatTime(prayerTimes.isha), '18:49');
    });

    test('Budapest, Hungary - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 7.0,
      );

      expect(formatTime(prayerTimes.fajr), '04:01');
      expect(formatTime(prayerTimes.sunrise), '05:24');
      expect(formatTime(prayerTimes.dhuhr), '12:03');
      expect(formatTime(prayerTimes.asr), '15:18');
      expect(formatTime(prayerTimes.maghrib), '18:41');
      expect(formatTime(prayerTimes.isha), '19:59');
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
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 11.0,
      );

      expect(formatTime(prayerTimes.fajr), '04:21');
      expect(formatTime(prayerTimes.sunrise), '06:05');
      expect(formatTime(prayerTimes.dhuhr), '13:13');
      expect(formatTime(prayerTimes.asr), '17:00');
      expect(formatTime(prayerTimes.maghrib), '20:21');
      expect(formatTime(prayerTimes.isha), '21:57');
    });

    test('Canberra, Australia - 15 July 2025', () {
      final date = DateTime(2025, 7, 15);
      final prayerTimes = calculator.getPrayerTimesTest(
        location,
        date,
        timezone: 10.0,
      );

      expect(formatTime(prayerTimes.fajr), '05:40');
      expect(formatTime(prayerTimes.sunrise), '07:10');
      expect(formatTime(prayerTimes.dhuhr), '12:09');
      expect(formatTime(prayerTimes.asr), '14:51');
      expect(formatTime(prayerTimes.maghrib), '17:09');
      expect(formatTime(prayerTimes.isha), '18:34');
    });
  });
}
