import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../sign_in_screen/view/sign_in_screen.dart';

class ProfileProvider with ChangeNotifier {
  // Function of Logout button.
  logOutFunction(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('mobileNumber');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }
}
