import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muslim_data_flutter/models/prayer_times/time_format.dart';
import 'package:muslim_data_flutter/utils/date_utils.dart';

part 'prayer_time.freezed.dart';

@freezed
abstract class PrayerTime with _$PrayerTime {
  const PrayerTime._();

  const factory PrayerTime(
    DateTime fajr,
    DateTime sunrise,
    DateTime dhuhr,
    DateTime asr,
    DateTime maghrib,
    DateTime isha,
  ) = _PrayerTime;

  /// Applies the given list of [offsets] to the prayer times.
  PrayerTime applyOffset(List<int> offsets) {
    return copyWith(
      fajr: fajr.add(Duration(minutes: offsets[0])),
      sunrise: sunrise.add(Duration(minutes: offsets[1])),
      dhuhr: dhuhr.add(Duration(minutes: offsets[2])),
      asr: asr.add(Duration(minutes: offsets[3])),
      maghrib: maghrib.add(Duration(minutes: offsets[4])),
      isha: isha.add(Duration(minutes: offsets[5])),
    );
  }

  /// Adjusts the prayer times for Daylight Saving Time (DST).
  PrayerTime adjustDST() {
    final timeZoneOffset = DateTime.now().timeZoneOffset;

    return copyWith(
      fajr: fajr.add(timeZoneOffset),
      sunrise: sunrise.add(timeZoneOffset),
      dhuhr: dhuhr.add(timeZoneOffset),
      asr: asr.add(timeZoneOffset),
      maghrib: maghrib.add(timeZoneOffset),
      isha: isha.add(timeZoneOffset),
    );
  }

  /// Returns a list of formatted prayer time strings.
  List<String> formatPrayerTime({
    format = TimeFormat.time24,
    locale = const Locale('en'),
  }) {
    return [
      fajr.format(format, locale),
      sunrise.format(format, locale),
      dhuhr.format(format, locale),
      asr.format(format, locale),
      maghrib.format(format, locale),
      isha.format(format, locale),
    ];
  }

  /// Returns the index of the next prayer time.
  int nextPrayerTimeIndex() {
    final DateTime now = DateTime.now();
    for (int i = 0; i < 6; i++) {
      if (this[i].isAfter(now)) {
        return i;
      }
    }
    return -1;
  }

  /// Calculates the duration until the next prayer time.
  ///
  /// Returns a [Duration] object representing the time interval
  /// until the next prayer.
  Duration nextPrayerTimeInterval() {
    final int index = nextPrayerTimeIndex();
    if (index == -1) {
      return fajr.add(Duration(days: 1)).difference(DateTime.now());
    }
    return this[index].difference(DateTime.now());
  }

  /// Returns the remaining time until the next prayer.
  String nextPrayerTimeRemaining() {
    Duration time = nextPrayerTimeInterval();
    final int hour = time.inHours;
    time -= Duration(hours: hour);
    final int minute = time.inMinutes;
    time -= Duration(minutes: minute);
    final int second = time.inSeconds;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }

  /// Returns the `DateTime` object at the specified index.
  ///
  /// Throws an `IndexError` if the index is out of bounds.
  DateTime operator [](int i) {
    final List<DateTime> prayers = [fajr, sunrise, dhuhr, asr, maghrib, isha];
    return i < 0 ? prayers[5] : prayers[i];
  }
}
