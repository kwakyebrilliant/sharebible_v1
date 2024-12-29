import 'package:flutter/material.dart';
import 'package:sharebible/theme/dark_mode.dart';
import 'package:sharebible/theme/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  late ThemeData _currentTheme;

  ThemeNotifier() {
    // Initialize with the saved theme preference, or lightMode by default.
    _currentTheme = lightMode;
    _loadTheme();
  }

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = (_currentTheme == lightMode) ? darkMode : lightMode;
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentTheme = isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _currentTheme == darkMode);
  }
}
