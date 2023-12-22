import 'package:go_router/go_router.dart';
import 'package:twitter/features/navigation/main_navigation_screen.dart';
import 'package:twitter/features/settings/privacy_screen.dart';
import 'package:twitter/features/settings/settings_screen.dart';

final routes = GoRouter(
  routes: [
    // initial screen is MainNavigationScreen with HomeScreen
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MainNavigationScreen(
          page: '',
        );
      },
    ),
    // Settings screen and Privacy screen nested inside
    GoRoute(
      path: SettingsScreen.routeUrl,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeName,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
    // Change with params
    GoRoute(
      path: '/:page',
      builder: (context, state) {
        final page = state.params['page'];
        return MainNavigationScreen(
          page: page!,
        );
      },
    ),
  ],
);
