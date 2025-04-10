import 'package:example/features/location/location_manager.dart';
import 'package:example/features/prayer_times/widget/location_info.dart';
import 'package:example/features/prayer_times/widget/prayer_list.dart';
import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  /// Fetches the prayer times for the current location and date.
  Future<PrayerTime?> getPrayerTimes() async {
    final location = await LocationManager.loadLocation();
    final date = DateTime.now();
    final attribute = PrayerAttribute(
      calculationMethod: CalculationMethod.mwl,
      asrMethod: AsrMethod.shafii,
      higherLatitudeMethod: HigherLatitudeMethod.angleBased,
    );

    final muslimRepo = MuslimRepository();
    return await muslimRepo.getPrayerTimes(location, date, attribute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FutureBuilder<PrayerTime?>(
          future: getPrayerTimes(),
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text('Location', style: Theme.of(context).textTheme.labelLarge),
                const LocationInfo(),
                const SizedBox(height: 32),
                Text(
                  'Prayer Times',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                if (snapshot.connectionState == ConnectionState.waiting)
                  const Center(child: CircularProgressIndicator())
                else if (snapshot.hasError)
                  Center(child: Text('Error: ${snapshot.error}'))
                else if (snapshot.hasData && snapshot.data != null)
                  PrayerList(prayerTime: snapshot.data!)
                else
                  const Center(child: Text('Not Available')),
              ],
            );
          },
        ),
      ),
    );
  }
}
