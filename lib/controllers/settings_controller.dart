import 'package:flutter/material.dart';
import '../models/setting.dart';

class SettingsController extends ChangeNotifier {
  Settings _settings = Settings(themeMode: ThemeMode.light);

  Settings get settings => _settings;

  void toggleTheme(bool isDarkMode) {
    _settings = Settings(themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light);
    notifyListeners();
  }
}
