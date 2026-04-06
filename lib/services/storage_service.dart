import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _prefix = 'horoscope_';

  /// Gündəlik açarı (key) yaradır. Məsələn: horoscope_Qoç_2023-10-27
  static String _getDailyKey(String zodiacName) {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    return '$_prefix${zodiacName}_$today';
  }

  /// Bürc məlumatını saxlayır
  static Future<void> saveHoroscope(String zodiacName, String content) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getDailyKey(zodiacName);
    await prefs.setString(key, content);
  }

  /// Bugünkü bürc məlumatını qaytarır. Yoxdursa null qaytarır
  static Future<String?> getHoroscope(String zodiacName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getDailyKey(zodiacName);
    return prefs.getString(key);
  }
}
