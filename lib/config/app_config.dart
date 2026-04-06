import 'package:flutter/material.dart';

/// Uygulamanın merkezi yapılandırma dosyası
/// Tüm renkler, boyutlar ve ayarlar buradan yönetilir
class AppConfig {
  // ============================================
  // ARKA PLAN RESİMLERİ
  // ============================================
  static const String bgImageDark = 'assets/images/bg/dark.jpg';
  static const String bgImageLight = 'assets/images/bg/light.jpg';
  static const String bgImageZodiacDark = 'assets/images/bg/dark_burc.jpg';
  static const String bgImageZodiacLight = 'assets/images/bg/light_burc.jpg';

  // ============================================
  // ARKA PLAN OPAKLIKLARI (Overlay)
  // ============================================
  static const double darkModeOverlayOpacity = 0.45;
  static const double lightModeOverlayOpacity = 0.25;

  // ============================================
  // TÜM BİLEŞENLERİN OPAKLIKLERI
  // ============================================
  static const double textFieldBackgroundOpacity = 0.25;
  static const double buttonBackgroundOpacity = 0.35;
  static const double cardBackgroundOpacity = 0.20;

  // ============================================
  // KÖŞE YARÇAPLARI (Border Radius)
  // ============================================
  static const double appBarBorderRadius = 0;
  static const double textFieldBorderRadius = 20;
  static const double buttonBorderRadius = 25;
  static const double cardBorderRadius = 15;

  // ============================================
  // BOŞLUKLAR VE BOYUTLAR
  // ============================================
  static const double smallSpacing = 8;
  static const double mediumSpacing = 16;
  static const double largeSpacing = 24;
  static const double extraLargeSpacing = 32;
  static const double buttonHeight = 50;

  // ============================================
  // YAZTIPI BOYUTLARI
  // ============================================
  static const double displayLargeFontSize = 36;
  static const double headlineLargeFontSize = 28;
  static const double headlineMediumFontSize = 22;
  static const double bodyLargeFontSize = 16;
  static const double bodyMediumFontSize = 14;
  static const double labelSmallFontSize = 12;

  // ============================================
  // GÖLGELERİ (Elevation/Shadow)
  // ============================================
  static const double elevatedButtonElevation = 12;
  static const double cardElevation = 8;
  static const double customPainterBlur = 15;

  // ============================================
  // SÜRELERİ (Duration)
  // ============================================
  static const Duration pageIndicatorAnimationDuration = Duration(
    milliseconds: 300,
  );
  static const Duration themeTransitionDuration = Duration(seconds: 2);
  static const Duration standardAnimationDuration = Duration(milliseconds: 300);

  // ============================================
  // İCON BOYUTLARI
  // ============================================
  static const double smallIconSize = 24;
  static const double mediumIconSize = 32;
  static const double largeIconSize = 120;

  // ============================================
  // GRİD AYARLARI (HomeScreen)
  // ============================================
  static const int zodiacGridCrossAxisCount = 3;
  static const double zodiacGridSpacing = 12;

  // ============================================
  // PADDİNG VE MARGIN PRESETS
  // ============================================
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 12,
  );
  static const EdgeInsets textFieldPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  );
  static const EdgeInsets dialogPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
  );

  // ============================================
  // TEMA RENKLERI - KOYU MOD
  // ============================================
  static const Color darkModePrimaryColor = Color(0xFF00FFCC); // Neon Cyan for accents
  static const Color darkModeSecondaryColor = Color(0xFF8E2DE2); // Vibrant Deep Purple
  static const Color darkModeBackgroundColor = Color(0xFF0A0F24); // Deep Cosmic Blue
  static const Color darkModeAppBarColor = Color(0x00000000); // Transparent
  static const Color darkModeTextColor = Colors.white70;
  static const Color darkModeTextColorIntense = Colors.white;

  // ============================================
  // TEMA RENKLERI - AÇIK MOD
  // ============================================
  static const Color lightModePrimaryColor = Color(0xFF1E88E5); // Elegant Azure
  static const Color lightModeSecondaryColor = Color(0xFF9C27B0); // Soft Celestial Pink/Purple
  static const Color lightModeBackgroundColor = Color(0xFFF3F8FF); // Soft Dawn Blue
  static const Color lightModeAppBarColor = Color(0x00000000); // Transparent
  static const Color lightModeTextColor = Color(0xFF263238);
  static const Color lightModeTextColorIntense = Color(0xFF0D47A1);

  // ============================================
  // SAYFA GÖSTERGESİ RENKLERI
  // ============================================
  static const Color pageIndicatorActiveDarkColor = Color(0xFF00FFCC);
  static const Color pageIndicatorActiveLightColor = Color(0xFF1E88E5);
  static const Color pageIndicatorInactiveColor = Colors.white38;

  // ============================================
  // TEMA DEĞİŞİM BUTONU RENKLERİ
  // ============================================
  static const List<Color> darkModeButtonGradientColors = [
    Color(0xFF0A0F24),
    Color(0xFF8E2DE2),
  ];
  static const List<Color> lightModeButtonGradientColors = [
    Color(0xFFF3F8FF),
    Color(0xFF81D4FA),
  ];

  // ============================================
  // GENEL RENKLER
  // ============================================
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;

  // ============================================
  // YÖNETİM FONKSİYONLARI
  // ============================================

  /// Tema moduna göre uygun arka plan resmini döndürür
  static String getBackgroundImage(
    bool isDarkMode, {
    bool isZodiacScreen = false,
  }) {
    if (isZodiacScreen) {
      return isDarkMode ? bgImageZodiacDark : bgImageZodiacLight;
    }
    return isDarkMode ? bgImageDark : bgImageLight;
  }

  /// Tema moduna göre uygun overlay opaklığını döndürür
  static double getOverlayOpacity(bool isDarkMode) {
    return isDarkMode ? darkModeOverlayOpacity : lightModeOverlayOpacity;
  }

  /// Tema moduna göre birincil rengi döndürür
  static Color getPrimaryColor(bool isDarkMode) {
    return isDarkMode ? darkModePrimaryColor : lightModePrimaryColor;
  }

  /// Tema moduna göre ikincil rengi döndürür
  static Color getSecondaryColor(bool isDarkMode) {
    return isDarkMode ? darkModeSecondaryColor : lightModeSecondaryColor;
  }

  /// Tema moduna göre arka plan rengini döndürür
  static Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? darkModeBackgroundColor : lightModeBackgroundColor;
  }

  /// Tema moduna göre sayfa göstergesi etkin rengi döndürür
  static Color getPageIndicatorActiveColor(bool isDarkMode) {
    return isDarkMode
        ? pageIndicatorActiveDarkColor
        : pageIndicatorActiveLightColor;
  }

  /// Tema moduna göre tema değiştirme butonu gradient renklerini döndürür
  static List<Color> getThemeButtonGradientColors(bool isDarkMode) {
    return isDarkMode
        ? darkModeButtonGradientColors
        : lightModeButtonGradientColors;
  }
}
