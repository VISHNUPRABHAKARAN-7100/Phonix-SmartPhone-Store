import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:phonix_smartphone_store/exception/dio_exceptions.dart';
import 'package:phonix_smartphone_store/home_screen/model/banner_model.dart';
import '../../utils/url.dart';

class BannerServices {
  Future<BannerModel?> getBannerService() async {
    try {
      Response response = await Dio().get(Urls.baseUrl + Urls.banner);
      if (response.statusCode == 200) {
        print(response.data);
        BannerModel bannerModel = BannerModel.fromJson(response.data);
        log(bannerModel.image.toString());
        return bannerModel;
      }
      return null;
    } catch (e) {
      DioExceptions();
    }
  }
}
