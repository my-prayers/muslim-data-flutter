import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';
import 'package:muslim_data_flutter/src/data/database/row_query.dart';
import 'package:muslim_data_flutter/src/utils/date_utils.dart';
import 'package:muslim_data_flutter/src/utils/string_date.dart';

import '../models/azkars/azkar_category.dart';
import '../models/azkars/azkar_chapter.dart';
import '../models/azkars/azkar_item.dart';
import '../models/location/location.dart';
import '../models/names/names_of_allah.dart';
import '../models/prayer_times/prayer_time.dart';

/// A service class responsible for handling database operations.
class MuslimDao {
  MuslimDao._internal(this._db);

  static MuslimDao? _instance;

  /// Factory method to create a singleton instance of [MuslimDao].
  factory MuslimDao({required MuslimDb db}) {
    _instance ??= MuslimDao._internal(db);
    return _instance!;
  }

  final MuslimDb _db;

  /// Search for locations in the database by the given [locationName].
  Future<List<Location>> searchLocations(String locationName) async {
    return await _db
        .customSelect(RowQuery.searchLocationsQuery(locationName))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
            prayerDependentId: row.read<int?>('prayerDependentId'),
          );
        })
        .get();
  }

  /// Get the location by the given [countryCode] and [locationName].
  Future<Location?> geocoder(String countryCode, String locationName) async {
    return await _db
        .customSelect(RowQuery.geocoderQuery(countryCode, locationName))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
            prayerDependentId: row.read<int?>('prayerDependentId'),
          );
        })
        .getSingleOrNull();
  }

  /// Get the location by the given [latitude] and [longitude].
  Future<Location?> reverseGeocoder(double latitude, double longitude) async {
    return await _db
        .customSelect(RowQuery.reverseGeocoderQuery(latitude, longitude))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
            prayerDependentId: row.read<int?>('prayerDependentId'),
          );
        })
        .getSingleOrNull();
  }

  /// Get prayer times for the specified user's location and date in the database.
  Future<PrayerTime?> getPrayerTimes(int locationId, DateTime date) async {
    return await _db
        .customSelect(RowQuery.prayerTimesQuery(locationId, date.toDbDate()))
        .map((row) {
          return PrayerTime(
            fajr: row.read<String>('fajr').toDate(date),
            sunrise: row.read<String>('sunrise').toDate(date),
            dhuhr: row.read<String>('dhuhr').toDate(date),
            asr: row.read<String>('asr').toDate(date),
            maghrib: row.read<String>('maghrib').toDate(date),
            isha: row.read<String>('isha').toDate(date),
          );
        })
        .getSingleOrNull();
  }

  /// Get the names of Allah from the database for the specified [language].
  Future<List<NameOfAllah>> getNames(String language) async {
    return await _db.customSelect(RowQuery.namesQuery(language)).map((row) {
      return NameOfAllah(
        id: row.read<int>('nameId'),
        name: row.read<String>('name'),
        translation: row.read<String>('translation'),
      );
    }).get();
  }

  /// Get the azkar categories from the database for the specified [language].
  Future<List<AzkarCategory>> getAzkarCategories(String language) async {
    return await _db.customSelect(RowQuery.azkarCategoriesQuery(language)).map((
      row,
    ) {
      return AzkarCategory(
        id: row.read<int>('categoryId'),
        name: row.read<String>('categoryName'),
      );
    }).get();
  }

  /// Get the azkar chapters from the database for the specified [language] and [categoryId].
  Future<List<AzkarChapter>> getAzkarChapters(
    String language,
    int categoryId,
  ) async {
    return await _db
        .customSelect(RowQuery.azkarChaptersQuery(language, categoryId))
        .map((row) {
          return AzkarChapter(
            id: row.read<int>('chapterId'),
            categoryId: row.read<int>('categoryId'),
            name: row.read<String>('chapterName'),
          );
        })
        .get();
  }

  /// Get the azkar chapters from the database for the specified [language] and [chapterIds].
  Future<List<AzkarChapter>> getAzkarChaptersByIds(
    String language,
    List<int> chapterIds,
  ) async {
    return await _db
        .customSelect(RowQuery.azkarChaptersQueryByIds(language, chapterIds))
        .map((row) {
          return AzkarChapter(
            id: row.read<int>('chapterId'),
            categoryId: row.read<int>('categoryId'),
            name: row.read<String>('chapterName'),
          );
        })
        .get();
  }

  /// Get the azkar items from the database for the specified [chapterId] and [language].
  Future<List<AzkarItem>> getAzkarItems(int chapterId, String language) async {
    return await _db
        .customSelect(RowQuery.azkarItemsQuery(chapterId, language))
        .map((row) {
          return AzkarItem(
            id: row.read<int>('itemId'),
            chapterId: row.read<int>('chapterId'),
            item: row.read<String>('item'),
            translation: row.read<String>('translation'),
            reference: row.read<String>('reference'),
          );
        })
        .get();
  }

  /// Get the list of locations with fixed prayer times from the database.
  Future<List<Location>> getFixedPrayerTimesList() async {
    return await _db.customSelect(RowQuery.fixedPrayerTimesListQuery()).map((
      row,
    ) {
      return Location(
        id: row.read<int>('id'),
        name: row.read<String>('name'),
        latitude: row.read<double>('latitude'),
        longitude: row.read<double>('longitude'),
        countryCode: row.read<String>('countryCode'),
        countryName: row.read<String>('countryName'),
        hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
        prayerDependentId: row.read<int?>('prayerDependentId'),
      );
    }).get();
  }
}
