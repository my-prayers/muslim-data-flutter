import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/calculated_prayer_time.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

/// Repository for accessing prayer time data.
class PrayerTimeRepository extends MuslimRepository {
  PrayerTimeRepository._internal({super.dbDao});

  static PrayerTimeRepository? _instance;

  factory PrayerTimeRepository({MuslimDao? dao}) {
    _instance ??= PrayerTimeRepository._internal(dbDao: dao);
    return _instance!;
  }

  /// Get prayer times for the specified [location], [date], and [attribute].
  Future<PrayerTime?> getPrayerTimes({
    required Location location,
    required DateTime date,
    required PrayerAttribute attribute,
    bool useFixedPrayer = true,
  }) async {
    try {
      PrayerTime? prayerTime;

      if (location.hasFixedPrayerTime && useFixedPrayer) {
        final fixedPrayer = await dbDao.getPrayerTimes(
          location.prayerDependentId ?? location.id,
          date,
        );
        if (fixedPrayer == null) return null;

        prayerTime = _adjustDST(fixedPrayer);
      } else {
        prayerTime = CalculatedPrayerTime(
          attribute,
        ).getPrayerTimes(location, date);
      }

      prayerTime = _applyOffset(prayerTime!, attribute.offset);
      return prayerTime;
    } catch (e) {
      return null;
    }
  }

  /// Applies the given list of [offsets] to the prayer times.
  PrayerTime _applyOffset(PrayerTime prayer, List<int> offsets) {
    return prayer.copyWith(
      fajr: prayer.fajr.add(Duration(minutes: offsets[0])),
      sunrise: prayer.sunrise.add(Duration(minutes: offsets[1])),
      dhuhr: prayer.dhuhr.add(Duration(minutes: offsets[2])),
      asr: prayer.asr.add(Duration(minutes: offsets[3])),
      maghrib: prayer.maghrib.add(Duration(minutes: offsets[4])),
      isha: prayer.isha.add(Duration(minutes: offsets[5])),
    );
  }

  /// Adjusts the prayer times for Daylight Saving Time (DST).
  PrayerTime _adjustDST(PrayerTime prayer) {
    if (_isDst()) {
      return prayer.copyWith(
        fajr: prayer.fajr.add(const Duration(hours: 1)),
        sunrise: prayer.sunrise.add(const Duration(hours: 1)),
        dhuhr: prayer.dhuhr.add(const Duration(hours: 1)),
        asr: prayer.asr.add(const Duration(hours: 1)),
        maghrib: prayer.maghrib.add(const Duration(hours: 1)),
        isha: prayer.isha.add(const Duration(hours: 1)),
      );
    }

    return prayer;
  }

  /// Determines whether Daylight Saving Time (DST) is active.
  bool _isDst() {
    final now = DateTime.now();

    // Determine the standard time offset by comparing offsets in winter and summer
    final january = DateTime(now.year, 1, 15);
    final july = DateTime(now.year, 7, 15);

    final januaryOffset = january.timeZoneOffset;
    final julyOffset = july.timeZoneOffset;

    // The smaller offset is the standard offset (non-DST)
    final standardOffset = januaryOffset < julyOffset
        ? januaryOffset
        : julyOffset;

    // DST is active if the current offset is greater than the standard offset
    return now.timeZoneOffset > standardOffset;
  }
}
