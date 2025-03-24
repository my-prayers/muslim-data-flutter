/// Location model that holds all information about a prayer location.
class Location {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String countryCode;
  final String countryName;
  final bool hasFixedPrayerTime;
  final int? prayerDependentId;

  const Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.countryCode,
    required this.countryName,
    required this.hasFixedPrayerTime,
    this.prayerDependentId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location &&
        other.id == id &&
        other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.countryCode == countryCode &&
        other.countryName == countryName &&
        other.hasFixedPrayerTime == hasFixedPrayerTime &&
        other.prayerDependentId == prayerDependentId;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      latitude,
      longitude,
      countryCode,
      countryName,
      hasFixedPrayerTime,
      prayerDependentId,
    );
  }

  @override
  String toString() {
    return 'Location(id: $id, name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, countryName: $countryName, hasFixedPrayerTime: $hasFixedPrayerTime, prayerDependentId: $prayerDependentId)';
  }
}
