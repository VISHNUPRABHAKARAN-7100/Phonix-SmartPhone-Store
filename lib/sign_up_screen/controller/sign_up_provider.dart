import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignUpProvider extends ChangeNotifier {
  // Variables for textformfields.

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final mobileNumberEditingController = TextEditingController();

  // Variables for password visibility.
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  // Functions for changing the password visibility
  changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void cancelButtonFunction(context) {
    nameEditingController.clear();
    emailEditingController.clear();
    passwordEditingController.clear();
    confirmPasswordEditingController.clear();
    mobileNumberEditingController.clear();
    Navigator.pop(context);
  }

// Functions for sending the OTP to mail ID.
  Future<dynamic> sendOtp(
      String name, String mobileNumber, String email, String password) async {
    try {
      var response = await http.post(Uri.parse('http://10.0.2.2:8000/register'),
          body: {
            'name': name,
            'mobileNumber': mobileNumber,
            'email': email,
            'password': password
          });
    } catch (e) {
      log(e.toString());
    }
  }
}
