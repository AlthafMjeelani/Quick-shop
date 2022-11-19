import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/cart/model/cart_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class CartService {
  static Future<bool?> cartPostService(CartModel model) async {
    final dio = Dio();
    try {
      log('called addto Cart fuction');
      String userId = '6364aa8637ef0d667adcb084';
      String url =
          'http://192.168.0.173:6000/api/v1/products/cart/6364aa8637ef0d667adcb084';

      /*  call api key   */

      final Response response = await dio.post(
        url,
        data: model.toJson(),
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return response.data['status'];
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
