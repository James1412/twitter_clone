import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/util.dart';

List<Map<String, dynamic>> tiles = [
  {
    "icon": FontAwesomeIcons.userPlus,
    "title": "Follow and invite friends",
  },
  {
    "icon": FontAwesomeIcons.bellSlash,
    "title": "Muted",
  },
  {
    "icon": FontAwesomeIcons.eyeSlash,
    "title": "Hidden Words",
  },
  {
    "icon": FontAwesomeIcons.users,
    "title": "Profiles you follow",
  },
];

class PrivacyScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/settings/privacy';
  static String routeName = 'privacy';
  const PrivacyScreen({super.key});

  @override
  PrivacyScreenState createState() => PrivacyScreenState();
}

class PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  bool _isPrivate = false;

  void _onPrivateProfileTap() {
    setState(() {
      _isPrivate = !_isPrivate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : null,
        ),
        shadowColor: Colors.white,
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 1,
        surfaceTintColor: Colors.white,
        title: Text(
          "Privacy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : null,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            inactiveTrackColor: isDark ? Colors.grey : null,
            title: const Row(
              children: [
                FaIcon(FontAwesomeIcons.lock),
                Gaps.h16,
                Text("Private profile"),
              ],
            ),
            value: _isPrivate,
            onChanged: (value) => _onPrivateProfileTap(),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.at,
            ),
            title: Text("Mentions"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.size14,
                  ),
                ),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
          for (var tile in tiles)
            ListTile(
              leading: FaIcon(tile['icon']),
              title: Text(tile['title']),
              trailing: const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey,
                size: Sizes.size20,
              ),
            ),
          const Divider(),
          const ListTile(
            title: Text("Other privacy settings"),
            subtitle: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram",
            ),
            isThreeLine: true,
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size18,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            title: Text("Blocked profiles"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size18,
              color: Colors.grey,
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.heartCrack,
            ),
            title: Text("Hide likes"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
