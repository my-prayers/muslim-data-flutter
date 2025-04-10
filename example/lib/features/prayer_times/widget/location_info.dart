import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({required this.location, super.key});

  final Location location;

  /// This method is used to navigate to the location screen.
  void changeLocation(BuildContext context) {
    StatefulNavigationShell.of(context).goBranch(1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on),
        const SizedBox(width: 8),
        Text(
          '${location.name}, ${location.countryName}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            changeLocation(context);
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
