import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_theme/json_theme.dart';
import 'package:story_reader/app/app.dart';
import 'package:story_reader/app/app_bloc_observer.dart';
import 'package:story_reader/core/utils/snackbar_handler.dart';
import 'package:story_reader/gen/assets.gen.dart';
import 'package:story_reader/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // Initialize dependency injection
  await initDependencyInjection();

  // Initialize SnackBarHandler
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  SnackBarHandler.initialize(scaffoldMessengerKey);

  // Load light themes
  final themeStr = await rootBundle.loadString(Assets.theme.appainterTheme);
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  // Load dark themes
  final darkThemeStr =
      await rootBundle.loadString(Assets.theme.appainterDarkTheme);
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson)!;

  //Load environment
  await dotenv.load(fileName: '.env.production');

  runApp(
    App(
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: theme,
      darkTheme: darkTheme,
    ),
  );
}
