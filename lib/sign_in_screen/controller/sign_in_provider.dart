import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phonix_smartphone_store/common/snackbar/snackbar.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
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
      var response = await http.post(Uri.parse(baseUrl + userLogin), body: {
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
        showLoadingFunction(true);
        SnackBarPopUp.popUp(
          context: context,
          text: 'Invalid password',
          color: Colors.red,
        );
      } else if (response.statusCode == 401) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'User does not exist...',
          color: Colors.red,
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
