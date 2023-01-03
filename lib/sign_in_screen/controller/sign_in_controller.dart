import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  /// Finalized variables

  bool passwordVisibility = true;

  /// Set function

// This function is for making the obscureText make true and false.
  void setPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }
}
