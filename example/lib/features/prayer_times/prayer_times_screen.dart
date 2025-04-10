import 'package:example/features/location/location_manager.dart';
import 'package:example/features/prayer_times/widget/location_info.dart';
import 'package:example/features/prayer_times/widget/prayer_list.dart';
import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  PrayerTime? _prayerTime;

  @override
  void initState() {
    super.initState();
    // Load the initial location when the screen is initialized.
    LocationManager.loadLocation();
  }

  /// Fetches the prayer times for the given location.
  Future<void> _updatePrayerTimes(Location location) async {
    final date = DateTime.now();
    final attribute = PrayerAttribute(
      calculationMethod: CalculationMethod.mwl,
      asrMethod: AsrMethod.shafii,
      higherLatitudeMethod: HigherLatitudeMethod.angleBased,
    );

    final muslimRepo = MuslimRepository();
    final prayerTime = await muslimRepo.getPrayerTimes(
      location: location,
      date: date,
      attribute: attribute,
    );
    setState(() {
      _prayerTime = prayerTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: StreamBuilder<Location>(
          stream: LocationManager.locationStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('Location Not Available'));
            }

            final location = snapshot.data!;
            _updatePrayerTimes(
              location,
            ); // Update prayer times when location changes

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text('Location', style: Theme.of(context).textTheme.labelLarge),
                LocationInfo(location: location),
                const SizedBox(height: 32),
                Text(
                  'Prayer Times',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                if (_prayerTime == null)
                  const Center(child: CircularProgressIndicator())
                else
                  PrayerList(prayerTime: _prayerTime!),
              ],
            );
          },
        ),
      ),
    );
  }
}
