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
