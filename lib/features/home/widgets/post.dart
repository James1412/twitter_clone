import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/features/home/widgets/more_bottom_sheet.dart';
import 'package:twitter/util.dart';

import '../../../constants/sizes.dart';

class Post extends ConsumerStatefulWidget {
  final String name;
  final String text;
  final String time;
  final List images;
  final String repliesLikes;
  final bool isVerified;
  const Post({
    super.key,
    required this.name,
    required this.text,
    required this.images,
    required this.time,
    required this.repliesLikes,
    required this.isVerified,
  });

  @override
  PostState createState() => PostState();
}

class PostState extends ConsumerState<Post> {
  void _onMoreTap(BuildContext context) async {
    await showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const MoreBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return IntrinsicHeight(
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/73318218?v=4",
                      ),
                    ),
                    Gaps.v5,
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    Gaps.v5,
                  ],
                ),
                Gaps.h14,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                              Gaps.h5,
                              widget.isVerified
                                  ? const FaIcon(
                                      FontAwesomeIcons.solidCircleCheck,
                                      size: Sizes.size12,
                                      color: Colors.blue,
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                widget.time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Gaps.h10,
                              GestureDetector(
                                onTap: () => _onMoreTap(context),
                                child: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: Sizes.size20,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                        ),
                      ),
                      if (widget.images.isNotEmpty) Gaps.v14,
                      if (widget.images.isNotEmpty)
                        SizedBox(
                          height: 190,
                          width: 315,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.images.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                right: Sizes.size10,
                              ),
                              child: SizedBox(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size10,
                                  ),
                                  child: Image.network(
                                    widget.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Gaps.v10,
                      Row(
                        // Icon Row
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: Sizes.size18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.repeat,
                            size: Sizes.size18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          Gaps.h14,
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: Sizes.size18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/73318218?v=4",
                        ),
                      ),
                      Gaps.h4,
                      CircleAvatar(
                        radius: 12,
                        foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/73318218?v=4",
                        ),
                      ),
                    ],
                  ),
                  Gaps.v4,
                  CircleAvatar(
                    radius: 8,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/73318218?v=4",
                    ),
                  ),
                ],
              ),
              Gaps.h10,
              Opacity(
                opacity: 0.7,
                child: Text(
                  widget.repliesLikes,
                  style: const TextStyle(
                    fontSize: Sizes.size12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
