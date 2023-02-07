import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  String? finalMobielNumber;
  Future getValidation() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedMobileNumber = sharedPreferences.getString('userId');
       finalMobielNumber = obtainedMobileNumber;
  }
}
