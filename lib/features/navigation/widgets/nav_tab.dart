import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/util.dart';

class NavTab extends ConsumerWidget {
  final IconData icon;
  final bool isSelected;
  final IconData selectedIcon;
  final Function onTap;
  const NavTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(ref);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
          ),
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.3,
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: FaIcon(
                isSelected ? selectedIcon : icon,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
