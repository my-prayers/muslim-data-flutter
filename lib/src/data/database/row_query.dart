import 'package:muslim_data_flutter/src/data/models/language.dart';
import 'package:muslim_data_flutter/src/utils/locale_utils.dart';

/// A class that contains all the queries used in the database.
class RowQuery {
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
  static String namesQuery(Language language) {
    return "SELECT name._id AS id, name.name, "
        "transl.translation AS translation, "
        "transl.transliteration AS transliteration "
        "FROM name_translation AS transl "
        "INNER JOIN name ON name._id = transl.name_id "
        "WHERE transl.language='${language.locale.toCode()}'";
  }

  /// Query to get the azkar categories for the specified [language].
  static String azkarCategoriesQuery(Language language) {
    return "SELECT category._id AS categoryId, category_name AS categoryName "
        "FROM azkar_category AS category "
        "INNER JOIN azkar_category_translation AS transl ON transl.category_id = category._id "
        "WHERE language = '${language.locale.toCode()}'";
  }

  /// Query to get the azkar chapters for the specified [language] and [categoryId].
  /// If [categoryId] is -1, then all chapters will be returned.
  static String azkarChaptersQuery(Language language, int categoryId) {
    return "SELECT chapter._id AS chapterId, chapter.category_id AS categoryId, "
        "cat_transl.category_name AS categoryName, chapter_name AS chapterName "
        "FROM azkar_chapter AS chapter "
        "INNER JOIN azkar_chapter_translation AS transl ON transl.chapter_id = chapter._id "
        "INNER JOIN azkar_category_translation AS cat_transl ON cat_transl.category_id = chapter.category_id "
        "AND cat_transl.language = transl.language "
        "WHERE transl.language='${language.locale.toCode()}' ${categoryId != 1 ? "AND chapter.category_id=$categoryId" : ""}";
  }

  /// Query to get the azkar chapters for the specified [language] and [chapterIds].
  static String azkarChaptersQueryByIds(
    Language language,
    List<int> chapterIds,
  ) {
    return "SELECT chapter._id AS chapterId, chapter.category_id AS categoryId, "
        "cat_transl.category_name AS categoryName, chapter_name AS chapterName "
        "FROM azkar_chapter AS chapter "
        "INNER JOIN azkar_chapter_translation AS transl ON transl.chapter_id = chapter._id "
        "INNER JOIN azkar_category_translation AS cat_transl ON cat_transl.category_id = chapter.category_id "
        "AND cat_transl.language = transl.language "
        "WHERE transl.language='${language.locale.toCode()}' AND chapter._id IN (${chapterIds.join(',')})";
  }

  /// Query to search azkar chapters for the specified [language] and [query].
  static String searchAzkarChaptersQuery(Language language, String query) {
    return "SELECT chapter._id AS chapterId, chapter.category_id AS categoryId, "
        "cat_transl.category_name AS categoryName, chapter_name AS chapterName "
        "FROM azkar_chapter AS chapter "
        "INNER JOIN azkar_chapter_translation AS transl ON transl.chapter_id = chapter._id "
        "INNER JOIN azkar_category_translation AS cat_transl ON cat_transl.category_id = chapter.category_id "
        "AND cat_transl.language = transl.language "
        "WHERE transl.language='${language.locale.toCode()}' "
        "AND (transl.chapter_name LIKE '%$query%' OR cat_transl.category_name LIKE '%$query%')";
  }

  /// Query to get the azkar items for the specified [language] and [chapterId].
  static String azkarItemsQuery(Language language, int chapterId) {
    return "SELECT item._id AS itemId, item.chapter_id AS chapterId, item.item, "
        "item.transliteration, item.count, transl.top_note AS topNote, transl.bottom_note AS bottomNote, "
        "transl.item_translation AS translation, transl.reference "
        "FROM azkar_item AS item "
        "INNER JOIN azkar_item_translation AS transl ON transl.item_id = item._id "
        "WHERE chapterId = $chapterId AND transl.language = '${language.locale.toCode()}'";
  }

  /// Query to get the list of locations with fixed prayer times.
  static String fixedPrayerTimesListQuery() {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "WHERE has_fixed_prayer_time = 1";
  }
}
