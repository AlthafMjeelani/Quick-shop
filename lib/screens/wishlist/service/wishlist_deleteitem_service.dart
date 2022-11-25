import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/wishlist/model/remove_wishlist.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class WishlistDeteteItemService {
  static Future<RemoveWishlistModel?> wishlistDeteteItemService(
      String productId) async {
    final dio = Dio();
    try {
      log('called add to WishList DeteteItem fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      final Response response = await dio.delete(
        ApiBaseUrl.baseUrl + ApiEndPoints.removewishlist + productId,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {}
      return RemoveWishlistModel.fromJson(response.data);
      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return null;
  }
}
