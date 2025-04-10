import 'package:flutter/material.dart';

class PrayerItem extends StatelessWidget {
  const PrayerItem({required this.name, required this.time, super.key});

  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: Theme.of(context).textTheme.titleLarge),
        Text(time, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
