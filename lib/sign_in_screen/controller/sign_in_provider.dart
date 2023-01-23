import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phonix_smartphone_store/widgets/snackbar/snackbar.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:provider/provider.dart';
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


// This function is for making the obscureText make true and false.
  void setPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  // The function to user sign in the application

  Future<dynamic> signIn(String mobileNumber, String password, context) async {
    showLoadingFunction(true);
    try {
      var response = await Dio().post(baseUrl + userLogin, data: {
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

        Provider.of<SignInProvider>(context, listen: false)
            .mobileNumberController
            .clear();
        Provider.of<SignInProvider>(context, listen: false)
            .passwordController
            .clear();
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
    } on DioError catch (e) {
      if (e.response!.statusCode == 101 && e.response!.statusCode != null) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'No Internet Connection',
          color: Colors.red,
        );
      }
      log(e.toString());
    }
  }
}
