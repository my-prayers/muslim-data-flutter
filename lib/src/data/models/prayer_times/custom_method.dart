/// A model representing custom prayer time calculation method.
class CustomMethod {
  final double fajrAngle;
  final double ishaAngle;

  const CustomMethod({this.fajrAngle = 18.0, this.ishaAngle = 17.0});

  List<double> get angles => [fajrAngle, 1.0, 0.0, 0.0, ishaAngle];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomMethod &&
        other.fajrAngle == fajrAngle &&
        other.ishaAngle == ishaAngle;
  }

  @override
  int get hashCode => Object.hash(fajrAngle, ishaAngle);

  @override
  String toString() =>
      'CustomMethod(fajrAngle: $fajrAngle, ishaAngle: $ishaAngle)';
}
