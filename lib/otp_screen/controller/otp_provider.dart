import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/common/snackbar/snackbar.dart';
import 'package:phonix_smartphone_store/home_screen/view/my_app_screen.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPProvider extends ChangeNotifier {
  // Variables for the textformfields.
  final otpTextEditingController = TextEditingController();

  // Method to fetch the OTP from the backend.

  Future<dynamic> varifyOTP(String mobileNumber, String otp, context) async {
    try {
      Response response = await Dio().post(baseUrl + otpVarification, data: {
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
