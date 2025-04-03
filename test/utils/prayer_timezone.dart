import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculated_prayer_time.dart';
import 'package:muslim_data_flutter/src/utils/string_date.dart';

extension PrayerTimezone on CalculatedPrayerTime {
  /// Calculate prayer times for a given location and date with custom timezone.
  /// This method is used for testing purposes only.
  PrayerTime getPrayerTimesTest(
    Location location,
    DateTime date, {
    required double timezone,
  }) {
    final year = date.year;
    final month = date.month;
    final day = date.day;
    timeZone = timezone;

    lat = location.latitude;
    lng = location.longitude;
    jDate = julianDate(year, month, day);
    final lonDiff = location.longitude / (15.0 * 24.0);
    jDate -= lonDiff;

    final cTime = computeDayTimes();
    return PrayerTime(
      fajr: cTime[0].toDate(date),
      sunrise: cTime[1].toDate(date),
      dhuhr: cTime[2].toDate(date),
      asr: cTime[3].toDate(date),
      maghrib: cTime[4].toDate(date),
      isha: cTime[5].toDate(date),
    );
  }
}
