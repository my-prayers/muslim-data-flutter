import 'package:muslim_data_flutter/src/data/models/prayer_times/custom_method.dart';

import 'asr_method.dart';
import 'calculation_method.dart';
import 'higher_latitude_method.dart';

/// Prayer attribute that holds all information to create prayer times object.
class PrayerAttribute {
  final CalculationMethod calculationMethod;
  final CustomMethod customMethod;
  final AsrMethod asrMethod;
  final HigherLatitudeMethod higherLatitudeMethod;
  final List<int> offset;

  const PrayerAttribute({
    this.calculationMethod = CalculationMethod.makkah,
    this.customMethod = const CustomMethod(),
    this.asrMethod = AsrMethod.shafii,
    this.higherLatitudeMethod = HigherLatitudeMethod.angleBased,
    this.offset = const [0, 0, 0, 0, 0, 0],
  });

  PrayerAttribute copyWith({
    CalculationMethod? calculationMethod,
    AsrMethod? asrMethod,
    HigherLatitudeMethod? higherLatitudeMethod,
    List<int>? offset,
    CustomMethod? customMethod,
  }) {
    return PrayerAttribute(
      calculationMethod: calculationMethod ?? this.calculationMethod,
      customMethod: customMethod ?? this.customMethod,
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
        other.customMethod == customMethod &&
        other.asrMethod == asrMethod &&
        other.higherLatitudeMethod == higherLatitudeMethod &&
        other.offset == offset;
  }

  @override
  int get hashCode {
    return Object.hash(
      calculationMethod,
      customMethod.hashCode,
      asrMethod,
      higherLatitudeMethod,
      Object.hashAll(offset),
    );
  }

  @override
  String toString() {
    return 'PrayerAttribute(calculationMethod: $calculationMethod, customMethod: $customMethod, asrMethod: $asrMethod, higherLatitudeMethod: $higherLatitudeMethod, offset: $offset)';
  }
}
