import 'package:flutter/material.dart';
import 'package:muslim_data_flutter/db_service/app_database.dart';
import 'package:muslim_data_flutter/db_service/db_service.dart';
import 'package:muslim_data_flutter/repository/muslim_repository.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      locale: Locale('en'),
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
  List<String>? _prayerTime;
  final dbService = DbService(AppDatabase());
  late MuslimRepository muslimRepo;

  @override
  void initState() {
    super.initState();
    muslimRepo = MuslimRepository(dbService);
  }

  Future<void> _getPrayerTime() async {
    final prayer = await muslimRepo.getPrayerTimes(77359, DateTime.now());

    setState(() {
      _prayerTime = prayer?.formatPrayerTime();
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
              'Today Prayer Times',
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
