import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phonix_smartphone_store/home_screen/view/my_app_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPProvider extends ChangeNotifier {
  // Variables for the textformfields.
  final otpTextEditingController = TextEditingController();

  // Method to fetch the OTP from the backend.

  Future<dynamic> varifyOTP(String mobileNumber, String otp, context) async {
    try {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/otpVerify'), body: {
        "mobileNumber": mobileNumber,
        'otp': otp,
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('Incorrect OTP, Try again'),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
