// file: main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/app/app.dart';
import 'package:story_reader/app/app_bloc_observer.dart';
import 'package:story_reader/core/utils/snackbar_handler.dart';
import 'package:story_reader/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await initDependencyInjection();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  SnackBarHandler.initialize(scaffoldMessengerKey);

  runApp(App(scaffoldMessengerKey: scaffoldMessengerKey));
}
