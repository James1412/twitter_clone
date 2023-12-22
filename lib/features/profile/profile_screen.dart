import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/activity/widgets/activity_thread.dart';
import 'package:twitter/features/profile/widgets/persistent_header.dart';
import 'package:twitter/features/settings/settings_screen.dart';
import 'package:twitter/util.dart';

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

class ProfileScreen extends ConsumerStatefulWidget {
  static String routeUrl = '/profile';
  static String routeName = 'profile';
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) => [
            SliverAppBar(
              shadowColor: Colors.white,
              backgroundColor: isDark ? Colors.black : Colors.white,
              leadingWidth: Sizes.size56,
              leading: const Center(
                child: FaIcon(
                  FontAwesomeIcons.globe,
                  size: Sizes.size24,
                ),
              ),
              iconTheme: IconThemeData(
                color: isDark ? Colors.white : null,
              ),
              actionsIconTheme: IconThemeData(
                size: Sizes.size24,
                color: isDark ? Colors.white : null,
              ),
              actions: [
                const FaIcon(FontAwesomeIcons.instagram),
                Gaps.h20,
                GestureDetector(
                  onTap: () {
                    context.push(SettingsScreen.routeUrl);
                  },
                  child: const FaIcon(FontAwesomeIcons.bars),
                ),
                Gaps.h20,
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jane",
                              style: TextStyle(
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.v5,
                            Row(
                              children: [
                                const Text("jane_mobbin"),
                                Gaps.h7,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                    vertical: Sizes.size5,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size20),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "threads.net",
                                      style: TextStyle(
                                        color: isDark
                                            ? Colors.grey.shade600
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: Sizes.size32,
                          backgroundColor: Colors.lightBlue.shade100,
                        ),
                      ],
                    ),
                    Gaps.v16,
                    const Text("Plant enthusiast!"),
                    Gaps.v20,
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        ),
                        Transform.translate(
                          offset: const Offset(-5, 0),
                          child: const CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                          ),
                        ),
                        Gaps.h8,
                        const Text(
                          "2 followers",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: Sizes.size44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.h20,
                        Flexible(
                          child: Container(
                            height: Sizes.size44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(
                                Sizes.size10,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Share profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v32,
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentTabBar(
                isDark: isDark,
              ),
              pinned: true,
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: TabBarView(
              children: [
                ListView(
                  children: [
                    for (var user in _users) ActivityThread(user: user),
                  ],
                ),
                ListView(
                  children: [
                    for (var user in _users) ActivityThread(user: user),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
