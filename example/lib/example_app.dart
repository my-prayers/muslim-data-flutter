import 'package:example/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Muslim Data Demo',
      locale: Locale('en'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routerConfig: appRouter,
    );
  }
}

/// A stateless widget that represents the main screen with tabs.
class TabsScreen extends StatelessWidget {
  const TabsScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  /// Navigates to the specified branch by using GoRouter -
  /// [StatefulNavigationShell] based on the given [index].
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.access_time_rounded),
            selectedIcon: const Icon(Icons.access_time_filled_rounded),
            label: 'Prayer Times',
          ),
          NavigationDestination(
            icon: const Icon(Icons.location_on_outlined),
            selectedIcon: const Icon(Icons.location_on),
            label: 'Location',
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_rounded),
            selectedIcon: const Icon(Icons.menu_book_rounded),
            label: 'Azkars',
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outline),
            selectedIcon: const Icon(Icons.info),
            label: 'Names',
          ),
        ],
        onDestinationSelected: _goBranch,
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedIndex: navigationShell.currentIndex,
      ),
    );
  }
}
