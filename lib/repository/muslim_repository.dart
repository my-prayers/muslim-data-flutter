import 'package:flutter/cupertino.dart';
import 'package:muslim_data_flutter/db_service/db_service.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_category.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_chapter.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_item.dart';
import 'package:muslim_data_flutter/models/language.dart';
import 'package:muslim_data_flutter/models/location/location.dart';
import 'package:muslim_data_flutter/models/names/names_of_allah.dart';
import 'package:muslim_data_flutter/models/prayer_times/prayer_time.dart';
import 'package:muslim_data_flutter/utils/date_utils.dart';
import 'package:muslim_data_flutter/utils/string_date.dart';

/// A repository class responsible for handling Muslim-related data operations.
class MuslimRepository {
  MuslimRepository(this._dbService);

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
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching prayer times from the database: $e');
      return null;
    }
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
