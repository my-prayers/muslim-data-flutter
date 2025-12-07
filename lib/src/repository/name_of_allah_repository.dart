import 'dart:ui';

import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_dao.dart';
import 'package:muslim_data_flutter/src/repository/muslim_repository.dart';

/// Repository for accessing the 99 Names of Allah data.
class NameOfAllahRepository extends MuslimRepository {
  NameOfAllahRepository._internal({super.dbDao});

  static NameOfAllahRepository? _instance;

  factory NameOfAllahRepository({MuslimDao? dao}) {
    _instance ??= NameOfAllahRepository._internal(dbDao: dao);
    return _instance!;
  }

  /// Get the names of Allah for the specified [language].
  Future<List<NameOfAllah>> getNames({Locale? language}) async {
    try {
      return await dbDao.getNames(Language.fromLocale(language));
    } catch (e) {
      return [];
    }
  }
}
