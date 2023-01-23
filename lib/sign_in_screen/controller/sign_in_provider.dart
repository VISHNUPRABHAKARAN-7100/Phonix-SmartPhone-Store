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

  
}
