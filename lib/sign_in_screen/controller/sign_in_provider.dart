import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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


// This function is for making the obscureText make true and false.
  void setPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  
}
