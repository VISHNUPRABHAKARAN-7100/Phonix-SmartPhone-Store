import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/common/snackbar/snackbar.dart';
import 'package:phonix_smartphone_store/sign_up_screen/model/sign_up_model.dart';
import 'package:phonix_smartphone_store/utils/url.dart';

import '../../otp_screen/view/otp_screen.dart';

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

// Variables for show loader.
  bool showLoader = false;

// Functions for show loader.
  void showLoadingFunction(bool value) {
    showLoader = value;
    notifyListeners();
  }

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

// Functions for sending the OTP to Mobile Number.
  Future<dynamic> sendOtp(SignUpModel model, context) async {
    showLoadingFunction(true);
    try {
      Response response =
          await Dio().post(baseUrl + registerNewUs, data: model.toJson());
      if (response.statusCode == 200) {
        showLoadingFunction(false);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              mobileNumber: mobileNumberEditingController.text,
            ),
          ),
        );
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'User already exists...',
          color: Colors.red,
        );
      } else if (e is SocketException) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'No Internet',
          color: Colors.red,
        );
      }
    }
  }
}
