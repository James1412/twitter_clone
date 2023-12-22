import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/features/dark_mode/view_models/dark_mode_config_view_model.dart';
import 'package:twitter/features/settings/widgets/setting_tile.dart';
import 'package:twitter/util.dart';

List<Map<String, dynamic>> settingList = [
  {
    "icon": FontAwesomeIcons.userPlus,
    "title": "Follow and invite friends",
  },
  {
    "icon": FontAwesomeIcons.bell,
    "title": "Notifications",
  },
  {
    "icon": FontAwesomeIcons.lock,
    "title": "Privacy",
  },
  {
    "icon": FontAwesomeIcons.circleUser,
    "title": "Account",
  },
  {
    "icon": FontAwesomeIcons.lifeRing,
    "title": "Help",
  },
  {
    "icon": FontAwesomeIcons.circleInfo,
    "title": "About",
  },
];

class SettingsScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/settings';
  static String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : null,
        ),
        elevation: 1,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: isDark ? Colors.black : Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : null,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidMoon,
                  color: isDark ? Colors.white : Colors.black,
                ),
                Gaps.h16,
                const Text("Dark Mode"),
              ],
            ),
            value: isDark,
            onChanged: (value) {
              ref.read(darkmodeConfigProvider.notifier).setDarkMode(value);
            },
          ),
          for (var tile in settingList)
            SettingTile(
              tile: tile,
            ),
          const Divider(),
          ListTile(
            title: const Text(
              "Log out",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            trailing: CircularProgressIndicator.adaptive(
              backgroundColor: isDark ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
