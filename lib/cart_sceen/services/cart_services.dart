import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/url.dart';

class CartServices {
  final dio = Dio();

  // Function for getting the datas in the cart
  Future<Response?> getCartDetails() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString('userId');

    try {
      Response response = await dio.get('${Urls.baseUrl}${Urls.cart}/$userId');
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
