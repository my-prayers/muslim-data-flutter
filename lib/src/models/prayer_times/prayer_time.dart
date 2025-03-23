import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_time.freezed.dart';

@freezed
abstract class PrayerTime with _$PrayerTime {
  const factory PrayerTime(
    DateTime fajr,
    DateTime sunrise,
    DateTime dhuhr,
    DateTime asr,
    DateTime maghrib,
    DateTime isha,
  ) = _PrayerTime;
}
