import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/view/my_app_screen.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';
import 'package:phonix_smartphone_store/splash_screen/controller/splash_provider.dart';
import 'package:provider/provider.dart';

/// This screen is for displaying the splash screen
/// and after showing the splash screen for 3 seconds
/// the screen will be automatically redirected to the
/// home screen if the user is logged in otherwise
/// it will be automatically redirected to the
/// login screen.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<SplashProvider>(context, listen: false)
        .getValidation()
        .whenComplete(() async {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                (Provider.of<SplashProvider>(context, listen: false)
                            .finalMobielNumber ==
                        null
                    ? SignInScreen()
                    : const MyAppScreen()),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'PHONIX',
              style: GoogleFonts.poppins(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
