import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonix_smartphone_store/home_screen/model/banner_model.dart';
import 'package:phonix_smartphone_store/home_screen/model/list_product_model.dart';
import 'package:phonix_smartphone_store/home_screen/services/banner_services.dart';
import 'package:phonix_smartphone_store/home_screen/services/product_services.dart';
import '../../utils/url.dart';

class HomeScreenProvider with ChangeNotifier {
// Variablef for the index value of the bottom navigation bar.
  int selectedIndexOfBottomNvigationBar = 0;
  ProductModel? productModels;
  BannerModel? bannerModels;

  // Shimmer variable loader.
  bool isShimmerOfHomeScreen = false;
  void changeShimmerValue(bool value) {
    isShimmerOfHomeScreen = value;
    notifyListeners();
  }

// Function to change the index value of the bottom navigation bar
  changeBottomNavigationPages(int value) {
    selectedIndexOfBottomNvigationBar = value;
    notifyListeners();
  }

// Function to get Data from API of products
  void getDataOfProducts() async {
    productModels = await ProductServices().fetchDataOfProduct();
    notifyListeners();
    
  }

  // Function to get data from API of Banner

  void getBanner() async {
    bannerModels = await BannerServices().getBannerService();
    notifyListeners();
    // print(bannerModels?.couponName.toString());
  }
}
