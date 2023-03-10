import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/otp_screen/controller/otp_provider.dart';
import 'package:phonix_smartphone_store/sign_in_screen/controller/sign_in_provider.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:provider/provider.dart';
import '../../sign_up_screen/controller/sign_up_provider.dart';
import '../../widgets/snackbar/snackbar.dart';

class OtpServices {
  static Future<dynamic> varifyOTP(
      String mobileNumber, String otp, context) async {
// This widget is used to show a circular progress indicator
    // to the user that the server is loading.
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
    );

    try {
      Response response =
          await Dio().post(Urls.baseUrl + Urls.otpVarification, data: {
        "mobileNumber": mobileNumber,
        "otp": otp,
      });
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ),
            (route) => false);
        log('Sign up${response.data}');

        

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
        Provider.of<SignInProvider>(context, listen: false)
            .mobileNumberController
            .clear();
        Provider.of<SignInProvider>(context, listen: false)
            .passwordController
            .clear();
      } else {
        Navigator.of(context).pop();
        SnackBarPopUp.popUp(
          context: context,
          text: 'Incorrect OTP, Try again',
          color: Colors.red,
        );
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 101 && e.response!.statusCode != null) {
        Navigator.of(context).pop();
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
