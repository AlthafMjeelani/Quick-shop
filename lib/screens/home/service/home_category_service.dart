import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/home/model/home_category_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class HomeCategoryService {
  static Future<List<HomeCategoryModel?>> homeCategoryService() async {
    List<HomeCategoryModel> categoryList = [];
    final dio = Dio();
    try {
      log('called login api fetch fuction');

      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.getcategory,
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List data = response.data;
        categoryList = data.map((e) {
          return HomeCategoryModel.fromJson(e);
        }).toList();
        log(data.toString());
        return categoryList;
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return [];
  }
}
