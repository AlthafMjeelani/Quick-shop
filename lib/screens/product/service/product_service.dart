import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/product/model/product_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class GetAllProductService {
  static Future<List<ProductModel>?> getAllProductService() async {
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
      log('api get all product  called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final List<ProductModel> products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
            return products;
      }

      /*  Catch error   */
   
    } catch (e) {
      log(e.toString());
      log('get All product Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return [];
  }
}
