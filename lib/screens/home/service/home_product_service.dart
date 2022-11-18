import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/screens/home/model/products/product_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';

class HomeGetAllProductService {
   Future<Products?> homeProductService() async {
    final dio = Dio();
    try {
      log('called login api fetch fuction');

      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.getAllProducts,
        queryParameters: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return Products.fromJson(response.data);
      }

      /*  Catch error   */
      else {
        log('kuuy');
        return null;
      }
    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
