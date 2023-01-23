import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
// Variablef for the index value of the bottom navigation bar.
  int selectedIndexOfBottomNvigationBar = 0;

  // Shimmer variable loader.
  bool isShimmerOfBanner = true;

// Function to change the index value of the bottom navigation bar
  changeBottomNavigationPages(int value) {
    selectedIndexOfBottomNvigationBar = value;
    notifyListeners();
  }

  // Function for calling the API of banner showing in the home screen.
  void callBanner()async{

  }
}
