import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/cart_sceen/controller/cart_provider.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/controller/profile_provider.dart';
import 'package:phonix_smartphone_store/otp_screen/controller/otp_provider.dart';
import 'package:phonix_smartphone_store/sign_in_screen/controller/sign_in_provider.dart';
import 'package:phonix_smartphone_store/sign_up_screen/controller/sign_up_provider.dart';
import 'package:phonix_smartphone_store/splash_screen/controller/splash_provider.dart';
import 'package:phonix_smartphone_store/splash_screen/view/splash_screen.dart';
import 'package:phonix_smartphone_store/wishlist_screen/controller/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OTPProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
