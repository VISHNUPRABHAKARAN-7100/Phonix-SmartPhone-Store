import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/home_screen/view/carausel_widget.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
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
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [CarouselWidget(),],
        ));
  }
}
