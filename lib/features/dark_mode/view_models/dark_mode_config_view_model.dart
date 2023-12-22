import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/features/dark_mode/models/dark_mode_config_model.dart';
import 'package:twitter/features/dark_mode/repos/dark_mode.config_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    // Save to disk
    _repository.setDarkMode(value);
    // Also change in our model
    state = DarkModeConfigModel(darkmode: value);
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(darkmode: _repository.isDarkMode());
  }
}

final darkmodeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
