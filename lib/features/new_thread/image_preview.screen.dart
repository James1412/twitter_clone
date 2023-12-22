import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';

class ImagePreviewScreen extends StatefulWidget {
  final XFile image;
  final bool isPicked;
  const ImagePreviewScreen({
    super.key,
    required this.image,
    required this.isPicked,
  });

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  bool _savedImage = false;

  Future<void> _saveToGallery() async {
    if (_savedImage) return;
    await GallerySaver.saveImage(
      widget.image.path,
      albumName: "Twitter Clone",
    );
    _savedImage = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Preview image"),
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedImage
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Image.file(
              File(widget.image.path),
            ),
          ),
          Gaps.v20,
          SizedBox(
            height: Sizes.size52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Sizes.size10),
                      ),
                      child: const Center(
                        child: Text(
                          "Retake",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.h32,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop(
                        File(widget.image.path),
                      );
                  },
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Sizes.size10),
                      ),
                      child: const Center(
                        child: Text(
                          "Use photo",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
