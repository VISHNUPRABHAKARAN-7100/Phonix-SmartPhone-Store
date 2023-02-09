// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:phonix_smartphone_store/wishlist_screen/model/show_wishlist_model.dart';
// import 'package:phonix_smartphone_store/wishlist_screen/services/wish_list_services.dart';

// class WishListProvider with ChangeNotifier {
//   ShowWishListModel? wishListModel;
//   List<ShowWishListModel> wishList = [];

// // Function to get the wish list.
//   getDataOfWishList(BuildContext context) async {
//     wishListModel = await WishlistService().getWishList(context);

//     for (var item in wishListModel!.wishlist.items) {
//     wishList.add(wishListModel.wishlist.items);
// }

//     wishList.addAll();
//     notifyListeners();
//     log(wishListModel!.wishlist.items[0].productId.productname);
//   }
// }

import 'package:flutter/material.dart';
import 'package:phonix_smartphone_store/wishlist_screen/model/show_wishlist_model.dart';
import 'package:phonix_smartphone_store/wishlist_screen/services/wish_list_services.dart';

class WishListProvider with ChangeNotifier {
  ShowWishListModel? wishListModel;
  List<ShowWishListModel> wishList = [];

// Function to get the wish list.
  getDataOfWishList(BuildContext context) async {
    wishListModel = await WishlistService().getWishList(context);
    wishList.clear();
    wishList.add(wishListModel!);
    notifyListeners();
  }
}
