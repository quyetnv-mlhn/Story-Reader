import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/theme/app_colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add your BlocProviders here
      ],
      child: MaterialApp(
        title: 'Flutter Story App',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          hintColor: AppColors.accent,
          scaffoldBackgroundColor: AppColors.background,
        ),
        // home: HomePage(),
      ),
    );
  }
}
