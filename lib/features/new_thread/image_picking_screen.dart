import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/new_thread/image_preview.screen.dart';

class ImagePickingScreen extends StatefulWidget {
  const ImagePickingScreen({super.key});

  @override
  State<ImagePickingScreen> createState() => _ImagePickingScreenState();
}

class _ImagePickingScreenState extends State<ImagePickingScreen>
    with WidgetsBindingObserver {
  bool _hasPermission = false;
  late CameraController _cameraController;
  bool _isSelfieMode = false;
  late FlashMode _flashMode;
  // NO CAMERA FOR IOS SIMULATOR
  final bool noCamera = kDebugMode && Platform.isIOS;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;
    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.high,
    );
    await _cameraController.initialize();
    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();
    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;
    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // If it's not in IOS SIMULATOR
    if (!noCamera) {
      initPermissions();
    }
    // If it's not in IOS SIMULATOR, has permission to true
    else {
      setState(() {
        _hasPermission = true;
      });
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!mounted) return;
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      await initCamera();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode() async {
    if (_flashMode == FlashMode.always) {
      await _cameraController.setFlashMode(FlashMode.auto);
      _flashMode = FlashMode.auto;
      setState(() {});
    } else if (_flashMode == FlashMode.auto) {
      await _cameraController.setFlashMode(FlashMode.off);
      _flashMode = FlashMode.off;
      setState(() {});
    } else {
      await _cameraController.setFlashMode(FlashMode.always);
      _flashMode = FlashMode.always;
      setState(() {});
    }
  }

  Future<void> _takePicture() async {
    XFile image = await _cameraController.takePicture();
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(
          image: image,
          isPicked: false,
        ),
      ),
    );
  }

  Future<void> _onImagePickPressed() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(
          image: pickedImage,
          isPicked: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Requesting permissions...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v10,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // If camera exists and controller is initialized
                      if (!noCamera && !_cameraController.value.isInitialized)
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.size20),
                          ),
                          child: CameraPreview(_cameraController),
                        ),
                      // Back Button
                      Positioned(
                        top: Sizes.size64,
                        left: Sizes.size24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Camera Buttons
                      if (!noCamera && !_cameraController.value.isInitialized)
                        Positioned(
                          width: MediaQuery.of(context).size.width,
                          bottom: Sizes.size40,
                          child: Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                child: IconButton(
                                  onPressed: _setFlashMode,
                                  icon: Icon(
                                    _flashMode == FlashMode.always
                                        ? Icons.flash_on_rounded
                                        : _flashMode == FlashMode.off
                                            ? Icons.flash_off_rounded
                                            : Icons.flash_auto_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: _takePicture,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 88,
                                      height: 88,
                                      child: CircularProgressIndicator(
                                        strokeWidth: Sizes.size4,
                                        color: Colors.white,
                                        value: 1.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: IconButton(
                                  onPressed: _toggleSelfieMode,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.rotate,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.size96 + Sizes.size24,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          const Spacer(),
                          const Text(
                            "Camera",
                            style: TextStyle(color: Colors.white),
                          ),
                          const Spacer(),
                          Expanded(
                            child: GestureDetector(
                              onTap: _onImagePickPressed,
                              child: const Text(
                                "Library",
                                style: TextStyle(color: Colors.white),
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
    );
  }
}
