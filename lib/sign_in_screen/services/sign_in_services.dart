import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/view/my_app_screen.dart';
import '../../widgets/snackbar/snackbar.dart';
import '../controller/sign_in_provider.dart';

class SignInService {
  // The function to user sign in the application
  static Future<dynamic> signIn(
      String mobileNumber, String password, context) async {
    // showLoadingFunction(true);
    try {
      var response = await Dio().post(Urls.baseUrl + Urls.userLogin, data: {
        'mobileNumber': mobileNumber,
        'password': password,
      });

      if (response.statusCode == 200) {
        // showLoadingFunction(false);
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
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 101 && e.response!.statusCode != null) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'No Internet Connection',
          color: Colors.red,
        );
      } else if (e.response!.statusCode == 403) {
        // showLoadingFunction(true);
        SnackBarPopUp.popUp(
          context: context,
          text: 'Invalid password',
          color: Colors.red,
        );
      } else if (e.response!.statusCode == 401) {
        SnackBarPopUp.popUp(
          context: context,
          text: 'User does not exist...',
          color: Colors.red,
        );
      }
      log(e.toString());
    }
  }
}
