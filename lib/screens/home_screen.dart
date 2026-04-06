import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../widgets/app_widgets.dart';
import '../providers/theme_provider.dart';
import '../config/app_config.dart';
import 'zodiac_detail_screen.dart';

/// Ana Ekran
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(AppStrings.appTitle),
            centerTitle: true,
          ),
          drawer: AppDrawer(
            onAboutTap: () => AppDialogs.showAboutDialog(context),
            onTermsTap: () => AppDialogs.showTermsDialog(context),
            onThemeToggle: () => context.read<ThemeProvider>().toggleTheme(),
          ),
          body: BackgroundWrapper(
            isZodiacScreen: true,
            child: SafeArea(
                child: Padding(
                  padding: AppConfig.screenPadding,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.discoverTitle,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppConfig.largeSpacing),
                      Expanded(
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: AppConfig.zodiacGridCrossAxisCount,
                            crossAxisSpacing: AppConfig.zodiacGridSpacing,
                            mainAxisSpacing: AppConfig.zodiacGridSpacing,
                          ),
                          itemCount: 12,
                          addRepaintBoundaries: false,
                          itemBuilder: (context, index) {
                            final zodiac = ZodiacConstants.zodiacSigns[index];
                            return ZodiacCard(
                              symbol: zodiac['symbol']!,
                              name: zodiac['az']!,
                              index: index,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ZodiacDetailScreen(
                                      zodiacIndex: index,
                                      zodiacName: zodiac['az']!,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
