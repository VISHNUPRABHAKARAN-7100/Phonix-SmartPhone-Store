import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignUpProvider extends ChangeNotifier {
// Functions for sending the OTP to mail ID.

  Future<void> varifyOtp(String otp) async {
    try {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/otpVerify'), body: {
        'Otp': otp,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
