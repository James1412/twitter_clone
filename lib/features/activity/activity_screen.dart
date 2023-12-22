import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/activity/widgets/activity_thread.dart';
import 'package:twitter/util.dart';

final List<String> _tabList = [
  "All",
  "Replies",
  "Mentions",
  "Verified",
];
final List<Map<String, dynamic>> _users = [
  {
    "name": "James",
    "time": "4h",
    "subtitle": "Mentioned you",
    "description":
        "Here's a thread you should follow if you love botany @jane_mobbin.Here's a thread you should follow if you love botany @jane_mobbin",
  },
  {
    "name": "James",
    "time": "4h",
    "subtitle": "Definitely boken!",
    "description":
        "Here's a thread you should follow if you love botany @jane_mobbin",
  },
  {
    "name": "James",
    "time": "4h",
    "subtitle": "Followed you",
    "description":
        "Here's a thread you should follow if you love botany @jane_mobbin",
  },
  {
    "name": "James",
    "time": "4h",
    "subtitle": "Mentioned you",
    "description":
        "Here's a thread you should follow if you love botany @jane_mobbin",
  },
  {
    "name": "James",
    "time": "4h",
    "subtitle": "Mentioned you",
    "description":
        "Here's a thread you should follow if you love botany @jane_mobbin",
  },
];

class ActivityScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/activity';
  static String routeName = 'activity';
  const ActivityScreen({super.key});

  @override
  ActivityScreenState createState() => ActivityScreenState();
}

class ActivityScreenState extends ConsumerState<ActivityScreen> {
  int _selectedTab = 0;

  void _onTabTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v20,
                const Text(
                  "Activity",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size32,
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  height: Sizes.size52,
                  child: TabBar(
                    onTap: (int index) => _onTabTap(index),
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size5,
                    ),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                    ),
                    dividerColor: Colors.transparent,
                    tabs: [
                      for (var tab in _tabList)
                        Container(
                          width: Sizes.size96 + Sizes.size10,
                          height: Sizes.size44,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            color: _selectedTab == _tabList.indexOf(tab)
                                ? isDark
                                    ? Colors.white
                                    : Colors.black
                                : isDark
                                    ? Colors.black
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.size10),
                          ),
                          child: Center(
                            child: Text(
                              tab,
                              style: TextStyle(
                                color: _selectedTab == _tabList.indexOf(tab)
                                    ? isDark
                                        ? Colors.black
                                        : Colors.white
                                    : isDark
                                        ? Colors.white
                                        : Colors.black,
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Gaps.v10,
                Expanded(
                  child: TabBarView(
                    children: [
                      for (int i = 0; i < _tabList.length; i++)
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              for (var user in _users)
                                ActivityThread(user: user),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
