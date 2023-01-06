import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phonix_smartphone_store/home_screen/view/home_screen.dart';

class OTPProvider extends ChangeNotifier {
  // Variables for the textformfields.
  final otpTextEditingController = TextEditingController();

  // Method to fetch the OTP from the backend.
  // Future<dynamic> fetchOTP(
  //     String name, String number, String email, String password) async {
  //   try {
  //     var response = await http.post(Uri.parse('http://10.0.2.2:8000/register'),
  //         body: {
  //           'name': name,
  //           'mobileNumber': number,
  //           'email': email,
  //           'password': password
  //         });
  //     print(response.body);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<dynamic> varifyOTP(String mobileNumber, String otp, context) async {
    var response =
        await http.post(Uri.parse('http://10.0.2.2:8000/otpVerify'), body: {
      "mobileNumber": mobileNumber,
      'otp': otp,
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey,
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
  }
}
