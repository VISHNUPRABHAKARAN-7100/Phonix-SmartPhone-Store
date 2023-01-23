import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../sign_in_screen/view/sign_in_screen.dart';
import 'home_sceen_provider.dart';

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
    Provider.of<HomeScreenProvider>(
      context,
      listen: false,
    ).selectedIndexOfBottomNvigationBar = 0;
    notifyListeners();
  }
}
