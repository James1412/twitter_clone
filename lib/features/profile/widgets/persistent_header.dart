import 'package:flutter/material.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/util.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  final isDark;
  PersistentTabBar({required this.isDark});
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        tabs: [
          Center(
            child: Text(
              "Threads",
              style: TextStyle(
                color: isDark ? Colors.white : null,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              "Replies",
              style: TextStyle(
                color: isDark ? Colors.white : null,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 47;

  @override
  // TODO: implement minExtent
  double get minExtent => 47;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
