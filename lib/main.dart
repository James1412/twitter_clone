import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter/features/dark_mode/repos/dark_mode.config_repo.dart';
import 'package:twitter/features/dark_mode/view_models/dark_mode_config_view_model.dart';
import 'package:twitter/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkmodeConfigProvider.overrideWith(
          () => DarkModeConfigViewModel(repository),
        ),
      ],
      child: const TwitterClone(),
    ),
  );
}

class TwitterClone extends ConsumerStatefulWidget {
  const TwitterClone({super.key});

  @override
  TwitterCloneState createState() => TwitterCloneState();
}

class TwitterCloneState extends ConsumerState<TwitterClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: Typography.blackCupertino,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          labelStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteCupertino,
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          // This raises error when toggling dark mode
          // leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ref.watch(darkmodeConfigProvider).darkmode
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
