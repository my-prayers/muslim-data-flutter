import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

/// Location model that holds all information about a prayer location.
@freezed
abstract class Location with _$Location {
  const factory Location({
    required int id,
    required String name,
    required double latitude,
    required double longitude,
    required String countryCode,
    required String countryName,
    required bool hasFixedPrayerTime,
    int? prayerDependentId,
  }) = _Location;
}
