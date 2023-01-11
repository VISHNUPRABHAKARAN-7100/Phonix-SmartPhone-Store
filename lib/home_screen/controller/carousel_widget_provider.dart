import 'package:flutter/cupertino.dart';

class CarouselWidgetProvider with ChangeNotifier {
  // List of images to display in the carousel widget.
  List<String> urlImages = [
    'https://images.pexels.com/photos/1049298/pexels-photo-1049298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1450353/pexels-photo-1450353.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/14527986/pexels-photo-14527986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

// Index value for the dot
  int activeIndex = 0;

// Function for changing the active index

  activeIndexChanger(int index) {
    activeIndex = index;
    notifyListeners();
  }
}
