import 'dart:ui';

import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:muslim_data_flutter/src/data/database/muslim_db.dart';

import '../data/database/muslim_dao.dart';

/// Base repository class for Muslim data operations.
abstract class MuslimRepository {
  final MuslimDao dbDao;

  MuslimRepository({MuslimDao? dbDao})
    : dbDao = dbDao ?? MuslimDao(db: MuslimDb());

  /// List of supported locales.
  List<Locale> get supportedLocales => Language.supportedLocales;
}
