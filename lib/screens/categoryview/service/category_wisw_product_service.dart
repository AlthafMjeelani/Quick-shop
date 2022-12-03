import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/categoryview/model/category_product_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class CategoryWiseProductService {
  static Future<List<CategoryProductModel>?> categoryWiseProductService(
      String categoryId) async {
    final dio = Dio();
    try {
      log('called category product get api fetch fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.catedoryProducts + categoryId,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        final List<CategoryProductModel> categoryProducts =
            (response.data as List)
                .map((e) => CategoryProductModel.fromJson(e))
                .toList();
                return categoryProducts;
      }

      /*  Catch error   */
      else {
        log('kuuy');
        return [];
      }
    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return [];
  }
}
