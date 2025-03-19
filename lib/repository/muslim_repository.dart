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
    final String formattedDate = date.formatToDbDate();

    try {
      final prayerTimeRecord = await _dbService.getPrayerTimes(
        locationId,
        formattedDate,
      );

      if (prayerTimeRecord != null) {
        return PrayerTime(
          prayerTimeRecord.fajr.fromDBString(date),
          prayerTimeRecord.sunrise.fromDBString(date),
          prayerTimeRecord.dhuhr.fromDBString(date),
          prayerTimeRecord.asr.fromDBString(date),
          prayerTimeRecord.maghrib.fromDBString(date),
          prayerTimeRecord.isha.fromDBString(date),
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
}
