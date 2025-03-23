class PrayerTime {
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;

  const PrayerTime({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  PrayerTime copyWith({
    DateTime? fajr,
    DateTime? sunrise,
    DateTime? dhuhr,
    DateTime? asr,
    DateTime? maghrib,
    DateTime? isha,
  }) {
    return PrayerTime(
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      maghrib: maghrib ?? this.maghrib,
      isha: isha ?? this.isha,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrayerTime &&
        other.fajr == fajr &&
        other.sunrise == sunrise &&
        other.dhuhr == dhuhr &&
        other.asr == asr &&
        other.maghrib == maghrib &&
        other.isha == isha;
  }

  @override
  int get hashCode {
    return Object.hash(fajr, sunrise, dhuhr, asr, maghrib, isha);
  }

  @override
  String toString() {
    return 'PrayerTime(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib, isha: $isha)';
  }
}
