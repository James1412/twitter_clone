import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/navigation/main_navigation_screen.dart';
import 'package:twitter/features/navigation/widgets/app_bar.dart';
import 'package:twitter/features/onboarding/widgets/interest_item.dart';
import 'package:twitter/util.dart';

class InterestScreenSecond extends ConsumerStatefulWidget {
  const InterestScreenSecond({super.key});

  @override
  InterestScreenSecondState createState() => InterestScreenSecondState();
}

class InterestScreenSecondState extends ConsumerState<InterestScreenSecond> {
  final musicList = [
    "Rap",
    "R&B & soul",
    "Grammy Awards",
    "Pop",
    "K-pop",
    "Music industry",
    "Music news",
    "Hip hop",
    "Reggae",
  ];
  final entertainmentList = [
    "Anime",
    "Movies & TV",
    "Harry Potter",
    "Marvel Universe",
    "Movie news",
    "Naruto",
    "Movies",
    "Grammy Awards",
    "Entertainment",
  ];

  int numberOfSelectedItems = 0;
  List<String> selectedItems = [];

  void _onTap(item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
        numberOfSelectedItems--;
      } else {
        selectedItems.add(item);
        numberOfSelectedItems++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: const AppBarWidget(leadingType: LeadingType.back),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: ListView(
          children: [
            Gaps.v20,
            const Text(
              "What do you want to see on Twitter?",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: Sizes.size28,
              ),
            ),
            Gaps.v16,
            const Text(
              "Interests are used to personalize your experience and will be visible on your profile",
            ),
            Gaps.v12,
            const Divider(),
            Gaps.v20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Music",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Sizes.size24,
                  ),
                ),
                Gaps.v20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.3,
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 5,
                      spacing: Sizes.size2,
                      children: [
                        for (var music in musicList)
                          InterestItem(
                            music: music,
                            onTap: _onTap,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gaps.v10,
            const Divider(),
            Gaps.v10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Entertainment",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: Sizes.size24,
                  ),
                ),
                Gaps.v20,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1.3,
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 5,
                      spacing: Sizes.size2,
                      children: [
                        for (var entertainment in entertainmentList)
                          InterestItem(
                            music: entertainment,
                            onTap: _onTap,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        color: isDark ? Colors.black : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            numberOfSelectedItems >= 3
                ? const Text("Great work 🎉")
                : Text("$numberOfSelectedItems of 3 selected"),
            GestureDetector(
              onTap: () {
                if (numberOfSelectedItems >= 3) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationScreen(
                        page: '',
                      ),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                  vertical: Sizes.size10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  color: numberOfSelectedItems >= 3
                      ? isDark
                          ? Colors.white
                          : Colors.black
                      : Colors.grey.shade400,
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: isDark ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
