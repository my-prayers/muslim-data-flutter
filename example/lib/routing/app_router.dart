import 'package:example/example_app.dart';
import 'package:example/features/azkars/azkars.dart';
import 'package:example/features/location/location.dart';
import 'package:example/features/names/names.dart';
import 'package:example/features/prayer_times/prayer_times.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/prayer-times',
  debugLogDiagnostics: false,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabsScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/prayer-times',
              name: 'prayer-times',
              builder: (context, state) => const PrayerTimes(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/location',
              name: 'location',
              builder: (context, state) => const Location(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/azkars',
              name: 'azkars',
              builder: (context, state) => const Azkars(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/names',
              name: 'names',
              builder: (context, state) => const Names(),
            ),
          ],
        ),
      ],
    ),
  ],
);
