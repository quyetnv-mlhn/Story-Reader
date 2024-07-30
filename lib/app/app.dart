import 'package:flutter/material.dart';
import 'package:story_reader/core/theme/app_colors.dart';
import 'package:story_reader/feature/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const App({super.key, required this.scaffoldMessengerKey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Story App',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        hintColor: AppColors.accent,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const HomePage(),
    );
  }
}
