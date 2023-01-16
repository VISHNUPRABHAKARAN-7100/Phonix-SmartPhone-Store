import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/sign_in_screen/controller/sign_in_provider.dart';
import 'package:phonix_smartphone_store/sign_up_screen/controller/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../sign_in_screen/view/sign_in_screen.dart';

class ProfileProvider with ChangeNotifier {
  // Function of Logout button.
  logOutFunction(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('mobileNumber');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
    Provider.of<SignInProvider>(context, listen: false)
        .mobileNumberController
        .clear();
    Provider.of<SignInProvider>(context, listen: false)
        .passwordController
        .clear();
    Provider.of<SignUpProvider>(context, listen: false)
        .nameEditingController
        .clear();
    Provider.of<SignUpProvider>(context, listen: false)
        .mobileNumberEditingController
        .clear();
    Provider.of<SignUpProvider>(context, listen: false)
        .emailEditingController
        .clear();
    Provider.of<SignUpProvider>(context, listen: false)
        .passwordEditingController
        .clear();
    Provider.of<SignUpProvider>(context, listen: false)
        .confirmPasswordEditingController
        .clear();
  }
}
