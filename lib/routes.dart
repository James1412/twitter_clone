import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/authentication/login_screen.dart';
import 'package:twitter/features/authentication/repos/authentication_repository.dart';
import 'package:twitter/features/authentication/sign_up_screen.dart';
import 'package:twitter/features/navigation/main_navigation_screen.dart';
import 'package:twitter/features/settings/privacy_screen.dart';
import 'package:twitter/features/settings/settings_screen.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authStateStream);
    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != '/signup' && state.subloc != "/login") {
            return '/signup';
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
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
  },
);
