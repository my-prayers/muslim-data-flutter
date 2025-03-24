import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/prayer_time.dart';

void main() {
  group('PrayerTime', () {
    test('should create a PrayerTime instance with correct values', () {
      final prayerTime = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      expect(prayerTime.fajr, DateTime(2023, 1, 1, 5, 0));
      expect(prayerTime.sunrise, DateTime(2023, 1, 1, 6, 30));
      expect(prayerTime.dhuhr, DateTime(2023, 1, 1, 12, 0));
      expect(prayerTime.asr, DateTime(2023, 1, 1, 15, 30));
      expect(prayerTime.maghrib, DateTime(2023, 1, 1, 18, 0));
      expect(prayerTime.isha, DateTime(2023, 1, 1, 19, 30));
    });

    test('copyWith should create a new instance with updated values', () {
      final prayerTime = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      final updatedPrayerTime = prayerTime.copyWith(
        fajr: DateTime(2023, 1, 1, 5, 30),
      );

      expect(updatedPrayerTime.fajr, DateTime(2023, 1, 1, 5, 30));
      expect(updatedPrayerTime.sunrise, prayerTime.sunrise);
      expect(updatedPrayerTime.dhuhr, prayerTime.dhuhr);
      expect(updatedPrayerTime.asr, prayerTime.asr);
      expect(updatedPrayerTime.maghrib, prayerTime.maghrib);
      expect(updatedPrayerTime.isha, prayerTime.isha);
    });

    test('toString should return a properly formatted string', () {
      final prayerTime = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      expect(
        prayerTime.toString(),
        'PrayerTime(fajr: 2023-01-01 05:00:00.000, sunrise: 2023-01-01 06:30:00.000, dhuhr: 2023-01-01 12:00:00.000, asr: 2023-01-01 15:30:00.000, maghrib: 2023-01-01 18:00:00.000, isha: 2023-01-01 19:30:00.000)',
      );
    });

    test('equality operator should compare instances correctly', () {
      final prayerTime1 = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      final prayerTime2 = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      final prayerTime3 = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 30),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      expect(prayerTime1, equals(prayerTime2));
      expect(prayerTime1, isNot(equals(prayerTime3)));
    });

    test('hashCode should generate consistent hash codes', () {
      final prayerTime1 = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      final prayerTime2 = PrayerTime(
        fajr: DateTime(2023, 1, 1, 5, 0),
        sunrise: DateTime(2023, 1, 1, 6, 30),
        dhuhr: DateTime(2023, 1, 1, 12, 0),
        asr: DateTime(2023, 1, 1, 15, 30),
        maghrib: DateTime(2023, 1, 1, 18, 0),
        isha: DateTime(2023, 1, 1, 19, 30),
      );

      expect(prayerTime1.hashCode, equals(prayerTime2.hashCode));
    });
  });
}
