import 'package:muslim_data_flutter/db_service/db_service.dart';
import 'package:muslim_data_flutter/models/prayer_times/prayer_time.dart';
import 'package:muslim_data_flutter/utils/date_utils.dart';
import 'package:muslim_data_flutter/utils/string_date.dart';

/// A repository class responsible for handling Muslim-related data operations.
class MuslimRepository {
  MuslimRepository(this._dbService);

  final DbService _dbService;

  /// Get the prayer times for the specified [locationId] and [date].
  Future<PrayerTime?> getPrayerTimes(int locationId, DateTime date) async {
    final String formattedDate = date.toDbDate();

    try {
      final prayerTimeRecord = await _dbService.getPrayerTimes(
        locationId,
        formattedDate,
      );

      if (prayerTimeRecord != null) {
        return PrayerTime(
          prayerTimeRecord.fajr.toDate(date),
          prayerTimeRecord.sunrise.toDate(date),
          prayerTimeRecord.dhuhr.toDate(date),
          prayerTimeRecord.asr.toDate(date),
          prayerTimeRecord.maghrib.toDate(date),
          prayerTimeRecord.isha.toDate(date),
        );
      } else {
        throw Exception(
          'No prayer times found for the given location and date',
        );
      }
    } catch (e) {
      throw Exception('Error fetching prayer times from the database: $e');
    }
  }

  /// Applies the given list of [offsets] to the prayer times.
  // PrayerTime applyOffset(List<int> offsets) {
  //   return copyWith(
  //     fajr: fajr.add(Duration(minutes: offsets[0])),
  //     sunrise: sunrise.add(Duration(minutes: offsets[1])),
  //     dhuhr: dhuhr.add(Duration(minutes: offsets[2])),
  //     asr: asr.add(Duration(minutes: offsets[3])),
  //     maghrib: maghrib.add(Duration(minutes: offsets[4])),
  //     isha: isha.add(Duration(minutes: offsets[5])),
  //   );
  // }

  /// Adjusts the prayer times for Daylight Saving Time (DST).
  // PrayerTime adjustDST() {
  //   final timeZoneOffset = DateTime.now().timeZoneOffset;

  //   return copyWith(
  //     fajr: fajr.add(timeZoneOffset),
  //     sunrise: sunrise.add(timeZoneOffset),
  //     dhuhr: dhuhr.add(timeZoneOffset),
  //     asr: asr.add(timeZoneOffset),
  //     maghrib: maghrib.add(timeZoneOffset),
  //     isha: isha.add(timeZoneOffset),
  //   );
  // }
}
