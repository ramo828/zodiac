import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../theme/app_theme.dart';
import '../providers/theme_provider.dart';
import '../config/app_config.dart';

/// Burc karti widget'i
class ZodiacCard extends StatelessWidget {
  final String symbol;
  final String name;
  final int index;
  final VoidCallback onTap;

  const ZodiacCard({
    super.key,
    required this.symbol,
    required this.name,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox.shrink(),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Theme.of(context).cardTheme.color?.withValues(alpha: 0.2) ?? Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            elevation: 0,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    symbol,
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Ozel Drawer Menu
class AppDrawer extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onTermsTap;
  final VoidCallback onThemeToggle;

  const AppDrawer({
    super.key,
    required this.onAboutTap,
    required this.onTermsTap,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.darkNavy,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primaryPurple,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppTheme.primaryPurple, AppTheme.secondaryPurple],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.star, color: Colors.white, size: 40),
                const SizedBox(height: 12),
                const Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6, color: Colors.white70),
            title: const Text(
              'Tema Dəyiş',
              style: TextStyle(color: Colors.white),
            ),
            onTap: onThemeToggle,
            hoverColor: AppTheme.secondaryPurple.withValues(alpha: 0.2),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.white70),
            title: const Text(
              AppStrings.aboutMenu,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onAboutTap();
            },
            hoverColor: AppTheme.secondaryPurple.withValues(alpha: 0.2),
          ),
          ListTile(
            leading: const Icon(
              Icons.description_outlined,
              color: Colors.white70,
            ),
            title: const Text(
              AppStrings.termsMenu,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              onTermsTap();
            },
            hoverColor: AppTheme.secondaryPurple.withValues(alpha: 0.2),
          ),
          const Divider(color: AppTheme.secondaryPurple, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '©2024 Bürc Aləmi\nBütün hüquqlar qorunur.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}

/// Dialog gösterme helper
class AppDialogs {
  static void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.deepNavy,
        title: Text(
          AppStrings.aboutMenu,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppTheme.auroraGreen),
        ),
        content: SingleChildScrollView(
          child: Text(
            AppAbout.aboutContent,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              AppStrings.closeButton,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  static void showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.deepNavy,
        title: Text(
          AppStrings.termsMenu,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppTheme.auroraGreen),
        ),
        content: SingleChildScrollView(
          child: Text(
            AppTerms.termsContent,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              AppStrings.closeButton,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bütün ekranlar üçün ortaq (Təkrarsız) Arxa Plan İdarəçisi
class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final bool isZodiacScreen;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.isZodiacScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        final isDark = themeProvider.isDarkMode;
        final bgImage = AppConfig.getBackgroundImage(
          isDark,
          isZodiacScreen: isZodiacScreen,
        );
        final overlayOpacity = AppConfig.getOverlayOpacity(isDark);

        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(bgImage, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: ColoredBox(
                color: (isDark ? Colors.black : Colors.white)
                    .withValues(alpha: overlayOpacity),
              ),
            ),
            Positioned.fill(child: child),
          ],
        );
      },
    );
  }
}

/// Özel Animasyonlu Tema Değiştirme Butonu (Glassmorphism Switch)
class AnimatedThemeSwitch extends StatelessWidget {
  const AnimatedThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.isDarkMode;
        return GestureDetector(
          onTap: () => themeProvider.toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 70,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDark ? AppTheme.darkNavy.withValues(alpha: 0.8) : AppTheme.lightBlue.withValues(alpha: 0.8),
              border: Border.all(
                color: isDark ? AppTheme.primaryPurple.withValues(alpha: 0.5) : AppTheme.primaryLightPurple.withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isDark ? AppTheme.primaryPurple.withValues(alpha: 0.3) : AppTheme.primaryLightPurple.withValues(alpha: 0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark ? AppTheme.darkNavy : Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
                      child: Icon(
                        isDark ? Icons.nightlight_round : Icons.wb_sunny,
                        size: 16,
                        color: isDark ? Colors.white : Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Ortak Kullanım İçin Glassmorphic Metin Girişi
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox.shrink(),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            filled: true,
            isDense: false,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            fillColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          ),
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
    );
  }
}

/// Ortak Kullanım İçin Glassmorphic Buton
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const SizedBox.shrink(),
              ),
            ),
          ),
          Positioned.fill(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
                    width: 1,
                  )
                ),
              ),
              child: Text(
                text, 
                style: const TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
