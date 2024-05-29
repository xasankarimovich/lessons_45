import 'package:flutter/material.dart';
import '../controllers/settings_controller.dart';

class SettingNotifier extends InheritedWidget {
  final SettingsController settingsController;

  const SettingNotifier({
    super.key,
    required this.settingsController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SettingNotifier oldWidget) {
    return oldWidget.settingsController != settingsController;
  }

  static SettingsController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingNotifier>()!.settingsController;
  }
}
