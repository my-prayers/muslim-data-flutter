import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/asr_method.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/calculation_method.dart';
import 'package:muslim_data_flutter/src/models/prayer_times/higher_latitude_method.dart';

part 'prayer_attribute.freezed.dart';

/// Prayer attribute that holds all information to create prayer times object.
@freezed
abstract class PrayerAttribute with _$PrayerAttribute {
  const factory PrayerAttribute({
    required CalculationMethod calculationMethod,
    required AsrMethod asrMethod,
    required HigherLatitudeMethod higherLatitudeMethod,
    @Default([0, 0, 0, 0, 0, 0]) List<int> offset,
  }) = _PrayerAttribute;
}
