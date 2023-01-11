import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier {
// Variablef for the index value of the bottom navigation bar.
  int selectedIndex = 0;

// Function to change the index value of the bottom navigation bar

  changeBottomNavigationPages(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
