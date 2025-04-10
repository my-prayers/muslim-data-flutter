import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo({super.key});

  /// This method is used to change the navigation to the location screen.
  void changeLocation(BuildContext context) {
    StatefulNavigationShell.of(context).goBranch(1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on),
        const SizedBox(width: 8),
        Text('Erbil, Iraq', style: Theme.of(context).textTheme.titleLarge),
        const Spacer(),
        TextButton(
          onPressed: () {
            changeLocation(context);
          },
          child: Text('Change'),
        ),
      ],
    );
  }
}
