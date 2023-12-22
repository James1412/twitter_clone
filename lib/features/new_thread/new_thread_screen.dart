import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/new_thread/image_picking_screen.dart';
import 'package:twitter/util.dart';

class NewThreadScreen extends ConsumerStatefulWidget {
  const NewThreadScreen({super.key});

  @override
  NewThreadScreenState createState() => NewThreadScreenState();
}

class NewThreadScreenState extends ConsumerState<NewThreadScreen> {
  bool isWriting = false;
  final TextEditingController _controller = TextEditingController();
  List<File?> images = [];

  void _onStartWriting() {
    if (_controller.value.text != "") {
      setState(() {
        isWriting = true;
      });
    } else {
      setState(() {
        isWriting = false;
      });
    }
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      _onStartWriting,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onClipMediaTap() async {
    File? image = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImagePickingScreen(),
      ),
    );
    if (image != null) {
      setState(() {
        images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        backgroundColor: isDark ? Colors.black : null,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: isDark ? Colors.black : Colors.white,
          automaticallyImplyLeading: false,
          leadingWidth: Sizes.size72,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: isDark ? Colors.white : null,
                ),
              ),
            ),
          ),
          title: Text(
            "New thread",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size20,
              color: isDark ? Colors.white : null,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Side Circle Avatar with vertical line
                  Column(
                    children: [
                      const CircleAvatar(
                        foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/73318218?v=4",
                        ),
                      ),
                      Gaps.v5,
                      Container(
                        width: 1,
                        color: Colors.grey,
                        height: 100,
                      ),
                      Gaps.v5,
                      const Opacity(
                        opacity: 0.5,
                        child: CircleAvatar(
                          radius: 10,
                          foregroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/73318218?v=4",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.h14,
                  // TextField with image
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "James",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gaps.h5,
                              FaIcon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size12,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Transform.translate(
                            offset: const Offset(0, -5),
                            child: TextField(
                              controller: _controller,
                              onTapOutside: (value) => _onStopWriting(),
                              maxLines: null,
                              minLines: null,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Start a thread...",
                                hintStyle: TextStyle(
                                  color: isDark ? Colors.white : null,
                                ),
                              ),
                            ),
                          ),
                          // Photos taken
                          if (images.isNotEmpty)
                            Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: Sizes.size96 * 3,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    separatorBuilder: (context, index) =>
                                        Gaps.h10,
                                    itemBuilder: (context, index) => Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Sizes.size10,
                                            ),
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          width: Sizes.size96 * 3,
                                          height: Sizes.size96 * 3,
                                          child: Image.file(
                                            images[index]!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: Sizes.size14,
                                          right: Sizes.size14,
                                          child: GestureDetector(
                                            onTap: () {
                                              images.removeAt(index);
                                              setState(() {});
                                            },
                                            child: const Center(
                                              child: FaIcon(
                                                FontAwesomeIcons
                                                    .solidCircleXmark,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gaps.v10,
                              ],
                            ),
                          GestureDetector(
                            onTap: _onClipMediaTap,
                            child: const FaIcon(
                              FontAwesomeIcons.paperclip,
                              color: Colors.grey,
                              size: Sizes.size18,
                            ),
                          ),
                          Gaps.v96,
                          Gaps.v44,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                surfaceTintColor: Colors.white,
                shadowColor: Colors.white,
                color: isDark ? Colors.black : Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Anyone can reply",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        color: isWriting ? Colors.blue : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: const Duration(milliseconds: 200),
                      child: const Text(
                        "Post",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
