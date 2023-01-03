import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';

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
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  SignInScreen(),
        ),
      ),
    );
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
                // fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
