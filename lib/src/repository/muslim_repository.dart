import 'package:flutter/foundation.dart';
import 'package:muslim_data_flutter/src/db_service/db_service.dart';
import 'package:muslim_data_flutter/src/models/azkars/azkar_category.dart';
import 'package:muslim_data_flutter/src/models/azkars/azkar_chapter.dart';
import 'package:muslim_data_flutter/src/models/azkars/azkar_item.dart';
import 'package:muslim_data_flutter/src/models/language.dart';
import 'package:muslim_data_flutter/src/models/location/location.dart';
import 'package:muslim_data_flutter/src/models/names/names_of_allah.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/calculated_prayer_time.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/prayer_attribute.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/prayer_time.dart';

/// A repository class responsible for handling Muslim-related data operations.
class MuslimRepository {
  MuslimRepository._internal(this._dbService);
  factory MuslimRepository() => _instance;

  static final MuslimRepository _instance = MuslimRepository._internal(
    DbService(),
  );

  final DbService _dbService;

  /// Search for locations by the given [locationName].
  /// Returns a list of locations that match the search query.
  Future<List<Location>> searchLocations(String locationName) async {
    try {
      return await _dbService.searchLocations(locationName);
    } catch (e) {
      debugPrint('Error searching locations from the database: $e');
      return [];
    }
  }

  /// Get the location by the given [countryCode] and [locationName].
  /// Returns the location if found, otherwise returns null.
  Future<Location?> geocoder(String countryCode, String locationName) async {
    try {
      return await _dbService.geocoder(countryCode, locationName);
    } catch (e) {
      debugPrint('Error geocoding location from the database: $e');
      return null;
    }
  }

  /// Get the location by the given [countryCode] and [locationName].
  /// Returns the location if found, otherwise returns null.
  Future<Location?> reverseGeocoder(double latitude, double longitude) async {
    try {
      return await _dbService.reverseGeocoder(latitude, longitude);
    } catch (e) {
      debugPrint('Error reverse geocoding location from the database: $e');
      return null;
    }
  }

  /// Get prayer times for the specified [location], [date], and [attribute].
  Future<PrayerTime?> getPrayerTimes(
    Location location,
    DateTime date,
    PrayerAttribute attribute,
  ) async {
    try {
      PrayerTime prayerTime;

      if (location.hasFixedPrayerTime) {
        final fixedPrayer = await _dbService.getPrayerTimes(
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

      prayerTime = _applyOffset(prayerTime, attribute.offset);
      return prayerTime;
    } catch (e) {
      debugPrint('Error fetching prayer times: $e');
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
    final standardOffset =
        januaryOffset < julyOffset ? januaryOffset : julyOffset;

    // DST is active if the current offset is greater than the standard offset
    return now.timeZoneOffset > standardOffset;
  }

  /// Get the names of Allah for the specified [language].
  Future<List<NameOfAllah>> getNames(Language language) async {
    try {
      return await _dbService.getNames(language.value);
    } catch (e) {
      debugPrint('Error fetching names from the database: $e');
      return [];
    }
  }

  /// Get azkar categories for the specified [language].
  Future<List<AzkarCategory>> getAzkarCategories(Language language) async {
    try {
      return await _dbService.getAzkarCategories(language.value);
    } catch (e) {
      debugPrint('Error fetching azkar categories from the database: $e');
      return [];
    }
  }

  /// Get azkar chapters for the specified [language] and [categoryId].
  /// If [categoryId] is not provided, all azkar chapters will be returned.
  Future<List<AzkarChapter>> getAzkarChapters(
    Language language, [
    int categoryId = -1,
  ]) async {
    try {
      return await _dbService.getAzkarChapters(language.value, categoryId);
    } catch (e) {
      debugPrint('Error fetching azkar chapters from the database: $e');
      return [];
    }
  }

  /// Get azkar chapters for the specified [language] and [chapterIds].
  Future<List<AzkarChapter>> getAzkarChaptersByIds(
    Language language,
    List<int> chapterIds,
  ) async {
    try {
      return await _dbService.getAzkarChaptersByIds(language.value, chapterIds);
    } catch (e) {
      debugPrint('Error fetching azkar chapters by ids from the database: $e');
      return [];
    }
  }

  /// Get azkar items for the specified azkar [chapterId] and [language].
  Future<List<AzkarItem>> getAzkarItems(
    int chapterId,
    Language language,
  ) async {
    try {
      return await _dbService.getAzkarItems(chapterId, language.value);
    } catch (e) {
      debugPrint('Error fetching azkar items from the database: $e');
      return [];
    }
  }
}
