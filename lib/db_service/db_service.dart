import 'package:drift/drift.dart';
import 'package:muslim_data_flutter/db_service/app_database.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_category.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_chapter.dart';
import 'package:muslim_data_flutter/models/azkars/azkar_item.dart';
import 'package:muslim_data_flutter/models/location/location.dart';
import 'package:muslim_data_flutter/models/names/names_of_allah.dart';

/// A service class responsible for handling database operations.
class DbService {
  final AppDatabase _db;

  DbService(this._db);

  /// Search for locations in the database by the given [locationName].
  Future<List<Location>> searchLocations(String locationName) async {
    final dbLocations =
        await _db.managers.locationTable
            .withReferences((prefetch) => prefetch(countryId: true))
            .filter((f) => f.name.contains('%$locationName%'))
            .get();

    return dbLocations
        .map(
          (e) => Location(
            id: e.$1.id,
            name: e.$1.name,
            latitude: e.$1.latitude,
            longitude: e.$1.longitude,
            countryCode: e.$2.countryId.prefetchedData?.first.code ?? '',
            countryName: e.$2.countryId.prefetchedData?.first.name ?? '',
            hasFixedPrayerTime: e.$1.hasFixedPrayerTime,
          ),
        )
        .toList();
  }

  /// Get the location by the given [countryCode] and [locationName].
  Future<Location?> geocoder(String countryCode, String locationName) async {
    return await _db
        .customSelect(_geocoderQuery(countryCode, locationName))
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

  /// Query to get the location by the given [countryCode] and [locationName].
  String _geocoderQuery(String countryCode, String locationName) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "WHERE country.code='$countryCode'  COLLATE NOCASE "
        "AND location.name='$locationName' COLLATE NOCASE";
  }

  /// Get the location by the given [latitude] and [longitude].
  Future<Location?> reverseGeocoder(double latitude, double longitude) async {
    return await _db
        .customSelect(_reverseGeocoderQuery(latitude, longitude))
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

  /// Query to get the location by the given [latitude] and [longitude].
  String _reverseGeocoderQuery(double latitude, double longitude) {
    return "SELECT location._id AS id, country.code AS countryCode, country.name AS countryName, "
        "location.name AS name, latitude, longitude, "
        "has_fixed_prayer_time AS hasFixedPrayerTime, "
        "prayer_dependent_id AS prayerDependentId "
        "FROM location "
        "INNER JOIN country ON country._id = location.country_id "
        "ORDER BY abs(latitude - $latitude) + abs(longitude - $longitude) "
        "LIMIT 1";
  }

  /// Get prayer times for the specified user's location and date in the database.
  Future<PrayerTimeRecord?> getPrayerTimes(int locationId, String date) async {
    return await _db.managers.prayerTimeTable
        .filter((f) => f.locationId.id(locationId) & f.date.equals(date))
        .getSingleOrNull();
  }

  /// Get the names of Allah from the database for the specified [language].
  Future<List<NameOfAllah>> getNames(String language) async {
    final dbNames =
        await _db.managers.nameTranslationTable
            .withReferences((prefetch) => prefetch(nameId: true))
            .filter((f) => f.language.equals(language))
            .get();

    return dbNames
        .map(
          (e) => NameOfAllah(
            id: e.$2.nameId.prefetchedData?.first.id ?? 0,
            name: e.$2.nameId.prefetchedData?.first.name ?? '',
            translation: e.$1.name,
          ),
        )
        .toList();
  }

  /// Get the azkar categories from the database for the specified [language].
  Future<List<AzkarCategory>> getAzkarCategories(String language) async {
    final dbCategories =
        await _db.managers.azkarCategoryTranslationTable
            .withReferences((prefetch) => prefetch(categoryId: true))
            .filter((f) => f.language.equals(language))
            .get();

    return dbCategories
        .map(
          (e) => AzkarCategory(
            id: e.$2.categoryId.prefetchedData?.first.id ?? 0,
            name: e.$1.categoryName,
          ),
        )
        .toList();
  }

  /// Get the azkar chapters from the database for the specified [language] and [categoryId].
  Future<List<AzkarChapter>> getAzkarChapters(
    String language,
    int categoryId,
  ) async {
    final dbChapters =
        await _db.managers.azkarChapterTranslationTable
            .withReferences((prefetch) => prefetch(chapterId: true))
            .filter(
              (f) =>
                  f.language.equals(language) &
                  f.chapterId.categoryId.equals(categoryId),
            )
            .get();

    return dbChapters
        .map(
          (e) => AzkarChapter(
            id: e.$2.chapterId.prefetchedData?.first.id ?? 0,
            categoryId: e.$2.chapterId.prefetchedData?.first.categoryId ?? 0,
            name: e.$1.chapterName,
          ),
        )
        .toList();
  }

  /// Get the azkar chapters from the database for the specified [language] and [chapterIds].
  Future<List<AzkarChapter>> getAzkarChaptersByIds(
    String language,
    List<int> chapterIds,
  ) async {
    final dbChapters =
        await _db.managers.azkarChapterTranslationTable
            .withReferences((prefetch) => prefetch(chapterId: true))
            .filter(
              (f) =>
                  f.language.equals(language) &
                  f.chapterId.categoryId.isIn(chapterIds),
            )
            .get();

    return dbChapters
        .map(
          (e) => AzkarChapter(
            id: e.$2.chapterId.prefetchedData?.first.id ?? 0,
            categoryId: e.$2.chapterId.prefetchedData?.first.categoryId ?? 0,
            name: e.$1.chapterName,
          ),
        )
        .toList();
  }

  /// Get the azkar items from the database for the specified [chapterId] and [language].
  Future<List<AzkarItem>> getAzkarItems(int chapterId, String language) async {
    return await _db
        .customSelect(
          "SELECT item._id AS itemId, item.chapter_id AS chapterId, item.item, "
          "transl.item_translation AS translation, ref_transl.reference "
          "FROM azkar_item AS item "
          "INNER JOIN azkar_item_translation AS transl ON transl.item_id = item._id "
          "INNER JOIN azkar_reference AS ref ON ref.item_id = item._id "
          "INNER JOIN azkar_reference_translation AS ref_transl ON ref_transl.reference_id = ref._id AND "
          "ref_transl.language = transl.language "
          "WHERE chapterId = $chapterId AND transl.language = '$language'",
        )
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
