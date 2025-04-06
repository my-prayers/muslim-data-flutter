import 'dart:math';

import '../../../utils/string_date.dart';
import '../location/location.dart';
import 'calculation_method.dart';
import 'higher_latitude_method.dart';
import 'prayer_attribute.dart';
import 'prayer_time.dart';

class CalculatedPrayerTime {
  final PrayerAttribute attribute;

  // Global Variables
  double lat = 0.0; // latitude
  double lng = 0.0; // longitude
  double timeZone = 0.0; // time-zone
  double jDate = 0.0; // Julian date
  final String invalidTime = "-----"; // The string used for invalid times
  int numIterations = 1; // number of iterations needed to compute times

  // Method Parameters
  late Map<CalculationMethod, List<double>> methodParams;

  CalculatedPrayerTime(this.attribute) {
    methodParams = CalculationMethod.methodList();
  }

  // Trigonometric Functions
  double fixAngle(double a) {
    a -= 360 * (a / 360.0).floor();
    return a < 0 ? a + 360 : a;
  }

  double fixHour(double a) {
    a -= 24.0 * (a / 24.0).floor();
    return a < 0 ? a + 24 : a;
  }

  double radiansToDegrees(double alpha) => alpha * 180.0 / pi;

  double degreesToRadians(double alpha) => alpha * pi / 180.0;

  double dSin(double d) => sin(degreesToRadians(d));

  double dCos(double d) => cos(degreesToRadians(d));

  double dTan(double d) => tan(degreesToRadians(d));

  double dArcSin(double x) => radiansToDegrees(asin(x));

  double dArcCos(double x) => radiansToDegrees(acos(x));

  double dArcTan2(double y, double x) => radiansToDegrees(atan2(y, x));

  double dArcCot(double x) => radiansToDegrees(atan2(1.0, x));

  // Julian Date Functions
  double julianDate(int year, int month, int day) {
    if (month <= 2) {
      year -= 1;
      month += 12;
    }
    final a = (year / 100.0).floor();
    final b = 2 - a + (a / 4.0).floor();
    return ((365.25 * (year + 4716)).floor() +
            (30.6001 * (month + 1)).floor() +
            day +
            b) -
        1524.5;
  }

  // Calculation Functions
  List<double> sunPosition(double jd) {
    final d1 = jd - 2451545;
    final g = fixAngle(357.529 + 0.98560028 * d1);
    final q = fixAngle(280.459 + 0.98564736 * d1);
    final l = fixAngle(q + 1.915 * dSin(g) + 0.020 * dSin(2 * g));

    final e = 23.439 - 0.00000036 * d1;
    final d2 = dArcSin(dSin(e) * dSin(l));
    var ra = dArcTan2(dCos(e) * dSin(l), dCos(l)) / 15.0;
    ra = fixHour(ra);
    final eqt = q / 15.0 - ra;
    return [d2, eqt];
  }

  double equationOfTime(double jd) => sunPosition(jd)[1];

  double sunDeclination(double jd) => sunPosition(jd)[0];

  double computeMidDay(double t) {
    final eqt = equationOfTime(jDate + t);
    return fixHour(12 - eqt);
  }

  double computeTime(double G, double t) {
    final d = sunDeclination(jDate + t);
    final z = computeMidDay(t);
    final beg = -dSin(G) - dSin(d) * dSin(lat);
    final mid = dCos(d) * dCos(lat);
    final v = dArcCos(beg / mid) / 15.0;
    return z + (G > 90 ? -v : v);
  }

  double computeAsr(double step, double t) {
    final d = sunDeclination(jDate + t);
    final g = -dArcCot(step + dTan((lat - d).abs()));
    return computeTime(g, t);
  }

  double timeDiff(double time1, double time2) => fixHour(time2 - time1);

  // Interface Functions
  PrayerTime? getPrayerTimes(
    Location location,
    DateTime date, {
    double? timezone,
  }) {
    final year = date.year;
    final month = date.month;
    final day = date.day;
    timeZone = timezone ?? date.timeZoneOffset.inHours.toDouble();

    lat = location.latitude;
    lng = location.longitude;
    jDate = julianDate(year, month, day);
    final lonDiff = location.longitude / (15.0 * 24.0);
    jDate -= lonDiff;

    try {
      final cTime = computeDayTimes();
      return PrayerTime(
        fajr: cTime[0].toDate(date),
        sunrise: cTime[1].toDate(date),
        dhuhr: cTime[2].toDate(date),
        asr: cTime[3].toDate(date),
        maghrib: cTime[4].toDate(date),
        isha: cTime[5].toDate(date),
      );
    } catch (e) {
      return null;
    }
  }

