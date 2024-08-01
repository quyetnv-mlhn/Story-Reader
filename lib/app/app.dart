import 'package:flutter/material.dart';
import 'package:story_reader/feature/home/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final ThemeData theme;
  final ThemeData darkTheme;

  const App({
    super.key,
    required this.scaffoldMessengerKey,
    required this.theme,
    required this.darkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Story App',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
