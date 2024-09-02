import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interestcalculator/themes/dark_theme.dart';
import 'package:interestcalculator/themes/light_theme.dart';
import 'package:interestcalculator/themes/amoled_theme.dart';
import 'package:interestcalculator/themes/theme_mode.dart';

class ThemeProvider with ChangeNotifier {
  static const String themeKey = 'themeKey';
  AppThemeMode _currentAppThemeMode = AppThemeMode.light;

  ThemeData _currentTheme = lightTheme;
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeData get currentTheme => _currentTheme;
  ThemeMode get currentThemeMode => _currentThemeMode;
  AppThemeMode get currentAppThemeMode => _currentAppThemeMode;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  void setTheme(ThemeData theme, AppThemeMode appThemeMode) {
    _currentTheme = theme;
    _currentAppThemeMode = appThemeMode;
    _currentThemeMode =
        appThemeMode == AppThemeMode.light ? ThemeMode.light : ThemeMode.dark;
    _saveThemeToPrefs(appThemeMode);
    notifyListeners();
  }

  void setLightTheme() {
    setTheme(lightTheme, AppThemeMode.light);
  }

  void setDarkTheme() {
    setTheme(darkTheme, AppThemeMode.dark);
  }

  void setAmoledTheme() {
    setTheme(amoledTheme, AppThemeMode.amoled);
  }

  void updateThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        setLightTheme();
        break;
      case AppThemeMode.dark:
        setDarkTheme();
        break;
      case AppThemeMode.amoled:
        setAmoledTheme();
        break;
    }
  }

  Future<void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeModeString = prefs.getString(themeKey);

    AppThemeMode savedThemeMode = AppThemeMode.values.firstWhere(
        (e) => e.toString() == themeModeString,
        orElse: () => AppThemeMode.light);

    updateThemeMode(savedThemeMode);
  }

  Future<void> _saveThemeToPrefs(AppThemeMode appThemeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, appThemeMode.toString());
  }
}
