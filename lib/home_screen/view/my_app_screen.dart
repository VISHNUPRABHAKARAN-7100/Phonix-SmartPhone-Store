import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:phonix_smartphone_store/home_screen/view/cart.dart';
import 'package:phonix_smartphone_store/home_screen/view/home_screen_for_loading.dart';
import 'package:phonix_smartphone_store/home_screen/view/profile.dart';
import 'package:phonix_smartphone_store/home_screen/view/wishlist.dart';
import 'package:provider/provider.dart';

/// This screen is for the base of Home Screen
/// and the screen will change when the user
/// clicks to the bottomnavigation bar items.

class MyAppScreen extends StatelessWidget {
  const MyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> pagesOfBottomNavigation = const [
      HomeScreenForLoading(),
      WishList(),
      Cart(),
      Profile(),
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
      ),
      body: pagesOfBottomNavigation[Provider.of<HomeScreenProvider>(context)
          .selectedIndexOfBottomNvigationBar],
      bottomNavigationBar: Consumer<HomeScreenProvider>(
        builder: (context, homeProviderValue, child) => BottomNavigationBar(
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: homeProviderValue.selectedIndexOfBottomNvigationBar,
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
              label: '________',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.black,
              ),
              label: '________',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.shoppingCartOutline,
                size: 30,
                color: Colors.black,
              ),
              label: '________',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
              label: '________',
            ),
          ],
        ),
      ),
    );
  }
}
