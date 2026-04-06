import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// Tema provayderi - Gece/Gunduz modu yonetimi
class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true; // Varsayilan gece modu

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme =>
      _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  // Modu deyis
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Set spesifik mod
  void setDarkMode(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
}
