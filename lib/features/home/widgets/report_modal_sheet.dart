import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/util.dart';

List<String> reportList = [
  "I just don't like it",
  "It's unlawful content under NetzDG",
  "It's spam",
  "Hate speech or symbols",
  "Nudity or sexual activity",
];

class ReportModalSheet extends ConsumerStatefulWidget {
  const ReportModalSheet({super.key});

  @override
  ReportModalSheetState createState() => ReportModalSheetState();
}

class ReportModalSheetState extends ConsumerState<ReportModalSheet> {
  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          surfaceTintColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(
              top: Sizes.size20,
            ),
            child: Text(
              "Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size18,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gaps.v10,
              Divider(
                color: Colors.grey.shade300,
              ),
              Gaps.v10,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Why are you reporting this thread?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v7,
                    Text(
                      "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              Gaps.v10,
              for (var item in reportList)
                Column(
                  children: [
                    const Divider(),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text(
                        item,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      trailing: FaIcon(
                        FontAwesomeIcons.angleRight,
                        color: Colors.grey.shade600,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
  }
}
