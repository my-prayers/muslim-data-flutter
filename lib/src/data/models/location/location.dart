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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      countryCode: json['countryCode'] as String,
      countryName: json['countryName'] as String,
      hasFixedPrayerTime: json['hasFixedPrayerTime'] as bool,
      prayerDependentId: json['prayerDependentId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'countryCode': countryCode,
      'countryName': countryName,
      'hasFixedPrayerTime': hasFixedPrayerTime,
      'prayerDependentId': prayerDependentId,
    };
  }

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
