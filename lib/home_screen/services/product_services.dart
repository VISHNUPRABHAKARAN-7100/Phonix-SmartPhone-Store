// import 'dart:async';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:phonix_smartphone_store/exception/dio_exceptions.dart';
// import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
// import 'package:phonix_smartphone_store/home_screen/model/list_product_model.dart';
// import 'package:phonix_smartphone_store/utils/url.dart';
// import 'package:provider/provider.dart';

// class HomeScreenService {
//   // This function is to get the product information
//   // and show the product information in the home screen.
//   Future getListProducts(context) async {
//     try {
//       var response = await Dio().get(Urls.baseUrl + Urls.products);
//       if (response.statusCode == 200) {
//         // Product data = Product.fromJson(response.data);
//         // print(data.products![0].mrp);
//         // return data;

//         Provider.of<HomeScreenProvider>(context, listen: false).product =
//             Product.fromJson(response.data);
//         print(Provider.of<HomeScreenProvider>(context, listen: false));
//       }
//     } catch (e) {
//       log(e.toString());
//       DioExceptions();

//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonix_smartphone_store/exception/dio_exceptions.dart';
import 'package:phonix_smartphone_store/home_screen/controller/home_sceen_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/url.dart';
import '../model/list_product_model.dart';

class ProductServices {
  // Function for calling the API of products.
  Future<ProductModel?> fetchDataOfProduct() async {
    try {
      // Provider.of<HomeScreenProvider>(context).changeShimmerValue(true);
      Response response = await Dio().get(Urls.baseUrl + Urls.products);
      if (response.statusCode == 200) {
        // Provider.of<HomeScreenProvider>(context).changeShimmerValue(false);
        ProductModel productModel = ProductModel.fromJson(response.data);
        return productModel;
      } else {
        return null;
      }
    } catch (e) {
      // Provider.of<HomeScreenProvider>(context).changeShimmerValue(true);
      DioExceptions();
    }
    return null;
  }
}
