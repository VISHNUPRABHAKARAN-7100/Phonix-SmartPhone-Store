import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  /// Finalized variables

  bool passwordVisibility = true;

  ///Textformfield controller variables.
  
  
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  /// Set function

// This function is for making the obscureText make true and false.
  void setPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  
}








