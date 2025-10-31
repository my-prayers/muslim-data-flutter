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

    test(
      'copyWith should create a new instance with updated fajr, sunrise, and dhuhr values',
      () {
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
          sunrise: DateTime(2023, 1, 1, 6, 45),
          dhuhr: DateTime(2023, 1, 1, 12, 15),
        );

        expect(updatedPrayerTime.fajr, equals(DateTime(2023, 1, 1, 5, 30)));
        expect(updatedPrayerTime.sunrise, equals(DateTime(2023, 1, 1, 6, 45)));
        expect(updatedPrayerTime.dhuhr, equals(DateTime(2023, 1, 1, 12, 15)));
        expect(updatedPrayerTime.asr, equals(prayerTime.asr));
        expect(updatedPrayerTime.maghrib, equals(prayerTime.maghrib));
        expect(updatedPrayerTime.isha, equals(prayerTime.isha));
      },
    );

    test(
      'copyWith should create a new instance with updated asr, maghrib, and isha values',
      () {
        final prayerTime = PrayerTime(
          fajr: DateTime(2023, 1, 1, 5, 0),
          sunrise: DateTime(2023, 1, 1, 6, 30),
          dhuhr: DateTime(2023, 1, 1, 12, 0),
          asr: DateTime(2023, 1, 1, 15, 30),
          maghrib: DateTime(2023, 1, 1, 18, 0),
          isha: DateTime(2023, 1, 1, 19, 30),
        );

        final updatedPrayerTime = prayerTime.copyWith(
          asr: DateTime(2023, 1, 1, 16, 0),
          maghrib: DateTime(2023, 1, 1, 18, 30),
          isha: DateTime(2023, 1, 1, 20, 0),
        );

        expect(updatedPrayerTime.fajr, equals(prayerTime.fajr));
        expect(updatedPrayerTime.sunrise, equals(prayerTime.sunrise));
        expect(updatedPrayerTime.dhuhr, equals(prayerTime.dhuhr));
        expect(updatedPrayerTime.asr, equals(DateTime(2023, 1, 1, 16, 0)));
        expect(updatedPrayerTime.maghrib, equals(DateTime(2023, 1, 1, 18, 30)));
        expect(updatedPrayerTime.isha, equals(DateTime(2023, 1, 1, 20, 0)));
      },
    );

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

    test(
      'subscription operator should return correct prayer time for valid indices',
      () {
        final prayerTime = PrayerTime(
          fajr: DateTime(2023, 1, 1, 5, 0),
          sunrise: DateTime(2023, 1, 1, 6, 30),
          dhuhr: DateTime(2023, 1, 1, 12, 0),
          asr: DateTime(2023, 1, 1, 15, 30),
          maghrib: DateTime(2023, 1, 1, 18, 0),
          isha: DateTime(2023, 1, 1, 19, 30),
        );

        expect(prayerTime[0], equals(prayerTime.fajr));
        expect(prayerTime[1], equals(prayerTime.sunrise));
        expect(prayerTime[2], equals(prayerTime.dhuhr));
        expect(prayerTime[3], equals(prayerTime.asr));
        expect(prayerTime[4], equals(prayerTime.maghrib));
        expect(prayerTime[5], equals(prayerTime.isha));
      },
    );

    test(
      'subscription operator should return isha time for negative index',
      () {
        final prayerTime = PrayerTime(
          fajr: DateTime(2023, 1, 1, 5, 0),
          sunrise: DateTime(2023, 1, 1, 6, 30),
          dhuhr: DateTime(2023, 1, 1, 12, 0),
          asr: DateTime(2023, 1, 1, 15, 30),
          maghrib: DateTime(2023, 1, 1, 18, 0),
          isha: DateTime(2023, 1, 1, 19, 30),
        );

        expect(prayerTime[-1], equals(prayerTime.isha));
        expect(prayerTime[-5], equals(prayerTime.isha));
        expect(prayerTime[-100], equals(prayerTime.isha));
      },
    );
  });
}
