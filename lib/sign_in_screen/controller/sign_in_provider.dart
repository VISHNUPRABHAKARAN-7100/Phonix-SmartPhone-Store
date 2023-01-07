import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../home_screen/view/home_screen.dart';

class SignInProvider extends ChangeNotifier {
  /// Finalized variables

  bool passwordVisibility = true;

  ///Textformfield controller variables.

  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  /// Set function

// This function is for making the obscureText make true and false.
  void setPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  // The function to user sign in the application

  Future<dynamic> signIn(String mobileNumber, String password, context) async {
    try {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/login'), body: {
        'mobileNumber': mobileNumber,
        'password': password,
      });
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      } else if (response.statusCode == 403) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Invalid password'),
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            content: const Text('Invalid mobile number'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
