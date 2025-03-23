import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale('en'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PrayerTime? _prayerTime;
  late MuslimRepository muslimRepo;
  var format = DateFormat('hh:mm a', 'ar');

  @override
  void initState() {
    super.initState();
    muslimRepo = MuslimRepository();
  }

  Future<void> _getPrayerTime() async {
    final attribute = PrayerAttribute(
      calculationMethod: CalculationMethod.makkah,
      asrMethod: AsrMethod.shafii,
      higherLatitudeMethod: HigherLatitudeMethod.angleBased,
    );
    final prayer = await muslimRepo.getPrayerTimes(
      Location(
        id: 77359,
        name: 'Erbil',
        latitude: 36.191196,
        longitude: 44.009962,
        countryCode: 'IQ',
        countryName: 'Iraq',
        hasFixedPrayerTime: true,
      ),
      DateTime.now(),
      attribute,
    );

    setState(() {
      _prayerTime = prayer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              format.format(DateTime.now()),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              '$_prayerTime',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPrayerTime,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
