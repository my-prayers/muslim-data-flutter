import 'package:example/features/prayer_times/widget/prayer_item.dart';
import 'package:example/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class PrayerList extends StatelessWidget {
  const PrayerList({required this.prayerTime, super.key});

  final PrayerTime prayerTime;

  @override
  Widget build(BuildContext context) {
    final prayerNames = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
    return Column(
      spacing: 16,
      children: [
        for (int i = 0; i < prayerNames.length; i++)
          PrayerItem(
            name: prayerNames[i],
            time: prayerTime[i].toStringHourMinute(),
          ),
      ],
    );
  }
}
