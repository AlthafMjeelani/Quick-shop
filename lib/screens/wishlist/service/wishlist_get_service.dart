import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerse/core/api/api_baseurl.dart';
import 'package:ecommerse/core/api/api_endpoints.dart';
import 'package:ecommerse/core/appconfi.dart';
import 'package:ecommerse/screens/wishlist/model/wishlist_get_model.dart';
import 'package:ecommerse/utils/exception/dio_exception.dart';
import 'package:ecommerse/utils/securestorage/secure_storage.dart';

class WishlistGetService {
  static Future<List<WishlistGetModel>?> wishlistGetService() async {
    final dio = Dio();
    try {
      log('called add to WishList get fuction');
      final token = await UserSecureStorage.getToken();
      log('get token :$token');
      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        options: Options(headers: AppConfig.getApiHeader(token: token)),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('WishList Get response :${response.data}');
        final List<WishlistGetModel> wishlistModel = (response.data as List)
            .map((e) => WishlistGetModel.fromJson(e),)
            .toList();

            log(wishlistModel.toString());
        return wishlistModel;
      }else{
        log('response null');
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      DioExceptionhandler.errorHandler(e);
    }
    return [];
  }
}
