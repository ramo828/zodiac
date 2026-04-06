import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../constants/app_constants.dart';
import '../widgets/app_widgets.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

/// Bürc Detay Ekranı
/// Seçilən bürc haqqında məlumatları göstərir
class ZodiacDetailScreen extends StatelessWidget {
  final int zodiacIndex;
  final String zodiacName;

  const ZodiacDetailScreen({
    super.key,
    required this.zodiacIndex,
    required this.zodiacName,
  });

  Future<String> _loadHoroscope() async {
    final cached = await StorageService.getHoroscope(zodiacName);
    if (cached != null && cached.isNotEmpty) return cached;
    
    final fresh = await ApiService.fetchDailyHoroscope(zodiacName);
    await StorageService.saveHoroscope(zodiacName, fresh);
    return fresh;
  }

  @override
  Widget build(BuildContext context) {
    final zodiac = ZodiacConstants.zodiacSigns[zodiacIndex];

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          body: BackgroundWrapper(
            isZodiacScreen: true,
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bürc Simvolu
                    Text(
                      zodiac['symbol']!,
                      style: const TextStyle(fontSize: 120),
                    ),
                    const SizedBox(height: 32),
                    // Bürc Adı
                    Text(
                      zodiacName,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    // Məlumat Mətni
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        child: FutureBuilder<String>(
                          future: _loadHoroscope(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(color: Colors.white),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                'Məlumat alarkən xəta baş verdi.\\nZəhmət olmasa interneti və ya API açarını yoxlayın.',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.redAccent),
                                textAlign: TextAlign.center,
                              );
                            } else if (snapshot.hasData) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)),
                                ),
                                child: Text(
                                  snapshot.data!,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
