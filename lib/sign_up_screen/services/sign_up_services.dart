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
      Response response = await Dio()
          .post(Urls.baseUrl + Urls.registerNewUser, data: model.toJson());
      if (response.statusCode == 200) {
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
        Navigator.of(context).pop();
        SnackBarPopUp.popUp(
          context: context,
          text: 'User already exists...',
          color: Colors.red,
        );
      } else if (e is SocketException) {
        Navigator.of(context).pop();
        SnackBarPopUp.popUp(
          context: context,
          text: 'No Internet',
          color: Colors.red,
        );
      }
    }
  }
}
