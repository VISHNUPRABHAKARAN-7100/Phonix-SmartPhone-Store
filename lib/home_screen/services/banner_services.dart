import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:phonix_smartphone_store/exception/dio_exceptions.dart';
import 'package:phonix_smartphone_store/home_screen/model/banner_model.dart';
import '../../utils/url.dart';

class BannerServices {
  Future<BannerModel?> getBannerService(BuildContext context) async {
    try {
      Response response = await Dio().get(Urls.baseUrl + Urls.banner);
      if (response.statusCode == 200) {
        BannerModel bannerModel = BannerModel.fromJson(response.data);
        return bannerModel;
      } else {
        return null;
      }
    } catch (e) {
      DioExceptions().dioError(e, context);
    }
    return null;
  }
}
