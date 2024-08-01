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
      icon: Icons.error,
    );
  }

  static void showSuccess(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void showInfo(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
    );
  }

  static void showWarning(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    if (_scaffoldMessengerKey != null) {
      _scaffoldMessengerKey?.currentState?.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor: backgroundColor,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
