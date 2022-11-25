import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class GetAllProductService {
  static Future<Products?> getAllProductService() async {
    final dio = Dio();
    try {
      log('called product get api fetch fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.getAllProducts,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
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
