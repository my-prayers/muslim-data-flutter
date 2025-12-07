import 'dart:ui';

import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

/// Repository for accessing azkar data.
class AzkarRepository extends MuslimRepository {
  AzkarRepository._internal({super.dbDao});

  static AzkarRepository? _instance;

  factory AzkarRepository({MuslimDao? dao}) {
    _instance ??= AzkarRepository._internal(dbDao: dao);
    return _instance!;
  }

  /// Get azkar categories for the specified [language].
  Future<List<AzkarCategory>> getAzkarCategories({Locale? language}) async {
    try {
      return await dbDao.getAzkarCategories(Language.fromLocale(language));
    } catch (e) {
      return [];
    }
  }

  /// Get azkar chapters for the specified [language] and [categoryId].
  /// If [categoryId] is not provided, all azkar chapters will be returned.
  Future<List<AzkarChapter>> getAzkarChapters({
    Locale? language,
    int categoryId = -1,
  }) async {
    try {
      return await dbDao.getAzkarChapters(
        Language.fromLocale(language),
        categoryId,
      );
    } catch (e) {
      return [];
    }
  }

  /// Get azkar chapters for the specified [language] and [chapterIds].
  Future<List<AzkarChapter>> getAzkarChaptersByIds({
    Locale? language,
    required List<int> chapterIds,
  }) async {
    try {
      return await dbDao.getAzkarChaptersByIds(
        Language.fromLocale(language),
        chapterIds,
      );
    } catch (e) {
      return [];
    }
  }

  /// Get azkar items for the specified azkar [language] and [chapterId].
  Future<List<AzkarItem>> getAzkarItems({
    Locale? language,
    required int chapterId,
  }) async {
    try {
      return await dbDao.getAzkarItems(
        Language.fromLocale(language),
        chapterId,
      );
    } catch (e) {
      return [];
    }
  }
}
