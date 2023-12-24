import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/settings/privacy_screen.dart';
import 'package:twitter/util.dart';

class SettingTile extends ConsumerStatefulWidget {
  final Map<String, dynamic> tile;
  const SettingTile({super.key, required this.tile});

  @override
  SettingTileState createState() => SettingTileState();
}

class SettingTileState extends ConsumerState<SettingTile> {
  void _onTileTap() {
    if (widget.tile['title'] == "Privacy") {
      context.push(PrivacyScreen.routeUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return GestureDetector(
      onTap: _onTileTap,
      child: ListTile(
        leading: Icon(
          widget.tile['icon'],
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(widget.tile['title']),
      ),
    );
  }
}
