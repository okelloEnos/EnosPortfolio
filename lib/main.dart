import 'package:enos_portfolio/features/home/ui/screens/portfolio_screen.dart';
import 'package:enos_portfolio/util/app_theme.dart';
import 'package:enos_portfolio/util/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor:CustomColors.primary,
  //   statusBarColor: CustomColors.primary,
  // ));
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PortfolioView();
  }
}


class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enos Okello',
      theme: AppTheme.lightTheme(),
      // darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


