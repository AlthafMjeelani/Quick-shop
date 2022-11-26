import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class WishlistPostService {
  static Future<bool> wishlistPostService(String productId) async {
    final dio = Dio();
    try {
      log('called addto Wishlist fuction');
      // String userId = '6364aa8637ef0d667adcb084';
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        data: {
          "productId": productId,
        },
        options: Options(headers: AppConfig.getApiHeader(token: token)),
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
    return false;
  }
}
