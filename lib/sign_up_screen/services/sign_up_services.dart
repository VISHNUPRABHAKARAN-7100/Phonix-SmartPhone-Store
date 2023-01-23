import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/otp_screen/view/otp_screen.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import '../../widgets/snackbar/snackbar.dart';
import '../model/sign_up_model.dart';

class SignUpServices {
// Functions for sending the OTP to Mobile Number.
  static Future<dynamic> sendOtp(
      SignUpModel model, context, String mobileNumberEditingController) async {
    // showLoadingFunction(true);
    try {
      Response response =
          await Dio().post(Urls. baseUrl +Urls. registerNewUser, data: model.toJson());
      if (response.statusCode == 200) {
        // showLoadingFunction(false);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              mobileNumber: mobileNumberEditingController,
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
