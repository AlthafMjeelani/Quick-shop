import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/cart/model/cart_get_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class CartGetService {
  static Future<GetCartProductsModel?> cartGetService() async {
    final dio = Dio();
    try {
      log('called add to Cart get fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      // String userId = '6364aa8637ef0d667adcb084';
     // String userId = '637cc894fd2848beb05f1c43';

      /*  call api key   */

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.postProductToCart,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('response :${response.data}');
        return GetCartProductsModel.fromJson(response.data);
      }

      /*  Catch error   */

    } catch (e) {
      log(e.toString());
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
