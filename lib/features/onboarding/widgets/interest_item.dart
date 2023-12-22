import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/util.dart';

import '../../../constants/sizes.dart';

class InterestItem extends ConsumerStatefulWidget {
  const InterestItem({
    super.key,
    required this.music,
    required this.onTap,
  });
  final void Function(String) onTap;
  final String music;

  @override
  InterestItemState createState() => InterestItemState();
}

class InterestItemState extends ConsumerState<InterestItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        return widget.onTap(widget.music);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: _isSelected
              ? Colors.blue
              : isDark
                  ? Colors.grey.shade700
                  : Colors.white,
          border: Border.all(
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(Sizes.size20),
        ),
        child: Text(
          widget.music,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: _isSelected ? FontWeight.w800 : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
