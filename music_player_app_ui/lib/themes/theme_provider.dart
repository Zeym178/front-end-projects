import 'package:flutter/material.dart';
import 'package:music_player_app_ui/themes/dark_mode.dart';
import 'package:music_player_app_ui/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  String isDarkKey = "isdark";

  ThemeData get themeData => _themeData;
  bool get isDark => _themeData == darkMode;

  ThemeProvider() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    bool isdark = pref.getBool(isDarkKey) ?? false;
    _themeData = isdark ? darkMode : lightMode;
    notifyListeners();
  }

  Future<void> setTheme(bool themeBool) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(isDarkKey, themeBool);
    _themeData = themeBool ? darkMode : lightMode;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      setTheme(false);
    } else {
      setTheme(true);
    }
  }
}
