import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static const String _groqApiUrl = 'https://api.groq.com/openai/v1/chat/completions';

  /// Groq API-dən bürc haqqında məlumat alır
  static Future<String> fetchDailyHoroscope(String zodiacName) async {
    final apiKey = dotenv.env['GROQ_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('API açarı tapılmadı! Lütfən .env faylını yoxlayın.');
    }

    final prompt = '''
$zodiacName bürcü üçün bu günkü şanslarını, sevgi, iş və sağlamlıq təxminlərini, eyni zamanda önəmli xəbərdarlıqları 2 abzaslıq motivasiyaedici bir mətnlə Azərbaycan dilində ver.
Heç bir giriş və ya salamlaşma sözü ("Budur", "Salam", "Təbii ki" və s.) istifadə etmə, birbaşa məlumatı yaz!
''';

    try {
      final response = await http.post(
        Uri.parse(_groqApiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'llama-3.3-70b-versatile',
          'messages': [
            {
              'role': 'user',
              'content': prompt,
            }
          ],
          'temperature': 0.7,
          'max_tokens': 500,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final content = data['choices'][0]['message']['content'] as String;
        return content.trim();
      } else {
        throw Exception('Server xətası: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('İnternet bağlantısı və ya API xətası: $e');
    }
  }
}
