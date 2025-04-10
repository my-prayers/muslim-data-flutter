import 'package:example/example_app.dart';
import 'package:example/features/azkars/azkar_category_screen.dart';
import 'package:example/features/azkars/azkar_chapter_screen.dart';
import 'package:example/features/location/location_screen.dart';
import 'package:example/features/names/names_screen.dart';
import 'package:example/features/prayer_times/prayer_times_screen.dart';
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
              builder: (context, state) => const PrayerTimesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/location',
              name: 'location',
              builder: (context, state) => const LocationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/azkars',
              name: 'azkars',
              builder: (context, state) => const AzkarCategoryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/names',
              name: 'names',
              builder: (context, state) => const NamesScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/azkar-chapter',
      name: 'azkar-chapter',
      builder: (context, state) {
        final categoryId = int.parse(state.uri.queryParameters['categoryId']!);
        return AzkarChapterScreen(categoryId: categoryId);
      },
    ),
    GoRoute(
      path: '/azkar-item',
      name: 'azkar-item',
      builder: (context, state) {
        final chapterId = int.parse(state.uri.queryParameters['chapterId']!);
        return AzkarChapterScreen(categoryId: chapterId);
      },
    ),
  ],
);
