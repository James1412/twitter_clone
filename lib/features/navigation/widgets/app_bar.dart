import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/util.dart';

import '../../../constants/sizes.dart';

enum LeadingType {
  cancel,
  back,
  none;
}

extension LeadingTypeExtension on LeadingType {
  Widget intoWidget(BuildContext context, WidgetRef ref) {
    switch (this) {
      case LeadingType.cancel:
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Cancel",
              style: TextStyle(
                color: isDarkMode(ref) ? Colors.white : Colors.black,
                fontSize: Sizes.size18,
              ),
            ),
          ),
        );
      case LeadingType.back:
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: isDarkMode(ref) ? Colors.white : Colors.black,
                size: 24,
              ),
            ),
          ),
        );
      case LeadingType.none:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final LeadingType leadingType;
  const AppBarWidget({
    super.key,
    required this.leadingType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      surfaceTintColor: Colors.white,
      leadingWidth: 90,
      leading: leadingType.intoWidget(context, ref),
      title: const Icon(
        FontAwesomeIcons.twitter,
        color: Colors.blue,
        size: 32,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
