import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/dark_mode/view_models/dark_mode_config_view_model.dart';

bool isDarkMode(WidgetRef ref) {
  return ref.watch(darkmodeConfigProvider).darkmode;
}

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
        (error as FirebaseException).message ?? "Something went wrong",
      ),
    ),
  );
}
