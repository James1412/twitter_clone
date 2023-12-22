import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/onboarding/interest_screen_second.dart';
import 'package:twitter/features/navigation/widgets/app_bar.dart';
import 'package:twitter/util.dart';

class InterestScreen extends ConsumerStatefulWidget {
  const InterestScreen({super.key});

  @override
  InterestScreenState createState() => InterestScreenState();
}

class InterestScreenState extends ConsumerState<InterestScreen> {
  final interests = [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ];

  late List<bool> isSelectedList;
  int numberOfSelectedItems = 0;
  List<String> selectedItem = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List.filled(interests.length, false);
  }

  void _onTap(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
      if (isSelectedList[index]) {
        numberOfSelectedItems++;
        selectedItem.add(interests[index]);
      } else {
        numberOfSelectedItems--;
        selectedItem.remove(interests[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: const AppBarWidget(leadingType: LeadingType.none),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
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
              "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
            ),
            Gaps.v12,
            const Divider(),
            Gaps.v10,
            Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5 / 1,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  for (var i = 0; i < interests.length; i++)
                    GestureDetector(
                      onTap: () => _onTap(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(
                          Sizes.size10,
                        ),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: isSelectedList[i]
                              ? Colors.blue
                              : isDark
                                  ? Colors.grey.shade700
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(
                            Sizes.size10,
                          ),
                          border: Border.all(
                            color: isDark
                                ? Colors.grey.shade700
                                : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: isSelectedList[i]
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: isSelectedList[i]
                                  ? const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      color: Colors.white,
                                      size: Sizes.size20,
                                    )
                                  : null,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                interests[i],
                                style: TextStyle(
                                  fontWeight: isSelectedList[i]
                                      ? FontWeight.w800
                                      : FontWeight.bold,
                                  fontSize: Sizes.size14,
                                  color: isSelectedList[i]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Gaps.v10,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InterestScreenSecond(),
                    ),
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
