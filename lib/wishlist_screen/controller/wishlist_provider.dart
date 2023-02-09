import 'dart:developer';
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

  // Function to remove a project from the wish list
  removeFromWishList(dynamic productId) async {
    await WishlistService().deleteProductFromWishlist(productId);
    // for (var i = 0; i < wishList[0].wishlist.items.length; i++) {
    wishList.removeWhere(
        (wishlist) => wishlist.wishlist.items[0].productId.id == productId);
    notifyListeners();
    // }
  }

  // bool checkingWishlist(dynamic productId) {
  //   bool isInWishlist = false;
  //   for (var i = 0; i < wishList[0].wishlist.items.length;) {
  //     if (wishList[0].wishlist.items[i].productId.id == productId) {
  //       isInWishlist = true;
  //       break;
  //     }
  //   }
  //   return isInWishlist;
  // }

  addProductToWishlist(String productId) async {
    await WishlistService().addToWishlist(productId);
    notifyListeners();
  }

  getBool(products) {
    check(products);
    notifyListeners();
  }

  bool isInWishlist = false;
  Future check(productId) async {
    for (var i = 0; i < wishList[0].wishlist.items.length; i++) {
      if (wishList[0].wishlist.items[0].productId.id.contains(productId)) {
        isInWishlist = true;
        notifyListeners();
      } else {
        isInWishlist = false;
        notifyListeners();
      }
      notifyListeners();
    }

    notifyListeners();
  }
}
