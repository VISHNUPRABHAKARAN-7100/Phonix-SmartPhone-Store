import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/cart.dart';
import 'package:phonix_smartphone_store/home_screen/view/home_screen.dart';
import 'package:phonix_smartphone_store/home_screen/view/profile.dart';
import 'package:phonix_smartphone_store/home_screen/view/wishlist.dart';
import 'package:phonix_smartphone_store/sign_in_screen/view/sign_in_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This screen is for the base of Home Screen
/// and the screen will change when the user
/// clicks to the bottomnavigation bar items.

class MyAppScreen extends StatelessWidget {
  const MyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> pagesOfBottomNavigation = const [
      HomeScreen(),
      Profile(),
      WishList(),
      Cart()
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 248, 250, 250),
        title: Text(
          'PHONIX',
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontSize: size.height * 0.035),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(),
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
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: pagesOfBottomNavigation[
          Provider.of<HomeScreenProvider>(context).selectedIndex],
      bottomNavigationBar: Consumer<HomeScreenProvider>(
        builder: (context, homeProviderValue, child) => BottomNavigationBar(
          currentIndex: homeProviderValue.selectedIndex,
          onTap: (value) {
            homeProviderValue.changeBottomNavigationPages(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.homeOutline,
                size: 30,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.shoppingCartOutline,
                size: 30,
                color: Colors.black,
              ),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
