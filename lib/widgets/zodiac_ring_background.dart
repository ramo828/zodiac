import 'package:flutter/material.dart';
import '../painters/custom_painters.dart';

/// Zodiac Halka Arka Plan Widget'i - Sürekli animasyon
/// Bu widget burç halkasını sürekli döndüren bağımsız bir animasyon sağlar
class ZodiacRingBackground extends StatefulWidget {
  const ZodiacRingBackground({super.key});

  @override
  State<ZodiacRingBackground> createState() => _ZodiacRingBackgroundState();
}

class _ZodiacRingBackgroundState extends State<ZodiacRingBackground>
    with TickerProviderStateMixin {
  /// Animasyon kontrolcüsü - Burç halkasının hareketini yönetir
  late AnimationController _animationController;

  /// Animasyon değeri - 0'dan 1'e kadar olan değer burç halkasını hareket ettirir
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 40 saniyelik sürekli döngü animasyonu
    _animationController = AnimationController(
      duration: const Duration(seconds: 40), // Daha yavaş sürekli hareket
      vsync: this,
    )..repeat();

    // Animasyon değerini 0-1 arası olarak ayarla
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    // Bellek sızıntısını önlemek için animasyon kontrolcüsünü temizle
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // Animasyon değeri değiştiğinde yeniden çiz
      animation: _animation,
      builder: (context, child) {
        return Positioned.fill(
          child: Opacity(
            opacity: 0.1, // Hafif şeffaf burç halkası
            child: CustomPaint(
              // Burç halkasını çiz
              painter: HoroscopeZodiacRingPainter(
                animationValue: _animation.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
