import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen/view/my_app_screen.dart';

class SignInProvider extends ChangeNotifier {
  /// Finalized variables

  bool passwordVisibility = true;

  // Variable for showing the loader
  bool showLoader = false;

  void showLoadingFunction(bool value) {
    showLoader = value;
    notifyListeners();
  }

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
    showLoadingFunction(true);
    try {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/login'), body: {
        'mobileNumber': mobileNumber,
        'password': password,
      });

      if (response.statusCode == 200) {
        showLoadingFunction(false);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MyAppScreen(),
            ),
            (route) => false);

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('mobileNumber', mobileNumber);
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
