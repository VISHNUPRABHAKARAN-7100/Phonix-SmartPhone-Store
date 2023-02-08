import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:phonix_smartphone_store/utils/url.dart';
import 'package:phonix_smartphone_store/wishlist_screen/model/show_wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistService {
  final dio = Dio();
  // Function to add products to the wishlist.

  void addToWishlist(String productId) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    log(Urls.baseUrl +
        Urls.wishlist +
        Urls.addtowishlist +'/'+
        userId.toString() +'/'+
        productId);

    Response response = await dio
        .get(Urls.baseUrl +
        Urls.wishlist +
        Urls.addtowishlist +'/'+
        userId.toString() +'/'+
        productId);
  }

  Future<ShowWishListModel?> getWishList(context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');
    // log(userId.toString());
    // log(Urls.baseUrl + Urls.wishlist + '/' + userId.toString());

    try {
      Response response =
          await dio.get('${Urls.baseUrl}${Urls.wishlist}/$userId');
      // log(response.data.toString());
      if (response.statusCode == 200) {
        ShowWishListModel showWishListModel =
            ShowWishListModel.fromJson(response.data);
        return showWishListModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
