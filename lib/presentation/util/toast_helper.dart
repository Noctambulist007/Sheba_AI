import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  /// Show a success toast
  static void showSuccess(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 2),
      title: const Text(
        "Success",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(message),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      primaryColor: successColor,
      callbacks: ToastificationCallbacks(
        onDismissed: (_) {}, // Add onDismissed callback to fix Dismissible widget error
      ),
    );
  }

  /// Show an error toast
  static void showError(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
      description: Text(message),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.error, color: Colors.white),
      primaryColor: errorColor,
      callbacks: ToastificationCallbacks(
        onDismissed: (_) {}, // Add onDismissed callback to fix Dismissible widget error
      ),
    );
  }

  /// Show a warning toast
  static void showWarning(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 2),
      title: const Text(
        "Warning",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(message),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.warning, color: Colors.white),
      primaryColor: warningColor,
      callbacks: ToastificationCallbacks(
        onDismissed: (_) {}, // Add onDismissed callback to fix Dismissible widget error
      ),
    );
  }

  /// Show an info toast
  static void showInfo(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 2),
      title: const Text("Info", style: TextStyle(fontWeight: FontWeight.bold)),
      description: Text(message),
      alignment: Alignment.topRight,
      icon: const Icon(Icons.info, color: Colors.white),
      primaryColor: infoColor,
      callbacks: ToastificationCallbacks(
        onDismissed: (_) {}, // Add onDismissed callback to fix Dismissible widget error
      ),
    );
  }
}
