import 'asr_method.dart';
import 'calculation_method.dart';
import 'higher_latitude_method.dart';

/// Prayer attribute that holds all information to create prayer times object.
class PrayerAttribute {
  final CalculationMethod calculationMethod;
  final AsrMethod asrMethod;
  final HigherLatitudeMethod higherLatitudeMethod;
  final List<int> offset;

  const PrayerAttribute({
    this.calculationMethod = CalculationMethod.makkah,
    this.asrMethod = AsrMethod.shafii,
    this.higherLatitudeMethod = HigherLatitudeMethod.angleBased,
    this.offset = const [0, 0, 0, 0, 0, 0],
  });

  PrayerAttribute copyWith({
    CalculationMethod? calculationMethod,
    AsrMethod? asrMethod,
    HigherLatitudeMethod? higherLatitudeMethod,
    List<int>? offset,
  }) {
    return PrayerAttribute(
      calculationMethod: calculationMethod ?? this.calculationMethod,
      asrMethod: asrMethod ?? this.asrMethod,
      higherLatitudeMethod: higherLatitudeMethod ?? this.higherLatitudeMethod,
      offset: offset ?? this.offset,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrayerAttribute &&
        other.calculationMethod == calculationMethod &&
        other.asrMethod == asrMethod &&
        other.higherLatitudeMethod == higherLatitudeMethod &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    return Object.hash(
      calculationMethod,
      asrMethod,
      higherLatitudeMethod,
      Object.hashAll(offset),
    );
  }

  @override
  String toString() {
    return 'PrayerAttribute(calculationMethod: $calculationMethod, asrMethod: $asrMethod, higherLatitudeMethod: $higherLatitudeMethod, offset: $offset)';
  }
}
