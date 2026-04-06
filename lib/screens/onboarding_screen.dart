import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../config/app_config.dart';
import '../widgets/app_widgets.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';

/// Onboarding Ekranlar İdarəçisi
/// Bu klass onboarding prosesini idarə edir və səhifə dəyişmə animasiyalarına cavabdehdir
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  /// Səhifə idarəçisi - onboarding səhifələri arası keçidi idarə edir
  final PageController _pageController = PageController();

  /// Növbəti səhifənin indeksi
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final pageIndicatorColor = AppConfig.getPageIndicatorActiveColor(
          themeProvider.isDarkMode,
        );
        return Scaffold(
          body: BackgroundWrapper(
            child: Stack(
              children: [
                PageView.custom(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() => _currentPage = page);
                  },
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      switch (index) {
                        case 0:
                          return const LoginScreen();
                        case 1:
                          return const RegisterScreen();
                        case 2:
                          return const HomeScreen();
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                    childCount: 3,
                    addRepaintBoundaries: false,
                  ),
                ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3, // 3 fərqli səhifə
                    (index) => AnimatedContainer(
                      duration: AppConfig.pageIndicatorAnimationDuration,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentPage == index ? 20 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? pageIndicatorColor
                            : AppConfig.pageIndicatorInactiveColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: const AnimatedThemeSwitch(),
              ),
              ],
            ),
          ),
        );
      },
    );
  }
}
