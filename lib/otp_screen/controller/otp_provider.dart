import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OTPProvider extends ChangeNotifier {
  
  late String _otp;

  String get otp => _otp;

  // Method to fetch the OTP from the backend.
  Future<dynamic> fetchOTP(
      String name, String number, String email, String password) async {
    try {
      var response = await http.post(Uri.parse('http://10.0.2.2:8000/register'),
          body: {
            'name': name,
            'mobileNumber': number,
            'email': email,
            'password': password
          });
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
