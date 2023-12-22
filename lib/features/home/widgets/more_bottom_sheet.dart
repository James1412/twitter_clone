import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/home/widgets/report_modal_sheet.dart';
import 'package:twitter/util.dart';

class MoreBottomSheet extends ConsumerStatefulWidget {
  const MoreBottomSheet({super.key});

  @override
  MoreBottomSheetState createState() => MoreBottomSheetState();
}

class MoreBottomSheetState extends ConsumerState<MoreBottomSheet> {
  void _onReportTab(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const ReportModalSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
            horizontal: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(
                    Sizes.size20,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size20,
                        right: Sizes.size20,
                        top: Sizes.size12,
                        bottom: Sizes.size5,
                      ),
                      child: Text(
                        "Unfollow",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size20,
                        right: Sizes.size20,
                        top: Sizes.size5,
                        bottom: Sizes.size12,
                      ),
                      child: Text(
                        "Mute",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              Container(
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(
                    Sizes.size20,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: Sizes.size20,
                        right: Sizes.size20,
                        top: Sizes.size12,
                        bottom: Sizes.size5,
                      ),
                      child: Text(
                        "Hide",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size20,
                        right: Sizes.size20,
                        top: Sizes.size5,
                        bottom: Sizes.size12,
                      ),
                      child: GestureDetector(
                        onTap: () => _onReportTab(context),
                        child: const Text(
                          "Report",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
