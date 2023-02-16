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
  removeFromWishList(String productId, context) async {
    await WishlistService().deleteProductFromWishlist(productId);
    if (wishList.isNotEmpty) {
      wishList.removeWhere(
          (wishlist) => wishlist.wishlist.items[0].productId.id == productId);
      await getDataOfWishList(context);
    }
    notifyListeners();
  }

  addProductToWishlist(String productId) async {
    await WishlistService().addToWishlist(productId);
    notifyListeners();
  }

  bool checkProductIsInTheWishlist(productId) {
    bool isInWishlist = false;
    for (var i = 0; i < wishList[0].wishlist.items.length; i++) {
      if (wishList[0].wishlist.items[i].productId.id.contains(productId)) {
        isInWishlist = true;
        // notifyListeners();
        break;
      }
      // notifyListeners();
    }
    return isInWishlist;

    // notifyListeners();
  }
}
