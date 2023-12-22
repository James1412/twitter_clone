import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/util.dart';

List<Map<String, dynamic>> _users = [
  {
    "name": "James",
    "id": "jameslee",
    "followers": "26.6K",
    "isVerified": true,
  },
  {
    "name": "Robert",
    "id": "robertlee",
    "followers": "22.6K",
    "isVerified": true,
  },
  {
    "name": "Brad",
    "id": "bradlee",
    "followers": "26.4K",
    "isVerified": false,
  },
  {
    "name": "James",
    "id": "jameslee",
    "followers": "26.6K",
    "isVerified": true,
  },
  {
    "name": "Robert",
    "id": "robertlee",
    "followers": "22.6K",
    "isVerified": true,
  },
  {
    "name": "Brad",
    "id": "bradlee",
    "followers": "26.4K",
    "isVerified": false,
  },
  {
    "name": "Robert",
    "id": "robertlee",
    "followers": "22.6K",
    "isVerified": true,
  },
  {
    "name": "Brad",
    "id": "bradlee",
    "followers": "26.4K",
    "isVerified": false,
  },
];

class SearchScreen extends ConsumerWidget {
  static String routeUrl = '/search';
  static String routeName = 'search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(ref);
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            delegate: TitleDelegent(
              isDark: isDark,
            ),
            pinned: true,
          ),
        ],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: ListView(
              children: [
                for (var user in _users)
                  Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        isThreeLine: true,
                        leading: const CircleAvatar(
                          foregroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/73318218?v=4",
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              user['name'],
                              style: const TextStyle(
                                fontSize: Sizes.size16 + Sizes.size2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.h5,
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: Sizes.size14,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['id'],
                              style: const TextStyle(
                                fontSize: Sizes.size14,
                              ),
                            ),
                            Gaps.v10,
                            Text(
                              "${user['followers']} followers",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Sizes.size96 + Sizes.size2,
                              height: Sizes.size36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size10,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                    fontSize: Sizes.size14 + Sizes.size1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: Sizes.size52),
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
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

class TitleDelegent extends SliverPersistentHeaderDelegate {
  final isDark;
  TitleDelegent({required this.isDark});
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v10,
            const Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size32,
              ),
            ),
            Gaps.v10,
            CupertinoSearchTextField(
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
              backgroundColor: isDark ? Colors.grey.shade800 : null,
              itemColor: isDark ? Colors.white : Colors.black,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 130;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
