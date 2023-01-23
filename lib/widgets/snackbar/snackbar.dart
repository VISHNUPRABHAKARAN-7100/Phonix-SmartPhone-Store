import 'package:flutter/material.dart';

class SnackBarPopUp {
  static Future<void> popUp({
    required BuildContext context,
    required String text,
    required Color color,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15.0),
        elevation: 6.0,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
