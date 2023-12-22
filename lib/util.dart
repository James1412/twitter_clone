import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/dark_mode/view_models/dark_mode_config_view_model.dart';

bool isDarkMode(WidgetRef ref) {
  return ref.watch(darkmodeConfigProvider).darkmode;
}