  String floatToTime24(double time) {
    if (time.isNaN) return invalidTime;

    time = fixHour(time + 0.5 / 60.0);
    final hours = time.floor();
    final minutes = ((time - hours) * 60.0).floor();
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  List<double> computeTimes(List<double> times) {
    final t = dayPortion(times);
    final fajr = computeTime(
      180 - methodParams[attribute.calculationMethod]![0],
      t[0],
    );
    final sunrise = computeTime(180 - 0.833, t[1]);
    final dhuhr = computeMidDay(t[2]);
    final asr = computeAsr(1 + attribute.asrMethod.value.toDouble(), t[3]);
    final sunset = computeTime(0.833, t[4]);
    final maghrib = computeTime(
      methodParams[attribute.calculationMethod]![2],
      t[5],
    );
    final isha = computeTime(
      methodParams[attribute.calculationMethod]![4],
      t[6],
    );
    return [fajr, sunrise, dhuhr, asr, sunset, maghrib, isha];
  }

  List<String> computeDayTimes() {
    var times = [5.0, 6.0, 12.0, 13.0, 18.0, 18.0, 18.0];
    for (var i = 0; i < numIterations; i++) {
      times = computeTimes(times);
    }
    times = adjustTimes(times);
    return adjustTimesFormat(times);
  }

  List<double> adjustTimes(List<double> times) {
    for (var i = 0; i < times.length; i++) {
      times[i] += timeZone - lng / 15;
    }
    if (methodParams[attribute.calculationMethod]![1] == 1.0) {
      times[5] = times[4] + methodParams[attribute.calculationMethod]![2] / 60;
    }
    if (methodParams[attribute.calculationMethod]![3] == 1.0) {
      times[6] = times[5] + methodParams[attribute.calculationMethod]![4] / 60;
    }
    if (attribute.higherLatitudeMethod != HigherLatitudeMethod.none) {
      times = adjustHighLatTimes(times);
    }
    return times;
  }

  List<String> adjustTimesFormat(List<double> times) {
    final result = times.map(floatToTime24).toList();
    result.removeAt(4); // Remove sunset
    return result;
  }

  List<double> adjustHighLatTimes(List<double> times) {
    final nightTime = timeDiff(times[4], times[1]);

    final fajrDiff =
        nightPortion(methodParams[attribute.calculationMethod]![0]) * nightTime;
    if (times[0].isNaN || timeDiff(times[0], times[1]) > fajrDiff) {
      times[0] = times[1] - fajrDiff;
    }

    final ishaAngle =
        methodParams[attribute.calculationMethod]![3] == 0.0
            ? methodParams[attribute.calculationMethod]![4]
            : 18.0;
    final ishaDiff = nightPortion(ishaAngle) * nightTime;
    if (times[6].isNaN || timeDiff(times[4], times[6]) > ishaDiff) {
      times[6] = times[4] + ishaDiff;
    }

    final maghribAngle =
        methodParams[attribute.calculationMethod]![1] == 0.0
            ? methodParams[attribute.calculationMethod]![2]
            : 4.0;
    final maghribDiff = nightPortion(maghribAngle) * nightTime;
    if (times[5].isNaN || timeDiff(times[4], times[5]) > maghribDiff) {
      times[5] = times[4] + maghribDiff;
    }

    return times;
  }

  double nightPortion(double angle) {
    switch (attribute.higherLatitudeMethod) {
      case HigherLatitudeMethod.angleBased:
        return angle / 60.0;
      case HigherLatitudeMethod.midNight:
        return 0.5;
      case HigherLatitudeMethod.oneSeven:
        return 0.14286;
      case HigherLatitudeMethod.none:
        return 0.0;
    }
  }

  List<double> dayPortion(List<double> times) {
    return times.map((time) => time / 24.0).toList();
  }
}
