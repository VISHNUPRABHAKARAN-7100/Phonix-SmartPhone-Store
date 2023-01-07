import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('mobileNumber');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          },
          child: const Text('Log out'),
        ),
      ),
    );
  }
}
