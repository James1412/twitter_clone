import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Data to save on disk using shared_preferences
class DarkModeConfigRepository extends ChangeNotifier {
  static const _darkmode = 'darkmode';
  final SharedPreferences _preferences;

  DarkModeConfigRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
