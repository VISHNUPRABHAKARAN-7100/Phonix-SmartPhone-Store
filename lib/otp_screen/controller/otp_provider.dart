import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OTPProvider extends ChangeNotifier {
  // Textformfield variables
  final otpTextEditingController = TextEditingController();
  late String _otp;

  String get otp => _otp;

  // Method to fetch the OTP from the backend.
  Future<dynamic> fetchOTP() async {
    try {
      var response =
          await http.post(Uri.parse('http://10.0.2.2:8000/register'));
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
