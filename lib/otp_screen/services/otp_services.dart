import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/otp_screen/controller/otp_provider.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen/view/my_app_screen.dart';
import '../../sign_up_screen/controller/sign_up_provider.dart';
import '../../widgets/snackbar/snackbar.dart';

class OtpServices{
  static Future<dynamic> varifyOTP(String mobileNumber, String otp, context) async {
    try {
      Response response =
          await Dio().post(Urls.baseUrl + Urls.otpVarification, data: {
        "mobileNumber": mobileNumber,
        "otp": otp,
      });
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MyAppScreen(),
            ),
            (route) => false);

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('mobileNumber', mobileNumber);

        Provider.of<SignUpProvider>(context, listen: false)
            .nameEditingController
            .clear();
        Provider.of<SignUpProvider>(context, listen: false)
            .mobileNumberEditingController
            .clear();
        Provider.of<SignUpProvider>(context, listen: false)
            .emailEditingController
            .clear();
        Provider.of<SignUpProvider>(context, listen: false)
            .passwordEditingController
            .clear();
        Provider.of<SignUpProvider>(context, listen: false)
            .confirmPasswordEditingController
            .clear();
            Provider.of<OTPProvider>(context, listen: false)
            .otpTextEditingController
            .clear();
      } else {
        SnackBarPopUp.popUp(
          context: context,
          text: 'Incorrect OTP, Try again',
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