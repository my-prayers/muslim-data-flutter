import 'package:muslim_data_flutter/db_service/app_database.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_category.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_chapter.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_item.dart';
import 'package:muslim_data_flutter/models/location/location.dart';
import 'package:muslim_data_flutter/models/names/names_of_allah.dart';
import 'package:muslim_data_flutter/models/prayer_times/prayer_time.dart';
import 'package:muslim_data_flutter/utils/date_utils.dart';
import 'package:muslim_data_flutter/utils/string_date.dart';

/// A service class responsible for handling database operations.
class DbService {
  final AppDatabase _db;

  DbService(this._db);

  /// Search for locations in the database by the given [locationName].
  Future<List<Location>> searchLocations(String locationName) async {
    return await _db
        .customSelect(_RowQuery.searchLocationsQuery(locationName))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
          );
        })
        .get();
  }

  /// Get the location by the given [countryCode] and [locationName].
  Future<Location?> geocoder(String countryCode, String locationName) async {
    return await _db
        .customSelect(_RowQuery.geocoderQuery(countryCode, locationName))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
          );
        })
        .getSingleOrNull();
  }

  /// Get the location by the given [latitude] and [longitude].
  Future<Location?> reverseGeocoder(double latitude, double longitude) async {
    return await _db
        .customSelect(_RowQuery.reverseGeocoderQuery(latitude, longitude))
        .map((row) {
          return Location(
            id: row.read<int>('id'),
            name: row.read<String>('name'),
            latitude: row.read<double>('latitude'),
            longitude: row.read<double>('longitude'),
            countryCode: row.read<String>('countryCode'),
            countryName: row.read<String>('countryName'),
            hasFixedPrayerTime: row.read<bool>('hasFixedPrayerTime'),
          );
        })
        .getSingleOrNull();
  }

  /// Get prayer times for the specified user's location and date in the database.
  Future<PrayerTime?> getPrayerTimes(int locationId, DateTime date) async {
    return await _db
        .customSelect(_RowQuery.prayerTimesQuery(locationId, date.toDbDate()))
        .map((row) {
          return PrayerTime(
            row.read<String>('fajr').toDate(date),
            row.read<String>('sunrise').toDate(date),
            row.read<String>('dhuhr').toDate(date),
            row.read<String>('asr').toDate(date),
            row.read<String>('maghrib').toDate(date),
            row.read<String>('isha').toDate(date),
          );
        })
        .getSingleOrNull();
  }

  /// Get the names of Allah from the database for the specified [language].
  Future<List<NameOfAllah>> getNames(String language) async {
    return await _db.customSelect(_RowQuery.namesQuery(language)).map((row) {
      return NameOfAllah(
        id: row.read<int>('nameId'),
        name: row.read<String>('name'),
        translation: row.read<String>('translation'),
      );
    }).get();
  }

  /// Get the azkar categories from the database for the specified [language].
  Future<List<AzkarCategory>> getAzkarCategories(String language) async {
    return await _db.customSelect(_RowQuery.azkarCategoriesQuery(language)).map(
      (row) {
        return AzkarCategory(
          id: row.read<int>('categoryId'),
          name: row.read<String>('categoryName'),
        );
      },
    ).get();
  }

  /// Get the azkar chapters from the database for the specified [language] and [categoryId].
  Future<List<AzkarChapter>> getAzkarChapters(
    String language,
    int categoryId,
  ) async {
    return await _db
        .customSelect(_RowQuery.azkarChaptersQuery(language, categoryId))
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
        .customSelect(_RowQuery.azkarChaptersQueryByIds(language, chapterIds))
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
        .customSelect(_RowQuery.azkarItemsQuery(chapterId, language))
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
}

/// A class that contains all the queries used in the database.
class _RowQuery {
  /// Query to search for locations in the database by the given [location].
  static String searchLocationsQuery(String location) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "WHERE location.name like '$location%'";
  }

  /// Query to get the location by the given [countryCode] and [locationName].
  static String geocoderQuery(String countryCode, String locationName) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "WHERE country.code='$countryCode'  COLLATE NOCASE "
        "AND location.name='$locationName' COLLATE NOCASE";
  }

  /// Query to get the location by the given [latitude] and [longitude].
  static String reverseGeocoderQuery(double latitude, double longitude) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "ORDER BY abs(latitude - $latitude) + abs(longitude - $longitude) "
        "LIMIT 1";
  }

  /// Query to get the prayer times for the specified user's location and date.
  static String prayerTimesQuery(int locationId, String date) {
    return "SELECT * FROM prayer_time WHERE location_id=$locationId AND date='$date'";
  }

  /// Query to get the names of Allah for the specified [language].
  static String namesQuery(String language) {
    return "SELECT name_translation.name_id AS nameId, "
        "name_translation.name AS translation, name.name "
        "FROM name_translation "
        "INNER JOIN name ON name._id = name_translation.name_id "
        "WHERE name_translation.language='$language'";
  }

  /// Query to get the azkar categories for the specified [language].
  static String azkarCategoriesQuery(String language) {
    return "SELECT category._id AS categoryId, category_name AS categoryName "
        "FROM azkar_category AS category "
        "INNER JOIN azkar_category_translation AS transl ON transl.category_id = category._id "
        "WHERE language = '$language'";
  }

  /// Query to get the azkar chapters for the specified [language] and [categoryId].
  /// If [categoryId] is -1, then all chapters will be returned.
  static String azkarChaptersQuery(String language, int categoryId) {
    return "SELECT chapter._id AS chapterId, category_id AS categoryId, "
        "chapter_name AS chapterName "
        "FROM azkar_chapter AS chapter "
        "INNER JOIN azkar_chapter_translation AS transl ON transl.chapter_id = chapter._id "
        "WHERE language='$language' "
        "${categoryId != -1 ? "AND category_id=$categoryId" : ""}";
  }

  /// Query to get the azkar chapters for the specified [language] and [chapterIds].
  static String azkarChaptersQueryByIds(String language, List<int> chapterIds) {
    return "SELECT chapter._id AS chapterId, category_id AS categoryId, "
        "chapter_name AS chapterName "
        "FROM azkar_chapter AS chapter "
        "INNER JOIN azkar_chapter_translation AS transl ON transl.chapter_id = chapter._id "
        "WHERE language='$language' AND category_id IN (${chapterIds.join(',')})";
  }

  /// Query to get the azkar items for the specified [chapterId] and [language].
  static String azkarItemsQuery(int chapterId, String language) {
    return "SELECT item._id AS itemId, item.chapter_id AS chapterId, item.item, "
        "transl.item_translation AS translation, ref_transl.reference "
        "FROM azkar_item AS item "
        "INNER JOIN azkar_item_translation AS transl ON transl.item_id = item._id "
        "INNER JOIN azkar_reference AS ref ON ref.item_id = item._id "
        "INNER JOIN azkar_reference_translation AS ref_transl ON ref_transl.reference_id = ref._id AND "
        "ref_transl.language = transl.language "
        "WHERE chapterId = $chapterId AND transl.language = '$language'";
  }
}
