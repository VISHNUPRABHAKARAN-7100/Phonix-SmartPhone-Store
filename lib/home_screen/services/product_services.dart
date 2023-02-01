import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonix_smartphone_store/exception/dio_exceptions.dart';
import '../../utils/url.dart';
import '../model/list_product_model.dart';

class ProductServices {
  // Function for calling the API of products.
  Future<ProductModel?> fetchDataOfProduct(BuildContext context) async {
    try {
      //  Provider.of<HomeScreenProvider>(context).changeShimmerValue(true);
      Response response = await Dio().get(Urls.baseUrl + Urls.products);
      if (response.statusCode == 200) {
        //  Provider.of<HomeScreenProvider>(context).changeShimmerValue(false);
        ProductModel productModel = ProductModel.fromJson(response.data);
        return productModel;
      } else {
        return null;
      }
    } catch (e) {
      // Provider.of<HomeScreenProvider>(context).changeShimmerValue(true);
      DioExceptions().dioError(e, context);
    }
    return null;
  }

  
}
