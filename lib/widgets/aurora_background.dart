import 'package:flutter/material.dart';
import '../painters/custom_painters.dart';

/// Aurora Arka Plan Widget'i - Sürekli animasyon
/// Bu widget Aurora efektini sürekli döndüren bağımsız bir animasyon sağlar
class AuroraBackground extends StatefulWidget {
  const AuroraBackground({super.key});

  @override
  State<AuroraBackground> createState() => _AuroraBackgroundState();
}

class _AuroraBackgroundState extends State<AuroraBackground>
    with TickerProviderStateMixin {
  /// Animasyon kontrolcüsü - Aurora efektinin hareketini yönetir
  late AnimationController _animationController;

  /// Animasyon değeri - 0'dan 1'e kadar olan değer Aurora efektini hareket ettirir
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
          child: CustomPaint(
            // Aurora efektini çiz
            painter: AuroraSkyBackgroundPainter(
              animationValue: _animation.value,
            ),
          ),
        );
      },
    );
  }
}
