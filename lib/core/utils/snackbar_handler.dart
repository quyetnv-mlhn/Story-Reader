import 'package:flutter/material.dart';

class SnackBarHandler {
  static GlobalKey<ScaffoldMessengerState>? _scaffoldMessengerKey;

  static void initialize(
      GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey) {
    _scaffoldMessengerKey = scaffoldMessengerKey;
  }

  static void showError(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.red,
    );
  }

  static void showSuccess(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.green,
    );
  }

  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
  }) {
    if (_scaffoldMessengerKey != null) {
      _scaffoldMessengerKey?.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }
}
