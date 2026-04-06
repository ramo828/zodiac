import 'package:flutter/material.dart';
import 'dart:math';

/// Yuksek kaliteli Aurora gokyuzu boyama sinifi
class AuroraSkyBackgroundPainter extends CustomPainter {
  final double animationValue;

  AuroraSkyBackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Gece mavisi gradient arka plan
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0E27),
          const Color(0xFF16213E),
          const Color(0xFF1A1A3F),
          const Color(0xFF0F0F23),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      gradientPaint,
    );

    _drawAurora(canvas, size);
    _drawStars(canvas, size);
    _drawMoon(canvas, size);
  }

  // Aurora effektini ciz
  void _drawAurora(Canvas canvas, Size size) {
    final aurora1 = Paint()
      ..color = const Color(
        0xFF00FF88,
      ).withValues(alpha: 0.15 + 0.05 * sin(animationValue * pi))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

    final aurora2 = Paint()
      ..color = const Color(
        0xFF00FFAA,
      ).withValues(alpha: 0.12 + 0.04 * sin(animationValue * pi + pi / 2))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 100);

    final aurora3 = Paint()
      ..color = const Color(
        0xFF00DD99,
      ).withValues(alpha: 0.1 + 0.03 * sin(animationValue * pi + pi))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 120);

    for (int i = 0; i < 5; i++) {
      final yOffset =
          size.height * 0.2 + (i * 30) + sin(animationValue * 2 * pi + i) * 20;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, yOffset),
          width: size.width * 1.5,
          height: 150,
        ),
        aurora1,
      );
    }

    for (int i = 0; i < 4; i++) {
      final yOffset =
          size.height * 0.25 + (i * 40) + cos(animationValue * 2 * pi + i) * 25;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width / 2.2, yOffset),
          width: size.width * 1.3,
          height: 180,
        ),
        aurora2,
      );
    }

    for (int i = 0; i < 3; i++) {
      final yOffset =
          size.height * 0.3 + (i * 50) + sin(animationValue * pi + i) * 30;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width / 1.8, yOffset),
          width: size.width * 1.2,
          height: 200,
        ),
        aurora3,
      );
    }
  }

  // Ulduzlari ciz
  void _drawStars(Canvas canvas, Size size) {
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final stars = <Offset>[
      Offset(size.width * 0.15, size.height * 0.1),
      Offset(size.width * 0.3, size.height * 0.08),
      Offset(size.width * 0.55, size.height * 0.12),
      Offset(size.width * 0.75, size.height * 0.15),
      Offset(size.width * 0.9, size.height * 0.1),
      Offset(size.width * 0.2, size.height * 0.25),
      Offset(size.width * 0.45, size.height * 0.22),
      Offset(size.width * 0.8, size.height * 0.28),
      Offset(size.width * 0.1, size.height * 0.4),
      Offset(size.width * 0.65, size.height * 0.35),
      Offset(size.width * 0.85, size.height * 0.42),
      Offset(size.width * 0.35, size.height * 0.38),
      Offset(size.width * 0.6, size.height * 0.05),
      Offset(size.width * 0.25, size.height * 0.5),
      Offset(size.width * 0.7, size.height * 0.48),
    ];

    for (int i = 0; i < stars.length; i++) {
      final opacity = 0.6 + 0.4 * sin(animationValue * 2 * pi + i);
      starPaint.color = Colors.white.withValues(alpha: opacity);
      final radius = 1.5 + 0.5 * sin(animationValue * pi + i);
      canvas.drawCircle(stars[i], radius, starPaint);
    }

    final random = Random(42);
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.6;
      final opacity = (0.3 + 0.3 * sin(animationValue * 1.5 * pi + i)) * 0.8;
      starPaint.color = Colors.white.withValues(alpha: opacity);
      canvas.drawCircle(Offset(x, y), 0.8, starPaint);
    }
  }

  // Ayi ciz
  void _drawMoon(Canvas canvas, Size size) {
    final moonPaint = Paint()..color = Colors.white.withValues(alpha: 0.95);

    final moonCx = size.width * 0.85;
    final moonCy = size.height * 0.2;
    const moonRadius = 50.0;

    canvas.drawCircle(Offset(moonCx, moonCy), moonRadius, moonPaint);

    final innerMoonPaint = Paint()
      ..color = const Color(0xFF0A0E27)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(moonCx + moonRadius * 0.3, moonCy),
      moonRadius,
      innerMoonPaint,
    );

    final moonGlow = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 20);
    canvas.drawCircle(Offset(moonCx, moonCy), moonRadius + 5, moonGlow);
  }

  @override
  bool shouldRepaint(AuroraSkyBackgroundPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

/// Burc golge boyama sinifi
class ZodiacShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6A1B9A).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Sadə burç sembolleri
    canvas.drawPath(
      Path()
        ..moveTo(size.width * 0.1, size.height * 0.3)
        ..lineTo(size.width * 0.15, size.height * 0.25)
        ..lineTo(size.width * 0.2, size.height * 0.3)
        ..lineTo(size.width * 0.15, size.height * 0.35),
      paint,
    );

    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.4), 15, paint);

    canvas.drawPath(
      Path()
        ..moveTo(size.width * 0.5, size.height * 0.2)
        ..lineTo(size.width * 0.55, size.height * 0.25)
        ..lineTo(size.width * 0.5, size.height * 0.3)
        ..lineTo(size.width * 0.45, size.height * 0.25),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Burc dairə boyama sinifi - Yarim daire burclar animasyonu
class HoroscopeZodiacRingPainter extends CustomPainter {
  final double animationValue;

  HoroscopeZodiacRingPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // Ust tarafta merkez
    final center = Offset(size.width / 2, size.height * 0.15);
    final radius =
        min(size.width, size.height) * 0.25; // Daha kucuk yarim daire

    // Burc sembolleri
    final zodiacSymbols = [
      '♈',
      '♉',
      '♊',
      '♋',
      '♌',
      '♍',
      '♎',
      '♏',
      '♐',
      '♑',
      '♒',
      '♓',
    ];

    for (int i = 0; i < zodiacSymbols.length; i++) {
      // Saat istiqamətində hərəkət - ust yarim daire icin
      final angle =
          (i * 30 - animationValue * 1080) *
          pi /
          180; // Daha hizli ve smooth hareket
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      // Sadece ust yarim daireyi goster (y < center.dy + radius)
      if (y <= center.dy + radius * 0.8) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: zodiacSymbols[i],
            style: const TextStyle(
              color: Color(0xFF6A1B9A),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();

        // Gölgə effekti
        final shadowPaint = Paint()
          ..color = const Color(0xFF9C27B0).withValues(alpha: 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

        canvas.drawCircle(Offset(x, y), 12, shadowPaint);

        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, y - textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(HoroscopeZodiacRingPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

/// Gunes/Ay boyama sinifi - Gunduz/Gece mod gecisi
class CelestialBodyTransitionPainter extends CustomPainter {
  final double animationValue; // 0: Ay, 1: Gunes
  final bool isDarkMode;
  final bool isTransitioningToDark;

  CelestialBodyTransitionPainter({
    required this.animationValue,
    required this.isDarkMode,
    required this.isTransitioningToDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.85, size.height * 0.2);
    const moonRadius = 50.0;
    const sunRadius = 50.0;

    // Ay ciz (gece modu)
    if (isDarkMode) {
      final moonOpacity = animationValue < 0.5 ? 1.0 - animationValue * 2 : 0.0;
      final moonPaint = Paint()
        ..color = Colors.white.withValues(alpha: 0.95 * moonOpacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, moonRadius, moonPaint);

      if (moonOpacity > 0) {
        final innerMoonPaint = Paint()
          ..color = const Color(0xFF0A0E27).withValues(alpha: moonOpacity)
          ..style = PaintingStyle.fill;

        canvas.drawCircle(
          Offset(center.dx + moonRadius * 0.3, center.dy),
          moonRadius,
          innerMoonPaint,
        );

        final moonGlow = Paint()
          ..color = Colors.white.withValues(alpha: 0.2 * moonOpacity)
          ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 20);
        canvas.drawCircle(center, moonRadius + 5, moonGlow);
      }
    } else {
      // Gunes ciz (gunduz modu)
      final sunOpacity = animationValue > 0.5
          ? (animationValue - 0.5) * 2
          : 0.0;
      final sunPaint = Paint()
        ..color = const Color(0xFFFFD700).withValues(alpha: 0.9 * sunOpacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, sunRadius, sunPaint);

      if (sunOpacity > 0) {
        // Gunes isinlari
        final rayPaint = Paint()
          ..color = const Color(0xFFFFD700).withValues(alpha: 0.6 * sunOpacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

        for (int i = 0; i < 8; i++) {
          final angle = i * pi / 4;
          final startX = center.dx + (sunRadius + 5) * cos(angle);
          final startY = center.dy + (sunRadius + 5) * sin(angle);
          final endX = center.dx + (sunRadius + 20) * cos(angle);
          final endY = center.dy + (sunRadius + 20) * sin(angle);

          canvas.drawLine(Offset(startX, startY), Offset(endX, endY), rayPaint);
        }

        final sunGlow = Paint()
          ..color = const Color(0xFFFFD700).withValues(alpha: 0.3 * sunOpacity)
          ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 25);
        canvas.drawCircle(center, sunRadius + 10, sunGlow);
      }
    }
  }

  @override
  bool shouldRepaint(CelestialBodyTransitionPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue ||
      oldDelegate.isDarkMode != isDarkMode ||
      oldDelegate.isTransitioningToDark != isTransitioningToDark;
}
