import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

/// A widget that displays the details of a selected location.
class LocationDetail extends StatelessWidget {
  const LocationDetail({
    required this.location,
    this.onSaveLocation,
    super.key,
  });

  final Location location;
  final Function(Location)? onSaveLocation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              'Selected Location',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                Text(
                  '${location.name}, ${location.countryName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (onSaveLocation != null) {
                  onSaveLocation!(location);
                }
              },
              child: const Text('Save Location'),
            ),
          ],
        ),
      ),
    );
  }
}
