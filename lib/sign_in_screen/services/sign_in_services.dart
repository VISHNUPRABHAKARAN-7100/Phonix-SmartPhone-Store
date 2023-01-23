import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/sign_in_screen/model/sign_in_model.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/view/my_app_screen.dart';
import '../../widgets/snackbar/snackbar.dart';
import '../controller/sign_in_provider.dart';

class SignInService {
  // The function to user sign in the application
  static Future<dynamic> signIn(SignInModel signInModel, context) async {
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
      var response = await Dio()
          .post(Urls.baseUrl + Urls.userLogin, data: signInModel.toJson());
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MyAppScreen(),
            ),
            (route) => false);

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
            'mobileNumber', signInModel.mobileNumber.toString());
        Provider.of<SignInProvider>(context, listen: false)
            .mobileNumberController
            .clear();
        Provider.of<SignInProvider>(context, listen: false)
            .passwordController
            .clear();
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 101 && e.response!.statusCode != null) {
        Navigator.of(context).pop();
        SnackBarPopUp.popUp(
          context: context,
          text: 'No Internet Connection',
          color: Colors.red,
        );
      } else if (e.response!.statusCode == 403) {
        Navigator.of(context).pop();
        SnackBarPopUp.popUp(
          context: context,
          text: 'Invalid password',
          color: Colors.red,
        );
      } else if (e.response!.statusCode == 401) {
        Navigator.of(context).pop();
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
