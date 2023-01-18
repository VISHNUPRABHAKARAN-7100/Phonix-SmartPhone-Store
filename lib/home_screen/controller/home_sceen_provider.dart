import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
// Variablef for the index value of the bottom navigation bar.
  int selectedIndex = 0;

  // Shimmer variable loader.
  bool isShimmerOfBanner = true;

// Function to change the index value of the bottom navigation bar
  changeBottomNavigationPages(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  // Function for calling the API of banner showing in the home screen.
  void callBanner()async{

  }
}
